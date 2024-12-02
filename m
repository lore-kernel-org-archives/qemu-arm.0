Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802428njk;
        Mon, 2 Dec 2024 05:14:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXxwcKtQsfS27XuZFmsL+85bvA6LV9GxMGC/K6i/SQTi62c0ayZPwEBJCZQj1QQPhvP37eybYVGV/H/yQ==@linaro.org
X-Received: by 2002:a05:600c:4e8b:b0:434:a59c:43c6 with SMTP id 5b1f17b1804b1-434a9df6a99mr182280305e9.26.1733145285708;
        Mon, 02 Dec 2024 05:14:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145285; cv=none;
        d=google.com; s=arc-20240605;
        b=HV8s2FREJz3qMXdThA/hmTrsDX/+lacMp+NvCthnUxOkcqk5ty9jNPntypQx895sSf
         Tzgt/6SviaFoKbpHbllFGmdl0/1mt0Jk13AM2skiO2+/aeopp1HYFUn/wXiKUeUowd8x
         WvbNm3j3znesfKULE2CKnHSxWyCRrVQyRsInBtjKRwXLwYt+LIGskMqU5f4KQLUtHuE0
         skMxdeZkLlj69+lXWVMkcblft8YWSOs3HEDHxvx0N4a2R2Gb7TrR18Bv472WfeK4ay6m
         aYcHd6DuVGPnhcgeKAWtNX4aSyfJu9Dte7GwqN8rCyGdP9XdjMQ3ECaqwQ+5Jrh86woK
         Usxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6b67TuxIIuUbvFPYapA8HgByL1UEo/kP+YGdKuHFudM=;
        fh=bMeWJYSj8Kekm4b2SOyITqdjdw6PKvolh8vwrC1FPVE=;
        b=V5OOfu6/AI15YFZPkGNFln8VSfcF93j0oG8j+Lq6Gun0/m+IhoBrwz1uPjNCl85Bvs
         CiIa8c1aFjWJ8T6wHdlRm9jjtYCtHhm/jeK37SFGY3wFk9UkdfjfOOGt/yPiHlLhkLEp
         dNE8swjqUF4U5Nf2gGovugkq0iHrG8hqjbyfulPloC3qmD+fpfkdG0r36VcrpQc/Nkqa
         B0BibjDFa9oOl7PfdtIp8CV9B/N/pT/7NaCM2+WdpHoEWe1oBMC5YCNNeuwLY1vRzSoX
         RTtWgJvrmSKZGATlUbh0HzVdY+OXMDuMRFXYZzeeT4Ydnh8sap3EI3QnOHbmMfuXNnhw
         DlOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=imvrlRWH;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b105662asor32305565e9.6.2024.12.02.05.14.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:45 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=imvrlRWH;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145285; x=1733750085; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6b67TuxIIuUbvFPYapA8HgByL1UEo/kP+YGdKuHFudM=;
        b=imvrlRWH03uw9w9k37nPhzFawlmMGCHsNFmiWSlE+ZAtrFz9WW98I4HgFy7ynbAIMK
         3xc5bfc7UlFNPyRPIVBNOe2P5U7piv9WWF5ZZO+q7LB47FPDwGHNK3DOlR0bZnc/lIKW
         4nU7Wj4sAFFYPEwuxfBM2dl9YN9TR9EKvcpKKN0AXNzJ6ZMPHYmunx9T2lul9aZrhLRq
         Rb+oLh6LzXrk+UEzcjGnYM8iFGlIj/24zT81cyjNPboRJc/QXXmWTmz1oluRZdYALBf3
         ceLOuBgI0MkINgfntBJpe93Tug5DcbK/zU31zIfeZsdbd6wnsehBVhlplYfjIL9UxenD
         mAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145285; x=1733750085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6b67TuxIIuUbvFPYapA8HgByL1UEo/kP+YGdKuHFudM=;
        b=FVc6+BCvP/kvfvHxtJLjAFBzTCgi5UKYU2669T+Y1A5hQCx4jWAXXE4ONfNn+Sx1ct
         Xw/G+dVpPkJqwRfuGjipNLPAwGXo1cwTG4w7CSvGt5B9sUt4EHJ3WFTkA6mayPobc9q1
         ZYOW3JOV4JtqTXOm4QxoIm2i8vw6lBKhCnnNXcAm6b9dZ7lWXar2wg7NDZpxzxZCvuWm
         wW9DICLe7uIejSHPF6qxlt+rKCuxka8g+67GpiljB9e21FZbQzqXXCQ2ohj4wZ8TDSaq
         S7xU5QsfweNifnU1UuRt2kexA4cpSpwrX42clMbuvYRhKWRVoMNxXqZbZhFJaZBmVfUq
         IHjg==
X-Forwarded-Encrypted: i=1; AJvYcCUHlpytVOFsUBhKWfxy1QEL6GJkvXf/L669Qx/Lcb/pGTS0aCed5yDEb15VKw0h1MftAqZe2o6z3lJL6A==@linaro.org
X-Gm-Message-State: AOJu0YwBK44HSqIHk3sp38jWFVulKJPdhPz3ESYi1gLsC/tg/QRkCILw
	rYyFMwNqolijzz+4ZJpXINE/NljQXtWiJKft0cqKNG7aevTzhHx+67k9dfr4141E2g==
X-Gm-Gg: ASbGncuZbHdQ95ydHojClYbZwvoqSJZWIkI9D27PeXiMAs+s6URQnh9aQ249Qe9bw1P
	ceh5g4ATRWy54oVlQVE35gNsvzwCXBIMv24liFe/XojiX2K5cqO0hX3H4R1Zj5zDVJQSFcvz6TY
	HAy7h2uu4DmdjKE2QBBEv2C17+4rOg8afgqd2VPVExp+NfgL3USF3OqaZl45/zuZam/JkD9zxH3
	HMD2Bv75ZQzkUSwYH3Ofzh78PvPDfrPuObv471XxY3+BFkO35Ank+8=
X-Google-Smtp-Source: AGHT+IFPP/69/o/8stugJpVepC120rwI93xT8a4bCLYkdFLQeip4Au1UHJnxnRoTijQt5ciXEuHfUA==
X-Received: by 2002:a05:6000:186f:b0:382:319f:3abd with SMTP id ffacd0b85a97d-385c6edd338mr21552950f8f.36.1733145285219;
        Mon, 02 Dec 2024 05:14:45 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 for-10.0 39/54] target/alpha: Set default NaN pattern explicitly
Date: Mon,  2 Dec 2024 13:13:32 +0000
Message-Id: <20241202131347.498124-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 2lauW1pAiDZf

Set the default NaN pattern explicitly for the alpha target.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/alpha/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 5d75c941f7a..70f67e6fd4e 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -199,6 +199,8 @@ static void alpha_cpu_initfn(Object *obj)
      * operand in Fa. That is float_2nan_prop_ba.
      */
     set_float_2nan_prop_rule(float_2nan_prop_x87, &env->fp_status);
+    /* Default NaN: sign bit clear, msb frac bit set */
+    set_float_default_nan_pattern(0b01000000, &env->fp_status);
 #if defined(CONFIG_USER_ONLY)
     env->flags = ENV_FLAG_PS_USER | ENV_FLAG_FEN;
     cpu_alpha_store_fpcr(env, (uint64_t)(FPCR_INVD | FPCR_DZED | FPCR_OVFD
-- 
2.34.1
