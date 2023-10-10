Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp297127ejb;
        Tue, 10 Oct 2023 00:40:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCsV8tTXpFVSh493zCYJ3UQW4bYhIz5AUKgCB8N8Kb1pIaMCV2XFyw6kjhDXbUt4MqstiV
X-Received: by 2002:ae9:c10a:0:b0:773:b1a0:c124 with SMTP id z10-20020ae9c10a000000b00773b1a0c124mr16829828qki.45.1696923639963;
        Tue, 10 Oct 2023 00:40:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696923639; cv=none;
        d=google.com; s=arc-20160816;
        b=PQHBVEcDifTVucXTWaq8VEVF8/y1NQ2j6h7TQPrZqCiI31/Hznyrd243iZ7kM3JECc
         QoAzCOXtOYmLaLmHh7+oKVqHmw/ENyTyl/39cZJV/sz9+c5pknB/uyRehbGwzd/raRjs
         1x0A/UGtnSh+45Vq14SAx5jSfAdvhsCwntCrEmAfD9TU3MQCX46+KnnjQLnKaUC/360k
         gfZ37CFLsWIbGwTYazvxB1Bh2oxJwF2x5qp0dXZFsgcGS0kOrSvG0txtcFpKKobFKgD5
         R6Vv1JZoZR2U6O96rWAoS7idSFnlWelDvZxaekbCiX40KFjoRBnri+MRLO9FEfQ0zqpn
         79iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JC/Mi2SAtx0SK4D2fKY6EQG36CAz09MgpCp2U83f0eI=;
        fh=46wv1No7OOLuZCRbeGSaV31Ktmo6cwaISz6jgi4/xrY=;
        b=vRQmtPmAPY6HWmAK9bGFyXCG1u6BGyRHUOHkoRTK9A63TQQDWIwBPumUZaARyM7cb7
         4GUrvd8iGIuWX1NxBGvlcqZ37tDvw5AC0cdAXWIDw2MjgT78RrMmgu5rIyFTpZ8xX0HU
         yzKOLQ+S82mgcW3iSrrfltGEALVlQk7vfHB933nTUeoxd59ek/DjYR9IHRNYCg56i9Bs
         Iu3vVHxmXOuH2RgDPYDULbP4QalQj9ye6vW1/QdrlNR0kbxVBtQEf+Vz4EEN9zfoDqUX
         iUMWxes43rUGHZd1qlnBXNJRDjivOKa+oaj00m9PUIJY1iUET6hn0y4vhe2gK+ZOan6Y
         fB/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hp0pZYOR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dx8-20020a05620a608800b0076da64decfbsi7044236qkb.63.2023.10.10.00.40.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 00:40:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hp0pZYOR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qq7LV-0002iS-Lb; Tue, 10 Oct 2023 03:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7LN-0002Gk-V2
 for qemu-devel@nongnu.org; Tue, 10 Oct 2023 03:39:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7LK-0001sb-AL
 for qemu-devel@nongnu.org; Tue, 10 Oct 2023 03:39:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696923588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JC/Mi2SAtx0SK4D2fKY6EQG36CAz09MgpCp2U83f0eI=;
 b=hp0pZYORKNIcSxEMdTggU9DwDVtMdwwy2WXUvOT4M+VkJzFB9N9pfKrvzEpHV2uGdVcWim
 TSekeGrI6FB7AGifp0YPvfrhw+JPkz5fuKKeweL5I3FWKP0XpdQFARfqPmsG7qgciNXdb1
 X1RaihW3CJVT0Saglsmc7suQMiZGong=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-yEMgOGHSOGar1cDVcJWeog-1; Tue, 10 Oct 2023 03:39:43 -0400
X-MC-Unique: yEMgOGHSOGar1cDVcJWeog-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70B58381259A;
 Tue, 10 Oct 2023 07:39:43 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AFC940D1BC;
 Tue, 10 Oct 2023 07:39:41 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 16/18] hw/sm501: allow compiling without PIXMAN
Date: Tue, 10 Oct 2023 11:38:28 +0400
Message-ID: <20231010073830.606570-17-marcandre.lureau@redhat.com>
In-Reply-To: <20231010073830.606570-1-marcandre.lureau@redhat.com>
References: <20231010073830.606570-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7ljtCfDcewNy

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Drop the "x-pixman" property and use fallback path in such case.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/display/sm501.c | 46 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 9 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 0eecd00701..bc5faa19f0 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -438,6 +438,12 @@
 #define SM501_HWC_WIDTH                 64
 #define SM501_HWC_HEIGHT                64
 
