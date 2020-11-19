Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp759700lfb;
        Thu, 19 Nov 2020 14:11:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxevbAYfmq5fibpgGr4FY8KN6kKZ8Vx+TkIPkrKqKrGZOY/YTONbjWyYqTY062+lShF4+gy
X-Received: by 2002:a25:c68c:: with SMTP id k134mr21325759ybf.451.1605823861826;
        Thu, 19 Nov 2020 14:11:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605823861; cv=none;
        d=google.com; s=arc-20160816;
        b=StOKYGBd0lJllvPWAQqwgoZRJNPuwRs9tGV0Z2v289u9/XXkOdepojTevw/mj5Tcwc
         bMTjLW8xC55r9a7701qnVnBBKEOgToYEurpzoNZyQM6yViG0JLfnWOAcNCc+JL9egBkz
         RTrrFsgfWCOAmKgo+jTmYPUvmZ1z2vDEgv0WdkJL0LB8wvZadlLxEOh5EdK6xAJfWLNf
         w6vW2J5DOFRY2YeHBSE0OYHgcin/20JAnlwak6lxnTWRGT4EiFfGvpn3Z83e1w4erQ9/
         rESAcIYVKCVh4G6xjtKmY/sveTNNimjI9XF3tn/mASFbx9/d+bSIpCuQiUMdjhXDXmkh
         YBcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CpeB0JZIf82ouGJAcXNi10kk5fwgUTHRGskoxQo7vDg=;
        b=C72MDK8uOqUCXiOnSpu624FVqfkEKNaGOiu8Qi6W0aqX2GdGlZWBSi7HtnxMourOPA
         1jVgn9XrXMVHEIsbnPVFl6qhmsi/crTzoIzAboJGls1bv1XVmnVNI6SLPma6U4c6IF/9
         gpB+Wk5gLKak1aNUrtWWYEWAzWV6rhUOw2Tw4Wd/H0wJR6Rx8sysmFquulA0qUa2Yo3a
         6XLR7YdN+cWPYUAnbM+i+BKl40YBMt4Qo2+chtrOK8scyvGBxqCguTb3c4nvQJr3C4JK
         MHw7Sc5peWO2l1kRGhgVFlUVrO+2g9LbInzZibmR9xD0Qn5j6ze/7NHGjmVbkSLReohm
         N5Fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tgNXkwZk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h203si806026ybg.381.2020.11.19.14.11.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 14:11:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tgNXkwZk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfs8r-0002KZ-8K
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 17:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvL-0001AB-HL
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:57:03 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:47074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrv8-0004Gu-V1
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:57:03 -0500
Received: by mail-wr1-x444.google.com with SMTP id d12so7934425wrr.13
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CpeB0JZIf82ouGJAcXNi10kk5fwgUTHRGskoxQo7vDg=;
 b=tgNXkwZkzO8/NMl+u6brb0gRnqRQ9Zl9qth9CQwq5YqWCNeUOnD6vZzuOV72Wh6IMS
 nFrJVTntqy2y6q9z95NeVtwtnLKR1coHlH69KSh01p9ZlN1BE5WmK5qWtw/vsQZb6sWB
 hE6dn8HMkgnf5RMrtJwGz439OggcRc1CmV9SbPV9NdZi0RGwXuZwQ1PNcf+rfRmwNB+i
 s1nGD0KD4l8S/zfMDzOtuXzPof1wzcFILB4Nn0dvJKLIwpHm1PSwqE6RGmvuzch+gGS2
 pf4J1O6G9c8frSl5SBBzH7gyd9BFzs341zIPCby6ywwA+Tr74YYvSVHtJ2MopTBVJt1q
 la7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CpeB0JZIf82ouGJAcXNi10kk5fwgUTHRGskoxQo7vDg=;
 b=kO/nE3EkXr5GG9wGMnTpV0QqABxQOwbqdaRt8DpP1JuQNfPkl0C/MK+lm2ogtzHoQm
 ia//JkK6+Cx8nxsO1cXEbhyX33llSaAhCnYlu3c6SlX8AYDIsC0JwUjA/kcj2SLB+Uhb
 fkjtP+eEU3QpLnrQHdtJAvuJjAV0Jh7bsx/RMisrw252cgBwIsyvDiELyn9ZZukGBCS5
 eDifDH19XsTdfOdshoXTn+6XTVJ7f0WPCW5g09tlTvVMy/wOy0E2nm+IAVejiATl9Vjs
 sWBplmbDUvglF2ASBO5YbV+QXkZf5EdRdw5FhFHDE2nn78W53YQHmKSH7RBuxU5JDXu4
 ImZQ==
