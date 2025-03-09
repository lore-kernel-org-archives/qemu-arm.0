Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp607958njc;
        Sun, 9 Mar 2025 06:56:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUHw0sDYtXuUYw3t2jLARgHhjarGeBxOrvnEgwahiBTdQ9NkoYSMpKar4Adc1Dobjjxv7BGesYlfzyXMg==@linaro.org
X-Google-Smtp-Source: AGHT+IHhPuNtgwAObI8AR9chq0AXqPLwha7uDeSXsElzaLerqxMRujI7wFuocnC9vXBgxQ1vcVbo
X-Received: by 2002:a05:620a:2851:b0:7c5:4de8:bf71 with SMTP id af79cd13be357-7c54de8c1bbmr212338685a.50.1741528606582;
        Sun, 09 Mar 2025 06:56:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528606; cv=none;
        d=google.com; s=arc-20240605;
        b=L3R/ilIWCbs8cn7I8VORfIXEOJS5UECRAKV1FENzlRHM0MR1+FO87qLY5y+CFpPgtm
         NJ3QyHk5dA6HlKrYU0CtLvSZeZyvDkY/m2SEsRKLxScA7GSlntvKA2/Vjm5zOgjiWNrY
         3Lv1EJRuB+rw83+kvOGIKV0aaCgN7MGoTNlDpdOwUYjKvzDCrCOkdO3ynZgkk9zZzLKP
         3gUAO2zLOO0Kay9ww7I02d24RWGeIvH6vpRTrHf/2vT0CPWxDwqwRH5NsA2sAXDqQppO
         Rf0HG+3geq26LiKoz8twE3wBj/6C6UTDPiXX1ooqhYlVdRbTjywV0PtGeo8KnuwKs4iQ
         bYbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AWWyO4fsVpyI7Xfs4RgjydCQpMsctwr4/XR+I7gPwUo=;
        fh=o7MV9a0YmVM/2scXm7ZJnV5a+dorQl6POhT0tkss9vM=;
        b=T3lpZrgerXsFvlReLoqBdQlD6UV8WUM7DQ2xVKNaO84WTBZOW0I0zyYw8mFOCvA8Pr
         BNRsxkqfOaXbrOybzBP0CRcWHH9Cv+QHR2m7hm9Z7H1TkMQMTU4TUJ9SwGrX47NI0Iur
         eaYbQBdmWhXZKC90ANLIPpIPLbi1oWYf81vCAAO1L3/As+DuSAoDKzBfCiyeb9Sxq+kP
         DVNsBFbFtIOcLN0yTUGy4F0w0AbZvND35znTKmHfMRORZu7d/a8k/XnC9LGYYICY9eIy
         6C4VmtbuYESYtG69MuYrpv4/3we89mXZd7orQVzwqD5x28GYtTHLgcUD3R8RqQLab4Qq
         sprQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GXVmvUxu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e54ff4f4si716100085a.224.2025.03.09.06.56.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:56:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GXVmvUxu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trH4d-0007hx-LA; Sun, 09 Mar 2025 09:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4T-0007X8-F1
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:52:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4Q-00029a-TX
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:52:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741528318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AWWyO4fsVpyI7Xfs4RgjydCQpMsctwr4/XR+I7gPwUo=;
 b=GXVmvUxuxY1s/FLCrQAl82o8zZdaDhGOmRRKDgad+3lyKke4biUwsDx+6g+twwG/CMKoKj
 IbVW5IHDesO3c6N6xLyQVKSxz/7/GX4D6k+BOMQUUoglAJwzkuz+5DM7hLz0lzjod0tZUb
 X7ayBugj9sF19X/74Xah0BDud09u298=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-663-IBFb34nhMDiPaLhZ-VET_A-1; Sun,
 09 Mar 2025 09:51:55 -0400
X-MC-Unique: IBFb34nhMDiPaLhZ-VET_A-1
X-Mimecast-MFC-AGG-ID: IBFb34nhMDiPaLhZ-VET_A_1741528314
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2FEBE1801A00; Sun,  9 Mar 2025 13:51:54 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.17])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2B7BE1956095; Sun,  9 Mar 2025 13:51:51 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PULL 07/46] aspeed: Remove duplicate typename in AspeedSoCClass
Date: Sun,  9 Mar 2025 14:50:51 +0100
Message-ID: <20250309135130.545764-8-clg@redhat.com>
In-Reply-To: <20250309135130.545764-1-clg@redhat.com>
References: <20250309135130.545764-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HNUOgN0pWW8F

