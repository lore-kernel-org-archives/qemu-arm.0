Received: by 10.103.86.17 with SMTP id k17csp456546vsb;
        Tue, 20 Dec 2016 14:45:14 -0800 (PST)
X-Received: by 10.55.70.76 with SMTP id t73mr1808793qka.195.1482273914162;
        Tue, 20 Dec 2016 14:45:14 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v45si13479967qta.8.2016.12.20.14.45.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Dec 2016 14:45:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53798 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cJT9j-0004oc-HE
	for alex.bennee@linaro.org; Tue, 20 Dec 2016 17:45:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1cJT8j-0004lA-9k
	for qemu-devel@nongnu.org; Tue, 20 Dec 2016 17:44:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1cJT8g-00042q-46
	for qemu-devel@nongnu.org; Tue, 20 Dec 2016 17:44:09 -0500
Received: from mail-by2nam01on0083.outbound.protection.outlook.com
	([104.47.34.83]:47024
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>) id 1cJT8f-00042L-MN
	for qemu-devel@nongnu.org; Tue, 20 Dec 2016 17:44:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=pNMyaGADcvWkv0syj/P93iI5sblbCIGqCOxIjNt9tDs=;
	b=mCrV2AoRzbQGJtaCdvY3UufJrQYcPGBJg66Ut9W+BJWGGz5ESALvDeQvPxPpCsSkz9Un3Pi6QdKC891QsEw8TpPhoXtFfb776BOsAspJKuVBOXmmnOC9CuK1hRzCrRzRvf6dhBnU1xnqxBVtr2hXId0lyZwWMdnR0m3fuzarh1o=
Received: from DM5PR02CA0071.namprd02.prod.outlook.com (10.168.192.33) by
	CY4PR02MB2775.namprd02.prod.outlook.com (10.175.59.149) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.771.8; Tue, 20 Dec 2016 22:44:03 +0000
