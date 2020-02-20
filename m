Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp543634lfg;
        Thu, 20 Feb 2020 05:06:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqytacpBG5RwWmuHHbu2hYBS+mS8LA1PILw0aoLaZ3nN19d01cza6u7WEQobsd7Qq/2BuYdf
X-Received: by 2002:a9d:bb8:: with SMTP id 53mr21234420oth.150.1582203997627;
        Thu, 20 Feb 2020 05:06:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582203997; cv=none;
        d=google.com; s=arc-20160816;
        b=paE9BCs7yME9WG+AtMIrebqOMJw0OdXcsWHn7P9TdtmL9KINyUWAfFjLRjVA7goIkm
         EKkthYCjvsP7/NC/9tcCTXuXcXuf72b76fcD0O6oNo8bTQayPffuvlPfTLS1bK/4GN3/
         Il3A1QQZCOS53j4QXvltKZgvGGMprboYp9k1h7KVGpdaFXqFP6YsmpixM2Fo41r4W7cs
         zPFs7buvHTAC8woarT7Oe1LfqrjVkseGIazlXoeCTzbPI9fHB3FXk2IVuaFS1SF4V3OG
         EOwqcnByUe8pSaPcHnwQAXk08DJqpewJ3Hync9zrIVmQ0vtaUZ88xIwFt01o4M6tYoUX
         lMVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=/ld+m5dlIbdFkFHFURC0jskPtvz279hvl5fOCIwyBcI=;
        b=AfDG87qUIsPC0vJo3K+eznLs9B3QYy4oBiUOMyA9CzIztxtUxWuHCySGauDQfRFHTn
         N4vM1f0Jk/vye3Qiaql895iGmnsChxh0hknm3ekhoZkIAFwRU1mF+bIcrpYaeAtdr5Du
         U0uBBHfMtDOPx4rxkWPX2K4JUgh/2KQwdLDDDqtuhcaytG/7cxbHTFonwzCWq2oIDwv5
         3v9wZzuxPnIuYO0g3zkwwaduf6y4zSuBMjJGWj8vbeJgLIZKY91JDXDU289H2zM/EZeo
         Lxhc0+MdMs2RephdnPSNb+7IdzXWVKuR9aC0qcbbxJy/B2tr4tjoeje1teeKlmKG3Zy4
         7iJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XoYQ3too;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id b2si1957201ots.284.2020.02.20.05.06.37;
        Thu, 20 Feb 2020 05:06:37 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XoYQ3too;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728194AbgBTNGg (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 20 Feb 2020 08:06:36 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31685 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728183AbgBTNGg (ORCPT
        <rfc822;kvm@vger.kernel.org>); Thu, 20 Feb 2020 08:06:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582203995;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:  content-type:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/ld+m5dlIbdFkFHFURC0jskPtvz279hvl5fOCIwyBcI=;
        b=XoYQ3tooq/QFJJPbBoZXFerXYa1NfLGz4+Nkfdn2LYGYvSOPDJL2Zq49jOlLTkgUqD1Zxc
        l2lDqOeIW23UqGpaa2Phr66AeI3OomJAqoYCeyhJv0XiwOOnOYjzfURyied/6pFKU0KULa
        ZE4Xu/HqYBt0v7OyK0KD6k2uzPEZ9h8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-PIM-lqNtPdWMDZpjCUSyfw-1; Thu, 20 Feb 2020 08:06:33 -0500
X-MC-Unique: PIM-lqNtPdWMDZpjCUSyfw-1
Received: by mail-wm1-f69.google.com with SMTP id p2so579953wma.3
        for <kvm@vger.kernel.org>; Thu, 20 Feb 2020 05:06:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/ld+m5dlIbdFkFHFURC0jskPtvz279hvl5fOCIwyBcI=;
        b=oItBxCXnq9Y+tg+Wa5eoI5b7VhVURzFX+2W6qkDpWa+p1a/mIocPyIdhWkdMJnXSRU
         iRsWgaoEE7bmuq8lm0R4zcDRoh+D+OioN+OTar04lDMmUpLIfsPJBw71d1WikWlt2VKK
         /kj46qlm+EYxzbf8zNUavQoWFs1I9p0CcsmRzRQd6BzT8QIKpGH/Bewdi018ZOxQpQoB
         RP0LATS6ZS65PW4zRx9yoHTQwDlEawz40+CPjUuxBFgS3y7DbTD4OcNWVZtmdHKBA5HA
         lCUblK3kiesE6CEyvtJ48LJz3eKOVk43hClB08zWerS9i2uYIsWUXxCcOItQMWe6c78b
         nurQ==
X-Gm-Message-State: APjAAAXyi3tz0cpvhQ5qEIcrp4k4+4dXRh/3MXpqk9UkabK0U4LdIZai
        Vo2qo63DhdcQHewOaeyB5d575pkegQz6GbelmSg6K45RIsDZU3pW5JDxgP2oyS7chM/ykzMP4RT
        AQCJ/gqfbVVK5
X-Received: by 2002:adf:e781:: with SMTP id n1mr45109052wrm.56.1582203991748;
        Thu, 20 Feb 2020 05:06:31 -0800 (PST)
X-Received: by 2002:adf:e781:: with SMTP id n1mr45109010wrm.56.1582203991459;
        Thu, 20 Feb 2020 05:06:31 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net. [88.21.202.78])
        by smtp.gmail.com with ESMTPSA id b67sm4594690wmc.38.2020.02.20.05.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 05:06:30 -0800 (PST)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To:     Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc:     "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        Fam Zheng <fam@euphon.net>,
        =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
        kvm@vger.kernel.org, Laurent Vivier <lvivier@redhat.com>,
        Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
        Eric Auger <eric.auger@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        qemu-s390x@nongnu.org,
        Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
        Gerd Hoffmann <kraxel@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
        Alistair Francis <alistair@alistair23.me>,
        qemu-block@nongnu.org,
        =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
        Jason Wang <jasowang@redhat.com>,
        xen-devel@lists.xenproject.org,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Dmitry Fleytman <dmitry.fleytman@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Igor Mitsyanko <i.mitsyanko@gmail.com>,
        Paul Durrant <paul@xen.org>,
        Richard Henderson <rth@twiddle.net>,
        John Snow <jsnow@redhat.com>
