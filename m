Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94404njb;
        Wed, 7 May 2025 16:43:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMlIB9wA6xINbi+Vb1h5pjlLJQwo8u4Ene/JyxVkLQWqEW0yfQqdc8AkwOc/lonRLRHq+5WgGMwag0BA==@linaro.org
X-Received: by 2002:a17:902:ce86:b0:22e:5a9c:2853 with SMTP id d9443c01a7336-22e847358e8mr18728985ad.12.1746661387903;
        Wed, 07 May 2025 16:43:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661387; cv=none;
        d=google.com; s=arc-20240605;
        b=Ar7ExdKN++U0y7z/tEUHi5oQ3IUNDrKisWVZsr8x13Bt7oOQREtN9jZw199F0WiYiJ
         FfxHSbjKDVMVwrEN226VkuwIEfLnTSM2vua+CcVOwruS1r0A7JM9bhL4PCpN6zSmjcsY
         BCXbEufIFEjaC1kbMga0zfLipGdg+tq04O1RreNsr3L1FpEYxiKlPtROh8Fro6qeO4I5
         2M8zfpIjUqPAh7qmYpKZKFJjEPFMfA4SN3Sgaf4MqGqGnV9GbuL64Y0+d0Qmfufwu/aZ
         RF/jT9TcVgaCEqakVOHS1Bu7iaWmLhtAxA3H7eAaw5GGLwmojM/4meeafupB3tFmSI1n
         pz8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=SeLT1f95/cGbe62bYfKMrzmzjdSaQ72IuCLuyv7ztwQ=;
        fh=InfLPFrFyBiYF6XL1YF8CvDOKsxg5QqDJo87KDg5t/w=;
        b=Ho/VrgviOv81dTLVNblKBsB09Rs0qEfIAW7TEXqbbN8cRahVdnGwQ/jmHDfSXjUR+U
         tXzYUucPSHPpAzxJmjyt4GXtbDZsjs0Ib29qqBiQ0VqGwZc3YcZ8PT5yRpREPhNRYTSp
         i31IFg/ksbb7X8SfSavJBc8rbuJGTZvNzb7qpUiAI/cEiETByUX4muZ7nQCArXlkyvdQ
         9QtSOjVmIhR7jChY+9MsKT6nadNClaTrR5VudapICMxe2oPzy4td8R5RQSuLNJ5PJ25n
         SLKW9LWkjWlnFtD0Ohy4zbK9u1frePQuTt6h8bzb0BGEG0X3qYa0WfsSi7nu3s0wJhAk
         sJgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=suIlWqxi;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e7f2638c0sor6593405ad.8.2025.05.07.16.43.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:43:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=suIlWqxi;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661387; x=1747266187; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeLT1f95/cGbe62bYfKMrzmzjdSaQ72IuCLuyv7ztwQ=;
        b=suIlWqxidBpcddvLSevhi3zZybm6TJ9BXb0ErUXN5ma2v6cMlJhoT88PKmAIRuwlXi
         p/zJb9H6obh1AAknJOOq6E/kAZuUryvVE4gM2S64sUUO1Wz2T8tqVt4Oyb/hEyY0lhUv
         zHDMSh5h4118PBIbfs3D5stc9A/kJMLQt+SxnLj0gPG2BBZNRnqd0a8ocPnHQtd6DIW2
         /jIFGYeDZSkG6yc9VzkjX7V4/+T9OzSv696y5ib5y9Wr7P1cAUqJJICYaA6U15eLBUHi
         BQxEJn0/Gf2shOGJ7iKWLKxPcI+7uE90q9rn8fepJKThq/12lQUbgJ0z9ApozjTBXCAu
         xJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661387; x=1747266187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SeLT1f95/cGbe62bYfKMrzmzjdSaQ72IuCLuyv7ztwQ=;
        b=C266C8mTVNlZLN3CZA+ZfXHes4yMzRg693W2fF/5dOF57bSBi8G2dhJKR47OJ4fXcF
         k9wqHwawbxCvHM40cuJ27FnoMa1YKxT31uqlehYrVDlJPOyHSBXJ2b4sCWSIDf/poshb
         7cZHZNjJubXkWFT7eEpj8epSz7Hb/BVAn6fsnfJWCBBwUb5DetDxl9WgkgLygtmjvFJZ
         MJKnp0sHkeqLPmf/fWCYDzpxz30ecl+FG5sU+lMjjMm/E9W8ak2Yli9eOpWXHOF3ZGT5
         916A6Q+OVi2vbqo16vpok+A30gLYIzrR13h1zNjhwirrsR2Xjefe9IhX95JcaPhThn/t
         4gNg==
X-Forwarded-Encrypted: i=1; AJvYcCUd9ZhEYg5E6Htu3j/oACHmQSRBt7zjpICJ0Vm6ALbnUIS0IoBL64oLpf5ZBJSeZseND3Sk/l4YlW0v5Q==@linaro.org
X-Gm-Message-State: AOJu0YweKSfvrLTAq5K55QNNUqMYu3WdPNkorHo0UzFhtrzcpL6m5V+2
	xjHcJn2dpYraRPEO2HPvCzlWV/AlfWURZl3PecNzzGUy4YdjFN8RKRncnc0bkLMBKQ==
X-Gm-Gg: ASbGncu3vAYq2ReMLm6kVRiGke1unNZPeYbqZCRcQsXQnSVkP9Mo0tzdahf1Od6Bxgi
	5+CxwI4cjOJklcV6/SMwbK8XCKpeC1+jYJ5l5+qyQZ/SxrK8SWfX6pR83bOhhuZ4FlZ7yTOjxCj
	cbHLU7SnZRcBX9QW+TLuqMWYxvN6Qfllmn7mWF0Vllq8DalJA2kGBoVQngirsZcQyBX9/eLT0ZW
	/JM8n9ZPsLUbvcvc1m+X0YwkE7JSfKkS4YIglBVYQlQsEMU1EeRaEfjC+yVKnekxSi0EV6YksAQ
	TRdZMg7fA6N3Cutwjile5G7vFN43IdajyGAj4ot7
X-Google-Smtp-Source: AGHT+IEYPXXe9Sd9bJoXec6MHpYABc/insXv+r6ni87IqJm+3koI5Clcb8DyzO39kuVZq+4ZV+I75g==
X-Received: by 2002:a17:902:e803:b0:22e:50f2:1450 with SMTP id d9443c01a7336-22e8476efabmr20725095ad.22.1746661387529;
        Wed, 07 May 2025 16:43:07 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:43:07 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 28/49] target/arm/arm-powerctl: compile file once (system)
Date: Wed,  7 May 2025 16:42:19 -0700
Message-ID: <20250507234241.957746-29-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: MnMWIPInhKjQ

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
