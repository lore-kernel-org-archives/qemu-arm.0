Received: by 10.223.172.38 with SMTP id v35csp4369386wrc;
        Tue, 26 Sep 2017 23:36:30 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAG7Oa0zACPcWP04dTHd2kPeNg5HKoCeL4p5bIWym6Ky8RdU03tr5SlPFeCypJ/+8bmigT6
X-Received: by 10.200.34.28 with SMTP id o28mr458686qto.184.1506494190022;
        Tue, 26 Sep 2017 23:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506494190; cv=none;
        d=google.com; s=arc-20160816;
        b=ATQy1LptcsTov0upNNDJCfzIqIL6hqZAYp1z/WeDw4bwjeDA/CnG3/o4/9Yz4b03Zo
         1UZMk8yJeaqcAew5HgNjtWyba8wY8d2DS4+fXYWEvXcvu+hVV/mVC9/IOxwJIgGGuIRd
         FpvoNBbr5LQnJ8FnaB8NEKzE7J3cZ0195igYTGAu/snVnrxwonosQM6bI8hvFRTEZPQR
         wlRUoW9ilPGs+eeKW5zp2VqWiN3uGorzl+N3LTJy4Ha1Q+bSpUOytBxAQrvL1JOIvVKQ
         HKFeemUwqvb9/tBC5f4ThrqYNsu2JwjzAnrq66YMcgt9t0SHcQUt038cDu6CV3Q2gKgg
         HIGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=XPOEe0xqByN+l7vTudUPG2H+XUbEKI4mD2z4zapoaps=;
        b=a+7UCmORZyPj9PXzaubV77yP19mRBaJX22rNJf74lTkZS3auxdmDckD5K8DCnbnvwv
         3h2Yh5tYt/Cu+bFbLZerMFWaPcy51uAKukROC0bOfT2CN/fg6I+mIJuDFtz1S07VYptt
         3QvqWR+O7gqd3+JoPZ6mte4kTIdw1dXrR4hT/exhPPix7ZLzAMrkXRwqQhZwQLzHR64w
         FaflFtbfvlyaKl1EWYnNDNqXIIl7lHvXkYngVWmsrMiQolYfFQSjFpVqqZIZ21mHLGQ5
         BkQF5IwhKT+BgHAMeUzhgUJlrVJfcndow1UpA3B9GviUbcSjuwKxKgjdnk9Z/qPUL7pr
         hIhA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m43si826625qtm.3.2017.09.26.23.36.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Sep 2017 23:36:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:52404 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dx5xL-0000yz-NX
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 02:36:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dx5xD-0000yi-0L
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 02:36:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dx5x8-00085a-3t
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 02:36:19 -0400
Received: from mail-by2nam03on0079.outbound.protection.outlook.com
	([104.47.42.79]:6496
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Bharat.Bhushan@nxp.com>)
	id 1dx5x7-00084U-R5; Wed, 27 Sep 2017 02:36:14 -0400
Received: from MWHPR03CA0005.namprd03.prod.outlook.com (10.175.133.143) by
	CO2PR03MB2359.namprd03.prod.outlook.com (10.166.93.19) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Wed, 27 Sep 2017 06:36:10 +0000
Received: from BY2FFO11FD024.protection.gbl (2a01:111:f400:7c0c::196) by
	MWHPR03CA0005.outlook.office365.com (2603:10b6:300:117::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.8 via
	Frontend Transport; Wed, 27 Sep 2017 06:36:10 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD024.mail.protection.outlook.com (10.1.15.213) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.56.11
	via Frontend Transport; Wed, 27 Sep 2017 06:36:10 +0000
Received: from localhost.localdomain.ap.freescale.net ([10.232.14.21])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v8R6a2N8027330; Tue, 26 Sep 2017 23:36:03 -0700
From: Bharat Bhushan <Bharat.Bhushan@nxp.com>
To: <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
	<peter.maydell@linaro.org>, <alex.williamson@redhat.com>,
	<mst@redhat.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Wed, 27 Sep 2017 12:03:15 +0530
Message-ID: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
X-Mailer: git-send-email 1.9.3
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131509677702134150;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39860400002)(39380400002)(346002)(376002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(5660300001)(85426001)(50226002)(305945005)(498600001)(86362001)(2201001)(8936002)(72206003)(104016004)(966005)(110136005)(77096006)(7416002)(39060400002)(47776003)(68736007)(5003940100001)(81166006)(54906003)(8656003)(8676002)(356003)(36756003)(6306002)(5890100001)(189998001)(53936002)(48376002)(81156014)(105606002)(6666003)(2906002)(97736004)(50466002)(16586007)(316002)(106466001)(50986999)(4326008)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO2PR03MB2359;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD024;
	1:vYi9B3EeOyHGA1LwjRADrpZqTZ/etFuSNRwkusUAZW90YHoQWQBbk8PkipYs8UpMhChBQKCntEshvmnQOeS/JWyCC6mgv/bsKSGNReL2w6enZMNHnp1V89IA8YAWex7e
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39a5356b-41d7-42f9-3986-08d505720a6d
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017052603199)(201703131430075)(201703131517081);
	SRVR:CO2PR03MB2359; 
