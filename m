Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp5714606ejb;
        Wed, 22 Mar 2023 13:26:18 -0700 (PDT)
X-Google-Smtp-Source: AK7set/wKlfmw5EzJo/vFtm9iza10k3/ywCdjGu4OV85FBPjO219FshOmr/6S52syRGxJR0mZtIY
X-Received: by 2002:a17:906:5a5c:b0:8f3:8bfd:a8e with SMTP id my28-20020a1709065a5c00b008f38bfd0a8emr3804468ejc.26.1679516775859;
        Wed, 22 Mar 2023 13:26:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1679516775; cv=pass;
        d=google.com; s=arc-20160816;
        b=WBY9dnFpHk1SX/SZRD8sd6hQ2pjkuXcy8j7jlWgTFHPqGOgJ3/EOiudmqPcBmmNWAH
         Cz7LHL9gqX/dQPV6cqu4y6MJ1L31d2gGaB86Zu08g0N+9mHM132XjBv9jn8Lo11R7IBr
         jbumvywb+0kS0YDahFBhLUj4sIX8CFYkCwABNQXUwoBpkdOXQfGtUeAcWgTuvwKhCEcZ
         KRrSON+4ltNZqj70EQK+5j7tJMPlLcLr0xhu40MyZUl9EUa/i0NxlhBDDDIjSlvd3Inw
         sKeld9WgIEL9H7Po2haRjkqtI8tTvU49MZeW4DxvLkaqmt9sSNdpFTfqBv6hLhNekxgj
         lzkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TdfL3qq8rA/s4So09okVjkRZBCdHigcO1J1Q9wwuI28=;
        b=yt6mSDNB3GYAIM7M85eEfj1IQ/uUSL+jU+lrvU1VmVpu+x2ez87WddNCvzsIjR1dFy
         /xrw4bg94hg0eSUxlld/v3FQqq5AxCo0vEwwbK+a0SQhxFEB8YpTyLDyiOHWUcpLybuj
         sLSz+2D3C56nBS+StMVZEh8PwV33KIqaIxl9WwvK2eQp2drobWXcZVRnI+or61prKWVM
         V1E5xC3WpiAxgIORtHDn2v7Amdh9Dkf1kV4uoJWUiEI0YLOFO2wB9Jrv7Hh5mB9hRL+Z
         f6Vwl28/FsPJgmqpQBXiXzkDCMN/amHnUw6MN4RUlZ4nIK69fXq+hcSjiWU8E4es66Un
         DcKQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=NDosxppW;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8c::703 as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
Return-Path: <aaron@os.amperecomputing.com>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20703.outbound.protection.outlook.com. [2a01:111:f400:7e8c::703])
        by mx.google.com with ESMTPS id v17-20020a170906489100b0092bdd3273c5si10516737ejq.925.2023.03.22.13.26.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Mar 2023 13:26:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8c::703 as permitted sender) client-ip=2a01:111:f400:7e8c::703;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@os.amperecomputing.com header.s=selector2 header.b=NDosxppW;
       arc=pass (i=1 spf=pass spfdomain=os.amperecomputing.com dkim=pass dkdomain=os.amperecomputing.com dmarc=pass fromdomain=os.amperecomputing.com);
       spf=pass (google.com: domain of aaron@os.amperecomputing.com designates 2a01:111:f400:7e8c::703 as permitted sender) smtp.mailfrom=aaron@os.amperecomputing.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fiywDrckkYI4lKDky6gNvr4gQAgd97GeOryrdeRignDJbTbIVoBQwbfeh5Q+Z0D9KxYGM3UWgEWaB+Eg3eFkTJcMdArYneuIB0A8rhdFOtgcZxOqlrfsmhwYIzChf1sVivtNxZBLOtEPke/OdpxxoQf/Swq4YQWPDJmF0y/866zNtoWd/ECNBFvM8X525V6RM6354ujZP3XJw9EcjSmLby4Cq2wPvOT+BAc9movxq0wzrBBwP+jNWG2CI/sFa953zDiadtaIVk8RoArnAP0AmR7dYsqtv1K4yJIcvm/jl4rT+72OSQs9pTev2027EAYmTgp6u7R4cceVd0Pl9XdiLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdfL3qq8rA/s4So09okVjkRZBCdHigcO1J1Q9wwuI28=;
 b=QoCCdegDp9zdLfxAWMDlBYBiZu5xNtEoEENTiOgWBYrGid+1MX12wdRp5cLD2Ma4N0pns8mdKP8GOQUq/knogH+RSzJ8ztVcgmZnVDNOxpU3lmW8TalZTD8edPPRV5IsPWlnNJFTJ7RKuj+5T3I/Bie9XjfUGvYzRHhv8hCAwrEr1izbd7zqurWswSywLQ/W7UsNCxJ0iR2Uj+WeD3wU9wCM9bm50fHUOeWC3wy8ajsWm8x/b34QILCBCIgJQjraT06puDC1k9oK3QTa1lDDalJshyhb9dRu8z4rE5q54RBLi6Sizmc1xkc300RGakrLcztRembFNm+Y2GiULXPrSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdfL3qq8rA/s4So09okVjkRZBCdHigcO1J1Q9wwuI28=;
 b=NDosxppWiGFA2Nti3hZbY7f8yOtuOB3Ap0DF+R8xZbAMuHrKISMSwEqSVx+LHJFfWYMsZwOF3oxXT3ffQ2ybMCm6rGWzt7BYHozgZjxq9RLHwSvlKYXji3mTKzlFzXG8QapqsZltcNz4tWNgWqBd0AMoJO6Vm1u++73k9IfwVRo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SA1PR01MB7342.prod.exchangelabs.com (2603:10b6:806:1f5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.8; Wed, 22 Mar 2023 20:26:13 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c%8]) with mapi id 15.20.6222.010; Wed, 22 Mar 2023
 20:26:13 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Vincent Dehors <vincent.dehors@smile.fr>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v3 2/8] target/arm: v8.3 PAC ID_AA64ISAR[12] feature-detection
