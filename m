Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7045131lff;
        Wed, 15 Jan 2020 07:14:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqzBpqkMlGbHdZ6N1QhVs0ub/74GZfW61vzqPV01l0reUvhwPT/miTXhPuhLpcdO6GML+Aja
X-Received: by 2002:a17:906:3195:: with SMTP id 21mr28585615ejy.207.1579101290454;
        Wed, 15 Jan 2020 07:14:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579101290; cv=none;
        d=google.com; s=arc-20160816;
        b=Ul7xam3tT8oKO8xcAhvD2dawrE0Ih7na7I8VbUrK3ucnm5mTlUaGV3Kp62l78kzC4q
         ZeTQ+bauiuzWq1Xah5qhD4npmkI4L83Xydq7Fqj2rFL/3IZSA2ocwZcgXnkvhuqucddQ
         Q3zwPrniCbRVh8/zWYpVW0IWtiWDGGlcYi3ekxwyrF0MZKQIrEOCNcNPjOjDUCfgLmMO
         9CP7DurLRq/K6GB418fIGX+DxVbQLJnvBAnmWWftzlUAXIJXaqcg++KJH5tLPOAiu2gb
         a0LkVv7ZS5zaBFHrHtqC2dQr+6PcQ0oNcqNrY6bnlHqbsS1+pZh5c8IXNRLzInSfnBYi
         1qCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ypFRqS+a3wlU2LOPkBoPKegZFlXkDsukESJrS6Z+0aw=;
        b=bn0V6C+l3INtJF7kM8tAyEgdGEz9RHZWlLV+p8usz6MSCDQnGmbcRAwUcxLXVVZLGP
         RRWgONtNj3jCBs+8Y2sc7GLdZf4J/pspYrLAUG1W2ScowNxloRwEZBdn4NcI9wR+YtUG
         B1FJL4NgIN+vDBnwEQkSRgbwxEZCgbbzTf4DeqHAce8WcC7BG0zBNwZ1x4g1+ECvA0XW
         05Wlw+3dawLmdZtwiFyL8TVwLN7c9qbgA38+z4EIWm65UFiAlJ4DIVFzEqZX9u4l1Amo
         oqkCIXbyvqR+llkQnCH1kblDdJn4uMwbbLik11b52rdQt8pxNY0gH33WY0I9IM21gcEL
         hWzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NL52oUBN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cm15si14577957edb.397.2020.01.15.07.14.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 07:14:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NL52oUBN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irkNc-0004tc-Nb
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 10:14:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48624)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkJo-0007KL-HH
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:10:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkJj-0007wN-26
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:10:52 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44409
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkJi-0007w6-Um
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:10:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ypFRqS+a3wlU2LOPkBoPKegZFlXkDsukESJrS6Z+0aw=;
 b=NL52oUBNu3PjPxWYquCmt93vlfYCn6fKdT4s/cXXqgpEUtTpBRBVFO0xnz8XOXfMQzZpcF
 jhPQBNa4jd3zi7jK+d5NxeD4ett+1vvCbXKHB5piyX6SIoV2VRBZ/hbAT0KAwFugWTV5lz
 wPgL0CfP4fQDzn+ZMmh4S45Dl7Mtk9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-Y74NKRvLNCSQRSds83KvPw-1; Wed, 15 Jan 2020 10:10:43 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B58BB061A;
 Wed, 15 Jan 2020 15:10:42 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86B1728997;
 Wed, 15 Jan 2020 15:10:40 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/86] arm:aspeed: convert valid RAM sizes to data
Date: Wed, 15 Jan 2020 16:06:22 +0100
Message-Id: <1579100861-73692-8-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Y74NKRvLNCSQRSds83KvPw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: andrew@aj.id.au, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OO1skLKnqq8d

various foo_rambits() hardcode mapping of RAM sizes to RAM feature bits,
which is hard to reuse and repeats over and over.

Convert maps into GLib's hash tables and perform mapping using
common mapping function.

Follow up patch will reuse tables for actually checking ram-size
property.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: clg@kaod.org
CC: peter.maydell@linaro.org
CC: andrew@aj.id.au
CC: joel@jms.id.au
CC: qemu-arm@nongnu.org
---
 include/hw/misc/aspeed_sdmc.h |   2 +
 hw/misc/aspeed_sdmc.c         | 116 ++++++++++++++++----------------------=
----
 2 files changed, 47 insertions(+), 71 deletions(-)

diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdmc.h
index 5dbde59..de1501f 100644
--- a/include/hw/misc/aspeed_sdmc.h
+++ b/include/hw/misc/aspeed_sdmc.h
@@ -39,6 +39,8 @@ typedef struct AspeedSDMCState {
 typedef struct AspeedSDMCClass {
     SysBusDeviceClass parent_class;
=20
+    GHashTable *ram2feat;
+    int fallback_ram_size;
     uint64_t max_ram_size;
     uint32_t (*compute_conf)(AspeedSDMCState *s, uint32_t data);
     void (*write)(AspeedSDMCState *s, uint32_t reg, uint32_t data);
diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 2df3244..3fc80f0 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -148,72 +148,6 @@ static const MemoryRegionOps aspeed_sdmc_ops =3D {
     .valid.max_access_size =3D 4,
 };
=20
-static int ast2400_rambits(AspeedSDMCState *s)
-{
-    switch (s->ram_size >> 20) {
-    case 64:
-        return ASPEED_SDMC_DRAM_64MB;
-    case 128:
-        return ASPEED_SDMC_DRAM_128MB;
-    case 256:
-        return ASPEED_SDMC_DRAM_256MB;
-    case 512:
-        return ASPEED_SDMC_DRAM_512MB;
-    default:
-        break;
-    }
-
-    /* use a common default */
-    warn_report("Invalid RAM size 0x%" PRIx64 ". Using default 256M",
-                s->ram_size);
-    s->ram_size =3D 256 << 20;
-    return ASPEED_SDMC_DRAM_256MB;
-}
-
-static int ast2500_rambits(AspeedSDMCState *s)
-{
-    switch (s->ram_size >> 20) {
-    case 128:
-        return ASPEED_SDMC_AST2500_128MB;
-    case 256:
-        return ASPEED_SDMC_AST2500_256MB;
-    case 512:
-        return ASPEED_SDMC_AST2500_512MB;
-    case 1024:
-        return ASPEED_SDMC_AST2500_1024MB;
-    default:
-        break;
-    }
-
-    /* use a common default */
-    warn_report("Invalid RAM size 0x%" PRIx64 ". Using default 512M",
-                s->ram_size);
-    s->ram_size =3D 512 << 20;
-    return ASPEED_SDMC_AST2500_512MB;
-}
-
-static int ast2600_rambits(AspeedSDMCState *s)
-{
-    switch (s->ram_size >> 20) {
-    case 256:
-        return ASPEED_SDMC_AST2600_256MB;
-    case 512:
-        return ASPEED_SDMC_AST2600_512MB;
-    case 1024:
-        return ASPEED_SDMC_AST2600_1024MB;
-    case 2048:
-        return ASPEED_SDMC_AST2600_2048MB;
-    default:
-        break;
-    }
-
-    /* use a common default */
-    warn_report("Invalid RAM size 0x%" PRIx64 ". Using default 1024M",
-                s->ram_size);
-    s->ram_size =3D 1024 << 20;
-    return ASPEED_SDMC_AST2600_1024MB;
-}
-
 static void aspeed_sdmc_reset(DeviceState *dev)
 {
     AspeedSDMCState *s =3D ASPEED_SDMC(dev);
@@ -257,11 +191,14 @@ static Property aspeed_sdmc_properties[] =3D {
 static void aspeed_sdmc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedSDMCClass *asc =3D ASPEED_SDMC_CLASS(klass);
+
     dc->realize =3D aspeed_sdmc_realize;
     dc->reset =3D aspeed_sdmc_reset;
     dc->desc =3D "ASPEED SDRAM Memory Controller";
     dc->vmsd =3D &vmstate_aspeed_sdmc;
     dc->props =3D aspeed_sdmc_properties;
+    asc->ram2feat =3D g_hash_table_new(g_direct_hash, g_direct_equal);
 }
=20
 static const TypeInfo aspeed_sdmc_info =3D {
@@ -273,10 +210,28 @@ static const TypeInfo aspeed_sdmc_info =3D {
     .abstract   =3D true,
 };
=20
+static int aspeed_get_ram_feat(AspeedSDMCState *s)
+{
+    AspeedSDMCClass *asc =3D ASPEED_SDMC_GET_CLASS(s);
+    int ram_mb =3D s->ram_size >> 20;
+    gpointer val;
+
+    if (g_hash_table_contains(asc->ram2feat, GINT_TO_POINTER(ram_mb))) {
+        val =3D g_hash_table_lookup(asc->ram2feat, GINT_TO_POINTER(ram_mb)=
);
+        return GPOINTER_TO_INT(val);
+    }
+
+    warn_report("Invalid RAM size 0x%" PRIx64 ". Using default %dM",
+                 s->ram_size, asc->fallback_ram_size);
+    s->ram_size =3D asc->fallback_ram_size << 20;
+    val =3D g_hash_table_lookup(asc->ram2feat, &asc->fallback_ram_size);
+    return GPOINTER_TO_INT(val);
+}
+
 static uint32_t aspeed_2400_sdmc_compute_conf(AspeedSDMCState *s, uint32_t=
 data)
 {
-    uint32_t fixed_conf =3D ASPEED_SDMC_VGA_COMPAT |
-        ASPEED_SDMC_DRAM_SIZE(ast2400_rambits(s));
+    int ram_f =3D aspeed_get_ram_feat(s);
+    uint32_t fixed_conf =3D ASPEED_SDMC_VGA_COMPAT | ASPEED_SDMC_DRAM_SIZE=
(ram_f);
=20
     /* Make sure readonly bits are kept */
     data &=3D ~ASPEED_SDMC_READONLY_MASK;
@@ -298,6 +253,9 @@ static void aspeed_2400_sdmc_write(AspeedSDMCState *s, =
uint32_t reg,
     s->regs[reg] =3D data;
 }
=20
+#define REGISTER_RAM_SIZE(h, k, v) \
+    g_hash_table_insert(h->ram2feat, GINT_TO_POINTER(k), GINT_TO_POINTER(v=
))
+
 static void aspeed_2400_sdmc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
@@ -307,6 +265,11 @@ static void aspeed_2400_sdmc_class_init(ObjectClass *k=
lass, void *data)
     asc->max_ram_size =3D 512 << 20;
     asc->compute_conf =3D aspeed_2400_sdmc_compute_conf;
     asc->write =3D aspeed_2400_sdmc_write;
+    asc->fallback_ram_size =3D 256;
+    REGISTER_RAM_SIZE(asc, 64, ASPEED_SDMC_DRAM_64MB);
+    REGISTER_RAM_SIZE(asc, 128, ASPEED_SDMC_DRAM_128MB);
+    REGISTER_RAM_SIZE(asc, 256, ASPEED_SDMC_DRAM_256MB);
+    REGISTER_RAM_SIZE(asc, 512, ASPEED_SDMC_DRAM_512MB);
 }
=20
 static const TypeInfo aspeed_2400_sdmc_info =3D {
@@ -317,10 +280,10 @@ static const TypeInfo aspeed_2400_sdmc_info =3D {
=20
 static uint32_t aspeed_2500_sdmc_compute_conf(AspeedSDMCState *s, uint32_t=
 data)
 {
+    int ram_f =3D aspeed_get_ram_feat(s);
     uint32_t fixed_conf =3D ASPEED_SDMC_HW_VERSION(1) |
         ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB) |
-        ASPEED_SDMC_CACHE_INITIAL_DONE |
-        ASPEED_SDMC_DRAM_SIZE(ast2500_rambits(s));
+        ASPEED_SDMC_CACHE_INITIAL_DONE | ASPEED_SDMC_DRAM_SIZE(ram_f);
=20
     /* Make sure readonly bits are kept */
     data &=3D ~ASPEED_SDMC_AST2500_READONLY_MASK;
@@ -360,6 +323,11 @@ static void aspeed_2500_sdmc_class_init(ObjectClass *k=
lass, void *data)
     asc->max_ram_size =3D 1024 << 20;
     asc->compute_conf =3D aspeed_2500_sdmc_compute_conf;
     asc->write =3D aspeed_2500_sdmc_write;
+    asc->fallback_ram_size =3D 512;
+    REGISTER_RAM_SIZE(asc, 128, ASPEED_SDMC_AST2500_128MB);
+    REGISTER_RAM_SIZE(asc, 256, ASPEED_SDMC_AST2500_256MB);
+    REGISTER_RAM_SIZE(asc, 512, ASPEED_SDMC_AST2500_512MB);
+    REGISTER_RAM_SIZE(asc, 1024, ASPEED_SDMC_AST2500_1024MB);
 }
=20
 static const TypeInfo aspeed_2500_sdmc_info =3D {
@@ -370,9 +338,10 @@ static const TypeInfo aspeed_2500_sdmc_info =3D {
=20
 static uint32_t aspeed_2600_sdmc_compute_conf(AspeedSDMCState *s, uint32_t=
 data)
 {
+    int ram_f =3D aspeed_get_ram_feat(s);
     uint32_t fixed_conf =3D ASPEED_SDMC_HW_VERSION(3) |
         ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB) |
-        ASPEED_SDMC_DRAM_SIZE(ast2600_rambits(s));
+        ASPEED_SDMC_DRAM_SIZE(ram_f);
=20
     /* Make sure readonly bits are kept (use ast2500 mask) */
     data &=3D ~ASPEED_SDMC_AST2500_READONLY_MASK;
@@ -413,6 +382,11 @@ static void aspeed_2600_sdmc_class_init(ObjectClass *k=
lass, void *data)
     asc->max_ram_size =3D 2048 << 20;
     asc->compute_conf =3D aspeed_2600_sdmc_compute_conf;
     asc->write =3D aspeed_2600_sdmc_write;
+    asc->fallback_ram_size =3D 512;
+    REGISTER_RAM_SIZE(asc, 256, ASPEED_SDMC_AST2600_256MB);
+    REGISTER_RAM_SIZE(asc, 512, ASPEED_SDMC_AST2600_512MB);
+    REGISTER_RAM_SIZE(asc, 1024, ASPEED_SDMC_AST2600_1024MB);
+    REGISTER_RAM_SIZE(asc, 2048, ASPEED_SDMC_AST2600_2048MB);
 }
=20
 static const TypeInfo aspeed_2600_sdmc_info =3D {
--=20
2.7.4