Subject: [PATCH v3 10/20] Remove unnecessary cast when using the cpu_[physical]_memory API
Date:   Thu, 20 Feb 2020 14:05:38 +0100
Message-Id: <20200220130548.29974-11-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200220130548.29974-1-philmd@redhat.com>
References: <20200220130548.29974-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 8/wC7LqzXMjl

This commit was produced with the included Coccinelle script
scripts/coccinelle/exec_rw_const.

Suggested-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 scripts/coccinelle/exec_rw_const.cocci | 10 ++++++++++
 hw/display/omap_lcdc.c                 | 10 +++++-----
 hw/dma/etraxfs_dma.c                   | 25 ++++++++++---------------
 hw/scsi/vmw_pvscsi.c                   |  8 +++-----
 target/i386/hax-all.c                  |  6 +++---
 5 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/scripts/coccinelle/exec_rw_const.cocci b/scripts/coccinelle/exec_rw_const.cocci
index 5ed956a834..70cf52d58e 100644
--- a/scripts/coccinelle/exec_rw_const.cocci
+++ b/scripts/coccinelle/exec_rw_const.cocci
@@ -34,6 +34,16 @@ type T;
 + address_space_write_rom(E1, E2, E3, E4, E5)
 |
 
+- cpu_physical_memory_rw(E1, (T *)E2, E3, E4)
++ cpu_physical_memory_rw(E1, E2, E3, E4)
+|
+- cpu_physical_memory_read(E1, (T *)E2, E3)
++ cpu_physical_memory_read(E1, E2, E3)
+|
+- cpu_physical_memory_write(E1, (T *)E2, E3)
++ cpu_physical_memory_write(E1, E2, E3)
+|
+
 - dma_memory_read(E1, E2, (T *)E3, E4)
 + dma_memory_read(E1, E2, E3, E4)
 |
