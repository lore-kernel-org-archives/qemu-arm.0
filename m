Received: by 10.80.163.71 with SMTP id 65csp508140edn;
        Fri, 30 Sep 2016 18:15:37 -0700 (PDT)
X-Received: by 10.237.54.164 with SMTP id f33mr9537723qtb.139.1475284537083;
        Fri, 30 Sep 2016 18:15:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g137si14109296qke.123.2016.09.30.18.15.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Sep 2016 18:15:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47836 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bq8ts-0003sS-Fq
	for alex.bennee@linaro.org; Fri, 30 Sep 2016 21:15:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1bq8tm-0003pz-Tt
	for qemu-arm@nongnu.org; Fri, 30 Sep 2016 21:15:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1bq8th-0003ho-1S
	for qemu-arm@nongnu.org; Fri, 30 Sep 2016 21:15:29 -0400
Received: from mail-co1nam03on0089.outbound.protection.outlook.com
	([104.47.40.89]:63518
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1bq8tg-0003he-FS; Fri, 30 Sep 2016 21:15:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=FRNnHQ1cb6QbGROANHY58h+qTFwFg5LLN8bNuMOP7Ko=;
	b=f0N9FNiWD6XRRr2CWX8lkwLoIhVXvVd8VFwytALsF95PzwutALrSOu4hHdcJSvqGxkTeIJ5UM7mIxP1315Yn837PjOPgrqkvZi/e31CX1XED5Qvew6kSD9qk6KuptbNqN8AoiR3xxKOfjFYSPjGO3+slYbwJsY7hEwW7rkvVnOw=
Received: from BLUPR0201CA0019.namprd02.prod.outlook.com (10.163.116.29) by
	BY2PR02MB266.namprd02.prod.outlook.com (10.242.236.143) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.649.16; Sat, 1 Oct 2016 01:15:22 +0000
Received: from CY1NAM02FT005.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::203) by BLUPR0201CA0019.outlook.office365.com
	(2a01:111:e400:52e7::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.649.16 via
	Frontend Transport; Sat, 1 Oct 2016 01:15:21 +0000
Authentication-Results: spf=pass (sender IP is 62.221.5.235)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	62.221.5.235 as permitted sender) receiver=protection.outlook.com;
	client-ip=62.221.5.235; helo=xir-pvapsmtpgw01;
Received: from xir-pvapsmtpgw01 (62.221.5.235) by
	CY1NAM02FT005.mail.protection.outlook.com (10.152.74.117) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.629.5
	via Frontend Transport; Sat, 1 Oct 2016 01:15:20 +0000
Received: from xir-smtp1 ([172.21.6.17] helo=xir-smtp1.xilinx.com)
	by xir-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1bq8ta-0001oN-W7; Sat, 01 Oct 2016 02:15:18 +0100
Received: from [127.0.0.1] (helo=xir-smtp-dlp1.xilinx.com)
	by xir-smtp1.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1bq8ta-0005RX-Uj; Sat, 01 Oct 2016 02:15:18 +0100
Received: from xir-pvapsmtp01 (xir-pvapsmtp01.xilinx.com [172.21.6.17])
	by xir-smtp-dlp1.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u911Et4A010894; Sat, 1 Oct 2016 01:14:55 GMT
Received: from [172.21.103.25] (helo=XIR-PVEXCAS01.xlnx.xilinx.com)
	by xir-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgari@xilinx.com>)
	id 1bq8ta-0005RU-3f; Sat, 01 Oct 2016 02:15:18 +0100
Received: from XIR-PVEXMBX01.xlnx.xilinx.com ([fe80::b50d:8846:1b82:a425]) by
	XIR-PVEXCAS01.xlnx.xilinx.com ([::1]) with mapi id 14.03.0248.002;
	Sat, 1 Oct 2016 02:15:17 +0100
From: Edgar Iglesias <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [Qemu-devel] [PATCH v1 1/1] target-arm: A64: Fix decoding of
	iss_sf in disas_ld_lit
Thread-Index: AQHSGwQsEAaI/APX5EaQsmUGPwJNHqCRx+CAgAAB34CAAHErAIAAViiFgAAKX4CAADEQcw==
Date: Sat, 1 Oct 2016 01:15:17 +0000
Message-ID: <4btdmvejd7mskl61ip3xxnc2.1475284514207@email.android.com>
References: <1475230780-8669-1-git-send-email-edgar.iglesias@gmail.com>
	<4496a78f-e527-fae4-0bc5-a9f1c0d5c997@redhat.com>
	<20160930104909.GD9606@toto>
	<CAFEAcA_6VUj5VDNTiRz1-hST=-AQD+tOneMy1-x7qYjt68YLFQ@mail.gmail.com>
	<ooog2kweegxy6dqxygrpngkt.1475271750691@email.android.com>,
	<CAFEAcA96zY_e_ZsgYZNedWYKq329rkV=92ptLGh_VOofaBkWEQ@mail.gmail.com>
