Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp701840ejj;
        Mon, 25 Mar 2024 06:34:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3lTWUW5Xq3Req9AJG3TJoGRitI++y+RpyTfQbiXW88zmCR10nWafWSj8825biepiSOGKiFQEZnCBrd5LCSIaOA4xHHSUZ
X-Google-Smtp-Source: AGHT+IFswVtS/HrkVKiho31ILzpUIgVggROXYLO3yR5kepRVo40tnJROQxOWH5cWzemtswh3pgPj
X-Received: by 2002:a05:6214:1256:b0:696:52d9:673f with SMTP id r22-20020a056214125600b0069652d9673fmr8117127qvv.27.1711373650198;
        Mon, 25 Mar 2024 06:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711373650; cv=none;
        d=google.com; s=arc-20160816;
        b=eBzb5cr7/Xu4/+nY/FSVVY53f/JbZJ/Cskxm3Qx7fZtbOKGG4OzMG6mPK/pbL9wyCM
         iBrQXLigfq5uWbPqrkpde2HT7cyZ5Jbf+mVqDr4yr9b6VyI0w5kh3Oq0z1ocxN/BRCpN
         ivWRqey66kaF+ZS9PNhUP+130JvA5FWklnSiI9BSvsvbsZHyqqY/QEd+61XrHL4b63rA
         li3WtXwbj/sQ5QCEFC7jexegvVFNZIJ3HOo63O8KsbpvqufTc5mmQfiIUr0y/h8rbbMQ
         kcFgEs7H+LeB+SXDw4CFD+ndxDRSGU8r4Zr/NNd0ZBQjLSc/Ym2xLEzihEH/VZH/Lz0S
         psnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dmBZnvObELGs1VJCtsjfXQQHR8FYa+eCE52ifx9aDFo=;
        fh=6rXMKFvQo/cfwSB/0RUdX4Fsmb3l9JgxY+zOeYksIZk=;
        b=wgU0F8RlzdEgkGC8CYA62VF1RUEmP6NAiSq1yiWMg1FLv33Qkh1j5nncydR/0/s7fR
         mtcBrh+8uDYuywNaQdoc536a000g3G76G2OI45bwxCx2bdo/KzuxfRQa1oHH3WOl46/a
         nbIQHpeZgHKn/P0X+IYo20/P3Q8Orj6gpG/P+S3R5iEBQGy8bzZemqOphvmEZgmfW7VY
         dTIivyfn64Eyoizbp5B62H8BcApO6lzled56CaGoUIvM8fxKBcXxF7mMYOmoqNL7DQ60
         /5uYqMJ1wrA+8I0g8o4EQj9+j3644hy7+HpGvvKFYXuMWyc+doi5JhCWRbo8GGQ7ma2u
         7A0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TkcmmaY3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr11-20020a0562142a8b00b0068f53323cc9si7904585qvb.289.2024.03.25.06.34.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 06:34:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TkcmmaY3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rokSU-0003Vi-Hy; Mon, 25 Mar 2024 09:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rokSS-0003Ru-TG
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 09:33:48 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rokSR-0007SU-4F
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 09:33:48 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-414866f92beso7635905e9.3
 for <qemu-arm@nongnu.org>; Mon, 25 Mar 2024 06:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711373625; x=1711978425; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dmBZnvObELGs1VJCtsjfXQQHR8FYa+eCE52ifx9aDFo=;
 b=TkcmmaY3P9KBxuj/1kMLyKMhfW3tUhND1f2WJ6LAotpmiQgbtWLd2ciexxuvhqhULl
 FqPneXiDxHaTwSwpvq9M26qypu7UeX8SWaOcSQy6VwvAlHD+cqin2OplF/tFgh9tiCsW
 6raBV+s2rXeV/dP6BwR5C+aFrqg3Xfi5e/IFgKlMBIjvdX+lCgHkOUxrNG+24dcTDXFc
 d28to8WWhBfKcmKEBXnVxBz+kqTMNws6kms7t2dCBp2XTKc7iKCe2d91PPri8dJ2XCC7
 NCcSvwmnu9+W6SuLw3PlC8stErZxf92Bd6OaT0ALippppRYDM3GHj46DbSrklmVzrzyw
 jmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711373625; x=1711978425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dmBZnvObELGs1VJCtsjfXQQHR8FYa+eCE52ifx9aDFo=;
 b=jfRhM4JcHGeltrpnsW4iJRk1vu03yAvky09v3bcN6d4QtKmNVMkIdkgczcbujQ9u6e
 qNo1rRwtTqVVenx6VaQMuIi97GDsy8lbMhjk+82SffUbCccg1lLLahJxz/cAzsbH9ehc
 jETm4trVnTKloQqA6UWQon2VKyzU7CpVSS8Y5ig2468Uo+NbMLXzDvUQgFhbywy+hTSM
 3fu+GHYmbd7P3zAMl6RKzwVcqoIhNHZlk/JD8lF3FvutxJmProhgdQYqoRtw/+S/S591
 JZeAHe5SvonJzlqUX66UlO8E/IhRV4mhvQhDqsuC8dd9uRD+EaKKHVtfB5EdORbMN+vT
 PsMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyjkTDABQ0g7m1HTgvvzkhr7UcAiKT5yAt1OEg32opNmQefi4LFcKtYLOIL4oLSemIfl1wV3BI8pJtWYe4u8dWd3Wp
