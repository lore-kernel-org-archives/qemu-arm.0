Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp796160ejo;
        Fri, 5 Jan 2024 07:52:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvumAGJqUDjW5YDg1pGV4KlTAJF1PGmxFPyY3lvmYNCVF93CYxZLbaLrgp7i6PSkd3YpoO
X-Received: by 2002:a4a:988e:0:b0:596:26a2:9f12 with SMTP id a14-20020a4a988e000000b0059626a29f12mr2005514ooj.10.1704469927904;
        Fri, 05 Jan 2024 07:52:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469927; cv=none;
        d=google.com; s=arc-20160816;
        b=vhu8UKzuUYT6Pl1QJW5wMIsXUvkU1GyyJ8zkFr/uIwjh39TxTfw54l3LeTA60Iu0wf
         RSUApJG5u4NGlr5iWKu0bY5vsbihO0+08dSlR9t2dOevqQ3sVjEN30s6XQFIgJumamkP
         o1fSvmhFBIf4ZJD5qzgfSFMuOdzeiBDLKHrsX71eRsYB9QVsdtmCBg8w3jF7pAGXfvG4
         qYok/29qIi6Z8C1a0mnbW/HusLh0EAeH+2q6wVbNSj7o0hh/eJ3lUavJ+Y8yL/Ui6uV8
         JpkEChZBWgUPywUSAb2IFlb0W7sydSisBKwaTleQAa6BNwesESRQee3nAYFB3bwvW9kr
         WLfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iQqVZQAplGXwt087ddAaGknca/07pmUL/gFu1d2+27U=;
        fh=cQ2FfVt2/IZC0ZMISg8I4sbY1PJjpClPDf1skqRY4EQ=;
        b=CjSSjIIpPcOV3LKZAivSp2Vm9KqIKfWrozmY2URM0yo2P2P45GrHj2eIZbNqHymkD4
         bNhNSnZIKpzw+0xHMRllocBD0X3uc+38oCthrkRLi+pki6NaUyUss6AUa5wje95IEyrj
         0WRe8wIMayXObjQwO7HsaN6PebIKbeKWi073UZzplnmjAxmOcWyDsM1g5ikEiNpkeGUR
         lfx8gyfhxoA2XK3UElJ1+CBcrc9F3oTwUIPKbY/nVS0SvWRfJUtjL5BvrgdZI/PEGsL+
         8QHDDBbe0d6bSO95I6ZIpsGu9VUoTHcsJgYBq5HVwDJ1MGvMRGZFlgWNKHkh28sx3yAj
         G4Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rBQ6eBIX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f30-20020a05622a1a1e00b004236fb00c24si2045341qtb.674.2024.01.05.07.52.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:52:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rBQ6eBIX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmQj-0000a7-Dc; Fri, 05 Jan 2024 10:48:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPs-0005aA-Dk
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:47:26 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPp-00047R-Lx
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:47:22 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3368d1c7b23so1308992f8f.0
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469640; x=1705074440; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iQqVZQAplGXwt087ddAaGknca/07pmUL/gFu1d2+27U=;
 b=rBQ6eBIXuAdfLu0GR0eKsWS8Azq3u6wuQt/JBZFPQA+UTw1BKa/4aqxs2MlLyDkxHa
 Dmybi4K6P90/kCOiGPp2usL4/dwMPfcqH+zZrUDqv3EyikR2zLsQtZHQE3qbcDGAOmEa
 wPZKoWXBjmPDfeF6OMULLPtdOE8ukQJD5SuD+86lD1MMo17Fgj7aIHczzKJvC9Jr14WL
 jnYu6MaFy2xKM7Ur1xTqjl1flVigApzvxBjIEOCWe1GaOlid4kY9wYAi6XpqqOhpODW0
 qyE9bL84xhawbACVPZSv2pzucEcTBZyYN8JEHUn1LA/5cPTOtZmhjD/1VlzqX1o2xpgN
 wgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469640; x=1705074440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iQqVZQAplGXwt087ddAaGknca/07pmUL/gFu1d2+27U=;
 b=oXLPXTyxuo+2u2zp70I7Z45f2DqcSCu2rpXjn4hLZLFtl/Y27+T7mZY7rMnj/5irlG
 4t9Jc9q3kUBxn5wph716XHEc8A6lTdhHalP6XXA79QI3JBpKdRcU0LQIPaZPNCypfXCz
 1xMDuANldA6isC/q0LyN2Etz7ogOXYn9OdSZsX4sonSmyTA06uZuebaXOiKSd82iDRbO
 f2S1su+GWskPTeBR4808CDCSJ+uEO7jWfHehuaDmMWlq5PfUD80n/J9p/Nb75nKlc4xT
 uyakWNJ23sBeN13BmYcNnYo7wutDlWQBEfYz9DLQP6o+5d6aB4h8V7ZRrJAonseGnazd
 I2RA==
X-Gm-Message-State: AOJu0Yw2NM7Lwl7qkDPJTj7VjJPgRHwXR1uyBpR6k6MhZc2K1b99DLoF
 MqCcd++JnCaQbjAfb+ONw5MNquclnFBZnw==
X-Received: by 2002:adf:ed8c:0:b0:337:d82:5106 with SMTP id
 c12-20020adfed8c000000b003370d825106mr1218971wro.99.1704469639779; 
 Fri, 05 Jan 2024 07:47:19 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 k7-20020a5d6d47000000b0033725783839sm1605061wri.110.2024.01.05.07.47.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:47:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 38/71] hw/arm/bcm2836: Simplify use of 'reset-cbar' property
Date: Fri,  5 Jan 2024 16:42:31 +0100
Message-ID: <20240105154307.21385-39-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: iasVnc+D+DdE

bcm2836_realize() is called by

 - bcm2836_class_init() which sets:

    bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-a7")

 - bcm2837_class_init() which sets:

    bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-a53")

Both Cortex-A7 / A53 have the ARM_FEATURE_CBAR set. If it isn't,
then this is a programming error: use &error_abort.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20231123143813.42632-3-philmd@linaro.org>
---
 hw/arm/bcm2836.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 166dc896c0..a1bd1406e1 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -131,10 +131,8 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
         s->cpu[n].core.mp_affinity = (bc->clusterid << 8) | n;
 
         /* set periphbase/CBAR value for CPU-local registers */
-        if (!object_property_set_int(OBJECT(&s->cpu[n].core), "reset-cbar",
-                                     bc->peri_base, errp)) {
-            return;
-        }
+        object_property_set_int(OBJECT(&s->cpu[n].core), "reset-cbar",
+                                bc->peri_base, &error_abort);
 
         /* start powered off if not enabled */
         if (!object_property_set_bool(OBJECT(&s->cpu[n].core),
-- 
2.41.0

