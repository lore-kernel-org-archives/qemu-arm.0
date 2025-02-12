Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp932081njb;
        Wed, 12 Feb 2025 03:41:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXgdpR49BywDHEz5fzHeKCYe7cB2pnutGncRd6ZpUxxGmO1Hzt2zHeNoZoxExMFVTALYFu4r3Qk1mlQyA==@linaro.org
X-Google-Smtp-Source: AGHT+IG9BlK42wIm81RQ6+vMIo7xkViBZbpl5t3z9/Qvtl5dNsRRXviCK+AtTYJfTv/23xrB0kVP
X-Received: by 2002:a05:6000:2cc:b0:38d:ed9b:5183 with SMTP id ffacd0b85a97d-38ded9b51eamr2251463f8f.40.1739360464960;
        Wed, 12 Feb 2025 03:41:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739360464; cv=none;
        d=google.com; s=arc-20240605;
        b=AA49BrWwiykYK8eSXAEFGQ/+R9go1KFOd9qnT/0tCHmhMpKlGBoX9sCn/CM28kdJzM
         6POs6r77Bjy/DBVQufBxPPZWnm9ojuG3KnZm53GN3kiL+k398bJqwIVGDcmhETmh+tvw
         kZ77IjyTHgc55kUGu1kmsBQua5wzY8XnuK/Smm+TC7wdN5Q7cLFO8qbQ4FKTY195GzAd
         J9LskEtd/VJ44Is8IDlRob962aC6NF1skjXaLKa6gqV2apEe2ViKlTY6j13BkZW78iEt
         gJGwPr4YH5o3mb8Y/JzrBCbko3w2Xl3HFtPmzS4K2yUJR3zE7WIPqf0dUoX0Xyr+5p3+
         4K4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mrLx9pNp+bcF8pLwNwFLoW2tChA85mu49fL7NOiZcbE=;
        fh=BfK1I5AwCEOANK6jpw7Xxu0S7PhAtlukyobtcCC5ZcY=;
        b=Cv+kV7MYagmpS28/5L10pfycPIv7vI7NedeHkPBYg5WxfUOy4UfjM4Ebxy53k9Awi8
         IrbZ/L5AbiiQDqAgn7t0jO3vexYLt7l7RXD7vvxHEqDl1M8z9Ohoob/5aqF7IGLPEeFX
         n9+2M5r/UcaH5laqstwNNBKCvbK1/zGJNjE8aXHzMwCdDKSrKLEoqdrPZ8cNoVcDg0cN
         CAfqGnYB4zmW4rZsbihiNUq8WnW5whGBN9pZS8ZVoaHzWLkOnCJa6GEHyuxfV0fI7sRa
         EUGO2ESmcW7FFrSB3985X1cqTYSNRGbdcDhUCFfv3PxlTWX470YKa3gUyGyBjEoweCPi
         0uPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ztBtrTrA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38dd037dcbfsi6926386f8f.517.2025.02.12.03.41.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 03:41:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ztBtrTrA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiB6J-0002RI-8Q; Wed, 12 Feb 2025 06:40:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiB6C-0002P9-58
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:40:12 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiB69-0000tA-Qa
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:40:11 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so24344265e9.3
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 03:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739360405; x=1739965205; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mrLx9pNp+bcF8pLwNwFLoW2tChA85mu49fL7NOiZcbE=;
 b=ztBtrTrAWdqQeqFFfExL47NvaOhvJ7JzKIs5VJJGEGvhT11fMGMigzYR67qqPQ5ZHw
 bIo5l5nsK5wRoLXfxaR/gVNgOfUbcyOSHo+kJ0jkdAbCVKm8tuFphqTom70YhB7Ya1ZX
 aCkyz5VCtIe7C3Cwgu4gZovfIAtMI1tGAUcx9RnX2DjaHkF1Zxju+AwFLuigFHwJw9H+
 zJmmsizmszYHMPhYyEhVeuBLNR/JKyfjZAhCjTNpGzH+MwimheeIsV2RovD8lWJMtXqr
 zbtk4FV2GH+RKu2CtY29hVVWlRuIlQLUkJhe25dHq3hgJX5n/OPBGeS+PT05fk0+w1Tr
 MZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739360405; x=1739965205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mrLx9pNp+bcF8pLwNwFLoW2tChA85mu49fL7NOiZcbE=;
 b=q7hdkeQd84H2/XKKDybVzS9/7L1MRc8ifXf+Uy/VdKqt93IGhtwffMR6mmmQ2b2LFo
 AOnJu2ShGS7A6zkq3ofL/nq14j5+LHppzh7MTcW55lIBpdjNPfGA4reMqvIxnOgjxc2u
 hrLBRfA082wdt96RhyoR3/VHnHZ+A/U6qyNiU3dZrotMt5dJ/USu8YZaT6SQ/tKyzOVF
 8VvGSa0jOQ1QNmslgkWdwn7O11EVDYmr9XOT9QcMVwzSxUAxkTMQJt5MTfbC0+YCNIXW
 wiQN74i1/hCvdCGSBVN/c29P/hUNCmbZeu/ANC3WaBLAYlzVDTJ5hbYdwdAt/Zt6+gUy
 6CBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq7ShZSSOkiO+hRBVswcogAbEduoF1SKdrPwY5VpZXbrVN66TIufaqPdlmzO3bGp/XwSYzvJ7Rzw==@nongnu.org