In-Reply-To: <CAFEAcA96zY_e_ZsgYZNedWYKq329rkV=92ptLGh_VOofaBkWEQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: multipart/alternative;
	boundary="_000_4btdmvejd7mskl61ip3xxnc21475284514207emailandroidcom_"
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22610.003
X-TM-AS-User-Approved-Sender: Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:62.221.5.235; IPV:NLI; CTRY:GB; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(189002)(13464003)(24454002)(199003)(4546004)(63666004)(189998001)(6916009)(2950100002)(63266004)(106466001)(9686002)(76176999)(106116001)(9886003)(16236675004)(95246002)(19580405001)(19580395003)(626004)(54356999)(2900100001)(5660300001)(33646002)(50986999)(93886004)(8936002)(19625215002)(102836003)(84326002)(586003)(110136003)(8676002)(4326007)(30436002)(260700001)(81166006)(11100500001)(81156014)(92566002)(356003)(7846002)(512954002)(86362001)(5890100001)(5250100002)(87936001)(2906002)(51650200001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB266; H:xir-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-62-221-5-235.ipspace.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT005;
	1:jfxKSASyAPXvAJRrHATspXqg3yMNJL/pGdVxq7kf3xjzFc9dg5ia67qlRCttVf6qIQ/DmgDCriTjGgh+SJhrm9kVN2QFTiu7q5n+eHW8DLLlGeD4Aj4i86oI6tHYcWJFGrEIES2YXuprrv3voJLo1jIGdEcPh0ZXqX8a3pMZbSJNacokKA7fpQHlF3vgt8w7eh+Z0Ej6vkMHxLNlaI7xmd+iCO8rZxRLizsqpX3eBxaKaF1z5+tBlI18UjJoWtcX9n7jZ+j6OQFoy+PBgfYM1MQBiat5gYjbZ4TIYxIRd8VbwchCkEig6Qplcc5qRLWiHrbXlYgK4Rg8xS+K7kN6DLmx9I8ynm5MCSRCDKDjeIr+yuNZBB0FD3WzkmI+h3MCcs3IH6tWyL7nCXDeHjuy9trV+c//d9agspP1CZiD/PXI9bJBMsC4ADUu21nvuu2GKZoPUek5KvpDpW2kwanS7ct/EwIWLPAE4fTC/OTQHfKLDfEuqSZnsisoo3JBX607v2g//ty9MXeXvYdIMDKsu+laCKVrSWL6jN8Uylj1mdUpzpg/UXRLzGV5Q1FgnIBHQYGh6VrZkAdkqNzSVRkbmsFerm4o3/g9mOAqac+e148=
X-MS-Office365-Filtering-Correlation-Id: 6a4c5bfd-e419-4bc7-5889-08d3e99869ed
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB266;
	2:LOJEezNDLb4vVGPyicppRUUalcqfwHtb6aATfun0Xo7Sv26JCRteE6Dy3LGJxGlOVesTuJPACxMKaQyGpr5QL8zwt+NZCghUzPWKazjn3PQWHJZ4wdfrTWN3DF4MwnFG9PFTPiAIYgyg3qahP7dn2B6m2LjQqdA5HB9JHahwlci4rwvgDYYi/14A5r8NmlhpN5gnHfoCJKy6qdXMiMgCdA==;
	3:vC9G4iNh1PNuzUX2L4g2cUHMJGlmGkBQx1ZpxWbGSE4SbfvMcvGqSL4mpEkDbQ0XcOh1LrVXXwZ1Ll4M1uWKhUdA7X/sbD/7ZEMgLodalBTIpfT+ag3hQTkp/BM+tGiIkzJn1vdr2RVedOQjY5SwSBc0USP9WDD4j4hxziQCVX+kMU6chOA9UUTTUzWlDyYhYQhK4J79rfO/NvLG0GeeYAqTxg0PmGTrviN/IsNEp5YwqaaYPnfyMa5Wd0s8gfsTVeyEGensqlRqdRDX2Nf+cg==;
	25:3J94PrrqOf4wOufNyny5F0UMRBCxkGLE75uMYFi/EsJ03BKpV8dDbiFbAYaHS+zzp6MjNpMn7+/kgWQ2Rtl6gAPsE2EWsQGaiQ7zdvStcMDHuQgpuXE4xYfs4pe3FsHPuXbmLSWkCmVLIK2lzHD/eWdP6eJH31amfMX5xSPGt/Sks6ikEvMD7X9YeSYTNRVirhhOVzuLFSV/imOdP8f4fSvV43n21z1g0hrcKzI5Hn9n/F+Z4+7bQ0uJ00nFMnUbXrXSBvTcj996x403IwS14/50N+WPISE2d4chgfk98nageymvjwdfyedfdIhTqscvvASNY9HFaoXDQEPJCczbpUWA3EC5yXB7F3CDwXbkBzgArlEbX0qAmluBHBk9xTugvUFQqMNq3OG0Qodp57XlSQUBbeLMnrLhqPlPveDt8FEUQhb+j5Zaguylc8qUS9bo
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BY2PR02MB266; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB266;
	31:1mU+i8rCVA9vLSVgCWkIt3PiPV+HDzByhg4bOy4oPCMdv3ppb0coZ1hW+lWIxov73dihix7Fwet/3iKb9zXpECyCjI34ymYYz6/vY43rPqD3DvU7B2Sd7Z5QLjN8weoXQuCzu5LjjC2pq5FONrEbsr1msfXjowHo6l6vnyvJrNwfbW8bWwV4hH96R1ooH+aFS/ZLDScmuwy+f+bUbuqq8TQtA6pVylkKLaeHo2dhoyvLFxjwTWJ8imnjpNiLrGk40h1/AsfVQChOGtTuEcAPnw==;
	20:Xl3eNn2irIxqLFg6rqOIvhy24dogaxI6UsEV+qHbWP+JRE0w3qxeZH0z5bsmqZJcgqmBu0hTvHcXHZOIWlICMn+hua1MfdF86AB353rY3IFulj8trbf/QCqPRvHO1jtjQh3uUrYF+AZLMzF2VM1Q7sl9iK91Ani2KG1F4Yt5kNIGmhSoChGAkFzO+p5VjM4uMVIJ+wSPbIaLfGi/aLKoIYSaySEIxuosNdRr/KkhOvkOYjaje8S4TzKbxj42SY86nVksmDeWLhsCJ1fUfzyYAWucSrzNACRyEKEtam3jicu4TjWHCEVAT6WQns1hM4fu0l5IFCxkEBPRl+dvCxGIvT7pjeSj8fa+22nDqf140G9Y71Fi9IViUF1SuBtAMgPAZXPGDAbCFZ1ZFa7lNEJ6CmrvYGc6J1+t9nLJRM2R0yWshpXE11n/gho0/EoaqrYbNNrEiCz1Ov7CSaEiVjINyRxTAB5dq7mJK12Hr7u9wxX77vFGlSNJ5XVJPFk8vo0+
X-Microsoft-Antispam-PRVS: <BY2PR02MB266D8622C9E82E11A5D2697E3C00@BY2PR02MB266.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13017025)(13018025)(13024025)(13023025)(8121501046)(13015025)(5005006)(10201501046)(3002001)(6055026);
	SRVR:BY2PR02MB266; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB266; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB266;
	4:hOENdcrOijWKTI2LxpJACxBfqL9qygbzyPu4ZVSQdmMdmrGAc9xalDFJjIxVvT51tsVghsZRIclaiKsoKST+xB1zoZpp6cA5PqzTFrivVnZFqD7/ByFxYcqjJuVixcLYQZi6hMZ/kvDMITkJDTo2ooHqOQi5ZD92WSCysvsTaVS5x3tDfNwY01//L/u/OEDSz0fahfZYHogO38JMQU7OGvmwf+P7YkDMN/8Mg4lETLF0/dh7g+18tFoJila4okIhg21EfxfKi3nEzUqDe+TFoQtN7dXsgDVKoeLbaNdgmVKcv0a3WJQPayGAllgpF1sJZ0xTNBuUmaDTOKMw6Y27Is9Pfj0hYsMgXN4/x1Adsx5l8li1wTkjSKKwoTcEOorqslEwaPhEVtA788JOCjGtSGdUt0EpLprwSUpFoNAd/Tfer0ELHP98URxixjjoHkcHqsG081BJM1fTLmEai8M0mDL1Zo3j/wf3DdhWpLSOwcUksFuy3ohXWftEMFvyPfjmY9hPALywZCKPW/iWAhi6nyrlEKeWg7toJR21Ln5yNlDWd/YYE78b6NT5CNDjfDhWYer0jcv/W64CzVRu0mRKHA==
