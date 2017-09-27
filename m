Received: by 10.223.172.38 with SMTP id v35csp4369586wrc;
        Tue, 26 Sep 2017 23:36:50 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QB7wBm+NTlQzEAsmIoHjW309CaaQdVulEDqfR7dCBHFmzIwFSjFqQg5/j/EVOak7vcJQR3e
X-Received: by 10.55.168.12 with SMTP id r12mr873645qke.283.1506494210409;
        Tue, 26 Sep 2017 23:36:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506494210; cv=none;
        d=google.com; s=arc-20160816;
        b=NI8bZVoHthSgYteMVS+hEryQFuAcJV1FDoTfeK6IxjahRMaS+QPjR0zp58ittd4o/2
         1dUJF8iXoc5aAE6HEbiVUFsboS5QctHDeVrjgdmr47b5k36X8fmAvWTAW4GUF2YoheIg
         3z1eppxV+v2yNDjk7p+uaRucenaHJu1F2iKb2AlOOegpyHid/W1qucSW8wxF0fmdQvQU
         teH5/CXVAWeXPQKnCDbFfHDko0we0/GAQ5e4BgxJKmUnxqM1aTY31NXrLjOkSjhv1bsf
         c2Ow25WdIN+dhSn567XcD47aa3bSayqNpnfWadIctEpgBL4HV5icWkELv2/Chsg8lDAz
         f9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:arc-authentication-results;
        bh=L3/AAu1v/MrnK67w6/wth1mjbhbT7V3LPeElhy5q8oc=;
        b=dBFLf9JJ6470eG8Ajc0tJ5mVdw0UbkxXX3S9aV+UtUKd96acoqg6k8ZCqB77MYnh8b
         28rgwUc1dNxxcRbc4eP7PEyeS/egk051F1J9h7kb76L47AUbSS9qMMRfppyZVWQSNGZn
         xRS9x3cWQlyn33Pz2sTd2ge2EbjHQk6scHho8BQ4Ms1JNxj2nRyRII4toDTRoipyaNw6
         2Fy5RpOFXrT1PV5bCW5kNO/3fqwU0IStXnpavJOHrCh7UJX2+84W8MvEJs/LLuzbvV14
         O2KxzaDFuYTnmTNlAbflAQpeQs7f9OXV38ruLgwEmxD5ekeKEjnXmx3cwbZYyHAIRzS5
         UjLw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l30si10028690qte.184.2017.09.26.23.36.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Sep 2017 23:36:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:52409 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dx5xf-0001AH-Vl
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 02:36:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dx5xP-00017o-14
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 02:36:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dx5xK-0008AC-Az
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 02:36:31 -0400
Received: from mail-by2nam03on0052.outbound.protection.outlook.com
	([104.47.42.52]:27506
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Bharat.Bhushan@nxp.com>)
	id 1dx5xJ-00089f-UU; Wed, 27 Sep 2017 02:36:26 -0400
