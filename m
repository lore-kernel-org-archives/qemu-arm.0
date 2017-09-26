Received: by 10.223.172.38 with SMTP id v35csp3005809wrc;
        Mon, 25 Sep 2017 17:16:37 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBKQv5xmgzC+twoFaogucwI6wiCd5YoMQAIcZKdbSx6U9oqhVFBflIgnivIgOzPkvZhhWXR
X-Received: by 10.200.27.226 with SMTP id m31mr13902926qtk.198.1506384997806;
        Mon, 25 Sep 2017 17:16:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506384997; cv=none;
        d=google.com; s=arc-20160816;
        b=vUuSxE4z53NEGqu3UIl2HsBl8qlYAthRxpcycOTuVRLFdwSPF7Y2JSEhod8snzYmBa
         JQgLzHIvesfK/N5+5f9MSojqg3PLrdXq5P2E2UG1FFZab8wq6xSgbxVRx6tkzcvThvPZ
         jBn75alk3BkX16jE3M9nNpcMhA1T82x59ttNVDZX+BlHXF2jzggF+lUTcL3kbhEZhyGx
         ciRM+9CLGsVZ6ZPQw9vIdSsNl/Z9nOwTgKERBF/sK27PrKcEWcRw8x7k3Zle6h3FrzSJ
         S3p5JozYT9W7wt/n8Ar3maNsJhlajRzx/gAao8GNJo0CnTLj2waldyEa4voXdCUAy7eV
         Ft5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:dkim-signature:arc-authentication-results;
        bh=2geKn/izkLRVtN9RnSTYUj4qEWyON0ESlYf0WluNHMc=;
        b=hVkwX46QwpubI3oOfR/nPcv0vqDl2IIP1QOok8e4IMibOrJBHsq0aNfED0NFfA7q9f
         o1f0V3bvM4n6DRTLxu3a88LuejHqt2e4otv0rCzGIqUs8aisM1X5haCjaygnwdCtoXg3
         smZrtV/B2OPUyG1+T3l7xF0W8H1PghsVYZMu4EzEPe9vR0VnqdgtmkycI1D6nPc945z1
         l25CP8lH+p1LS1zY0YP3+23v7G17AFr+m8h9kaYn+3vv0AdzmkvAVgqY4d94JvAXQ58L
         DXckn2sdxdYRDfjQAZP1Eyt45+/o80FzpG/I7cbNPprJ4EUm5IOo68HHDvkEpIy1Eihc
         6cMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=ZgzfkQBB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a124si7053062qkc.87.2017.09.25.17.16.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Sep 2017 17:16:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=ZgzfkQBB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44911 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dwdYA-0005aW-Su
	for alex.bennee@linaro.org; Mon, 25 Sep 2017 20:16:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dwdV5-0003DP-3b
	for qemu-arm@nongnu.org; Mon, 25 Sep 2017 20:13:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dwdUz-0005sf-4o
	for qemu-arm@nongnu.org; Mon, 25 Sep 2017 20:13:23 -0400
