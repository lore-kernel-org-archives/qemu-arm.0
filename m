Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp1088894njb;
        Wed, 12 Feb 2025 07:43:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW17qg+2Bkl0eHQZlD0NPwfR3LLDmL2At2cl8H8fLaQm4+Kgg862vstIjCdAwJswDSo2TOirMzpEiBgtA==@linaro.org
X-Google-Smtp-Source: AGHT+IFLJ8/1gnLhXOm3meIJriEAQGkEr7EGFEIbv8lC6aKSWSjH2zm0p4wEGJ+blNFFizWnb474
X-Received: by 2002:a05:622a:44a:b0:467:6901:7589 with SMTP id d75a77b69052e-471afe584dfmr59249561cf.29.1739375032767;
        Wed, 12 Feb 2025 07:43:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739375032; cv=none;
        d=google.com; s=arc-20240605;
        b=Rkxde8pd+ux6qjyuB5jbXxKTPQQNFMzuzBMTNfeAXz/w7eAZyYAJaAjRzjzJoHhdEm
         w9VVCmeS133Tjil5MMtx3VL7jb7iXiGWqnH6umbuHdoHAEZJf2whoyG1ybL0pCM6PkfC
         7dq+QJcfKRV1WUa6yTA4wnHpVQFjB0VnDh3ViF0ASBicGAo5KOiVx5AhIOMf/8FQp/kV
         4G2ULzXmQiyBJExmod15hBeZRnRyzleDibj0TMbpjrcsYhumaOC84d/jx2U2pbA4WQnC
         36iuPerD+eHLZyzhMuKlDGuhrlEbR/HapxY0tK0rUDXOuYT/+NfPmmnGoug2cqo3yq8v
         Bi0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UeIZFp/oTPSZTqhQVQuuyB79ED/0E39RbO6UofIGgaE=;
        fh=f6RcBh2b6hIRP8sbadAxOOIPUf9FhQhT4E2FhtzEhuc=;
        b=dC92bKL+WW+xMXRV8fUJmmhf2oq2rcjepf5ybQCLOYFhAccKDyZIbYTOwRZL+hbGY1
         COrWQ41oRxfAD/RGusauVgKiYjxcSjH006s++YPn32+a/8k6P9NCOIi/V/omZl69ZNhJ
         yRJecheGCdkWfRcw2mvBJQbDBtpDQ7ge2eHfGAhJI143zvp+638Wco6O2UDL9VWGHxNM
         366iZI9GVzkgCD5IX0Jcp+jDFPXacCG8FdV0D2Whnrpx8gV1qgGaDo5+FhFtTuuTa1go
         /i7fC9nyWa6sDEUzbjE8+0AHh3Ogz9+VeHONNaiGzpzOS9L8uBhOkt+rONSWo4Yhqqsy
         BnJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MemEiYgb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471bd608a5fsi2464721cf.665.2025.02.12.07.43.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 07:43:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MemEiYgb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiEtv-0004OC-QJ; Wed, 12 Feb 2025 10:43:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiEtu-0004Nk-4u
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 10:43:46 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiEtr-0006sC-GJ
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 10:43:45 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4395a06cf43so6272765e9.2
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 07:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739375020; x=1739979820; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UeIZFp/oTPSZTqhQVQuuyB79ED/0E39RbO6UofIGgaE=;
 b=MemEiYgbn7cz9bCXJgmJrLDGqBPFtCKQXZLXvDOeG1eZbz86R2qLw8gdVIZtbRD+pV
 2HqnPAEzVLHTyPajI7QdPU7rZwCvnGgOGQsOh4nwXx62NXlS89YH7yEDixXad5BEH6IB
 E4qgNIzRK9mprO8RoqzmW24l5/oWY3vGt2+rsKK/Zn97bzBOzhz/zstKNzCJxh2XAd/q
 3Rqwxvx2uScDCl3or8pDf2tstOlYnJnYvVCngvuRm4aS+aS5fA8uAXM9vuqtTpUqVsEF
 YQTBOIPDu5kO3WPYEHuLwJ17LVd5ilX83RMXnro8Hfe3YhRGkWz/QU7/1wYC4y76/NuM
 mmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739375020; x=1739979820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UeIZFp/oTPSZTqhQVQuuyB79ED/0E39RbO6UofIGgaE=;
 b=KCESfbkiyimpRoikovKlyJF1rsSEl5oEoIyMY89RvIJPYiZqj3/LsFq/qkhIbI4uVM
 WGiWpgNzbcE47eo6zZOg/rWcuJrTqmL95ExR3C2HJ8jDDhFgYtKiFsNBwc0WOpC1sBgM
 XBeYlkMJZiVGWN46he9M8cmWU5ftZpU4FE1fE9ZSrs7bCpJChyXmBDhznubmhMo3Z6VI
 vOXdLEKT2aAqOrYcNf9TtmgRqyNUmVFZ5/u76ZVsNsBg13UR+C7YtDrfxKf9dnHEu7Ez
 UsPtkMI2EPi+CrXbiAwMIWJe8Nk1qMNLwlfetP38tJ7CUeQbwtrZytx/MpUSQXZOmrq2
 vTjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNacMV/qAhX9Rx5k1WmDMTgxAW+V/0FvBwRHd/1Lf6R9t/AxiiYlTIBrQAomQHtwBT+fyLkMd9QA==@nongnu.org