Received: from BLUPR0301CA0010.namprd03.prod.outlook.com
	(2a01:111:e400:5259::20) by DM2PR0301MB0736.namprd03.prod.outlook.com
	(2a01:111:e400:3c0d::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.77.7;
	Wed, 27 Sep 2017 06:36:23 +0000
Received: from BY2FFO11FD004.protection.gbl (2a01:111:f400:7c0c::117) by
	BLUPR0301CA0010.outlook.office365.com (2a01:111:e400:5259::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.56.9 via
	Frontend Transport; Wed, 27 Sep 2017 06:36:22 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD004.mail.protection.outlook.com (10.1.14.158) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.56.11
	via Frontend Transport; Wed, 27 Sep 2017 06:36:22 +0000
Received: from localhost.localdomain.ap.freescale.net ([10.232.14.21])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v8R6a2NA027330; Tue, 26 Sep 2017 23:36:16 -0700
From: Bharat Bhushan <Bharat.Bhushan@nxp.com>
To: <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
	<peter.maydell@linaro.org>, <alex.williamson@redhat.com>,
	<mst@redhat.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Wed, 27 Sep 2017 12:03:17 +0530
Message-ID: <1506494000-31982-3-git-send-email-Bharat.Bhushan@nxp.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
References: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131509677823754597;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7966004)(336005)(39380400002)(39860400002)(376002)(346002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(498600001)(16586007)(104016004)(72206003)(5660300001)(48376002)(77096006)(50226002)(50466002)(53936002)(2950100002)(54906003)(8656003)(356003)(106466001)(105606002)(5003940100001)(316002)(7416002)(85426001)(189998001)(39060400002)(8936002)(97736004)(86362001)(76176999)(2201001)(47776003)(50986999)(68736007)(110136005)(36756003)(4326008)(81156014)(2906002)(8676002)(81166006)(305945005)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR0301MB0736;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD004;
	1:WVZKUWgoqMpR77v7Rn1qJ2zF0lx1VCVsITVPVXvmcRYuiQ2MF+8D7kwzSlsWNIv4Y+aVHZKV0nkmxdjuqDWhSEwrZ/axiFrrMcm3XwtVRj8+RVDwmBNuMLGKb/21Vb/Z
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 914b48e5-625d-4e4f-0165-08d5057211ad
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017052603199)(201703131430075)(201703131517081);
	SRVR:DM2PR0301MB0736; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0736;
	3:p+ha9Sdx38o1VbK8EbveudQIdf4Cl9pNeoBtTP6DGWdV8BFcoEEVYyqyElBvRj3FnyHsk3frnxYOXtxdUCOfNxaM5EpObWET3qckkeCdIZkVqqWVQDMesVxDLRBxNU4/3UnMbJWj1aFZNkxzLw+FTlqZ5eZGhOS9q8xB6mFq5m0SDsXM9lmjHapyWyL3EyFUDZgcLmck1YnJMpiOqhjUWDu8PffcukUTLCBD7ED8O5mfZuKydhMr5x4FaqMjz/Ey2oPje5rPBQrv59cv/v+M2hvQKetywy5Gh53enj0ZTU5fhRxxVTJYBi4xKJcsgpM/D6PBtGmfSW3kmkhI7BCgQh5DB5D34ZZ3OEC8VOJgiYM=;
	25:3D01FBlqCFwprwE/ab2tYjicXnhepdvCpiRhAEu/vKSWZ3B/w9zVSLDwpMGY5Ljo4wX/QxHLsFK59GNi7OUgrBbAGv7o5vL1QB4YkgYUZ5/J8XJ26MZIknxJUe7pafI33+ygPZ2CPk0pTj3vzp/CkgZr4Ldl4hds/XGzJAWsxWFdLMKKdhCXz9PiG+VRDuX4uS8zoAll2CjUn+5yGatbTQtHDdXfzUn34+6vfqknCU3p5/0ff/9C9yiYFqgPtWNLYjThnRzRX8GTWyODlqygO8Q1Wh/WJewoo4YSBcLliCVSh/xo0KR++94R00hWiICMMET0dEuWEC0JP9rpyC7wog==
X-MS-TrafficTypeDiagnostic: DM2PR0301MB0736:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0736;
	31:nIBIf9T2fW667WmS47NxyQDix59mH0pn2MxTq2Sl8+ywPsf7mo2Llwv/quy7BHX92TUAGO3H9Ta4IRWxySzDPy4rYL28nIPgA4gjDlThcja52DoxWX9mrpYRVvCQ69drpt3r7LinjWpHmq6zCoS3OWOCQib6GQVa3mfSG+5cubRcNfW6lFEC/gRit6pdQf4Pur2/IB1RyCf5XNeYAwhk4kRLptlxDDEjXPcVpIcJcog=;
	4:WqMZglp3k3Ld80UNlHLditg90cJxQKPI9OwIXQ+j4hmKex46lD8IfgmVIhXLOjW8d0LH8U+tgtkdZksIS43knfrDoSRF2l7ABxJV8zwx7d6kashUGzET24YpmiZeuyUitUJV2Dxpx2TB64dYBm5kl0r36VXIzl9gUmuHJuoQg7sByn84PYUnNqvF0GlVFqeS/RME4aV51NGImwFvxM6BcQJW4Po4Z8tghN5UiPShHnApi5qbL5BR/6iygO+4QiF2KOGnI78WoUpYHyw54P4TJDadQj42H6TOvXlkcYiKAtc=
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Microsoft-Antispam-PRVS: <DM2PR0301MB0736C73E99A7224B57126B0C9A780@DM2PR0301MB0736.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6095135)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(100000703101)(100105400095)(6055026)(6096035)(201703131430075)(201703131441075)(201703131448075)(201703131433075)(201703161259150)(20161123561025)(20161123559100)(20161123563025)(20161123556025)(20161123565025)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM2PR0301MB0736; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(400006)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM2PR0301MB0736; 
X-Forefront-PRVS: 04433051BF
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB0736;
	23:2CJBWefJsLsELnHG+MYyQfPZI5X7+Gx+2C0hip1?=
	=?us-ascii?Q?BpLJRl5CJck9Un4J0YqwJbWW2KmPHlrl016iEqGLquWjhQbzKq48m7sV0MbH?=
	=?us-ascii?Q?UMTUx/33nyD+Ra369hibtflj4w1gfFbxrQsj1l6reAHD+R8YHaznXhnN8Mhu?=
	=?us-ascii?Q?2JLnc8y0J66z+4YR4q10a6W1WPlpcZpLohdXaxa8BTqhon7wC+2GFijTRyye?=
	=?us-ascii?Q?wA+uNoj/rra2W+0pNcK8p8NqwFZKMeZUaC0ogZ9i6LkLs35BRKuyTNfVF/8i?=
	=?us-ascii?Q?qDSv+ljEkf8LfdUvHxNi8Hx6wlss1rwLb1Ahkbm/mKNp8YKXLjQamY4JNWof?=
	=?us-ascii?Q?jJsu57AunX0qMcZClJe1bcGNLVqedk2lAOoWJLOgdtLFcYGGJOq+cikB4Ky7?=
	=?us-ascii?Q?43edYt4CT3cYyqC/9RtjPmqROvLn5GmcqEJIRBe6y3Y9l9pvVLGwNzaL8hiH?=
	=?us-ascii?Q?t2rqZMSJomMCXhqdLImRdZB8w+GzsYXjIhEPbvwCQfv3EHuKys2B9U0Eso+h?=
	=?us-ascii?Q?SAecr/G3e2SBokEL707WLmjRFKDZBjo2sbornJcP+AjZysnYh6t4vcrpAg0s?=
	=?us-ascii?Q?CEKTpzdKJZasuMqkkjg4/mkqydXt+4rx1PCKvF+QYnJXux9xmFE9z3MWW6qA?=
	=?us-ascii?Q?TCrsUHQknAH4BuA5mBEDAY/TWcw7DrCRQW8RRYeMPfqBBzZSAOIIlsNC015p?=
	=?us-ascii?Q?rVmBnCEo2Wnh5M8aUXqVYB3mfin0q3rm6x9lBlAtDEw7f03cGBCBkIrTjjZk?=
	=?us-ascii?Q?1WeiCTaIEf7hiL+IGCxfPMPd/zSkocLqJ9ZEMPWdMppmoooZ2sP7SuYaOnAj?=
	=?us-ascii?Q?iCPcy/NzTOwMifWvcBfaCQzq+juStowITzdxUb06VX7S/xN604MCKWgbOZ75?=
	=?us-ascii?Q?++Bh5qQRQ/II9cQV4mP4/ILSTkHoyf45ZLEk9+nAjC/UZVeVCAs8izDgr1B2?=
	=?us-ascii?Q?+gEPxz75IF8c71wGPrqGOYl3/xfV6+jMEvs4Vwae5X0JgzfrhuKuEtVZ8gcP?=
	=?us-ascii?Q?ENg2ONxdWS7dlwi9YETUOHk/xvLL9j9HLkGJEH1+N8c0aDwgZ1ynK/E1TLxW?=
	=?us-ascii?Q?/M2+e91Hf/vgWd/kG7OOUSloIgm9ZMM5DcO7wNViNexyo+4zkSdSJMZKLjVF?=
	=?us-ascii?Q?Uk+Tp8uZBJ0+67BSokjGFXIy7G6f47WXMiBhcyl/aellAkvOm6T5iO7F4LfX?=
	=?us-ascii?Q?P4Ws1BHqdckSdXaD2hMp9BDC5FS46YJ423E0YCglwza1E4xgM4WKmZ5FMqw?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0736;
	6:hdwib44Xj1wuHZjFuf4sH8WA0zgTsteiapdmkYI5uxNXe/wun9RErDxphRij4Zav/CbweoT7akWgcJbLY7fb6NzmY5tQszZeGLEa5JHQz79fZtpvAO388OyCHPS0PWxD20w8ICpfOGEhTqQImHVJ5k+s6zJsklpZetTBB5mGeQzQs0Xa2kPK5Xoq+RwAxoqgpchnHswPdjXLnvaV5eTwiYR7LNOiCbYYq6THVCSwaYcdlt+GMAFwfqmWheIyg90rNrYretU+amXKY1K3oaQoiaH3qcAabcc/IrH3hzcVIwgAlueNvI61JrN3a2hi1LAtmgAnDcoHAZq2FXG5KFvLYw==;
	5:NMBnK8nHJuHCuzqP8UAok9Yv5xHmPHDQgCcrfIYTQbFXLr22cKLiivSR58gwvPncT2ndXjNoTHYMN6hkGLWGmOfo2j7tZbAarkQoji16n9MYRsiizjOnlYSJkgkBNJNBNfpF9s8XIetUYypUVgUdbg==;
	24:Fcxc2MqfoUhWfCA1ybM5/pwsmNQla/crerGp43VN7xiUqS+2+Ss0sd9gXttSjJGmSi9JKu6uDHK0SL1AJrEOCErnwiovOChXtwlmY5bDJyM=;
	7:VTab3RP/60XB9gIvcKHwIR2CD0Q4TxhdL30V92tGA8J3LiRnCzIUnC4C0uvxAhwtsJjHsFHP9sSKuhiG61jHds9zQVM/9fWC8mW75e72tLUHnzvZVFEyBZsBdGFNjQRL6lXlzi96UGyIQfdw8UVj2I9IbdftPanvpemk+FuzRjv/a3ZDgvXCdyEQMd+E76hVJE8RZzig5TiL11+kmeHxrNlHcGNMbYIXxXOvnHnUTNE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2017 06:36:22.0790 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB0736
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.52
Subject: [Qemu-arm] [PATCH v4 2/5] virtio-iommu: Add iommu notifier for
 map/unmap
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
X-TUID: cG5rGF6NVyNB