X-Forefront-PRVS: 00826B6158
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB266;
	23:8s3m0y57lNNCOlQ5BtlEbDGKcCh6nAbrfVllDF7LIF?=
	=?us-ascii?Q?79gkZGduwlzTlFdv6gewb1XcFXwJMAFfavN3x1jE2lrXAuMvqBPue5eVdlrQ?=
	=?us-ascii?Q?ViqQEt7TKAihEqs++rxulnEn7hbxWLC1qKc4yZF17U7DTj7rtDu3OvTEGJZt?=
	=?us-ascii?Q?ZhA1ur6U4fvrRo35oLnZSNgTRR9iAd+q5MshHhyKPWqRGVzkkjDRvXm99pyH?=
	=?us-ascii?Q?dcS5OceZHouvwe4thAwZHfH1QrFMiXy1KfGo5gOzJOh3a4M9z402kdsdSbSu?=
	=?us-ascii?Q?PgQmCdpfp9hvjYzX21jPnHc2KQkaTgw/huLuP4VI0mg59352Y3kDw6RN+Fq/?=
	=?us-ascii?Q?1JQRqbeThBt9GBjR2kgT69IoNvKSF9e9TJRX0KA0/UuQ9Yur7j43yVsQ94Vt?=
	=?us-ascii?Q?qUCGWhKx+m87o9zL08EH1MJddX3i/YrBnVI0vDe2FgUcsY5Jk8It6wuchpB3?=
	=?us-ascii?Q?3/m7R8tEtTioMeYOvXI32aU6HZ4JXwQ3XPqcr1QczQQvak2xvqAqrtQThGXI?=
	=?us-ascii?Q?G5FSeJrkI6CEf8MgjO56gLIgS0TVrNorWgspmuSMDCm538uq7YKYPwTBHSm3?=
	=?us-ascii?Q?qBpprWvyWCO1lLCnPijf/yu2pmSkOPEnl7RuKfa8kzOBQRW68xu3s1iB14Wm?=
	=?us-ascii?Q?1WBZWdx2Rekyhf2tLMh8msO76QAqdQZr/2SLIMZIK3lWk++XOvzRwFRwp493?=
	=?us-ascii?Q?L5asI6GluJ4TEKbxr17RGR9818GZpe1eLt4qaYD5n2Zu7npB7u73wiAKRRjS?=
	=?us-ascii?Q?yMKrRhvni2AljkMc777wiPkYXiPmiKMap2uhdvs25+jQIrvO7w3egNoPD5sG?=
	=?us-ascii?Q?VR1KeOR1Y/SYdNm+i5qcBf3HYz51Uq0wlzuPWIr/N6Jm7xB9NlkARW+15nuo?=
	=?us-ascii?Q?FndPBlS6Rgl9E58jvIEuFyD1xCc6VGuCh82DZvRK0uMxHzgM8finWSjewGHZ?=
	=?us-ascii?Q?MwkvSo6BRZt3q2fGVPSJj238LYffwJriMQNUnMWHyp9J5xss5nHV1zFiRID7?=
	=?us-ascii?Q?Wn3Tp2N2unSrA+zdIEkYHpNbPT+7aLfQ1+ZzAwIZedg1Pq5nNAK7kUU59zUh?=
	=?us-ascii?Q?eMCCayzvksnQ55d9hZfkOcVD+WsKvlhy7deXoxGTwDoj2yjQBGgTGlXds5Ol?=
	=?us-ascii?Q?KkAZN6q4QYQUaSoZsOhJYvzcgcBGwRvY82dpHFw4JWm0Ql/UH9qeNVoOT1WY?=
	=?us-ascii?Q?cGOWFXvLggTRZ7rdGdKW9KZPbf4miH/xH58bbMTpYBytjsnT7WTtbxatnB8k?=
	=?us-ascii?Q?G366oQ18ht40YBujFfE12OByYwzMlflglHGvbWI8OYNxZppaxHJM3i4wVTUg?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB266;
	6:p3ngx+WXMx6a/EXv35W/mkwZBTH2b4yT+QJmnDzyKsNPktuVRmk8jdqOM35/frUe66Lqa88kEkdidllm3oLtUH6Q9/1HCgY4+E9crQORy/7BGQi9spDmnIlapgZ4dujh1N2ImywoM38co4jEsvMDpP2oWRpcRzybiYxsOFm2X1Zfh6JH4nETV7Hyk/+EuX9iZ9x9exoBnKnbt7opyGEwLsAtr6FwHaA8+VvdpLRqUesLMEqEw777sCxZ6h1EWdBq0PBeJ3hp0fsOCSzENuiauFrz05D/esdD18T0KGU6tSfRJTEM2UI9qvzKSad2jX291yq2ftpKS4eiZ3P4BGAgvG2zUyEClUEvFB/MZrBOKg0=;
	5:3dxDm+fpcax+/XEW/zZjLPu20QKfu8JNoFIYnZxRX8JpzVDIlzKYy1M0AX7cNHgHmZOO7UlMQ9ixViDQ3viI+kSrO9TqDDFL9pCQvIxpG37VRC8Nqy0eOVwNKEifexiL9z4xzSxp7gaE3HGsJsZm5k7tNEWORgPr1uyAXmuFQNc=;
	24:LHdiPHI8icI5xhIFDolGnoIlL7fxg8dTxlXgMKAQGfuWnyQJuWs+0YnKvs3QdnqZ3INgggCx4iyjgSe/YCuJW4shYTdp+FHQ9wjdXLOj8x4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB266;
	7:xhgXuGMHG1xtotF0JCfRai+tfg8DoqInrOKa68FTjZvCyOO32SInMEf2n8AS5+88WS/F1QH5oKu0iarzve6eb5fn1mwCKQDQkpQMcWmudJDDZSXY3qb9QoXqHzgC05yec/TSZoq+UFtLNzsfSx2i/MBa8mw7Niw0BhyHBdsmtKMMUBs6SJLxm54VIZTvDeTOhf0OmqooSuTgo3VcSRVoi5wj9FSZq/lhj4ygr1xzHOA6Mb9SkjhpmzaeU1yyz4gegR4dIcFRLmMud0IMiudUox8uI8gB/EPp9Pu2Hya1hGNqdDETSTOnOnTcrH4eNd6TtljT7/r0XRLEWqwRpXaW5w==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2016 01:15:20.4428 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[62.221.5.235];
	Helo=[xir-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB266
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.89
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 1/1] target-arm: A64: Fix
 decoding of iss_sf in disas_ld_lit
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iRbLwaLttW1P

