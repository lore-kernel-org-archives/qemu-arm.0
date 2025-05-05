Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178768njj;
        Sun, 4 May 2025 18:52:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1dflR6rz0QR+8hBjKggKttLQsWkfFyIbfrBQ+iahotu8cmIPVcYD57pipsfQR92lCoT/0hUAogAyQcQ==@linaro.org
X-Received: by 2002:a05:6a00:438f:b0:736:450c:fa56 with SMTP id d2e1a72fcca58-7406f08d238mr7205153b3a.5.1746409960354;
        Sun, 04 May 2025 18:52:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409960; cv=none;
        d=google.com; s=arc-20240605;
        b=LdZxISMy777QurGl0AfKHc7sjBG5ue+kZBFVsPfFPAL0rm4WDOD0s8Ted28hvYqcJD
         oD/cV+a/SbuGPLvQKVCglNYPXwyPyKFrtsukCDhINhjN/xQVXplh/BIInd3KtP7lotla
         3xKBNp95YaDHY0jGSE+daN8BFn0g75T7xAvXRFfkg66AmVCdmnyKcoXjuos+vv7WutdO
         vqXMKeg5JyaM7JgonQ5jto6zaeLgC2/dhipTFgDySDU7dY6jb2hGfy+YASTtL6hfXKu2
         +X+gBW5H+e0EyyeLdX/S8KZbViHO10yWkSzmKHxKDJEK69Nx/F+boCNZdfmVB0zlkFnt
         Cg6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Emf7r2NlJCGBegzvSaP4+YNHnVcvC5KK1KGZi+oKRes=;
        fh=qxJBAz79HR4aP82Ub1ncz0rOD1XWmCwBr5jdaqgIcrI=;
        b=blRYZIJbrUNlhfE3QFtmhVhd4WuKYD5RProqXAxTjwPpEhUIKC424JbDaEbhokrI3L
         TxvyGeYstoJbga4moNzkXfd4ZUkHBm4ZXejyG9NlGMZnDyai4S66d4eAlq3plyK5wy8h
         vkaSyEfIj2YFwnbe1Ukg7dbvVp/1lXmy6w597XasE/zeju9fxfymQ1Xhe6OpP2Vnomev
         DGWLe/3bbvDaIZhb5BuCC2ZEfrWvodiAwW4ZxOK20W5/O5DejFfgqyJUxmVIjmn8acml
         WPd2MRlDNKUiPWW2RTI3064ojGDnypH+uidmnaDWAkc8C/e8h+01rgDSZ3YZJLxVej1r
         s/SQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F2D0UhZu;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404ef18c34sor3482978b3a.4.2025.05.04.18.52.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F2D0UhZu;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409960; x=1747014760; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Emf7r2NlJCGBegzvSaP4+YNHnVcvC5KK1KGZi+oKRes=;
        b=F2D0UhZuzDvMFGt8OVL/E4yjwhkAQRQTheKyCH7lyHSMoznotgR4A8EPx2f8Ymjoed
         OUsiZKjtT5elXbrtUEytlBYKH8mrZ9R9hjyf+uNBpi7nhXYJwHH+2aoMGSjUFvSmIwtz
         4Yl6uUQDns7ym8XtLWZ3TCQLohBzuGLD/ACVPpuXH9MZKg8aVdtU5gnKUXYDbM/rhoJo
         SVTYRzqz2wDnSj7MXXk9U/AVQyQWC7D1z5TI6xDi2h5ng+IoMPSrmMc5NlvOcPXe81ZC
         zcz5dYrU0m271d3Fkf9yav6fx4kzqtVNuX3zAGvxZeaNxWrFGcFqZIPN0ZUwAnq34HsR
         jAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409960; x=1747014760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Emf7r2NlJCGBegzvSaP4+YNHnVcvC5KK1KGZi+oKRes=;
        b=mXGJqEE2GO8DMCBMHhbDRbFcmzfLXbBaFanQn9zKRmJKl+UhZIum94BI/8g8KaA8iv
         5m5qpgP6l/2lxsq1iwESyu4D/PBHGISJ2Hlxq/LV3aVMUKibA5gXFJ41WC7Z1QFT4bhQ
         Fp5Y2mz3rHZgmSSoBPSQGYVJ0d9PtQgbqdMmjr2c0z9QFst92BYMofIdDNibWbCXUuGN
         PIlG6HMPH979qsAL6rHfBSErol/RkTU6FGSoLLDSxxZodoDVL99jzvoePPCX3x7FXH6U
         F3XU/5EMCmC84nATvx6f1ThAlK4u1HcTDn6FyhYlm+Rzt7Af2bbGFREUYQ/O3V1Un6zN
         lsCg==