Received: from mail-dm3nam03on0053.outbound.protection.outlook.com
	([104.47.41.53]:15184
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dwdUm-0005hB-Cq; Mon, 25 Sep 2017 20:13:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2geKn/izkLRVtN9RnSTYUj4qEWyON0ESlYf0WluNHMc=;
	b=ZgzfkQBBaASa60UF6q/qlyuEsSf7CJE4qQtHd2ggMk7GatQXl3F5o9yRA53QC1Z39tkajCRXDqOZnV+rBunAh8T9s7d3I1NVOyuQJ4QCfpGNkXLbcipc9AOunTZX5O2XZ81rlKIHWUJi26jzPpTa3yoej1a6zY4tswGeBfBwDAY=
Received: from BN6PR02CA0097.namprd02.prod.outlook.com (10.161.158.38) by
	CY1PR0201MB1931.namprd02.prod.outlook.com (10.163.56.29) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Tue, 26 Sep 2017 00:13:00 +0000
Received: from SN1NAM02FT030.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::206) by BN6PR02CA0097.outlook.office365.com
	(2603:10b6:405:60::38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.9 via
	Frontend Transport; Tue, 26 Sep 2017 00:13:00 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT030.mail.protection.outlook.com (10.152.72.114) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.35.14
	via Frontend Transport; Tue, 26 Sep 2017 00:12:59 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dwdUg-0007BH-UG; Mon, 25 Sep 2017 17:12:58 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dwdUg-0008WQ-Rc; Mon, 25 Sep 2017 17:12:58 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v8Q0Co1I023644; Mon, 25 Sep 2017 17:12:50 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dwdUY-0008Vf-5l; Mon, 25 Sep 2017 17:12:50 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 25 Sep 2017 17:09:10 -0700
Message-ID: <5ad72536402da2879d49b58753cc709a8ff22de9.1506384415.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1506384414.git.alistair.francis@xilinx.com>
References: <cover.1506384414.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23350.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(39860400002)(346002)(2980300002)(438002)(189002)(199003)(8676002)(53946003)(50226002)(16200700003)(54906003)(2351001)(551934003)(316002)(478600001)(50986999)(76176999)(118296001)(48376002)(50466002)(305945005)(4326008)(5003940100001)(81166006)(47776003)(5660300001)(39060400002)(575784001)(356003)(33646002)(189998001)(6916009)(2906002)(7416002)(9786002)(6666003)(36756003)(2950100002)(81156014)(77096006)(36386004)(16586007)(8936002)(106466001)(63266004)(21314002)(107986001)(579004)(569006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0201MB1931;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT030;
	1:RKeD792DdvLBMqjHP2oIqLfQr8Ktk5wRddRf/SgpWP9u6JlL1IeliMmwjjFZgPcnGPHDbKos/luXH0MTOjHueFdXxrd3OzbGP4hIx2RggH8JL5oqpgTnMt2JwST5FMKH
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39f2f2c0-09e3-4792-015a-08d50473590c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(8251501002)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:CY1PR0201MB1931; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1931;
	3:D1Dh6rNwc1njTGB8J9IA21zKR4XaFLCyfTQ9oiShedj385WY2/c3wvWqzWrqTzd1K6ceSyMx0ZyO3s20MDk9OKab5LIDlblhlDtvhhKSXkivqqipZooaFoNVjhNXJ3NIIr0vmbtBagXSlA5HwJZZoVhQniVxqBwTtd5VPJyKWGwAAF1TKt83NReCpq7yBt7/haushwgS6xfBxVpiM7q2rRJxEq5v8dgCs3JS+yKy0vgMnggPq/YLVI9aWljlniz9SK5HONON9GLIOrvGqKOyphr5j79MbimZoRiDNGHbV9blkKUu39BDogJvLozlm0FTiJsBCcYlZ02EXd6LXAOfJHIQp783rIr8OFlBcDf1C2M=;
	25:65efDwxCYy0K4Cu4BxMU1QMC0EZzkUFKQkUeh/Xd/jSlI2Ynm9uhigLIcFtzeG+LqcPOj1XGkOm0yTrpSCrqXHfXjqwSDJYlJ2SzGbt1tL5vNxkK7aJcRXlLY2aI1Z/Jhihd5dl/ppadV7Vq/Ae/Ygim5kQTgJ7yc2f/xPZzL40Uv715mRD8uGNOZ2/Vd9sVTFBhdRdfonSB0cV+9TnKBzvSC1c5QPF9BS/xmP+BpIZLhRmV2FrXWm6LZlIrBvmbh0aDATVCBzKuj1SB0XC5rwQ/DP9KNR/ahy7ullEELp7Ro2XYhUQxfpn4J3q2AIC9YB9/TqNsRvl57gRSXvoBNA==
X-MS-TrafficTypeDiagnostic: CY1PR0201MB1931:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1931;
	31:PTZZ92G+xedlI2eJsamf8U0A+Sg49ReTu9yJcFABwnK11LosJQYfREZtEGcF1dW+lUioScpFVfrmPqsNp6VdmDf0PYiqPUUvIIIX3RHj5sBGceKjsePH5qdXkdku3gOkclCatAwnDtuVOLaHqBUNcj7Rsty0faAM36Ky81cfJZame58jhHe/ICbXnCdbq4oUtemr+X2fVGo+RunHUL8X1Xytu0qyv+I1IPcdQz8mBiY=;
	20:021iCoCmWA2kDelx/cIWidJTCDkTLJiIF36xhNol2vJ8W4HCZIPOQApIvNhRAs1Ht7jxCwzcNEFHx2LcYddtLj85YveT+LRbzVn5ZsrBwduKddxXNVmDKaa5MOSHYAFtjPoBnGE6P5WjocGYVPwmLyYI1PUEyKuL+xuoKPHV/wSJm+i/pith8SVnnlApkZktTygKBNLcqk+ke4rFtSIMwvJXYTYJoA+BmCMLwWZai/pLz2Hdfw0w0sSEaApoSUg99O1ifvbWrTjcv+ektFhVsguTZGgenac888KGstL1y4h9ueYWRpRfwxJmIpFF36HQTq566dkM0//GbHVjPPpuBi9Sha8xQ54b9Vg8e5StTVl65roHMYjdtO/XHqHiEm3JvifvzJY/w/GkFAtrEgMyElyWHSExqYwpM1JMF2wB6wAXbKOESFgI8LaBtC8U5tYMh3LNHMgeuhbcMap6J2Jq5UreuuSojcqR4lr23cPClpZmu3QcgzlzKETxgdo6kdw3
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(190383065149520)(192813158149592)(104084551191319)(21532816269658);
X-Microsoft-Antispam-PRVS: <CY1PR0201MB19319478F733838BD30862F4DC7B0@CY1PR0201MB1931.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(93006095)(93004095)(3002001)(100000703101)(100105400095)(10201501046)(6055026)(6041248)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123558100)(20161123564025)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR0201MB1931; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR0201MB1931; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1931;
	4:hAEiQvAh6qnMlQgP0/fHzYcbbBUWOdTN7WZtvVBPXZzptmJ126OCfXndwc6PnvRFkf2QgkLxA3auGpc086QIbP93zP7Lo+wT4gE12Zm+4ql2EkpcGGAkROtl2BkTYIWnCt/tLFjR1vAO9LTJvilE67Q3HhN6Je35sKZpLycXBXNZTz80N3Vfc1rAUTNr/H+CK3j4zXFIfmwfDcT9glaN0LuLfR/nkkdKEi3ThaXE0XrwgRX1IcrbjBaoDED22qEMYMTo7KqVTfGi8AJ0qEeL7WHnvDtxCrNnVsP/wGrIRcLYnHA6Lgk25sQjz/5K1j3NUSQPi08XI5/XPCrVuwzGVDSZuSVvmdqwIodhKeV2yuvgV0arS3Co3mjS4KaDzpGNrxYo8DBYyGyg3fXRmUp5ArafunMndhTbqcOHquUiMKZ0ytTzf/9uHfdXFUD689b0
X-Forefront-PRVS: 0442E569BC
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0201MB1931;
	23:VE1deprnrzks32GnAoQuT10bcam9YhLkvj0y+AD?=
	=?us-ascii?Q?wqNHEGXOz5pnzadOWZTD4XsgBRAypz9yt2+24LmziKV7nBPZbvY3t06NvFvu?=
	=?us-ascii?Q?s6wlRTQ5Qc7TkRuQFNkkzMaO0Air6MhVV2mnwwFpwzCBHV3272I4GGtgdBCV?=
	=?us-ascii?Q?A4UsZW+balpACxXF02xkysuhPLoLGWXDpCbSQuKwFkfOsil6Zxv+LqnlUTZh?=
	=?us-ascii?Q?zW5TqnmIRKH/eDGLGuD4WY4qplCH5eF2fEICaUz8rcMeO1DSK4etA6lq92ce?=
	=?us-ascii?Q?5xgl4DG8e/qJrY6hsZjSlvdCi/kaHL3ttjcieRFIYQQ90jUxTHqld18hULIx?=
	=?us-ascii?Q?FwgyoG4I0FxsGdl+Kgfq3Q7RiBcxPp67uYDp7s0jP1iaFxaOi+U51HnzL8tk?=
	=?us-ascii?Q?Gto17rPRzudNplHRhs29lZZAs5uALkuZIsqLl2h9THGz5oX4MXvA5RJK17Aa?=
	=?us-ascii?Q?Q8IPDN5GertQyfGC6vcAo5hJoN2j6OxRZM9YnabpMwnjqIdCY7jl846UoQTI?=
	=?us-ascii?Q?XGVF8bGwoWIIzS2slj9hmaU+tBEWPCMonBbTzF7pp5Ku0DzaHAp+zz8vAM/G?=
	=?us-ascii?Q?/MSwrvQC/CfKrQJpHVQjQ9jBYxEFGxfBgU6l36Meci6BWbO65rOLrtqkqgXO?=
	=?us-ascii?Q?YT2kYGRzDRcrFh/ORzHZfFEBUD3BBjLjYUPcfaGhW2v+EOg9OFROpwxswLfe?=
	=?us-ascii?Q?re+mw7aL02O86SeiuU1MJu2oQyqf6GD2Ly2e+c7A1Q1a1BcyLrk2wzQxTvG4?=
	=?us-ascii?Q?GWzlQX4SfF+BNDh86Za5vwP87sYRQ9HF+IQlJRixwfKseDulRxnECIGabATc?=
	=?us-ascii?Q?CexhLhHEBAriyZbKkjpHrykah8u8c2iaIdENAOnHEchGAzOAjX733KLWk7s2?=
	=?us-ascii?Q?vfm+Y0o6lQZKI9BQLh12gt3re5kD8XSCrwprtkhx0fIdVjDBZmfisiJyQHif?=
	=?us-ascii?Q?ZDlWcEOytezxqQjO7sXLsim0GE2gl0YTkLhDsa9iFK0tKGbFyvFKJOZVfEkW?=
	=?us-ascii?Q?ps2cwK8xRl78DJOvWloesmNlc5LSvUhHvrgwC80dt4jW3vWO6ClWtILzNhKx?=
	=?us-ascii?Q?bc6DsFg8hjBqellKox/aaPEz6nk5B5EhClPNzrvq2vnAmC67pVyJy0IDxxSR?=
	=?us-ascii?Q?A7yM5ni9uaG5B2QLRbLEVcDnjNFC2auXPusnm+eDceEXXkNUYPmtx+2pFFPn?=
	=?us-ascii?Q?dTQGH8pYcBqXJIcnZ7NpGumppk3DMRBEn3MMD?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1931;
	6:AedPvF4qVHhEDq/HF4RCGgkJmG77hPIriRjs9ARRTD9PIKwfPQVHjWL7MzMM4wIxHwtrCRqHPXqLMmGLUvpdP241ntn+aTptJ2lkoOSepfwCfHDVgjpawiAbym3hKvgZ4DR2QMfPkyPDwFf7rs+fTBE3XxQJVCwThKcVnvKuYoyYsg+cm5QDLi2sxQvVuBMs9mzwrdqfR2Q3FCorRvkvzI9E6a/vG1CZFrAKW7/rT5/p46i0BShzgJBBZzmfRbZsNMtSEwyHqrEmRDb01iHkpMiVU1aCa+icWG2PXhsdQ5SIyGAfaq1pj2lluMAocG2jia1DXOKnW296tSgbzW2IGw==;
	5:pAHoPrKEsftAKWJydgk15PWvOAdU/gEl73cKg0IQNWlUoT/HxRhK0j9DtY623QCRhBBgcg8fEHg8psz3eD3N0bRDHH5J5bFXjrrKh1QPORgQdwSEIRqdSWLqBECUj/R7mXw94pvA2lUiSiY2fbxxPQ==;
	24:dP+zlHQ0vTZZglST34kV1EkuvQZhUXU/DNBjbpAp+RGfhc/JafC/3IrWBRPSgP2so2XpUnIwPrKhLT9ax7BQ0yEpPT+PszTXJSZQod7nyVs=;
	7:9cccN803ciRWUPkzj2v4Mdaj1twkftrXVDwwvm85QJPGlhbF69uTHDH4+AYfWe/YmcfhSMmHY+kCUPcWeRx5veUozNSTlGO0ejkXA1jo59zy1WQuw+eTcbRare3IsCy0WWw3doQg4pQn2GWyYzu4q9RYZbdUiH/86HHj7+xOKW3naJjTya7kBwq1321r256YT5HivmoDJ3DWB/8kuUcpAaeqmpEJztZbIc4A7ioznjk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2017 00:12:59.7158 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0201MB1931
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.53
Subject: [Qemu-arm] [PATCH v1 8/8] target: Replace fprintf(stderr,
 "*\n" with error_report()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, armbru@redhat.com,
	alistair.francis@xilinx.com,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Yongbok Kim <yongbok.kim@imgtec.com>, alistair23@gmail.com,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xkG8AKall9m6

Replace a large number of the fprintf(stderr, "*\n" calls with
error_report(). The functions were renamed with these commands and then
compiler issues where manually fixed.

find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +

Some lines where then manually tweaked to pass checkpatch.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Cc: Michael Walle <michael@walle.cc>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Yongbok Kim <yongbok.kim@imgtec.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
Cc: qemu-arm@nongnu.org
Cc: qemu-ppc@nongnu.org
---

 target/arm/arm-powerctl.c    |  5 +++--
 target/arm/arm-semi.c        |  3 ++-
 target/arm/helper.c          |  4 ++--
 target/arm/kvm.c             | 16 ++++++-------
 target/arm/kvm32.c           |  2 +-
 target/arm/kvm64.c           |  2 +-
 target/arm/translate-a64.c   |  4 ++--
 target/arm/translate.c       |  2 +-
 target/cris/helper.c         |  2 +-
 target/cris/translate.c      |  2 +-
 target/i386/hax-all.c        | 52 +++++++++++++++++++++----------------------
 target/i386/hax-darwin.c     | 26 +++++++++++-----------
 target/i386/hax-mem.c        |  4 ++--
 target/i386/hax-windows.c    | 42 +++++++++++++++++------------------
 target/i386/kvm.c            | 38 +++++++++++++++----------------
 target/i386/misc_helper.c    | 12 +++++-----
 target/lm32/op_helper.c      |  4 ++--
 target/mips/mips-semi.c      |  3 ++-
 target/mips/translate.c      |  2 +-
 target/ppc/excp_helper.c     |  4 ++--
 target/ppc/kvm.c             | 36 +++++++++++++++---------------
 target/ppc/mmu-hash64.c      |  2 +-
 target/ppc/mmu_helper.c      |  2 +-
 target/ppc/translate.c       | 20 ++++++++---------
 target/ppc/translate_init.c  | 53 ++++++++++++++++++++++----------------------
 target/s390x/kvm.c           | 20 ++++++++---------
 target/s390x/misc_helper.c   |  2 +-
 target/sh4/translate.c       |  4 ++--
 target/unicore32/translate.c |  4 ++--
 29 files changed, 188 insertions(+), 184 deletions(-)

diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index 25207cb850..2d56d5d579 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -9,6 +9,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "cpu.h"
 #include "cpu-qom.h"
 #include "internals.h"
@@ -24,7 +25,7 @@
 #define DPRINTF(fmt, args...) \
     do { \
         if (DEBUG_ARM_POWERCTL) { \
-            fprintf(stderr, "[ARM]%s: " fmt , __func__, ##args); \
+            error_report("[ARM]%s: " fmt , __func__, ##args); \
         } \
     } while (0)
 
@@ -32,7 +33,7 @@ CPUState *arm_get_cpu_by_id(uint64_t id)
 {
     CPUState *cpu;
 
-    DPRINTF("cpu %" PRId64 "\n", id);
+    DPRINTF("cpu %" PRId64 "", id);
 
     CPU_FOREACH(cpu) {
         ARMCPU *armcpu = ARM_CPU(cpu);
diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 7cac8734c7..f8f12102f1 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 
 #include "cpu.h"
 #include "exec/semihost.h"
@@ -649,7 +650,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         }
         /* fall through -- invalid for A32/T32 */
     default:
-        fprintf(stderr, "qemu: Unsupported SemiHosting SWI 0x%02x\n", nr);
+        error_report("qemu: Unsupported SemiHosting SWI 0x%02x", nr);
         cpu_dump_state(cs, stderr, fprintf, 0);
         abort();
     }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8be78ea2f8..881afc3382 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5460,9 +5460,9 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         ARMCPRegInfo *oldreg;
         oldreg = g_hash_table_lookup(cpu->cp_regs, key);
         if (oldreg && !(oldreg->type & ARM_CP_OVERRIDE)) {
-            fprintf(stderr, "Register redefined: cp=%d %d bit "
+            error_report("Register redefined: cp=%d %d bit "
                     "crn=%d crm=%d opc1=%d opc2=%d, "
-                    "was %s, now %s\n", r2->cp, 32 + 32 * is64,
+                    "was %s, now %s", r2->cp, 32 + 32 * is64,
                     r2->crn, r2->crm, r2->opc1, r2->opc2,
                     oldreg->name, r2->name);
             g_assert_not_reached();
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 211a7bf7be..0165960405 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -139,7 +139,7 @@ static void kvm_arm_host_cpu_class_init(ObjectClass *oc, void *data)
      * TCG CPUs.
      */
     if (!kvm_arm_get_host_cpu_features(ahcc)) {
-        fprintf(stderr, "Failed to retrieve host CPU features!\n");
+        error_report("Failed to retrieve host CPU features!");
         abort();
     }
 }
@@ -256,7 +256,7 @@ static void kvm_arm_set_device_addr(KVMDevice *kd)
     }
 
     if (ret < 0) {
-        fprintf(stderr, "Failed to set device address: %s\n",
+        error_report("Failed to set device address: %s",
                 strerror(-ret));
         abort();
     }
@@ -352,7 +352,7 @@ int kvm_arm_init_cpreg_list(ARMCPU *cpu)
         case KVM_REG_SIZE_U64:
             break;
         default:
-            fprintf(stderr, "Can't handle size of register in kernel list\n");
+            error_report("Can't handle size of register in kernel list");
             ret = -EINVAL;
             goto out;
         }
@@ -383,7 +383,7 @@ int kvm_arm_init_cpreg_list(ARMCPU *cpu)
         /* Shouldn't happen unless kernel is inconsistent about
          * what registers exist.
          */
-        fprintf(stderr, "Initial read of kernel register state failed\n");
+        error_report("Initial read of kernel register state failed");
         ret = -EINVAL;
         goto out;
     }
@@ -478,11 +478,11 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
      */
     ret = kvm_arm_vcpu_init(CPU(cpu));
     if (ret < 0) {
-        fprintf(stderr, "kvm_arm_vcpu_init failed: %s\n", strerror(-ret));
+        error_report("kvm_arm_vcpu_init failed: %s", strerror(-ret));
         abort();
     }
     if (!write_kvmstate_to_list(cpu)) {
-        fprintf(stderr, "write_kvmstate_to_list failed\n");
+        error_report("write_kvmstate_to_list failed");
         abort();
     }
 }
@@ -499,7 +499,7 @@ int kvm_arm_sync_mpstate_to_kvm(ARMCPU *cpu)
         };
         int ret = kvm_vcpu_ioctl(CPU(cpu), KVM_SET_MP_STATE, &mp_state);
         if (ret) {
-            fprintf(stderr, "%s: failed to set MP_STATE %d/%s\n",
+            error_report("%s: failed to set MP_STATE %d/%s",
                     __func__, ret, strerror(-ret));
             return -1;
         }
@@ -517,7 +517,7 @@ int kvm_arm_sync_mpstate_to_qemu(ARMCPU *cpu)
         struct kvm_mp_state mp_state;
         int ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_MP_STATE, &mp_state);
         if (ret) {
-            fprintf(stderr, "%s: failed to get MP_STATE %d/%s\n",
+            error_report("%s: failed to get MP_STATE %d/%s",
                     __func__, ret, strerror(-ret));
             abort();
         }
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index f925a21481..97d36a174d 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -191,7 +191,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
     ARMCPU *cpu = ARM_CPU(cs);
 
     if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE) {
-        fprintf(stderr, "KVM is not supported for this guest CPU type\n");
+        error_report("KVM is not supported for this guest CPU type");
         return -EINVAL;
     }
 
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 6554c30007..b3e1484069 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -502,7 +502,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
     if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE ||
         !object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU)) {
-        fprintf(stderr, "KVM is not supported for this guest CPU type\n");
+        error_report("KVM is not supported for this guest CPU type");
         return -EINVAL;
     }
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 899ffb96fc..eac76a0747 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -505,8 +505,8 @@ static inline void assert_fp_access_checked(DisasContext *s)
 {
 #ifdef CONFIG_DEBUG_TCG
     if (unlikely(!s->fp_access_checked || s->fp_excp_el)) {
-        fprintf(stderr, "target-arm: FP access check missing for "
-                "instruction 0x%08x\n", s->insn);
+        error_report("target-arm: FP access check missing for "
+                "instruction 0x%08x", s->insn);
         abort();
     }
 #endif
diff --git a/target/arm/translate.c b/target/arm/translate.c
index ab1a12a1b8..d484381aef 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -857,7 +857,7 @@ void arm_test_cc(DisasCompare *cmp, int cc)
         goto no_invert;
 
     default:
-        fprintf(stderr, "Bad condition code 0x%x\n", cc);
+        error_report("Bad condition code 0x%x", cc);
         abort();
     }
 
