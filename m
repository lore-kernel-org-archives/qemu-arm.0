Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1153564lfa;
        Mon, 12 Oct 2020 08:42:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgcazXajSOBqrrypNH8ARrTSbcHRvpcERMxGs9gq3+D4VvDdw6Lgho0I5id3YiuRSQiZNq
X-Received: by 2002:a25:ab84:: with SMTP id v4mr23949454ybi.313.1602517351805;
        Mon, 12 Oct 2020 08:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602517351; cv=none;
        d=google.com; s=arc-20160816;
        b=PuDOlFT6FVnbsq3IIHo3/IJxc11lp7qsRbdUxfs2gp2qs8q6JWAbobNvO15c3llAE1
         aC081G2gRlk1KEq8KvxW0BOcK8ok86oVGieBePLGjkfo7nCqnz46jQtzrpBK6fjPIReS
         1e4KMOCpSIc23c3RvUBbUMm62q3Rig/adQPvMM0IcJYxP0MnM+lsC70QxZQuLNM5f4vc
         NBVnqbYI53ByjARAHZ/mo1idzshM+4LoRm/ifHl4CrYVL4wRUku40Ol62jFt/CHx+1Oy
         HLzVXCKn5dd0vRVZhrlsqroPUVSYmk4FQ8NqA/6SlexCZ5iJPNVQpW7V/7p36FUtJC5W
         tS7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gRnzhB6CdonM/19XlgBuso003ocyxIuCfMZY1cNIpB4=;
        b=gEpc5mvJkOvOAvr1HXZgOKoMgjm/nM+yR0ArvvS8RE3dghtW5tIjgSAHt5TzzlFvOD
         2cG/HtiddaNt7Bq4fpq8HoEETy+UwGMqXWVRK0vIlbkKTjpXqBptwdKsu7DOUs2hwmUr
         ITr36XG7rmvbE8/Yy1A18zkTZSpEeY3bUrvkTYNETMyIUeifVJc8gaNcH+ndG95xj+iG
         Lrl9EwjVlD7JyNsKgSqAqfW8XRtZq8MY3X/F+ZKoRx0ZDgdbUVV+/QNo74OH+R1a5yZ7
         MRVMbAhaM5/VKeFHEFrI8HLg70zo9GMX4Y112JqrveANvGA49NgyXazGW0Jo4JQiztq3
         bLwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LgeVVKXg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si15424755ybm.256.2020.10.12.08.42.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:42:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LgeVVKXg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRzy3-0007vk-6i
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqQ-000745-7Z
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:39 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqL-0007Kb-R8
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:37 -0400
Received: by mail-wm1-x344.google.com with SMTP id k18so17960534wmj.5
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gRnzhB6CdonM/19XlgBuso003ocyxIuCfMZY1cNIpB4=;
 b=LgeVVKXg78hozwZTdWLu2fJHYlQq4U5ka0HhWgb9QLbK1ggAKfrS5MbacohIPpQafY
 oxv1cbQVxVtyDmjGKXprveYYnsIsvdYslP4cQ5IMQ7iWiPgv/CjrnItqWKF0sMpxKh1K
 lcGxAeod9NA9P1TFrA2mysw/ozKIz+z6CllgVNBfFnkA1z0NrezP/747E8QmLZ+gYMIL
 du1aRq1HOPL1JQqV4jjXd/+Z8GgYtVmcExi4Pa4pU21BYXV/YS9npUdCobe7YGBTxt46
 PcW7a3ooGuE5o81xv5/E80lYkQOgenXN6cC3qLpmqvxWKu10zJSra9tCXw/aKnobzHIO
 X8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gRnzhB6CdonM/19XlgBuso003ocyxIuCfMZY1cNIpB4=;
 b=pl05eyaFlwp9FR8pfWKiSltjTXtMoo9hgAnjk6b+MkVwKY/Tqa8xodKnxhifTWw4iT
 NLW5um0+syAJPgjTboI2R5geVXnZwNjNV9SNjzRfjagW7CagI+k8Xeikd/pakKNcgyLA
 QoNF9VqErx2wyFqsRnj5uu9y43SFsD2yUTzMexBcCB2/yNwO1biQpDdpgIeYKqpVONn7
 i1gDjQLw/iLBAhHmptPg3V9iEcJ3pxl7r0J2RIXkAssaJY6wrzAzGDd0NOLUzrfmVEAa
 CBK9FbL8jeCh/UWHRM+mRHF8fZBrjQeMy8JTzvnO0pQiLS+u08hebYVOoahw+/6RLXl/
 LQzQ==
X-Gm-Message-State: AOAM53078VV1j2mOitoMJV9ePNazUxEpmuTYAbd598RMtk+9N1xHfs4O
 K+QSxnXOHbEP9uLXrc92JMR12ViGftkO/KnH
X-Received: by 2002:a1c:59c3:: with SMTP id n186mr11469861wmb.32.1602516872259; 
 Mon, 12 Oct 2020 08:34:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.1] hw/timer/imx_epit: Avoid assertion when CR.SWR is
 written
Date: Mon, 12 Oct 2020 16:33:42 +0100
Message-Id: <20201012153408.9747-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: egrhxMHDd5Z3

The imx_epit device has a software-controllable reset triggered by
setting the SWR bit in the CR register. An error in commit cc2722ec83ad9
means that we will end up assert()ing if the guest does this, because
the code in imx_epit_write() starts ptimer transactions, and then
imx_epit_reset() also starts ptimre transactions, triggering
"ptimer_transaction_begin: Assertion `!s->in_transaction' failed".

The cleanest way to avoid this double-transaction is to move the
start-transaction for the CR write handling down below the check of
the SWR bit.

Fixes: https://bugs.launchpad.net/qemu/+bug/1880424
Fixes: cc2722ec83ad944505fe
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I don't have a test image for KZM so this is the minimal
obviously-safe change. I'm pretty sure that actually we could
add a "break" after the imx_epit_reset() call because all of
the work done by the following code is duplicating the ptimer
setup done by the reset function. But I'm not really happy making
that change without a test image...
---
 hw/timer/imx_epit.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index baf6338e1a6..4f51e6e12da 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -199,15 +199,18 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
 
     switch (offset >> 2) {
     case 0: /* CR */
-        ptimer_transaction_begin(s->timer_cmp);
-        ptimer_transaction_begin(s->timer_reload);
 
         oldcr = s->cr;
         s->cr = value & 0x03ffffff;
         if (s->cr & CR_SWR) {
             /* handle the reset */
             imx_epit_reset(DEVICE(s));
-        } else {
+        }
+
+        ptimer_transaction_begin(s->timer_cmp);
+        ptimer_transaction_begin(s->timer_reload);
+
+        if (!(s->cr & CR_SWR)) {
             imx_epit_set_freq(s);
         }
 
-- 
2.20.1