This patch extends VIRTIO_IOMMU_T_MAP/UNMAP request to
notify registered iommu-notifier.
This is needed for VFIO support,

Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
v3->v4:
 Follwoig fixes by Eric
 - Calling virtio_iommu_notify_map() for all device in AS
 - virtio_iommu_notify_unmap() moved to a function,
   This is needed as per changes in base framework (v4)

 hw/virtio/trace-events           |  2 ++
 hw/virtio/virtio-iommu.c         | 69 ++++++++++++++++++++++++++++++++++++++--
 include/hw/virtio/virtio-iommu.h |  6 ++++
 3 files changed, 74 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 2793604..251b595 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -49,3 +49,5 @@ virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid)
 virtio_iommu_fill_resv_property(uint32_t devid, uint8_t subtype, uint64_t addr, uint64_t size, uint32_t flags, size_t filled) "dev= %d, subtype=%d addr=0x%"PRIx64" size=0x%"PRIx64" flags=%d filled=0x%lx"
 virtio_iommu_fill_none_property(uint32_t devid) "devid=%d"
 virtio_iommu_set_page_size_mask(const char *iommu_mr, uint64_t mask) "mr=%s page_size_mask=0x%"PRIx64
+virtio_iommu_notify_map(const char *name, hwaddr iova, hwaddr paddr, hwaddr map_size) "mr=%s iova=0x%"PRIx64" pa=0x%" PRIx64" size=0x%"PRIx64""
+virtio_iommu_notify_unmap(const char *name, hwaddr iova, hwaddr map_size) "mr=%s iova=0x%"PRIx64" size=0x%"PRIx64""
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 1873b9a..085e972 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -95,6 +95,38 @@ static gint interval_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
     }
 }
 