diff --git a/target/cris/helper.c b/target/cris/helper.c
index af78cca8b9..ba9ce538c3 100644
--- a/target/cris/helper.c
+++ b/target/cris/helper.c
@@ -282,7 +282,7 @@ hwaddr cris_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     if (!miss) {
         phy = res.phy;
     }
-    D(fprintf(stderr, "%s %x -> %x\n", __func__, addr, phy));
+    D(error_report("%s %x -> %x", __func__, addr, phy));
     return phy;
 }
 #endif
diff --git a/target/cris/translate.c b/target/cris/translate.c
index 38a999e6f1..8847005984 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -138,7 +138,7 @@ typedef struct DisasContext {
 
 static void gen_BUG(DisasContext *dc, const char *file, int line)
 {
-    fprintf(stderr, "BUG: pc=%x %s %d\n", dc->pc, file, line);
+    error_report("BUG: pc=%x %s %d", dc->pc, file, line);
     if (qemu_log_separate()) {
         qemu_log("BUG: pc=%x %s %d\n", dc->pc, file, line);
     }
diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
index 3ce6950296..b0462c8b4c 100644
--- a/target/i386/hax-all.c
+++ b/target/i386/hax-all.c
@@ -100,13 +100,13 @@ static int hax_get_capability(struct hax_state *hax)
     }
 
     if (!(cap->winfo & HAX_CAP_UG)) {
-        fprintf(stderr, "UG mode is not supported by the hardware.\n");
+        error_report("UG mode is not supported by the hardware.");
         return -ENOTSUP;
     }
 
     if (cap->wstatus & HAX_CAP_MEMQUOTA) {
         if (cap->mem_quota < hax->mem_quota) {
-            fprintf(stderr, "The VM memory needed exceeds the driver limit.\n");
+            error_report("The VM memory needed exceeds the driver limit.");
             return -ENOSPC;
         }
     }
@@ -126,13 +126,13 @@ static int hax_version_support(struct hax_state *hax)
     if (hax_min_version > version.cur_version) {
         fprintf(stderr, "Incompatible HAX module version %d,",
                 version.cur_version);
-        fprintf(stderr, "requires minimum version %d\n", hax_min_version);
+        error_report("requires minimum version %d", hax_min_version);
         return 0;
     }
     if (hax_cur_version < version.compat_version) {
         fprintf(stderr, "Incompatible QEMU HAX API version %x,",
                 hax_cur_version);
-        fprintf(stderr, "requires minimum HAX API version %x\n",
+        error_report("requires minimum HAX API version %x",
                 version.compat_version);
         return 0;
     }
@@ -146,18 +146,18 @@ int hax_vcpu_create(int id)
     int ret;
 
     if (!hax_global.vm) {
-        fprintf(stderr, "vcpu %x created failed, vm is null\n", id);
+        error_report("vcpu %x created failed, vm is null", id);
         return -1;
     }
 
     if (hax_global.vm->vcpus[id]) {
-        fprintf(stderr, "vcpu %x allocated already\n", id);
+        error_report("vcpu %x allocated already", id);
         return 0;
     }
 
     vcpu = g_malloc(sizeof(struct hax_vcpu_state));
     if (!vcpu) {
-        fprintf(stderr, "Failed to alloc vcpu state\n");
+        error_report("Failed to alloc vcpu state");
         return -ENOMEM;
     }
 
@@ -165,14 +165,14 @@ int hax_vcpu_create(int id)
 
     ret = hax_host_create_vcpu(hax_global.vm->fd, id);
     if (ret) {
-        fprintf(stderr, "Failed to create vcpu %x\n", id);
+        error_report("Failed to create vcpu %x", id);
         goto error;
     }
 
     vcpu->vcpu_id = id;
     vcpu->fd = hax_host_open_vcpu(hax_global.vm->id, id);
     if (hax_invalid_fd(vcpu->fd)) {
-        fprintf(stderr, "Failed to open the vcpu\n");
+        error_report("Failed to open the vcpu");
         ret = -ENODEV;
         goto error;
     }
@@ -181,7 +181,7 @@ int hax_vcpu_create(int id)
 
     ret = hax_host_setup_vcpu_channel(vcpu);
     if (ret) {
-        fprintf(stderr, "Invalid hax tunnel size\n");
+        error_report("Invalid hax tunnel size");
         ret = -EINVAL;
         goto error;
     }
@@ -203,7 +203,7 @@ int hax_vcpu_destroy(CPUState *cpu)
     struct hax_vcpu_state *vcpu = cpu->hax_vcpu;
 
     if (!hax_global.vm) {
-        fprintf(stderr, "vcpu %x destroy failed, vm is null\n", vcpu->vcpu_id);
+        error_report("vcpu %x destroy failed, vm is null", vcpu->vcpu_id);
         return -1;
     }
 
@@ -227,7 +227,7 @@ int hax_init_vcpu(CPUState *cpu)
 
     ret = hax_vcpu_create(cpu->cpu_index);
     if (ret < 0) {
-        fprintf(stderr, "Failed to create HAX vcpu\n");
+        error_report("Failed to create HAX vcpu");
         exit(-1);
     }
 
@@ -258,13 +258,13 @@ struct hax_vm *hax_vm_create(struct hax_state *hax)
     memset(vm, 0, sizeof(struct hax_vm));
     ret = hax_host_create_vm(hax, &vm_id);
     if (ret) {
-        fprintf(stderr, "Failed to create vm %x\n", ret);
+        error_report("Failed to create vm %x", ret);
         goto error;
     }
     vm->id = vm_id;
     vm->fd = hax_host_open_vm(hax, vm_id);
     if (hax_invalid_fd(vm->fd)) {
-        fprintf(stderr, "Failed to open vm %d\n", vm_id);
+        error_report("Failed to open vm %d", vm_id);
         goto error;
     }
 
@@ -283,7 +283,7 @@ int hax_vm_destroy(struct hax_vm *vm)
 
     for (i = 0; i < HAX_MAX_VCPU; i++)
         if (vm->vcpus[i]) {
-            fprintf(stderr, "VCPU should be cleaned before vm clean\n");
+            error_report("VCPU should be cleaned before vm clean");
             return -1;
         }
     hax_close_fd(vm->fd);
@@ -335,7 +335,7 @@ static int hax_init(ram_addr_t ram_size)
 
     hax->vm = hax_vm_create(hax);
     if (!hax->vm) {
-        fprintf(stderr, "Failed to create HAX VM\n");
+        error_report("Failed to create HAX VM");
         ret = -EINVAL;
         goto error;
     }
@@ -364,7 +364,7 @@ static int hax_accel_init(MachineState *ms)
     int ret = hax_init(ms->ram_size);
 
     if (ret && (ret != -ENOSPC)) {
-        fprintf(stderr, "No accelerator found.\n");
+        error_report("No accelerator found.");
     } else {
         fprintf(stdout, "HAX is %s and emulator runs in %s mode.\n",
                 !ret ? "working" : "not working",
@@ -526,7 +526,7 @@ static int hax_vcpu_hax_exec(CPUArchState *env)
         }
 
         if (hax_ret < 0) {
-            fprintf(stderr, "vcpu run failed for vcpu  %x\n", vcpu->vcpu_id);
+            error_report("vcpu run failed for vcpu  %x", vcpu->vcpu_id);
             abort();
         }
         switch (ht->_exit_status) {
@@ -546,7 +546,7 @@ static int hax_vcpu_hax_exec(CPUArchState *env)
             ret = 1;
             break;
         case HAX_EXIT_UNKNOWN_VMEXIT:
-            fprintf(stderr, "Unknown VMX exit %x from guest\n",
+            error_report("Unknown VMX exit %x from guest",
                     ht->_exit_reason);
             qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
             hax_vcpu_sync_state(env, 0);
@@ -569,16 +569,16 @@ static int hax_vcpu_hax_exec(CPUArchState *env)
             break;
         case HAX_EXIT_MMIO:
             /* Should not happen on UG system */
-            fprintf(stderr, "HAX: unsupported MMIO emulation\n");
+            error_report("HAX: unsupported MMIO emulation");
             ret = -1;
             break;
         case HAX_EXIT_REAL:
             /* Should not happen on UG system */
-            fprintf(stderr, "HAX: unimplemented real mode emulation\n");
+            error_report("HAX: unimplemented real mode emulation");
             ret = -1;
             break;
         default:
-            fprintf(stderr, "Unknown exit %x from HAX\n", ht->_exit_status);
+            error_report("Unknown exit %x from HAX", ht->_exit_status);
             qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
             hax_vcpu_sync_state(env, 0);
             cpu_dump_state(cpu, stderr, fprintf, 0);
@@ -662,7 +662,7 @@ int hax_smp_cpu_exec(CPUState *cpu)
         fatal = hax_vcpu_hax_exec(env);
 
         if (fatal) {
-            fprintf(stderr, "Unsupported HAX vcpu return\n");
+            error_report("Unsupported HAX vcpu return");
             abort();
         }
     }
@@ -1079,17 +1079,17 @@ static int hax_arch_set_registers(CPUArchState *env)
     ret = hax_sync_vcpu_register(env, 1);
 
     if (ret < 0) {
-        fprintf(stderr, "Failed to sync vcpu reg\n");
+        error_report("Failed to sync vcpu reg");
         return ret;
     }
     ret = hax_set_fpu(env);
     if (ret < 0) {
-        fprintf(stderr, "FPU failed\n");
+        error_report("FPU failed");
         return ret;
     }
     ret = hax_set_msrs(env);
     if (ret < 0) {
-        fprintf(stderr, "MSR failed\n");
+        error_report("MSR failed");
         return ret;
     }
 
diff --git a/target/i386/hax-darwin.c b/target/i386/hax-darwin.c
index 1c5bbd0a2d..768521b6d0 100644
--- a/target/i386/hax-darwin.c
+++ b/target/i386/hax-darwin.c
@@ -24,7 +24,7 @@ hax_fd hax_mod_open(void)
 {
     int fd = open("/dev/HAX", O_RDWR);
     if (fd == -1) {
-        fprintf(stderr, "Failed to open the hax module\n");
+        error_report("Failed to open the hax module");
     }
 
     fcntl(fd, F_SETFD, FD_CLOEXEC);
@@ -38,7 +38,7 @@ int hax_populate_ram(uint64_t va, uint32_t size)
     struct hax_alloc_ram_info info;
 
     if (!hax_global.vm || !hax_global.vm->fd) {
-        fprintf(stderr, "Allocate memory before vm create?\n");
+        error_report("Allocate memory before vm create?");
         return -EINVAL;
     }
 
@@ -46,7 +46,7 @@ int hax_populate_ram(uint64_t va, uint32_t size)
     info.va = va;
     ret = ioctl(hax_global.vm->fd, HAX_VM_IOCTL_ALLOC_RAM, &info);
     if (ret < 0) {
-        fprintf(stderr, "Failed to allocate %x memory\n", size);
+        error_report("Failed to allocate %x memory", size);
         return ret;
     }
     return 0;
@@ -75,7 +75,7 @@ int hax_capability(struct hax_state *hax, struct hax_capabilityinfo *cap)
 
     ret = ioctl(hax->fd, HAX_IOCTL_CAPABILITY, cap);
     if (ret == -1) {
-        fprintf(stderr, "Failed to get HAX capability\n");
+        error_report("Failed to get HAX capability");
         return -errno;
     }
 
@@ -88,7 +88,7 @@ int hax_mod_version(struct hax_state *hax, struct hax_module_version *version)
 
     ret = ioctl(hax->fd, HAX_IOCTL_VERSION, version);
     if (ret == -1) {
-        fprintf(stderr, "Failed to get HAX version\n");
+        error_report("Failed to get HAX version");
         return -errno;
     }
 
@@ -100,7 +100,7 @@ static char *hax_vm_devfs_string(int vm_id)
     char *name;
 
     if (vm_id > MAX_VM_ID) {
-        fprintf(stderr, "Too big VM id\n");
+        error_report("Too big VM id");
         return NULL;
     }
 
@@ -119,7 +119,7 @@ static char *hax_vcpu_devfs_string(int vm_id, int vcpu_id)
     char *name;
 
     if (vm_id > MAX_VM_ID || vcpu_id > MAX_VCPU_ID) {
-        fprintf(stderr, "Too big vm id %x or vcpu id %x\n", vm_id, vcpu_id);
+        error_report("Too big vm id %x or vcpu id %x", vm_id, vcpu_id);
         return NULL;
     }
 
@@ -181,7 +181,7 @@ int hax_notify_qemu_version(hax_fd vm_fd, struct hax_qemu_version *qversion)
     ret = ioctl(vm_fd, HAX_VM_IOCTL_NOTIFY_QEMU_VERSION, qversion);
 
     if (ret < 0) {
-        fprintf(stderr, "Failed to notify qemu API version\n");
+        error_report("Failed to notify qemu API version");
         return ret;
     }
     return 0;
@@ -196,7 +196,7 @@ int hax_host_create_vcpu(hax_fd vm_fd, int vcpuid)
 
     ret = ioctl(vm_fd, HAX_VM_IOCTL_VCPU_CREATE, &vcpuid);
     if (ret < 0) {
-        fprintf(stderr, "Failed to create vcpu %x\n", vcpuid);
+        error_report("Failed to create vcpu %x", vcpuid);
     }
 
     return ret;
@@ -209,14 +209,14 @@ hax_fd hax_host_open_vcpu(int vmid, int vcpuid)
 
     devfs_path = hax_vcpu_devfs_string(vmid, vcpuid);
     if (!devfs_path) {
-        fprintf(stderr, "Failed to get the devfs\n");
+        error_report("Failed to get the devfs");
         return -EINVAL;
     }
 
     fd = open(devfs_path, O_RDWR);
     g_free(devfs_path);
     if (fd < 0) {
-        fprintf(stderr, "Failed to open the vcpu devfs\n");
+        error_report("Failed to open the vcpu devfs");
     }
     fcntl(fd, F_SETFD, FD_CLOEXEC);
     return fd;
@@ -229,12 +229,12 @@ int hax_host_setup_vcpu_channel(struct hax_vcpu_state *vcpu)
 
     ret = ioctl(vcpu->fd, HAX_VCPU_IOCTL_SETUP_TUNNEL, &info);
     if (ret) {
-        fprintf(stderr, "Failed to setup the hax tunnel\n");
+        error_report("Failed to setup the hax tunnel");
         return ret;
     }
 
     if (!valid_hax_tunnel_size(info.size)) {
-        fprintf(stderr, "Invalid hax tunnel size %x\n", info.size);
+        error_report("Invalid hax tunnel size %x", info.size);
         ret = -EINVAL;
         return ret;
     }
diff --git a/target/i386/hax-mem.c b/target/i386/hax-mem.c
index 27a0d214f2..e1388bb003 100644
--- a/target/i386/hax-mem.c
+++ b/target/i386/hax-mem.c
@@ -247,8 +247,8 @@ static void hax_transaction_commit(MemoryListener *listener)
             }
             if (hax_set_ram(entry->start_pa, entry->size,
                             entry->host_va, entry->flags)) {
-                fprintf(stderr, "%s: Failed mapping @0x%016" PRIx64 "+0x%"
-                        PRIx32 " flags %02x\n", __func__, entry->start_pa,
+                error_report("%s: Failed mapping @0x%016" PRIx64 "+0x%"
+                        PRIx32 " flags %02x", __func__, entry->start_pa,
                         entry->size, entry->flags);
             }
             QTAILQ_REMOVE(&mappings, entry, entry);
diff --git a/target/i386/hax-windows.c b/target/i386/hax-windows.c
index 15a180b646..8d724d21ad 100644
--- a/target/i386/hax-windows.c
+++ b/target/i386/hax-windows.c
@@ -33,7 +33,7 @@ static int hax_open_device(hax_fd *fd)
                          0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
 
     if (hDevice == INVALID_HANDLE_VALUE) {
-        fprintf(stderr, "Failed to open the HAX device!\n");
+        error_report("Failed to open the HAX device!");
         errNum = GetLastError();
         if (errNum == ERROR_FILE_NOT_FOUND) {
             return -1;
@@ -52,7 +52,7 @@ static int hax_open_device(hax_fd *fd)
 
     ret = hax_open_device(&fd);
     if (ret != 0) {
-        fprintf(stderr, "Open HAX device failed\n");
+        error_report("Open HAX device failed");
     }
 
     return fd;
@@ -66,7 +66,7 @@ int hax_populate_ram(uint64_t va, uint32_t size)
     DWORD dSize = 0;
 
     if (!hax_global.vm || !hax_global.vm->fd) {
-        fprintf(stderr, "Allocate memory before vm create?\n");
+        error_report("Allocate memory before vm create?");
         return -EINVAL;
     }
 
@@ -81,7 +81,7 @@ int hax_populate_ram(uint64_t va, uint32_t size)
                           (LPOVERLAPPED) NULL);
 
     if (!ret) {
-        fprintf(stderr, "Failed to allocate %x memory\n", size);
+        error_report("Failed to allocate %x memory", size);
         return ret;
     }
 
@@ -119,7 +119,7 @@ int hax_capability(struct hax_state *hax, struct hax_capabilityinfo *cap)
     DWORD err = 0;
 
     if (hax_invalid_fd(hDevice)) {
-        fprintf(stderr, "Invalid fd for hax device!\n");
+        error_report("Invalid fd for hax device!");
         return -ENODEV;
     }
 
@@ -129,9 +129,9 @@ int hax_capability(struct hax_state *hax, struct hax_capabilityinfo *cap)
     if (!ret) {
         err = GetLastError();
         if (err == ERROR_INSUFFICIENT_BUFFER || err == ERROR_MORE_DATA) {
-            fprintf(stderr, "hax capability is too long to hold.\n");
+            error_report("hax capability is too long to hold.");
         }
-        fprintf(stderr, "Failed to get Hax capability:%luu\n", err);
+        error_report("Failed to get Hax capability:%luu", err);
         return -EFAULT;
     } else {
         return 0;
@@ -146,7 +146,7 @@ int hax_mod_version(struct hax_state *hax, struct hax_module_version *version)
     DWORD err = 0;
 
     if (hax_invalid_fd(hDevice)) {
-        fprintf(stderr, "Invalid fd for hax device!\n");
+        error_report("Invalid fd for hax device!");
         return -ENODEV;
     }
 
@@ -159,9 +159,9 @@ int hax_mod_version(struct hax_state *hax, struct hax_module_version *version)
     if (!ret) {
         err = GetLastError();
         if (err == ERROR_INSUFFICIENT_BUFFER || err == ERROR_MORE_DATA) {
-            fprintf(stderr, "hax module verion is too long to hold.\n");
+            error_report("hax module verion is too long to hold.");
         }
-        fprintf(stderr, "Failed to get Hax module version:%lu\n", err);
+        error_report("Failed to get Hax module version:%lu", err);
         return -EFAULT;
     } else {
         return 0;
@@ -173,7 +173,7 @@ static char *hax_vm_devfs_string(int vm_id)
     char *name;
 
     if (vm_id > MAX_VM_ID) {
-        fprintf(stderr, "Too big VM id\n");
+        error_report("Too big VM id");
         return NULL;
     }
 
@@ -192,7 +192,7 @@ static char *hax_vcpu_devfs_string(int vm_id, int vcpu_id)
     char *name;
 
     if (vm_id > MAX_VM_ID || vcpu_id > MAX_VCPU_ID) {
-        fprintf(stderr, "Too big vm id %x or vcpu id %x\n", vm_id, vcpu_id);
+        error_report("Too big vm id %x or vcpu id %x", vm_id, vcpu_id);
         return NULL;
     }
 
@@ -226,7 +226,7 @@ int hax_host_create_vm(struct hax_state *hax, int *vmid)
                           NULL, 0, &vm_id, sizeof(vm_id), &dSize,
                           (LPOVERLAPPED) NULL);
     if (!ret) {
-        fprintf(stderr, "Failed to create VM. Error code: %lu\n",
+        error_report("Failed to create VM. Error code: %lu",
                 GetLastError());
         return -1;
     }
@@ -241,7 +241,7 @@ hax_fd hax_host_open_vm(struct hax_state *hax, int vm_id)
 
     vm_name = hax_vm_devfs_string(vm_id);
     if (!vm_name) {
-        fprintf(stderr, "Failed to open VM. VM name is null\n");
+        error_report("Failed to open VM. VM name is null");
         return INVALID_HANDLE_VALUE;
     }
 
@@ -249,7 +249,7 @@ hax_fd hax_host_open_vm(struct hax_state *hax, int vm_id)
                            GENERIC_READ | GENERIC_WRITE,
                            0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
     if (hDeviceVM == INVALID_HANDLE_VALUE) {
-        fprintf(stderr, "Open the vm device error:%s, ec:%lu\n",
+        error_report("Open the vm device error:%s, ec:%lu",
                 vm_name, GetLastError());
     }
 
@@ -269,7 +269,7 @@ int hax_notify_qemu_version(hax_fd vm_fd, struct hax_qemu_version *qversion)
                           qversion, sizeof(struct hax_qemu_version),
                           NULL, 0, &dSize, (LPOVERLAPPED) NULL);
     if (!ret) {
-        fprintf(stderr, "Failed to notify qemu API version\n");
+        error_report("Failed to notify qemu API version");
         return -1;
     }
     return 0;
@@ -285,7 +285,7 @@ int hax_host_create_vcpu(hax_fd vm_fd, int vcpuid)
                           &vcpuid, sizeof(vcpuid), NULL, 0, &dSize,
                           (LPOVERLAPPED) NULL);
     if (!ret) {
-        fprintf(stderr, "Failed to create vcpu %x\n", vcpuid);
+        error_report("Failed to create vcpu %x", vcpuid);
         return -1;
     }
 
@@ -299,7 +299,7 @@ hax_fd hax_host_open_vcpu(int vmid, int vcpuid)
 
     devfs_path = hax_vcpu_devfs_string(vmid, vcpuid);
     if (!devfs_path) {
-        fprintf(stderr, "Failed to get the devfs\n");
+        error_report("Failed to get the devfs");
         return INVALID_HANDLE_VALUE;
     }
 
@@ -309,7 +309,7 @@ hax_fd hax_host_open_vcpu(int vmid, int vcpuid)
                              NULL);
 
     if (hDeviceVCPU == INVALID_HANDLE_VALUE) {
-        fprintf(stderr, "Failed to open the vcpu devfs\n");
+        error_report("Failed to open the vcpu devfs");
     }
     g_free(devfs_path);
     return hDeviceVCPU;
@@ -327,12 +327,12 @@ int hax_host_setup_vcpu_channel(struct hax_vcpu_state *vcpu)
                           NULL, 0, &info, sizeof(info), &dSize,
                           (LPOVERLAPPED) NULL);
     if (!ret) {
-        fprintf(stderr, "Failed to setup the hax tunnel\n");
+        error_report("Failed to setup the hax tunnel");
         return -1;
     }
 
     if (!valid_hax_tunnel_size(info.size)) {
-        fprintf(stderr, "Invalid hax tunnel size %x\n", info.size);
+        error_report("Invalid hax tunnel size %x", info.size);
         ret = -EINVAL;
         return ret;
     }
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index b1e32e95d3..d7cf10ae11 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -219,7 +219,7 @@ static struct kvm_cpuid2 *try_get_cpuid(KVMState *s, int max)
             g_free(cpuid);
             return NULL;
         } else {
-            fprintf(stderr, "KVM_GET_SUPPORTED_CPUID failed: %s\n",
+            error_report("KVM_GET_SUPPORTED_CPUID failed: %s",
                     strerror(-r));
             exit(1);
         }
@@ -470,7 +470,7 @@ static void kvm_mce_inject(X86CPU *cpu, hwaddr paddr, int code)
 
 static void hardware_memory_error(void)
 {
-    fprintf(stderr, "Hardware memory error!\n");
+    error_report("Hardware memory error!");
     exit(1);
 }
 
@@ -497,8 +497,8 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
             return;
         }
 
-        fprintf(stderr, "Hardware memory error for memory used by "
-                "QEMU itself instead of guest system!\n");
+        error_report("Hardware memory error for memory used by "
+                "QEMU itself instead of guest system!");
     }
 
     if (code == BUS_MCEERR_AR) {
@@ -666,7 +666,7 @@ static int hyperv_handle_properties(CPUState *cs)
 
         if (!has_msr_hv_synic ||
             kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_SYNIC, 0)) {
-            fprintf(stderr, "Hyper-V SynIC is not supported by kernel\n");
+            error_report("Hyper-V SynIC is not supported by kernel");
             return -ENOSYS;
         }
 
@@ -678,7 +678,7 @@ static int hyperv_handle_properties(CPUState *cs)
     }
     if (cpu->hyperv_stimer) {
         if (!has_msr_hv_stimer) {
-            fprintf(stderr, "Hyper-V timers aren't supported by kernel\n");
+            error_report("Hyper-V timers aren't supported by kernel");
             return -ENOSYS;
         }
         env->features[FEAT_HYPERV_EAX] |= HV_SYNTIMERS_AVAILABLE;
@@ -811,7 +811,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
     for (i = 0; i <= limit; i++) {
         if (cpuid_i == KVM_MAX_CPUID_ENTRIES) {
-            fprintf(stderr, "unsupported level value: 0x%x\n", limit);
+            error_report("unsupported level value: 0x%x", limit);
             abort();
         }
         c = &cpuid_data.entries[cpuid_i++];
@@ -829,8 +829,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
             for (j = 1; j < times; ++j) {
                 if (cpuid_i == KVM_MAX_CPUID_ENTRIES) {
-                    fprintf(stderr, "cpuid_data is full, no space for "
-                            "cpuid(eax:2):eax & 0xf = 0x%x\n", times);
+                    error_report("cpuid_data is full, no space for "
+                            "cpuid(eax:2):eax & 0xf = 0x%x", times);
                     abort();
                 }
                 c = &cpuid_data.entries[cpuid_i++];
@@ -862,8 +862,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
                     continue;
                 }
                 if (cpuid_i == KVM_MAX_CPUID_ENTRIES) {
-                    fprintf(stderr, "cpuid_data is full, no space for "
-                            "cpuid(eax:0x%x,ecx:0x%x)\n", i, j);
+                    error_report("cpuid_data is full, no space for "
+                            "cpuid(eax:0x%x,ecx:0x%x)", i, j);
                     abort();
                 }
                 c = &cpuid_data.entries[cpuid_i++];
@@ -899,7 +899,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
     for (i = 0x80000000; i <= limit; i++) {
         if (cpuid_i == KVM_MAX_CPUID_ENTRIES) {
-            fprintf(stderr, "unsupported xlevel value: 0x%x\n", limit);
+            error_report("unsupported xlevel value: 0x%x", limit);
             abort();
         }
         c = &cpuid_data.entries[cpuid_i++];
@@ -915,7 +915,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
         for (i = 0xC0000000; i <= limit; i++) {
             if (cpuid_i == KVM_MAX_CPUID_ENTRIES) {
-                fprintf(stderr, "unsupported xlevel2 value: 0x%x\n", limit);
+                error_report("unsupported xlevel2 value: 0x%x", limit);
                 abort();
             }
             c = &cpuid_data.entries[cpuid_i++];
@@ -1245,7 +1245,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     /* Tell fw_cfg to notify the BIOS to reserve the range. */
     ret = e820_add_entry(identity_base, 0x4000, E820_RESERVED);
     if (ret < 0) {
-        fprintf(stderr, "e820_add_entry() table is full\n");
+        error_report("e820_add_entry() table is full");
         return ret;
     }
     qemu_register_reset(kvm_unpoison_all, NULL);
@@ -2733,7 +2733,7 @@ void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *run)
             DPRINTF("injected NMI\n");
             ret = kvm_vcpu_ioctl(cpu, KVM_NMI);
             if (ret < 0) {
-                fprintf(stderr, "KVM: injection failed, NMI lost (%s)\n",
+                error_report("KVM: injection failed, NMI lost (%s)",
                         strerror(-ret));
             }
         }
@@ -2744,7 +2744,7 @@ void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *run)
             DPRINTF("injected SMI\n");
             ret = kvm_vcpu_ioctl(cpu, KVM_SMI);
             if (ret < 0) {
-                fprintf(stderr, "KVM: injection failed, SMI lost (%s)\n",
+                error_report("KVM: injection failed, SMI lost (%s)",
                         strerror(-ret));
             }
         }
@@ -3141,7 +3141,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
         break;
     case KVM_EXIT_FAIL_ENTRY:
         code = run->fail_entry.hardware_entry_failure_reason;
-        fprintf(stderr, "KVM: entry failed, hardware error 0x%" PRIx64 "\n",
+        error_report("KVM: entry failed, hardware error 0x%" PRIx64 "",
                 code);
         if (host_supports_vmx() && code == VMX_INVALID_GUEST_STATE) {
             fprintf(stderr,
@@ -3157,7 +3157,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
         ret = -1;
         break;
     case KVM_EXIT_EXCEPTION:
-        fprintf(stderr, "KVM: exception %d exit (error code 0x%x)\n",
+        error_report("KVM: exception %d exit (error code 0x%x)",
                 run->ex.exception, run->ex.error_code);
         ret = -1;
         break;
@@ -3175,7 +3175,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
         ret = 0;
         break;
     default:
-        fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
+        error_report("KVM: unknown exit reason %d", run->exit_reason);
         ret = -1;
         break;
     }
diff --git a/target/i386/misc_helper.c b/target/i386/misc_helper.c
index 628f64aad5..115e80217e 100644
--- a/target/i386/misc_helper.c
+++ b/target/i386/misc_helper.c
@@ -28,7 +28,7 @@
 void helper_outb(CPUX86State *env, uint32_t port, uint32_t data)
 {
 #ifdef CONFIG_USER_ONLY
-    fprintf(stderr, "outb: port=0x%04x, data=%02x\n", port, data);
+    error_report("outb: port=0x%04x, data=%02x", port, data);
 #else
     address_space_stb(&address_space_io, port, data,
                       cpu_get_mem_attrs(env), NULL);
@@ -38,7 +38,7 @@ void helper_outb(CPUX86State *env, uint32_t port, uint32_t data)
 target_ulong helper_inb(CPUX86State *env, uint32_t port)
 {
 #ifdef CONFIG_USER_ONLY
-    fprintf(stderr, "inb: port=0x%04x\n", port);
+    error_report("inb: port=0x%04x", port);
     return 0;
 #else
     return address_space_ldub(&address_space_io, port,
@@ -49,7 +49,7 @@ target_ulong helper_inb(CPUX86State *env, uint32_t port)
 void helper_outw(CPUX86State *env, uint32_t port, uint32_t data)
 {
 #ifdef CONFIG_USER_ONLY
-    fprintf(stderr, "outw: port=0x%04x, data=%04x\n", port, data);
+    error_report("outw: port=0x%04x, data=%04x", port, data);
 #else
     address_space_stw(&address_space_io, port, data,
                       cpu_get_mem_attrs(env), NULL);
@@ -59,7 +59,7 @@ void helper_outw(CPUX86State *env, uint32_t port, uint32_t data)
 target_ulong helper_inw(CPUX86State *env, uint32_t port)
 {
 #ifdef CONFIG_USER_ONLY
-    fprintf(stderr, "inw: port=0x%04x\n", port);
+    error_report("inw: port=0x%04x", port);
     return 0;
 #else
     return address_space_lduw(&address_space_io, port,
@@ -70,7 +70,7 @@ target_ulong helper_inw(CPUX86State *env, uint32_t port)
 void helper_outl(CPUX86State *env, uint32_t port, uint32_t data)
 {
 #ifdef CONFIG_USER_ONLY
-    fprintf(stderr, "outw: port=0x%04x, data=%08x\n", port, data);
+    error_report("outw: port=0x%04x, data=%08x", port, data);
 #else
     address_space_stl(&address_space_io, port, data,
                       cpu_get_mem_attrs(env), NULL);
@@ -80,7 +80,7 @@ void helper_outl(CPUX86State *env, uint32_t port, uint32_t data)
 target_ulong helper_inl(CPUX86State *env, uint32_t port)
 {
 #ifdef CONFIG_USER_ONLY
-    fprintf(stderr, "inl: port=0x%04x\n", port);
+    error_report("inl: port=0x%04x", port);
     return 0;
 #else
     return address_space_ldl(&address_space_io, port,
diff --git a/target/lm32/op_helper.c b/target/lm32/op_helper.c
index 2177c8ad12..34bfc3fb3b 100644
--- a/target/lm32/op_helper.c
+++ b/target/lm32/op_helper.c
@@ -40,9 +40,9 @@ void HELPER(ill)(CPULM32State *env)
 {
 #ifndef CONFIG_USER_ONLY
     CPUState *cs = CPU(lm32_env_get_cpu(env));
-    fprintf(stderr, "VM paused due to illegal instruction. "
+    error_report("VM paused due to illegal instruction. "
             "Connect a debugger or switch to the monitor console "
-            "to find out more.\n");
+            "to find out more.");
     vm_stop(RUN_STATE_PAUSED);
     cs->halted = 1;
     raise_exception(env, EXCP_HALTED);
diff --git a/target/mips/mips-semi.c b/target/mips/mips-semi.c
index a7aefbaefc..c1f35f8f5a 100644
--- a/target/mips/mips-semi.c
+++ b/target/mips/mips-semi.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "cpu.h"
 #include "qemu/log.h"
 #include "exec/helper-proto.h"
@@ -366,7 +367,7 @@ void helper_do_semihosting(CPUMIPSState *env)
         break;
 #endif
     default:
-        fprintf(stderr, "Unknown UHI operation %d\n", op);
+        error_report("Unknown UHI operation %d", op);
         abort();
     }
 uhi_done:
diff --git a/target/mips/translate.c b/target/mips/translate.c
index d16d879df7..32a5920259 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -10886,7 +10886,7 @@ static void gen_branch(DisasContext *ctx, int insn_bytes)
             tcg_gen_lookup_and_goto_ptr(cpu_PC);
             break;
         default:
-            fprintf(stderr, "unknown branch 0x%x\n", proc_hflags);
+            error_report("unknown branch 0x%x", proc_hflags);
             abort();
         }
     }
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index e6009e70e5..a142e81a0f 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -200,8 +200,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
             /* Machine check exception is not enabled.
              * Enter checkstop state.
              */
-            fprintf(stderr, "Machine check while not allowed. "
-                    "Entering checkstop state\n");
+            error_report("Machine check while not allowed. "
+                    "Entering checkstop state");
             if (qemu_log_separate()) {
                 qemu_log("Machine check while not allowed. "
                         "Entering checkstop state\n");
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 1deaf106d2..136b5a0c69 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -159,8 +159,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     cap_ppc_pvr_compat = false;
 
     if (!cap_interrupt_level) {
-        fprintf(stderr, "KVM: Couldn't find level irq capability. Expect the "
-                        "VM to stall at times!\n");
+        error_report("KVM: Couldn't find level irq capability. Expect the "
+                        "VM to stall at times!");
     }
 
     kvm_ppc_register_host_cpu_type();
@@ -188,7 +188,7 @@ static int kvm_arch_sync_sregs(PowerPCCPU *cpu)
         return 0;
     } else {
         if (!cap_segstate) {
-            fprintf(stderr, "kvm error: missing PVR setting capability\n");
+            error_report("kvm error: missing PVR setting capability");
             return -ENOSYS;
         }
     }
@@ -237,7 +237,7 @@ static int kvm_booke206_tlb_init(PowerPCCPU *cpu)
 
     ret = kvm_vcpu_enable_cap(cs, KVM_CAP_SW_TLB, 0, (uintptr_t)&cfg);
     if (ret < 0) {
-        fprintf(stderr, "%s: couldn't enable KVM_CAP_SW_TLB: %s\n",
+        error_report("%s: couldn't enable KVM_CAP_SW_TLB: %s",
                 __func__, strerror(-ret));
         return ret;
     }
@@ -552,7 +552,7 @@ static void kvmppc_hw_debug_points_init(CPUPPCState *cenv)
     }
 
     if ((max_hw_breakpoint + max_hw_watchpoint) > MAX_HW_BKPTS) {
-        fprintf(stderr, "Error initializing h/w breakpoints\n");
+        error_report("Error initializing h/w breakpoints");
         return;
     }
 }
@@ -623,7 +623,7 @@ static void kvm_sw_tlb_put(PowerPCCPU *cpu)
 
     ret = kvm_vcpu_ioctl(cs, KVM_DIRTY_TLB, &dirty_tlb);
     if (ret) {
-        fprintf(stderr, "%s: KVM_DIRTY_TLB: %s\n",
+        error_report("%s: KVM_DIRTY_TLB: %s",
                 __func__, strerror(-ret));
     }
 
@@ -1474,7 +1474,7 @@ static int kvmppc_handle_halt(PowerPCCPU *cpu)
 static int kvmppc_handle_dcr_read(CPUPPCState *env, uint32_t dcrn, uint32_t *data)
 {
     if (ppc_dcr_read(env->dcr_env, dcrn, data) < 0)
-        fprintf(stderr, "Read to unhandled DCR (0x%x)\n", dcrn);
+        error_report("Read to unhandled DCR (0x%x)", dcrn);
 
     return 0;
 }
@@ -1482,7 +1482,7 @@ static int kvmppc_handle_dcr_read(CPUPPCState *env, uint32_t dcrn, uint32_t *dat
 static int kvmppc_handle_dcr_write(CPUPPCState *env, uint32_t dcrn, uint32_t data)
 {
     if (ppc_dcr_write(env->dcr_env, dcrn, data) < 0)
-        fprintf(stderr, "Write to unhandled DCR (0x%x)\n", dcrn);
+        error_report("Write to unhandled DCR (0x%x)", dcrn);
 
     return 0;
 }
@@ -1793,7 +1793,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
         break;
 
     default:
-        fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
+        error_report("KVM: unknown exit reason %d", run->exit_reason);
         ret = -1;
         break;
     }
@@ -1857,7 +1857,7 @@ int kvmppc_booke_watchdog_enable(PowerPCCPU *cpu)
 
     ret = kvm_vcpu_enable_cap(cs, KVM_CAP_PPC_BOOKE_WATCHDOG, 0);
     if (ret < 0) {
-        fprintf(stderr, "%s: couldn't enable KVM_CAP_PPC_BOOKE_WATCHDOG: %s\n",
+        error_report("%s: couldn't enable KVM_CAP_PPC_BOOKE_WATCHDOG: %s",
                 __func__, strerror(-ret));
         return ret;
     }
@@ -2192,7 +2192,7 @@ off_t kvmppc_alloc_rma(void **rma)
 
     fd = kvm_vm_ioctl(kvm_state, KVM_ALLOCATE_RMA, &ret);
     if (fd < 0) {
-        fprintf(stderr, "KVM: Error on KVM_ALLOCATE_RMA: %s\n",
+        error_report("KVM: Error on KVM_ALLOCATE_RMA: %s",
                 strerror(errno));
         return -1;
     }
@@ -2201,7 +2201,7 @@ off_t kvmppc_alloc_rma(void **rma)
 
     *rma = mmap(NULL, size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
     if (*rma == MAP_FAILED) {
-        fprintf(stderr, "KVM: Error mapping RMA: %s\n", strerror(errno));
+        error_report("KVM: Error mapping RMA: %s", strerror(errno));
         return -1;
     };
 
@@ -2303,7 +2303,7 @@ void *kvmppc_create_spapr_tce(uint32_t liobn, uint32_t page_shift,
         }
         fd = kvm_vm_ioctl(kvm_state, KVM_CREATE_SPAPR_TCE, &args);
         if (fd < 0) {
-            fprintf(stderr, "KVM: Failed to create TCE table for liobn 0x%x\n",
+            error_report("KVM: Failed to create TCE table for liobn 0x%x",
                     liobn);
             return NULL;
         }
@@ -2316,7 +2316,7 @@ void *kvmppc_create_spapr_tce(uint32_t liobn, uint32_t page_shift,
 
     table = mmap(NULL, len, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
     if (table == MAP_FAILED) {
-        fprintf(stderr, "KVM: Failed to map TCE table for liobn 0x%x\n",
+        error_report("KVM: Failed to map TCE table for liobn 0x%x",
                 liobn);
         close(fd);
         return NULL;
@@ -2563,7 +2563,7 @@ int kvmppc_get_htab_fd(bool write)
     };
 
     if (!cap_htab_fd) {
-        fprintf(stderr, "KVM version doesn't support saving the hash table\n");
+        error_report("KVM version doesn't support saving the hash table");
         return -1;
     }
 
@@ -2579,7 +2579,7 @@ int kvmppc_save_htab(QEMUFile *f, int fd, size_t bufsize, int64_t max_ns)
     do {
         rc = read(fd, buf, bufsize);
         if (rc < 0) {
-            fprintf(stderr, "Error reading data from KVM HTAB fd: %s\n",
+            error_report("Error reading data from KVM HTAB fd: %s",
                     strerror(errno));
             return rc;
         } else if (rc) {
@@ -2624,13 +2624,13 @@ int kvmppc_load_htab_chunk(QEMUFile *f, int fd, uint32_t index,
 
     rc = write(fd, buf, chunksize);
     if (rc < 0) {
-        fprintf(stderr, "Error writing KVM hash table: %s\n",
+        error_report("Error writing KVM hash table: %s",
                 strerror(errno));
         return rc;
     }
     if (rc != chunksize) {
         /* We should never get a short write on a single chunk */
-        fprintf(stderr, "Short write, restoring KVM hash table\n");
+        error_report("Short write, restoring KVM hash table");
         return -1;
     }
     return 0;
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 14d34e512f..8713ed6682 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -377,7 +377,7 @@ static int ppc_hash64_amr_prot(PowerPCCPU *cpu, ppc_hash_pte64_t pte)
     key = HPTE64_R_KEY(pte.pte1);
     amrbits = (env->spr[SPR_AMR] >> 2*(31 - key)) & 0x3;
 
-    /* fprintf(stderr, "AMR protection: key=%d AMR=0x%" PRIx64 "\n", key, */
+    /* error_report("AMR protection: key=%d AMR=0x%" PRIx64 "", key, */
     /*         env->spr[SPR_AMR]); */
 
     /*
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 2a1f9902c9..cbf5187ff8 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -2600,7 +2600,7 @@ void helper_booke206_tlbwe(CPUPPCState *env)
     if (((env->spr[SPR_BOOKE_MAS0] & MAS0_ATSEL) == MAS0_ATSEL_LRAT) &&
         !msr_gs) {
         /* XXX we don't support direct LRAT setting yet */
-        fprintf(stderr, "cpu: don't support LRAT setting yet\n");
+        error_report("cpu: don't support LRAT setting yet");
         return;
     }
 
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 606b605ba0..a3da22580e 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3943,8 +3943,8 @@ static inline void gen_op_mfspr(DisasContext *ctx)
              * allowing userland application to read the PVR
              */
             if (sprn != SPR_PVR) {
-                fprintf(stderr, "Trying to read privileged spr %d (0x%03x) at "
-                        TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
+                error_report("Trying to read privileged spr %d (0x%03x) at "
+                        TARGET_FMT_lx "", sprn, sprn, ctx->nip - 4);
                 if (qemu_log_separate()) {
                     qemu_log("Trying to read privileged spr %d (0x%03x) at "
                              TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
@@ -3960,8 +3960,8 @@ static inline void gen_op_mfspr(DisasContext *ctx)
             return;
         }
         /* Not defined */
-        fprintf(stderr, "Trying to read invalid spr %d (0x%03x) at "
-                TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
+        error_report("Trying to read invalid spr %d (0x%03x) at "
+                TARGET_FMT_lx "", sprn, sprn, ctx->nip - 4);
         if (qemu_log_separate()) {
             qemu_log("Trying to read invalid spr %d (0x%03x) at "
                      TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
@@ -4106,8 +4106,8 @@ static void gen_mtspr(DisasContext *ctx)
             (*write_cb)(ctx, sprn, rS(ctx->opcode));
         } else {
             /* Privilege exception */
-            fprintf(stderr, "Trying to write privileged spr %d (0x%03x) at "
-                    TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
+            error_report("Trying to write privileged spr %d (0x%03x) at "
+                    TARGET_FMT_lx "", sprn, sprn, ctx->nip - 4);
             if (qemu_log_separate()) {
                 qemu_log("Trying to write privileged spr %d (0x%03x) at "
                          TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
@@ -4127,8 +4127,8 @@ static void gen_mtspr(DisasContext *ctx)
             qemu_log("Trying to write invalid spr %d (0x%03x) at "
                      TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
         }
-        fprintf(stderr, "Trying to write invalid spr %d (0x%03x) at "
-                TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
+        error_report("Trying to write invalid spr %d (0x%03x) at "
+                TARGET_FMT_lx "", sprn, sprn, ctx->nip - 4);
 
 
         /* The behaviour depends on MSR:PR and SPR# bit 0x10,
@@ -7370,8 +7370,8 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
             break;
         }
         if (tcg_check_temp_count()) {
-            fprintf(stderr, "Opcode %02x %02x %02x %02x (%08x) leaked "
-                    "temporaries\n", opc1(ctx.opcode), opc2(ctx.opcode),
+            error_report("Opcode %02x %02x %02x %02x (%08x) leaked "
+                    "temporaries", opc1(ctx.opcode), opc2(ctx.opcode),
                     opc3(ctx.opcode), opc4(ctx.opcode), ctx.opcode);
             exit(1);
         }
diff --git a/target/ppc/translate_init.c b/target/ppc/translate_init.c
index 466bf97347..a44444ebc9 100644
--- a/target/ppc/translate_init.c
+++ b/target/ppc/translate_init.c
@@ -1778,7 +1778,7 @@ static void gen_spr_BookE(CPUPPCState *env, uint64_t ivor_mask)
     for (i = 0; i < 64; i++) {
         if (ivor_mask & (1ULL << i)) {
             if (ivor_sprn[i] == SPR_BOOKE_IVORxx) {
-                fprintf(stderr, "ERROR: IVOR %d SPR is not defined\n", i);
+                error_report("ERROR: IVOR %d SPR is not defined", i);
                 exit(1);
             }
             spr_register(env, ivor_sprn[i], ivor_names[i],
@@ -9216,13 +9216,13 @@ static void init_ppc_proc(PowerPCCPU *cpu)
         case POWERPC_FLAG_VRE:
             break;
         default:
-            fprintf(stderr, "PowerPC MSR definition inconsistency\n"
-                    "Should define POWERPC_FLAG_SPE or POWERPC_FLAG_VRE\n");
+            error_report("PowerPC MSR definition inconsistency");
+            error_printf("Should define POWERPC_FLAG_SPE or POWERPC_FLAG_VRE");
             exit(1);
         }
     } else if (env->flags & (POWERPC_FLAG_SPE | POWERPC_FLAG_VRE)) {
-        fprintf(stderr, "PowerPC MSR definition inconsistency\n"
-                "Should not define POWERPC_FLAG_SPE nor POWERPC_FLAG_VRE\n");
+        error_report("PowerPC MSR definition inconsistency");
+        error_printf("Should not define POWERPC_FLAG_SPE nor POWERPC_FLAG_VRE");
         exit(1);
     }
     if (env->msr_mask & (1 << 17)) {
@@ -9231,13 +9231,13 @@ static void init_ppc_proc(PowerPCCPU *cpu)
         case POWERPC_FLAG_CE:
             break;
         default:
-            fprintf(stderr, "PowerPC MSR definition inconsistency\n"
-                    "Should define POWERPC_FLAG_TGPR or POWERPC_FLAG_CE\n");
+            error_report("PowerPC MSR definition inconsistency");
+            error_printf("Should define POWERPC_FLAG_TGPR or POWERPC_FLAG_CE");
             exit(1);
         }
     } else if (env->flags & (POWERPC_FLAG_TGPR | POWERPC_FLAG_CE)) {
-        fprintf(stderr, "PowerPC MSR definition inconsistency\n"
-                "Should not define POWERPC_FLAG_TGPR nor POWERPC_FLAG_CE\n");
+        error_report("PowerPC MSR definition inconsistency");
+        error_printf("Should not define POWERPC_FLAG_TGPR nor POWERPC_FLAG_CE");
         exit(1);
     }
     if (env->msr_mask & (1 << 10)) {
@@ -9248,16 +9248,16 @@ static void init_ppc_proc(PowerPCCPU *cpu)
         case POWERPC_FLAG_UBLE:
             break;
         default:
-            fprintf(stderr, "PowerPC MSR definition inconsistency\n"
-                    "Should define POWERPC_FLAG_SE or POWERPC_FLAG_DWE or "
-                    "POWERPC_FLAG_UBLE\n");
+            error_report("PowerPC MSR definition inconsistency");
+            error_printf("Should define POWERPC_FLAG_SE or POWERPC_FLAG_DWE or "
+                         "POWERPC_FLAG_UBLE");
             exit(1);
         }
     } else if (env->flags & (POWERPC_FLAG_SE | POWERPC_FLAG_DWE |
                              POWERPC_FLAG_UBLE)) {
-        fprintf(stderr, "PowerPC MSR definition inconsistency\n"
-                "Should not define POWERPC_FLAG_SE nor POWERPC_FLAG_DWE nor "
-                "POWERPC_FLAG_UBLE\n");
+        error_report("PowerPC MSR definition inconsistency");
+        error_printf("Should not define POWERPC_FLAG_SE nor POWERPC_FLAG_DWE"
+                     " nor POWERPC_FLAG_UBLE");
             exit(1);
     }
     if (env->msr_mask & (1 << 9)) {
@@ -9266,13 +9266,13 @@ static void init_ppc_proc(PowerPCCPU *cpu)
         case POWERPC_FLAG_DE:
             break;
         default:
-            fprintf(stderr, "PowerPC MSR definition inconsistency\n"
-                    "Should define POWERPC_FLAG_BE or POWERPC_FLAG_DE\n");
+            error_report("PowerPC MSR definition inconsistency");
+            error_printf("Should define POWERPC_FLAG_BE or POWERPC_FLAG_DE");
             exit(1);
         }
     } else if (env->flags & (POWERPC_FLAG_BE | POWERPC_FLAG_DE)) {
-        fprintf(stderr, "PowerPC MSR definition inconsistency\n"
-                "Should not define POWERPC_FLAG_BE nor POWERPC_FLAG_DE\n");
+        error_report("PowerPC MSR definition inconsistency");
+        error_printf("Should not define POWERPC_FLAG_BE nor POWERPC_FLAG_DE");
         exit(1);
     }
     if (env->msr_mask & (1 << 2)) {
@@ -9281,18 +9281,19 @@ static void init_ppc_proc(PowerPCCPU *cpu)
         case POWERPC_FLAG_PMM:
             break;
         default:
-            fprintf(stderr, "PowerPC MSR definition inconsistency\n"
-                    "Should define POWERPC_FLAG_PX or POWERPC_FLAG_PMM\n");
+            error_report("PowerPC MSR definition inconsistency");
+            error_printf("Should define POWERPC_FLAG_PX or POWERPC_FLAG_PMM");
             exit(1);
         }
     } else if (env->flags & (POWERPC_FLAG_PX | POWERPC_FLAG_PMM)) {
-        fprintf(stderr, "PowerPC MSR definition inconsistency\n"
-                "Should not define POWERPC_FLAG_PX nor POWERPC_FLAG_PMM\n");
+        error_report("PowerPC MSR definition inconsistency");
+        error_printf("Should not define POWERPC_FLAG_PX nor POWERPC_FLAG_PMM");
         exit(1);
     }
     if ((env->flags & (POWERPC_FLAG_RTC_CLK | POWERPC_FLAG_BUS_CLK)) == 0) {
-        fprintf(stderr, "PowerPC flags inconsistency\n"
-                "Should define the time-base and decrementer clock source\n");
+        error_report("PowerPC MSR definition inconsistency");
+        error_printf("Should define the time-base and decrementer clock"
+                     " source");
         exit(1);
     }
     /* Allocate TLBs buffer when needed */
@@ -10496,7 +10497,7 @@ static void ppc_cpu_reset(CPUState *s)
 #if !defined(TARGET_WORDS_BIGENDIAN)
     msr |= (target_ulong)1 << MSR_LE; /* Little-endian user mode */
     if (!((env->msr_mask >> MSR_LE) & 1)) {
-        fprintf(stderr, "Selected CPU does not support little-endian.\n");
+        error_report("Selected CPU does not support little-endian.");
         exit(1);
     }
 #endif
diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index ebb75cafaa..6f7ebd1c98 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -967,13 +967,13 @@ static void inject_vcpu_irq_legacy(CPUState *cs, struct kvm_s390_irq *irq)
 
     r = s390_kvm_irq_to_interrupt(irq, &kvmint);
     if (r < 0) {
-        fprintf(stderr, "%s called with bogus interrupt\n", __func__);
+        error_report("%s called with bogus interrupt", __func__);
         exit(1);
     }
 
     r = kvm_vcpu_ioctl(cs, KVM_S390_INTERRUPT, &kvmint);
     if (r < 0) {
-        fprintf(stderr, "KVM failed to inject interrupt\n");
+        error_report("KVM failed to inject interrupt");
         exit(1);
     }
 }
@@ -1002,13 +1002,13 @@ static void __kvm_s390_floating_interrupt(struct kvm_s390_irq *irq)
 
     r = s390_kvm_irq_to_interrupt(irq, &kvmint);
     if (r < 0) {
-        fprintf(stderr, "%s called with bogus interrupt\n", __func__);
+        error_report("%s called with bogus interrupt", __func__);
         exit(1);
     }
 
     r = kvm_vm_ioctl(kvm_state, KVM_S390_INTERRUPT, &kvmint);
     if (r < 0) {
-        fprintf(stderr, "KVM failed to inject interrupt\n");
+        error_report("KVM failed to inject interrupt");
         exit(1);
     }
 }
@@ -1116,14 +1116,14 @@ static int handle_b2(S390CPU *cpu, struct kvm_run *run, uint8_t ipa1)
         break;
     case PRIV_B2_TSCH:
         /* We should only get tsch via KVM_EXIT_S390_TSCH. */
-        fprintf(stderr, "Spurious tsch intercept\n");
+        error_report("Spurious tsch intercept");
         break;
     case PRIV_B2_CHSC:
         ioinst_handle_chsc(cpu, run->s390_sieic.ipb);
         break;
     case PRIV_B2_TPI:
         /* This should have been handled by kvm already. */
-        fprintf(stderr, "Spurious tpi intercept\n");
+        error_report("Spurious tpi intercept");
         break;
     case PRIV_B2_SCHM:
         ioinst_handle_schm(cpu, env->regs[1], env->regs[2],
@@ -2050,15 +2050,15 @@ static int handle_intercept(S390CPU *cpu)
             }
             break;
         case ICPT_SOFT_INTERCEPT:
-            fprintf(stderr, "KVM unimplemented icpt SOFT\n");
+            error_report("KVM unimplemented icpt SOFT");
             exit(1);
             break;
         case ICPT_IO:
-            fprintf(stderr, "KVM unimplemented icpt IO\n");
+            error_report("KVM unimplemented icpt IO");
             exit(1);
             break;
         default:
-            fprintf(stderr, "Unknown intercept code: %d\n", icpt_code);
+            error_report("Unknown intercept code: %d", icpt_code);
             exit(1);
             break;
     }
@@ -2215,7 +2215,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
             ret = kvm_arch_handle_debug_exit(cpu);
             break;
         default:
-            fprintf(stderr, "Unknown KVM exit: %d\n", run->exit_reason);
+            error_report("Unknown KVM exit: %d", run->exit_reason);
             break;
     }
     qemu_mutex_unlock_iothread();
diff --git a/target/s390x/misc_helper.c b/target/s390x/misc_helper.c
index 293fc8428a..395872af45 100644
--- a/target/s390x/misc_helper.c
+++ b/target/s390x/misc_helper.c
@@ -354,7 +354,7 @@ uint32_t HELPER(sigp)(CPUS390XState *env, uint64_t order_code, uint32_t r1,
 #endif
     default:
         /* unknown sigp */
-        fprintf(stderr, "XXX unknown sigp: 0x%" PRIx64 "\n", order_code);
+        error_report("XXX unknown sigp: 0x%" PRIx64 "", order_code);
         cc = SIGP_CC_NOT_OPERATIONAL;
     }
 
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 10191073b2..9f95410e53 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -438,7 +438,7 @@ static void _decode_opc(DisasContext * ctx)
 	}
 
 #if 0
-    fprintf(stderr, "Translating opcode 0x%04x\n", ctx->opcode);
+    error_report("Translating opcode 0x%04x", ctx->opcode);
 #endif
 
     switch (ctx->opcode) {
@@ -1799,7 +1799,7 @@ static void _decode_opc(DisasContext * ctx)
         break;
     }
 #if 0
-    fprintf(stderr, "unknown instruction 0x%04x at pc 0x%08x\n",
+    error_report("unknown instruction 0x%04x at pc 0x%08x",
 	    ctx->opcode, ctx->pc);
     fflush(stderr);
 #endif
diff --git a/target/unicore32/translate.c b/target/unicore32/translate.c
index 6c094d59d7..a74d5d12a3 100644
--- a/target/unicore32/translate.c
+++ b/target/unicore32/translate.c
@@ -515,7 +515,7 @@ static void gen_test_cc(int cc, TCGLabel *label)
         tcg_gen_brcondi_i32(TCG_COND_LT, tmp, 0, label);
         break;
     default:
-        fprintf(stderr, "Bad condition code 0x%x\n", cc);
+        error_report("Bad condition code 0x%x", cc);
         abort();
     }
     dead_tmp(tmp);
@@ -1940,7 +1940,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
         disas_uc32_insn(env, dc);
 
         if (num_temps) {
-            fprintf(stderr, "Internal resource leak before %08x\n", dc->pc);
+            error_report("Internal resource leak before %08x", dc->pc);
             num_temps = 0;
         }
 
-- 
2.11.0

