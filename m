Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5601877njk;
        Thu, 26 Dec 2024 00:28:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUHz0gWDgzP/fGKv/WOWzOGkEm7pmPcwj7ponS8qSEkk/63hXaTeExRCWyWlHnZblLHp2lZPWxywmsfdw==@linaro.org
X-Google-Smtp-Source: AGHT+IHBJEITe6sA3TY0o0awTDQhFnQ3/hMTB7UAVBJVtEpTOx+XsK/rAnpxrlS4zLA6Ei+cIYzT
X-Received: by 2002:a05:6214:202d:b0:6dc:d29a:b18e with SMTP id 6a1803df08f44-6dd233b02cbmr408639546d6.47.1735201729104;
        Thu, 26 Dec 2024 00:28:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735201729; cv=none;
        d=google.com; s=arc-20240605;
        b=AImin9cFt7ULNyJD+DYl/ieMIe3Z0+lT3dmT0H+BucaVmRhuwiFdi6Uh/SXa8NSIDD
         u7Z4G5wRH11A6Nq1CnYGBfMo3gNYLWeS2ICmOildujSga9Mp8AYUKMyvjLoMVICG7SBJ
         rI9dRZ4NhrtkcRq5gg3skoqAz68yuvlmU1zNWG5DlUviCJJhSZgca131sL4csg1+Zjav
         fqIbzcZ/OVs6Oy/1nT45PXAqi7TjNCA+fCm55nBCCYtvrMJrBYURofptMPDJk1x8kR6g
         QnvN3aD37USvloh3WhaqUIsd/aaZkJtAEPFRoXviJ9UQmaQGUF42UHEq60b/U/4Ud6Hr
         el3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=dSh3O5WaaKwNo1iaUvTSpo+z9u0dQr4Ul55JCilzC1E=;
        fh=luqczq21R/WVyFsAXY3xjiSk+tbt+bB+3AXcxVMujQk=;
        b=PQi27fwZl0BWOdvQaF3ugmMb93XqZuUtlADcA/fgVLV9aCOXoyNChpIAQc31ZlTGtu
         jB2DhToOr69L6k8rqcv5Iq8g6lhgX7h0gO+J+vbGkm4YJUonSzvqeo8RtIWj46fZTVqz
         uajq3MiLZmyJk7rFhO2xXZ881hRh6MGPMHqoFwvhuCsvsuYxjN6ysfdz/ZNUYvddsirV
         hRQN3y4I0cYp9OIspLX94VatEy+vfL8PuvKaM9YuXmACROcPcuaf/B0Qkq50nED2cxtD
         t7Z4P2D9ILcQwb/a64orTF2LM9D76rNFBP6G51kd2QhVlvX4WIM9ajzivTd4SMvCy0IL
         NEww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=RJ8p3k9l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd18138597si193779586d6.172.2024.12.26.00.28.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2024 00:28:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=RJ8p3k9l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tQjEc-0004j2-MT; Thu, 26 Dec 2024 03:28:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3uBNtZwgKCNUNL81FKJ87FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--wuhaotsh.bounces.google.com>)
 id 1tQjEa-0004VE-Fb
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 03:28:44 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3uBNtZwgKCNUNL81FKJ87FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--wuhaotsh.bounces.google.com>)
 id 1tQjEY-0001E9-JH
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 03:28:44 -0500
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-21638389f63so67589255ad.1
 for <qemu-arm@nongnu.org>; Thu, 26 Dec 2024 00:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1735201720; x=1735806520; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=dSh3O5WaaKwNo1iaUvTSpo+z9u0dQr4Ul55JCilzC1E=;
 b=RJ8p3k9ljx/jss4BYVaRohTDS1CjIRx6iOn4mKjcaDzVxNeGGp7zhq1Yjxrf3/4VST
 J30XnN11a/GsaBqZGjnnIkIq1fNbI5TTnD+wIP9Wpazqr8hWgM4AVddigxdDNYhfx81K
 EoUthbjyJEoiEIpwntbEsSXwok/tOvH+NnOpoGOpmQj2MfAVFMJeesoA8OIERtJZuEMX
 jZSfeOA18mbDoFqTDnNrwGRj3e7k+YEp2XqVMuH5s2h9eIG8s8+6fVGsk+/kIqOINan3
 vvkD8PgXEgu7jkXeqyo6QhmWAF/bhXbmbOR3HoHHn0Vkv6OdYHbwSlXVSn/BQiwgApCd
 6wLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735201720; x=1735806520;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dSh3O5WaaKwNo1iaUvTSpo+z9u0dQr4Ul55JCilzC1E=;
 b=Dei+EH0hFNUMShEWHhvfzMhPkQYNDdt8rnXwF1c7+J6BLIq635nGBcxquj6UsXwac2
 DBgACngGBmjanpj+LnxbaJIOJoSZIqOqi5ScSUZUZoyVkQxnt4Y5I3gxXoB2dFDMJoh2
 chlOfNTkA2zqeVNUBLXmKyoxfPySXbxph+3e8OGOvawzkCfR04UNHnPnPNy1U4QlNMvU
 AvsDRn2dUSsOwjxUwtMk2KsymCCM+02uCAOwgiszykniP4XYGrFs2fXIev8B/zbIak54
 2D3/RA6Wh/ENref0kVAtDUR26bHR8G1nJZaQPUDokYpGhRDMrZQCvBM0hyomzj2vZXnm
 qVxQ==