X-Microsoft-Exchange-Diagnostics: 1; CO2PR03MB2359;
	3:9JjdyVB61qCV17tHWNghs6zmlIitET3jfEspmXBFIvR6kIksQ4wHQ+8geUzohw203zoafxSu/NHZZXfqN+ZAvNgNCQcr+wI1gkubHSR+xtwgcI760qB3IXHFhlA9z1cqeSRZCfX3zFQ5S0yW17Hbyi2MlvjxOjfmNxKKPTJAGj3a6fAMaU6DC1WfzO8+n6Pj1FXbYLP7c9khvNJhbLa9/n1kOUzLcH8008Ni5pDlYH6bKeqz4ZFobqpjImt0HLUUjByQ0aTE6RUnQ0Hm58bI7SLDiitUm6nA5pZZ/MDykZ/+2y4BZwmcJCM7FitEqna9DS4/afTQShP/0LoGhHXcSv1KoJ72coa3ylziCChiqyw=;
	25:FRKFYIkhpDWKbiJk8rMvtUEKuYFjIcT6WZKaWUNQ1J9xhS71U76xEcezAkb9ND0+ZdqQl7Ajzis5/cMdwPZUiMSQDfYSxFF/i5dKnUBT25T862sQOdQrBeEtiQM3hhM6TKm1rrC9fVyWyY6cdbDrjEbfBu/FRw54s36iQ3SHJEXu7vURcwj+7WUmtz0OjjJ0BR9TIqLQl67YlHrr9pD2TJ+YJrAq2uP8KP+fYLLDSVvASkIUqgVlB417V0i4tQ5VUUS1eZbwjyyQCTRwd4phvS+lTDyuBnI6eYECLgh5j4E+q1mICvkeLF7lQ63uD1/saNu4cdApYWIwrxNs86ejng==