+static void virtio_iommu_notify_map(IOMMUMemoryRegion *mr, hwaddr iova,
+                                    hwaddr paddr, hwaddr size)
+{
+    IOMMUTLBEntry entry;
+
+    entry.target_as = &address_space_memory;
+    entry.addr_mask = size - 1;
+
+    entry.iova = iova;
+    trace_virtio_iommu_notify_map(mr->parent_obj.name, iova, paddr, size);
+    entry.perm = IOMMU_RW;
+    entry.translated_addr = paddr;
+
+    memory_region_notify_iommu(mr, entry);
+}
+
+static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr iova,
+                                      hwaddr size)
+{
+    IOMMUTLBEntry entry;
+
+    entry.target_as = &address_space_memory;
+    entry.addr_mask = size - 1;
+
+    entry.iova = iova;
+    trace_virtio_iommu_notify_unmap(mr->parent_obj.name, iova, size);
+    entry.perm = IOMMU_NONE;
+    entry.translated_addr = 0;
+
+    memory_region_notify_iommu(mr, entry);
+}
+
 static void virtio_iommu_detach_dev_from_as(viommu_dev *dev)
 {
     QLIST_REMOVE(dev, next);
@@ -291,6 +323,8 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
     viommu_as *as;
     viommu_interval *interval;
     viommu_mapping *mapping;
+    VirtioIOMMUNotifierNode *node;
+    viommu_dev *dev;
 
     interval = g_malloc0(sizeof(*interval));
 
@@ -318,9 +352,37 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
 
     g_tree_insert(as->mappings, interval, mapping);
 
+    /* All devices in an address-space share mapping */
+    QLIST_FOREACH(node, &s->notifiers_list, next) {
+        QLIST_FOREACH(dev, &as->device_list, next) {
+            if (dev->id == node->iommu_dev->devfn) {
+                virtio_iommu_notify_map(&node->iommu_dev->iommu_mr,
+                                        virt_addr, phys_addr, size);
+            }
+        }
+    }
+
     return VIRTIO_IOMMU_S_OK;
 }
 