Date: Wed, 22 Mar 2023 16:25:35 -0400
Message-Id: <20230322202541.1404058-3-aaron@os.amperecomputing.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230322202541.1404058-1-aaron@os.amperecomputing.com>
References: <20230322202541.1404058-1-aaron@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:610:59::18) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
Return-Path: aaron@os.amperecomputing.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|SA1PR01MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: dd28482a-b316-43f4-c151-08db2b13ae35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VipGi5kCUVRiTk6lzQZ+SWDZUwxuwcZ62M1trJ/tt4894h/yaSiUDAlWFIotRpas375fwzGKuzQu8QoZDkemlQ6CasSEEUw/aclqOtnJjCF8VqjWedpb3q43+pep23eCcNHTlG8S41didRpt+W7AREuxmMtjMS4Ga6jYLIJWj0KnV74HIY/Di0cthIo8qSvwWPzIqaZwgfgpvo02LQsKgJnnd5HpewTelcBH3Nvq0YezvjxFHmsWdAX2kZlyYy4mYGlYRM9ov1TWZfdbySuYbH3/i/G/pAEnsxUs0jrbvyzHahWHFZyq3M0zcFx8yMiPEE+eyNES/QQCQXZnwGlIlf0eobhB8OBf2aT8i0xOenvPfroV2FaGxBF7LhrAkvtcoX/yOne6AEMp3RaPNghzXbTpPdbmy1ayzbzeMMCp2tgarrsrNS3X6YD+rWznDJL8porauP4kc9GocsOpyi8AQXMiS/m1djgCy77EhvksRD6Sm29ne1lThReREZowtFnGZdrTD7dpPUDNYS8DTSrXVNOD43vwHYC4VtrN6EquaP4l1PrKvfbZtyOjOOjPpEihZrp9UDBAwx40bozOvTApQdsGVzbcqRJtHIJLyIH1FexByPFs/+qQRQiHxwUko5s+eLfv9AorBb4MVEVZb68p+a1SgzjNZsJ2BPjDQXSofksW3DLRI6huItbci05re4hDTd3kmSjolCDZJIg3ORTDMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB7124.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(366004)(396003)(376002)(39850400004)(451199018)(83380400001)(38350700002)(6486002)(186003)(6506007)(86362001)(26005)(6512007)(2616005)(1076003)(38100700002)(6666004)(107886003)(5660300002)(4326008)(52116002)(66476007)(41300700001)(110136005)(66946007)(478600001)(8936002)(2906002)(8676002)(316002)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QQkrMfcHSAwKc579X5umsmluYt9fZGnkuDAACmYQPp7i8KremHsiOkPDlGPe?=
 =?us-ascii?Q?VpHMOjfM+gyz68gN+QjTNmp7keLSAU01xVN4ZWCpPtA1UYVAaFKpmTmZVEi7?=
 =?us-ascii?Q?MBKoDib6RI2HJiwkZJaQu9ACKP4o0WSzP8PdZvHTiYlBpSOBK+IkS4Wp+8Dc?=
 =?us-ascii?Q?Qouj9rYOBahMqGPanq5dTNngA45UAnl/ddX1siACTHJ99LqHhTO372iD30FS?=
 =?us-ascii?Q?cte2h4ZCMZx0xSduRUGw772OoAknwtSrhg2EbdKZjIcvyQyrp/KvRV8RNKmk?=
 =?us-ascii?Q?R1JMeyQp9VgrTbFMl1CYUT9OaE89ewaNd5yCnkdYSkup8iLVTamDeU2Mco7I?=
 =?us-ascii?Q?Ds5OkyzbkQrFB+rzLVQ4NWy/feI2Q3PUVhmJ5ShO5HhhoBt8sm58ztMJZK0v?=
 =?us-ascii?Q?m0hWyRF1XNKwPXSoylx5tAMn5sADDvrmkvDXD/VmFBHYojoo+ZiEiU+Gepex?=
 =?us-ascii?Q?8zzYj7a0m/uq5Q+c3uGOaAQbisJ29wtZHlKf2Xu0jot19SS6mXAKWtMblzeA?=
 =?us-ascii?Q?ukNZJ+PmL6Nbm1yXJeYRjyA0cyPLH4iuDDKmjAOpQx+E9lhp94Wof3pDUgDL?=
 =?us-ascii?Q?YLTlAiQE+3hCVlTL/CXMzUEdwMG68hyXNl9hJ92dgmXcOIH+v6PJKmcGO99J?=
 =?us-ascii?Q?Nn5ELpLq/oQIycZC9jB0ZmsZNaI/GP9iRfNOPE9YOOkWRnIPwenHqGwmyfu7?=
 =?us-ascii?Q?7w83m8zJZhhqON8L9narTL9BVpFbKSIK5/75VS3dJK9WjiiXF1ut5OkGrUDV?=
 =?us-ascii?Q?Sj09eayzyALaamEnTG4ehclyGf2oxgW5ZEqpyFQE+XrE7ayHlej5aL240PJd?=
 =?us-ascii?Q?gwHpKKJ6Sm8WFM+DKz+m20d0xBvpcekZYlmoMVPvyXWBJeE5HRC0c8BZ1Pux?=
 =?us-ascii?Q?CIUGfNQoxvEKYGG08dD45Zu6OYRz+YLffQ1s9D1R5hsz4Gk16SAI/X4DVKxS?=
 =?us-ascii?Q?rbxtWCNLdzop2XlvPa3puzJQOguQmhAiUBsG/Zu4Xp6QIuuHQBT4diW+eIdg?=
 =?us-ascii?Q?2LysaH/hD3hwnmfowrJHioJ/iCXcnlxj+QWDai6fnfXXDzef8KTpS5NNpYrC?=
 =?us-ascii?Q?1bGif7QmT+Hfp/fNVayc1WaaKAn5HxNqkAgD7aQMuzxQ4ZdzWsCkZpUIrvO0?=
 =?us-ascii?Q?PdRoL7gdzbUPrnSlPSzWtgmqfhlyFkN8CU5ni+zUaMwzN5qPH4N0V6KAwpOM?=
 =?us-ascii?Q?QTbdhdWT+L6U8DPR5g97Z7tNILEa9i1ybvBhpDRn1mivu95tjrYL1NuXkoPM?=
 =?us-ascii?Q?pTPQq9FtuDDdRoX6H/bA2YXqJ574v31d0y7K3+DiC36qvqnmfvcHvw7GbPGg?=
 =?us-ascii?Q?4o6FxZD2ydVCoPdvK5QU4uUfppu2koluScW7jMLpULK8VQJJhme8dcog9yem?=
 =?us-ascii?Q?8TTFliSWt3YZKkLnh56/wVX/mbkau8mlyN1mQBwS35Au+BS79ilAQTIhLmq/?=
 =?us-ascii?Q?GKj3t9Y+gC4Oabvqu7Lp42UWZOLABbrloQbJOeWm7i7XKapHobVRRFL1LPJw?=
 =?us-ascii?Q?5HOWP4v18T8BjVfT0eCQvLL0pEUk8WTWLpVYXoX9mMqcdQ1OGxb5HVA+n/9D?=
 =?us-ascii?Q?tsolxjhfR7L+jtjuYIuPfCxKTe+xUI0kx5ofCOSsNd8f7xayCHBs//0tvaLd?=
 =?us-ascii?Q?mSzvvyJ7GuxA4aBO6/Ky8mQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd28482a-b316-43f4-c151-08db2b13ae35
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 20:26:13.2158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sYJBnXXs6oCNs7DzmaTNQoy6UIz5NpC0Y20379iZu71zWWhdyS+88IRynscB8f5NdyzO4oB6pkN6KIndc5OUCOJ2jU1OfNNvzQ6i1hnhrkvHE5U2ygvJKjBuNoyW4t8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB7342
X-TUID: MMBSg0BFaWdd

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 target/arm/cpu.h              | 65 +++++++++++++++++++++++++++++++++--
 target/arm/tcg/pauth_helper.c |  2 +-
 2 files changed, 63 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f0f27f259d..868d844d5a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3705,18 +3705,77 @@ static inline bool isar_feature_aa64_pauth(const ARMISARegisters *id)
             (FIELD_DP64(0, ID_AA64ISAR1, APA, 0xf) |
              FIELD_DP64(0, ID_AA64ISAR1, API, 0xf) |
              FIELD_DP64(0, ID_AA64ISAR1, GPA, 0xf) |
-             FIELD_DP64(0, ID_AA64ISAR1, GPI, 0xf))) != 0;
+             FIELD_DP64(0, ID_AA64ISAR1, GPI, 0xf))) != 0 ||
+           (id->id_aa64isar2 &
+            (FIELD_DP64(0, ID_AA64ISAR2, APA3, 0xf) |
+             FIELD_DP64(0, ID_AA64ISAR2, GPA3, 0xf))) != 0;
 }
 
