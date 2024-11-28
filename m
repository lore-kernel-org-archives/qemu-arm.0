Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413100njb;
        Thu, 28 Nov 2024 02:43:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWTCjvr44TU0L+TTQPP2LZGRiRBtkV6zvD3M9j4SYEAQh8e8OU1w1MlMCUfJOyOUBnc5690SRc1RdazeA==@linaro.org
X-Received: by 2002:a05:600c:5593:b0:434:a33d:ba44 with SMTP id 5b1f17b1804b1-434afc44167mr23170975e9.15.1732790602589;
        Thu, 28 Nov 2024 02:43:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790602; cv=none;
        d=google.com; s=arc-20240605;
        b=O9lj6CsUGQDzzOncGvrkmW27ImkIuDwv6scLuOAU7VU/UxhLC44OEG/hc3WzORH4cz
         nQS7DmsjHcP1Ekebd1weHhumM6++rXsgD1MT1drJoPQMhlF2LtocxlIEgXkfN6gdubph
         4cJRawduxm/6BzAGe4ciHvYNdTThyMfPAknPLt/lAOGUigdc8Np5CX7sNcM1IEzTRdcE
         RSp/n3MRFVhYBqXSj4MQxk5DdUjg0YFA+oOmWlckcbtBo7l+a4EnTVlSD7xp3hNZlc4Q
         BmevhaUYq1Zxl2ZxMg/a3+iRnuFNClvczjqBxFoHwGwVBSuRS3TTxNnrK/S53wC1xGKc
         zT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5Xo5Wy1Oob5f6vaToYcDecYPVf+U4Qw0T3qC57WwruI=;
        fh=sLiDKDdPxOcZPLfsS4ukMHOjAukN8DVNpwYZr8639Uw=;
        b=UxkBh7yDidWGKEEsPbdkXgbL25goU7/MrDWSIlsOrZGdu59HTot/W+WqIVqc3JGbCg
         T5X5IdgVG5YVfgPikZbwjr96r4X+Mxt5i4RfbMCwAOCVEgbFVOiUNlD0f9mFTq7DLtqI
         ptA8lGDiT8O/ed2hmGUbHQjNUAi4Wn3b08lzmqlvA+wqgPQiDp4ejLifX5AF/Iq8H7Zi
         PfewidkYYZabVcW/kRaJLB/tUps92Otf1L1ApyA9dVR/TluMpF4wFornznNli3czEXQ+
         D+ifW5TXXRqmiqBys6wSNJVle3X4tQyTmztO27ZhXtIudxSGD0YfHARLDAxFnr6PZv13
         T6LQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y/iAznZj";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434aa82ba12sor9431265e9.6.2024.11.28.02.43.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:22 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y/iAznZj";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790602; x=1733395402; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Xo5Wy1Oob5f6vaToYcDecYPVf+U4Qw0T3qC57WwruI=;
        b=Y/iAznZj9l4tDW3UjsfntEBO36Px2ILwx7ShqZU78lwf7dkxznL+uetsiidCcPbp9J
         LD9g8XV2EgIoa2x5C6RmunwDDQgfKG87IdPQP9eujRZ1MB4AeoBK/6uRO3rOoiep3u5Y
         ZN1HsV9KhTlL3+bHIpz3Db7vVFStQbU+mTpe9nOq53R1lUZMpXo/Ax+ZuJE2EgFVocpS
         ieoQr6Q83SEl0ThzfDPxN+ri1xLobi6FrwG+yIwkuIs+i/Yy/TNDyv29J8bMKQtT4E3g
         GXKu4O5tyvqaQqXUovWOb7Lkqv8VgdFDXD+JoLFRjnXqzRg90brr6N45xM/ugKyRqSGm
         AkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790602; x=1733395402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Xo5Wy1Oob5f6vaToYcDecYPVf+U4Qw0T3qC57WwruI=;
        b=bh7UlviJf8weV2KFRhNQ7gxF9N8KjguoHo+M0h4MII5JWpp03m8Z23JQtQbuHWImyo
         p4l8x+8JDSDY49QB/H+jJTgkzf0DKZ6yidEHhvMPzGXhBqSig4IrEFMuNigd3EtSWiFI
         CWp+gORmJnlJrUvXjVMDgTrQHFiuHFHtNjyNJq12pWBd6QlLIEdHllil6ZHmzhF+J91H
         bbmEkUmTmJm9EVGXVTRPcvhQIsPLO7khX3T1ZDOc4fdUazLavfW7KUP0fjJQ7vWcu7v+
         k9gdY42oxVlZ5blW9WzaKwf+spjyiNAO6K4O2mN2NMNBfwicprcFV40Yv8Xe6iP9T6vJ
         iwVg==
