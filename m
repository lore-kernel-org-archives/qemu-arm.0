Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1939712ejc;
        Mon, 30 Oct 2023 08:16:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8ZcA0h9x5eS5wHi3RNgSzLm89/KuzcX/CoslOWDrZ2WKhjZOV9/WmaVhqkmXuY5gjqUIJ
X-Received: by 2002:a05:6358:e497:b0:168:e887:2646 with SMTP id by23-20020a056358e49700b00168e8872646mr11880005rwb.29.1698678998435;
        Mon, 30 Oct 2023 08:16:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698678998; cv=none;
        d=google.com; s=arc-20160816;
        b=DttXHjz04LseY30/IcSFpsBsNOn1WPHKwQ9iGnSoAJHvZTGCLUthrchrruEGW57Ihf
         XY/2U6SK6TyNUyc4/d3TjEonrkbZOgkA4daHzQkCpvlFXVyk7PgXr7zVU0AY7fikakX9
         sccQ1KZtoz9SMQf5fxO4/UqBpr2M/tpt198cd7lEKIqKbbjKoXct1zk9VKPk3PZjne9s
         MFfjOVWp4EhQ3Xn1Hwrt8mmA6nuqKW0/WaQwd1SxqAz4OC3pa93EqZQKC5utT/r5jA7l
         MGvbstnRujbZ7lw69+4nWV0VqHOi9u44iCSQUIzPeBmj/nYjWvHFSwVrg5CWNEh+v6o6
         PJxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1wzlyeAffKIVPpofvyyI/nktGGQtprwS66d1BSP8mFU=;
        fh=aCejG00mBFvUFyicGgwZuyWNmnQkTwZFkToSNY6Vt+0=;
        b=gXCCf6hXQP4L1LBQf1oXLGiu/n4sL8maVl2FqU76TFnBzNPoCI/AqH3LaJ4IQv+ihm
         DowehboOIQ9Vaq9ZtZ8c383N4oEAWpP7g8WGUxme1R17Xeq6W4nUVoMJTbx9JUVnFpL9
         Hcm1Dq+Xrkgu4INAu1DrbKncCCWumJ00S2Z2iaB8RI+lqzGiwAOlwpM7uNBHx33aChti
         vBttju92OeYbUuYBnb3LlCgPwfQqnY0Z086Pcr1pZGhO+yPE2asnznoEF9aDBcNmjknn
         QCiMP+db6FfJm1kkmfFcSMn4emqdqx404ArC4FJQaaa2cN7ewfUx58SjOlP8wZ0NQhLC
         TV0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rt-labs-com.20230601.gappssmtp.com header.s=20230601 header.b=M1iyU99I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rt-labs.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu7-20020ad45cc7000000b006561f4b120asi6389549qvb.52.2023.10.30.08.16.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 08:16:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rt-labs-com.20230601.gappssmtp.com header.s=20230601 header.b=M1iyU99I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rt-labs.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxTzs-0002od-Hi; Mon, 30 Oct 2023 11:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hans-erik.floryd@rt-labs.com>)
 id 1qxTzp-0002gs-6S
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 11:16:05 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hans-erik.floryd@rt-labs.com>)
 id 1qxTzl-0002w2-OE
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 11:16:04 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c54c8934abso64767241fa.0
 for <qemu-arm@nongnu.org>; Mon, 30 Oct 2023 08:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rt-labs-com.20230601.gappssmtp.com; s=20230601; t=1698678956; x=1699283756;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1wzlyeAffKIVPpofvyyI/nktGGQtprwS66d1BSP8mFU=;
 b=M1iyU99ILxKIerB97LwhXffQUWHj5UG/op0Ufhz18Z7vFY1YYL0J58Q8ZpcmoUZarG
 jYjAEOsRoxWA/qj2PymPn11H78l1XeGItPwgfcd5Rno7+BA8WaY15jy6lESexomebJ1o
 DJdGDjnv3hQ3qL/UnshvUreX3ATFmB4NFqU9/h1gagcos6VT4vswSWVH9j2AFIJZVp0j
 uLWXIzCQEFfBEHaSTkTK3V98/ilpTsd5WNJ5aqID1uMu/A39u2Argh2uejsjybZW+pb2
 dnJw7JWwpVW9jgsmKYoAAPjP+vZrKbvOP4I5df6xzNaKzOmNueszLxdBYFB23qtJQ9WO
 DiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698678956; x=1699283756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1wzlyeAffKIVPpofvyyI/nktGGQtprwS66d1BSP8mFU=;
 b=LMXszl0SnydMX//8EdbCCO5HCVVHBBNW8EL/a/ChyvDDYS7+hDD9ZZceMNbbUu65iz
 Nwk+X9ZIsQi61TjxYYAPDqvgFbwaO8t79k5OIml6t8SOypsO5kNusZkB6g1eO+zc2viF
 P4ApuAYGxGFE3m6ruw+PFBnjjihbMiP6W2o+qeR7Pa8nDvjrAOfpxj3RL1oZKLDMxMxx
 92jU7Ln5pwX3ZuL0cO7rYn993nonfl2ivajaR5RL0QPyzkKWLiDGl2+pOAMN1FAqhKuK
 SQRts0QKFMypP8O62TW+gisHwAOMFwPlr7sLXhjojcLkcOBvTUnpzGKeRxLuLv5qDnuO
 6rIA==