Received: from SN1NAM02FT031.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::200) by DM5PR02CA0071.outlook.office365.com
	(2603:10b6:3:39::33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.789.14 via
	Frontend Transport; Tue, 20 Dec 2016 22:43:56 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT031.mail.protection.outlook.com (10.152.72.116) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.789.10
	via Frontend Transport; Tue, 20 Dec 2016 22:43:55 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:45484
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1cJT8U-0001Fv-Ut; Tue, 20 Dec 2016 14:43:54 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1cJT8U-0006C5-R3; Tue, 20 Dec 2016 14:43:54 -0800
Received: from [172.19.74.182] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1cJT8N-00069L-23; Tue, 20 Dec 2016 14:43:47 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
	<peter.maydell@linaro.org>, <fred.konrad@greensocs.com>
Date: Tue, 20 Dec 2016 14:42:02 -0800
Message-ID: <b985247bfcb7375de984e801c4145fde931360bb.1482265908.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1482265908.git.alistair.francis@xilinx.com>
References: <cover.1482265908.git.alistair.francis@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22772.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(199003)(189002)(2906002)(189998001)(118296001)(81156014)(48376002)(5003940100001)(5660300001)(5001770100001)(33646002)(92566002)(8676002)(2201001)(356003)(47776003)(50226002)(81166006)(575784001)(626004)(8936002)(50986999)(76176999)(63266004)(9786002)(36756003)(305945005)(106466001)(39060400001)(4326007)(2950100002)(38730400001)(50466002)(36386004)(77096006)(6666003)(41533002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB2775; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT031;
	1:g29UhUXehYsM3TA0RFSNdIDx9djYppJDfyjugxJPM27p5BaNL7GpTc5nwq7ds8l5MRMzqMVuKZV2QDVjOnPRF91Zv38fiIdmyi6srFdjDMdbzfR3zovC4q8WlMxCY6hu31Z0k49Cg1iX3jtJValj67mPOp/yTC599TOheuq93QiOuR5cZdW0ntZ3Q7ruYhRJgtulB9I7lHWA6P6C/nIEye7Gul58dJsOurUwQkU6wB1xVT34BTBKG/r88aimW8gKxo297e9TWp2SgabzvQ6e0k7et4SqhLATsMCinvKlHM3Wxs0z774VfcUMxfh8V82Q4yddNNITLnGDar1KYASjLzs/DW+Z/TqszIccKlQJAoxAb5LdOoTCpXHidHMzDI74AxRH5xvRDp7piWh1kpvAT46GXurMcen+vbBpZZ5AOx3GItgN9uNKNZvTXik84c/8lAMBrmxVtOvu1e8J9Nftd/IlKRn8ShEV2adLiWqx1ABZizCK6r4AMZgKmbeadjCdjVmXp1BSemKjwC1hSDxNdK29MMvRwnwnRopcgls//pYZiJxSfBZLHyFbggj545WCi5G/qRvWpc2LsZ6wp9VHaQ==
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 42c3d324-9a10-489b-0691-08d42929ae35
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:CY4PR02MB2775; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2775;
	3:vP6v1TquaYFFohhOwZ6AYgN1lYShInH7IxqL8FIbVin23BmryJS4QZ4Gc59S40uiWaAeAt/Yh0vR5qCFp3tYCcWLSDQ5OEiRhqPsBHLnX+PSm1RgxIyepy5jBVil4h2oNIdtl9s1q/dFL8LMerIsxuQwPD/0/pJJwyjyhPgNwAJBGqkDqeVE5mRxJkQLTd8U8WDr6AV0SvV7enL2CCxs3Vf+ODQVFIxuOUvND94mfG8vix14Y8wmZJ1mG57MrH/ju8l6NQTaDiMkMC7HjCjPynXYEsQqMH6NQT/TgHaHGdLb04ZSE2X5j0nXClmwqXlLu7f9zxpW3Ur04QuV0MOUfrSHS8XVwzTsyv3P7JUYXl0C379MY3NAz8NEXYmqlx3J0caXWJsbUUgLfrgta4CoZw==;
	25:v3ouBzp79XkWh59X7kQo/tEdLeMyqpzeDM1oRB5RsWmWpuEZ0fldTJPB4W1EyxeM73P01mMYKfbbo+dpMqFXQt5smFTfzrtlI9OJpMi3JveOjYOMfUxXWGLLwQ9gFwUSmD/laBV8MBi32r3XJDPzfKrBRtK8W00Ujr8z2l+7deLMn+UwpAZIfWkTCdzecR6IUldQhCgCXQh8LjLHNEKWH3DaoAKbWEL0EwHjqDl9The5mPet57GC4sShPI/qtkc8linE6zA81gf+J6B65nuNWMQn8eVOYxRcyKs2nq6BALks3jkGofoQQ9PsaH3hQvCAu/LaKXp//tfoJIx65nT07lT5cHeanmb+yhz8G/ErDlXQU1ZjF7T5tP+HdjKtpkyr+bpb5RBLpFl9A+6si0oUK9JGXsk6QClggjQWzUoeFRYj4Gu5fC/yq6gWIbWcUZdJo9hIHLWLuMgeZ3dW5jlpLg==
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2775;
	31:HEN2pnkp2JxKTK7cS5lYt+LvSlcypvoZYfxomDu8cZIVGkCT8GeS5+fwTK4aYYxVLBQATWIR79DdCFBml/2yxxhzrEVWZBX5ytrHs0R4HxorxNUhwY2vEWcAsOpKjortkjs4x0D1oQDmsKZaC1oDiBE+GgPzk2YZZ2A6DWXqXZ+t76BgabK4+DfTSFiFjisV8HSJs1PV2G037hr38I7bgcNIpQACx4XGK6UV3ERLDkWtHN2q0vsaFjP3cVrZIrFT5HyEJj6XPyAFwbzQTJ1qLw==;
	20:kIOegEFc8HewJERIoBn9xZ0C4OIZ1HnqBfXHx69CdwIe6sOdZsRmprwk96wN74/drh3MhPcUjQtV6VUWvhLfybSzodzQ9zJ5oP0loo3uNto6sRFR1PrmbyCANzNvai03elTh51J5o4hLoakJ7CCOAud5NCZYywlwcBzSo+s+96tCBYviE5H824Uz0QDmeSEfkPj45Ft7L1JOrbE+i4Va/K9KOq3QwvDi28CeNWkfeLILNd5Uujo+vKadPZcDa9T/FYAZHnnavs0V5EP5sUSpDCn17pqU6km6PVaKLwpz+QHjVVRHR9rzeFF5n9fpUaupjleIrp3sricfuwVBO/0r27gfwlj+krpAKwGO+SAYix70wPFrbMvbCYulQ/ZuHjhJ+VCQIPUddZMO1hjlXs17VL2h35fXJrYrmn+872GJIq5Kv4+qZw0EONtjfs/f8dYvDs9KtzwZkJGusGvIrLcnK/VxbGvxYCVeITXwD+hs18j3HhQHdLrgc1FhMPlZtQZG
X-Microsoft-Antispam-PRVS: <CY4PR02MB27752F5028A7881FB643EB72DC900@CY4PR02MB2775.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(13018025)(5005006)(13015025)(13024025)(13023025)(13017025)(3002001)(10201501046)(6055026)(6041248)(20161123560025)(20161123564025)(20161123555025)(20161123562025)(6072148)(6042181);
	SRVR:CY4PR02MB2775; BCL:0; PCL:0; RULEID:; SRVR:CY4PR02MB2775; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2775;
	4:ialrIdhIg2BNmHy7cWHRWtSM96DpVyG88BkPtbjiID2PUOq0b3hUlUA3HjYLYlbo7akKxvi1xytGTJFrKAMUZKVRazJ4KIcZISMPpzeSsoPfK2a2+MAITmtOHjqR1x+9WdpK3z4mGfSVGo1cgYpuNNQXth3nKdSpGjkEyaWBVIH/Vvsare8IO2tsXSLJ2r+xFHi8V752jDsfiJl+fHxWSsIIuCSrmd/SY24Cr1GsMkj1rRFzWDFQzS/4P9ZOxX5OWy9XEUSuDZwHKQWMrbORlNmSFD89/cU8sjR/C1Cr6tgaHbynT+M3SbDWhnrJB2Qn4Vngglu9eFW7b8X60fH2SEDlSBd52qQHPO51ShjtICopOFQ8VqsNaYHK76qRYbjw94tlOFvJ7kOWxDFUVTiimnDaENPBzDWOsFWJ+SefYmHyXslnJ2JikI813msWV3CIdlhGfzQSP+rmSIP1QrDCjm12A8xqTADnOWfvREC4r9/X1mJCbViai4WVpH6pHiGIbCJ08fi6/nKCJGNwq6DCHV0eU/o6QXInWUrpee88Lv+77U7VGgWLz6Gda7z0Uekxv5eNZlLhze7ZJMwC70x2pfSAd0OfR2QBhOgwAPWSesILRxwz7r9LA83rwFGlAEGMN8VSxyEyTVCTGsNvnAFuc0TBa2ChnDqgjDdPOdYJ+ly4B7TLotWOzqUpFKuZ4d7LecVg4H4gWKxaAG79op+btLNdBDqIUgqzjczRATKG/rvalf7FroLhvVVB4+JNGXiE
X-Forefront-PRVS: 0162ACCC24
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB2775;
	23:q948mALwRmwjL/hcu9DHCDF75NHxlrC2Wr2xOrwFg?=
	=?us-ascii?Q?3gFqYUM27HG4Kmjh98bRxl4vuOs9Z+/rnlFhNbW1LNXFx2ieoKNWrfrOBU0v?=
	=?us-ascii?Q?waeWkPZjwcWNV1vCBuKxi5g6ER0/kXcSRNsvm95VKFR8OR7x+jAuthFC23T/?=
	=?us-ascii?Q?uh8iGwe7khF6KWmT/hi1Y6MPuBUbDKC9rjhDWRaeUKofhWJXH73AHHWDVxHw?=
	=?us-ascii?Q?denSTDJ92h0ela6TjymDlSRoOVyb7yQYSYMnWkuE1SFHzd0CInlyvd/BftLl?=
	=?us-ascii?Q?MBXQo2g+2nS6A8kKmSom+OL7Pksf4TXUi2ImumjjaHTnT6xdAdqwTiWkTcGS?=
	=?us-ascii?Q?hjzG2U8UnYpdqr1zbmo2uDcy5mSZ9sLek3PchTAPhnECcaBn6Siq8fbIAbMC?=
	=?us-ascii?Q?JjpLU0tyljue+C/58zYhOdN/NB+RyxiCFjFYDjcH+ErtY1u+L2hs6K+0yzA7?=
	=?us-ascii?Q?BFmQyhiCw+Fu89X+m7fc1oaY3H5vqKt/NJSGTWxfida5enn9EQtEhgD8xYSO?=
	=?us-ascii?Q?kkePCrJFXGe2SVxkyzEge4f9dYe0p+OG7HfYDvpxCruHo52o6PSUmsrmcMUd?=
	=?us-ascii?Q?0G5mxy4rtOZNesMr5DjlONre3xV2OZ8DRBY80r3aBHyOpr5nKxKxAyDeyYtr?=
	=?us-ascii?Q?NSoVHNOMb3Mu6IBby1dcRO6Ma9lyHvSWXZLHNBNqncIrst2xvTVhzESLSRbG?=
	=?us-ascii?Q?sQGD7y1IYcKiur3j5FfluKQ2oP04lA54crdqw81NscHea08vY5pP4A/4aG92?=
	=?us-ascii?Q?WDcnkm1xGUCv00YAxyHDDn1nQnVCZ9GNhLHlHSOWMFnE9rbPVLa6ddvT2SJN?=
	=?us-ascii?Q?XGeGL8d8R1aZq5qiiDvROcShiNNzWSz9eDvLupXqTntxfXFiBKDkjLSMk5Fv?=
	=?us-ascii?Q?UnMyYGPXb2pw3gKry6QxsvNMoI6MeFZIro8YEx3VMo9QDeld4kmP/vSjXdVu?=
	=?us-ascii?Q?0SBJBbxk5ybohYzWOLrsGDeJdBFHVRqIv5QgA5WA4ijzdIwLQsPXYztllDGV?=
	=?us-ascii?Q?epYdLCmxUMCv3yh4pd8seXH1bPnGUT+u51MdmMMfU7FMw2j8xrPBTZBDjNn8?=
	=?us-ascii?Q?PCa4/13P1fV1pxu2btxG9DkAoAZ?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2775;
	6:cpWuEYHFAdoUJxNNvPMXJmyBCNme8ax3sw/UMCC3Z6Bo51zDEyRhL2XxZ8VTlPQ2NyTJnfsrCUgY8N6E2Qu/+b7Z/TJlpdfmC2BNWH7OgqEUPVZJze05Tny8tArmM4VDE2TcZ2R6jNd2xvuYBcRsRFdudneRtE3ODEYgIRukEfajqTORsEv0dv1XT4NC47ptBpgczFo3fXIXrGtJalhMwDNa0w5PLyctibaPak3ycivyPmqbT10rEuOjTlyhhxz9RP/8BoXRgYhKfwPBtNWV/yY1M+R7SNzEmYbJELK66xX7GllNmi8QJO3O6L+qd3hTXNR5d3AuZ09MQjb1/TTxVOm+W14BwjXq9lyHx2H5ZnJj/E0DhZsP1oZxaXDbi8C+5JN5UHavwxirQTQ5AFQFaAA3AgN4AEQFGBtubYwhBxuheMCTEC+lK1Bh2RPjui6CfmR9tZAAQTQd89ILy32bzQ==;
	5:qV/CMAdv3XefGmtpCppQ6b4ez8rbZuvSDFWjTJq4B63uWIxv4kN8eiVxG4vrt+Ng4p5K+8UMwFTO0QTNDtileKnNC/mak7LrKe3fJbH+cKjMpTY438Xrrwqv/JGWABmRqxiajvE8cbqB8OvATH0fdw==;
	24:NItorUKXV5lA/oLINkC5+oqtUz6/+OpbA09JRkbkUNsSdUZtJptxmKWxyIEBfDiGYI5ENea2dKhuQFIkkH5v8VqtRkn+6dayjxjKPQt36A8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2775;
	7:U/WNwEW33B6X92f8CAX4l09f+DoCkAqPKUdIa6wADSy39WeWmaWpzauQM0t0AeU7gwAkBXQ/D5F6iU2ZkzJYcUlqFeqbKqlL0k18yvhNqYr7VkbcrxXtJjKqj8f2Ti4ggd+CcVVPDVIu/7lvcbUF5leuvQChVagOVC/g+PA459vSFLZjgMW33bA3R+qOS9AWmPrazfOpIWom5KI/tzanlqMO5e/4n/Z+nLEAF94YeYPy7VbR6m5UF1N4NQRCwNHgfxsMavLpvuc9xJrCfaepB62THh5LSm1Do6O0QLy7pi5qXY0VXg5lZdgn1PxFJvOA2/wJDwDVxUy/bc78lyfv5uRVtj5wj9ZFxht8e/o4pbV0Cgc6EANLBIDzNxCkHXw05Od/KaLCeE4jli+x0ly6TI5l+4xUq74vSlhLRvvHNN0lf3iQ6shBNIZEqKlPyLnrAUTAymeN0wMAISGqwvJrkA==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2016 22:43:55.5441 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2775
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.83
Subject: [Qemu-devel] [PATCH v3 1/3] arm_generic_timer: Add the ARM Generic
 Timer
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
Cc: alistair23@gmail.com, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: riuFx/lt+U3L

Add the ARM generic timer. This allows the guest to poll the timer for
values and also supports secure writes only.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
V3:
 - Use ARM ARM names
 - Indicate that we don't support all of the registers
 - Fixup the Makefile CONFIG
V2:
 - Fix couter/counter typo

 hw/timer/Makefile.objs               |   1 +
 hw/timer/arm_generic_timer.c         | 205 +++++++++++++++++++++++++++++++++++
 include/hw/timer/arm_generic_timer.h |  62 +++++++++++
 3 files changed, 268 insertions(+)
 create mode 100644 hw/timer/arm_generic_timer.c
 create mode 100644 include/hw/timer/arm_generic_timer.h

diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 7ba8c23..bb203e2 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -17,6 +17,7 @@ common-obj-$(CONFIG_IMX) += imx_epit.o
 common-obj-$(CONFIG_IMX) += imx_gpt.o
 common-obj-$(CONFIG_LM32) += lm32_timer.o
 common-obj-$(CONFIG_MILKYMIST) += milkymist-sysctl.o
+common-obj-$(CONFIG_ARM_TIMER) += arm_generic_timer.o
 
 obj-$(CONFIG_EXYNOS4) += exynos4210_mct.o
 obj-$(CONFIG_EXYNOS4) += exynos4210_pwm.o
diff --git a/hw/timer/arm_generic_timer.c b/hw/timer/arm_generic_timer.c
new file mode 100644
index 0000000..da434a7
--- /dev/null
+++ b/hw/timer/arm_generic_timer.c
@@ -0,0 +1,205 @@
+/*
+ * QEMU model of the ARM Generic Timer
+ *
+ * Copyright (c) 2016 Xilinx Inc.
+ * Written by Alistair Francis <alistair.francis@xilinx.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/timer/arm_generic_timer.h"
+#include "qemu/timer.h"
+#include "qemu/log.h"
+
+#ifndef ARM_GEN_TIMER_ERR_DEBUG
+#define ARM_GEN_TIMER_ERR_DEBUG 0
+#endif
+
+static void counter_control_postw(RegisterInfo *reg, uint64_t val64)
+{
+    ARMGenTimer *s = ARM_GEN_TIMER(reg->opaque);
+    bool new_status = extract32(s->regs[R_CNTCR],
+                                R_CNTCR_EN_SHIFT,
+                                R_CNTCR_EN_LENGTH);
+    uint64_t current_ticks;
+
+    current_ticks = muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
+                             NANOSECONDS_PER_SECOND, 1000000);
+
+    if ((s->enabled && !new_status) ||
+        (!s->enabled && new_status)) {
+        /* The timer is being disabled or enabled */
+        s->tick_offset = current_ticks - s->tick_offset;
+    }
+
+    s->enabled = new_status;
+}
+
+static uint64_t counter_value_postr(RegisterInfo *reg)
+{
+    ARMGenTimer *s = ARM_GEN_TIMER(reg->opaque);
+    uint64_t current_ticks, total_ticks;
+
+    if (s->enabled) {
+        current_ticks = muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
+                                 NANOSECONDS_PER_SECOND, 1000000);
+        total_ticks = current_ticks - s->tick_offset;
+    } else {
+        /* Timer is disabled, return the time when it was disabled */
+        total_ticks = s->tick_offset;
+    }
+
+    return total_ticks;
+}
+
+static uint64_t counter_low_value_postr(RegisterInfo *reg, uint64_t val64)
+{
+    return (uint32_t) counter_value_postr(reg);
+}
+
+static uint64_t counter_high_value_postr(RegisterInfo *reg, uint64_t val64)
+{
+    return (uint32_t) (counter_value_postr(reg) >> 32);
+}
+
+static RegisterAccessInfo arm_gen_timer_regs_info[] = {
+    {   .name = "CNTCR",
+        .addr = A_CNTCR,
+        .rsvd = 0xfffffffc,
+        .post_write = counter_control_postw,
+    },{ .name = "CNTSR",
+        .addr = A_CNTSR,
+        .rsvd = 0xfffffffd, .ro = 0x2,
+    },{ .name = "CNTCV_LOWER",
+        .addr = A_CNTCV_LOWER,
+        .post_read = counter_low_value_postr,
+    },{ .name = "CNTCV_UPPER",
+        .addr = A_CNTCV_UPPER,
+        .post_read = counter_high_value_postr,
+    },{ .name = "CNTFID0",
+        .addr = A_CNTFID0,
+    }
+    /* We don't model CNTFIDn */
+    /* We don't model the CounterID registers either */
+};
+
+static void arm_gen_timer_reset(DeviceState *dev)
+{
+    ARMGenTimer *s = ARM_GEN_TIMER(dev);
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        register_reset(&s->regs_info[i]);
+    }
+
+    s->tick_offset = 0;
+    s->enabled = false;
+}
+
+static MemTxResult arm_gen_timer_read(void *opaque,  hwaddr addr,
+                                      uint64_t *data, unsigned size,
+                                      MemTxAttrs attrs)
+{
+    /* Reads are always supported, just blindly pass them through */
+    *data = register_read_memory(opaque, addr, size);
+
+    return MEMTX_OK;
+}
+
+static MemTxResult arm_gen_timer_write(void *opaque, hwaddr addr,
+                                       uint64_t data, unsigned size,
+                                       MemTxAttrs attrs)
+{
+    /* Block insecure writes */
+    if (!attrs.secure) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Non secure writes to the system timestamp generator " \
+                      "are invalid\n");
+        return MEMTX_ERROR;
+    }
+
+    register_write_memory(opaque, addr, data, size);
+
+    return MEMTX_OK;
+}
+
+static const MemoryRegionOps arm_gen_timer_ops = {
+    .read_with_attrs = arm_gen_timer_read,
+    .write_with_attrs = arm_gen_timer_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static const VMStateDescription vmstate_arm_gen_timer = {
+    .name = TYPE_ARM_GEN_TIMER,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, ARMGenTimer, R_ARM_GEN_TIMER_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void arm_gen_timer_init(Object *obj)
+{
+    ARMGenTimer *s = ARM_GEN_TIMER(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    RegisterInfoArray *reg_array;
+
+    memory_region_init_io(&s->iomem, obj, &arm_gen_timer_ops, s,
+                          TYPE_ARM_GEN_TIMER, R_ARM_GEN_TIMER_MAX * 4);
+    reg_array =
+        register_init_block32(DEVICE(obj), arm_gen_timer_regs_info,
+                              ARRAY_SIZE(arm_gen_timer_regs_info),
+                              s->regs_info, s->regs,
+                              &arm_gen_timer_ops,
+                              ARM_GEN_TIMER_ERR_DEBUG,
+                              R_ARM_GEN_TIMER_MAX * 4);
+    memory_region_add_subregion(&s->iomem,
+                                A_CNTCR,
+                                &reg_array->mem);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static void arm_gen_timer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = arm_gen_timer_reset;
+    dc->vmsd = &vmstate_arm_gen_timer;
+}
+
+static const TypeInfo arm_gen_timer_info = {
+    .name          = TYPE_ARM_GEN_TIMER,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(ARMGenTimer),
+    .class_init    = arm_gen_timer_class_init,
+    .instance_init = arm_gen_timer_init,
+};
+
+static void arm_gen_timer_register_types(void)
+{
+    type_register_static(&arm_gen_timer_info);
+}
+
+type_init(arm_gen_timer_register_types)
diff --git a/include/hw/timer/arm_generic_timer.h b/include/hw/timer/arm_generic_timer.h
new file mode 100644
index 0000000..ae4319c
--- /dev/null
+++ b/include/hw/timer/arm_generic_timer.h
@@ -0,0 +1,62 @@
+/*
+ * QEMU model of the ARM Generic Timer
+ *
+ * Copyright (c) 2016 Xilinx Inc.
+ * Written by Alistair Francis <alistair.francis@xilinx.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef ARM_GEN_TIMER_H
+#define ARM_GEN_TIMER_H
+
+#include "hw/sysbus.h"
+#include "hw/register.h"
+
+#define TYPE_ARM_GEN_TIMER "arm.generic-timer"
+#define ARM_GEN_TIMER(obj) \
+            OBJECT_CHECK(ARMGenTimer, (obj), TYPE_ARM_GEN_TIMER)
+
+REG32(CNTCR, 0x00)
+    FIELD(CNTCR, EN, 0, 1)
+    FIELD(CNTCR, HDBG, 1, 1)
+REG32(CNTSR, 0x04)
+    FIELD(CNTSR, DBGH, 1, 1)
+REG32(CNTCV_LOWER, 0x08)
+REG32(CNTCV_UPPER, 0x0C)
+REG32(CNTFID0, 0x20)
+/* We don't model CNTFIDn */
+/* We don't model the CounterID registers either */
+
+#define R_ARM_GEN_TIMER_MAX (R_CNTFID0 + 1)
+
+typedef struct ARMGenTimer {
+    /* <private> */
+    SysBusDevice parent_obj;
+    MemoryRegion iomem;
+
+    /* <public> */
+    bool enabled;
+    uint64_t tick_offset;
+
+    uint32_t regs[R_ARM_GEN_TIMER_MAX];
+    RegisterInfo regs_info[R_ARM_GEN_TIMER_MAX];
+} ARMGenTimer;
+
+#endif
-- 
2.7.4

