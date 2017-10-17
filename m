Received: by 10.223.197.9 with SMTP id q9csp4841801wrf;
        Tue, 17 Oct 2017 10:35:37 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAstKqSZczQEdyNCKeTH9VfZRlQ7tfJDMC3dDPovw+sPo39+N3gU4AjjbY1vKet1/uwwiLi
X-Received: by 10.200.38.50 with SMTP id u47mr19767798qtu.112.1508261737527;
        Tue, 17 Oct 2017 10:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508261737; cv=none;
        d=google.com; s=arc-20160816;
        b=otj8G7mXpPD2drHTNdxh1v514DIahsij4zU+wpP5FiYU8HPfzSyw0tsQD4fe6j8Hds
         BeeUJDQCzKgPF3ymRZJ3vjorv5hb5Nis+gtd17UhY+n75nTSb7aN7+OCREUiNLiiGuPB
         uChTSXu4amEVyWZ97kvuaHYFiePjQYU3h8Ycq5pBZAAlHdTnOQuEDRJxIka9Rks6eM/q
         Msrvo4fMNeeGqNox0C6WHm33RtbOV3O+hjRmiF8YTMVBnRzIQSWYRb2lVL2v9Nbi9mhC
         d9qBOFtxnxdJmY+dalAKO/XlS386HqO6cRyFNaQCvP/A7MoPbrK/Tw3gP1qfg9zZ+zNs
         Rafw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=6XW41gN0XpgTCchIK67MAWmeft7iHMpvUVihoku2V7w=;
        b=qwaFVU2snLRTq91o+oj+rnaQXNEhke2959g7cdjMEft36w5cC0KHJ+Qugemh8TicFa
         OFoDfy8pfr5TTbiGxYhjYM0YprJgVXQ/AzosuC6BTDsRjF6F3XhB4YLx5lHcw3s1VQDU
         /fSZG/A0QJJwi4LUJ0CNEQjTRDoCI5SUoEEJpAmO/9z03MlfulJirGb7bRfKjyEoYh4u
         LsPsSIVSEwip4/wfITv5AGo+mT4nBYY+zJivoCTk98IWUd2tYNRn7xFA9awknYzeFUNF
         FJejINgqr5Blx33GXtxgmCaEm+mn1+ijPQt/gm6U3wR74SMxpf2pKmCupdqbfbnotaod
         8+eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=J9tmIklt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r189si691393qkd.255.2017.10.17.10.35.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 10:35:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=J9tmIklt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40860 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4VmB-00060C-8p
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 13:35:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1e4VkS-0004w3-6o
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 13:33:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1e4VkN-0006Hb-UH
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 13:33:48 -0400
Received: from mail-bn3nam01on0080.outbound.protection.outlook.com
	([104.47.33.80]:29984
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1e4VkN-0006Gw-Of; Tue, 17 Oct 2017 13:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=6XW41gN0XpgTCchIK67MAWmeft7iHMpvUVihoku2V7w=;
	b=J9tmIkltF5eCrVHPUPMeEmQ+pWUmr9g6QO2TjvkloDiTz9kIb+chQHIL2RDCrbu2h+SVqG6NMIuqy9jnHYsv2RDoSD7/s2kJFIWNyXWmGAqa6POpfHpPzr3x9CEir8gd2wz+cMAYzFYZjezTaRZFzPBDusO6mMvNWFHT9cH/ykQ=
Received: from MWHPR0201CA0012.namprd02.prod.outlook.com
	(2603:10b6:301:74::25) by DM2PR02MB1339.namprd02.prod.outlook.com
	(2a01:111:e400:50c8::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.77.7;
	Tue, 17 Oct 2017 17:33:40 +0000
Received: from BL2NAM02FT020.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by MWHPR0201CA0012.outlook.office365.com
	(2603:10b6:301:74::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.77.21 via
	Frontend Transport; Tue, 17 Oct 2017 17:33:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT020.mail.protection.outlook.com (10.152.77.162) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.77.10
	via Frontend Transport; Tue, 17 Oct 2017 17:33:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkJ-0002QY-2y; Tue, 17 Oct 2017 10:33:39 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkI-0000mb-Vy; Tue, 17 Oct 2017 10:33:39 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e4VkC-0000lV-MT; Tue, 17 Oct 2017 10:33:32 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Tue, 17 Oct 2017 10:29:44 -0700
Message-ID: <ab841d887f087b99e7702629c239e38857f966a2.1508261326.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1508261326.git.alistair.francis@xilinx.com>
References: <cover.1508261326.git.alistair.francis@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23400.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(2980300002)(438002)(199003)(189002)(110136005)(189998001)(575784001)(16586007)(54906003)(106466001)(33646002)(6666003)(2950100002)(5660300001)(50466002)(118296001)(106002)(478600001)(50226002)(2201001)(39060400002)(9786002)(48376002)(5003940100001)(2906002)(81166006)(36756003)(36386004)(63266004)(8936002)(8676002)(47776003)(4326008)(230783001)(81156014)(76176999)(50986999)(316002)(356003)(77096006)(305945005)(2004002)(107986001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR02MB1339; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT020;
	1:4LkJPOrmXe+eR7HzcXQh43br8DlnM0flsI0j4ZnPFNanZLhDwUH4225itOd2yGbOBB2wZ9PMMFIu+VcWwXEP24o5RPVat/cJ8qgOl3bYjc27BgvxVk+VKoX9BDdpGp1g
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a3d77b5-4b3c-4ad8-a870-08d5158534c2
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(8251501002)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:DM2PR02MB1339; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1339;
	3:+irXucXD20u+Ud3ucnOAJ0K/kY2S/Togo9df6ZEjYaFSRVQtAthZD21CJBwvhI20OlRMJWmQaQCex8vPdoHllFilOvpCVTjpxLhg8ecxsfv3byBn4uB5eMtoWjZAscSwFxmUheQRtGApTyNXtPU2Bx+zIaQ9BYIcKpX5W4jFknuUZppOOBVeuTdPwfVBY6kSmJd6Ln7WrxA1tSvzAHn3QDVWObXS+/UGxv57CG61sN3vK00p7e3BARAN+ftFhC7UPxzVGLOZlYpCqqOX+F3C2uT1lGTwVpzRN8TvM1mkMHDxh7JdKh5vP2Pcd6V0pJ6E9Ee6YYnXj6snY7Z9FpDBIt/yq5X2GO1ulxWpfJ27ep8=;
	25:kRYkVNhjZwyneYPFI15np5nvjAzc+Rntg9Os9x/x+fLHmPO0as2edanSPcQV+B2/PrVIKbwSslkQX6YzIxPFWf31cXOLW+ZJcb6xiZaV4Wk86FpkPNn5pwl7NizTRZz2ktBt9xCt+W/wHTbgqICRJJ/GbGbmemy6VAvtb/KPmeOY1juNbtuemha0CSIqhOidwa2Sgir0ou1ESOTSuylDHMqx1TIG2zppDK/TgPzjt26zb0oM8fsMtBIob7D1/65VXIhTQDx8ITj3E/IhztCRN7lAn8Rc5IT0U52y8Y4VQUFytmTzpkQv150pb+YWVrpsDtmAArOHJsNs0qyHhwTQeg==
X-MS-TrafficTypeDiagnostic: DM2PR02MB1339:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1339;
	31:nNhBzO2BGn4XoL7lFR1F6NENi4IUOghkzUiU/puQZvWN3/LwUMIJBFbRDXop7vkUqZrTMQZX1LSAtWXKT5B11dqlGsUCWNUeWJBi++xEnVV+/q9dli6XzabJe1HlRtidKkmdDD4DDvmH9a+js1aOFAWsRpBOScM5tvYwASi1sQ2by9l1vKbNoa02l1/7AJ1HqSgww7hVAsh3hPquRgCWKVR2I3A+eWghqa6cnnYA/N8=;
	20:ma32g5WW4U7YlBou90SpgpQaSVDkohGxxej2w5r/4N+sF6A8wO7LrKpwgWpGvkTK8h8vSmVI14UhnmDvlXPPDbjGxUX8zrd6k3XhxCTqhid7QnbyLo1jiOllRfRtV74l+2LdIX+HzaqKcHMWvbMo0cQNYQBl/Mo7zRB/NIyJSlvkFzggESo4m8OunBt0REi6EORhNmPrBWKPbBaKeL8WDGMfdZcJmfizg0ESlgldU4+0J7R+eF8pYwDZRklMZHRa7uykVcIzGy6XmEygcvKK++tgZrm8NS2UNun8WCmtpSha+DZ0vnTwcO7tTaEsvQK163g1oAPIa8W1jy0Q0YgcDrK04aFsQZTQClbcfWVMCkEfL5JQG6Azd98KyTdL/Te1MiWq4sU9gy19BbNKSL6fVk2zRcJBpg2H/d6Pri9SOeAPnteve4zeUJNLgeUn+6ybT8JwiZfP/GO5uzno5/b4dkzACturwbgJ1d9D6ovE/kodJeEx+dXwLW7/z7OhVfw/
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(21532816269658);
X-Microsoft-Antispam-PRVS: <DM2PR02MB13394F9D15F43EAB9FC59D25DC4C0@DM2PR02MB1339.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(93006095)(93004095)(10201501046)(3002001)(6055026)(6041248)(20161123560025)(20161123555025)(20161123562025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM2PR02MB1339; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM2PR02MB1339; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1339;
	4:6klRrC3vwtAMqBc2Rmg6Q5HCSwfRu5tT+7tJ/UFsCEfo13PoTXyRdKobdUX4UwfwO/FejuFDGPQjN29wwkpGkZyWg/Olpp0p+2EIW2sn5C74OIsvAJLcP2g+2FX/2Ckol9weicGytEbyPj0NcBade8FZJoW2CbImFWvpkMmb1m+mnGHvjYj0oGyreltASJPxGrJtRmn8z5NOuORNT2i352yHSWRZIEJqOJ9rupnrhzSGJ6I2DSKvXYAb5ZMJ1OdFRWQen3u7f64JGq2n++3iFaKbDC0wNXZYuY1zOFGQAnZojmGKM9LEquOQNb3j56neha7CcOQNjs1MuNz8+wMB+A==
X-Forefront-PRVS: 04631F8F77
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR02MB1339;
	23:zkcPYDLIDxdyikQDdAm7gTpf3O/mcWNOBJKi1bd2r?=
	=?us-ascii?Q?x3k8AIZ4mA0/ypCOS6yYRITKqVTrV2lTZzIzOwXRwt0K3S88DiIjWW9omQB6?=
	=?us-ascii?Q?DTJNugEawud5pyBRqLEnGDMsucnABIpymIodKVYyWh3BPzzLSRHTMf5nV+x9?=
	=?us-ascii?Q?kROu+ot23PGUArvAcEDnomU4TiJ59gxIUGDfOJyAb6bnjakxia+kTU7NgdEw?=
	=?us-ascii?Q?ybA9+er3Oj4E5nga4ctn7vEozZ9iYcGwlzCAKRznVMMwOIDx7QQcJo7O5fRH?=
	=?us-ascii?Q?F0v2T+qU1WuQ8PF7eLWR78unef4ebWw+zhKscC6Ui5KT6YbigNpOqI1hBdF7?=
	=?us-ascii?Q?cNnTdxSG/8uDkIcqY5KF9PMi+CXeJysv++AB53p7BIWRAJgyebcml7BXnqtQ?=
	=?us-ascii?Q?wpDlkdJzQ+/YZJsuCEqUqzkJotdPTRe0C7O6YNDHgZRgVfOQcVDuuOtVtCDh?=
	=?us-ascii?Q?pMjpmXThutXbeHq6dD/NbvYbPrr4DHqJE5BbzKm6YxQ9Y5ZjTMYHOQh9MU1Y?=
	=?us-ascii?Q?CdVidGQM74wftFNFeW05A7O104vdUswbuInPpQeJwpCkSrI3zH7YqPqAFQp3?=
	=?us-ascii?Q?2LRWZPD6x1UyzijqfCbwqP8P6S6di50j0IoV3bIrxAPdQqt7mx30sn06ynt5?=
	=?us-ascii?Q?m1BwbfIHWVuGkOx6E2JBURbeRbfnjguNq7l28i90hoiSPVWHnHCgFjldjmU0?=
	=?us-ascii?Q?xeHkaXdbxYBl1KCb7aCn48vqPODLlgSxXrlBJWFb1/DHVQCL7HW75Yg14MzV?=
	=?us-ascii?Q?1oIG7UbZt7NikrTmJSGcahoaaJ/B0hOd2h24wq32CGBAkTXHPG7hzCLF0R9k?=
	=?us-ascii?Q?FDeV5+iVRNob/HaUI8HAAv3gdxCn+HsN8+0I5YVluVxDWDCyjA11MrHVk9oW?=
	=?us-ascii?Q?h57u8xMzLW992dMlFXCYgu3ieLTJJboyZ2wxN/qwhLtEJxUTUxFwIWYQSJoM?=
	=?us-ascii?Q?qFemFhm83WullHQOzq0A6flCI8P7r8JELwzZTBxnJ8iDEc2J+GBC/Ycop70L?=
	=?us-ascii?Q?jXO9Cu8I4P2zUqNRJb2QfwKvzArsQA70kDxihCV/KugzyYgeFYoopo7Gvwe4?=
	=?us-ascii?Q?EFB8xi8SoImKYkCCQHdt6iE5y+cSYZfTWfuNEljpFjdd3kNqSOqiJ2Cg8QTd?=
	=?us-ascii?Q?ZS3pWGp3rhDP8gaio2YRV3DoiYxdjaC?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1339;
	6:QmumniH/B91O5Tn/yMToyNgYI4lNLyjNp3v7r5lo3/aYLMN1YD/aUpAJf+gVVFQB2er61RtuMzN3EzTDvmuvIcwjq4ysEnVBrOMj155Ej1JSLKoEQ9lX6AE9Qpi+RO1HlfWNxYFUMMAnsFpu1h8z6pLRLD5ryAtxjlv/m+3/tfofV78WLJsCq/hvnsS44zX4DPJCVvv0u+w6tQ4zUZ1MdWBthBGSnWUNMwIi1TLRcofRL43wF2vKyBB3tewEhmcoXK39FSy9+dsZfAX9a8T/VZ/8DdCjKDUAbVyKqHmWRUyRoLxFuGTIcEyuEBjlbUHtM2oheIOrG1Eg563ObHUEKA==;
	5:9LeKrWgh9y6v6BpbXpiBc6nksSXXKadJ2d02Vv/3PqzI0VOx/fO8KLsJ72PjK/R+LSPp+mleDMu3NfHJce+vrASj0p8U1wjtEorx2iVFFmneOqQc6YIKfUthhi8GhmicgidJZi/oa3+hzCVo8UL47+TY79BP3fz+37DpJtMYClw=;
	24:d9cacv/Ol5kQOixNkbHvFyT9yMxVMImNoKuLr//gKFhHtlWk+xWRx5M4EotQ19opqKHdAOB3VltM+K15FCg507Ocj6v7rsGDrp7smRp2F7U=;
	7:yc4qUDGTj1Ye7Flv85vnHIChZ0WNeV+yaZ4jORlI6wUi+M0kFehnNgrsjQ63o6oWFeJr7wqAOtYIfG2UWwqK2vqgFV09LfzuoUt2iR2V2hRMMbOm9P6OP0xD5LE347QFftyTRtFD/8M4myzBNSvMy6EJ9y0d7JixbRjz83AfVP/L0QQb34I2daaaT6//igO4jU71OOo8ubgBgEpgyNWV/AedkDNUUnQKXauQ6oMP5Tw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2017 17:33:40.0299 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR02MB1339
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.33.80
Subject: [Qemu-devel] [PATCH v4 1/8] xlnx-zynqmp-pmu: Initial commit of the
 ZynqMP PMU
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y7sX0xQ94FB0

The Xilinx ZynqMP SoC has two main processing systems in it. The ARM
processing system (which is already modeled in QEMU) and the MicroBlaze
Power Management Unit (PMU). This is the inital work for adding support
for the PMU.

The PMU susbsystem runs along side the ARM system on hardware, but due
to architecture limitations in QEMU the two instances are seperate for
the time being.

Let's follow the same setup we do with the ARM system, where there is an
SoC device and a ZCU102 board. Although the PMU is less board specific
we are still going to follow the same split as maybe in future we can
connect the PMU device to the ARM ZCU102 board. As the machine will be
fairly small let's keep them both together in one file.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

V4:
 - Rename to remove ZCU102 name

 hw/microblaze/Makefile.objs     |  1 +
 hw/microblaze/xlnx-zynqmp-pmu.c | 83 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 hw/microblaze/xlnx-zynqmp-pmu.c

diff --git a/hw/microblaze/Makefile.objs b/hw/microblaze/Makefile.objs
index b2517d87fe..ae9fd40de7 100644
--- a/hw/microblaze/Makefile.objs
+++ b/hw/microblaze/Makefile.objs
@@ -1,3 +1,4 @@
 obj-y += petalogix_s3adsp1800_mmu.o
 obj-y += petalogix_ml605_mmu.o
+obj-y += xlnx-zynqmp-pmu.o
 obj-y += boot.o
diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
new file mode 100644
index 0000000000..ac0f78928a
--- /dev/null
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -0,0 +1,83 @@
+/*
+ * Xilinx Zynq MPSoC PMU (Power Management Unit) emulation
+ *
+ * Copyright (C) 2017 Xilinx Inc
+ * Written by Alistair Francis <alistair.francis@xilinx.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu-common.h"
+#include "hw/boards.h"
+#include "cpu.h"
+
+/* Define the PMU device */
+
+#define TYPE_XLNX_ZYNQMP_PMU_SOC "xlnx,zynqmp-pmu-soc"
+#define XLNX_ZYNQMP_PMU_SOC(obj) OBJECT_CHECK(XlnxZynqMPPMUSoCState, (obj), \
+                                              TYPE_XLNX_ZYNQMP_PMU_SOC)
+
+typedef struct XlnxZynqMPPMUSoCState {
+    /*< private >*/
+    DeviceState parent_obj;
+
+    /*< public >*/
+}  XlnxZynqMPPMUSoCState;
+
+static void xlnx_zynqmp_pmu_soc_init(Object *obj)
+{
+
+}
+
+static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
+{
+
+}
+
+static void xlnx_zynqmp_pmu_soc_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = xlnx_zynqmp_pmu_soc_realize;
+}
+
+static const TypeInfo xlnx_zynqmp_pmu_soc_type_info = {
+    .name = TYPE_XLNX_ZYNQMP_PMU_SOC,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(XlnxZynqMPPMUSoCState),
+    .instance_init = xlnx_zynqmp_pmu_soc_init,
+    .class_init = xlnx_zynqmp_pmu_soc_class_init,
+};
+
+static void xlnx_zynqmp_pmu_soc_register_types(void)
+{
+    type_register_static(&xlnx_zynqmp_pmu_soc_type_info);
+}
+
+type_init(xlnx_zynqmp_pmu_soc_register_types)
+
+/* Define the PMU Machine */
+
+static void xlnx_zynqmp_pmu_init(MachineState *machine)
+{
+
+}
+
+static void xlnx_zynqmp_pmu_machine_init(MachineClass *mc)
+{
+    mc->desc = "Xilinx ZynqMP PMU machine";
+    mc->init = xlnx_zynqmp_pmu_init;
+}
+
+DEFINE_MACHINE("xlnx-zynqmp-pmu", xlnx_zynqmp_pmu_machine_init)
+
-- 
2.11.0

