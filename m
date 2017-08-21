Received: by 10.223.188.70 with SMTP id a6csp3352432wrh;
        Mon, 21 Aug 2017 03:56:31 -0700 (PDT)
X-Received: by 10.55.147.65 with SMTP id v62mr21762888qkd.219.1503312991443;
        Mon, 21 Aug 2017 03:56:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503312991; cv=none;
        d=google.com; s=arc-20160816;
        b=NxrBmxbUR7aatLIt1XE05WCYtSUPFjkIcfkJ897ysxL5hy3nnUJcf0fxQlxSIUICIM
         Pwyh8WkqZz4kCAJQmAv66cGg57AQeRFRvt4SITf63KyX4Mese30UX4gBoEAamq3034k2
         e+wSjuvgJQOvlCmOvcAgeKiwEEOoxOGdtA2pyGz794B1FFok52qUSZcmnRiydo/fvl4i
         jrZQ7WZDXTV3K/doEyhY45dUgd94XvWJ7Re+baaov3w1h60zdS0EORd2CGGIp7wFQjlF
         wf8lA1LkVbYc7qavJkqmwDuWwMU2qDosJHebWjYQ0UGbKEh+ghJBn0HiXrC1ZfDUNwM1
         3IWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:arc-authentication-results;
        bh=q+acCt2dcQJWUuNZ6+MRupcJM8osqH2RKD/6ug9qeQE=;
        b=HP2qRJuVbDSrA6luxA/LgGkoGMjgmVfE5IstirAIKDZBzoxDo9sWV36BAwaxyQYQ3K
         nZgnsYk7Rlgz3iQoG6jgMBZ23V0kYHlXnoW85g6WSGwpKhnk1oXCR9rp4r22OQdJGG2h
         CvAG5kgQYBigcD5UF0SPl2hnJ9IvM2GSWKECVnxLLW6OaBHJ4H6NFo4iF/jOhzUYxO/a
         DaC6Oo5wWoOym/a3eXVw5aDFg+LFmmnTVbrDbYFvmffOEQUV5+mK5sXTdzva6UPYia1v
         7nur7VNwN8sBFuycTcVqsJt8xpgH+ku1b/o1qPUcMFYNG3pUZjmdVVGWQ7pufPtGGY1f
         5U1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p29si9184425qtk.489.2017.08.21.03.56.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Aug 2017 03:56:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:33240 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1djkNh-0001kM-1U
	for alex.bennee@linaro.org; Mon, 21 Aug 2017 06:56:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1djkJG-0006HG-Bl
	for qemu-arm@nongnu.org; Mon, 21 Aug 2017 06:51:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1djkJF-00028A-8b
	for qemu-arm@nongnu.org; Mon, 21 Aug 2017 06:51:54 -0400
Received: from mail-cys01nam02on0062.outbound.protection.outlook.com
	([104.47.37.62]:43952
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Bharat.Bhushan@nxp.com>)
	id 1djkJ8-00023k-UO; Mon, 21 Aug 2017 06:51:47 -0400
Received: from CY1PR03CA0013.namprd03.prod.outlook.com (10.174.128.23) by
	BN3PR03MB2259.namprd03.prod.outlook.com (10.166.74.20) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1362.18; Mon, 21 Aug 2017 10:51:45 +0000
Received: from BL2FFO11FD056.protection.gbl (2a01:111:f400:7c09::180) by
	CY1PR03CA0013.outlook.office365.com (2603:10b6:600::23) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1362.18 via Frontend Transport; Mon, 21 Aug 2017 10:51:44 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD056.mail.protection.outlook.com (10.173.161.184) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1341.15 via Frontend Transport; Mon, 21 Aug 2017 10:51:39 +0000
Received: from localhost.localdomain.ap.freescale.net ([10.232.14.21])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v7LApQtD004847; Mon, 21 Aug 2017 03:51:33 -0700
From: Bharat Bhushan <Bharat.Bhushan@nxp.com>
To: <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
	<peter.maydell@linaro.org>, <alex.williamson@redhat.com>,
	<mst@redhat.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Mon, 21 Aug 2017 16:18:53 +0530