X-Gm-Message-State: AOJu0YxyQuRtu8sWHxTnpDnoKW/e+Fe0U7MgBE3Tj7hNhFd3qFQpIjEa
 5fmGLpOWG7GmxMbIcGqzgNPunG47PeQM25xExxf+LK1/sJBQM9FG0rAZQ9qYHKU=
X-Gm-Gg: ASbGncsu7qCnLU7Cgce/dfDYc6OJqBQbumY255Oa7hO1xK/0XjsrOG12bRo/elqN2jE
 lqSC2a7623g5fOpEG2eITsBTAADe7qqkwnsvfPjt724N0VnjCnueg/0YpTIY4yxU1yL+CZY8tWJ
 ALzav9Pk0vw6/mmkagOs1JmONFDSIHNr6zSCpxrvWfDQtkO2loqtqwMcBspwnGeEW72XTx3Ipv7
 U2PJtWFJB+DTKsnh9Y4yXBVCUCOtNCDoMQv7praWRtK5x1fwcbv3BSQgYCyWpzpjlG6j9S+PUrW
 hZ9rygSOCF9geYAtVAz4VJeiwd8vJC+iKdGZvg5rHeRARBfasPpXp1kKsnsM6aopkRrviGU=
X-Received: by 2002:a05:600c:4f85:b0:439:4376:cc0 with SMTP id
 5b1f17b1804b1-439581ca7fcmr29685005e9.25.1739375020549; 
 Wed, 12 Feb 2025 07:43:40 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd8dee385sm10812262f8f.61.2025.02.12.07.43.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 07:43:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/8] hw/arm/exynos4210: Replace magic 32 by proper
 'GIC_INTERNAL' definition
Date: Wed, 12 Feb 2025 16:43:26 +0100
Message-ID: <20250212154333.28644-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212154333.28644-1-philmd@linaro.org>
References: <20250212154333.28644-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: RG/D5WJr5jRN

The 32 IRQ lines skipped are the GIC internal ones.
Use the GIC_INTERNAL definition for clarity.
No logical change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/exynos4210.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index dd0edc81d5c..b6537a2d64a 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -394,7 +394,8 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
         }
         if (irq_id) {
             qdev_connect_gpio_out(splitter, splitin,
-                                  qdev_get_gpio_in(extgicdev, irq_id - 32));
+                                  qdev_get_gpio_in(extgicdev,
+                                                   irq_id - GIC_INTERNAL));
         }
     }
     for (; n < EXYNOS4210_MAX_INT_COMBINER_IN_IRQ; n++) {
@@ -421,7 +422,8 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
             s->irq_table[n] = qdev_get_gpio_in(splitter, 0);
             qdev_connect_gpio_out(splitter, 0, qdev_get_gpio_in(intcdev, n));
             qdev_connect_gpio_out(splitter, 1,
-                                  qdev_get_gpio_in(extgicdev, irq_id - 32));
+                                  qdev_get_gpio_in(extgicdev,
+                                                   irq_id - GIC_INTERNAL));
         } else {
             s->irq_table[n] = qdev_get_gpio_in(intcdev, n);
         }
-- 
2.47.1