X-Gm-Message-State: AOJu0YwH+MexUgB4j0HSiNJgOB2jwQh88iVoyQHb8d2PqLNrU5fdSYPV
 7yki8t8KweyVbitpfLPNfbbRDg==
X-Received: by 2002:a05:651c:1c5:b0:2c5:175f:6466 with SMTP id
 d5-20020a05651c01c500b002c5175f6466mr9054675ljn.34.1698678956328; 
 Mon, 30 Oct 2023 08:15:56 -0700 (PDT)
Received: from rtlap47.intra.rt-labs.com (h-213-136-33-86.NA.cust.bahnhof.se.
 [213.136.33.86]) by smtp.gmail.com with ESMTPSA id
 j18-20020a2e3c12000000b002b95eb96ab7sm1282274lja.18.2023.10.30.08.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 08:15:55 -0700 (PDT)
From: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
To: alistair@alistair23.me, peter.maydell@linaro.org,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, philmd@linaro.org
Cc: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 3/3] hw/char/stm32f2xx_usart: Add more definitions for CR1
 register
Date: Mon, 30 Oct 2023 16:15:18 +0100
Message-ID: <20231030151528.1138131-4-hans-erik.floryd@rt-labs.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231030151528.1138131-1-hans-erik.floryd@rt-labs.com>
References: <20231030151528.1138131-1-hans-erik.floryd@rt-labs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=hans-erik.floryd@rt-labs.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: gpTHgwl+sFxR

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
---
 include/hw/char/stm32f2xx_usart.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/hw/char/stm32f2xx_usart.h b/include/hw/char/stm32f2xx_usart.h
index 65bcc85470..fdfa7424a7 100644
--- a/include/hw/char/stm32f2xx_usart.h
+++ b/include/hw/char/stm32f2xx_usart.h
@@ -48,10 +48,12 @@
 #define USART_SR_TC   (1 << 6)
 #define USART_SR_RXNE (1 << 5)
 
-#define USART_CR1_UE  (1 << 13)
-#define USART_CR1_RXNEIE  (1 << 5)
-#define USART_CR1_TE  (1 << 3)
-#define USART_CR1_RE  (1 << 2)
+#define USART_CR1_UE     (1 << 13)
+#define USART_CR1_TXEIE  (1 << 7)
+#define USART_CR1_TCEIE  (1 << 6)
+#define USART_CR1_RXNEIE (1 << 5)
+#define USART_CR1_TE     (1 << 3)
+#define USART_CR1_RE     (1 << 2)
 
 #define TYPE_STM32F2XX_USART "stm32f2xx-usart"
 OBJECT_DECLARE_SIMPLE_TYPE(STM32F2XXUsartState, STM32F2XX_USART)
-- 
2.42.0

