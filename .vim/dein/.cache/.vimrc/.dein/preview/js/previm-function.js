function isShowHeader() {
return 1;
}

function getFileName() {
return "/Users/yuta_yamamoto/Desktop/jpstore-document/jpstore-inheriting.md";
}

function getFileType() {
return "markdown";
}

function getLastModified() {
return "2018/03/01 (木) 17:25:49";
}

function getContent() {
return "# jpstore 引き継ぎ\n\n## 経緯\n元々jpstoreを外注していたBridgeという会社との契約を辞め、社内で開発を引き取る事になった\n- ECH:jpstoreの運用を行なってくれている会社\n- Bridge:元jpstoreの開発を行なってくれていた会社\n\n## GitHubリポジトリ\n|リポジトリ名|URL|備考|\n|---|---|---|\n|jpstore|https://github.com/dwangojp/dwjp-store--jpstore.dwango.jp|jpstoreのアプリケーションとtravis+codedeployのデプロイスクリプトが管理されている|\n|jpstore-cloudformation|https://github.com/dwangojp/paas-store--jpstore.dwango.jp--cloudformation|CloudFormationテンプレート、S3同期の構成の都合上2つのテンプレートに分かれている|\n|jpstore-packer-template|https://github.com/dwangojp/paas-store--jpstore.dwango.jp--packer|CloudFormationで利用するamiの作成を行うためのテンプレート、os-base-provisonの更新時などに更新を行う必要がある| \n\n## 基本構成\n### 構成図\n![](//localhost/Users/yuta_yamamoto/Desktop/jpstore-document/./img/jpstore-overview.png)\n\n### jpstore基本構成要素\nEC2、ELB、AutoScaling、RDSの構成\n  * 一般ユーザのアクセスとは別に管理コンソールへのアクセス経路がある\n  * ニコニコ市場からも商品画像が参照されている\n\n\n### メールの利用に関して\njpstoreでは商品の発送やユーザからの問い合わせに対しメールサーバが必要\n- [メール経路の詳細](./jpstore-mail.info.md)\n\n### 海外からのアクセス\n- 2018年1月末より海外からDoS攻撃を受けたため、海外アクセスのみRoute53のGeoRoutingでS3へ逃している\n- 海外からのアクセスにはmaintenanceページが表示されている\n## 環境構築方法\n- CloudFormation\n\n## デプロイ\n- hogehoge\n## bridgeが構築したjpostoreの構成\n- bridgeから引き継いだ資料がDropBoxへまとまっている-[Dropbox](https://www.dropbox.com/sh/zh0fne24j9aosmf/AAAxhd5ZM29BWygjvxToZIAna?dl=0)\n\n## apendix\n- [2017/12 jpstore負荷試験レポート](https://taiga.dwango.io/project/admin-paas/wiki/201712-jpstore-stress-test)\n- [blog-jpstore.dwango.jp廃止に伴う作業](https://taiga.dwango.io/project/admin-paas/wiki/blog-jpstore-closed)\n\n\n";
}
