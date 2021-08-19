Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp487193lfg;
        Thu, 19 Aug 2021 09:37:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkt0cnJ/N4f0qpQI7F4CBCAMUcv1+DeCzIK8AIUWcrR2mRl3+KXLZAck6LXY2funGPhW6+
X-Received: by 2002:a67:ecd7:: with SMTP id i23mr13523922vsp.43.1629391028267;
        Thu, 19 Aug 2021 09:37:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629391028; cv=none;
        d=google.com; s=arc-20160816;
        b=tXVRkpMWVP/NP63/7GBimnJXkux6MAq8H0jXWGVxy9SJgbHUJH6JWJ2HlD/sXrBMuD
         s0+sxm55oR7Q35GcmatUzqFwSTiYHcUj1svpKuWP6swLmi/+L1SD2NrteGGLgzGGpE/r
         /33WsDIlpwfJl2v58Fdrx4n5jisbSeKq6VdCeY23jPLJuXYDpDRQuan8qQZY8ZhVBnIr
         m5dbgAajoIUKOh14UTZLH9wRK9DV6j12lqOb4FkopgZ8dQCTovbS1jn4n92ABSuNLA5h
         1qVg124X7k+3FCBPRjwkjjMJrFZcZn+r1H7WOPQ6GDelrnAAtmO0d8RiDI8If6/Jyi2j
         dDQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zypsqy4bbbHKSJYTV7SCgvLzNsZfKZVVCMytHeZVqM4=;
        b=yGZ0J+Ab/pJjSz3m196J2tt/Hm3e8b51HmEeBfud4DVdvWIF+k4prFkfH2k5B5H+ED
         QI0pQomwSGzXmLQdwDIXaFri/Q+oyhXjboh27lpW0mg7d41g7FnjVt968yR0oyAEApyk
         4oHrVHJH8Ssu3tt8WW+rlElzFZFh3z8BO0pq0qGfkATObPAYUQ1/Yfgnm86cN/UEI/k2
         nIEyedzPbOj6ZwgwhELJQw01ujeH65AJFpj1lRe7dyhzI3Ca57Fp5DmpSUxwDSkixZaI
         t2rK3kjYCI2nDJSdbJP+9HyE6UxuhsEVFFTQnQ1GK69rDNgVNyvA8/VtAu4wtQRughC5
         H7cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZqlA+ED5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10si1726402vsp.327.2021.08.19.09.37.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 09:37:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZqlA+ED5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGl2R-0007tP-Eu
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 12:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGl09-0002o5-UC
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 12:34:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGl06-00060N-Lj
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 12:34:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629390881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zypsqy4bbbHKSJYTV7SCgvLzNsZfKZVVCMytHeZVqM4=;
 b=ZqlA+ED5+kphrIR+MLKQQwoC5Uq+Rn9dyo2BuKOuVf2BgZtf+Ks/w3UCMTr5pX7U/mE4n8
 AOCQd0RviwyNdnY5Fx0QbSar0vj4qVe33DJAxyKWzAcWGH/mI+zU708xg3js+3Iw08p459
 7hK55CY8aR7VuXGPpgn1rVpXyBI/cR4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-NlqsyCVGMOWF6jaZSw894w-1; Thu, 19 Aug 2021 12:34:40 -0400
X-MC-Unique: NlqsyCVGMOWF6jaZSw894w-1
Received: by mail-wm1-f70.google.com with SMTP id
 e12-20020a05600c218cb02902e6bbacdcd1so1696051wme.4
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 09:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zypsqy4bbbHKSJYTV7SCgvLzNsZfKZVVCMytHeZVqM4=;
 b=nyibN/BbKlhflgpqioDXTe7hSdGjd4yAJLU68T+79CC4K6uXnetNpTpLmnd99UcmCG
 6ZnNk65csdXv0B6rdwOOXoj8UpP+dsdR6uQhedYBxU8Pr0gK5kH/mZm1k/OeRMQhs2ao
 MLsN1jTUiCeJB1+wWP4pxNV/6tCiitCXizlYLgR0LiaPIL3HnUbS7ag6AAoyRxbG0Hwu
 hlVDqYIIVtfQWg3SZgnfrIl/d11RbUhOd3M34PTXumn3dT4I4beLqf52QWn+HdARmE+I
 /SLH58UtrNNF7t2K5msJ9rsex0RbfbXyNQebnirobuei9iR0VYNBWyzxVpqZ5Di6Y/62
 5xVg==
X-Gm-Message-State: AOAM530EYIfszyFcXqFwmiVXZ+r/bLouj2P4Dul5x0n+1k745DCxeJ3P
 GMRh9LXHwOUCyRs3Fl/UBvDO4amDYzHm+cHDdX68uwQvt5dAyaeUOhJYuf7lyViUz2W7h6j3309
 +Nhak4g1dqKvg
