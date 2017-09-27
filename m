Received: by 10.223.172.38 with SMTP id v35csp4371437wrc;
        Tue, 26 Sep 2017 23:39:43 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBqlxEOHZbFeJtHgmnHBXl+lc0J+fa+nNPDk+Fb0eR1fwvD59j4yMEU87bS1TzgbvfLhTi1
X-Received: by 10.55.47.6 with SMTP id v6mr975228qkh.181.1506494383203;
        Tue, 26 Sep 2017 23:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506494383; cv=none;
        d=google.com; s=arc-20160816;
        b=mCKyn43sjdaLfF+oBSV6USKGaKQ8fEzpmXRFjlo+f5psSYq8AYtlnvdoc6Odp+DOHF
         chpco949zHnkazs0xWLuhvYWcYqvsiGmA3xST2eV6JZrzyZ7C9PLLdYTPBM8ku2pbuBJ
         xi5lf/WE7p0CwcGKBwRI9BgqsgiAMfpI31JUZujUf0G5FH7ns+ZVeb25Xf2mYSStMzoX
         c7mFyY/KrDRPrTDbbqfhxd/gaWTjD8MB6mRLbnljn32WN+WvnMRfARlQg5bvhY9GkVbI
         TXDVnLDJyei9FEzNFejPcOT3JwgZcSSB/hUTsq/Zs5ZaIrc55F1lX5ZfLC0RbvAfVz8O
         CiGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:arc-authentication-results;
        bh=Gyx/1nA/IFamLExvIplmqgSLsGYvlSodCV0zjqcjVmQ=;
        b=oF0rJfps82THurNOLW1nJGxUjauqZoppzCNJXa+EJyp+1MFSoaRw6uZo6oCn3A1OMb
         uu9SXDRlKgTSpHPsQ/trCEhUWgeYnDCmlSXGELnuODggGdVvz4ZUE4q6JUeOqrsBEhk0
         ZC06aGs4PgK4DsY3sk04Bl/+nH85nxnHLo/gsx4qUaMGDooY2S0KplpTqhSmE2iWeeel
         gSyoGyrbP6VH/P1uCm9pbJ0CagPxS0dDZb6y4k/iqkLbbqSAwRPw4QvKno36PclRXdxy
         NoJwaWeDVRhbn3BK98tSgpIHIYN9l7yP0MJwHXw5idnWvgnMfp1iEF72nRHNspOnFi5L
         VjZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y2si5069579qkc.14.2017.09.26.23.39.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Sep 2017 23:39:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:52425 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dx60S-0003mU-PJ
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 02:39:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dx5xZ-0001EX-Aj
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 02:36:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dx5xU-0008Gm-MD
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 02:36:41 -0400
Received: from mail-by2nam01on0056.outbound.protection.outlook.com
	([104.47.34.56]:30835
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Bharat.Bhushan@nxp.com>)
	id 1dx5xU-0008GH-CF; Wed, 27 Sep 2017 02:36:36 -0400
Received: from BN6PR03CA0009.namprd03.prod.outlook.com (10.168.230.147) by
	MWHPR03MB2703.namprd03.prod.outlook.com (10.168.207.137) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Wed, 27 Sep 2017 06:36:34 +0000
Received: from BY2FFO11FD036.protection.gbl (2a01:111:f400:7c0c::151) by
	BN6PR03CA0009.outlook.office365.com (2603:10b6:404:23::19) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.9 via
	Frontend Transport; Wed, 27 Sep 2017 06:36:34 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD036.mail.protection.outlook.com (10.1.14.221) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.56.11
	via Frontend Transport; Wed, 27 Sep 2017 06:36:33 +0000
Received: from localhost.localdomain.ap.freescale.net ([10.232.14.21])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v8R6a2NC027330; Tue, 26 Sep 2017 23:36:27 -0700
From: Bharat Bhushan <Bharat.Bhushan@nxp.com>
To: <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
	<peter.maydell@linaro.org>, <alex.williamson@redhat.com>,
	<mst@redhat.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Wed, 27 Sep 2017 12:03:19 +0530