X-Gm-Message-State: AOJu0YyS7DreBu0YHgp6G0lT7qvYf2SJqMwKGoXoSnKoLkxEtZ94yQeg
 Q3FJGEWvloAxGfPM3e7LuqHAIyvmQNTR2Ed2f0NUSHqmtvFgDQ4lqdomh4ZXGhc=
X-Received: by 2002:a05:600c:5121:b0:414:7bd1:4060 with SMTP id
 o33-20020a05600c512100b004147bd14060mr5425135wms.2.1711373625053; 
 Mon, 25 Mar 2024 06:33:45 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.208.214])
 by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b004148c10db66sm809802wmb.26.2024.03.25.06.33.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Mar 2024 06:33:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Damien Hedde <damien.hedde@dahe.fr>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0? v2 7/8] hw/misc/stm32l4x5_rcc: Propagate period when
 enabling a clock
Date: Mon, 25 Mar 2024 14:32:57 +0100
Message-ID: <20240325133259.57235-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240325133259.57235-1-philmd@linaro.org>
References: <20240325133259.57235-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: iuzQ0xkLys/K

From: Arnaud Minier <arnaud.minier@telecom-paris.fr>

The "clock_set_mul_div" function doesn't propagate the clock period
to the children if it is changed (e.g. by enabling/disabling a clock
multiplexer).
This was overlooked during the implementation due to late changes.

This commit propagates the change if the multiplier or divider changes.

Fixes: ec7d83acbd ("hw/misc/stm32l4x5_rcc: Add an internal clock multiplexer object")
Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
Message-ID: <20240317103918.44375-2-arnaud.minier@telecom-paris.fr>
[PMD: Pass argument to clock_set_mul_div()]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/stm32l4x5_rcc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/stm32l4x5_rcc.c b/hw/misc/stm32l4x5_rcc.c
index 8852b434db..166c727e52 100644
--- a/hw/misc/stm32l4x5_rcc.c
+++ b/hw/misc/stm32l4x5_rcc.c
@@ -61,7 +61,7 @@ static void clock_mux_update(RccClockMuxState *mux, bool bypass_source)
         freq_multiplier = mux->divider;
     }
 
-    clock_set_mul_div(mux->out, freq_multiplier, mux->multiplier, NULL);
+    clock_set_mul_div(mux->out, freq_multiplier, mux->multiplier, &clk_changed);
     clock_set(mux->out, clock_get(current_source), &clk_changed);
     if (clk_changed) {
         clock_propagate(mux->out);
-- 
2.41.0

