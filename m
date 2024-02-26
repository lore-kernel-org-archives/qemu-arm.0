Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2203535ejf;
        Mon, 26 Feb 2024 09:39:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXgcBYbCtBZc+rRpxNPBIGFduIOU2dff3rEv/9sBD+4IXDkmL21/5yCYVCU5zWfO3WK93mjsaWrmiULmYec+l5F73whyYHm
X-Google-Smtp-Source: AGHT+IEoF+MZv2zQCeH9p730EqmTG8+IolWbtDwPMwFYztjp8sHKeNh+9wqK/SfcSY0dQvX97aQa
X-Received: by 2002:ae9:e604:0:b0:785:8c13:bfec with SMTP id z4-20020ae9e604000000b007858c13bfecmr8637958qkf.43.1708969141651;
        Mon, 26 Feb 2024 09:39:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708969141; cv=none;
        d=google.com; s=arc-20160816;
        b=O5v/lqe0C2rKmPV4t+XlH0AbD/Kfige51dNObl3rFaunakZqjxQ7El3MuVndBCj/tW
         6pWS5rq+mZBimNhwrdzI8STzdu3hCGrJalyVE1aMjoYb+A+lWNLp3N+135+/576Pgerm
         tpsdzOGtz+1JuXVAATtIkb//EsQ6nGMTvglFA3ZpeBrtDAZ0528ybA835sNfWFYFjK1n
         YefumpKrCvAUBKDFWO2J0IxnszxF/Lh14XzgHFg8khYyhjwIfQHRPIEZTmRG40VFvWrB
         Uo5CKQbDNkzIygQ+JKjl1jNcHcgBM+bxBCOLmBM0xJKwbVnsyAseZDKp3H5plpcogThS
         LJig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MDIRaAfrV77mDOzirHYEWIS1MDxHTben8a6a1zFSPbk=;
        fh=hXBz7qm8Kf5b78SvQ683p6CidcN0HSYS2W160lsNAR0=;
        b=jgFH69rl67zR9M9MH5cdu4S7UKwr5/0/22NVED76lyuovGXmq4gN8Y7/pYKx2V4TLQ
         jfw98s8CY7cHXMeONCy446ypScAXvjyatFn6BiX8iL6Uo8RaCL6oaUDmiLjBgtsN6bFq
         4E+o+GPPPO9qTZ+aLYfM7EFqCZQVy2Q3FdskzNwG6MGMiyPJRQFKg1FSZ9KwQjtCuP98
         13P+TOG+ZM/ewoYSjGzDsHYAGjvM+60tYC+3apqjjdsDv4QjlgGoTawgEedn9pzBD/Iw
         B8lGvFly/SS9IxfrtnAQK/V2pmr8d4IEuKZab551gwM3aZs7Wf2bpEJx1roDvqm3CPwD
         Nd8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tP415/iw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b16-20020a05620a0f9000b00787b028ca5csi5336971qkn.149.2024.02.26.09.39.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 09:39:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tP415/iw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reew4-0004FZ-6O; Mon, 26 Feb 2024 12:38:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reevs-00040M-R6
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 12:38:29 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reevp-00077R-D0
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 12:38:26 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-412a4a932f4so10134535e9.0
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 09:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708969104; x=1709573904; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MDIRaAfrV77mDOzirHYEWIS1MDxHTben8a6a1zFSPbk=;
 b=tP415/iwp966js4vZxd6sxUzV4Ch8rJnlrAe7NLpqir/bqbhtKeR39k/USXBU4NjQF
 gYV5cOq+ZXnCvZPyUKBKlsV6+r3Wqlc6gJqoY4kQkfrDZs+gsxFuyrC0I2Egtrxq3QyM
 hCnp8zBJhKz1Fd3iRypZYKcZ1M9FNL0AB2bzV+WwHz1geqKag0rTS3uPoNRgu3E9eRVE
 kFvREn0OLBX6S5qcBb6Gb8CIKXk2kuWPF14CP/JnCLrm2oZCt8+Pbxy1jPBrvycXlH2e
 Rj/ygwqZrIrPxQqezEC/p81OAWoAmVwUZ1gv0gfK04PxVPawOXkBFVk4344TfPWFclpM
 7XLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708969104; x=1709573904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MDIRaAfrV77mDOzirHYEWIS1MDxHTben8a6a1zFSPbk=;
 b=rn1OUyA44BYErLDCJFVuCKxMad1MsIA6jYsa3bpa7/CEJ13DJMC9DcU1MhfGrks/T2
 t/tjS6uPw+d5yM+XPn/Kk099Q7ZJw+f4GIi/bakQO8Z/ctlMcEjbF4LB0bqdMoMxfKZN
 48hjSvEO+C7xYC8hPMh0Xw3Bg9qofpFNWsrL7wRqsA05s2f+kRCzjdxT6XzNzDFIRxL5
 bdYLBj4GsqsPnEaivZBTa1B71RhFvjXQ12qNr/bIO9ZAFRAebAHvNLEwpFsti0AckKzp
 eYusTptbwu50Xq7/F2dtAcUZFqRZrXzjbPKcuPRTinBANfG8kdi9aNmtEGby3wLipigz
 TfXg==
X-Gm-Message-State: AOJu0Yxx0Yl4JlU+m7X8sjVPWdNdgpDm55WwwgEkkqeSFHTiixzpTwAB
 Z9XaFDqzKnesWbGAsx3YJBjH//F5Z+hVKKBNp6I81OyBV6WaG06gnx7yuKZmLXkTC8QKVt7IBLE
 O
X-Received: by 2002:a05:6000:71b:b0:33d:c652:7c41 with SMTP id
 bs27-20020a056000071b00b0033dc6527c41mr5226316wrb.71.1708969104173; 
 Mon, 26 Feb 2024 09:38:24 -0800 (PST)
Received: from m1x-phil.lan ([176.187.223.153])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a056000038900b0033cffd1a302sm5592272wrf.57.2024.02.26.09.38.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Feb 2024 09:38:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 3/6] hw/arm/exynos4210: Inline
 sysbus_create_varargs(EXYNOS4210_FIMD)
Date: Mon, 26 Feb 2024 18:38:01 +0100
Message-ID: <20240226173805.289-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240226173805.289-1-philmd@linaro.org>
References: <20240226173805.289-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: sx1JPZo2Tsi7

We want to set another qdev property (a link) for the FIMD
device, we can not use sysbus_create_varargs() which only
passes sysbus base address and IRQs as arguments. Inline
it so we can set the link property in the next commit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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