Message-ID: <1506494000-31982-5-git-send-email-Bharat.Bhushan@nxp.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
References: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131509677940022535;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39860400002)(346002)(39380400002)(376002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(77096006)(6666003)(81166006)(68736007)(5660300001)(104016004)(85426001)(4326008)(2906002)(81156014)(189998001)(2201001)(8936002)(86362001)(8656003)(39060400002)(305945005)(97736004)(50986999)(50466002)(5003940100001)(106466001)(76176999)(47776003)(105606002)(316002)(53936002)(50226002)(8676002)(36756003)(110136005)(16586007)(498600001)(2950100002)(48376002)(54906003)(72206003)(356003)(7416002)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR03MB2703;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD036;
	1:QG8jFoOZ6J6LRM7hoxgC217e8iI2gDsJFIKMvIDfnpLQ9ltwYH3LSb3AQuNPhJBgWQa3NAnHbVLIXTyo6TLg4EceQgqPIKJhlKUq6d1DguIbRtCE4MZC2829ZGeectCZ
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8dc7eddf-bd1e-4841-120f-08d505721888
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017052603199)(201703131430075)(201703131517081);
	SRVR:MWHPR03MB2703; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB2703;
	3:vDAsXj/tWpTZg/jl+B0HqcTyRsN8VB2gkd8DLXScZzUjVslklyVMAMyZXLwbt/X49MFO27rfoDaof/fQwi8jWV3LkRgk0a7I8gmgIl1fG/9vWNMFXFqN/4CCuE943u9LYovpDX2r0W6t9UCUC0KCTNVZ5cZ0CAPAEFxiW2CmkQdmsIdVN5YweExnTXnKirpSjFF1kUIUMeLcqRQQ1kgou0ebWSaz910wfVVo2HLLKFfkfDnfxtF0y2xabAqP1g2dnEuL0l5Pp31DLCNY9M+8NdVLave+Lr8GnafPcHGX/Ahb51/MLIc1mZQF37AG05mWpN6RsOsV2+yiiZuyaDXfoJslLJ2myDwDwTnOeFF8HJI=;
	25:jT5R2uqylQuUKqL+GBI8965EgH8xXPbpsUFH4As8i9dz24rV/WhyRHu4kUhfI70K4x4HzO1esIXSgvvU9DPPZYs3fS2L0QoKD3WowC4HVO50ElE6WnHkQeWcgvxBIVItbUbFH7y2h1Fq8Fafr4MgQkcd5O10c5R9vxe3Vm3EK5mPXyiNT9xZyJCk5p74R1d2My21fR2DBZt8qtw2oXKYmYqnbyT7OatNKKD6m67nygWnB2mj25pRiigCnGnVYtntNM+SaQM+PnK0jZtUox/SoHW8C/aZSWjhPN0ZGsNcScqFk1bDfKvQODd1uuReLzbgj2h9GOzQufzgF9R9u2X6jQ==