X-Gm-Message-State: AOJu0YyflOUAW/8QstQQKi1c6k+Zfck4LYm+vz7BvvKebhPP+g3nKkxK
 widVYO/3qBkyd9ZoNSRwet7X5azwiygoZj55oAV4dEkH95+njD1rORFgTnlsaJfO/mRQuq1gSBL
 uPfcoeje9Qw==
X-Received: from pgcs71.prod.google.com ([2002:a63:774a:0:b0:7ff:d6:4f07])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:4986:b0:1e1:b1bb:87a0 with SMTP id
 adf61e73a8af0-1e606dfe60fmr18479549637.34.1735201720267; 
 Thu, 26 Dec 2024 00:28:40 -0800 (PST)
Date: Thu, 26 Dec 2024 08:27:53 +0000
In-Reply-To: <20241226082800.2887689-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20241226082800.2887689-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226082800.2887689-11-wuhaotsh@google.com>
Subject: [PATCH v2 10/17] hw/misc: Support 8-bytes memop in NPCM GCR module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, mimik-dev@google.com, 
 hskinnemoen@google.com, venture@google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3uBNtZwgKCNUNL81FKJ87FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: ib/VV243YjAc

The NPCM8xx GCR device can be accessed with 64-bit memory operations.
This patch supports that.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/npcm_gcr.c   | 94 +++++++++++++++++++++++++++++++++-----------
 hw/misc/trace-events |  4 +-
 2 files changed, 74 insertions(+), 24 deletions(-)

diff --git a/hw/misc/npcm_gcr.c b/hw/misc/npcm_gcr.c
index a4c9643119..7dfdd3d74b 100644
--- a/hw/misc/npcm_gcr.c
+++ b/hw/misc/npcm_gcr.c
@@ -201,6 +201,7 @@ static uint64_t npcm_gcr_read(void *opaque, hwaddr offset, unsigned size)
     uint32_t reg = offset / sizeof(uint32_t);
     NPCMGCRState *s = opaque;
     NPCMGCRClass *c = NPCM_GCR_GET_CLASS(s);
+    uint64_t value;
 
     if (reg >= c->nr_regs) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -209,9 +210,21 @@ static uint64_t npcm_gcr_read(void *opaque, hwaddr offset, unsigned size)
         return 0;
     }
 
