Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3157889ejx;
        Mon, 7 Nov 2022 08:43:33 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6ZESbnN5tCH+72DbsvCQAtfOaz9K9vbagFpzVYjfwkIuPbY5Q3yQvMLv9s2nEOIX3yC3z2
X-Received: by 2002:a05:6214:2625:b0:4bb:fa37:86a with SMTP id gv5-20020a056214262500b004bbfa37086amr37628046qvb.19.1667839413234;
        Mon, 07 Nov 2022 08:43:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667839413; cv=none;
        d=google.com; s=arc-20160816;
        b=wpO9pAr46taFHAxfWHhEcvG2OfQStDZNhIgO6EICr3v5gcc2FNlQKuUDUySce/Felv
         DdVWEGxYnmvY301e870EzWsX01lgjgmXLEKcQBuUbuivGxpG/C3yn7aQKEC7ETCLOeUv
         qGRRWj2U+4sVFb3Ijvh/TAcvw7ZSf1Xsmjx7clkGlznMzZ8MfRwPf0meS2R1T1iSle6R
         M3pwkoOAggJtoWEWxsRjnlPJ6kv6evG7zNCx/099ZLlYeh5zAGEulzMhNkEaIny6gXKA
         hqSloj12J9PgWYJEWirmAdZP5h6QtdbFEXC2Mzl3fZYYtR5tBmX3aZ/WRbfGbGEGXwEN
         m3QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=HERH1/PZO2FaRaECavGaNrMVV3tOuS05fOG6prnDIXs=;
        b=EZTapS6cw6UMhkCAj+8kILlNfEYBPjPPyJoB5duCgV0WTkBHUXSCCmnMIXTy6inxwZ
         cyGJJppXkBmiiuuBVduh//Qq0Z0+j9Mn2rOVDXrgSD4V1lUlfUrBGGXg2ss/NeV08+mD
         Qz46HC7Wn3RS+v3piQzYniYOlU56risvGoO8TclKy//YDXuuAW2ZvQCFQ+FHU0EBmdz4
         J4TLjqM8hFcOywlLBEE3dnk1cmp5vEmh711IAx2ChO5koJkMnrmClaXDX5anS6vgnog6
         YxIQsemLHmiYV0avet2Oa+bRv9m2syzTjbxWSWddZ1vl3IvvrVdbdTpT0g04CDCcVYVd
         YLsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fo8-20020ad45f08000000b004bc0d3a748esi4843655qvb.449.2022.11.07.08.43.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Nov 2022 08:43:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os5Ch-0002Ck-Es; Mon, 07 Nov 2022 11:42:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1os5CS-00026w-Jr; Mon, 07 Nov 2022 11:42:18 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1os5CO-0005Jw-C1; Mon, 07 Nov 2022 11:42:15 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 8DBE511F853;
 Mon,  7 Nov 2022 16:42:05 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Fri, 04 Nov 2022 16:01:28 +0100
Subject: [PATCH qemu.git v2 8/9] hw/timer/imx_epit: change reset handling
Message-ID: <166783932395.3279.1096141058484230644-8@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166783932395.3279.1096141058484230644-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: a7FK7tM/C71q

From: Axel Heider <axel.heider@hensoldt.net>

- inline software reset
- make hardware reset invoke software reset
- simplify code flow

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 66 ++++++++++++++++-----------------------------
 1 file changed, 23 insertions(+), 43 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 30280a9ac1..77bd2b0a2b 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -73,35 +73,6 @@ static uint32_t imx_epit_get_freq(IMXEPITState *s)
     return freq;
 }
=20
-static void imx_epit_reset(DeviceState *dev)
-{
-    IMXEPITState *s =3D IMX_EPIT(dev);
-
-    /* Soft reset doesn't touch some bits; hard reset clears them */
-    s->cr &=3D (CR_EN|CR_ENMOD|CR_STOPEN|CR_DOZEN|CR_WAITEN|CR_DBGEN);
-    s->sr =3D 0;
-    s->lr =3D EPIT_TIMER_MAX;
-    s->cmp =3D 0;
-    /* clear the interrupt */
-    qemu_irq_lower(s->irq);
-
-    ptimer_transaction_begin(s->timer_cmp);
-    ptimer_transaction_begin(s->timer_reload);
-
-    /*
-     * The reset switches off the input clock, so even if the CR.EN is still
-     * set, the timers are no longer running.
-     */
-    assert(0 =3D=3D imx_epit_get_freq(s));
-    ptimer_stop(s->timer_cmp);
-    ptimer_stop(s->timer_reload);
-    /* init both timers to EPIT_TIMER_MAX */
-    ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
-    ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
-    ptimer_transaction_commit(s->timer_cmp);
-    ptimer_transaction_commit(s->timer_reload);
-}
-
 static uint64_t imx_epit_read(void *opaque, hwaddr offset, unsigned size)
 {
     IMXEPITState *s =3D IMX_EPIT(opaque);
@@ -164,23 +135,23 @@ static void imx_epit_write_cr(IMXEPITState *s, uint32_t=
 value)
     /* SWR bit is never persisted, it clears itself once reset is done */
     s->cr =3D (value & ~CR_SWR) & 0x03ffffff;
=20
-    if (value & CR_SWR) {
-        /* handle the reset */
-        imx_epit_reset(DEVICE(s));
-        /*
-         * TODO: could we 'break' here? following operations appear
-         * to duplicate the work imx_epit_reset() already did.
-         */
-    }
-
     ptimer_transaction_begin(s->timer_cmp);
     ptimer_transaction_begin(s->timer_reload);
=20
-    /*
-     * Update the frequency. In case of a reset the input clock was
-     * switched off, so this can be skipped.
-     */
-    if (!(value & CR_SWR)) {
+    if (value & CR_SWR) {
+        /* Soft reset doesn't touch some bits; only a hard reset clears them=
 */
+        s->cr &=3D (CR_EN|CR_ENMOD|CR_STOPEN|CR_DOZEN|CR_WAITEN|CR_DBGEN);
+        s->sr =3D 0;
+        s->lr =3D EPIT_TIMER_MAX;
+        s->cmp =3D 0;
+        /* reset is supposed to disable the input clock */
+        assert(0 =3D=3D imx_epit_get_freq(s));
+        /* turn interrupt off since SR and the OCIEN bit got cleared */
+        qemu_irq_lower(s->irq);
+        /* reset timer limits, set timer values to these limits */
+        ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
+        ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
+    } else {
         freq =3D imx_epit_get_freq(s);
         if (freq) {
             ptimer_set_freq(s->timer_reload, freq);
@@ -369,6 +340,15 @@ static void imx_epit_realize(DeviceState *dev, Error **e=
rrp)
     s->timer_cmp =3D ptimer_init(imx_epit_cmp, s, PTIMER_POLICY_LEGACY);
 }
=20
+static void imx_epit_reset(DeviceState *dev)
+{
+    IMXEPITState *s =3D IMX_EPIT(dev);
+
+    /* initialize CR and perform a software reset */
+    s->cr =3D 0;
+    imx_epit_write_cr(s, CR_SWR);
+}
+
 static void imx_epit_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc  =3D DEVICE_CLASS(klass);
--=20
2.34.5