-static inline bool isar_feature_aa64_pauth_arch(const ARMISARegisters *id)
+static inline bool isar_feature_aa64_pauth_arch_qarma5(const ARMISARegisters *id)
 {
     /*
-     * Return true if pauth is enabled with the architected QARMA algorithm.
+     * Return true if pauth is enabled with the architected QARMA5 algorithm.
      * QEMU will always set APA+GPA to the same value.
      */
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA) != 0;
 }
 
+static inline bool isar_feature_aa64_pauth_arch_qarma3(const ARMISARegisters *id)
+{
+    /*
+     * Return true if pauth is enabled with the architected QARMA3 algorithm.
+     * QEMU will always set APA3+GPA3 to the same result.
+     */
+    return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, APA3) != 0;
+}
+
+static inline bool isar_feature_aa64_pauth_arch(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_pauth_arch_qarma5(id) ||
+        isar_feature_aa64_pauth_arch_qarma3(id);
+}
+
+static inline int isar_feature_pauth_get_features(const ARMISARegisters *id)
+{
+    if (isar_feature_aa64_pauth_arch_qarma5(id)) {
+        return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA);
+    } else if (isar_feature_aa64_pauth_arch_qarma3(id)) {
+        return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, APA3);
+    } else {
+        return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, API);
+    }
+}
+
+static inline bool isar_feature_aa64_pauth_epac(const ARMISARegisters *id)
+{
+    /*
+     * Note that unlike most AArch64 features, EPAC is treated (in the ARM
+     * psedocode, at least) as not being implemented by larger values of this
+     * field. Our usage of '>=' rather than '==' here causes our implementation
+     * of PAC logic to diverge from ARM pseudocode - we must check that
+     * isar_feature_aa64_pauth2() returns false AND
+     * isar_feature_aa64_pauth_epac() returns true, where the pseudocode reads
+     * as if EPAC is not implemented if the value of this register is > 0b10.
+     * See the implementation of pauth_addpac() for an example.
+     */
+    return isar_feature_pauth_get_features(id) >= 0b0010;
+}
+
+static inline bool isar_feature_aa64_pauth2(const ARMISARegisters *id)
+{
+    return isar_feature_pauth_get_features(id) >= 0b0011;
+}
+
+static inline bool isar_feature_aa64_fpac(const ARMISARegisters *id)
+{
+    return isar_feature_pauth_get_features(id) >= 0b0100;
+}
+
+static inline bool isar_feature_aa64_fpac_combine(const ARMISARegisters *id)
+{
+    return isar_feature_pauth_get_features(id) >= 0b0101;
+}
+
 static inline bool isar_feature_aa64_tlbirange(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 2;
diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index 20f347332d..6bb3b5b9e5 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -282,7 +282,7 @@ static uint64_t pauth_computepac_impdef(uint64_t data, uint64_t modifier,
 static uint64_t pauth_computepac(CPUARMState *env, uint64_t data,
                                  uint64_t modifier, ARMPACKey key)
 {
-    if (cpu_isar_feature(aa64_pauth_arch, env_archcpu(env))) {
+    if (cpu_isar_feature(aa64_pauth_arch_qarma5, env_archcpu(env))) {
         return pauth_computepac_architected(data, modifier, key);
     } else {
         return pauth_computepac_impdef(data, modifier, key);
-- 
2.25.1
