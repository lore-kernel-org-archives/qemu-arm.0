Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp22954njm;
        Mon, 28 Apr 2025 22:00:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOtZInh+d9OdqfyKRYHd0LXX0jV+huUzHjyUUi14LuPyQw3qwE/D3dUz/DuRBnZcpUOyJlLD+j3Tf92A==@linaro.org
X-Received: by 2002:a17:90b:5450:b0:2fe:b735:87da with SMTP id 98e67ed59e1d1-30a23d0ac79mr2547264a91.0.1745902822943;
        Mon, 28 Apr 2025 22:00:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745902822; cv=none;
        d=google.com; s=arc-20240605;
        b=aslKCsVynEiuJ1Yw0PAzkCwG4CqaaAWD+u2S23AVtVDfkClq/ks4tnqco5IFR6+N3B
         KqpsgA/W9ff6nOORWOIZarCk3aPIHWVMgtaUorGQd9FK1QrILdoIouzlIlyJsVbvAbSJ
         OgTQtAwjNpmwk7rdqK6dd2pG2rT21RRQHTH61MBLslf0wqvJSYTy3ePrvTRV/XxMLkJy
         lnMFxxc/eN7ereX3H7z/A2gN0BuLOM6QzCNkNu+6Y7r1PXCTdjXozyr76VLnsRY+m5vN
         jLd2v8jsUw43YgUNJgRG0avfe512VqwEeOh9lTCPx7lIX65zrIk+Ub1eas9jBCdBkA6t
         BocQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=amXX/THKLt9of3i5C6GzRyhvwR1vAr6wdZGYECnCXXM=;
        fh=+7BOBDm/5vpZTHANmLMUSxljR8leRqfKBXvl1PiE0IM=;
        b=KrYYmn0PgkA8is6+HUH90eP1Tgr3kk9+d5w+rg8t7dEEguhMKIkfRhMC08pb0Z5Gwe
         Jaz9unaJMU4hyq6I03YYd1vHB4rI2VonaJltS0Q5WGaitWv/0yQYJBLqHDkWcxfN5wZM
         2DwuhOi18y/5+dd3vEplEH+TwhbodOxqXUDG0Bgyvb561hvC5Hsyf/cKzeF9csO/NHRC
         k7sVaAryhKaTjvxDNMTRTChVvNUZ1LsaJcroZKkxyW1BEfp6pMExEgc1LpvsxNVl2ui2
         q6rLEXjhd6TnvjpJNd3kIUpCzoaLAlwOh7r4rqKjn5TqrMYGECEFRTRNnPfpgU3qdj8o
         ahFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wT06XyRl;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4deca8asor89229315ad.5.2025.04.28.22.00.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Apr 2025 22:00:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wT06XyRl;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745902822; x=1746507622; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amXX/THKLt9of3i5C6GzRyhvwR1vAr6wdZGYECnCXXM=;
        b=wT06XyRl304HVVc4E/AecZY3BMykFHF4R0GIkGK2U0qpzRCMt2qw7oA+AUc/HVgIaY
         cb7o0fOSYNYIcHWqIJKjwpUiZpMuJypV3T4yyCTvjNEKIlxiAIm8MZbSn6fLQgN8xZoh
         7oZBLmd9MQ1LH+/uB9fPsp5h3IbEb+R4Tx6ZEnnqpLdoC6hEI/RJMvmA0KYANOlEB/dl
         DdibpBEfwgRniwYU/am80EHAsE4ig3NUgfPzX8JY/BDXllSuDzdxX8iaeM6+PUmUFYJx
         MXkInjnAOU5lATanfDXmIAS7/ay2IRM632V2wFVyLJae4LMjmWc/1o+3UEFW4uFrp223
         luQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745902822; x=1746507622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amXX/THKLt9of3i5C6GzRyhvwR1vAr6wdZGYECnCXXM=;
        b=rrHvZenjM5jr60laQ0fsiYSySGstarcT7qgEk6Cm6sH4WdyJCMJEpZvIgbLlh0RD1E
         4SET2msE5DdmjiYmjYOUW0tXB9Vt3loGedG2i4y4rfNwFcSFX76oEBus/25liXW5V5lz
         j4gRcIe2e/bfXyDr0SdLJWmT7xlx2W8yTtw/PQAS9j6StKL7OUO5w1SPBZpTXnIQ4fWE
         E7tjrrVQ2ViPofChFRLrn+NKai+7TeZf2eAWvPYwR/LeraIBsFyleZn/DxfugfRXvop/
         /5WjUwWUU/Yu3P822y3v8z+Yc3ApsbZx83h/dZmlnvLQmZs1hYuYSGC4F1l0kBWczHz6
         JBFA==
X-Forwarded-Encrypted: i=1; AJvYcCXnH+TTlalYTfBw4s5qT2pePpkkS9aRGvwd/2Ljn4Qqf6G1ciFNju0VYm/E5mC4bhCbsTqTwziXajuSqA==@linaro.org
X-Gm-Message-State: AOJu0YwKjk9H8tslNUlo8ZwFSfhM7EQjlXZtlUcpYJQSvjx2oZkjhH2l
	arlm/STK1wLt5izRnqtfIvoSEhzTRbhahsQuybZ2HN+s4we7C6ppjyvEeQmt/I5tLw==
X-Gm-Gg: ASbGncuv2Sr5aNDaDV3Xd5IlR7oOq1otghZF82fiUqM0cDi5myHty+2C7RIboKhvSwz
	aRFXGTNWyvsCue1yGempyglLEdpdkujRVmMLm3l3mWkPbalqBxbNfvsJaucNOb5ThtsTCae1Cxv
	d6SX/zupZzEv0lybm4EWGDMUui9nVrXGmlLfnk2jT4Bh/wLVsVBQ3cEg4NhqjtyI9val0+kPyC2
	8gLuQQzA3SIjh3msj2ZSEqy+MyKQ6ZcNs/iZDTPougiwF3w3tCYYiI7zQhpN7ns1h+UinFxnVRl
	lI4BlkaUboF+IJQtdL2win7tfFMoXPTI3DLbD293
X-Google-Smtp-Source: AGHT+IEPSmT/3UWE3bABefq+kerkvTIDMzjVefNcm7AcQNO/z374B5XjWls0wpsS4F9WSoqUM7jzug==
X-Received: by 2002:a17:902:da8b:b0:224:10a2:cad5 with SMTP id d9443c01a7336-22de6f7e6a9mr26233645ad.10.1745902822519;
        Mon, 28 Apr 2025 22:00:22 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd6f7sm93004015ad.76.2025.04.28.22.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 22:00:22 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	richard.henderson@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 07/13] target/arm/cpu: remove CONFIG_KVM from arm_cpu_kvm_set_irq
Date: Mon, 28 Apr 2025 22:00:04 -0700
Message-ID: <20250429050010.971128-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: TlRJ85ZrHz5l

This function is called only under kvm_enabled(), so this is safe.
Previous commit took care to add kvm_arm_set_irq stub if needed.

We need to keep a CONFIG_KVM_IS_POSSIBLE guard because
this function uses KVM_ARM_IRQ_CPU_IRQ, KVM_ARM_IRQ_CPU_FIQ and
KVM_ARM_IRQ_TYPE_CPU which are only available in this context.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5e951675c60..e7a15ade8b4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1101,7 +1101,7 @@ static void arm_cpu_set_irq(void *opaque, int irq, int level)
 
 static void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
 {
-#ifdef CONFIG_KVM
+#ifdef CONFIG_KVM_IS_POSSIBLE
     ARMCPU *cpu = opaque;
     CPUARMState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
-- 
2.47.2