diff --git a/hw/display/omap_lcdc.c b/hw/display/omap_lcdc.c
index 6ad13f2e9e..fa4a381db6 100644
--- a/hw/display/omap_lcdc.c
+++ b/hw/display/omap_lcdc.c
@@ -91,9 +91,9 @@ static void omap_update_display(void *opaque)
 
     frame_offset = 0;
     if (omap_lcd->plm != 2) {
-        cpu_physical_memory_read(omap_lcd->dma->phys_framebuffer[
-                                  omap_lcd->dma->current_frame],
-                                 (void *)omap_lcd->palette, 0x200);
+        cpu_physical_memory_read(
+                omap_lcd->dma->phys_framebuffer[omap_lcd->dma->current_frame],
+                omap_lcd->palette, 0x200);
         switch (omap_lcd->palette[0] >> 12 & 7) {
         case 3 ... 7:
             frame_offset += 0x200;
@@ -244,8 +244,8 @@ static void omap_lcd_update(struct omap_lcd_panel_s *s) {
 
     if (s->plm != 2 && !s->palette_done) {
         cpu_physical_memory_read(
-            s->dma->phys_framebuffer[s->dma->current_frame],
-            (void *)s->palette, 0x200);
+                            s->dma->phys_framebuffer[s->dma->current_frame],
+                            s->palette, 0x200);
         s->palette_done = 1;
         omap_lcd_interrupts(s);
     }
diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c
index 47e1c6df12..c4334e87bf 100644
--- a/hw/dma/etraxfs_dma.c
+++ b/hw/dma/etraxfs_dma.c
@@ -225,9 +225,8 @@ static void channel_load_g(struct fs_dma_ctrl *ctrl, int c)
 	hwaddr addr = channel_reg(ctrl, c, RW_GROUP);
 
 	/* Load and decode. FIXME: handle endianness.  */
-	cpu_physical_memory_read (addr, 
-				  (void *) &ctrl->channels[c].current_g, 
-				  sizeof ctrl->channels[c].current_g);
+    cpu_physical_memory_read(addr, &ctrl->channels[c].current_g,
+                             sizeof(ctrl->channels[c].current_g));
 }
 
 static void dump_c(int ch, struct dma_descr_context *c)
@@ -257,9 +256,8 @@ static void channel_load_c(struct fs_dma_ctrl *ctrl, int c)
 	hwaddr addr = channel_reg(ctrl, c, RW_GROUP_DOWN);
 
 	/* Load and decode. FIXME: handle endianness.  */
-	cpu_physical_memory_read (addr, 
-				  (void *) &ctrl->channels[c].current_c, 
-				  sizeof ctrl->channels[c].current_c);
+    cpu_physical_memory_read(addr, &ctrl->channels[c].current_c,
+                             sizeof(ctrl->channels[c].current_c));
 
 	D(dump_c(c, &ctrl->channels[c].current_c));
 	/* I guess this should update the current pos.  */
@@ -275,9 +273,8 @@ static void channel_load_d(struct fs_dma_ctrl *ctrl, int c)
 
 	/* Load and decode. FIXME: handle endianness.  */
 	D(printf("%s ch=%d addr=" TARGET_FMT_plx "\n", __func__, c, addr));
-	cpu_physical_memory_read (addr,
-				  (void *) &ctrl->channels[c].current_d, 
-				  sizeof ctrl->channels[c].current_d);
+    cpu_physical_memory_read(addr, &ctrl->channels[c].current_d,
+                             sizeof(ctrl->channels[c].current_d));
 
 	D(dump_d(c, &ctrl->channels[c].current_d));
 	ctrl->channels[c].regs[RW_DATA] = addr;
@@ -290,9 +287,8 @@ static void channel_store_c(struct fs_dma_ctrl *ctrl, int c)
 	/* Encode and store. FIXME: handle endianness.  */
 	D(printf("%s ch=%d addr=" TARGET_FMT_plx "\n", __func__, c, addr));
 	D(dump_d(c, &ctrl->channels[c].current_d));
-	cpu_physical_memory_write (addr,
-				  (void *) &ctrl->channels[c].current_c,
-				  sizeof ctrl->channels[c].current_c);
+    cpu_physical_memory_write(addr, &ctrl->channels[c].current_c,
+                              sizeof(ctrl->channels[c].current_c));
 }
 
 static void channel_store_d(struct fs_dma_ctrl *ctrl, int c)
