Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp702032ejj;
        Mon, 25 Mar 2024 06:34:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0Bu8tE3lQ2XWyoLTIptQtQDhVJw5qtPfpF5x6EAurubr7AZHJTBwl6AqNE21SbBDPEKZ8d1YStQAOn6ZRHkqD5X6gVqgC
X-Google-Smtp-Source: AGHT+IHxNoQHcSOmvU/ilLblPzGCc5I5/f0rNvjWZMtjsEL3uLMK/R8T00TbV2hm45kK0wHonvWB
X-Received: by 2002:a05:622a:148:b0:431:5b68:ee1 with SMTP id v8-20020a05622a014800b004315b680ee1mr2900864qtw.20.1711373668835;
        Mon, 25 Mar 2024 06:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711373668; cv=none;
        d=google.com; s=arc-20160816;
        b=WvlQODXAk7pF4oerAnB/psc2uBXTkTl6fLabjbk/DXWIZxfo/XgczB8Kl7/Zzj4Jbc
         5yH9IZZCDvnKAmCWlqcCYJtLovuP0VX2WR8KbQOeM03l2Mb/XNsaJrKcUwlwmJK99Kfw
         uXDh6qgnjXJURuGZUzVldG2rxsnlug5qPEDK8h88tiMmeeL91QMv+K+5jy2yDBvdIJBQ
         64hdgj5fhCyGnUF783nAUf+3iKd5f7p4M+52TmdiJY1HJw5oBtKdiGEdGv/pZnD4GYfL
         CsAi+bhcf+8pU/+tjFt0pdhm7tY3qqdxTYaCRmP61VYusWodQcj92i5IlQYjYUOlUmvS
         7f5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vr/+Morh4LGFnprtkK6/DvsiuzOF19rNj0hIhqL5OAo=;
        fh=qGBO7l8jNFITVXKWOXA/+jtoStCKsdN21U2hzwY4PNw=;
        b=bKcnUwecG/ZjSMSwb4RCiO50K6wfAGa/P6H0L16KEu8QIappfq2EjapxlAsN5mxF3v
         IU7RAmGpXTL6M1nzWq3ijCgf2WhKKaZpgvAnsHIdFnoS76LS0HiSWJ0q3RhAYspgiKbz
         w7sdI86Z8htAYDFluWFV7rnTUkmvS78SI7cX6ggyD4g8Z4UrEVoW5qufonqXY5/J0NJS
         XgxrnQCIgPGZ/70mH0niTn6sNQ7gQq3FwdLyIb/s9EnGS+HG0F/N0dNrGxXHlM6e/FvZ
         pN22v1hjniey+CenVlfRpPPE2K1/a4VM9miG0YKjIoDlqlRcSCzSNCdB88Ei1V1AzDlJ
         8xCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xm5WvVT8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020ac85906000000b004316071dfa3si842664qty.356.2024.03.25.06.34.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 06:34:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xm5WvVT8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rokSD-0002d0-Ph; Mon, 25 Mar 2024 09:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rokS7-0002Z2-Pt
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 09:33:29 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rokS4-0007MT-Vu
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 09:33:27 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4148a139b1bso4413405e9.2
 for <qemu-arm@nongnu.org>; Mon, 25 Mar 2024 06:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711373601; x=1711978401; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vr/+Morh4LGFnprtkK6/DvsiuzOF19rNj0hIhqL5OAo=;
 b=xm5WvVT86UmmiSruPKgvLpQVLZ5a3Tjk95kVLYdHenbXU7tQQo2fDmzpIarGQ3TcCE
 xK//4Aw3cLSQXwx9omv2xCZffOlomtXeC6Aq+Oft8Qsmfi1Q68KEgV38x27NTxHKD/uw
 au/E3rwOUC82tbBdcho+97rPb+LUJJy721rFqowZ3xRjgrUi1Xz+gEkH6FREOj1hYvHe
 MnzKTzodMpp/66bGxM1ifhNaVp3IOSQMrpg4SebTBYlh4OOhIeu3CDk8o2e8sCpTm868
 fIEEHv/G1mB5m6fAqal5S9aRIxiPAfVRDD8gvg7MegdV+qzkdr6uWzQUJ2eaZ5KVJlEi
 4CfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711373601; x=1711978401;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vr/+Morh4LGFnprtkK6/DvsiuzOF19rNj0hIhqL5OAo=;
 b=fKWbIFgdRKuzK8e4WyN7W7TvdC52Syq1iVQnoF/T+0muX2rNWs84nB2Njg5HcY/tAB
 cHoWoEee633mn6N72csQHksdXG48UakPxBj1xoxcmFpLLNfg/DCpdyOg1nVYW3xVH8lh
 7T7i5IzEGy4t2QxX7DJr+uIIaslf63Mq9neC1Jz/YLIHwrgOfsKSZ001jHEvnkvN02J9
 sJi+RUYFLjFSbfSH87LZ13I/RsCnd5DqC4A6Bl5O95DWQrgDRosBjjPR1o2ShsyE9E1H
 RqoUPJecXwamqePQFg255ALHywSt1V2UbfBfrI7GJPfHw89QrY3k+SXsbT3h/QEHFuYP
 7EYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWyzs27+RKZbiLOr/uqwnjZTbvyWt4N4xQ1lJXVHPrFw+eyrUkvGioKulGPvLVTRbzjscKxVkgQEGPWEc4Rtfg65mF
