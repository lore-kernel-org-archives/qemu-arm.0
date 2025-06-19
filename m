Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp252522njc;
        Thu, 19 Jun 2025 06:13:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXEXMz+Fmlc5e9sakmPSxA2xL9qQCfLGonLJm58ET7Sp4O+zixzrurr/D81EG2CydVeVDaL4EkfVFzVFA==@linaro.org
X-Received: by 2002:a05:600c:444f:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-45345f1cf67mr178332795e9.30.1750338814446;
        Thu, 19 Jun 2025 06:13:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750338814; cv=none;
        d=google.com; s=arc-20240605;
        b=NACXardUV7m2pk5Y7UyR+jj36wyXRhPZvHr+IkLNNskN79ftRFtoxN6+dALDtK0WdF
         N4XHIrEqV28QNgAh3va+vxMlw2Lhnd5g8ZVyj3Y6ZjSUUB1u3OFlAZNge/04BlUb8Ljg
         KDsSXyhB9h6nxGi5lLC/fQYw6LK/YreRT2/Hxz8/krV4telSWXPNT/LHLaMdYQPJGu4J
         hVVJ14XdLdMEnGF5fIt6XR1+uTOcILY7V9Z6Mq4med+RlShKHY+puW+9agZw/6Pi15at
         hYC9H3gxD8DpvFxDzw1PYKOJ8/mEo4qwWyQ/JZEpBRsD9+nhGLVE+z9ddK4uTvHfWsPF
         XlRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=njVumrb22osQKhmYAguxSrlkLoqT+wPkHlSnrsTIoAI=;
        fh=Z58bF/y0hntKG4ckcNeYmQK+RqNDlLZ4YOBESQTWz78=;
        b=XSCupoga6obwBk7LHd5cJkjD5w143Waueqk2bEVpu6VhrGMkFGjnxlbv4dDjC/07BV
         TGi2gxKcrsUvhXhQ304WCVjpulIltflx6RE+C/b3hKZHc72F6qp8iqFe4FfiDMLVJLzI
         gW1yogbckwFa9EExGo5qGcBIeMyA1BcMBMXovRPicAK6FsQEyf3VzXQ4Bjc6LAs6ovpp
         edLkY4zY+SXyzed18ZoU3wTNpVKfWBTCPmQMkXjrZK/+pm1rSmROd3345X+QQ2/PNn9v
         n/F+uJfmV6lvJgai6s6J/xHSW/A8t71qodRopG56NtMa+kn+hk3nGBC5oMe8wyKzzIQC
         oP1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uXE9+74v;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a5619d9df9sor6089527f8f.4.2025.06.19.06.13.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 06:13:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uXE9+74v;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750338814; x=1750943614; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njVumrb22osQKhmYAguxSrlkLoqT+wPkHlSnrsTIoAI=;
        b=uXE9+74vqgmnzf0UNVl1PH3Hu2gYrHbY4ENe5+xxV/Y8415Hv13aTVvp9Ik0YDNYEA
         SMtcES32jMQouXMi0AulYpKSw9vPnJg19P4yryxuWSxtfIORH5nGDvqcXVkgy3kDoWL9
         SmYmE5wTwklq5NSMTf8TZaElwfW5D9vjb/UyBUsKnteK0M4JkAlVXIK4CVCD3TYNGZzg
         onsfG83cVw1JaFvci2Ryi/Z6iDMfYaINBns0MV/qynfTONJT5JfF0s/o1Z/VKNklPTgf
         mdkBcTTimKvGxK0aq/mmGKNosnC0KMZJ/mrlY8HUqwGM8SeD85Gyp/FgIs2ZcDNMemuK
         yFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338814; x=1750943614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=njVumrb22osQKhmYAguxSrlkLoqT+wPkHlSnrsTIoAI=;
        b=aH10hNIkl07hwdKd0oCzWjrJNUgUo7cIG/eJk7gtdqgydbrTbvQtYulmElB6ik1rVi
         l+P+ofJeygJx5qk/Q/YhUc8I6EoeVQPyo5LpHi2HDt9s9zbbigq5RDwWrn5v5gHIp0oC
         KqjCwauMfmzq6by5qDf+ytHUt2UONt0QYKMf/FsFqWa4dMqo/MslzrYSPaFBvVurrvat
         eaBmvcWwtCRXnMzIQUqWlfp4pW6zLwV1BmqgCNA3wX6CONcKA8re25xS5vwNoSoC6cF6
         UTVYHOIOUJ7DB/9YPJ0zw70jRZH+npW+2VBLTyl4gtVYHNqRZwUG9QsHILhcQrQBMt1k
         3tYg==