-    trace_npcm_gcr_read(offset, s->regs[reg]);
+    switch (size) {
+    case 4:
+        value = s->regs[reg];
+        break;
+
+    case 8:
+        value = s->regs[reg] + (((uint64_t)s->regs[reg + 1]) << 32);
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
 
-    return s->regs[reg];
+    trace_npcm_gcr_read(offset, value);
+    return value;
 }
 
 static void npcm_gcr_write(void *opaque, hwaddr offset,
@@ -231,29 +244,65 @@ static void npcm_gcr_write(void *opaque, hwaddr offset,
         return;
     }
 
-    switch (reg) {
-    case NPCM7XX_GCR_PDID:
-    case NPCM7XX_GCR_PWRON:
-    case NPCM7XX_GCR_INTSR:
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: register @ 0x%04" HWADDR_PRIx " is read-only\n",
-                      __func__, offset);
-        return;
-
-    case NPCM7XX_GCR_RESSR:
-    case NPCM7XX_GCR_CP2BST:
-        /* Write 1 to clear */
-        value = s->regs[reg] & ~value;
+    switch (size) {
+    case 4:
+        switch (reg) {
+        case NPCM7XX_GCR_PDID:
+        case NPCM7XX_GCR_PWRON:
+        case NPCM7XX_GCR_INTSR:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: register @ 0x%04" HWADDR_PRIx " is read-only\n",
+                          __func__, offset);
+            return;
+
+        case NPCM7XX_GCR_RESSR:
+        case NPCM7XX_GCR_CP2BST:
+            /* Write 1 to clear */
+            value = s->regs[reg] & ~value;
+            break;
+
+        case NPCM7XX_GCR_RLOCKR1:
+        case NPCM7XX_GCR_MDLR:
+            /* Write 1 to set */
+            value |= s->regs[reg];
+            break;
+        };
+        s->regs[reg] = value;
         break;
 
-    case NPCM7XX_GCR_RLOCKR1:
-    case NPCM7XX_GCR_MDLR:
-        /* Write 1 to set */
-        value |= s->regs[reg];
+    case 8:
+        s->regs[reg] = value;
+        s->regs[reg + 1] = v >> 32;
         break;
-    };
 
-    s->regs[reg] = value;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static bool npcm_gcr_check_mem_op(void *opaque, hwaddr offset,
+                                  unsigned size, bool is_write,
+                                  MemTxAttrs attrs)
+{
+    NPCMGCRClass *c = NPCM_GCR_GET_CLASS(opaque);
+
+    if (offset >= c->nr_regs * sizeof(uint32_t)) {
+        return false;
+    }
+
+    switch (size) {
+    case 4:
+        return true;
+    case 8:
+        if (offset >= NPCM8XX_GCR_SCRPAD_00 * sizeof(uint32_t) &&
+            offset < (NPCM8XX_GCR_NR_REGS - 1) * sizeof(uint32_t)) {
+            return true;
+        } else {
+            return false;
+        }
+    default:
+        return false;
+    }
 }
 
 static const struct MemoryRegionOps npcm_gcr_ops = {
@@ -262,7 +311,8 @@ static const struct MemoryRegionOps npcm_gcr_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid      = {
         .min_access_size        = 4,
-        .max_access_size        = 4,
+        .max_access_size        = 8,
+        .accepts                = npcm_gcr_check_mem_op,
         .unaligned              = false,
     },
 };
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index f2d498e862..59c2d4ecc0 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -135,8 +135,8 @@ npcm7xx_clk_read(uint64_t offset, uint32_t value) " offset: 0x%04" PRIx64 " valu
 npcm7xx_clk_write(uint64_t offset, uint32_t value) "offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
 
 # npcm_gcr.c
-npcm_gcr_read(uint64_t offset, uint32_t value) " offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
-npcm_gcr_write(uint64_t offset, uint32_t value) "offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
+npcm_gcr_read(uint64_t offset, uint64_t value) " offset: 0x%04" PRIx64 " value: 0x%08" PRIx64
+npcm_gcr_write(uint64_t offset, uint64_t value) "offset: 0x%04" PRIx64 " value: 0x%08" PRIx64
 
 # npcm7xx_mft.c
 npcm7xx_mft_read(const char *name, uint64_t offset, uint16_t value) "%s: offset: 0x%04" PRIx64 " value: 0x%04" PRIx16
-- 
2.47.1.613.gc27f4b7a9f-goog

