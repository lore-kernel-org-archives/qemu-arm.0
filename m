Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp532257ejx;
        Thu, 1 Dec 2022 07:44:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf482pSmeZ3l/+yMAv9wIITVMFK7PL0n861VZJn68nPmWhc0po6qkExOu49c6mgbYNXjKNb5
X-Received: by 2002:a05:622a:5c8e:b0:3a5:5c9e:d453 with SMTP id ge14-20020a05622a5c8e00b003a55c9ed453mr63504975qtb.403.1669909469618;
        Thu, 01 Dec 2022 07:44:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669909469; cv=none;
        d=google.com; s=arc-20160816;
        b=ypKcgR5d25sCHnEBhkIDfoyIunwR4ygkH4TDhAacwG8ePS8LrYvqZBQuOipNl8YeQ+
         Z2CgNWUgYtN4ioAXsXq7iFhZsCzwPgj++AJKBku034uMmp04QhRcdnpOMNIHWUGYMJXO
         eJtT/4Ge19fscOw3vKFzisiYXmc37R1sWjjKxS2/PiTaxdzKxHHy4DIXrvA21F2RipZb
         8dSCi7foFIkh5uF59MgucaGGz1HumbVa8ih2HEmoqCvG8VABc+rV8S/ImqgitsrXNwJZ
         BM9wIU1s/pIUMEjfuQHL8R3tk553VBL6KmNWZO5NBaHotUR3R1UgKDZkoy5y0+Gz/o0s
         9MbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=lLJvZQEhR26pEpVTu0hkoPcVBCXs2XS9w8QGVD1gLQU=;
        b=Ebi/6odV4UiDplllXC81dtHEZZCPNHtN/vn4SJZx9H/e6wf32PpT/a40i6djlPeuDF
         29uMrQpswenvE7f0YINI+kRIOYvtOky7jZC7zmervWuntYjJrwbU230/EPmFg88Ei3dZ
         uAt9Q4FzojEUT6m4TCJqE6aC86tjD2Q/goacFgZFX/1CkkkgtRxyl31Y8uKn6HOtsFkV
         kuE0fZCIVXsw6XH5ET5WIAsFUTWKG8gnROy0rWIdrpvLSihXRx9+junk0BDpLqRTvzmU
         2GgxcJv16GYicaKE2+Ij0JTWVeStQMx+V3twka1nfNshQ+t35l9Fl/znQ06ncivQRiks
         J6TA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de11-20020a05620a370b00b006eb8260e7f2si2453302qkb.300.2022.12.01.07.44.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Dec 2022 07:44:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0lhV-0005Jc-6m; Thu, 01 Dec 2022 10:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhO-0005GK-V7; Thu, 01 Dec 2022 10:42:07 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhM-0004wk-UW; Thu, 01 Dec 2022 10:42:06 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id AA96E11F9A1;
 Thu,  1 Dec 2022 15:42:01 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Thu, 27 Oct 2022 15:09:58 +0200
Subject: [PATCH qemu.git v3 6/8] hw/timer/imx_epit: factor out register write
 handlers
Message-ID: <166990932074.29941.8709118178538288040-6@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166990932074.29941.8709118178538288040-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
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
X-TUID: eLaAVMnY5Qwi

From: Axel Heider <axel.heider@hensoldt.net>

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 207 ++++++++++++++++++++++++--------------------
 1 file changed, 113 insertions(+), 94 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 39f47222d0..e04427542f 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -191,129 +191,148 @@ static void imx_epit_reload_compare_timer(IMXEPITStat=
e *s)
     }
 }
=20
-static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
-                           unsigned size)
+static void imx_epit_write_cr(IMXEPITState *s, uint32_t value)
 {
-    IMXEPITState *s =3D IMX_EPIT(opaque);
-    uint64_t oldcr;
-
-    DPRINTF("(%s, value =3D 0x%08x)\n", imx_epit_reg_name(offset >> 2),
-            (uint32_t)value);
+    uint32_t oldcr =3D s->cr;
=20
-    switch (offset >> 2) {
-    case 0: /* CR */
-
-        oldcr =3D s->cr;
-        s->cr =3D value & 0x03ffffff;
-        if (s->cr & CR_SWR) {
-            /* handle the reset */
-            imx_epit_reset(s, false);
-        }
+    s->cr =3D value & 0x03ffffff;
=20
-        /*
-         * The interrupt state can change due to:
-         * - reset clears both SR.OCIF and CR.OCIE
-         * - write to CR.EN or CR.OCIE
-         */
-        imx_epit_update_int(s);
+    if (s->cr & CR_SWR) {
+        /* handle the reset */
+        imx_epit_reset(s, false);
+    }
=20
-        /*
-         * TODO: could we 'break' here for reset? following operations appear
-         * to duplicate the work imx_epit_reset() already did.
-         */
+    /*
+     * The interrupt state can change due to:
+     * - reset clears both SR.OCIF and CR.OCIE
+     * - write to CR.EN or CR.OCIE
+     */
+    imx_epit_update_int(s);
=20
-        ptimer_transaction_begin(s->timer_cmp);
-        ptimer_transaction_begin(s->timer_reload);
+    /*
+     * TODO: could we 'break' here for reset? following operations appear
+     * to duplicate the work imx_epit_reset() already did.
+     */
=20
-        /* Update the frequency. Has been done already in case of a reset. */
-        if (!(s->cr & CR_SWR)) {
-            imx_epit_set_freq(s);
-        }
+    ptimer_transaction_begin(s->timer_cmp);
+    ptimer_transaction_begin(s->timer_reload);
=20
-        if (s->freq && (s->cr & CR_EN) && !(oldcr & CR_EN)) {
-            if (s->cr & CR_ENMOD) {
-                if (s->cr & CR_RLD) {
-                    ptimer_set_limit(s->timer_reload, s->lr, 1);
-                    ptimer_set_limit(s->timer_cmp, s->lr, 1);
-                } else {
-                    ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
-                    ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
-                }
-            }
+    /* Update the frequency. Has been done already in case of a reset. */
+    if (!(s->cr & CR_SWR)) {
+        imx_epit_set_freq(s);
+    }
=20
-            imx_epit_reload_compare_timer(s);
-            ptimer_run(s->timer_reload, 0);
-            if (s->cr & CR_OCIEN) {
-                ptimer_run(s->timer_cmp, 0);
+    if (s->freq && (s->cr & CR_EN) && !(oldcr & CR_EN)) {
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
=20
-        ptimer_transaction_commit(s->timer_cmp);
-        ptimer_transaction_commit(s->timer_reload);
+    ptimer_transaction_commit(s->timer_cmp);
+    ptimer_transaction_commit(s->timer_reload);
+}
+
+static void imx_epit_write_sr(IMXEPITState *s, uint32_t value)
+{
+    /* writing 1 to SR.OCIF clears this bit and turns the interrupt off */
+    if (value & SR_OCIF) {
+        s->sr =3D 0; /* SR.OCIF is the only bit in this register anyway */
+        imx_epit_update_int(s);
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
+
+    switch (offset >> 2) {
+    case 0: /* CR */
+        imx_epit_write_cr(s, (uint32_t)value);
         break;
=20
-    case 1: /* SR - ACK*/
-        /* writing 1 to SR.OCIF clears this bit and turns the interrupt off =
*/
-        if (value & SR_OCIF) {
-            s->sr =3D 0; /* SR.OCIF is the only bit in this register anyway =
*/
-            imx_epit_update_int(s);
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

