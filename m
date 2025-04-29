Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp22934njm;
        Mon, 28 Apr 2025 22:00:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXMWBrElg24SIROumhG+hy1NrgO5m9+6udQpV+3fr2n80tdk7p3icq926Kl/1cpK5xQX6yb+nrssNDWA==@linaro.org
X-Received: by 2002:a17:902:db09:b0:215:b473:1dc9 with SMTP id d9443c01a7336-22dc6a81e04mr176016735ad.46.1745902821227;
        Mon, 28 Apr 2025 22:00:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745902821; cv=none;
        d=google.com; s=arc-20240605;
        b=D+2SpBYZUCP5/TB4LN+ArXcw7PTvkHYinU0StbDvtL2C36OxnHe+foMQXKHeC2eW8P
         KbmiykbFfut5AkLYkmTTb4l/dYtIxrQuQYdh7aU/ShZar2hB/VvEVMHqhaDtaL4t+KZV
         amW/Vc9RGgcb+izI24LJFRISxS2pvLP/Vy6/TELwX0of4T1QpO/O1JkSUG+qWqHRTqsc
         YAhOG8t6YG8e1Rms4MDsHoZzOjlJ8Peh/LTBAe2G+X9ApMAdGt3ScvlaYyToVpNCloRZ
         3xBxzKVNHireqjkQ0cOX+ccF9oT115pM/PwPE7QbMdTbeVXz6FZijgdkf3G2VLjxzeEZ
         v6RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2y4EwfHA2FmjYRfAFQnR46OcrZnAFzvzFB4cwR27V9E=;
        fh=PAd3ZOL9+QWpal2j4jpC2NCr2Clpr6Qua63B9zZC1fw=;
        b=fpizjSbT9SbIyCzsCy1nC9eW53P1E7BaWsZBCtYeWwUViMPp47oHOYr9PvosJq6k4F
         lPUvzBmRrZh5Szf1rIc4IUNrB6iXk3azvsJRxxY/u+AYvyWYY32OUYfbhG2igjugUPXL
         f5NLKjG39sl2Wj/eY8Mfp03CbSnGmkhGzdSB+pYcVbsY67au7x1HM7+F5uxdctDuEA4f
         mo9S7sBiXSFXDQik/3OP607leRMroCnJa7xYYAmdN2laHLHtWRVS2hN7xVlT9gUlNocU
         RZ7bOZlkPA9kk4kTD+zRBLrm07Y9MO9fnCd1YYvv30Zf3muzyM5TK81NHubjlS2GTJu2
         ir4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QSXIxGAn;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db50f8db7sor75810065ad.14.2025.04.28.22.00.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Apr 2025 22:00:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QSXIxGAn;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745902821; x=1746507621; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2y4EwfHA2FmjYRfAFQnR46OcrZnAFzvzFB4cwR27V9E=;
        b=QSXIxGAnuahKe5fga4xWTIJ2D29us1RLG8vWgo5Q/UlhjbynWS88oOx6HF29FSywz2
         1zvyyhTsr2lA7fG0MlZzG0a6FFUI0Ya8RdiBm3sTzbcD3EpwYSG4y0eKOZQSQS+ZdW1Y
         /WNdKruciCuqL28IJQX0mY31fKMIkxUo8uGms9FRai7jD1AXpaAUl66jHWBnH9czRLDQ
         oRqLTHYmc7BKq0NDogti9+Ck5cFqL0DbyAUFsjqPibPwoQZpwDoZmaTVjpnv5Itkh9Yg
         d4vO7sWj+zxWIwAVp1LtH49eu5SLBxK4x9hexE+srvoZXgpgZ7z0PaLXJGFqVHvTicNF
         A8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745902821; x=1746507621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2y4EwfHA2FmjYRfAFQnR46OcrZnAFzvzFB4cwR27V9E=;
        b=MXyXkhrSziZBVNEbIfbP0CcXK2stU3mnSvCbbSjswVQuulS9vNGDcQJIRk4g/aTC9g
         Gt6PZK5jjHAu8sCrRChaoS+vezKjmjUb1x7Il6KqaUBejwDWy0CUbwnxaJlVTKXgYTOJ
         rBdSU4iPQf2xz85KD+edJvWSwg1PQMMF3N420Qk+j4ndifJudU67oBfNWgTCr/Qm0VlC
         v6vrk9+YplNckCuLrwkKdsHvpejz/jBtbP4KyxkiyGyvGI9XaA/1TB8tKhrmL0YO0hzy
         L/l0/6k+X9JbjJaZe8oOun0+Ff4IXQu2Ci0Jqu/BGueZ1RPZ5UA8u1+cc9g1SiDyAoMU
         Fyhg==
