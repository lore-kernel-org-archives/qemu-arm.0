Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7537567njc;
        Tue, 12 Nov 2024 10:16:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXNup9HVmfJ78qzhy0npA1rdJqb7jJRyHn+2Ykg8buclaVJrwZMYbJQQb0OS5RWIkC5vMcETVJuW8Lcsw==@linaro.org
X-Google-Smtp-Source: AGHT+IFWLYW8jbJpD6SXVktbRizg6Wb3D4M9eqBBH8Aowz7L5Rl5Vx3vFOjt/mYPd2eXeCu+99Jm
X-Received: by 2002:a05:6122:3b07:b0:50d:4bd2:bc9b with SMTP id 71dfb90a1353d-513ffd6f2d8mr17400726e0c.0.1731435409669;
        Tue, 12 Nov 2024 10:16:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731435409; cv=none;
        d=google.com; s=arc-20240605;
        b=O8aBBWvLPAvx7Dy/W89YIbMUU1HUKP8eabLSdFBpNG97scLX3wT0yklMp1rYnaQDvO
         w9IDdctA7we9wWEvQLXcSqL6ehs7UFQGtDMn5DCft0PUzeRsvJ3//gjCJPq5valo19Wb
         VdZsblbWy83gtxUN9e1j9s5S9CCblwxHHF9JCYduE8vxx2bq2TvIrq/vSPFJylZ11bSJ
         SInYuRMM41iJiwd4OtJV/z/slgVS/A74LcFxWi0gYtDcXtuE0/UlLaWYfrFsFyhuV1+L
         4r6YOAyUK+aO+AU23BMiqJ4CS/zB81alXGzTsWquUTl6Xd4PYZSIrIQx7+dBpLrNBWWC
         Bk7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ohlThsqTDYJV0UUntSqhYfwl2qcDxuvkfJ3SWeMXrgc=;
        fh=qmVcbpKGT2NGruxhf8fgQHnlhHRaRjD5ibgD08FHYfA=;
        b=d7jmp8bVD/BHN4Y6XR2SvapTcSy0PI87z9R/6ZPNbPz4Iw5gNbxojtLxC41xM6bzdQ
         x4usTW27koRdAleIVPPtvOX48Z0RFp/8blFDkZnkIVHcbzrIT54Qav41MdpQe43EmXN1
         VlMEwWPBey/KnFa91q6ls0BXvJegVnWRc4LCQEhn1QWQSwwn1kh7pEAWJ42w3Dv+0nQh
         sPwsBmTPccGsqU91hC9x52R21alBFGCni0GpKCmnDTPx97XIO9sXPQW26e3yim51DHRE
         1bS/bo1czM7gtW9DlzCZNevX+ajq9iTULGKuLq4IJRAfQpybfGDGkMEe4MTdNfzsX3fA
         JQxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jsep8KWX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4aa9f02fd86si3913621137.244.2024.11.12.10.16.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 10:16:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jsep8KWX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tAvNG-00067N-TI; Tue, 12 Nov 2024 13:12:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvMz-0005VW-FB
 for qemu-devel@nongnu.org; Tue, 12 Nov 2024 13:12:07 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvMx-0001z4-Tf
 for qemu-devel@nongnu.org; Tue, 12 Nov 2024 13:12:05 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4315abed18aso51243825e9.2
 for <qemu-devel@nongnu.org>; Tue, 12 Nov 2024 10:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731435121; x=1732039921; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ohlThsqTDYJV0UUntSqhYfwl2qcDxuvkfJ3SWeMXrgc=;
 b=Jsep8KWXpTFO86G89uvfXeLygnFkwT6sGBjk/7zwky6uTn12iMidNt3iHS0D4zGvUe
 OOdrcdjX2TUCwNWNyZYHROmJiX1RW40iDEimL4IehIxNqSLozHuS/9kJduPGrboF/Rt5
 z1PQTr1Z6pyXP6vFyDbJWiR32EDrTlgc76m6gZ+lX+ApcuGPyg2gH4MSJ5y5IFLIh/cL
 kPyA/koFKi9WiC9sHcevLfzls5SJMxRxgsWlKNLX8W47hGwTnNCKco8B9c6STA5uePKj
 ZPwcA+FP30FOygWwLgO91qE2C2k/pu0kmRNNyGiJy/pxf8JCqXGLpru7C0vxw91s18oG
 p0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731435121; x=1732039921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ohlThsqTDYJV0UUntSqhYfwl2qcDxuvkfJ3SWeMXrgc=;
 b=j5Ydn3K7/ixAEcTMfO92Sp3kPa/rB7AMQWGNfX8jPKN8wI8wx68MKxN11k+WbvcMWL
 /ZyG6JxY7TfDnrUwd/euSamNOHpauyhPdSrei5n5mtl46tY+CrXlDAY87Jpno2IEyiFS
 AOyQo/vGavBIGcT09/u1FLJUWZg0/NPUCO3YXhsHf3kIf/Uy9zpC5vk+bHJlKab0Z+y7
 j1j984zfY+gcgCIPL3M+tISMtnoqIEe40bRnwBcxMiZBGEeeeQ1kfsRlbWQ8PibRafU8
 aBD8Nd+PdpIBDEVWqKKJqC3xMl4qSgRsggJ+jvUZW6apKwRF2aFpqviEgsYJCMw+KcZ0
 yP0Q==