X-Forwarded-Encrypted: i=1; AJvYcCVHLZBBPs1btGzs5QJc5/azUpXx5vzsoYI72jww3TAp/oKDbXG7G9CTyEi27V+4u50TmAd66TCvRbzVhg==@linaro.org
X-Gm-Message-State: AOJu0Yw1THS3dgjgCHQZTCyn5ecqnddiSRrS18umajvhmrHjKMjq9mlu
	oc7F0fi4yCRzQQuaCil8jlRg4Vbug5gwHOkL4pjy/wYjyon2pNmgOW5bLVvwijbkKg==
X-Gm-Gg: ASbGncuyncIvxaYGHgURpMWs8oT1BeuSsmzSHZnVHyxEGWDkGg2pjcy0BSiFVUZ0XtL
	KF+H0s3gJeXhXc7GxM3o8VLpzsDVoSbPK1MSJZYJUzr8EPCMT6Vj2GMOjm+Ps0nFYBJHCNwnLVF
	LfNMxZclpA+sff44byf3JqKNk9smIddCU9Uf/gg2PS0JcnRt4YumwQwyVto/AlYaDfpYp4ZMCa1
	0P7LKFlWmUpxz0Awq5r6goMjsVEjM3ug8FqFmsztbIL5E+GLmhY1b0=
X-Google-Smtp-Source: AGHT+IE0L4AkhdeezeQ/JD+j+p6w163oimx4niPfIoKvMFa1FON378FyJti0jZc6IH0q84O2KRaDnQ==
X-Received: by 2002:a05:6000:2cd:b0:382:3210:a965 with SMTP id ffacd0b85a97d-385cbda22bfmr2394884f8f.24.1732790602080;
        Thu, 28 Nov 2024 02:43:22 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:21 -0800 (PST)
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
Subject: [PATCH for-10.0 10/25] target/xtensa: Set FloatInfZeroNaNRule explicitly
Date: Thu, 28 Nov 2024 10:42:55 +0000
Message-Id: <20241128104310.3452934-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 2J7SxFH/g9O3

Set the FloatInfZeroNaNRule explicitly for the xtensa target,
so we can remove the ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/xtensa/cpu.c            | 2 ++
 fpu/softfloat-specialize.c.inc | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 6f9039abaee..3163b758235 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -133,6 +133,8 @@ static void xtensa_cpu_reset_hold(Object *obj, ResetType type)
     reset_mmu(env);
     cs->halted = env->runstall;
 #endif
+    /* For inf * 0 + NaN, return the input NaN */
+    set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->fp_status);
     set_no_signaling_nans(!dfpu, &env->fp_status);
     xtensa_use_first_nan(env, !dfpu);
 }
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 7e57e85348b..3062d19402d 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -489,7 +489,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         /*
          * Temporarily fall back to ifdef ladder
          */
-#if defined(TARGET_XTENSA) || defined(TARGET_HPPA) || \
+#if defined(TARGET_HPPA) || \
     defined(TARGET_I386) || defined(TARGET_LOONGARCH)
         /*
          * For LoongArch systems that conform to IEEE754-2008, the (inf,zero,nan)
-- 
2.34.1
