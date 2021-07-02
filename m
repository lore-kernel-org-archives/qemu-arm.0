Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp1222981lfi;
        Fri, 2 Jul 2021 03:40:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiheG6NzWS0dThVabI35Cv+C+6nFUzJedi6/2Lj99U+MWgju2AX04XvN6i/j4hJoQrh5aF
X-Received: by 2002:a1f:194a:: with SMTP id 71mr4481185vkz.18.1625222448528;
        Fri, 02 Jul 2021 03:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625222448; cv=none;
        d=google.com; s=arc-20160816;
        b=itGyk1h5HlHL8aTGdgN1KCXeG8H3uwcyZxX45FKV+dH474d84UaAaOyu2rgAwYigmz
         MIhr09MjMnIMWtm7d1vDKSeiYb5jqHcF81VOFL3tYYj1jDJ11NL3+uUepAkZt8tNKx2M
         mYXWI32+XfhyP7boLi7wWyc3RpZuPLK5QZBOrCBpT+E7C6P6b7fMjXhAaMUNHk/oeyRJ
         UHwlx+sumewTHF2y3aL+dlA/vtpj8RBDm3Z53qRb0DuOj43w4UhLuv8PovAVsQtgTR1n
         VKhJR5SjNmFLlFlQTx4UFGPQ5I6eP4pkaNeIj6NygNP8iBz1pDBZkbEiGSF/H2S7W48X
         Mw0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=V8sS0Bb0e+XFKMXcd7X5sBnIKxL0C6ytZPnPqSvPiJU=;
        b=dPxuwzy4NZ/wZP3Hahop+a4w3o0I7tgqm3ih2zekXCim40BSMY0PSddz1v1l8O0hoO
         u0yDsoMyt8zCqtHLNbetZTvsq/u9pi1mzp76k0Ta5GNOgmx5jSURNBr51JnvNSvXVCg7
         Y+MlJWb7FDwuUpH551zpPxa4J6jyH/wnuH2LAchmf+kV8blOTISNZhjsfREZMpU5iOIi
         PooQ7zp09d5+3/bUw0PYuINzSZ5x7DkGgQCu3G+yT8XtqLAQG/JQxzq10ePRvu+hyNjZ
         D2vRN5hNF1K00Y/bw+lA4KTGXlE47j9s7roU48e32ak51Rwj5P4CHoMSKi82CFl5+hwb
         07Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CJU/ZSNy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p22si2336031vsm.257.2021.07.02.03.40.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jul 2021 03:40:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CJU/ZSNy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lzGbH-0004jI-Nt
	for alex.bennee@linaro.org; Fri, 02 Jul 2021 06:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGb0-0004gK-Gv
 for qemu-arm@nongnu.org; Fri, 02 Jul 2021 06:40:30 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGav-0006bD-8I
 for qemu-arm@nongnu.org; Fri, 02 Jul 2021 06:40:30 -0400
Received: by mail-wr1-x434.google.com with SMTP id l8so11846230wry.13
 for <qemu-arm@nongnu.org>; Fri, 02 Jul 2021 03:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V8sS0Bb0e+XFKMXcd7X5sBnIKxL0C6ytZPnPqSvPiJU=;
 b=CJU/ZSNyxabb0AWd/Kuic/rkOR/4dAGTEg2H5OmumG6WumJWQc4sdZHVrq/6sMLfM+
 Y1uePmtw6ATBU9Sq74NBGxTPpC5soFmnLxwfHOYGUDfG2LQlktYQ7WoXl4IhEagqI6JN
 HN6VwxtE2tAHAtsglKV2huQREXP5p8cGpsO2pmKvpdGctw5H3nvxFNrgCGDFvmCMPmQ+
 OtVPvNifRz07ms+6uznbxXtScOokxQZdcAn2HOesoMIMUftVdC8Azj4jvFgfmG542O9n
 SoVJtNlhxujWWPAtzDT0PN3K4c46mFWJRG15/6DeU0n1rWYyw/3Py+JmZtg9zvHW/7di
 BLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V8sS0Bb0e+XFKMXcd7X5sBnIKxL0C6ytZPnPqSvPiJU=;
 b=CkrOFZTcnX6TC0LAnHMBgtiO4Wrf3649TsUwtJPHsPLBBwXUnL/RU/8CtjZZKPPpa9
 PM0/28vCcdI+F53ZVW+42sOfZHyyX5SJ/usVtiQ1aRhnM/I26/+iIFG8huxOU2F9yIpS
 BHrov2j+02WOVGBoeTEatDI/iEb2zsfeUwfAdTrUZkL9R111cYjVZR7O7CGoSIhrbV7O
 IYJIpjUj894WHIuBofsNDc81wJRtGdpky+0a6Ln3gY3Cw7egjLrLwf+bsoBULdY5TR2X
 +e9XdcTwd7tboFyRdlGEsnllLwIyJPUgGKizNEq1J1WI1iV3/mYunAvK7WbU/p18RFXI
 S/eQ==
X-Gm-Message-State: AOAM531ftMRimMr4MbfPa3j3Gl6jVezUD060SZ3njd3sxaLZzWUaKtKr
 Kgwy72vXqtiSpn6dQbCKEt4QZR19mGppCD4a
X-Received: by 2002:adf:f10d:: with SMTP id r13mr5022432wro.59.1625222423805; 
 Fri, 02 Jul 2021 03:40:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm2745810wrs.52.2021.07.02.03.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:40:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 04/11] hw/gpio/pl061: Add tracepoints for register read and
 write
Date: Fri,  2 Jul 2021 11:40:11 +0100
Message-Id: <20210702104018.19881-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702104018.19881-1-peter.maydell@linaro.org>
References: <20210702104018.19881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: grWROjWNHpdV

