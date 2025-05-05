Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178855njj;
        Sun, 4 May 2025 18:52:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWBY1Sa2qOPnzB5DHXLyGfgc8ESuuWNGnYxhZu2DMBO2y/Yriod14ia9Hw3KwfZk+b18bzHSfJmQx79SA==@linaro.org
X-Received: by 2002:a05:6a20:c892:b0:1fd:e9c8:cf3b with SMTP id adf61e73a8af0-20e0780482bmr12132127637.30.1746409974447;
        Sun, 04 May 2025 18:52:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409974; cv=none;
        d=google.com; s=arc-20240605;
        b=blb/OquhjNdmTWAQsdERnTADQqhgaS/FGbimy2aCsF+5HQBNMrC7SBfV0qHpzSp3Xx
         TYwGItxpTyE3QA+Eev67S0U0e1TxWwvGYJRXsfSdUQHlUZ1jzzBb97pm7dcSFy1j36kM
         6zMp6XHuo1t0CxkJVjoMhHZF+7GUBzUuMFcgmYj9NjB3RpKTHlTeT2st2Ngp72z2B2co
         wH5LQd2qdPb468CTUZsGOGt7ABIzsPe2AJxUNdTlVd11P3pj4oyUU2FY/ucrfp6w8wbF
         /ynlRGqu122E2gbPNVN/X/M0jVU+/2VUntvi2Zg/MnQbHv9CLwkM3RrgmuEwWhmxoUym
         ZIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=j3Dpv/gYklKxQ6NcaNjklM8os0pkN4N34WBJsdRDY08=;
        fh=whA1K7yoVpsEPLLw02bKNGMkQ/15ZOIBAM7CoBlkIBk=;
        b=JlFs/PfmWPd0FfwJ5P0BiUZOOxd9rOJ0RTzJkOkLf9IIfRYD/DUqWh3MxcptiHmYm2
         dERGfFjBg9Ss6SEW7qYIqNgdPXSdCWt7l/SPmVD5u8BXSyW7DUYE37cO3arUlMPJpAOE
         kUewf1UsVoGjhv+TXtMohOXjybNDEdrQhCm/oCnhT8onARa2/juHjKqgNSX1ewk9fb8i
         uIl83NTFJm7qMonIA+/eHOeUquzGXfh1HKc6diK4VfDeNmlfJvxVqwSoANxetdnUfYyw
         9H8z//9ig635a0xykoR0dW9eQIhDVgqpSxcPvFD0MqLlFCreQ9OKR+sdo6jOVSERChyb
         x7Tg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HPzWe745;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa10892sor3510688b3a.10.2025.05.04.18.52.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HPzWe745;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409974; x=1747014774; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3Dpv/gYklKxQ6NcaNjklM8os0pkN4N34WBJsdRDY08=;
        b=HPzWe7450/RaRVmIQdTDxbbS/KVwI8WGe8IZRrJ9bIyoTodeablKZlnxqq2k1yDScc
         MN4PXBFr3XTk/1L9p/zKap0Jr+9NHaln/hnrnyICpkbouPOuQV90f2bih+vMLIZJGjHl
         gjp1JFqIwV3WEeTh0FFszk/2yeLA6czfxU1XgI2MyzfLOiOAOol45uPn7m3xYBLDE+M5
         1Ir0+d69bdedmEYkblceq2FZpEK1G09pX9b+Cm0WBOd62M/Za8HUEP6a6dQzl5k5rmRf
         NY+znryHO48vgHHfpdDc/OrWE+Xr7vItMns4YibaRskDWhADRuxug2jlxQc8J6VlGuwA
         wY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409974; x=1747014774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3Dpv/gYklKxQ6NcaNjklM8os0pkN4N34WBJsdRDY08=;
        b=F+mBXnUEGdomaYMx5voIX5+y6A7WePfllUdSWr4IGAtauD7gByeORy0aGARw4/Xkwl
         +lSuoD7RT4cLnKkHYfJds+cZecWaYzUmXL/Q6pmuV1mg/KBdbb5SYP1dkOdW632+PHR5
         Uvz6WcEm2hEsedSqHVt3/V5dn4DoNdyN7x2T40xOjdAECHGrmS9BlbPlLDf0oVvl4BdR
         +umZ6Su48/tqOxM1cfKu/+7vbJkP6/IiNm2SXJI5livD8TxZByLwYuTuRHe6nDoWRtE7
         X91pMYWBfDkdakOXEbbapWJbKcGHDZyIyfTC7pJhphILlksUcRU3OY9UW1cxcPqTJfcw
         EPgw==
X-Forwarded-Encrypted: i=1; AJvYcCWNRFUHgzpj+vV49dTg6gzB/grHkWNmJ+0E3hjDkyx7I2onikO8SHbCGA3cF+aTHsohIl3M6MRz99iCQQ==@linaro.org
X-Gm-Message-State: AOJu0Yyp7uZgKgUEV2rXY6FiAZlvQog9XlQ9kq3j7ZkJK6YH13Efqyiu
	sZ9m1qjofhNF0wwO5fJ/nzrlOf0vmuoMqzYcuoZYiHuxJTl4Gy7LIy2iRmG3UsBV1w==
X-Gm-Gg: ASbGncsPqvCkdNgoQELA1pUq0QeQfvv0O4rYK2otdX0g9cEV0qhreIjIKQ8/AAHVHor
	kXlO1HRazS/tsvBqAxKgDPdEemi5nX7e++ukmHszUlWhcenD5YQuLdVwao2/IjiCogYJc2F75eu
	GK2+gY5Ux4nOg5B5gOtEtCZoiefEz96JwXXRR+mrh0SUuK89hlAERvzyopibnbA0ojgkcJTSXGg
	ckQ/yOgWw6KUHQUIWAu/VuY9S/0VNDV20QKlsaY+PF5HTJtMwj0Tl5/ijJQg5FX6DQDW6Ae/ckQ
	0bMbJJRYlYb0LAx9xPYCwZpToJnoYaDFORzg3FtT
X-Google-Smtp-Source: AGHT+IHdlJKhlcZ2kt3ODw4v558rSVu1ViDFZ39o1QmfrNdqy3wKd5aYQgrOUrBoY8TpFSoZhih5EA==
X-Received: by 2002:a05:6a20:72a2:b0:1ee:e655:97ea with SMTP id adf61e73a8af0-20e07c0bfdfmr12520841637.41.1746409974048;
        Sun, 04 May 2025 18:52:54 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:53 -0700 (PDT)
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
Subject: [PATCH v5 28/48] target/arm/arch_dump: compile file once (system)
Date: Sun,  4 May 2025 18:52:03 -0700
Message-ID: <20250505015223.3895275-29-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: IhvBEd70eZ7a

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 06d479570e2..95a2b077dd6 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -15,7 +15,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
 arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
-  'arch_dump.c',
   'arm-powerctl.c',
   'arm-qmp-cmds.c',
   'cortex-regs.c',
@@ -38,6 +37,7 @@ arm_common_system_ss.add(files('cpu.c'), capstone)
 arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
 arm_common_system_ss.add(files(
+  'arch_dump.c',
   'debug_helper.c',
   'helper.c',
   'vfp_fpscr.c',
-- 
2.47.2
