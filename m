Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1791116lfj;
        Sun, 15 May 2022 23:24:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHSvTEBKesIWoX+D1eCXBxlmGAj7PEi9O6ssoDZ/4u/f73hi8bcvN6FKdZta0jLhSttS5q
X-Received: by 2002:a37:8ce:0:b0:69f:c270:3d6f with SMTP id 197-20020a3708ce000000b0069fc2703d6fmr11164187qki.540.1652682245457;
        Sun, 15 May 2022 23:24:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652682245; cv=none;
        d=google.com; s=arc-20160816;
        b=MBLyftojW3EZwILRYeM2ZoD6ocvbGgpJQvY42ol04O/zz0ltoQMCqlSpzCfJbYDAjI
         SlKpSik8B0nvJZ6iWt8HiRfIwuE8kgsBdGPhOfZ1BYebSml/8vA3UHhzJzRi/iNHHGDZ
         D9FmHPwg6P/1OcQvDDErrlxB6ayitpOd1P9pzGOfFjc5+MKUnJk1CZN9NfGR84IWUiRM
         OvJOKDTjfPQrCTPaKKoWWPsYrgnzyNDhM/dfA4zkMGSDL0QSgxqe7c2xQnBFRvHnVc4L
         j3X9BRheaw1WUiT8kuq5Qfj47EyF8Pi1DyfpgaS8OOmDEWEIYug+tIOrCOlPr+0YSEYw
         F/nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ohna0kSQZNJYA8/UiEi0oGFEMePnigdNLHozp+5/CjM=;
        b=G1qx1Mxen3G3JKVu6eGbOv1QPW9NpPFlFAUl/cKuXrYPUMwSXCQG9kD7c5CJIVpxvF
         hK6PiFUimMi6ECJoYYVDaqGG9A0D7J2uArtafhcj6cb3qQOJJ5X4FaICDeQawdQV6420
         cRmUtvmEQQgJb9qdhZ3FjDr2CF85viX4bK3s/T0jFNA3753O0AE9f3913YRWi0x6AIj8
         rhD6R1hxrOwiul1iM+TLxfncNXRzagp1hUBZxkwba/rxKBRWJwjplp/5QWvF6zvqWOo3
         GhjX2i/FPhkCppm8giJGBrKEfWDLgyK4ejwaoT8+TZ+hcmt1DN5DOXhJCqF8ZV1fekOG
         CFPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=phJ7f7es;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ib10-20020a0562141c8a00b004564f8f5e9dsi5060225qvb.454.2022.05.15.23.24.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 May 2022 23:24:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=phJ7f7es;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:55984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nqU9E-00074P-Tw
	for alex.bennee@linaro.org; Mon, 16 May 2022 02:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6135bb9a91=pdel@fb.com>)
 id 1nqU8t-00074F-0b
 for qemu-arm@nongnu.org; Mon, 16 May 2022 02:23:43 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:44910
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6135bb9a91=pdel@fb.com>)
 id 1nqU8p-0007OT-TX
 for qemu-arm@nongnu.org; Mon, 16 May 2022 02:23:41 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 24FEnB3i009841
 for <qemu-arm@nongnu.org>; Sun, 15 May 2022 23:23:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=ohna0kSQZNJYA8/UiEi0oGFEMePnigdNLHozp+5/CjM=;
 b=phJ7f7esmezM2QgQ8KV5+McWHflr3z5bNqBa70QFuO2Y6dWmQd2MtD5PVjM0MybOl03n
 xIklh44Lif1/4rEo5TQ0dzFtQNwhPTFnCQM/pzp6ab7KXbAoXYLex03H7jICs6dejQNk
 tmy6dznE+Nzsp51PRXPt+04VfSjiAM1TAt8= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0089730.ppops.net (PPS) with ESMTPS id 3g27x97pvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 15 May 2022 23:23:38 -0700
Received: from twshared31479.05.prn5.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::d) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 15 May 2022 23:23:36 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 0684264DCAC4; Sun, 15 May 2022 23:23:30 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <irischenlj@fb.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <clg@kaod.org>, <zev@bewilderbeest.net>,
 <openbmc@lists.ozlabs.org>, <andrew@aj.id.au>,
 <peter.maydell@linaro.org>, <joel@jms.id.au>