X-Gm-Message-State: AOJu0Yw1tDMnrfHJ37J0ymIXbDwMjYUfidvacv2Q6/ZFbRTvzFZImM/y
 9UjO4NTB/kdofzdgBWQgO4+akPLr872fb59QBQhG/Zpw8I4lFPGPdlDTtCsuqW4=
X-Received: by 2002:a05:600c:56ca:b0:412:f572:5318 with SMTP id
 ju10-20020a05600c56ca00b00412f5725318mr5388419wmb.11.1711373601371; 
 Mon, 25 Mar 2024 06:33:21 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.208.214])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c310e00b004147ec48845sm8405542wmo.26.2024.03.25.06.33.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Mar 2024 06:33:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Damien Hedde <damien.hedde@dahe.fr>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0? v2 3/8] hw/clock: Pass optional &bool argument to
 clock_set_ns()
Date: Mon, 25 Mar 2024 14:32:53 +0100
Message-ID: <20240325133259.57235-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240325133259.57235-1-philmd@linaro.org>
References: <20240325133259.57235-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: O1zFPjaWVpzI

Pass optional &bool argument to clock_set_ns().
Since all callers ignore the return value, have
them use NULL.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/devel/clocks.rst | 2 +-
 include/hw/clock.h    | 8 ++------
 hw/arm/stellaris.c    | 2 +-
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
index c4d14bde04..3360e5616d 100644
--- a/docs/devel/clocks.rst
+++ b/docs/devel/clocks.rst
@@ -298,7 +298,7 @@ object during device instance init. For example:
     clk = qdev_init_clock_in(DEVICE(dev), "clk-in", clk_in_callback,
                              dev, ClockUpdate);
     /* set initial value to 10ns / 100MHz */
-    clock_set_ns(clk, 10);
+    clock_set_ns(clk, 10, NULL);
 
 To enforce that the clock is wired up by the board code, you can
 call ``clock_has_source()`` in your device's realize method:
diff --git a/include/hw/clock.h b/include/hw/clock.h
index 474bbc07fe..94ed5ba6e6 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -195,13 +195,9 @@ static inline bool clock_set_hz(Clock *clk, unsigned hz)
     return changed;
 }
 
-static inline bool clock_set_ns(Clock *clk, unsigned ns)
+static inline void clock_set_ns(Clock *clk, unsigned ns, bool *changed)
 {
-    bool changed = false;
-
-    clock_set(clk, CLOCK_PERIOD_FROM_NS(ns), &changed);
-
-    return changed;
+    clock_set(clk, CLOCK_PERIOD_FROM_NS(ns), changed);
 }
 
 /**
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index a2f998bf9e..d4381beeb7 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -279,7 +279,7 @@ static void ssys_calculate_system_clock(ssys_state *s, bool propagate_clock)
     } else {
         period_ns = 5 * (((s->rcc >> 23) & 0xf) + 1);
     }
-    clock_set_ns(s->sysclk, period_ns);
+    clock_set_ns(s->sysclk, period_ns, NULL);
     if (propagate_clock) {
         clock_propagate(s->sysclk);
     }
-- 
2.41.0