X-MS-TrafficTypeDiagnostic: MWHPR03MB2703:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB2703;
	31:XQvDtbXpNB6ByzDXrWyQ8gjjP0HN4kCNQWs4Y3+ymaa15OoD20o87VVbhGsHab8vF941pJSkD2NuADRZr53pUv2a8/0rGRBhTFSSiJOF5KTXOIy4WwbGGJBJcby4KBNyIXbWT3pmDcZvpkGVnscjijPb8Xxeea27+SWQaNyEfq8NcyITXBWQ7HZaDA9pbDJFnFy86ICuOljeyqXio+M+1gCiXDB+nz9I1uz597bxlkc=;
	4:50foa+R1vi5XW2xwv1qLIjkoNLEYrTOyzf2zfTIA1A8n9P9beniCR04l6d33POf/7mnaKCd2hS5Ih5uPACfEn7fAp/U61QFcv9wVxQB8ZrjFdnvbhVpWYfuzxhqZKekQW17GPJN47OiwaNTQMK6kTgF9VtjRBD9/HZzGPfwHX/oVKSCYvuAKdpf2UC84YGa2funi2YffJiOYkURVlN9OuSEvJphcMUcskSmYmezwRaEkIxrzCLaC/dCgmdtMWPdHdKefvI4q0OfALPstuxwdC6xMDnM/GfRyKVAkAw+T7tQ=
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Microsoft-Antispam-PRVS: <MWHPR03MB27032EE1D4B61125699CD2A69A780@MWHPR03MB2703.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6095135)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(100000703101)(100105400095)(10201501046)(6055026)(6096035)(20161123561025)(20161123559100)(20161123556025)(20161123565025)(201703131430075)(201703131448075)(201703131433075)(201703161259150)(201703151042153)(20161123563025)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR03MB2703; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(400006)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR03MB2703; 
X-Forefront-PRVS: 04433051BF
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR03MB2703;
	23:M1VGQxEKcy4ndODc3FTDyeh2bsCIXGwVintJhMUbv?=
	=?us-ascii?Q?MkeH4/J3A+xc8i4xML7rxj9tUz9UUnVzYop+71Do74WT9ODoxDt1NvRPRfgW?=
	=?us-ascii?Q?NJ8AFwMqiCjgd2gLs6XK89vsOhIN9Xs81oSVS0idt1x4a37Jeuxemt4jxmXH?=
	=?us-ascii?Q?O40nNQTJgKcjwQuxY9522RtDuDGo/GdtStJ6/GPsFbhGrXRmP2RNlapPEJVE?=
	=?us-ascii?Q?/wDld67ttGwqYzJjKWH2w11TAqCSh75X8+XGuNyPytWlLOg8GShNGJeVWjmj?=
	=?us-ascii?Q?HHGYYsNqZNAyvymxSu4Ynn7tDoYNNOivWF2gU+sArVwiKMzFrU2G5j7Yql2U?=
	=?us-ascii?Q?9Ck/Yuvq2e3r1sd9dKLPlZ3Mtk2hb/VfAilKk6U+62BwqbVB7Whcfx3aEcBW?=
	=?us-ascii?Q?Jun70MJewVIeeO68eiH0lGgQSy5LVm4+wLPHOeZTV+mwOb46pk2hxRBqccav?=
	=?us-ascii?Q?1eCc48noHBUP83oXbq7qBpvYwe+InD52D630NnMxkO92blC6VaPcdskctmpd?=
	=?us-ascii?Q?YchtX9PxJCGzewrckq5ALUpmpXwGj77yC8k2CpGqpc3GmB3WX0tieJ47tIBG?=
	=?us-ascii?Q?zJLUuCxI83TjKD/uxJeABreGCqHeBXaFJ7kp6el+k2KUditJUgRA+hp5Lp45?=
	=?us-ascii?Q?J6Qjk/bG0s+DZa59vBg5OsM4Bk2Ads8EvqVkRiXsJPE2fNnKChqSXzTqGNIR?=
	=?us-ascii?Q?kvBiofczRHdlzWtueXo+8mUiqT6k/Q+UBk4q6FcGIM6lQZZ4Th+ZWQya0/nH?=
	=?us-ascii?Q?Q4nwvqQsIij/HgS42qN0WuUlSR/tCmpXLow9KBBiGCPl4VWdvrJS6jGBnG7D?=
	=?us-ascii?Q?FjLme/ZJ9n5/qfgPUWOAEQm7p/wCHX1LuMHxvhiWfKmK/+IFHp0QU9E6aRfP?=
	=?us-ascii?Q?sWh8ziMMndhTfcnNQZ3C3w/5BSmRF1sRZrIFrKvCI49V1GTqGxqDWEg/tkwV?=
	=?us-ascii?Q?0ZXNTg8UalVinWXWQ6Ol79VfSQePI9+lIS2hmEZMavS9eE+2pUnGEpfgDFaE?=
	=?us-ascii?Q?jt7o3w2xD7IBLjcIuFrYhnh6VTOVKgEff50MPSWaMIPzfjGBCdYvr3K61W6U?=
	=?us-ascii?Q?L/TNvij+XLzqFGNW0/7jrisaFu1GNC/Ba3AEY5y4pbEkQxNW38uy2DPosBiN?=
	=?us-ascii?Q?icL1y2ewhFy6FzIH24gGoZwomuxeq+GaVRf/JsSHv1+/+w294puu8aqsdc6y?=
	=?us-ascii?Q?/lbOpO7nW1PhSl10wLorfYOUfhez1rDOSM+HFj8JTFn/5DZ0WLwiSc6kw=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB2703;
	6:IpPEfz6xv1G63aThzOH2R9dN0k9TN3HuNGN1wr6rUJm08bOpfuMcxAKJPziZPs3wLernljfD9Wm8iUW170oX1KaWdCf5/446xHMm83F73NNg04isRajvJ4RjqRRoJW4ke307LobKiZ9S5DgKKEGdxp/2xp/aeIba+NC0tUZ/5GzFjr1MRLuL43nILvrEhRJrKJu2NBcblpCR4zh4N7Q+rxmRB7EHx1qq1r54Ef5bww9+eI6KDyrdHHMNm6cSOlllvdPiLmAFB/PMA6RKuIGxTJud8ZDBGhUAJo5UQcmMjuXT8jtxMG1tG/VF7BlWWRxbLlyMPzgrkR06eBz2IHRCsA==;
	5:oScIHEfvhwY8CGy7m8SUwoJZGeXgDBCh7zbTfBPdt1WzlPfSRys4ED05zAq9m6Twyc4rc/0m6V1eQbFojoqhSMtfJnicrUxP/BLK1ZdtvzNkdfLAxo3O68QfvtFKNlJoQVRLXDQ8bAeSlozD94MwcA==;
	24:SmwLCiw28LM8fJik0QK7uMJyiDMnvzl8NWr05qe02/sit3HNsNFMmfYJW7f9khr+nnrZkGhMotHV0J6O+Q3gdrZvHA01FFrW1BxQCP4Hl7U=;
	7:Bo7Eh+FetdVeT2Tgp1UuIUEtocoUwSIslVRAZk6yFjkp/Sg5j16BdGoYzuEU9iU5Sl6RrwLJ9l0FPJMqDUhQgsxx7x4Z1A1hztpvwWSy6Cky/No3w8RL097fT0xvmpL0B9Cq2ri2y+7VdUCv7pWgJpu8mcPg4FcKiVeao6RHgLuBOSh9GEy/0an6k3OteC5D/Wjvz4elx4xWh8pQp2P2cYJ/UDp+Z7RRfIMFTFwbMg8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2017 06:36:33.6902 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2703
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.56
Subject: [Qemu-arm] [PATCH v4 4/5] virtio-iommu: add iommu replay
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
X-TUID: bxsW6ODxtd/Q

