Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3158485ejx;
        Mon, 7 Nov 2022 08:44:32 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7ejbB4vbQQ0RfqUU0YIOPi0sNKExoqS3viZeFDCoGvK/0TfEBYk5NNT91zheFapADcHmC/
X-Received: by 2002:a05:620a:bd4:b0:6ef:2e0:d8aa with SMTP id s20-20020a05620a0bd400b006ef02e0d8aamr36094217qki.615.1667839472306;
        Mon, 07 Nov 2022 08:44:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667839472; cv=none;
        d=google.com; s=arc-20160816;
        b=W5hSWVnE85ma4t6f7IG38H0Rp/gtpFZlny5D2IAQATO1r68aL0GVi1ILwouUnCD67x
         lzW4yDD9GzC+amhTQAPEiLvg4u7Xwr7O8XAg1QwXsGEzI/lORJT23cn6tunorF65XaBb
         EKYk/O1ihMTbOUguxZaufgqA117VRtVHMFQbGrzxTrBZIvq1gg4UG9AN6eapd+T9Bqwz
         DOeQzyc3qLLMSnXJQyeHhELn5xcApCCOltObuLoF1KqmWkGq8TYk2tX6u9qUEFQ2vVqX
         1fGaEpxAEWzFWoy4WHmaSgD9RH0nT0sH9H+TUI0QWABoUt2Ia++x64QQxXdlPOYX22wv
         WeFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=DH4NxpeEw4wfZhZ1V0YqpB2MkIFkbURI4e6YFDOHbG8=;
        b=qZtv7/nV5FDh1jzQyrkGqt/1jyqjE5ZjMk9sSjeq9PrE2vonaHI66vbkq+aEJ5VC1B
         hfcXnb1k8BdlFXSAR5kKYKTs8oc3yJOVe2QUbqwBOmT/JhCFukQC0AMTydwpuAwkdvRa
         fcpCv3jVmSaf527qLVc15HLGSSZT2t/PCr4psJDMOrsSLeXzM1aM1jxpeJTudtHQhGiv
         w/IwVOSsUA5rXKWpuco5uoyCilRFVUHI3M0RzNvjFsP6oZcAdabEqSHkdLu4vDXk7QnZ
         ZviOzbNjIvLt/9Uya70KERNurx/OHC83BSVAUluemFU6QdJ5Buf0se7gv0OPkL+s99Lv
         QflQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1-20020a05620a444100b006f9bc401e6dsi4919926qkp.70.2022.11.07.08.44.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Nov 2022 08:44:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os5Cn-0002Fq-Tv; Mon, 07 Nov 2022 11:42:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1os5CS-00027E-SO; Mon, 07 Nov 2022 11:42:18 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1os5CO-0005Jv-CA; Mon, 07 Nov 2022 11:42:16 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 5098A11F852;
 Mon,  7 Nov 2022 16:42:05 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Thu, 27 Oct 2022 15:09:58 +0200
Subject: [PATCH qemu.git v2 7/9] hw/timer/imx_epit: factor out register write
 handlers
Message-ID: <166783932395.3279.1096141058484230644-7@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166783932395.3279.1096141058484230644-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: ~axelheider <axelheider@gmx.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: o0oDTveiSUXe

From: Axel Heider <axel.heider@hensoldt.net>

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 211 ++++++++++++++++++++++++--------------------
 1 file changed, 115 insertions(+), 96 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index b0ef727efb..30280a9ac1 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -156,130 +156,149 @@ static void imx_epit_reload_compare_timer(IMXEPITStat=
e *s)
     }
 }
