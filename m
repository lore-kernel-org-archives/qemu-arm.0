Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp1223256lfi;
        Fri, 2 Jul 2021 03:41:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxECB12MaYOxaErrM2y8kl6L3aWsyvdMjY7Cg7q27/9RPPmD4CW1ugfqsHwN/McMAR16Aa6
X-Received: by 2002:a67:fd78:: with SMTP id h24mr5168708vsa.20.1625222476056;
        Fri, 02 Jul 2021 03:41:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625222476; cv=none;
        d=google.com; s=arc-20160816;
        b=wCAJDLox9MhMieo6VAnS9dZ35cVJWSk+0GxbZ/9wX48lLz6Jlo4NMAjhwAL7j5FMep
         aew+21frCPRnhFQJO7e5702Xq0IKwtIhKWdtIbtmXFCHWhtOayuF2avnNfkqJw4k1khN
         QBHryj2pCYziQZIKQroI7SWUgenwxDIywbamDT2P8GHLYbJdISjpbsmJJVKOR610T7gG
         D9PTQyHbN9xqno1RD/77r7GPUzOVnFvVa2N8jz3t68QA2rgKeEjLixkza81Gj4gfxK81
         Esk0OfSjzgk6zwzfqSqPGRgt4X1Og/TpKbKnwjHhYv8Wz3aujtFcdcLmydQJXJwXdQRc
         O/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yLZPF7xM8ZCBR3B2tWpuKNDyEXma9ARshxBKe1boF+8=;
        b=cYiMt/knJgnDdQuvFin7gDUN6g7vXbLfLKPES/dIxffBd72PEQqYPEUTbbJq5R3awC
         BsyXpNkGfY/q7vl8MfjSaAnDp368fcQmGcF6B1g5LMz3cqQtGcc4KZR3YvG4qPXVuik3
         QEvoM/L/2EP9o5xcllis0iHnvhdyZQwmGXRXYzXFYpzqQREMBJ4bU6X1UqOkOBBk50mO
         IzbRF321gKYik92khdw3x9g3VwxBa28LKRG18+KX1hMZmNQbz/mTqDXjzZm3nyubu8OB
         CDBY+9aO42NYXP+yu9Z5frutf5kpi2C+bjwuKh7tCksbeuaxsuq1sF8SBmvvxTPTRLYQ
         AGaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aoeaECMl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9si1423480vkk.72.2021.07.02.03.41.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jul 2021 03:41:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aoeaECMl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lzGbj-0005YG-9M
	for alex.bennee@linaro.org; Fri, 02 Jul 2021 06:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGaz-0004ey-Fu
 for qemu-arm@nongnu.org; Fri, 02 Jul 2021 06:40:29 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGau-0006Zp-7C
 for qemu-arm@nongnu.org; Fri, 02 Jul 2021 06:40:29 -0400
Received: by mail-wm1-x331.google.com with SMTP id g10so528677wmh.2
 for <qemu-arm@nongnu.org>; Fri, 02 Jul 2021 03:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yLZPF7xM8ZCBR3B2tWpuKNDyEXma9ARshxBKe1boF+8=;
 b=aoeaECMlWLk9zvfstylw19ZTyNYpc6fGOL9SrnV1oJxq3vWxUL5QXM17Hzw6Ut8kFn
 M8h13oqd0UmqyuT0L8ZCJVlW2gRUEBkxautyGUi4i/SepRYl3wNth/G8YjToWSr9I6eu
 lQXdEZ2mQoZO31E2/TA/4C1griKwZr2gbJ/3G5QymrUF6bOT8C2NdqEys3V6LL9wtzDB
 fx4SNqRsTQPNdvXk3O5COaOU5c64EuT999LRiOn8ZHiF4dANbTupu8Gs3l3Wls47xxt3
 mKkDf50dQHvGSNePb7C6e3EZrFkkV2pR1RBKwn5ug+kPIa2F6O8QoaAsRPd0d3zbmncK
 /YcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yLZPF7xM8ZCBR3B2tWpuKNDyEXma9ARshxBKe1boF+8=;
 b=SthP/TqC7qIaoT/cX2H5x1+QfvcrhFgkJNSy67ujtH7C6joyyzfI0R5S5wUs930HD/
 TGntNRtR+pypTwf4I9GNq0stX1moMHTUtlf1mXi+Ho1I81QkNxY8ooohTqLsoo3VCQr2
 V1ZybiGRSXlSignECXvbq4gDK1QmIR1YFK1LJHZPUT4C7HVi3XQR4Xop13TOvFYl4mDF
 RiMfhMuOoYiVUfvHtgiyhIC659yxVkFYccebN+tYV1xnERDJ5C345k0qD1jJNG0DheuY
 ph9S1LLsAJrV8R3h+iAV8rOAEHJrx80+207XG+hLDiSA+IichQUtPJ4JB/lOUccrpeSN
 Batw==
X-Gm-Message-State: AOAM532upT2dVhJ87FMeskKilVWFHX4O/gu46/V7/0TKZuo7euyDFYUW
 qrWiSrOQccD1ye4EjFYbWMK7ozONpxnamFXm
X-Received: by 2002:a7b:c4ca:: with SMTP id g10mr15932042wmk.148.1625222423019; 
 Fri, 02 Jul 2021 03:40:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm2745810wrs.52.2021.07.02.03.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:40:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/11] hw/gpio/pl061: Clean up read/write offset handling logic
Date: Fri,  2 Jul 2021 11:40:10 +0100
Message-Id: <20210702104018.19881-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702104018.19881-1-peter.maydell@linaro.org>
References: <20210702104018.19881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: xFfRl8m+mARv

