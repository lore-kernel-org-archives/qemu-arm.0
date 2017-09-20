Received: by 10.223.172.38 with SMTP id v35csp1195475wrc;
        Wed, 20 Sep 2017 15:05:36 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDr60d1ETDM45KEJxD2SxYawD9tZVYGmHFaWdj4IZOgUelrSnNzkzVaQKyFOfvXeu9M6L0P
X-Received: by 10.223.142.73 with SMTP id n67mr90931wrb.278.1505945136660;
        Wed, 20 Sep 2017 15:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505945136; cv=none;
        d=google.com; s=arc-20160816;
        b=J7iyi+3PS+aVimJrButUC3U7m5oYeXziZDAJPGKixU5MjW/l/VZskwsXJNVr4GpPUx
         Zbl4bzVMRLsJNHzLqDaXDIjJU3h5fJCdymEBE4DyHisuBuGCChX9WJ6p0167czo9OQOI
         BNmOrWuAwAa1uq8CjfDX6j6zlXakayS5cF4/9Fb+CUyUEibT69UqHaKmtUu2QVel3lnE
         Sb+3sJWjTPZ6qc7YSK9pCFHbFLUDKIsKXA8uLa88oxjlYQCCflqoRyG3LMew0oz924xq
         lVgDRHKFXXTpopRfBe4VKA9rYwZapNM3OHkVPsH1PYbmJhYVok0KKs7wJCThnFbyRReZ
         NNXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=4nptbQwFIviJ6+JFbT2gBrLt1KebrWj4+KgU5howkTE=;
        b=mRVX8+af3fmZsExSaYBIMCvcgNwvWPvbHO4tv6HRApIjl0sOhQikbMYUMwU80Ut4/G
         hkalF1kiPQajftE/4kSLzHEv9E6SY49TQR4yurGedvErdAk7j5wCLFtCcXJSlpyS5mKc
         eSWeV2gYQAVSqqltDIheb/yzLlQ1sX8phFtH3XA/QjmQcC+IGMDMZPdb7uh/QjjWOwz/
         sUe664LpVYdGBv04/CKXwu3Se6ziY+lLQ2dTB8T+aExriB/xpbzqFrRH6B03elsXseuD
         s+CWzosiAyayZiv8vecs6N6Du2hQ6Sk8kOHd5+gEx3BqMnenYYcoH8E8xUL2R4fGJkU7
         +DxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=sOCyRe+q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m125si164182wmm.48.2017.09.20.15.05.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 15:05:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=sOCyRe+q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dun7f-0000o0-Hz
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 18:05:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dun7V-0000nZ-IV
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 18:05:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1dun7R-0007d1-J4
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 18:05:25 -0400
Received: from mail-dm3nam03on0084.outbound.protection.outlook.com
	([104.47.41.84]:12992
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1dun7R-0007Y4-8T; Wed, 20 Sep 2017 18:05:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=4nptbQwFIviJ6+JFbT2gBrLt1KebrWj4+KgU5howkTE=;
	b=sOCyRe+q/UIP7jmdMCmPZeFNcikB7ndZW5IyK+OwJ2O1YyArV6W5Btx8kqCqFd3zbrffoVeKpB38OBI7YqiFpdd6S+vwTf23UVeeD16y/gigUENH55xw4oP4MNe5KVzjs5C9AxDi7NHxf3Z44Ivb8aXhTGeUsrMbH+dmTOPWK2A=
Received: from SN4PR0201CA0021.namprd02.prod.outlook.com (10.161.238.159) by
	CY1PR02MB1134.namprd02.prod.outlook.com (10.163.15.148) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.56.11; Wed, 20 Sep 2017 22:05:19 +0000
Received: from BL2NAM02FT059.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::203) by SN4PR0201CA0021.outlook.office365.com
	(2603:10b6:803:2b::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.11 via
	Frontend Transport; Wed, 20 Sep 2017 22:05:18 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT059.mail.protection.outlook.com (10.152.76.247) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.35.14
	via Frontend Transport; Wed, 20 Sep 2017 22:05:18 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:55879
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7N-0005iB-23; Wed, 20 Sep 2017 15:05:17 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7M-0002Ig-VS; Wed, 20 Sep 2017 15:05:17 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v8KM5Are025580; Wed, 20 Sep 2017 15:05:10 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dun7G-0002FP-4Z; Wed, 20 Sep 2017 15:05:10 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <edgar.iglesias@xilinx.com>,
	<edgar.iglesias@gmail.com>
Date: Wed, 20 Sep 2017 15:01:31 -0700
Message-ID: <cover.1505929556.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23340.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(6009001)(376002)(346002)(39860400002)(2980300002)(438002)(189002)(199003)(16586007)(478600001)(63266004)(8676002)(36756003)(33646002)(6666003)(8936002)(189998001)(50986999)(48376002)(106466001)(81156014)(81166006)(2906002)(36386004)(2201001)(39060400002)(110136005)(9786002)(50226002)(54906003)(4326008)(5003940100001)(305945005)(77096006)(5660300001)(50466002)(316002)(356003)(47776003)(107986001)(2101003)(5001870100001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1134; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT059;
	1:NtTmmpcg0+xtHYxXGqRa3K5QhLi1jRNufTE+j10d/gRKoxBTyBPLVlZN6WYoWQCLCwjeWuhgGoQMysmYw9tXIPreOqQw2W9ALGg7XdeiD0oMw5UH/dXe4pLw9YbB67sj
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e14a375-d2fb-48ec-cc9a-08d50073ae1e
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY1PR02MB1134; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1134;
	3:efKAfo1DUSi7Vw2MT9bjeCbrwRXcITduTcZ983AO9xDJ8BMAKfDVuE+jkq4+ZUPX1GQaJ0MiLMBJ5axdIOS7uD6UePRi/SULkBmoO2mwWWDqiLMqQkoDXgOp0La2jFkHeB42gS4y7WQIRJYRZHp0iyeVIQGmGFkXWpmhmdUqHxCzl1Lt61YZ4bGN+mZZQYLoZlpBvo8N24JDPPkFljDC+/yvptnQIQmgrTV3wmgJPoVnK7lAta+yaDxJEgGrcs1AnwrWH/8OOuW3WK+tp6Ty5GsR9d7Jvg+NjRy2gtPvLtGwcqAQiapqDNTvpJf2tJqR3oXE0TyFNsojuJfv0wTJAAgmmo1RZuUJucCC+EJmz5o=;
	25:pu+JL7KtdfwMVbPTTOaIJ6PrO4sEpehKFGexOgtImToMbxjUvygEj7W9DBg1g4M4NxrpjNHQrus9hQC4GQcrWXOSzOv0E20TAs6u6TNqZCneFWfgu8Sd3R9qQTFFhMhLxm6ZnZmFv9zvOiUqbozhB6nb0unDJOAXH5bILSmLxgtdTQR4RYVSJg2asj7FgI77/RBVtj+wvIDG0DA9/FDuhGA21Ms2Z5SzMSoT4c2rtrnDbqseTgWd6iiJM0MzQVrtn/1ZT3aAy9+3bEZlICWgwKl9TzFFvc+ti2DwHik8tgN1g+ZOKIj9j0rX+2BTHt42nsV6SrEsW6UOqi2pOyeKxQ==
X-MS-TrafficTypeDiagnostic: CY1PR02MB1134:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1134;
	31:wdI+5qMCvRiBKumLEE+1M+JZCnfwMpH6Q1sc4hJXlmy18Cz8vXj+SnOXUGmLier3qYj/uDQeriXKSkXcHSWW8gtq1Y5UjzNOWLOt6owHVOYR3/jSZ18X+IlmWvNWupXdwYIywaHso/hZfBoBVLZUDkjDpx/rEW+uue8BaHQUaYDY1ZWGyjXtJm3/oaH604gnCZJYQK164iICaW2QGaQIL7+zQVdvNd2/+qBd8LupXdE=;
	20:DcVKCEX+XmvhTDkNO8rdE63/NwduEzsopYtDqbopYNifUJW11XAGix+LMlqTFGQTm1xXr7aowOwEI9Muji2QzghA25Ajz54UCD7jzgyI7KC4JPoiAcbfYWyZP9AyAq1XZo8WDUV/4ytvo0yHM2tTDlxjAeSJsr03mzcxLOGlQhHB9Wdjzp0g7z1cKv/+HfTici0DjJDCCAk4jTR/mxEqC/2Ek7N4Vr7MBlKiu4LfNRgE+n0/Tyer0YI62sXjSFleKw4b4KmEgeNtciCIdMEbMS9ACp0I/rj6h+gj3cKc1d4eU0P/j/NRLj2TLWpbnq51G/nAIc5JvrgLg+q9Wq2uAXO+wP1pIv0e4vdWAk8mXjE+H06g3jU7sjVxn5KcIoTjEy2a1cOY7fYgzkzhGQByrdXu7W9Mxoy/Noz9aINTZkUeAKyK199lLxRWLi4soT2EL2NuV6Lj/SZvPpnpBdVjmjZTsnMilAK75lo3xj4PGkyTfganKYi7NWtzqNZB5RpO
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(21532816269658);
X-Microsoft-Antispam-PRVS: <CY1PR02MB113498B4C4D090A18855E3A5DC610@CY1PR02MB1134.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(93006095)(93004095)(3002001)(10201501046)(6055026)(6041248)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123564025)(20161123555025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR02MB1134; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR02MB1134; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1134;
	4:NUL5CqHmt/wFOE4Cy3sQs4/NXZ+r7cPAEYaZHWhvcS9zzIHXgh7P08A1mhCqtU4jHpk9xiGfXtYvICXgbSIPR/Y/U9mAd+mCLV+m7gTBjKVqKNL6B/gaQ0L3gFelDf3SHDS5NKLJ/8kAgdaASoQVdL+1SlYpIhC1/Bakpfm9Bb1XbZYZ4id9rM9zpO8yZZPOszRDi1vllnmd4G79s17KWkau0EcNfRquASSqMn5jvgv4ZA2ZFakpWii8+1kSnUT2d8Nvv4JDUW4GxkCgTwEsQZzVNNig9bZAVpeV7PwuToT0Yxhpm61DXmltfzanz3EalvVPkUJXEovXnC1Y2Ej/Tw==
X-Forefront-PRVS: 04362AC73B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1134;
	23:W66mXMglz2ENjbuj3l0IBYhBdHA3ZoLBTAcUYnTeA?=
	=?us-ascii?Q?2gcat7keO3YbUCSEnjr8Ro+d9KsWSl54TMevLYpUAeH01Zb60dMSG0YETLYE?=
	=?us-ascii?Q?HBmXwf+Zv8aFG73CnGO9U1wpkjol0IBRBvp0/7DN67tFoQvFkzOgf+IU349w?=
	=?us-ascii?Q?UscERB8hpFsVIvTXSXCMsmLKl0TMO/uWoSrdEsm5hbogT5uYVhMLlu4KoTkL?=
	=?us-ascii?Q?RhWTZZbQnr8fEm4DtLNdUq/VKg6uwp9A8bfISEnrOhy2IJpYh/ibSufP/78X?=
	=?us-ascii?Q?UtWDFA73qbJdAF7KEe8vVVJpJeWB9oQQZt91ysbsxZfqHCFA8ceb02XcJMDA?=
	=?us-ascii?Q?tgHCtrxV0weEJTz7wbpohk4/mhbYE95ko3+e27q7JF+LYosLs+CFtioq45cu?=
	=?us-ascii?Q?6P3sAUP5TwM2XXioXrN5UkllUVmPs+8KwbSTBcx20wNB4IioQOUxOvvpX1z6?=
	=?us-ascii?Q?CTtVmj5odCLm/3D9TrbciXhXkb3wGdTr/lc+xjYrcClFbw6gpdvnFbyQkLnq?=
	=?us-ascii?Q?Xm0xgSzT9/vTuwSwEjwNoSQqmJM5z0BuzCbi5B+yxkCsO4TBqZBUQtw2POCm?=
	=?us-ascii?Q?9h+7jTEkUoRuyGzxVLRZRitQ7lg1PkwdDwvj4rNnROIRHsdoHpcSKCCsNtIN?=
	=?us-ascii?Q?mqwGRhERNWjxW1jJvjyWZ6VUpUd8y5n3QvlyqhCP9hK0iZde2pY1v0Q3gz+2?=
	=?us-ascii?Q?8r/P060P4jsUHfr3o+xGNZYb0L/+5KISrgLKg/Jy6/8cEBZYQZRyZ3dKaYzg?=
	=?us-ascii?Q?SNPbx95McxBKnq+HtSjPMn+x9z9axN7mjeRva4Z8ckG77B1HQWmUhCYGTUpQ?=
	=?us-ascii?Q?Br0vQcdl1uc7EsnRqBizz/mLhw3RU/uXwNLIANGRX6EoeNx6bl89Nv6PrbP1?=
	=?us-ascii?Q?bxAn18jFovEHOIDFmHoz4XRkRephhOmozSawacfoK/VhMAoJ597wK5PVcJkc?=
	=?us-ascii?Q?SarbN02KUNw2qSC3TqE9OVZHEMFewhcKVcdF2i9hXvL/FaJGS/zRxkhtsutK?=
	=?us-ascii?Q?iqx4HSmfmzs2Z7+E0GcyueFD24Jw5scey34zNNumpqqmJxe/lYJpyxGHFQqW?=
	=?us-ascii?Q?CN/668ztDz3tJOfCJrAylBpC+yYOskCunCFD2xS/5Ox/zi6Yv8Pm1HT9KqnZ?=
	=?us-ascii?Q?iQawXlHciw=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1134;
	6:+D+Nbf4ZcIzbfH6epQqbkQA4WbDxZUJ8ZHxTYHV0EBGddxZ4xymNTv+l3Ia6G5T/VLBzK+6JuW1oH6e+LHvPNKBMASHEB/JRLwjftD/8ulQsFw7q9ZDT0ZrgOJyHhlWO6EkVh1k7hauEqM6Q2jPEhTWle5yQGbIUz0PnEOJjwtvMxcrrycOkvWPVM69QIa+McPOTjJBQ0D0b4EbXDkTHHChJ+DykdQ0Q0zkLAqnirLHssHkB6cWfG0pCQ1FQ2UqJh9+pp+LLwCAAreEyRg6TKDrd6KRDxwOYLqjrDJT0R10nisRUi69eJfRlW9UtZOhSv3yYOMoVTu3NfbdPXr2ZGg==;
	5:GWPDoCCv3cqJifOciEgj8A0RIEuhZiYgus52FvE2ouIvggLCun6KnHZHdL2zfDkpsKn9zAja04EgK5umKHY7Lzj9pJ+tMPrpaM3Pr3x5A1vOHc97eyCOxhK3F2MYmnMJJQ+1usQY9CZMdkQZCsduxg==;
	24:+XflPyyPDHvrQWhA7EjeIwAoi4/VzwBpsx5YahuGyVDiIIXOwkysNQOd2Xdbt8V8hddIbEkdSRIfanTChywL6fch46JssGY0myYkQSITlEY=;
	7:nM8ZOWKZcHxGNT5W8vRmIGifLAQ43lwK5Lxdnrsesl58E+a8tkLPqJJqgIYOjk901EEvo6iknMXZ0bBFdPOZCPjl5M/wiMcWUrG4RTyGcpNK4bCfFyfw6TsCCl2nJt2BGdd35L+OVLmXOz6SeF4NltzrbI6OiVsmMWSPbjS9scHXBPnDwMPCi60lEEN8FCowhavNLvCQL5D+vR1oLJR8f+o/P1De8ny6WWxzWMvqmJQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2017 22:05:18.2629 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1134
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.84
Subject: [Qemu-arm] [PATCH v3 0/8]  Add the ZynqMP PMU and IPI
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jmJY9IvhGd4x


This series adds the ZynqMP Power Management Unit (PMU) machine with basic
functionality.

The machine only has the
 - CPU
 - Memory
 - Interrupt controller
 - IPI device

connected, but that is enough to run some of the ROM and firmware
code on the machine

The series also adds the IPI device and connects it to the ZynqMP ARM
side and the ZynqMP PMU. These IPI devices don't connect between the ARM
and MicroBlaze instances though.

v3:
 - Add the interrupt controller
 - Replace some of the error_fatals with errp
 - Fix the PMU CPU name



Alistair Francis (8):
  xlnx-zynqmp-pmu: Initial commit of the ZynqMP PMU
  xlnx-zynqmp-pmu: Add the CPU and memory
  aarch64-softmmu.mak: Use an ARM specific config
  xlnx-pmu-iomod-intc: Add the PMU Interrupt controller
  xlnx-zynqmp-pmu: Connect the PMU interrupt controller
  xlnx-zynqmp-ipi: Initial version of the Xilinx IPI device
  xlnx-zynqmp-pmu: Connect the IPI device to the PMU
  xlnx-zynqmp: Connect the IPI device to the ZynqMP SoC

 default-configs/aarch64-softmmu.mak    |   1 +
 default-configs/microblaze-softmmu.mak |   1 +
 hw/arm/Makefile.objs                   |   2 +-
 hw/arm/xlnx-zynqmp.c                   |  14 +
 hw/display/Makefile.objs               |   2 +-
 hw/dma/Makefile.objs                   |   2 +-
 hw/intc/Makefile.objs                  |   2 +
 hw/intc/xlnx-pmu-iomod-intc.c          | 554 +++++++++++++++++++++++++++++++++
 hw/intc/xlnx-zynqmp-ipi.c              | 377 ++++++++++++++++++++++
 hw/microblaze/Makefile.objs            |   1 +
 hw/microblaze/xlnx-zynqmp-pmu.c        | 200 ++++++++++++
 include/hw/arm/xlnx-zynqmp.h           |   2 +
 include/hw/intc/xlnx-pmu-iomod-intc.h  |  58 ++++
 include/hw/intc/xlnx-zynqmp-ipi.h      |  57 ++++
 14 files changed, 1270 insertions(+), 3 deletions(-)
 create mode 100644 hw/intc/xlnx-pmu-iomod-intc.c
 create mode 100644 hw/intc/xlnx-zynqmp-ipi.c
 create mode 100644 hw/microblaze/xlnx-zynqmp-pmu.c
 create mode 100644 include/hw/intc/xlnx-pmu-iomod-intc.h
 create mode 100644 include/hw/intc/xlnx-zynqmp-ipi.h

-- 
2.11.0

