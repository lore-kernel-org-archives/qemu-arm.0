Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2543044ejf;
        Tue, 27 Feb 2024 00:40:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWQORJHwroxNZThHiFgd6kUKOKjfrndr8FgonNrSGTcqjUx954vyISpzzj10YAL1yRLrKFihtVT+fILM44Uix7bVLwOnua+
X-Google-Smtp-Source: AGHT+IFYHFynEujgri9EghJ+bVA5oNblCX55j3kZX51l18B+vfNcxhXw9kAdeWUMiJ8wuGLA7zQ/
X-Received: by 2002:ac8:580b:0:b0:42e:7814:6062 with SMTP id g11-20020ac8580b000000b0042e78146062mr10280954qtg.42.1709023232958;
        Tue, 27 Feb 2024 00:40:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709023232; cv=none;
        d=google.com; s=arc-20160816;
        b=Zi3pBWnMNtsDwCmK3aL9JMyQqFx8fF7kI+qjnvmNG9AOjKJUmTO1/NwV6dvFGch54P
         f9j9PihvuXxKKQ+Rj9OQ15N61nToCJjf54xLwM//jeGcSSvZ3EFAshU2nWTEniQxoEta
         JrV7tRytZe+MX/gwtUb8payIgMpwLkfQbuyPfu9U5xXD6jOj6iUVhoO2Eg9w8PMlpftM
         wlDllQwkCT9MBpoKlNjXdp9kSgXwT1fkxKo3xDiInzCVFD91f/voHyFVOJGIoo9du1F7
         hM1kaO7lcByz55sK/Xf9RxHKSV8pBOrekdvyiou2ygleKjoLNStDensE1TuTe0IJ+MA/
         hxog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=B2Yugy2awLwnvm6DU00n3Q4waoAG+V4YGcUxNOBpaJg=;
        fh=MScVkeQ2iRsrAkejgD6U6vOGzjwdgMbmd00ccH8lUbg=;
        b=CGpPBvWwrVCoaExgvuSbQSlmFBTLultQdouTB1B004WfTiNOGnBmAZ/rC/DOpHRAJT
         LEEKkkGRgN2ANWM/4VZSURrvVnMZRnhPRN5lM67fz8XWShxeeKTr/+NGrsTJ8QA5dqQa
         nklIQaVo/JXImjfZS7WMn+bsgItBsGC7eB4j7G3BGLwrDps+wp3CxOJNfEfQ7dMz3QEe
         orzb6N58G78npBj+OZFC49wM+jKXve0ZDD+JHyCAH21bIkVnDeWa8EnR5k8m4Wzmm8g5
         rgCxJs5oPSXCsErw47lyd3rZw8c1Ns87xCP+jYo1io5QMzhwpMxwl5rzSiny+aVG/byw
         rAPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b2HjFy+w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13-20020a05622a02cd00b0042da968cef7si7412090qtx.543.2024.02.27.00.40.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 00:40:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b2HjFy+w;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ret0f-00062O-VZ; Tue, 27 Feb 2024 03:40:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret0c-0005yS-3g
 for qemu-devel@nongnu.org; Tue, 27 Feb 2024 03:40:18 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret0W-0007c0-NL
 for qemu-devel@nongnu.org; Tue, 27 Feb 2024 03:40:17 -0500
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d094bc2244so46831601fa.1
 for <qemu-devel@nongnu.org>; Tue, 27 Feb 2024 00:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709023209; x=1709628009; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B2Yugy2awLwnvm6DU00n3Q4waoAG+V4YGcUxNOBpaJg=;
 b=b2HjFy+wR092Oic1IG/ugYXwtBb8mswBlD26hOsDQ2rELtK+fVaOoNLZXY9UY5JthL
 8A0rF+d/fsapuplz6opr6JU4+g9FQ96ABnYH4NAlBTkldyWTJtpwxc1OxMHRYAXafciW
 juzPxJYdhZzAl+S/v03YWAlsShT81kYaY9VbZQj+UgMiX+v9W8kbSKWCNrwTYV9GNr8n
 SN1mhzsfe/CHm/J999UDfi1YSNQoWtkfxWGXxHxFmdzBIaw4UsrVic9fAmZqd3TM8YTG
 rJqbDb9fKs5tZs3BElTDbi0RvtnUq6kWtuk5PQoG2WJ/Af6uETpTZ34rhfdOJhSBeU//
 it1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709023209; x=1709628009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B2Yugy2awLwnvm6DU00n3Q4waoAG+V4YGcUxNOBpaJg=;
 b=crw0g+F6PuaM1Mx5C+H0wY398rvsCeYsAZa1DyvyOaAQUPx4mr5V1YoVbCEIThpXee
 XB3s8u5vCrHCVaLA7k1LDxZ9Z34sPqUnwkN1qzLkgpkg7h4tzBSOb/2EGqZkq38G6qf0
 aqYBkzyeHM3VHimOB9YS6iFcmN4xzilo6/JEi21d7sy0BZQ53kpjoi0E/zo1U0lo/hEc
 pfm+spZLjcn518tSc8nsubR7pZlkkR8Fi6VttE/gSplp3XmaMutCZ515B8NcG8TYNMVw
 7Yf9fEYtJyWm0cr2ZrvdL+KwSeKwrWqz2nXt78QCKP6nqklvS/W4EVEPD+S25+A/C3oL
 ocyg==