+static void virtio_iommu_remove_mapping(VirtIOIOMMU *s, viommu_as *as,
+                                        viommu_interval *interval)
+{
+    VirtioIOMMUNotifierNode *node;
+    viommu_dev *dev;
+
+    g_tree_remove(as->mappings, (gpointer)(interval));
+    QLIST_FOREACH(node, &s->notifiers_list, next) {
+        QLIST_FOREACH(dev, &as->device_list, next) {
+            if (dev->id == node->iommu_dev->devfn) {
+                virtio_iommu_notify_unmap(&node->iommu_dev->iommu_mr,
+                                          interval->low,
+                                          interval->high - interval->low + 1);
+            }
+        }
+    }
+}
+
 static int virtio_iommu_unmap(VirtIOIOMMU *s,
                               struct virtio_iommu_req_unmap *req)
 {
@@ -352,18 +414,18 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
         current.high = high;
 
         if (low == interval.low && size >= mapping->size) {
-            g_tree_remove(as->mappings, (gpointer)(&current));
+            virtio_iommu_remove_mapping(s, as, &current);
             interval.low = high + 1;
             trace_virtio_iommu_unmap_left_interval(current.low, current.high,
                 interval.low, interval.high);
         } else if (high == interval.high && size >= mapping->size) {
             trace_virtio_iommu_unmap_right_interval(current.low, current.high,
                 interval.low, interval.high);
-            g_tree_remove(as->mappings, (gpointer)(&current));
+            virtio_iommu_remove_mapping(s, as, &current);
             interval.high = low - 1;
         } else if (low > interval.low && high < interval.high) {
             trace_virtio_iommu_unmap_inc_interval(current.low, current.high);
-            g_tree_remove(as->mappings, (gpointer)(&current));
+            virtio_iommu_remove_mapping(s, as, &current);
         } else {
             break;
         }
@@ -806,6 +868,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
 
+    QLIST_INIT(&s->notifiers_list);
     virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
                 sizeof(struct virtio_iommu_config));
 
diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index f9c988f..7e04184 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -46,6 +46,11 @@ typedef struct IOMMUPciBus {
     IOMMUDevice  *pbdev[0]; /* Parent array is sparse, so dynamically alloc */
 } IOMMUPciBus;
 
+typedef struct VirtioIOMMUNotifierNode {
+    IOMMUDevice *iommu_dev;
+    QLIST_ENTRY(VirtioIOMMUNotifierNode) next;
+} VirtioIOMMUNotifierNode;
+
 typedef struct VirtIOIOMMU {
     VirtIODevice parent_obj;
     VirtQueue *vq;
@@ -56,6 +61,7 @@ typedef struct VirtIOIOMMU {
     GTree *address_spaces;
     QemuMutex mutex;
     GTree *devices;
+    QLIST_HEAD(, VirtioIOMMUNotifierNode) notifiers_list;
 } VirtIOIOMMU;
 
 #endif
-- 
1.9.3

