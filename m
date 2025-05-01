Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19694njj;
        Wed, 30 Apr 2025 23:24:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4VxUx4EWtAr+cKWmiExESLFAssfFQcQGS+7Cgjx6NIb1qIG0b7kmpks9auhiuxy4qD36THyDLTQ7lHg==@linaro.org
X-Received: by 2002:a05:6a00:148f:b0:736:55ec:ea8b with SMTP id d2e1a72fcca58-740492706eamr2297017b3a.24.1746080656915;
        Wed, 30 Apr 2025 23:24:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080656; cv=none;
        d=google.com; s=arc-20240605;
        b=IhSGRMvSWmc50rnekcnhkIF3VL4xrWZXt13qMiVgaCyNrtuCaWn9nChSfaZvbQWG2K
         PbBGzyWDvMxglSN7kqGa1atbQlZCC6q2ciLvTQUIw+aRwChD1Ah7r9ElZUqrPYMJwW0+
         Wb/Y3UuzrlkkWfUTpr7npjWTQMeIcrPhA21F3iUQTeNiM86gbKeJ7BcYk3pR3NONgX/M
         1fwiakemMCauGNTcko7dIzeCCWtgKh/deBQuDll4eRCEOCJ706f0RmnxjTGooWqVDGit
         LUT9p6cirkqP7I7qkSyu0g46L5fVMOsXRgQKVMeHBL5UZpw7+oK9d+kB6CJmv7zsBWZe
         UxOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=z22S85haL/KF7qK35umsJwcCPzG3sLDPMH83wLAS3JI=;
        fh=1nEHAojopj/okb2ZN28l+lcQqvOCSxr3r2pMAg3HbVE=;
        b=aXw3zK/VslwKX3eIFDHOIn05UPyyvKp9nG07Ev0+SzXAxtu+1zBqYhkeiw3qGPxc25
         fcKnccwcebJHpA53ecITkYH4etmQpmZ7L+pgSEpkkYtYO88OicvSfQN10jy3/FT380aw
         IfEy9+doF1V1kh25NCZAbEcUMlfi1AUfa6bq9EIWjgrc4m0t6QrmEOE5TKHSz05tHoYk
         fHUa6DrfaiWB9YRdjG2oul6SbBiUSEyzcOmuWd1ho8WGet+Bpmc8y8JUdOPhJB7jxzqc
         sumQmvQIBD9YpzblrMf6VD5K0CfvCROsSxkpVbFyo08VRM58X8srfXp4RsOvTG8+W9/f
         cKOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wtVMp9OL;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa0a249sor61870b3a.9.2025.04.30.23.24.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wtVMp9OL;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080656; x=1746685456; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z22S85haL/KF7qK35umsJwcCPzG3sLDPMH83wLAS3JI=;
        b=wtVMp9OLvKMEJQkFeX45GDwMT9bq1LrJ852fTjqKif+jBVmpkkdX3xl7ac1RNFCMnb
         nMwb215LHvqksATfCyGbaUeSDheO4612KjN7WewRlL147StIDAybreVs8818U10W74kg
         Ja6t1V5EN0BpjSHI001gAGXLbjpYJ83QfR/NfGdn2cvYC9kITTh3quTZOxDcIMeFVbFj
         HDZp31R4Olnyz7lHHSx3mDRE3qRXbm5AJryx5l8X9BYXHHXxWGf4Z+AxymvQOEI0aHAZ
         pom2TfIQCXja4z/fmQDCsOVfp6uMn/Z0X1oRxjNdjdsKxUZy2OqJhuploCCZZke0U/eq
         KxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080656; x=1746685456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z22S85haL/KF7qK35umsJwcCPzG3sLDPMH83wLAS3JI=;
        b=V789ZiDG/pe1vOYbVnLFbGGsHgFYI2CFyn6T7yPkzf3qI7XwhE4CDq+d9+qENAsDLs
         jL9z7D6OSeIUi1DEt0M1GnoMJQngtGU3tnpiVBM2BS9PdK9ymTxcBQa0/kn1OrE3uSpB
         WrgLK0+y77cg5VFKNNUkECy7OKxeen25rIdDSZJnH/iaLmvRzmS95DrFbcSoVrFLGqus
         dKJdusbHuh8D+ZafnBaIruZXAOUlcaxy9d1P1QE25ygdVoKPvCwLvkKmEkWPSzGYapzQ
         oVaStGTCoYSqMWJBsFARvzw/kqSNw8XTkQ5J0vc9bCv4GOgvJUggmiwXiJ6J2x2YkwcU
         CLcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjwxNouLOYJmpwqb1rDtrorAAz2kaO9TY8bbmngMkBcIc+KLQENNdDHSMBiYh4kV+2yQjQmTUdNUitNA==@linaro.org
X-Gm-Message-State: AOJu0Yz5Mqp3Beb4DvHFUzpnOL5POKdr94+dPPNb+2IP9N3zHQg/HviA
	gHuL/KTs5XJndIXHb/RvuMB8jTp9g9K+alr+JHNz1tV0YBQYfv2cA/8Ja0Fq4/7R/Q==
X-Gm-Gg: ASbGncu5FUWbSip1j5f928WJwYKmjRzkk+SSyREzooUQSfeZXcOu3p0xR2UaEjKbakQ
	O8PdPvwiUIosYMdBuGrV1btyJ4Jof7aevmgYA/NTyKyD8604IvuwPUJAM+XAfMkGrywUs8oYQDB
	QulL7MykI+sBy5+BqbjR93EciUet3qkyv/ichLUgaLPRZUJwRdN4CPAQFt2+66BT2yb6yk539jH
	qmLlvX68DCmGY0xP0fJe8kvDMj+k1x11C/Sj7or4YloHaU21Fec2Q10J+yVVYA1ZWa51gbouctK
	qbDeHiPujimpOYXTl/DEJ74CxEdvbP0WBgG8lUHy
X-Google-Smtp-Source: AGHT+IGliq3ReuCnpBopZwRu0exFB8q6L3+dRZknQKd9EToD7dD/BV9xUglJOlu94RB9QZb/pidXAw==
X-Received: by 2002:a05:6a21:101a:b0:1f5:8605:9530 with SMTP id adf61e73a8af0-20bd804956dmr2006315637.28.1746080656445;
        Wed, 30 Apr 2025 23:24:16 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:24:16 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 28/33] target/arm/cortex-regs: compile file once (system)
Date: Wed, 30 Apr 2025 23:23:39 -0700
Message-ID: <20250501062344.2526061-29-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: k3J8ob+aQmHD

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 7db573f4a97..6e0327b6f5b 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -16,7 +16,6 @@ arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
   'arm-qmp-cmds.c',
-  'cortex-regs.c',
   'machine.c',
   'ptw.c',
 ))
@@ -38,6 +37,7 @@ arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
 arm_common_system_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
+  'cortex-regs.c',
   'debug_helper.c',
   'helper.c',
   'vfp_fpscr.c',
-- 
2.47.2