Message-ID: <1503312534-6642-2-git-send-email-Bharat.Bhushan@nxp.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1503312534-6642-1-git-send-email-Bharat.Bhushan@nxp.com>
References: <1503312534-6642-1-git-send-email-Bharat.Bhushan@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131477863043825261;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39380400002)(39860400002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(6666003)(81156014)(2950100002)(5003940100001)(5660300001)(48376002)(104016004)(105606002)(106466001)(86362001)(7416002)(85426001)(2201001)(575784001)(2906002)(81166006)(77096006)(39060400002)(76176999)(47776003)(8676002)(189998001)(36756003)(498600001)(97736004)(50226002)(53936002)(68736007)(8936002)(356003)(4326008)(8656003)(50466002)(626005)(305945005)(54906002)(50986999)(72206003)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN3PR03MB2259;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD056;
	1:jgnvAZhsGDP9KQhG/GDJCK0TfCxEEzdSWtQKi+SGeDFf/njzCWXkyAbcFcBF4iAtGxMv4bF38wZ6fJxLLmgmkftlvzGtqx9pEcykUdbyMVSMDvtFYHUcZV8UHWMMxFd7
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 176ce168-faa9-434a-9d0e-08d4e8829d02
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(2017052603031)(201703131430075)(201703131517081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BN3PR03MB2259; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB2259;
	3:F620yyGDHOlK3alyCH7yswObrzkf1tkZYN5aflrem8lilrWYUI2JkW7qZguN1NjzcoFM268x+iOA7Md8dBWDw0pRS9S+JpZvPRnC/X4nEto0NOoy48VhKd64R0xImY52PkjRBh+c/pJxmdFzq6rQJLTtxPedJH1Ve+3sZXcjI4zaSafHCeYEtVc2u/MOVgJfJKS9ACsRei9jJFzdeU4qkKusbS+eyyKduuHfcvx68X7CQ9KKtL6iyi/YDZ4qHkK5/VVDoc3mNvQ7TOgRzzfgixAiO6Q6nt6fnASSI+URYyclQUUKZxNUWkfEpyBXGzhXBfXA5bw6l4v0NkpueA6KF+5D1pxS1DuR4SGYj3g6qGo=;
	25:3jLcwqBH/EnPFOffDyGmcFyP+hGiUlyXYcFKWYWaE5FJqKK0X+Lqk2Gi3hF7iYi5hiBTFnumwOTKm3KyDNjAMx7kXpST1dQwngXmtr9u5VXxqXXZqu8pOEsOIognyksgXg69Y+kj2Bt+FTpi5ILqpgbvXwaUq3OYrlO3rVQGhsJwxWeNm1Ez9QQcyPHqUVuswQhlcrQjeDljLqdzydR892h0d/Dg3W0kPnlNi6TkjcmsO7vgk/BCn6c/aNEi8HnzRY+RNBK9V0xZPQJLU6J5lXV3M/yEZ8oxelUhF+2vYrRPUR4DkoRN2m2ugAK3+50Gn49G2jCzswgob/sa1yYl1Q==
X-MS-TrafficTypeDiagnostic: BN3PR03MB2259:
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB2259;
	31:OTKgzD3W6OL8qA3WFoEvhV+CCopH5l/HRGwXacC4AY+XjmzcqARlMJQ9UML5BxaJt9Ji6oum/Q/0U4zWU+4c7m2+/ozkPVMH2qIZTRW1ws7l9USGsXIa1Eyrj2LANFJVVcCZdX6Gip7MTl98Bo0Mp2dyeinYrW0+wlA1FPOwDLHCwM/DsWnBOwNqtYgczJWHN8urYPfBYaIuEJUKZotWcZr0pUfvA0WJd6+mzcNZOsQ=;
	4:BRRoCwgTDwBbRm8flj/A4rZ/cLTm67eMy9ep0pfRoh/9L7VZqxrOsvCUy5ta00ajrx3FqL341v5fGti/+PgxaJlKOFhRb+seHPK4atNRd5fARqKlClOaDNoy0dkOb0VA6/8jyXcICC2aESYGPUNWAMmEOewCwqFl1WscdeFEXNYb1apOiPkeRea7bR9sYvrs++sj72+/WKNGpXYVTeszRjZh9IaHBEJUcaucWfsZhW3bDBe6pLWgstCwM/DANncebqKpAR8kNm8HNtTtqZBdLhHStwv7OdFZWzBy8vuIdG8=
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Microsoft-Antispam-PRVS: <BN3PR03MB2259EBE470C9C96218C897BF9A870@BN3PR03MB2259.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6095135)(601004)(2401047)(13018025)(8121501046)(13016025)(5005006)(10201501046)(93006095)(93001095)(100000703101)(100105400095)(3002001)(6055026)(6096035)(20161123563025)(20161123556025)(20161123559100)(20161123565025)(20161123561025)(201703131430075)(201703131433075)(201703131448075)(201703161259150)(201703151042153)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN3PR03MB2259; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(400006)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN3PR03MB2259; 
X-Forefront-PRVS: 040655413E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR03MB2259;
	23:JMrgyecnbQwxQlfFc7l1/tiSIn+pwdWivxsZwkK4G?=
	=?us-ascii?Q?o64ZA6P6tBC/S5TKMxqsNa81TX8g6lUnkqbamI8hPaeI0nY0lIgz8PdKvBa4?=
	=?us-ascii?Q?lXaRq53gCeaPpBjeGNlqUo8Zo5sHv0jwbFpXVKlwwoiKqbkd/6EjuAlv3xwf?=
	=?us-ascii?Q?Ib2x/EDdOgdfPP7crJxbJqpMHd2nUXP4m1lIdjekKHj7KZVgqw+c5uJ26r3v?=
	=?us-ascii?Q?Uv82mOOlpbElxxoOqTBQOKiwABBdkzI+zaHFrd73Adi7LLepf3B6Gh4afmIp?=
	=?us-ascii?Q?+mYgBQ/hfYYFvdgWTprVQGNIV5n0fcD6E5tjv7OoGHetrzW+NvLDNR8Ce+dk?=
	=?us-ascii?Q?z4BWvslVIWLaWxvQiCfLJcJN2nVGOGvIx+PeZd+b0N6O5mN+5i2zSuj8wbIu?=
	=?us-ascii?Q?gCES4d1pjZbT90LzwuS/Fer9DBhvW1QbwpNi1Uq44Hrg4dqSeJWfYsCqflzU?=
	=?us-ascii?Q?pHa02O4RS3hENUis95DnczKAy5jif1iS2ymoskQyPxM/A9q7bwe4H9NIpXU7?=
	=?us-ascii?Q?2iLnE1wxFI6cyjRO6m3csnBDEpXvD4Wk9jmP13WajDl9TUj0+OLmn6+P9hRy?=
	=?us-ascii?Q?g80WasIO40gTGgCMOAxkf7+4C2fMEvGDH17THVmtNSLQDwZfT2lzrrCSQ3IG?=
	=?us-ascii?Q?GUD+krDaSZxX/6KfJHrM3/wadJNQ79ciFY5ucn8BAj8M3ziXahgHGnCrrSdl?=
	=?us-ascii?Q?oFY4QbX+CWGUsUx82Zw9fzOWW/1we3EFsi+dZfBuZN+UyfVu9PfvwK2SFXCz?=
	=?us-ascii?Q?QEC3IayAuGFafFWjDNV2ACmHtC2uAqe1Gt16yThLLbJ4KN3jGu+WI0J7dpZR?=
	=?us-ascii?Q?kmmHbSA4NCpAW+klSawbycW+f80iS9eGOBhCTnUQaL3ypLF6Wy1uxrtRzLmv?=
	=?us-ascii?Q?691Xw3v3/CVoVMLQEH3fFMwdwGaC4Be1gciA8lek7/+o9pw+Ok2P58MwqqGf?=
	=?us-ascii?Q?w4FWR2BgYvfXBIKqfxsgM7zXCQ2IKJPNQt9X2UriplPTaS1LYD8UHhO1acgJ?=
	=?us-ascii?Q?2k8jR6ltGm26UOCkc8frqNz05iBKTFRqPSY7riA13UETIC6qhf3+zO6oQnu9?=
	=?us-ascii?Q?CKKKARifS9NzjtcEFhemKgLbfABWGAga8L0zyygghXl0RMoMOauAUKasf2DU?=
	=?us-ascii?Q?fULvj/W0Iv2Kna6zDZRSnCH/AE6HccMzCf7ftjUgQyWiLPltRVAa8sCHtrnU?=
	=?us-ascii?Q?pMaJZwfmvd+CEQ=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB2259;
	6:jMbNL12xbk7LQ0TJy2QIGYgYCHtq2LoG0pNo2/cMwnz9XTpotD2n/h1Z4GVTH0IpSKbHDwtkonb5O+YVyW/3dvXPfjuwXjqYLwHVsNuSyAG3D2wsUU1cEankcZkwSe52hoTJ3A7wNihNdFRj81fCRGqSMN+TFlw7bLtBRfu2cwAuSF4/kM0Eu1/WzZp722Gs8qlcG/FOPQ4zUOoe3TCka0Bhb1b4+uLBWUcVtXnpQoFTOjRamF3i8fsfxOer4GzABIocAZJk2cv0NXoNrPLpiLZyqxZT9GBU8t+wkA3M3AN+zkNAux6tg79ZMPEYAiw6UoOcnh7McGQKwDrvQTUOfg==;
	5:gynEk4svgXqSZ8jOyzXJInYo3pDBCNTZT6QUDIzGY9/4ekx7RLoO7B3OSp7IZuHEhFfwqgD6Evrtz0sJRG+HYxkIRWan6Gj3DGvmUCHDI6zAvQ05m/1OZH2iJ+NMj3OQtUphQJXrfhdBJy5zJJC10Q==;
	24:a3iPSte7mcHHAReV7iU7djbLxd7tTC+2n43d7zzPzlpDb3ats07PORQPkoBmLo1/ZaQizuZJUb4ITfaQZtiqJ3PbCxPjHREeXf03510Ky+8=;
	7:Nkvu7fek4l3U3uKExqa3o7X/qP6ahz/AtaTHiOhKEmqa4mqT1PfHdzN+qxfVEyTkOmgoNbgZzJdHRGvpuYbGBEfxnhCpF8u1n8Uw8tlnm+hucwgBhnrLM4WOuMic+/x4nRx88+8zsbBkcSIwES8e2S6iElWmplWfQwKyW1f8ondXFvJm6MxbUH7YrjgWMKdY+AEM0QhBxSpvxmB57lgnZQHCw9hJLE4/AcXrlmJkJp8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2017 10:51:39.1097 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2259
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.62
Subject: [Qemu-arm] [PATCH v3 1/2] target/arm/kvm: Translate the MSI
 doorbell in kvm_arch_fixup_msi_route
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
	drjones@redhat.com, robin.murphy@arm.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aTNAbT5852am

Translate msi address if device is behind virtio-iommu.
This logic is similar to vSMMUv3/Intel iommu emulation.

This RFC patch does not handle the case where both vsmmuv3 and
virtio-iommu are available.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
---
v2->v3:
 - Rebased to on top of 2.10-rc0 and especially
  [PATCH qemu v9 0/2] memory/iommu: QOM'fy IOMMU MemoryRegion

v1-v2:
  - Added trace events
  - removed vSMMU3 link in patch description

 target/arm/kvm.c        | 27 +++++++++++++++++++++++++++
 target/arm/trace-events |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 7c17f0d..0219c9d 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -21,7 +21,11 @@
 #include "kvm_arm.h"
 #include "cpu.h"
 #include "internals.h"
+#include "trace.h"
 #include "hw/arm/arm.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/msi.h"
+#include "hw/virtio/virtio-iommu.h"
 #include "exec/memattrs.h"
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
@@ -662,6 +666,29 @@ int kvm_arm_vgic_probe(void)
 int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
                              uint64_t address, uint32_t data, PCIDevice *dev)
 {
+    AddressSpace *as = pci_device_iommu_address_space(dev);
+    IOMMUTLBEntry entry;
+    IOMMUDevice *sdev;
+    IOMMUMemoryRegionClass *imrc;
+
+    if (as == &address_space_memory) {
+        return 0;
+    }
+
+    /* MSI doorbell address is translated by an IOMMU */
+    sdev = container_of(as, IOMMUDevice, as);
+
+    imrc = memory_region_get_iommu_class_nocheck(&sdev->iommu_mr);
+
+    entry = imrc->translate(&sdev->iommu_mr, address, IOMMU_WO);
+
+    route->u.msi.address_lo = entry.translated_addr;
+    route->u.msi.address_hi = entry.translated_addr >> 32;
+
+    trace_kvm_arm_fixup_msi_route(address, sdev->devfn,
+                                  sdev->iommu_mr.parent_obj.name,
+                                  entry.translated_addr);
+
     return 0;
 }
 
diff --git a/target/arm/trace-events b/target/arm/trace-events
index e21c84f..eff2822 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -8,3 +8,6 @@ arm_gt_tval_write(int timer, uint64_t value) "gt_tval_write: timer %d value %" P
 arm_gt_ctl_write(int timer, uint64_t value) "gt_ctl_write: timer %d value %" PRIx64
 arm_gt_imask_toggle(int timer, int irqstate) "gt_ctl_write: timer %d IMASK toggle, new irqstate %d"
 arm_gt_cntvoff_write(uint64_t value) "gt_cntvoff_write: value %" PRIx64
+
+# target/arm/kvm.c
+kvm_arm_fixup_msi_route(uint64_t iova, uint32_t devid, const char *name, uint64_t gpa) "MSI addr = 0x%"PRIx64" is translated for devfn=%d through %s into 0x%"PRIx64
-- 
1.9.3