--_000_4btdmvejd7mskl61ip3xxnc21475284514207emailandroidcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks :-)

Edgar

---

Sent from my phone

-------- Original Message --------

Subject: Re: [Qemu-devel] [PATCH v1 1/1] target-arm: A64: Fix decoding of i=
ss_sf in disas_ld_lit

From: Peter Maydell <peter.maydell@linaro.org>

Date: 1 Oct 2016, 01:20

To: Edgar Iglesias <edgari@xilinx.com>

On 30 September 2016 at 14:42, Edgar Iglesias <edgar.iglesias@xilinx.com> w=
rote:
> Peter, feel free to change the syntax to whatever you feel is best.

Applied to target-arm.next, thanks. I picked "iss_sf =3D opc !=3D 0;"

-- PMM


This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.


--_000_4btdmvejd7mskl61ip3xxnc21475284514207emailandroidcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<p dir=3D"ltr">Thanks :-) </p>
<p dir=3D"ltr">Edgar </p>
<p dir=3D"ltr">---</p>
<p dir=3D"ltr">Sent from my phone</p>
<p dir=3D"ltr">-------- Original Message --------</p>
<p dir=3D"ltr">Subject: Re: [Qemu-devel] [PATCH v1 1/1] target-arm: A64: Fi=
x decoding of iss_sf in disas_ld_lit</p>
<p dir=3D"ltr">From: Peter Maydell &lt;peter.maydell@linaro.org&gt;</p>
<p dir=3D"ltr">Date: 1 Oct 2016, 01:20</p>
<p dir=3D"ltr">To: Edgar Iglesias &lt;edgari@xilinx.com&gt;</p>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On 30 September 2016 at 14:42, Edgar Iglesias &lt;=
edgar.iglesias@xilinx.com&gt; wrote:<br>
&gt; Peter, feel free to change the syntax to whatever you feel is best.<br=
>
<br>
Applied to target-arm.next, thanks. I picked &quot;iss_sf =3D opc !=3D 0;&q=
uot;<br>
<br>
-- PMM<br>
</div>
</span></font><br>
<br>
This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy,
 or forward this email message or any attachments. Delete this email messag=
e and any attachments immediately.
<br>
<br>
</body>
</html>

--_000_4btdmvejd7mskl61ip3xxnc21475284514207emailandroidcom_--
