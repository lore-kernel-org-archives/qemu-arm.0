Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp4360859eje;
        Fri, 14 Jul 2023 16:28:40 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFEZDzvnR0AyATGo2Hhdgg5f1Dke56b4VcLNE2k5gltDPrURVvGlt+RyzDn8JhGWj4Hgbmd
X-Received: by 2002:a0c:f513:0:b0:621:1a4c:759b with SMTP id j19-20020a0cf513000000b006211a4c759bmr5234738qvm.36.1689377320713;
        Fri, 14 Jul 2023 16:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689377320; cv=none;
        d=google.com; s=arc-20160816;
        b=1HNJ/HRo6nQaKq0HCrwmul5Jsw6HubP8tooxx24Qpwy0tWIL7sq0qjk3ksLt2USUu/
         Ri0TqHZuwg/8hTKTX4JHC4BjpdJl57wvFeC3Y//4nuzPfq0pS2bLMLfQPISmXhCziFQ4
         PRpDT1krXHQahxVQLjhf4dvtVXAml7aR1VP+rDUycLaL/TjFRnMbPZRFgbV0aZOCo07n
         hUoqYQu+BarTWKAQYRXs7SnTJc7d7+zUfcdMGR9oJMG8NZK+Oe1tlFhPOUiNncBZxian
         xdlJKArDYdy2mndXEyU90hSx0+HXRb9pi3/R3D7QWfxw3bjE6WksCvbkLxvFno50HUkq
         iwzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:references:in-reply-to:message-id:subject
         :cc:from:to:dkim-signature:date;
        bh=p8qyHHyfDhdsEY8JvJ77P9SgwAhpNZHlmyp2CWDWqO8=;
        fh=51RBXPp2dGsIxW/A/2XX6J9OY4lNIg77Uvb7eAIehHk=;
        b=FO0lvwoobl8mdDkhZw1fgFx2j3nBFSRqje1TI7yuLcOr/CN3JjeIZxfdHuj18aEHCI
         4p/R3abXQ/CChSg7AaNb34p1w3e2qPE3TgzA5z3MzIA/rQ9mzXPcox3H7Lvf4eH391pl
         o3hIY5NeOhZ7i2xuWci1tRl7FBUz9wZBGLcWomQ0Vk+NXSZhkNS5tTSKR17OA7BZ8MkO
         oMMDQfgSkPr6jep8hP4aawi4tM7XRhu2Ye58fWJsTak2YERADIfqAymmcLhv4KpKkBB3
         N9zz49ATRjKK2lkXbYGsnA2tiHwW59loQGF2v+kABYk+DlgUYDgPBWb95JjuqXriZwc8
         tpGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=H895B0Gj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2-20020a0cc502000000b0062dfad6c538si1139829qvi.168.2023.07.14.16.28.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 16:28:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=H895B0Gj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qKSCW-0000mV-6Z; Fri, 14 Jul 2023 19:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qKSCS-0000lH-II
 for qemu-devel@nongnu.org; Fri, 14 Jul 2023 19:27:49 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qKSCR-00040X-41
 for qemu-devel@nongnu.org; Fri, 14 Jul 2023 19:27:48 -0400
Date: Fri, 14 Jul 2023 23:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laplante.io;
 s=protonmail3; t=1689377259; x=1689636459;
 bh=p8qyHHyfDhdsEY8JvJ77P9SgwAhpNZHlmyp2CWDWqO8=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=H895B0Gj1q3Fp+OtSCoYgRtsx9dObrAmJv2trFlK/6Vhkc+K1CF9lZOCiQ/zc+sWa
 h5/BcjFnqxvDlJUq744PhH2T2IUA97PCMdSHvNtOV666CtlfQnJJuYCmGICXG4Aryt
 6GMMKtTVrZG5hqMiWZtE6hr5BAIWuHkIynPNHwVGzpN8CM5fzYhx7QOoo+RrOBKQZX
 GLnWOcN5Asjnk7EAne6tiLuoBFgvNLTEaMzfqLzFwBUTDy1yBvCN8PRYt4sBFQ6vwP
 W9/6msgwsA66kfRKoVEcJyq/guQgffEVdKPK1WwfuCPq8ScwbKlycxl5Mfd5vh+XOL
 2HZZBjP7Y2syg==
To: qemu-devel@nongnu.org
From: Chris Laplante <chris@laplante.io>
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Chris Laplante <chris@laplante.io>
Subject: [PATCH 3/6] qtest: bail from irq_intercept_in if name is specified
Message-ID: <20230714232659.76434-4-chris@laplante.io>
In-Reply-To: <20230714232659.76434-1-chris@laplante.io>
References: <20230714232659.76434-1-chris@laplante.io>
Feedback-ID: 43500449:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=188.165.51.139; envelope-from=chris@laplante.io;
 helo=mail-0301.mail-europe.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: HaFeY9QtbqSq

Named interception of in-GPIOs is not supported yet.

Signed-off-by: Chris Laplante <chris@laplante.io>
---
 softmmu/qtest.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 7c3dea5760..74482ce3cd 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -401,6 +401,12 @@ static void qtest_process_command(CharBackend *chr, gc=
har **words)
             return;
         }
=20
+        if (is_named && !is_outbound) {
+            qtest_send_prefix(chr);
+            qtest_send(chr, "FAIL Interception of named in-GPIOs not yet s=
upported\n");
+            return;
+        }
+
         if (irq_intercept_dev) {
             qtest_send_prefix(chr);
             if (irq_intercept_dev !=3D dev) {
@@ -412,7 +418,6 @@ static void qtest_process_command(CharBackend *chr, gch=
ar **words)
         }
=20
         QLIST_FOREACH(ngl, &dev->gpios, node) {
-            /* We don't support inbound interception of named GPIOs yet */
             if (is_outbound) {
                 if (is_named) {
                     if (ngl->name && strcmp(ngl->name, words[2]) =3D=3D 0)=
 {
--=20
2.39.2