X-Forwarded-Encrypted: i=1; AJvYcCVjBY4vyeAPCQqmWns2H4dkj4RvOJ4IPpKFa4EhmcsrEiUSRfIXOt/b7QiGAgsKidgB7SXQ6eMKl6muIg==@linaro.org
X-Gm-Message-State: AOJu0YzTWmV77o+xVaaU25rKuo7u947gFrZjzrgcvWVzy5NTP3P4jDxr
	QQH6WXbA2PHU+GTbn2uxuVlnJf/4whFVfpXsyaxiGUCW1jMVI2vJqOTM4HgC2hZQlSbf51V213Z
	bnRI=
X-Gm-Gg: ASbGncv3wM8CnfZOGq0YFwnNld4JQSSCko1kq6LDu8Tc7BEXjNhi/QVUeLDk3WFDkYY
	xErdrcs4I2FurxuJ+Xxw/piUojn5N7u8vhPTlOLFUdirG4iXLQJVfrJxx5gSVU+mTmVWjkkuX0S
	l+PXEpBlFOGJXuaZWMgV+rrp5ku5QiSQ/lQ8sU4GOMWNN7jUFJJjzcGD6UPEyP29D3IBHJ7i863
	Vahyj/i5NPpKfwX0qDBQDErAa0JNG7eUzKSVpqhf+3it/ruaKf3L3yGbRj46X+Q+dECLRKPhrDU
	0zywZYIAYxliVBtgcy3Y71exITNuD7+JLFSUINuo
X-Google-Smtp-Source: AGHT+IEwNOFrIwMalkdJgnwDx51xMBl3mnoMGbe6Ccc+Gkl6QjJBvRKnrZDMFU0w1C5V9X0F1g8RmA==
X-Received: by 2002:a17:902:e841:b0:224:f12:3735 with SMTP id d9443c01a7336-22dc6a09655mr168001025ad.31.1745902820862;
        Mon, 28 Apr 2025 22:00:20 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd6f7sm93004015ad.76.2025.04.28.22.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 22:00:20 -0700 (PDT)
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
Subject: [PATCH 05/13] target/arm/kvm_arm: copy definitions from kvm headers
Date: Mon, 28 Apr 2025 22:00:02 -0700
Message-ID: <20250429050010.971128-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: QYU4YWxBBD6d

"linux/kvm.h" is not included for code compiled without
COMPILING_PER_TARGET, and headers are different depending architecture
(arm, arm64).
Thus we need to manually expose some definitions that will
be used by target/arm, ensuring they are the same for arm amd aarch64.

As well, we must but prudent to not redefine things if code is already
including linux/kvm.h, thus the #ifndef COMPILING_PER_TARGET guard.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/kvm_arm.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index c8ddf8beb2e..eedd081064c 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -16,6 +16,21 @@
 #define KVM_ARM_VGIC_V2   (1 << 0)
 #define KVM_ARM_VGIC_V3   (1 << 1)
 
+#ifndef COMPILING_PER_TARGET
+
+/* we copy those definitions from asm-arm and asm-aarch64, as they are the same
+ * for both architectures */
+#define KVM_ARM_IRQ_CPU_IRQ 0
+#define KVM_ARM_IRQ_CPU_FIQ 1
+#define KVM_ARM_IRQ_TYPE_CPU 0
+typedef unsigned int __u32;
+struct kvm_vcpu_init {
+    __u32 target;
+    __u32 features[7];
+};
+
+#endif /* COMPILING_PER_TARGET */
+
 /**
  * kvm_arm_register_device:
  * @mr: memory region for this device
-- 
2.47.2