X-Forwarded-Encrypted: i=1; AJvYcCU0vNKZlrlznUHcDGfvAvmFsJpUE21weAFKumglFE5WROIYE0fYSU0ObVeCl2O/xD5YKF1z4lg+dX4wzQ==@linaro.org
X-Gm-Message-State: AOJu0YwbbfN15pDZZ6iuqYiMydJ8wtDBS5p4uW0C3o5aXWIXGfDvvrSK
	Qz5Cz0yxbv3lEIOqYnzCph/lNA03wdp1RlWliS4UrtVBpQBPDcTp/L+mibQ24zZTiw==
X-Gm-Gg: ASbGncucjzjn6elGfDmrRV8D7jhcBBW9ZztNAlnpoKXqRAd5FqQJ2kwTnGy/HhiaLHD
	JPlR0tEoUvbXZhwQ5hL+EfCxA4cSM4r+tWqkn5pRz/KZdQMxtwAxCK5WhBesXCGFqkb3huw5X1T
	2Hkprn6hJRiyAhGlzF02SOeAGWneebeX2sAyD5PXBXdM1bjDQXXYjhGHdU4HxcUMOSjNaaoNQTo
	P2VGykL8RCKVWCO270oddc8buXFixJyRIOHPH5Q0he9feC7iub0SRmSBC3DPMC1OmEcbn0MA3rg
	0zXL8yre9m4y9YDCagkKOkdY/0L3re0WJfbpVz4L
X-Google-Smtp-Source: AGHT+IFk2nTZ/2szMRArYw4zKgFF+u89wGma1goBz8QRVaaG2xYMWCbEQLMiDHJTA0UwqgVt1ZSd+Q==
X-Received: by 2002:a05:6a20:3950:b0:1f5:86c6:5747 with SMTP id adf61e73a8af0-20e97ac1a8bmr9116493637.32.1746409959886;
        Sun, 04 May 2025 18:52:39 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:39 -0700 (PDT)
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
Subject: [PATCH v5 13/48] target/arm/cpu32-stubs.c: compile file twice (user, system)
Date: Sun,  4 May 2025 18:51:48 -0700
Message-ID: <20250505015223.3895275-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 5PJKWc99UqK4

It could be squashed with commit introducing it, but I would prefer to
introduce target/arm/cpu.c first.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 89e305eb56a..de214fe5d56 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -11,13 +11,9 @@ arm_ss.add(zlib)
 arm_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
 arm_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
-arm_ss.add(when: 'TARGET_AARCH64',
-  if_true: files(
-    'cpu64.c',
-    'gdbstub64.c'),
-  if_false: files(
-    'cpu32-stubs.c'),
-)
+arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
+  'cpu64.c',
+  'gdbstub64.c'))
 
 arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
@@ -32,8 +28,12 @@ arm_system_ss.add(files(
 
 arm_user_ss = ss.source_set()
 arm_user_ss.add(files('cpu.c'))
+arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
+  'cpu32-stubs.c'))
 
 arm_common_system_ss.add(files('cpu.c'), capstone)
+arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
+  'cpu32-stubs.c'))
 
 subdir('hvf')
 
-- 
2.47.2
