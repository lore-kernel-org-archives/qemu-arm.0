Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp522388njb;
        Mon, 17 Feb 2025 23:36:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW8ZOaWPi7McvN+dAdBtqJXicPYWsVfqIx6Q/Rv3XuI4L+ujVgkiqxqIE8DaMN4jz/N254peB8m8HmACg==@linaro.org
X-Google-Smtp-Source: AGHT+IEKwrjYWwUIjIa/vugX6n6YWRdY/iWPkFn+nVkFYVBtCOjoB8g2pRWsNmLUKhL3ledj11GH
X-Received: by 2002:a05:620a:27c4:b0:7c0:7a1b:8948 with SMTP id af79cd13be357-7c08a890678mr1602731985a.0.1739864195034;
        Mon, 17 Feb 2025 23:36:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739864195; cv=none;
        d=google.com; s=arc-20240605;
        b=Cstn6i8qQcwkYExVpvhcFrUybosqlkWXQHRO7H9tuHcZqcZWumWbGu8xnsgUw8ScJ+
         KlGOrncBmmpEkFCGLasTVPeawILbcxPQCK7aMkSQzq+7wIw80PHm16mNSuzmpfET7y/n
         0nWZMlG9EUndDSDmlDIzGerO52fKeH6zB6TUnlX8k9BiS2TM4d32Gb8A/VHmFRjw5kCX
         ez1KFanKxB8u2v/ST/27pV1wHRTAemQUu8eixDgE9119zC8s3ETuodj3wCrNoqB8iJjQ
         DBq/OCnXhxa6VIPiPVzS+/M9tQr7/UF518oUagif+abfkY+JCmvxsNLtNBO0aS/fRZpU
         iZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=8umlkfTIf0Wkn2ZiQljLCMhn6js0QWLR8+Nou1ET7jw=;
        fh=kR79G/QTFRnR5ELCJoZl+4GJcEUHU09b2ASuzozSekg=;
        b=LxPH8EgKkihLUX3FEyDhih3L2AnfQ0m7WvLQzsB/do/MJozLxnXJv/F4WzvLBUijla
         N83Zv/j/fD7+k3DR12HoMa1/XJQrwDVuq7ty1MRpdQYhUbtPkQd1zfgP12Mw8nnPca+t
         mnCwy2pmSb4qhyPB/fzZxr++SlrCnp9doKdi1AE9yvuoNAHn9S6WB6eVEfpfKPz+sPFX
         1LVLIlruJwSfJ4k4dj1OH/NC2so0LR/6FBwvegMTLPP+9K09vxneDnc+d5VfvS9KJhIM
         0AmnwHQnjwaEwDuxlAGVTPxCnN+MUFW5xnxgzpuH7VrhrZj8CqIExsUKC703au40kGnu
         tj0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q1YFEIEy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0a608f4d1si209757885a.571.2025.02.17.23.36.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2025 23:36:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q1YFEIEy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkI9D-0005vH-7t; Tue, 18 Feb 2025 02:36:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tkI9B-0005uY-NZ
 for qemu-arm@nongnu.org; Tue, 18 Feb 2025 02:36:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tkI99-0004fY-EB
 for qemu-arm@nongnu.org; Tue, 18 Feb 2025 02:36:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739864155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8umlkfTIf0Wkn2ZiQljLCMhn6js0QWLR8+Nou1ET7jw=;
 b=Q1YFEIEyV7dnxnR/gMWNpm2Gr5PDJyKrxAjl/a+sr8Qk5vuoJRYK03zuYtOzhxuEtLdfou
 TULQAt827uSMlh8bJguv1cMn3TuPkhT4aNI0wf+YFJZRO19e4ojFMtVxgIjosotfxa5s4H
 c3Owu2rfFqCzUoDiJDsIuSQoHGimO5U=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-169-6bWX6XIjOmqUVf0ieea9NA-1; Tue,
 18 Feb 2025 02:35:51 -0500
X-MC-Unique: 6bWX6XIjOmqUVf0ieea9NA-1
X-Mimecast-MFC-AGG-ID: 6bWX6XIjOmqUVf0ieea9NA_1739864149
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 400D91800570; Tue, 18 Feb 2025 07:35:48 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.45.224.52])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CB3C11956048; Tue, 18 Feb 2025 07:35:37 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH] aspeed: Remove duplicate typename in AspeedSoCClass
Date: Tue, 18 Feb 2025 08:35:34 +0100
Message-ID: <20250218073534.585066-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: XemtFFcfAOAe

The SoC type name is stored under AspeedSoCClass which is
redundant. Use object_get_typename() instead where needed.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/arm/aspeed_soc.h | 1 -
 hw/arm/aspeed_ast10x0.c     | 3 +--
 hw/arm/aspeed_ast2400.c     | 4 +---
 hw/arm/aspeed_ast2600.c     | 3 +--
 hw/arm/aspeed_ast27x0.c     | 3 +--
 5 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index e1cb9d5cc32c..96459d02a9bf 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -158,7 +158,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(Aspeed10x0SoCState, ASPEED10X0_SOC)
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
index 57540c7b2cbb..6e756fa23e61 100644
--- a/hw/arm/aspeed_ast2400.c
+++ b/hw/arm/aspeed_ast2400.c
@@ -157,7 +157,7 @@ static void aspeed_ast2400_soc_init(Object *obj)
     char socname[8];
     char typename[64];
 
-    if (sscanf(sc->name, "%7s", socname) != 1) {
+    if (sscanf(object_get_typename(obj), "%7s", socname) != 1) {
         g_assert_not_reached();
     }
 
@@ -564,7 +564,6 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
     /* Reason: Uses serial_hds and nd_table in realize() directly */
     dc->user_creatable = false;
 
-    sc->name         = "ast2400-a1";
     sc->valid_cpu_types = valid_cpu_types;
     sc->silicon_rev  = AST2400_A1_SILICON_REV;
     sc->sram_size    = 0x8000;
@@ -593,7 +592,6 @@ static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
     /* Reason: Uses serial_hds and nd_table in realize() directly */
     dc->user_creatable = false;
 
-    sc->name         = "ast2500-a1";
     sc->valid_cpu_types = valid_cpu_types;
     sc->silicon_rev  = AST2500_A1_SILICON_REV;
     sc->sram_size    = 0x9000;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 45cc3da39bcc..faebb2ef14a9 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -167,7 +167,7 @@ static void aspeed_soc_ast2600_init(Object *obj)
     char socname[8];
     char typename[64];
 
-    if (sscanf(sc->name, "%7s", socname) != 1) {
+    if (sscanf(object_get_typename(obj), "%7s", socname) != 1) {
         g_assert_not_reached();
     }
 
@@ -773,7 +773,6 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
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