X-Received: by 2002:a7b:c2f0:: with SMTP id e16mr14558475wmk.144.1629390878548; 
 Thu, 19 Aug 2021 09:34:38 -0700 (PDT)
X-Received: by 2002:a7b:c2f0:: with SMTP id e16mr14558463wmk.144.1629390878399; 
 Thu, 19 Aug 2021 09:34:38 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 m7sm7733487wmq.29.2021.08.19.09.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:34:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] hw/dma/xlnx_csu_dma: Always expect 'dma' link property
 to be set
Date: Thu, 19 Aug 2021 18:34:21 +0200
Message-Id: <20210819163422.2863447-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819163422.2863447-1-philmd@redhat.com>
References: <20210819163422.2863447-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6Mz5IitPmhSD

Simplify by always passing a MemoryRegion property to the device.
Doing so we can move the AddressSpace field to the device struct,
removing need for heap allocation.

Update the Xilinx ZynqMP SoC model to pass the default system
memory instead of a NULL value.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/dma/xlnx_csu_dma.h |  2 +-
 hw/arm/xlnx-zynqmp.c          |  4 ++++
 hw/dma/xlnx_csu_dma.c         | 21 ++++++++++-----------
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
index 204d94c6737..9e9dc551e99 100644
--- a/include/hw/dma/xlnx_csu_dma.h
+++ b/include/hw/dma/xlnx_csu_dma.h
@@ -30,7 +30,7 @@ typedef struct XlnxCSUDMA {
     MemoryRegion iomem;
     MemTxAttrs attr;
     MemoryRegion *dma_mr;
-    AddressSpace *dma_as;
+    AddressSpace dma_as;
     qemu_irq irq;
     StreamSink *tx_dev; /* Used as generic StreamSink */
     ptimer_state *src_timer;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 9724978761b..4344e223f2d 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -620,6 +620,10 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
                            gic_spi[adma_ch_intr[i]]);
     }
 
+    if (!object_property_set_link(OBJECT(&s->qspi_dma), "dma",
+                                  OBJECT(system_memory), errp)) {
+        return;
+    }
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->qspi_dma), errp)) {
         return;
     }
diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 2d19f415ef3..896bb3574dd 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -201,11 +201,11 @@ static uint32_t xlnx_csu_dma_read(XlnxCSUDMA *s, uint8_t *buf, uint32_t len)
         for (i = 0; i < len && (result == MEMTX_OK); i += s->width) {
             uint32_t mlen = MIN(len - i, s->width);
 
-            result = address_space_rw(s->dma_as, addr, s->attr,
+            result = address_space_rw(&s->dma_as, addr, s->attr,
                                       buf + i, mlen, false);
         }
     } else {
-        result = address_space_rw(s->dma_as, addr, s->attr, buf, len, false);
+        result = address_space_rw(&s->dma_as, addr, s->attr, buf, len, false);
     }
 
     if (result == MEMTX_OK) {
@@ -232,12 +232,12 @@ static uint32_t xlnx_csu_dma_write(XlnxCSUDMA *s, uint8_t *buf, uint32_t len)
         for (i = 0; i < len && (result == MEMTX_OK); i += s->width) {
             uint32_t mlen = MIN(len - i, s->width);
 
-            result = address_space_rw(s->dma_as, addr, s->attr,
+            result = address_space_rw(&s->dma_as, addr, s->attr,
                                       buf, mlen, true);
             buf += mlen;
         }
     } else {
-        result = address_space_rw(s->dma_as, addr, s->attr, buf, len, true);
+        result = address_space_rw(&s->dma_as, addr, s->attr, buf, len, true);
     }
 
     if (result != MEMTX_OK) {
@@ -631,6 +631,12 @@ static void xlnx_csu_dma_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (!s->dma_mr) {
+        error_setg(errp, TYPE_XLNX_CSU_DMA " 'dma' link not set");
+        return;
+    }
+    address_space_init(&s->dma_as, s->dma_mr, "csu-dma");
+
     reg_array =
         register_init_block32(dev, xlnx_csu_dma_regs_info[!!s->is_dst],
                               XLNX_CSU_DMA_R_MAX,
@@ -648,13 +654,6 @@ static void xlnx_csu_dma_realize(DeviceState *dev, Error **errp)
     s->src_timer = ptimer_init(xlnx_csu_dma_src_timeout_hit,
                                s, PTIMER_POLICY_DEFAULT);
 
-    if (s->dma_mr) {
-        s->dma_as = g_malloc0(sizeof(AddressSpace));
-        address_space_init(s->dma_as, s->dma_mr, NULL);
-    } else {
-        s->dma_as = &address_space_memory;
-    }
-
     s->attr = MEMTXATTRS_UNSPECIFIED;
 
     s->r_size_last_word = 0;
-- 
2.31.1

