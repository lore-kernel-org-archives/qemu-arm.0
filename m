Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94451njb;
        Wed, 7 May 2025 16:43:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSXMG40P5aNnLUmEOzV3MtoH8M+gWLDgsDk9ojgCJNKf0WjhMgM8zTw05OajWv0FCEUZwSSpiR/rpT2g==@linaro.org
X-Received: by 2002:a17:903:18b:b0:227:e980:9190 with SMTP id d9443c01a7336-22e5edee0cdmr83364395ad.44.1746661392047;
        Wed, 07 May 2025 16:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661392; cv=none;
        d=google.com; s=arc-20240605;
        b=QH000NSwp+aBA6aHpGX9L1mtPikP7IOrSWJCgPVwBdoNxw55a1HstxxC+pN0RuFY0q
         6IX2rTsU1TRqh9gJ5H7ZucvsyEEM69exiWTgbvn8aWxUbufXfR+owZx4MgC2ETTw2hq9
         BcehyZELt2fDcZrqxfVFQLYiHF3vCOkQ4D3g5nLTv8dY3J0Ir2vzBJyq9LM/MoTuhUU4
         sy6CNng8XEU2YJFdxEMFPmFQ9Dj5j3whKrKXQh4dDgZYLT2IPY0r1IkVkQ01mrqIIrBL
         dtTRhGaNEzmpFMAIc/yvEZ5BbSPqCp6Tm2DwlcV4aTSYslgNbIo6J48jRZO3FOeblIBY
         ZIKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vzXXutq4wGalZELe39I44dxOL/4dV/vBf09UEOe1qt8=;
        fh=SY/nJfLqbtBNkbgQaz1rpPdE0M+LrDDQKiAhWiWAy7o=;
        b=QwrRot9MXfc8Uz1JH/AmLZjx+2zEnrw4wBQseMsHchgKAVP57SUyFHOXahU0M0nOcd
         mY2cjrDDiIIxJSrTU7wEadMO3afAaWffpfF4OjA7hxmXTjZbcoSAaAdVhvOIqoI+FczF
         EhvH+UjJBLcKyRMySdAnNsl0qNMxhjCa0wJ+FeVql8d/EZC6TYOY5XPsYFNMZNdTIjPt
         MEEgNI2FZMnxnHCH6wclQw14YhlGBQ1iouCtcj7EIk4FTVOEepyL8DbG2kyqUk8mdwaY
         gAeCK3D28KlMLv/1LnlpbiJUXLKbiOnPHjUakJ1E5OcwC1nZkgZ9fdkgi852aeFihyoy
         33ng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UapKbS0v;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e7e9e08b7sor8130485ad.3.2025.05.07.16.43.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:43:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UapKbS0v;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661391; x=1747266191; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzXXutq4wGalZELe39I44dxOL/4dV/vBf09UEOe1qt8=;
        b=UapKbS0vWG8LggvJIe+yRRLuHgVC4PP0lX95g2T/XdvQPId6tVpg9fAbPY2fyLxlkx
         scEdSBqK8i4ChR/v8QMt3lI/vO4/jNsJjSJCLeqnSsL8XTUD3xxgClJbU9l1mFFAa2kJ
         5Vc4ajl31JTsYlUQPVWZz78uxoR7SQm+YddexKVtM6NCMLfySOzGR+0Og6niGdFPSAvs
         WlB6iLHTiKA7FPDVy4hM+rLQ2aWExq+WPo+cM9c0oOQzlIwSSzKmK+bCC1yd59ks5wYs
         LupICZuTYxYEXABgZPo/bF2HqmdJqcVnPp0MRH5w9FE87sJ5w07WtQGaB6a/TaEtM7kc
         71gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661391; x=1747266191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzXXutq4wGalZELe39I44dxOL/4dV/vBf09UEOe1qt8=;
        b=HiTUtyPi4sSL+/xx2o6d+733dZX+Hy0fnYqeKxLeuv2XpxU6vJ811lpgrTe8HK7+x5
         haXeJYCifqXRYWqJC9DCN/BcylJoEgo30LhD8OPCWlwilLehSaP9rV//idSaCm0BgqOP
         J074eRTb+1Vb9cX8cEL7ZlbPMAFB5q6oE/gq3+naeM3LABmdDq244KuPQffrK36frdVK
         UsMuexxIGsrmENn2xWnO0jM1d1XSqnh+yRrVWOONV3K/SwcJw/N/uXNUYo63Fc7GRC4D
         HDb7YSTn+9N7hmNwgdFv6VCMTSUlbvuaRMsJYaTp/SA6EccPkw5h5Ll+Tu6N/DFjG0n5
         RLtg==
X-Forwarded-Encrypted: i=1; AJvYcCVVmwZcoVoxQIIqUznlF0sEtnHeLPB70pYSvStb1rYsMo40dsD5eiTaedOAtaz4VFm1H01oPkaM03k2Lw==@linaro.org
X-Gm-Message-State: AOJu0YzzsCf5be3F16oF9bUHNhffZ+AYqa1yD9X48LUUN63tVUmGwI3h
	21qH7Wb/vBRsBelqqypUlczutjw7jxo5pxBr1txX6UZWA1nNT1ce7NUQznvl8cg23w==
X-Gm-Gg: ASbGnct7T2VVNDWq+CFIY0Xgxf98WUcnc/1IN1QxuICCDVT9S27cVFqBT53NFj8xQtH
	2KLM1f800uEVO8YQ7ruxVeFFH9fmm0lqLSY+V6rUGrOceDu8/PJdjpJJtk50LoqtKqbowld2+Zh
	n2aeHlmzlOoM4VYmzCxBGh3d/kkkcgwIXcMUmgua9bGTH+hIEgFCKwXQVuU55Bq5ytDl09kTqDT
	d+4/+HPZE6fx5asbD8Pb6nLkGhxnQmQmE/DdlMb91F0Kb+yB1bZ1Bos2lYgRvzsoMi9ueLKYK9o
	1J/yGDGFYjo98lAgx0zPGkdsw56rI+q6M3BtGHDR
X-Google-Smtp-Source: AGHT+IHHfhaE4ghnmTMiN28gxoqvv77AomE+VUqZxmC/QGbe+j45MBaR0QwIVVJeXMQ0iZnyM3zNjA==
X-Received: by 2002:a17:903:166e:b0:224:c47:cbd with SMTP id d9443c01a7336-22e5e98947fmr80627715ad.0.1746661391705;
        Wed, 07 May 2025 16:43:11 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:43:11 -0700 (PDT)
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
Subject: [PATCH v7 33/49] target/arm/meson: accelerator files are not needed in user mode
Date: Wed,  7 May 2025 16:42:24 -0700
Message-ID: <20250507234241.957746-34-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 5ntDeB0Udupo

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 151184da71c..29a36fb3c5e 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -5,9 +5,6 @@ arm_ss.add(files(
 ))
 arm_ss.add(zlib)
 
-arm_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
-arm_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
-
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
   'gdbstub64.c'))
@@ -18,6 +15,8 @@ arm_system_ss.add(files(
   'arm-qmp-cmds.c',
   'machine.c',
 ))
+arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
+arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
 arm_user_ss = ss.source_set()
 arm_user_ss.add(files('cpu.c'))
-- 
2.47.2