=20
-static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
-                           unsigned size)
+static void imx_epit_write_cr(IMXEPITState *s, uint32_t value)
 {
-    IMXEPITState *s =3D IMX_EPIT(opaque);
-    uint64_t freq =3D 0;
-    uint64_t oldcr;
-
-    DPRINTF("(%s, value =3D 0x%08x)\n", imx_epit_reg_name(offset >> 2),
-            (uint32_t)value);
+    uint32_t freq =3D 0;
+    uint32_t oldcr =3D s->cr;
=20
-    switch (offset >> 2) {
-    case 0: /* CR */
-
-        oldcr =3D s->cr;
-        /* SWR bit is never persisted, it clears itself once reset is done */
-        s->cr =3D (value & ~CR_SWR) & 0x03ffffff;
-        if (value & CR_SWR) {
-            /* handle the reset */
-            imx_epit_reset(DEVICE(s));
-            /*
-             * TODO: could we 'break' here? following operations appear
-             * to duplicate the work imx_epit_reset() already did.
-             */
-        }
-
-        ptimer_transaction_begin(s->timer_cmp);
-        ptimer_transaction_begin(s->timer_reload);
+    /* SWR bit is never persisted, it clears itself once reset is done */
+    s->cr =3D (value & ~CR_SWR) & 0x03ffffff;
=20
+    if (value & CR_SWR) {
+        /* handle the reset */
+        imx_epit_reset(DEVICE(s));
         /*
-         * Update the frequency. In case of a reset the input clock was
-         * switched off, so this can be skipped.
+         * TODO: could we 'break' here? following operations appear
+         * to duplicate the work imx_epit_reset() already did.
          */
-        if (!(value & CR_SWR)) {
-            freq =3D imx_epit_get_freq(s);
-            if (freq) {
-                ptimer_set_freq(s->timer_reload, freq);
-                ptimer_set_freq(s->timer_cmp, freq);
-            }
-        }
+    }
=20
-        if (freq && (s->cr & CR_EN) && !(oldcr & CR_EN)) {
-            if (s->cr & CR_ENMOD) {
-                if (s->cr & CR_RLD) {
-                    ptimer_set_limit(s->timer_reload, s->lr, 1);
-                    ptimer_set_limit(s->timer_cmp, s->lr, 1);
-                } else {
-                    ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
-                    ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
-                }
-            }
+    ptimer_transaction_begin(s->timer_cmp);
+    ptimer_transaction_begin(s->timer_reload);
=20
-            imx_epit_reload_compare_timer(s);
-            ptimer_run(s->timer_reload, 0);
-            if (s->cr & CR_OCIEN) {
-                ptimer_run(s->timer_cmp, 0);
+    /*
+     * Update the frequency. In case of a reset the input clock was
+     * switched off, so this can be skipped.
+     */
+    if (!(value & CR_SWR)) {
+        freq =3D imx_epit_get_freq(s);
+        if (freq) {
+            ptimer_set_freq(s->timer_reload, freq);
+            ptimer_set_freq(s->timer_cmp, freq);
+        }
+    }
+
+    if (freq && (s->cr & CR_EN) && !(oldcr & CR_EN)) {
+        if (s->cr & CR_ENMOD) {
+            if (s->cr & CR_RLD) {
+                ptimer_set_limit(s->timer_reload, s->lr, 1);
+                ptimer_set_limit(s->timer_cmp, s->lr, 1);
             } else {
-                ptimer_stop(s->timer_cmp);
-            }
-        } else if (!(s->cr & CR_EN)) {
-            /* stop both timers */
-            ptimer_stop(s->timer_reload);
-            ptimer_stop(s->timer_cmp);
-        } else  if (s->cr & CR_OCIEN) {
-            if (!(oldcr & CR_OCIEN)) {
-                imx_epit_reload_compare_timer(s);
-                ptimer_run(s->timer_cmp, 0);
+                ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
+                ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
             }
+        }
+
+        imx_epit_reload_compare_timer(s);
+        ptimer_run(s->timer_reload, 0);
+        if (s->cr & CR_OCIEN) {
+            ptimer_run(s->timer_cmp, 0);
         } else {
             ptimer_stop(s->timer_cmp);
         }
+    } else if (!(s->cr & CR_EN)) {
+        /* stop both timers */
+        ptimer_stop(s->timer_reload);
+        ptimer_stop(s->timer_cmp);
+    } else  if (s->cr & CR_OCIEN) {
+        if (!(oldcr & CR_OCIEN)) {
+            imx_epit_reload_compare_timer(s);
+            ptimer_run(s->timer_cmp, 0);
+        }
+    } else {
+        ptimer_stop(s->timer_cmp);
+    }
+
+    ptimer_transaction_commit(s->timer_cmp);
+    ptimer_transaction_commit(s->timer_reload);
+}
+
+static void imx_epit_write_sr(IMXEPITState *s, uint32_t value)
+{
+    /* writing 1 to OCIF clears the OCIF bit and the interrupt */
+    if (value & 0x01) {
+        s->sr =3D 0;
+        qemu_irq_lower(s->irq);
+    }
+}
+
+static void imx_epit_write_lr(IMXEPITState *s, uint32_t value)
+{
+    s->lr =3D value;
+
+    ptimer_transaction_begin(s->timer_cmp);
+    ptimer_transaction_begin(s->timer_reload);
+    if (s->cr & CR_RLD) {
+        /* Also set the limit if the LRD bit is set */
+        /* If IOVW bit is set then set the timer value */
+        ptimer_set_limit(s->timer_reload, s->lr, s->cr & CR_IOVW);
+        ptimer_set_limit(s->timer_cmp, s->lr, 0);
+    } else if (s->cr & CR_IOVW) {
+        /* If IOVW bit is set then set the timer value */
+        ptimer_set_count(s->timer_reload, s->lr);
+    }
+    /*
+     * Commit the change to s->timer_reload, so it can propagate. Otherwise
+     * the timer interrupt may not fire properly. The commit must happen
+     * before calling imx_epit_reload_compare_timer(), which reads
+     * s->timer_reload internally again.
+     */
+    ptimer_transaction_commit(s->timer_reload);
+    imx_epit_reload_compare_timer(s);
+    ptimer_transaction_commit(s->timer_cmp);
+}
+
+static void imx_epit_write_cmp(IMXEPITState *s, uint32_t value)
+{
+    s->cmp =3D value;
+
+    ptimer_transaction_begin(s->timer_cmp);
+    imx_epit_reload_compare_timer(s);
+    ptimer_transaction_commit(s->timer_cmp);
+}
+
+static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
+                           unsigned size)
+{
+    IMXEPITState *s =3D IMX_EPIT(opaque);
+
+    DPRINTF("(%s, value =3D 0x%08x)\n", imx_epit_reg_name(offset >> 2),
+            (uint32_t)value);
=20
-        ptimer_transaction_commit(s->timer_cmp);
-        ptimer_transaction_commit(s->timer_reload);
+    switch (offset >> 2) {
+    case 0: /* CR */
+        imx_epit_write_cr(s, (uint32_t)value);
         break;
=20
-    case 1: /* SR - ACK*/
-        /* writing 1 to OCIF clears the OCIF bit and the interrupt */
-        if (value & 0x01) {
-            s->sr =3D 0;
-            qemu_irq_lower(s->irq);
-        }
+    case 1: /* SR */
+        imx_epit_write_sr(s, (uint32_t)value);
         break;
=20
-    case 2: /* LR - set ticks */
-        s->lr =3D value;
-
-        ptimer_transaction_begin(s->timer_cmp);
-        ptimer_transaction_begin(s->timer_reload);
-        if (s->cr & CR_RLD) {
-            /* Also set the limit if the LRD bit is set */
-            /* If IOVW bit is set then set the timer value */
-            ptimer_set_limit(s->timer_reload, s->lr, s->cr & CR_IOVW);
-            ptimer_set_limit(s->timer_cmp, s->lr, 0);
-        } else if (s->cr & CR_IOVW) {
-            /* If IOVW bit is set then set the timer value */
-            ptimer_set_count(s->timer_reload, s->lr);
-        }
-        /*
-         * Commit the change to s->timer_reload, so it can propagate. Otherw=
ise
-         * the timer interrupt may not fire properly. The commit must happen
-         * before calling imx_epit_reload_compare_timer(), which reads
-         * s->timer_reload internally again.
-         */
-        ptimer_transaction_commit(s->timer_reload);
-        imx_epit_reload_compare_timer(s);
-        ptimer_transaction_commit(s->timer_cmp);
+    case 2: /* LR */
+        imx_epit_write_lr(s, (uint32_t)value);
         break;
=20
     case 3: /* CMP */
-        s->cmp =3D value;
-
-        ptimer_transaction_begin(s->timer_cmp);
-        imx_epit_reload_compare_timer(s);
-        ptimer_transaction_commit(s->timer_cmp);
-
+        imx_epit_write_cmp(s, (uint32_t)value);
         break;
=20
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad register at offset 0x%"
                       HWADDR_PRIx "\n", TYPE_IMX_EPIT, __func__, offset);
-
         break;
     }
 }
+
 static void imx_epit_cmp(void *opaque)
 {
     IMXEPITState *s =3D IMX_EPIT(opaque);
--=20
2.34.5