X-Forwarded-Encrypted: i=1; AJvYcCWhz2hOCln8lNvFRenQvM7sSFPwOHKKJ1jle+OL39NGVPYOF4hINOtkPrYmd+UUwGCeHvGFgtqWw4e+fg==@linaro.org
X-Gm-Message-State: AOJu0YwQmosDzaZQ5PzTwuSupT8xnwqy5BUy5YtXsrQfe7HpcynXpg9A
	oHlCxoANqwpTRiP82sqZLv/lMB8G/NvGB/gKI6KbXkuTIkFGpOkUYnFhD3mYkmKEtKVLAw==
X-Gm-Gg: ASbGncspO49uJHq8N4NL8B4uNckBZn4RgCHKK9IOQb/tAg52j8wIu926zN9OaKiamCu
	DDYryieTdo0Ks8nixcLPMWOhYFos70WAvGJGfrWvMInC7EC7Rj/83086V5bsBZTKP+weK+m3NOp
	Q8fGcH+dim7Elcw4sg4hIv0mnLfTGGS1hdkP8WRlXpyuKMEOtHbvXd82T5r/Ku2brpkoJFCy0zK
	jssxbY3JClViHwv+YgCd18HaBa04Ji/sP4WhQjyqR5s0inXbYnJEwIhYBNxfDKlHtEUmbn7Ft27
	PRqgxEq0HrvXi8TQb8Adlf4xL+72ebODc1yo0thO3Ow2F+lpkZse93Xo1Zqkyco8qORAG2pJzSO
	LkCKHqZ3MfFkH4DpBnpykAFm270x/mN7YmGJm
X-Google-Smtp-Source: AGHT+IGHJFjSXSFKOe1Y20YU1PJNu67FjETa65TJxweZU1CKSra6h9mGTRAvKIyXP6ctcKvZdSxHTA==
X-Received: by 2002:a05:6000:3112:b0:3a4:e480:b5df with SMTP id ffacd0b85a97d-3a572e79749mr18776507f8f.44.1750338813836;
        Thu, 19 Jun 2025 06:13:33 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536366326fsm2312615e9.38.2025.06.19.06.13.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 06:13:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Julian Armistead <julian.armistead@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Alexander Graf <agraf@csgraf.de>
Subject: [PATCH 02/20] target/arm: Reduce arm_cpu_post_init() declaration scope
Date: Thu, 19 Jun 2025 15:13:01 +0200
Message-ID: <20250619131319.47301-3-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619131319.47301-1-philmd@linaro.org>
References: <20250619131319.47301-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GBGQmkeBqdCI

arm_cpu_post_init() is only used within the same file unit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h | 2 --
 target/arm/cpu.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 302c24e2324..c31f69912b8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1150,8 +1150,6 @@ void arm_gt_sel2vtimer_cb(void *opaque);
 unsigned int gt_cntfrq_period_ns(ARMCPU *cpu);
 void gt_rme_post_el_change(ARMCPU *cpu, void *opaque);
 
-void arm_cpu_post_init(Object *obj);
-
 #define ARM_AFF0_SHIFT 0
 #define ARM_AFF0_MASK  (0xFFULL << ARM_AFF0_SHIFT)
 #define ARM_AFF1_SHIFT 8
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e025e241eda..eb0639de719 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1713,7 +1713,7 @@ static void arm_cpu_propagate_feature_implications(ARMCPU *cpu)
     }
 }
 
-void arm_cpu_post_init(Object *obj)
+static void arm_cpu_post_init(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
-- 
2.49.0