X-Gm-Message-State: AOJu0YznMaWO6VUUXMHKNmeRKd7a1SjIlxbAjr25YBPPb0Rl0PYbARXh
 FaNSdnZ5i9pTyh0YmzQf1utGNbAA1s0VeG44z14qB7Dn4EqtoUPQ2qEi50SUW6omQQ/xaAfSckQ
 U
X-Received: by 2002:a05:651c:d2:b0:2d2:86f0:3064 with SMTP id
 18-20020a05651c00d200b002d286f03064mr3856029ljr.44.1709023208686; 
 Tue, 27 Feb 2024 00:40:08 -0800 (PST)
Received: from m1x-phil.lan (mic92-h03-176-184-33-214.dsl.sta.abo.bbox.fr.
 [176.184.33.214]) by smtp.gmail.com with ESMTPSA id
 t19-20020a7bc3d3000000b00410dd253008sm14327564wmj.42.2024.02.27.00.40.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Feb 2024 00:40:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/30] hw/arm/exynos4210: Inline
 sysbus_create_varargs(EXYNOS4210_FIMD)
Date: Tue, 27 Feb 2024 09:39:19 +0100
Message-ID: <20240227083948.5427-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240227083948.5427-1-philmd@linaro.org>
References: <20240227083948.5427-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x231.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: o+KDgiQpmRRj

We want to set another qdev property (a link) for the FIMD
device, we can not use sysbus_create_varargs() which only
passes sysbus base address and IRQs as arguments. Inline
it so we can set the link property in the next commit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240216153517.49422-4-philmd@linaro.org>
---
 hw/arm/exynos4210.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 57c77b140c..ab18836943 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -769,11 +769,13 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     }
 
     /*** Display controller (FIMD) ***/
-    sysbus_create_varargs("exynos4210.fimd", EXYNOS4210_FIMD0_BASE_ADDR,
-            s->irq_table[exynos4210_get_irq(11, 0)],
-            s->irq_table[exynos4210_get_irq(11, 1)],
-            s->irq_table[exynos4210_get_irq(11, 2)],
-            NULL);
+    dev = qdev_new("exynos4210.fimd");
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(busdev, &error_fatal);
+    sysbus_mmio_map(busdev, 0, EXYNOS4210_FIMD0_BASE_ADDR);
+    for (n = 0; n < 3; n++) {
+        sysbus_connect_irq(busdev, n, s->irq_table[exynos4210_get_irq(11, n)]);
+    }
 
     sysbus_create_simple(TYPE_EXYNOS4210_EHCI, EXYNOS4210_EHCI_BASE_ADDR,
             s->irq_table[exynos4210_get_irq(28, 3)]);
-- 
2.41.0