X-Gm-Message-State: AOJu0YzswWnW3PH674CrQc1QP5pFbXQvnT0ABCiHcT6sPvmb72TEfihD
 O0S+F0nIB9t94Wa3Jt3msdAhYwF1DT+AVAlGmOcwIgcvJ7I1zbDLNxo4250ak8zNv0c6gaKFw0l
 P
X-Received: by 2002:a05:600c:4508:b0:431:50cb:2398 with SMTP id
 5b1f17b1804b1-432b74fecacmr145637225e9.2.1731435121585; 
 Tue, 12 Nov 2024 10:12:01 -0800 (PST)
Received: from localhost.localdomain
 (cnf78-h01-176-184-27-250.dsl.sta.abo.bbox.fr. [176.184.27.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa7378e9sm262755635e9.37.2024.11.12.10.11.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Nov 2024 10:12:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 12/20] hw/net/xilinx_ethlite: Access TX_GIE register for each
 port
Date: Tue, 12 Nov 2024 19:10:36 +0100
Message-ID: <20241112181044.92193-13-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112181044.92193-1-philmd@linaro.org>
References: <20241112181044.92193-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: dB+XIwyRFYY1

Rather than accessing the registers within the mixed RAM/MMIO
region as indexed register, declare a per-port TX_GIE. This
will help to map the RAM as RAM (keeping MMIO as MMIO) in few
commits.

Previous s->regs[R_TX_GIE0] and s->regs[R_TX_GIE1] are now
unused. Not a concern, this array will soon disappear.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/xilinx_ethlite.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 605451a522..4cb4781e70 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -62,6 +62,8 @@
 typedef struct XlnxXpsEthLitePort
 {
     struct {
+        uint32_t tx_gie;
+
         uint32_t rx_ctrl;
     } reg;
 } XlnxXpsEthLitePort;
@@ -90,7 +92,7 @@ struct XlnxXpsEthLite
 static inline void eth_pulse_irq(XlnxXpsEthLite *s)
 {
     /* Only the first gie reg is active.  */
-    if (s->regs[R_TX_GIE0] & GIE_GIE) {
+    if (s->port[0].reg.tx_gie & GIE_GIE) {
         qemu_irq_pulse(s->irq);
     }
 }
@@ -126,6 +128,9 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
     switch (addr)
     {
         case R_TX_GIE0:
+            r = s->port[port_index].reg.tx_gie;
+            break;
+
         case R_TX_LEN0:
         case R_TX_LEN1:
         case R_TX_CTRL1:
@@ -189,10 +194,13 @@ eth_write(void *opaque, hwaddr addr,
 
         case R_TX_LEN0:
         case R_TX_LEN1:
-        case R_TX_GIE0:
             s->regs[addr] = value;
             break;
 
+        case R_TX_GIE0:
+            s->port[port_index].reg.tx_gie = value;
+            break;
+
         default:
             s->regs[addr] = tswap32(value);
             break;
-- 
2.45.2