X-Gm-Message-State: AOJu0Yy0eOHeUFldaw7A6sm6+oTNQ3aoQnVo8ZWD1K7xpfIWxblC4Y5r
 mIUohicoBtYjZglZzTREvMuuCRxi0KKh0AMaDEJOhk3ScOjlDQhKwcIx9NL5R54=
X-Gm-Gg: ASbGncu5Cus6U+n0/zGR9SsQ80hwsoI4ZMYeeigjlxaFHNns66tfpxtTV2Y4A2VYrv5
 7y1neN7fAO3qPgdKUCuQ0VPClqi1m5rlRnsuhlR5Mf7E8Oqt//e9EEYuuJfLx+FEIJU/viAl9He
 kcmykgKMmAz2+yF0t7wo7ZgZYluIleTIZBjAR6OxFvlPzbXgaVeDNRTal1cO4G0JsuPOF+ADHVZ
 GRx0ubQcnXvzWBjI8HVMMHYKUXhA5tF0ium2IHf7c+ixsRpzjjTC9m2xA/Ju1kL90QUPFNy8xN8
 I0Ajpa3K3kfqwD1yamOxxkBuA7DSg+wX2qCCLQmTBtx9xwXzuiNDtsB5e5L1mxOpKg==
X-Received: by 2002:a05:600c:1548:b0:436:1b08:4c78 with SMTP id
 5b1f17b1804b1-43959a997a5mr21481265e9.31.1739360404731; 
 Wed, 12 Feb 2025 03:40:04 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc3a10fffsm16386020f8f.12.2025.02.12.03.40.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 03:40:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Burton <paulburton@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jason Wang <jasowang@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: [PATCH 5/5] target/i386: Mark WHPX APIC region as little-endian
Date: Wed, 12 Feb 2025 12:39:38 +0100
Message-ID: <20250212113938.38692-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212113938.38692-1-philmd@linaro.org>
References: <20250212113938.38692-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: NVPFP1NDz5wv

This device is only used by the x86 targets, which are only
built as little-endian. Therefore the DEVICE_NATIVE_ENDIAN
definition expand to DEVICE_LITTLE_ENDIAN (besides, the
DEVICE_BIG_ENDIAN case isn't tested). Simplify directly
using DEVICE_LITTLE_ENDIAN.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/whpx/whpx-apic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/whpx/whpx-apic.c b/target/i386/whpx/whpx-apic.c
index 4245ab68a27..630a9616d71 100644
--- a/target/i386/whpx/whpx-apic.c
+++ b/target/i386/whpx/whpx-apic.c
@@ -231,7 +231,7 @@ static void whpx_apic_mem_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps whpx_apic_io_ops = {
     .read = whpx_apic_mem_read,
     .write = whpx_apic_mem_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void whpx_apic_reset(APICCommonState *s)
-- 
2.47.1

