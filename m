Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2807001njc;
        Tue, 5 Nov 2024 05:06:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUxaOh7MvUJ3EDIVD84FPpc1+MGc6AJR6OQfun3d+X6WgwFEXeb6u5GWQojI/NTvxblsj/9u0ck5RU1dg==@linaro.org
X-Google-Smtp-Source: AGHT+IHhDJilFQs+uh/hwsKyKMGnt5E5gAuWwBlqrG/bEVx6RSM1zyuRXPhkZb+8xwgQAiDWr5G3
X-Received: by 2002:a05:6214:5a0c:b0:6cc:8705:b5cf with SMTP id 6a1803df08f44-6d345fee6d4mr287398966d6.22.1730812009206;
        Tue, 05 Nov 2024 05:06:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730812009; cv=none;
        d=google.com; s=arc-20240605;
        b=b+/MZF/LpPPg+6B2vNqNH4Hq742N2/qmj6TxfCMGM5ZTR3mh/D5joYunA6xhqgEzSa
         l4/OY8gQinAgaJoMGLkunyinfMvk7IgYbX1qHfHv40fJqigYSe9ikEDoGEAV+4GBj06l
         hkx1i2U9BZRzM6W+quLhewbW1XR9QoGM+WmIaKq81ozw9Z7m1sjxZXMEEFknwpyH6J+a
         G2Hwi2/4ItUpPnLA3nLLAfQ+x4H9HJy1IE74BZ1oJvdSTnyWAZI3DnPJDY9nPJikfwnM
         ky35JLMzGsVj2pnJNlkMvF86X0CzAA9RYXnN/0ooK2+3BnfBWTkdM1QSk04tIww0znH3
         YoVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wFGgkm5n4LzlLdg21RwAQ7vz4q2WxQLn0Ned6IA69o0=;
        fh=lvN7wdWjMVnSaHqyIpqw4+OkyPb3JBGVq/K8XbGEnUA=;
        b=LK46uIRk5wCU9+6KOEN00NUloNesL25SHTIIc+eUEXZbfR3bS7fqfqkaieT9vSjynC
         Oe8ChJ4T5IIFFmcy7k4kTL4OpXmYO9QitFKPeU31Ya9kB43r82Wc5DZ72O5m7Ck5Qb3L
         sCS8PB48RkzaikVkEgFB/u5ET5k/Ex5KO+Ze9zTdCQ/oUsJDuwiGon9RpOVsIR+LNT1L
         77bVzFEWC+MsN5iieKSL2Sh2zT261n5UcVkBaEcCWrrTwfg67MagQqZ0nft3HnaUDSg+
         be2j6MSgSAdEMc3hyK8l3s5A9mQd+dz1yQoripdJBYhqn0NFtW5fW5v62OCYRkdfd/J1
         Hc0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qJ30FYtU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d35419b3f2si143728526d6.480.2024.11.05.05.06.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 05:06:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qJ30FYtU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8JGR-0005Fq-T2; Tue, 05 Nov 2024 08:06:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8JGQ-00057R-3f
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:06:30 -0500
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8JGO-0002bs-GE
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:06:29 -0500
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53b34ed38easo5303540e87.0
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 05:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730811986; x=1731416786; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wFGgkm5n4LzlLdg21RwAQ7vz4q2WxQLn0Ned6IA69o0=;
 b=qJ30FYtUzFL7E65u+UymvYD3rWqD31n/DVReb78dLiCq1KhYiD5mNN0KOcJKhUOard
 xqdpJVN0y5D3GViSXrdWvHPj5FXMb3sPEUZTdU2YBSAEzByseK8P2LZN7qaxCDwxBbUt
 9FzkwGh1pE+yR+yvXEvEUgoRClf+rnieUl6dOsyg3ayh1fEmjsCfN3YXVRgZa/5AZ1Vo
 83ek2w3Jl4tUu4Oe6onPAP7dSwrh3uwu9KexRViQfwCWc0K85EmOaijLM3ZrjlSnTbTy
 WTlUcXxOLtc8WjLq151n6OJK0wF1F2uUetO1RCiA9HfRgQJRg019lzmI2Qo5oKQrgspd
 glRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730811986; x=1731416786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wFGgkm5n4LzlLdg21RwAQ7vz4q2WxQLn0Ned6IA69o0=;
 b=cHGlsQQ6JmygfwPVgpLk9G7QbBHzC2LJZRb0HemVUWiRmAVX6Ik38+aoMR6KHCujUA
 Uf5VgUYW2385UHx1q+CMqdSwE6X5h+gTaadLLiGNUZZvQDIejz2oFzUk25r5YRabszlU
 GDuQmC5DTWlL3gtIHyWOAU4U3ZjN1xT9tj553NXhSZMyhR0PqBjHox106rgAMzzb7HQP
 Ej0042yWCQO/irgK5Hvno2FjfVqQ7dbxB6sGbXh5iuP3RlulZv9CecWMpg+9dEuF0jTc
 6ZKmqDIpQUuJHb+r9DkdXE9Fo9UJEG2hcnOTz7SUL/84rizBi1GyyZQkYaL7yDCUb09Z
 NewQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4kLMTxyjNcpiNecw6pJfO+AMdDIlKitn+RVZJVY0AfMuTI6dsyp/5IkTvwSbDcUR6fIyPbTMC4w==@nongnu.org
X-Gm-Message-State: AOJu0YwfPX7P0ude9XStCnNQmxpzRZT0BIsw98VlKx+hQUB4eWVcsBW+
 83qAH5IAV5ksIL3dSrzMt588ItxVoA1j1uP2FHKfT/F7kmvqsMTgtf6TyaMgo6M=
X-Received: by 2002:a05:6512:1152:b0:539:ee0d:2bb4 with SMTP id
 2adb3069b0e04-53b3491cb3cmr18858667e87.45.1730811986405; 
 Tue, 05 Nov 2024 05:06:26 -0800 (PST)
Received: from localhost.localdomain (86.red-88-29-160.dynamicip.rima-tde.net.
 [88.29.160.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c113e5e3sm16241441f8f.82.2024.11.05.05.06.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Nov 2024 05:06:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 11/19] hw/timer/xilinx_timer: Allow down to 8-bit memory access
Date: Tue,  5 Nov 2024 14:04:23 +0100
Message-ID: <20241105130431.22564-12-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241105130431.22564-1-philmd@linaro.org>
References: <20241105130431.22564-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12d.google.com
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
X-TUID: bOEd85EJQMVb

Allow down to 8-bit access, per the datasheet (reference added
in previous commit):

 "Timer Counter registers are accessed as one of the following types:
  • Byte (8 bits)
  • Half word (2 bytes)
  • Word (4 bytes)"

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/xilinx_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
index 3e272c8bb39..e9498fc7eec 100644
--- a/hw/timer/xilinx_timer.c
+++ b/hw/timer/xilinx_timer.c
@@ -201,7 +201,7 @@ static const MemoryRegionOps timer_ops = {
         .max_access_size = 4,
     },
     .valid = {
-        .min_access_size = 4,
+        .min_access_size = 1,
         .max_access_size = 4,
     },
 };
-- 
2.45.2