X-MS-TrafficTypeDiagnostic: CO2PR03MB2359:
X-Microsoft-Exchange-Diagnostics: 1; CO2PR03MB2359;
	31:r/8Oxn30bW+zM/nqlH8rSGYgStbcvSoiPoH+hh1M5TCvtCcAV5dXASHHi6qAXViPgm16ytKZMDiqZNywlA67cgkcGDE25JkCbOCpghWNewEVrS6n8WAqhbExOpQJJ61o3z0eAZA+uSYnuFSUGkMNzAr9n+GNPaynHyx6360k3a1RfIUgEWcNFlfNMY1enosEdrKz9LtjxmcNQV8Vq/TGxetaCnBViTMDbSLuoFXwsy4=;
	4:H3o0JO6YBClj14/52sVlVXzm2HTZY0oW5KMTgx79cQwTCfdE5iPsp7I7Wj4WRL7V9LLMRI1BCR4bxR3RACJ63KPSkOfAjNvsnl51OUpCC4Twi+G7mb7olny9Si7ENgiD1xSzKIjt9FoTzwocdWPb0TnLaQKAIrQS4k3HR6yACzsHn7o3OgkfO0kLpRhBXdRtdMaaEl/jkOCA5fVa/UYLQZ5vaFZ7/1KrGCwUC9xsvS8Q7p16mkZsF+8nnG95AX14NjgyMXpkgzxO+NmMSDuTTImjCbbGg252xXCrmokE2mM=
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-Microsoft-Antispam-PRVS: <CO2PR03MB235936EB771F5022AB2F32FB9A780@CO2PR03MB2359.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6095135)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(10201501046)(3002001)(93006095)(93001095)(6055026)(6096035)(20161123559100)(20161123565025)(201703131430075)(201703131448075)(201703131433075)(201703161259150)(201703151042153)(20161123556025)(20161123561025)(20161123563025)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CO2PR03MB2359; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(400006)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CO2PR03MB2359; 
X-Forefront-PRVS: 04433051BF
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CO2PR03MB2359;
	23:C+5ioICoPXLxbFqUDnmCJ98f2+PAM4w90moSJLnXo?=
	=?us-ascii?Q?a91bAt4OigbuvjYNGmyzsKLGP9Kd5CldiOpIozCrTBaQWLecx13h6PcDm/7J?=
	=?us-ascii?Q?5U29eqtXfDqmfgGV4UVMF9Lhwbn34iRgmYXjl8R3UWYiyDSa2xJXLvFPKGpA?=
	=?us-ascii?Q?D/tFBrgz9UQQjKuGIQuJ+f+uJzKJTAHlilZuFbQMWr6z8Ra2ExvN4PDnT9h9?=
	=?us-ascii?Q?oEyE0xTZH3ima7lZ+WXqPkHJuWmdNaJjGSPlJ1lQ4GYyOJx8+p7m2gpJlG/U?=
	=?us-ascii?Q?wyeFiqofULYOT+n2EO1faGJFahd1FdCwDZILTXPSFh3+2zLiUcAr4hmaKjKe?=
	=?us-ascii?Q?bUczCWytbEndo2ayEv92pL0iKjAApFS0JgfkD3daeLDJMrS3IDuocnKewUyx?=
	=?us-ascii?Q?0JFzIL0H3rU9LZuG3rMgz4cfUexCMGIzny5bU1WneEWJpFdv3IgjlRdXDUiM?=
	=?us-ascii?Q?YrTNK6PSQsd4viurotoqNZwqCYtleqoeQOAqEV3bpgzcKpeBrSQDzuggXhcO?=
	=?us-ascii?Q?/FMBymnLy4EGq0tAZ82ah5nKn8REtHfNFqvtIf/2y3aU6QgFtnT25GgrqgAE?=
	=?us-ascii?Q?yACHaIt7TjfJor3tyeJg4/noOt9aPtPKP2skoNx6DBiyeQwNarPMzA5LdXJd?=
	=?us-ascii?Q?p+FTfBYf6QsNrLgMiNjNF5Jv9gMk8QtMpFNI3WnahiuzLphbe1+z41hLAL6x?=
	=?us-ascii?Q?DZmcESJAPmCMKmOLa27ViSE7qeW5iYOpd6pbHATEVh5jKriTwMgn4IFOXZMk?=
	=?us-ascii?Q?1cF/qENKKnueaATa4SPy0ANyxjoLtSw6eNIQNEWMI8MmKVhLvZLI3Oz4E+LX?=
	=?us-ascii?Q?nKQqAYVA+zlVkqufTOTScHanKagi/G942QtfnUaXBdz1bdqnHGb+RLXFkNWg?=
	=?us-ascii?Q?imfZfX/otzEKN5L0bWlgy2EMoVkYb+G+1PpNpUbhrWyO6G2mJcFx3h4LURlA?=
	=?us-ascii?Q?cHpPm+GSSqu4WdqSnX1/XLF0/l8sbCkRYE/eKGW6krZ2brii/82Hf55mwOMs?=
	=?us-ascii?Q?L1AhhHVoGt7q40KI8ZvS0oW461n/WWJnkGN0uE5Pn+YL9mYcnegIbyoanYyi?=
	=?us-ascii?Q?GeA5HCV4x4PSaF3Hy6wlyhp2l4vbwBZVjkBBXITCX++TAEGnoJGU/8YjKFy4?=
	=?us-ascii?Q?IMv/oFYMUGF3UOcnvm82fpquc/3FAxI7M44wtAsNZYz9N+8w2QRw5lWRK6dp?=
	=?us-ascii?Q?KCrghvW5mJCcdB4LpnVuKC9RFdm3HarMuEpvxN+e7LA3COvI9K2GA1MSvH9Z?=
	=?us-ascii?Q?HG76Ng2oAoZmu4I4fs=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CO2PR03MB2359;
	6:/ZE3zt/6WbkFXAlJ2OAweBAOnudw7jOgoQ6HYRJ9ozuWZgTtpL8KquOylM/R96IMi14XPD3hjOZvdidmfpd6MRGOntzVfmBfB8dxTDlHMqM7riToh74ObawyKOjSkuIRFhDeX8AJlNtlTIzq+3HYNXMLIQJSY+pwfERJYpdoIZ+fndknsLggg7K6Q0XVOTdi9lIl36tqbjTDvemwonIR0Xpng7XJXMfbVCarKVrSSWxTktiI2r8cQdjdpaattPDKdBucjblcOv3mBKUBt0Ybmmrh3VaEYbj9fvxvID2cMttaNafeTHe4wJFEmsa8ZVX9Kh/cb+/Mkux0L41q6AZ0Cg==;
	5:J4i/7V7xXnUDVP8a433BWw5iUc0y9KIXonj6hAEOD7pFfNYPdS+cbr9MU6WsZFz/FfXiynoQkNCHakKwABLV/KNUx44OlI7Ug5lbNsdzob55gJPKxZf2qoVFYQv5cX1iBCXh4zTupvQnYZtIB717AA==;
	24:Zo71rL+4zZU/JtMUkyl1yNGBtXlowLXvMs5+37EcbnEoLG1CYJNCNYUlemAfbOldYXgSrW+7rezlGvRMc9D5jGjeqLI69hQTTO0wun951JU=;
	7:pj1PgORb02vfzJPEe6BDo8z55S3hVTzXBPJhXNXL4l6p8aud87KdwMkBpNEhmqlg16UKhajNwcVCsQlkttMrYcwPn3WRm1ITpTGTvxAyBZsR+jQP+tL/AXHFNi98sjDf583X0umIM1W5g7VFFGLzALMOJPgpUMCCWfWzYmfYrh4WuEWgJvq6O+so0vn1vY066iSKjAayuWn/8yitGnCntKqhK24jeVTr93Xdajixe7o=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2017 06:36:10.0106 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2359
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.79
Subject: [Qemu-arm] [PATCH v4 0/5] virtio-iommu: VFIO integration
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
Cc: kevin.tian@intel.com, Bharat Bhushan <Bharat.Bhushan@nxp.com>,
	marc.zyngier@arm.com, tn@semihalf.com, will.deacon@arm.com,
	drjones@redhat.com, robin.murphy@arm.com,
	christoffer.dall@linaro.org, bharatb.yadav@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rd9sBrGZ4cfA