Add tracepoints for reads and writes to the PL061 registers. This requires
restructuring pl061_read() to only return after the tracepoint, rather
than having lots of early-returns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/gpio/pl061.c      | 70 ++++++++++++++++++++++++++++++--------------
 hw/gpio/trace-events |  2 ++
 2 files changed, 50 insertions(+), 22 deletions(-)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 0f5d12e6d5a..f3b80c7776f 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -149,92 +149,116 @@ static uint64_t pl061_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
     PL061State *s = (PL061State *)opaque;
+    uint64_t r = 0;
 
     switch (offset) {
     case 0x0 ... 0x3fc: /* Data */
-        return s->data & (offset >> 2);
+        r = s->data & (offset >> 2);
+        break;
     case 0x400: /* Direction */
-        return s->dir;
+        r = s->dir;
+        break;
     case 0x404: /* Interrupt sense */
-        return s->isense;
+        r = s->isense;
+        break;
     case 0x408: /* Interrupt both edges */
-        return s->ibe;
+        r = s->ibe;
+        break;
     case 0x40c: /* Interrupt event */
-        return s->iev;
+        r = s->iev;
+        break;
     case 0x410: /* Interrupt mask */
-        return s->im;
+        r = s->im;
+        break;
     case 0x414: /* Raw interrupt status */
-        return s->istate;
+        r = s->istate;
+        break;
     case 0x418: /* Masked interrupt status */
-        return s->istate & s->im;
+        r = s->istate & s->im;
+        break;
     case 0x420: /* Alternate function select */
-        return s->afsel;
+        r = s->afsel;
+        break;
     case 0x500: /* 2mA drive */
         if (s->id != pl061_id_luminary) {
             goto bad_offset;
         }
-        return s->dr2r;
+        r = s->dr2r;
+        break;
     case 0x504: /* 4mA drive */
         if (s->id != pl061_id_luminary) {
             goto bad_offset;
         }
-        return s->dr4r;
+        r = s->dr4r;
+        break;
     case 0x508: /* 8mA drive */
         if (s->id != pl061_id_luminary) {
             goto bad_offset;
         }
-        return s->dr8r;
+        r = s->dr8r;
+        break;
     case 0x50c: /* Open drain */
         if (s->id != pl061_id_luminary) {
             goto bad_offset;
         }
-        return s->odr;
+        r = s->odr;
+        break;
     case 0x510: /* Pull-up */
         if (s->id != pl061_id_luminary) {
             goto bad_offset;
         }
-        return s->pur;
+        r = s->pur;
+        break;
     case 0x514: /* Pull-down */
         if (s->id != pl061_id_luminary) {
             goto bad_offset;
         }
-        return s->pdr;
+        r = s->pdr;
+        break;
     case 0x518: /* Slew rate control */
         if (s->id != pl061_id_luminary) {
             goto bad_offset;
         }
-        return s->slr;
+        r = s->slr;
+        break;
     case 0x51c: /* Digital enable */
         if (s->id != pl061_id_luminary) {
             goto bad_offset;
         }
-        return s->den;
+        r = s->den;
+        break;
     case 0x520: /* Lock */
         if (s->id != pl061_id_luminary) {
             goto bad_offset;
         }
-        return s->locked;
+        r = s->locked;
+        break;
     case 0x524: /* Commit */
         if (s->id != pl061_id_luminary) {
             goto bad_offset;
         }
-        return s->cr;
+        r = s->cr;
+        break;
     case 0x528: /* Analog mode select */
         if (s->id != pl061_id_luminary) {
             goto bad_offset;
         }
-        return s->amsel;
+        r = s->amsel;
+        break;
     case 0x52c ... 0xfcc: /* Reserved */
         goto bad_offset;
     case 0xfd0 ... 0xffc: /* ID registers */
-        return s->id[(offset - 0xfd0) >> 2];
+        r = s->id[(offset - 0xfd0) >> 2];
+        break;
     default:
     bad_offset:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "pl061_read: Bad offset %x\n", (int)offset);
         break;
     }
-    return 0;
+
+    trace_pl061_read(DEVICE(s)->canonical_path, offset, r);
+    return r;
 }
 
 static void pl061_write(void *opaque, hwaddr offset,
@@ -243,6 +267,8 @@ static void pl061_write(void *opaque, hwaddr offset,
     PL061State *s = (PL061State *)opaque;
     uint8_t mask;
 
+    trace_pl061_write(DEVICE(s)->canonical_path, offset, value);
+
     switch (offset) {
     case 0 ... 0x3fc:
         mask = (offset >> 2) & s->dir;
diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events
index 48ccbb183cc..442be9406f5 100644
--- a/hw/gpio/trace-events
+++ b/hw/gpio/trace-events
@@ -18,6 +18,8 @@ pl061_update(const char *id, uint32_t dir, uint32_t data) "%s GPIODIR 0x%x GPIOD
 pl061_set_output(const char *id, int gpio, int level) "%s setting output %d to %d"
 pl061_input_change(const char *id, int gpio, int level) "%s input %d changed to %d"
 pl061_update_istate(const char *id, uint32_t istate, uint32_t im, int level) "%s GPIORIS 0x%x GPIOIE 0x%x interrupt level %d"
+pl061_read(const char *id, uint64_t offset, uint64_t r) "%s offset 0x%" PRIx64 " value 0x%" PRIx64
+pl061_write(const char *id, uint64_t offset, uint64_t value) "%s offset 0x%" PRIx64 " value 0x%" PRIx64
 
 # sifive_gpio.c
 sifive_gpio_read(uint64_t offset, uint64_t r) "offset 0x%" PRIx64 " value 0x%" PRIx64
-- 
2.20.1