X-Gm-Message-State: AOAM533OwZJJR/nZZWf0dqMNJ+J1wNGNGipmWHS22/JUEfMZNJ71bEwQ
 7xqv0NPa6iVR+rfxGbACXGcGgHeCRJLLSw==
X-Received: by 2002:adf:db87:: with SMTP id u7mr12938687wri.334.1605823009436; 
 Thu, 19 Nov 2020 13:56:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 26/28] hw/intc/armv7m_nvic: Implement read/write for RAS
 register block
Date: Thu, 19 Nov 2020 21:56:15 +0000
Message-Id: <20201119215617.29887-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hXkaYY3/FNOV

The RAS feature has a block of memory-mapped registers at offset
0x5000 within the PPB.  For a "minimal RAS" implementation we provide
no error records and so the only registers that exist in the block
are ERRIIDR and ERRDEVID.

The "RAZ/WI for privileged, BusFault for nonprivileged" behaviour
of the "nvic-default" region is actually valid for minimal-RAS,
so the main benefit of providing an explicit implementation of
the register block is more accurate LOG_UNIMP messages, and a
framework for where we could add a real RAS implementation later
if necessary.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/armv7m_nvic.h |  1 +
 hw/intc/armv7m_nvic.c         | 56 +++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index 33b6d8810c7..39c71e15936 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -83,6 +83,7 @@ struct NVICState {
     MemoryRegion sysreg_ns_mem;
     MemoryRegion systickmem;
     MemoryRegion systick_ns_mem;
+    MemoryRegion ras_mem;
     MemoryRegion container;
     MemoryRegion defaultmem;
 
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index c42b291f881..5ab77a3530c 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2530,6 +2530,56 @@ static const MemoryRegionOps nvic_systick_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+
+static MemTxResult ras_read(void *opaque, hwaddr addr,
+                            uint64_t *data, unsigned size,
+                            MemTxAttrs attrs)
+{
+    if (attrs.user) {
+        return MEMTX_ERROR;
+    }
+
+    switch (addr) {
+    case 0xe10: /* ERRIIDR */
+        /* architect field = Arm; product/variant/revision 0 */
+        *data = 0x43b;
+        break;
+    case 0xfc8: /* ERRDEVID */
+        /* Minimal RAS: we implement 0 error record indexes */
+        *data = 0;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "Read RAS register offset 0x%x\n",
+                      (uint32_t)addr);
+        *data = 0;
+        break;
+    }
+    return MEMTX_OK;
+}
+
+static MemTxResult ras_write(void *opaque, hwaddr addr,
+                             uint64_t value, unsigned size,
+                             MemTxAttrs attrs)
+{
+    if (attrs.user) {
+        return MEMTX_ERROR;
+    }
+
+    switch (addr) {
+    default:
+        qemu_log_mask(LOG_UNIMP, "Write to RAS register offset 0x%x\n",
+                      (uint32_t)addr);
+        break;
+    }
+    return MEMTX_OK;
+}
+
+static const MemoryRegionOps ras_ops = {
+    .read_with_attrs = ras_read,
+    .write_with_attrs = ras_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
 /*
  * Unassigned portions of the PPB space are RAZ/WI for privileged
  * accesses, and fault for non-privileged accesses.
@@ -2877,6 +2927,12 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
                                             &s->systick_ns_mem, 1);
     }
 
+    if (cpu_isar_feature(aa32_ras, s->cpu)) {
+        memory_region_init_io(&s->ras_mem, OBJECT(s),
+                              &ras_ops, s, "nvic_ras", 0x1000);
+        memory_region_add_subregion(&s->container, 0x5000, &s->ras_mem);
+    }
+
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container);
 }
 
-- 
2.20.1

