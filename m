Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178861njj;
        Sun, 4 May 2025 18:52:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURj6akGs8NzYtbYUk0vHvQxEQL1RNIGFhwTFW4x7HZo5gKepcuGeKzQJTEKZDY/MgmRcwtDF7QvVgbaQ==@linaro.org
X-Received: by 2002:a05:6a00:2985:b0:736:34ff:be8 with SMTP id d2e1a72fcca58-7406f164974mr8034019b3a.19.1746409975477;
        Sun, 04 May 2025 18:52:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409975; cv=none;
        d=google.com; s=arc-20240605;
        b=fNG7liR3eZFdDWooLcAn7p0qDvi4NKq1vhh721nkOD/6UQeSyUqByn1mJg9KbG+E36
         MVqY0VGHVxqI8YjqV8Y6BZyTxUZpO8x+iC00Ctv5cWLDr6WxxcAw/KInHt5ESi6cxkgB
         +q97tVvnRZYcWTJJNyZzZuLWZVb/jJ2adOtBMq5wM29y1STWQbf+eC9IiwHo3Dt26mhc
         vDmdCE9SZWhQ+mo0ZrvQmDDTTCSiwIxGuGGXgpH/+JLOD4wThtUmAWWcytRFp3tFlYeR
         O44GXtuQkb9yJV7MBXxs+HxhC2ApX7IGHwgv8wU5Kd3MgASxx56OZfmiPikXkvLmvHWj
         LEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=SeLT1f95/cGbe62bYfKMrzmzjdSaQ72IuCLuyv7ztwQ=;
        fh=gpKBEHA0S7ZvADaO7RV+SUyZYWYKQtsTZa1V8fQ9+VE=;
        b=fQYJezRpWU+gAkWzMScM2LAZ5RhGNBnCqH17+pROObQpFD+E8TTXGXqhVnMvxZe7y4
         l8/oHuL+k1GGSdIFgR+fYU9E/kXD230TnpRfBuByZdQ9w0+Ezyt7Jh0Xrz4RnbwR7CLX
         rlD2THHqXjh1O1A3iZq2wcuhjejN28u7+Y1gsbhgaGO+fiJEIQ3O24XmQdPgv/nHzxp+
         UqPAM67Fbzx4qIeyQrf2ZIPgyHSvP6OBh1nWja0OTszlsDNaXzGpBMLz7BP+0OKjY4VK
         ++Zws3BJ7hIZj2vtz4+TRYnAQQl8em28Iq6YIf/7kGGPq1bcNw7sEIMCs4gmRgk6OxOt
         n5Yw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=II3ZcJfa;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa0c1c6sor5860032b3a.9.2025.05.04.18.52.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=II3ZcJfa;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409975; x=1747014775; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeLT1f95/cGbe62bYfKMrzmzjdSaQ72IuCLuyv7ztwQ=;
        b=II3ZcJfaD/ZnrBNxRatjoyeURiiJp7Lovl8owwf+eRYGJEFyX82PN8hHbS8QPRO4gI
         m7I+hfcuHm3NPXxBbIWETWIYTkG8TK2pgER2fD3lnCNi39ypzkdXEqsCS7L41V/RNvH2
         cs7o5JhL7GYN8+L4R0BXLXmvCk3PegcrHNOIEYTXlJdDyCElC+2hsModFyae7NECJyrP
         A16jU/wirbv7myi/GrdNX80UJi+l++m6GzVkflJZzwfDw/eFcXrT1CziAhBKaJe9rJK7
         WTrXvf9HIKP9x1kM2siyiFz6JHItq02lgktJ8ei2DLvaAVe169CpvDn65SRWCv4Z37DB
         l5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409975; x=1747014775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SeLT1f95/cGbe62bYfKMrzmzjdSaQ72IuCLuyv7ztwQ=;
        b=Ilm9MsMmmoYZos2YDtiPJXhpKFo2Ugqqtalzk1LV6JekGEVIB4M6cA2ITETfP9EWJD
         O7JKV0HMoZ2a1esWq1XnJVoW8Xs2caPZL0CFSEYrafIcy7nTsMLaA2bPGNhTZ92d/Kkm
         bm+0+bPIgpmVtSfs6GPYxdtI2kuB1fSuitkWmCobApcWMnS4XHOH2jCFmUK/rw2uo7ZI
         fAayPg7SmQaUt91wfUJBBUoQ1r1btEezByHMrqe5L3zJ5GzuDkZByyzcFxZCG+M4qfxo
         /E+HbIa5pupd2hcckC8FKjvUxw+Dea1KfkYILSgzLj+jPS8uhv3GPH/tnFZNQI5ZYOmt
         h7kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAVxKten4+I1zKs9yUQyA/CJD4BHZvm/w9dotd786f0Uzabt/fCFIGzXh8+CwL1BfN1tFFM3zj/fDdsA==@linaro.org
X-Gm-Message-State: AOJu0YzAI9MBKE7TOkyPv/g2/sxjWOOZH1aApMc9qeJo6gb0BSqj3Smk
	kE5NaQ/IioISneCCjv9eacxhWmlwQ3TXOaDh5L3ZRlvixpTimkSXY4Tus2EKKVUzTg==
X-Gm-Gg: ASbGncuS4gb1QDt4fEusUrIfoYU++HK9+xs1howwJQl4CBdj7Kqigja6NZskH4FJhso
	aIEblSu45UMqLovZA/vfXNGR2Jy64qSM9v2fMs7U02L0dw5Nh+F9IEKQOi6ZwIEBiXtLjH3rLtT
	K4bHS7gQ7HlGyiEgXpEgGqRsp9mRFed+KBpPE/C4Vm0blKXDyXykyzU8hecAH9oyMoRntIGDN0G
	PxN0557IaxepV9fGOw2imNqd/sgsbHOCykz9gjmiIZtMmbyXo8fBVVBvup2iudDpH31Y2Nq+1jl
	Gf/P1SwRB1nzE9XB8VhDZ61C2Z2EQm7V1SbfdQSG
X-Google-Smtp-Source: AGHT+IFov8TPcHO/7aZomFK+AG+jlBt3spUroyr7V1nRBJYJVIGK7covInHsA0gbZOIJ3WBHEurTkA==
X-Received: by 2002:a05:6a21:1743:b0:1f5:63f9:9eb4 with SMTP id adf61e73a8af0-20e97dafce0mr8559737637.35.1746409975059;
        Sun, 04 May 2025 18:52:55 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:54 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 29/48] target/arm/arm-powerctl: compile file once (system)
Date: Sun,  4 May 2025 18:52:04 -0700
Message-ID: <20250505015223.3895275-30-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: mG8JimZTsahp

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 95a2b077dd6..7db573f4a97 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -15,7 +15,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
 arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
-  'arm-powerctl.c',
   'arm-qmp-cmds.c',
   'cortex-regs.c',
   'machine.c',
@@ -38,6 +37,7 @@ arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
 arm_common_system_ss.add(files(
   'arch_dump.c',
+  'arm-powerctl.c',
   'debug_helper.c',
   'helper.c',
   'vfp_fpscr.c',
-- 
2.47.2