Default replay does not work with virtio-iommu,
so this patch provide virtio-iommu replay functionality.

Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
---
v3->v4:
 - Replay functionality moved in separate patch
 - No other changes

 hw/virtio/trace-events   |  1 +
 hw/virtio/virtio-iommu.c | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 251b595..840d54f 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -51,3 +51,4 @@ virtio_iommu_fill_none_property(uint32_t devid) "devid=%d"
 virtio_iommu_set_page_size_mask(const char *iommu_mr, uint64_t mask) "mr=%s page_size_mask=0x%"PRIx64
 virtio_iommu_notify_map(const char *name, hwaddr iova, hwaddr paddr, hwaddr map_size) "mr=%s iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64""
 virtio_iommu_notify_unmap(const char *name, hwaddr iova, hwaddr map_size) "mr=%s iova=0x%"PRIx64" size=0x%"PRIx64""
+virtio_iommu_remap(hwaddr iova, hwaddr pa, hwaddr size) "iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64""
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index ff91bce..d4d34cf 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -906,6 +906,43 @@ static gint int_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
     return (ua > ub) - (ua < ub);
 }
 
+static gboolean virtio_iommu_remap(gpointer key, gpointer value, gpointer data)
+{
+    viommu_mapping *mapping = (viommu_mapping *) value;
+    IOMMUMemoryRegion *mr = (IOMMUMemoryRegion *) data;
+
+    trace_virtio_iommu_remap(mapping->virt_addr, mapping->phys_addr,
+                             mapping->size);
+    /* unmap previous entry and map again */
+    virtio_iommu_notify_unmap(mr, mapping->virt_addr, mapping->size);
+
+    virtio_iommu_notify_map(mr, mapping->virt_addr, mapping->phys_addr,
+                            mapping->size);
+    return false;
+}
+
+static void virtio_iommu_replay(IOMMUMemoryRegion *mr, IOMMUNotifier *n)
+{
+    IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
+    VirtIOIOMMU *s = sdev->viommu;
+    uint32_t sid;
+    viommu_dev *dev;
+
+    sid = virtio_iommu_get_sid(sdev);
+
+    qemu_mutex_lock(&s->mutex);
+
+    dev = g_tree_lookup(s->devices, GUINT_TO_POINTER(sid));
+    if (!dev || !dev->as) {
+        goto unlock;
+    }
+
+    g_tree_foreach(dev->as->mappings, virtio_iommu_remap, mr);
+
+unlock:
+    qemu_mutex_unlock(&s->mutex);
+}
+
 static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -1003,6 +1040,7 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
 
     imrc->translate = virtio_iommu_translate;
     imrc->set_page_size_mask = virtio_iommu_set_page_size_mask;
+    imrc->replay = virtio_iommu_replay;
 }
 
 static const TypeInfo virtio_iommu_info = {
-- 
1.9.3