@@ -301,9 +297,8 @@ static void channel_store_d(struct fs_dma_ctrl *ctrl, int c)
 
 	/* Encode and store. FIXME: handle endianness.  */
 	D(printf("%s ch=%d addr=" TARGET_FMT_plx "\n", __func__, c, addr));
-	cpu_physical_memory_write (addr,
-				  (void *) &ctrl->channels[c].current_d, 
-				  sizeof ctrl->channels[c].current_d);
+    cpu_physical_memory_write(addr, &ctrl->channels[c].current_d,
+                              sizeof(ctrl->channels[c].current_d));
 }
 
 static inline void channel_stop(struct fs_dma_ctrl *ctrl, int c)
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index e4ee2e6643..c91352cf46 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -404,8 +404,7 @@ pvscsi_cmp_ring_put(PVSCSIState *s, struct PVSCSIRingCmpDesc *cmp_desc)
 
     cmp_descr_pa = pvscsi_ring_pop_cmp_descr(&s->rings);
     trace_pvscsi_cmp_ring_put(cmp_descr_pa);
-    cpu_physical_memory_write(cmp_descr_pa, (void *)cmp_desc,
-                              sizeof(*cmp_desc));
+    cpu_physical_memory_write(cmp_descr_pa, cmp_desc, sizeof(*cmp_desc));
 }
 
 static void
@@ -415,8 +414,7 @@ pvscsi_msg_ring_put(PVSCSIState *s, struct PVSCSIRingMsgDesc *msg_desc)
 
     msg_descr_pa = pvscsi_ring_pop_msg_descr(&s->rings);
     trace_pvscsi_msg_ring_put(msg_descr_pa);
-    cpu_physical_memory_write(msg_descr_pa, (void *)msg_desc,
-                              sizeof(*msg_desc));
+    cpu_physical_memory_write(msg_descr_pa, msg_desc, sizeof(*msg_desc));
 }
 
 static void
@@ -491,7 +489,7 @@ pvscsi_get_next_sg_elem(PVSCSISGState *sg)
 {
     struct PVSCSISGElement elem;
 
-    cpu_physical_memory_read(sg->elemAddr, (void *)&elem, sizeof(elem));
+    cpu_physical_memory_read(sg->elemAddr, &elem, sizeof(elem));
     if ((elem.flags & ~PVSCSI_KNOWN_FLAGS) != 0) {
         /*
             * There is PVSCSI_SGE_FLAG_CHAIN_ELEMENT flag described in
diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
index a8b6e5aeb8..a9cc51e6ce 100644
--- a/target/i386/hax-all.c
+++ b/target/i386/hax-all.c
@@ -367,7 +367,7 @@ static int hax_accel_init(MachineState *ms)
 static int hax_handle_fastmmio(CPUArchState *env, struct hax_fastmmio *hft)
 {
     if (hft->direction < 2) {
-        cpu_physical_memory_rw(hft->gpa, (uint8_t *) &hft->value, hft->size,
+        cpu_physical_memory_rw(hft->gpa, &hft->value, hft->size,
                                hft->direction);
     } else {
         /*
@@ -376,8 +376,8 @@ static int hax_handle_fastmmio(CPUArchState *env, struct hax_fastmmio *hft)
          *  hft->direction == 2: gpa ==> gpa2
          */
         uint64_t value;
-        cpu_physical_memory_rw(hft->gpa, (uint8_t *) &value, hft->size, 0);
-        cpu_physical_memory_rw(hft->gpa2, (uint8_t *) &value, hft->size, 1);
+        cpu_physical_memory_rw(hft->gpa, &value, hft->size, 0);
+        cpu_physical_memory_rw(hft->gpa2, &value, hft->size, 1);
     }
 
     return 0;
-- 
2.21.1
