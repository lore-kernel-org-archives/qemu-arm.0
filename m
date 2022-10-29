Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp614025ejc;
        Sun, 30 Oct 2022 19:17:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7hlk3HLDQbKaya+qgoeMqwO8M8u+JFQMPpQKNW0MkUSwEF7KFHzW4LxJsNJkGNmJ4Sui/h
X-Received: by 2002:a05:622a:11d0:b0:39d:322:7c38 with SMTP id n16-20020a05622a11d000b0039d03227c38mr8783796qtk.291.1667182629855;
        Sun, 30 Oct 2022 19:17:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667182629; cv=none;
        d=google.com; s=arc-20160816;
        b=I144YiTRPsT//mr+j0+c5sODPb492T0mr26LQRneG4pYfcLtTscY2ZT5Sv6tVvi2w7
         xJTvHUCnQJLyqF3rYpvLlaD4mVyHXYiMi73bTe0XZAVdZohFbsKL9IdAHjy6Q4gmqizp
         5uO5Jfn0lwSHXXeGgkVFm2vp+VXR2q/cEn1CBvhfhwfO9D20grx2DatMGEanHnGgQ8BF
         eyOETZiNe66kPy4NpS/ZbiR7VmhIIobqQqkdg0Px/sLNRC/QIcbTnQ40WtaoCOTF/b6I
         Gwe06sH7Hp0hBeGm3R+2uxF7zxGTpBnTAlb6A+EjEWa7yiEooYs2PEEHqhAHDrC9/TeA
         bEZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=vCHeTneer5ApC87oxDkv7vV1kaiBVgfcHyJENWDaA3k=;
        b=fKFxE+0MV0yAmFPLNdYHQ1J1x6QnTTeOp410NGiyelSHRuYJMsAbI7Uyg/tRiS7t6B
         Rf2mj6PZs3T9bu1Jys4jLfqDLAgsOfM80r2VCwWY/EUIAw9k0ipYXlJv3m811HTmoH+e
         hwK9E7de2oiRyaQYjK/rWgEqpnmNZSzzqaPIklX9MTsHduuCJCyoHxNcbKjqVZjlDvU6
         kQXJevG62pzJI7Jep0inCpR9NJQOekoq56r0h+PBMqWdUXkta4TxKoYfAnNNqthLLttN
         krTCBX/wiwxMp93oCmmCSam5/wmhN8/gU4JayQ7YNFNvrutyYolH9qo0nZrcIbrcUfyF
         g8lg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4-20020a05620a298400b006bb2140edebsi3426158qkp.240.2022.10.30.19.17.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Oct 2022 19:17:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opKLF-0001Av-80; Sun, 30 Oct 2022 22:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKL9-00015t-7a; Sun, 30 Oct 2022 22:15:51 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKL7-00035y-OF; Sun, 30 Oct 2022 22:15:51 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id B0CCD11F294;
 Mon, 31 Oct 2022 02:15:46 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Sat, 29 Oct 2022 18:41:08 +0200
Subject: [PATCH qemu.git 08/11] hw/timer/imx_epit: simplify CR.ENMOD handling
Message-ID: <166718254546.5893.5075929684621857903-8@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166718254546.5893.5075929684621857903-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: ~axelheider <axelheider@gmx.de>
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +OhyunCYzUf1

From: Axel Heider <axel.heider@hensoldt.net>

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index bba9c87cd4..5915d4b3d4 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -198,13 +198,10 @@ static void imx_epit_write_cr(IMXEPITState *s, uint32_t=
 value)
=20
     if (freq && (s->cr & CR_EN) && !(oldcr & CR_EN)) {
         if (s->cr & CR_ENMOD) {
-            if (s->cr & CR_RLD) {
-                ptimer_set_limit(s->timer_reload, s->lr, 1);
-                ptimer_set_limit(s->timer_cmp, s->lr, 1);
-            } else {
-                ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
-                ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
-            }
+            uint64_t limit =3D (s->cr & CR_RLD) ? s->lr : EPIT_TIMER_MAX;
+            /* set new limit and also set timer to this value right now */
+            ptimer_set_limit(s->timer_reload, limit, 1);
+            ptimer_set_limit(s->timer_cmp, limit, 1);
         }
=20
         imx_epit_reload_compare_timer(s);
--=20
2.34.5