The SoC type name is stored under AspeedSoCClass which is
redundant. Use object_get_typename() instead where needed.

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Link: https://lore.kernel.org/qemu-devel/20250218073534.585066-1-clg@redhat.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/arm/aspeed_soc.h | 1 -
 hw/arm/aspeed_ast10x0.c     | 3 +--
 hw/arm/aspeed_ast2400.c     | 4 +---
 hw/arm/aspeed_ast2600.c     | 3 +--
 hw/arm/aspeed_ast27x0.c     | 3 +--
 5 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 689f52dae8fb..4a8881ca8b57 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -148,7 +148,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(Aspeed10x0SoCState, ASPEED10X0_SOC)
 struct AspeedSoCClass {
     DeviceClass parent_class;
 
-    const char *name;
     /** valid_cpu_types: NULL terminated array of a single CPU type. */
     const char * const *valid_cpu_types;
     uint32_t silicon_rev;
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index e76c7100a1d2..ec329f4991c9 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -116,7 +116,7 @@ static void aspeed_soc_ast1030_init(Object *obj)
     char typename[64];
     int i;
 
-    if (sscanf(sc->name, "%7s", socname) != 1) {
+    if (sscanf(object_get_typename(obj), "%7s", socname) != 1) {
         g_assert_not_reached();
     }
 
@@ -428,7 +428,6 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
     dc->user_creatable = false;
     dc->realize = aspeed_soc_ast1030_realize;
 
-    sc->name = "ast1030-a1";
     sc->valid_cpu_types = valid_cpu_types;
     sc->silicon_rev = AST1030_A1_SILICON_REV;
     sc->sram_size = 0xc0000;
diff --git a/hw/arm/aspeed_ast2400.c b/hw/arm/aspeed_ast2400.c
index 8784b6e79305..0158f6e9c24e 100644
--- a/hw/arm/aspeed_ast2400.c
+++ b/hw/arm/aspeed_ast2400.c
@@ -151,7 +151,7 @@ static void aspeed_ast2400_soc_init(Object *obj)
     char socname[8];
     char typename[64];
 
-    if (sscanf(sc->name, "%7s", socname) != 1) {
+    if (sscanf(object_get_typename(obj), "%7s", socname) != 1) {
         g_assert_not_reached();
     }
 
@@ -515,7 +515,6 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
     /* Reason: Uses serial_hds and nd_table in realize() directly */
     dc->user_creatable = false;
 
-    sc->name         = "ast2400-a1";
     sc->valid_cpu_types = valid_cpu_types;
     sc->silicon_rev  = AST2400_A1_SILICON_REV;
     sc->sram_size    = 0x8000;
@@ -544,7 +543,6 @@ static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
     /* Reason: Uses serial_hds and nd_table in realize() directly */
     dc->user_creatable = false;
 
-    sc->name         = "ast2500-a1";
     sc->valid_cpu_types = valid_cpu_types;
     sc->silicon_rev  = AST2500_A1_SILICON_REV;
     sc->sram_size    = 0x9000;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 07210483bb29..1f994ba26c65 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -157,7 +157,7 @@ static void aspeed_soc_ast2600_init(Object *obj)
     char socname[8];
     char typename[64];
 
-    if (sscanf(sc->name, "%7s", socname) != 1) {
+    if (sscanf(object_get_typename(obj), "%7s", socname) != 1) {
         g_assert_not_reached();
     }
 
@@ -666,7 +666,6 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
     /* Reason: The Aspeed SoC can only be instantiated from a board */
     dc->user_creatable = false;
 
-    sc->name         = "ast2600-a3";
     sc->valid_cpu_types = valid_cpu_types;
     sc->silicon_rev  = AST2600_A3_SILICON_REV;
     sc->sram_size    = 0x16400;
diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 3e373f966b5f..6506bdfdff68 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -316,7 +316,7 @@ static void aspeed_soc_ast2700_init(Object *obj)
     char socname[8];
     char typename[64];
 
-    if (sscanf(sc->name, "%7s", socname) != 1) {
+    if (sscanf(object_get_typename(obj), "%7s", socname) != 1) {
         g_assert_not_reached();
     }
 
@@ -757,7 +757,6 @@ static void aspeed_soc_ast2700_class_init(ObjectClass *oc, void *data)
     dc->user_creatable = false;
     dc->realize      = aspeed_soc_ast2700_realize;
 
-    sc->name         = "ast2700-a0";
     sc->valid_cpu_types = valid_cpu_types;
     sc->silicon_rev  = AST2700_A0_SILICON_REV;
     sc->sram_size    = 0x20000;
-- 
2.48.1