This patch series integrates VFIO/VHOST with virtio-iommu.

This version is mainly about rebasing on v4 version on
virtio-iommu device framework from Eric Augur and
addresing review comments.

This patch series allows PCI pass-through using virtio-iommu.
  
This series is based on:
 - virtio-iommu kernel driver by Jean-Philippe Brucker
    [1] [RFC] virtio-iommu version 0.4
    git://linux-arm.org/virtio-iommu.git branch viommu/v0.4

 - virtio-iommu device emulation by Eric Augur.
   [RFC v4 00/16] VIRTIO-IOMMU device
   https://github.com/eauger/qemu/tree/v2.10.0-virtio-iommu-v4

Changes are available at : https://github.com/bharaty/qemu.git virtio-iommu-vfio-integration-v4

v3->v4:
 - Rebase to v4 version from Eric
 - Fixes from Eric with DPDK in VM
 - Logical division in multiple patches

v2->v3:
 - This series is based on "[RFC v3 0/8] VIRTIO-IOMMU device"
   Which is based on top of v2.10-rc0 that
 - Fixed issue with two PCI devices
 - Addressed review comments

v1->v2:
  - Added trace events
  - removed vSMMU3 link in patch description

Bharat Bhushan (5):
  target/arm/kvm: Translate the MSI doorbell in kvm_arch_fixup_msi_route
  virtio-iommu: Add iommu notifier for map/unmap
  virtio-iommu: Call iommu notifier for attach/detach
  virtio-iommu: add iommu replay
  virtio-iommu: add iommu notifier memory-region

 hw/virtio/trace-events           |   5 ++
 hw/virtio/virtio-iommu.c         | 181 ++++++++++++++++++++++++++++++++++++++-
 include/hw/virtio/virtio-iommu.h |   6 ++
 target/arm/kvm.c                 |  27 ++++++
 target/arm/trace-events          |   3 +
 5 files changed, 219 insertions(+), 3 deletions(-)

-- 
1.9.3