Subject: [PATCH v2 1/5] hw: aspeed: Add missing UART's
Date: Sun, 15 May 2022 23:23:24 -0700
Message-ID: <20220516062328.298336-2-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220516062328.298336-1-pdel@fb.com>
References: <20220516062328.298336-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: Z8KV7TRq-I2pSL8MwL1Fp-05yEQk60R_
X-Proofpoint-ORIG-GUID: Z8KV7TRq-I2pSL8MwL1Fp-05yEQk60R_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-15_11,2022-05-13_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=6135bb9a91=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eZX5GR1mcldM

This adds the missing UART memory and IRQ mappings for the AST2400, AST25=
00,
AST2600, and AST1030.

This also includes the new UART interfaces added in the AST2600 and AST10=
30
from UART6 to UART13. The addresses and interrupt numbers for these two
later chips are identical.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed_ast10x0.c     | 24 ++++++++++++++++++++++++
 hw/arm/aspeed_ast2600.c     | 19 +++++++++++++++++++
 hw/arm/aspeed_soc.c         |  6 ++++++
 include/hw/arm/aspeed_soc.h |  8 ++++++++
 4 files changed, 57 insertions(+)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 9ae9efaac1..fa2cc4406c 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -33,14 +33,38 @@ static const hwaddr aspeed_soc_ast1030_memmap[] =3D {
     [ASPEED_DEV_SBC]       =3D 0x7E6F2000,
     [ASPEED_DEV_GPIO]      =3D 0x7E780000,
     [ASPEED_DEV_TIMER1]    =3D 0x7E782000,
+    [ASPEED_DEV_UART1]     =3D 0x7E783000,
+    [ASPEED_DEV_UART2]     =3D 0x7E78D000,
+    [ASPEED_DEV_UART3]     =3D 0x7E78E000,
+    [ASPEED_DEV_UART4]     =3D 0x7E78F000,
     [ASPEED_DEV_UART5]     =3D 0x7E784000,
+    [ASPEED_DEV_UART6]     =3D 0x7E790000,
+    [ASPEED_DEV_UART7]     =3D 0x7E790100,
+    [ASPEED_DEV_UART8]     =3D 0x7E790200,
+    [ASPEED_DEV_UART9]     =3D 0x7E790300,
+    [ASPEED_DEV_UART10]    =3D 0x7E790400,
+    [ASPEED_DEV_UART11]    =3D 0x7E790500,
+    [ASPEED_DEV_UART12]    =3D 0x7E790600,
+    [ASPEED_DEV_UART13]    =3D 0x7E790700,
     [ASPEED_DEV_WDT]       =3D 0x7E785000,
     [ASPEED_DEV_LPC]       =3D 0x7E789000,
     [ASPEED_DEV_I2C]       =3D 0x7E7B0000,
 };
