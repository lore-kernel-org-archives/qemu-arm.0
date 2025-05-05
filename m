Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778389njj;
        Mon, 5 May 2025 16:20:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxcIX/WCTpWB/vyWtATG5+0rIzFYSBBA9wPV+hCxBsLz1THvG2znh7nviARFsJ4hT7NSNVlQr8kQBoow==@linaro.org
X-Received: by 2002:a17:903:2309:b0:22e:17b2:3d42 with SMTP id d9443c01a7336-22e32ba1bbbmr14125255ad.27.1746487251998;
        Mon, 05 May 2025 16:20:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487251; cv=none;
        d=google.com; s=arc-20240605;
        b=U113a80JcIHb8RIEw6bVkQ53FV8BmwAxgiTFytzvGejBFknkWFUzMPia1qoAqTWjGz
         VirT8PGlruIucdSSbs2AXAz9kdLflppR2dKRVzGdbOOPizCyTvaGQjgLTzP1kvoX4aSc
         CwhlYU3Cyo/ATXOm9LylXOUckrMfIUlqqU3Kx+yIxkqqxYLqMRzhmaWG2Sbw1quU0MeB
         QxaFHPLGfCAbPqstRD5amt/fGLKDy0AZn55ewsLdYhAWxjBBwPZgmM7OAJbYqrJJvKo5
         Q+cTcA0M/EV3PWZhun5Ie7u5vwaHXTHFh7CmDXmV2JT+lXwcCfleyOoJFs9pE4/+Za5w
         NrUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rXLXuVNGEyfjK9Yd01QUJZvt/uyYRhxbr8cOAxNhYLE=;
        fh=Fb9gymxX23HErazCXG7LB1NJaa8g7Ld4kd3Uz5FUABs=;
        b=KB5T9cUIklOfWqJOATkR3G9vbuLiAqb+cUFE8WfdXQX9WmiEAamgX4W8rh2+KZbu3J
         qCytgI+7WgAwcTGLvtut+6OMbwJ8BtILbWwy6Loh5kD74kdrtjoKGylVaxcUvCyTDHi2
         3DZt9Ra799Ues55CR9xbfFy4+YgDfFCkfzOXmys8ZedbA8VtEoVXAf7HFJqbeD9I3/Hs
         ZR4HNlI53AqRcxTkBRDajujhrZQYDjxKoPtRYTlPNgtFJLOYTeEAEHoC/uFHbT9+dE1u
         noNFNQ/+zAZDGhwMq25gMtVXiDAv4e1JczPUNrhv8mBsulHvgDSa7tK61qrEmM3THO7A
         J9Jg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PSJhUBpz;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb05ca4sor57354325ad.2.2025.05.05.16.20.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PSJhUBpz;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487251; x=1747092051; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXLXuVNGEyfjK9Yd01QUJZvt/uyYRhxbr8cOAxNhYLE=;
        b=PSJhUBpzjT0+S5Ekg970ujZqIMQBlAiMA/r2wNr0Ro5TB8eh6uVVNNcVtFWkTywz+g
         MiqSxwQm8NnaYTjDH1SulNRMq4QF0XMyHbqfTmA0WgeLmEFirLcqdTd2uGSUj2MYGEDY
         NGFcBZlsG0zadDRK6PlUHuKd2qNoGCG5ggsDJzS9qpRrClzMcMezScKXPd3+39Lml4M2
         gFUkjY9bmMdVdb8MiezACYcGYsihrH2N0s67TO1E81mntDtkiiiMRFu/WEZ3zXXglmx5
         z0JENR0LNDxLVZjw8aOw5O70PW1w9rn64ufat7OXKMVN6ZjX1wMMFTgJPmeIdhOSE3Vw
         UJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487251; x=1747092051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXLXuVNGEyfjK9Yd01QUJZvt/uyYRhxbr8cOAxNhYLE=;
        b=ipyWo8J6N45kNSq9Ue/eqL64ykvte5cIFMyVpYkc3j7xtwE6/tMViJ7q0QR1N1Dpj1
         jAtU3r7tvIuy0D9mh68yVIILoaOzS2VkVP+kkk30n3SXCKfbJZI3I5zSWUTUDrP10vBh
         KVUzHcjNvuKAREwUtde8nvaUd/bledxnhKvrF73PEiEr/1SMvEZv91Il4DT22vAYyugj
         Qfw9WIElV3NldLPpXnFyXRKh3W6EZC6dTTfBDNlBNSB6gjd4aoSJ+Z9ArQrEoJnCtgXV
         O0bwJvEiyEkOrfURFLNLXSFPH0hXV1rJYk7F9XZFYVk50A7v3eihi8BwnJrK8FggIRIE
         vQSg==
X-Forwarded-Encrypted: i=1; AJvYcCX5pvEzGfiNOj8KhHs2wei1mdQcVcQ9M+KrxhOAwNu4RW7L3QtP38aKnEkBtfqErJLdAZUh4aZnshF8Tg==@linaro.org
X-Gm-Message-State: AOJu0YwC8h1btP/YmSU7jjppngR6/CaWHnh8Gfr+5y50Q72/8Du1Zpuq
	Qq7hB1BexQKXktP+IBV6ogy2ynof0OWpP1sysx3S6l8dJDey1YaDgx4WaEUIKOOGUQ==
X-Gm-Gg: ASbGncvZxQDBEMFO5zyyvYQTVT6TFrXRgXALkyVHRfLowVsnt0cYN+R8VaFHh4i8osq
	QOdQR2derLe4YGzl7r9ZmW/RAHUxXdF1cJJ6EPQAW9hDwXJkc26p7FOV27ea2QTtbchxkGLlG9Z
	poQ+XwUmX7WQGogpm0dnZnTirRVCMISWwl29V4D+zZ/Q/pFU+sK317xIzO+Wn1FAnfFLCzItOHW
	2TgOp+W3RHoBO4AiuGPeEQqO48D84TMOzWF3bSAVYY1oJ3VfgEYxx1O9k/RxBnsgpNB67YaEoPF
	w0fjECvDVPCzytCIGUwk/gvsQ+yGPWEhAaq6AKxI
X-Google-Smtp-Source: AGHT+IEsUBiJC/ed4EmIFp4CMdEt2kVOvqBf+kcMrtQEGptIGUO9Gn+sgYxrtYlliG0ZSCN4Z64t6A==
X-Received: by 2002:a17:903:fb0:b0:223:88af:2c30 with SMTP id d9443c01a7336-22e32a50fa5mr15676655ad.16.1746487251596;
        Mon, 05 May 2025 16:20:51 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:51 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 35/50] target/arm/kvm-stub: compile file once (system)
Date: Mon,  5 May 2025 16:20:00 -0700
Message-ID: <20250505232015.130990-36-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xM7m4JwyXtGC

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 29a36fb3c5e..bb1c09676d5 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -15,7 +15,7 @@ arm_system_ss.add(files(
   'arm-qmp-cmds.c',
   'machine.c',
 ))
-arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
+arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
 arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
 arm_user_ss = ss.source_set()
@@ -32,6 +32,7 @@ arm_user_ss.add(files(
 arm_common_system_ss.add(files('cpu.c'), capstone)
 arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
+arm_common_system_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
 arm_common_system_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
-- 
2.47.2