+#ifdef CONFIG_PIXMAN
+#define DEFAULT_X_PIXMAN 7
+#else
+#define DEFAULT_X_PIXMAN 0
+#endif
+
 /* SM501 local memory size taken from "linux/drivers/mfd/sm501.c" */
 static const uint32_t sm501_mem_local_size[] = {
     [0] = 4 * MiB,
@@ -730,7 +736,6 @@ static void sm501_2d_operation(SM501State *s)
     switch (cmd) {
     case 0: /* BitBlt */
     {
-        static uint32_t tmp_buf[16384];
         unsigned int src_x = (s->twoD_source >> 16) & 0x01FFF;
         unsigned int src_y = s->twoD_source & 0xFFFF;
         uint32_t src_base = s->twoD_source_base & 0x03FFFFFF;
@@ -828,9 +833,11 @@ static void sm501_2d_operation(SM501State *s)
                 de = db + (width + (height - 1) * dst_pitch) * bypp;
                 overlap = (db < se && sb < de);
             }
+#ifdef CONFIG_PIXMAN
             if (overlap && (s->use_pixman & BIT(2))) {
                 /* pixman can't do reverse blit: copy via temporary */
                 int tmp_stride = DIV_ROUND_UP(width * bypp, sizeof(uint32_t));
+                static uint32_t tmp_buf[16384];
                 uint32_t *tmp = tmp_buf;
 
                 if (tmp_stride * sizeof(uint32_t) * height > sizeof(tmp_buf)) {
@@ -860,9 +867,12 @@ static void sm501_2d_operation(SM501State *s)
                                        dst_pitch * bypp / sizeof(uint32_t),
                                        8 * bypp, 8 * bypp, src_x, src_y,
                                        dst_x, dst_y, width, height);
-            } else {
+            } else
+#else
+            {
                 fallback = true;
             }
+#endif
             if (fallback) {
                 uint8_t *sp = s->local_mem + src_base;
                 uint8_t *d = s->local_mem + dst_base;
@@ -894,10 +904,13 @@ static void sm501_2d_operation(SM501State *s)
             color = cpu_to_le16(color);
         }
 
+#ifdef CONFIG_PIXMAN
         if (!(s->use_pixman & BIT(0)) || (width == 1 && height == 1) ||
             !pixman_fill((uint32_t *)&s->local_mem[dst_base],
                          dst_pitch * bypp / sizeof(uint32_t), 8 * bypp,
-                         dst_x, dst_y, width, height, color)) {
+                         dst_x, dst_y, width, height, color))
+#endif
+        {
             /* fallback when pixman failed or we don't want to call it */
             uint8_t *d = s->local_mem + dst_base;
             unsigned int x, y, i;
@@ -1875,9 +1888,16 @@ static void sm501_reset(SM501State *s)
     s->twoD_wrap = 0;
 }
 
-static void sm501_init(SM501State *s, DeviceState *dev,
-                       uint32_t local_mem_bytes)
+static bool sm501_init(SM501State *s, DeviceState *dev,
+                       uint32_t local_mem_bytes, Error **errp)
 {
+#ifndef CONFIG_PIXMAN
+    if (s->use_pixman != 0) {
+        error_setg(errp, "x-pixman!=0, however PIXMAN is not available");
+        return false;
+    }
+#endif
+
     s->local_mem_size_index = get_local_mem_size_index(local_mem_bytes);
 
     /* local memory */
@@ -1916,6 +1936,7 @@ static void sm501_init(SM501State *s, DeviceState *dev,
 
     /* create qemu graphic console */
     s->con = graphic_console_init(dev, 0, &sm501_ops, s);
+    return true;
 }
 
 static const VMStateDescription vmstate_sm501_state = {
@@ -2014,7 +2035,9 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     MemoryRegion *mr;
 
-    sm501_init(&s->state, dev, s->vram_size);
+    if (!sm501_init(&s->state, dev, s->vram_size, errp)) {
+        return;
+    }
     if (get_local_mem_size(&s->state) != s->vram_size) {
         error_setg(errp, "Invalid VRAM size, nearest valid size is %" PRIu32,
                    get_local_mem_size(&s->state));
@@ -2038,7 +2061,8 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
 
 static Property sm501_sysbus_properties[] = {
     DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
-    DEFINE_PROP_UINT8("x-pixman", SM501SysBusState, state.use_pixman, 7),
+    /* TODO: consider PROP_BIT instead */
+    DEFINE_PROP_UINT8("x-pixman", SM501SysBusState, state.use_pixman, DEFAULT_X_PIXMAN),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -2112,7 +2136,9 @@ static void sm501_realize_pci(PCIDevice *dev, Error **errp)
 {
     SM501PCIState *s = PCI_SM501(dev);
 
-    sm501_init(&s->state, DEVICE(dev), s->vram_size);
+    if (!sm501_init(&s->state, DEVICE(dev), s->vram_size, errp)) {
+        return;
+    }
     if (get_local_mem_size(&s->state) != s->vram_size) {
         error_setg(errp, "Invalid VRAM size, nearest valid size is %" PRIu32,
                    get_local_mem_size(&s->state));
@@ -2126,7 +2152,7 @@ static void sm501_realize_pci(PCIDevice *dev, Error **errp)
 
 static Property sm501_pci_properties[] = {
     DEFINE_PROP_UINT32("vram-size", SM501PCIState, vram_size, 64 * MiB),
-    DEFINE_PROP_UINT8("x-pixman", SM501PCIState, state.use_pixman, 7),
+    DEFINE_PROP_UINT8("x-pixman", SM501PCIState, state.use_pixman, DEFAULT_X_PIXMAN),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -2169,8 +2195,10 @@ static void sm501_pci_class_init(ObjectClass *klass, void *data)
 
 static void sm501_pci_init(Object *o)
 {
+#ifdef CONFIG_PIXMAN
     object_property_set_description(o, "x-pixman", "Use pixman for: "
                                     "1: fill, 2: blit, 4: overlap blit");
+#endif
 }
 
 static const TypeInfo sm501_pci_info = {
-- 
2.41.0