=20
 static const int aspeed_soc_ast1030_irqmap[] =3D {
+    [ASPEED_DEV_UART1]     =3D 47,
+    [ASPEED_DEV_UART2]     =3D 48,
+    [ASPEED_DEV_UART3]     =3D 49,
+    [ASPEED_DEV_UART4]     =3D 50,
     [ASPEED_DEV_UART5]     =3D 8,
+    [ASPEED_DEV_UART6]     =3D 57,
+    [ASPEED_DEV_UART7]     =3D 58,
+    [ASPEED_DEV_UART8]     =3D 59,
+    [ASPEED_DEV_UART9]     =3D 60,
+    [ASPEED_DEV_UART10]    =3D 61,
+    [ASPEED_DEV_UART11]    =3D 62,
+    [ASPEED_DEV_UART12]    =3D 63,
+    [ASPEED_DEV_UART13]    =3D 64,
     [ASPEED_DEV_GPIO]      =3D 11,
     [ASPEED_DEV_TIMER1]    =3D 16,
     [ASPEED_DEV_TIMER2]    =3D 17,
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 4161a0cc4b..f3ecc0f3b7 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -61,7 +61,18 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
     [ASPEED_DEV_IBT]       =3D 0x1E789140,
     [ASPEED_DEV_I2C]       =3D 0x1E78A000,
     [ASPEED_DEV_UART1]     =3D 0x1E783000,
+    [ASPEED_DEV_UART2]     =3D 0x1E78D000,
+    [ASPEED_DEV_UART3]     =3D 0x1E78E000,
+    [ASPEED_DEV_UART4]     =3D 0x1E78F000,
     [ASPEED_DEV_UART5]     =3D 0x1E784000,
+    [ASPEED_DEV_UART6]     =3D 0x1E790000,
+    [ASPEED_DEV_UART7]     =3D 0x1E790100,
+    [ASPEED_DEV_UART8]     =3D 0x1E790200,
+    [ASPEED_DEV_UART9]     =3D 0x1E790300,
+    [ASPEED_DEV_UART10]    =3D 0x1E790400,
+    [ASPEED_DEV_UART11]    =3D 0x1E790500,
+    [ASPEED_DEV_UART12]    =3D 0x1E790600,
+    [ASPEED_DEV_UART13]    =3D 0x1E790700,
     [ASPEED_DEV_VUART]     =3D 0x1E787000,
     [ASPEED_DEV_I3C]       =3D 0x1E7A0000,
     [ASPEED_DEV_SDRAM]     =3D 0x80000000,
@@ -78,6 +89,14 @@ static const int aspeed_soc_ast2600_irqmap[] =3D {
     [ASPEED_DEV_UART3]     =3D 49,
     [ASPEED_DEV_UART4]     =3D 50,
     [ASPEED_DEV_UART5]     =3D 8,
+    [ASPEED_DEV_UART6]     =3D 57,
+    [ASPEED_DEV_UART7]     =3D 58,
+    [ASPEED_DEV_UART8]     =3D 59,
+    [ASPEED_DEV_UART9]     =3D 60,
+    [ASPEED_DEV_UART10]    =3D 61,
+    [ASPEED_DEV_UART11]    =3D 62,
+    [ASPEED_DEV_UART12]    =3D 63,
+    [ASPEED_DEV_UART13]    =3D 64,
     [ASPEED_DEV_VUART]     =3D 8,
     [ASPEED_DEV_FMC]       =3D 39,
     [ASPEED_DEV_SDMC]      =3D 0,
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index c339b5c74d..96bc060680 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -48,6 +48,9 @@ static const hwaddr aspeed_soc_ast2400_memmap[] =3D {
     [ASPEED_DEV_ETH1]   =3D 0x1E660000,
     [ASPEED_DEV_ETH2]   =3D 0x1E680000,
     [ASPEED_DEV_UART1]  =3D 0x1E783000,
+    [ASPEED_DEV_UART2]  =3D 0x1E78D000,
+    [ASPEED_DEV_UART3]  =3D 0x1E78E000,
+    [ASPEED_DEV_UART4]  =3D 0x1E78F000,
     [ASPEED_DEV_UART5]  =3D 0x1E784000,
     [ASPEED_DEV_VUART]  =3D 0x1E787000,
     [ASPEED_DEV_SDRAM]  =3D 0x40000000,
@@ -80,6 +83,9 @@ static const hwaddr aspeed_soc_ast2500_memmap[] =3D {
     [ASPEED_DEV_ETH1]   =3D 0x1E660000,
     [ASPEED_DEV_ETH2]   =3D 0x1E680000,
     [ASPEED_DEV_UART1]  =3D 0x1E783000,
+    [ASPEED_DEV_UART2]  =3D 0x1E78D000,
+    [ASPEED_DEV_UART3]  =3D 0x1E78E000,
+    [ASPEED_DEV_UART4]  =3D 0x1E78F000,
     [ASPEED_DEV_UART5]  =3D 0x1E784000,
     [ASPEED_DEV_VUART]  =3D 0x1E787000,
     [ASPEED_DEV_SDRAM]  =3D 0x80000000,
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 3789f38603..709a78285b 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -105,6 +105,14 @@ enum {
     ASPEED_DEV_UART3,
     ASPEED_DEV_UART4,
     ASPEED_DEV_UART5,
+    ASPEED_DEV_UART6,
+    ASPEED_DEV_UART7,
+    ASPEED_DEV_UART8,
+    ASPEED_DEV_UART9,
+    ASPEED_DEV_UART10,
+    ASPEED_DEV_UART11,
+    ASPEED_DEV_UART12,
+    ASPEED_DEV_UART13,
     ASPEED_DEV_VUART,
     ASPEED_DEV_FMC,
     ASPEED_DEV_SPI1,
--=20
2.30.2