Currently the pl061_read() and pl061_write() functions handle offsets
using a combination of three if() statements and a switch().  Clean
this up to use just a switch, using case ranges.

This requires that instead of catching accesses to the luminary-only
registers on a stock PL061 via a check on s->rsvd_start we use
an "is this luminary?" check in the cases for each luminary-only
register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/gpio/pl061.c | 106 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 81 insertions(+), 25 deletions(-)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index a6ace88895d..0f5d12e6d5a 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -55,7 +55,6 @@ struct PL061State {
     qemu_irq irq;
     qemu_irq out[N_GPIOS];
     const unsigned char *id;
-    uint32_t rsvd_start; /* reserved area: [rsvd_start, 0xfcc] */
 };
 
 static const VMStateDescription vmstate_pl061 = {
@@ -151,16 +150,9 @@ static uint64_t pl061_read(void *opaque, hwaddr offset,
 {
     PL061State *s = (PL061State *)opaque;
 
-    if (offset < 0x400) {
-        return s->data & (offset >> 2);
-    }
-    if (offset >= s->rsvd_start && offset <= 0xfcc) {
-        goto err_out;
-    }
-    if (offset >= 0xfd0 && offset < 0x1000) {
-        return s->id[(offset - 0xfd0) >> 2];
-    }
     switch (offset) {
+    case 0x0 ... 0x3fc: /* Data */
+        return s->data & (offset >> 2);
     case 0x400: /* Direction */
         return s->dir;
     case 0x404: /* Interrupt sense */
@@ -178,33 +170,70 @@ static uint64_t pl061_read(void *opaque, hwaddr offset,
     case 0x420: /* Alternate function select */
         return s->afsel;
     case 0x500: /* 2mA drive */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         return s->dr2r;
     case 0x504: /* 4mA drive */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         return s->dr4r;
     case 0x508: /* 8mA drive */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         return s->dr8r;
     case 0x50c: /* Open drain */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         return s->odr;
     case 0x510: /* Pull-up */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         return s->pur;
     case 0x514: /* Pull-down */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         return s->pdr;
     case 0x518: /* Slew rate control */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         return s->slr;
     case 0x51c: /* Digital enable */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         return s->den;
     case 0x520: /* Lock */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         return s->locked;
     case 0x524: /* Commit */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         return s->cr;
     case 0x528: /* Analog mode select */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         return s->amsel;
+    case 0x52c ... 0xfcc: /* Reserved */
+        goto bad_offset;
+    case 0xfd0 ... 0xffc: /* ID registers */
+        return s->id[(offset - 0xfd0) >> 2];
     default:
+    bad_offset:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "pl061_read: Bad offset %x\n", (int)offset);
         break;
     }
-err_out:
-    qemu_log_mask(LOG_GUEST_ERROR,
-                  "pl061_read: Bad offset %x\n", (int)offset);
     return 0;
 }
 
@@ -214,16 +243,12 @@ static void pl061_write(void *opaque, hwaddr offset,
     PL061State *s = (PL061State *)opaque;
     uint8_t mask;
 
-    if (offset < 0x400) {
+    switch (offset) {
+    case 0 ... 0x3fc:
         mask = (offset >> 2) & s->dir;
         s->data = (s->data & ~mask) | (value & mask);
         pl061_update(s);
         return;
-    }
-    if (offset >= s->rsvd_start) {
-        goto err_out;
-    }
-    switch (offset) {
     case 0x400: /* Direction */
         s->dir = value & 0xff;
         break;
@@ -247,47 +272,80 @@ static void pl061_write(void *opaque, hwaddr offset,
         s->afsel = (s->afsel & ~mask) | (value & mask);
         break;
     case 0x500: /* 2mA drive */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         s->dr2r = value & 0xff;
         break;
     case 0x504: /* 4mA drive */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         s->dr4r = value & 0xff;
         break;
     case 0x508: /* 8mA drive */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         s->dr8r = value & 0xff;
         break;
     case 0x50c: /* Open drain */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         s->odr = value & 0xff;
         break;
     case 0x510: /* Pull-up */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         s->pur = value & 0xff;
         break;
     case 0x514: /* Pull-down */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         s->pdr = value & 0xff;
         break;
     case 0x518: /* Slew rate control */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         s->slr = value & 0xff;
         break;
     case 0x51c: /* Digital enable */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         s->den = value & 0xff;
         break;
     case 0x520: /* Lock */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         s->locked = (value != 0xacce551);
         break;
     case 0x524: /* Commit */
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         if (!s->locked)
             s->cr = value & 0xff;
         break;
     case 0x528:
+        if (s->id != pl061_id_luminary) {
+            goto bad_offset;
+        }
         s->amsel = value & 0xff;
         break;
     default:
-        goto err_out;
+    bad_offset:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "pl061_write: Bad offset %x\n", (int)offset);
+        return;
     }
     pl061_update(s);
     return;
-err_out:
-    qemu_log_mask(LOG_GUEST_ERROR,
-                  "pl061_write: Bad offset %x\n", (int)offset);
 }
 
 static void pl061_reset(DeviceState *dev)
@@ -343,7 +401,6 @@ static void pl061_luminary_init(Object *obj)
     PL061State *s = PL061(obj);
 
     s->id = pl061_id_luminary;
-    s->rsvd_start = 0x52c;
 }
 
 static void pl061_init(Object *obj)
@@ -353,7 +410,6 @@ static void pl061_init(Object *obj)
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     s->id = pl061_id;
-    s->rsvd_start = 0x424;
 
     memory_region_init_io(&s->iomem, obj, &pl061_ops, s, "pl061", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
-- 
2.20.1

