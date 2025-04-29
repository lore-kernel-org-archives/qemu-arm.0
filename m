Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp23030njm;
        Mon, 28 Apr 2025 22:00:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSvU9lnyCYszg+ZFHnouuKev3RcD3oBL2FjBM6SVEoGFnj232yK0Mn7nBHeNnaqXyz8RwzTN+IkCxyEA==@linaro.org
X-Received: by 2002:a17:902:e5c4:b0:220:c86d:d7eb with SMTP id d9443c01a7336-22dc6a68669mr177056505ad.36.1745902827523;
        Mon, 28 Apr 2025 22:00:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745902827; cv=none;
        d=google.com; s=arc-20240605;
        b=OdwCftX4cCw/ArB20Xfeyqd1aXJ++jlbsTQQ5w+vrCuYjMld/PYfjVsAj6vhfAFyTe
         2LtQJKuVBpSEn9YVm6hqeV+tcOCOKOVwgbVJf3C67nIDq8oIpmJxABAL/GrZtsnelHLo
         8KMtYtu78ayTsXNa5/kLcom+CKOQ6XVnBGHM7THWVZz+UpnR4hbhrMF/yxXU+cib6XTP
         IFka4t5t5OCzVXA4CfyWfpPUBQd2G+L43icRXtg/7wvawX0q46jc4kKenwL8aErhODFm
         q4YqxBEQJFMfxc7l31RhsjUspzFGCqO4tVmSHqAo7XvdozfqRj/XQFQXZXgFLCtDxlWn
         uwFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=k54PyA3qe+UbX4AzHMockqDzIGWdHV1GUXIbKPo2M9I=;
        fh=R7pfQqRMa/md3ytky0kL2tjDlCGr/sAyO3Z2sjaGODI=;
        b=Yby005Ij086CSQQVafnkQdO/Gd80S39jOMzviyc+PdlofGXwFg6VC0b/LuWS87KFcR
         23gWCDDWRiN1SiApl5gLbJNfnUr4uAE56X17GAMuwNSTafC5+wMY7fWGz3RwYtbkgT6W
         YQm3fd3bsiCv8WgUsTqAF8090NbxG4SH4UcQlaCLQCLmgJ6EfWF/tMkqq/tpO96YmJUU
         cfpfo5Q2qC7Tep2g9nmzXq7gqBuKVKHBrfsPeoE/LEtmZ59fZiwnjQMsldsMef9RFj1O
         hTxquIBJ8HAX60H9TlrDGrcB/7C19IBZZP2R2Rqs3gJAulCriLkeP4rFUHbZySzcok8L
         bMyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yiBohpd4;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4ddf752sor90491575ad.5.2025.04.28.22.00.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Apr 2025 22:00:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yiBohpd4;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745902827; x=1746507627; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k54PyA3qe+UbX4AzHMockqDzIGWdHV1GUXIbKPo2M9I=;
        b=yiBohpd4DZDAiicJPPjx7CxhNWWqnowSguQyaNUymgkUEKAA2009dfc2C4pNudV1Bw
         s+Q6dj3jBYPUguy+dGzp1VR0vhtA0V+xASrdXhFbwXag80+H1WD4FQFbhhN0L2dOcYi/
         1cQBlatxwuUQ8dgc10HMNMNAKrtu4bj5nZnMM1W68sdPNxo4E8vthsxoDIGHTKDAtHdS
         T61exSYfteIQqJfwqcfq0bHtn/wTEFM/1u8qf5klE0rT4hLN4fQ9Cu8Uwk0pJGk7H7GR
         frsL7YUwvk4a3yoX7loFZGP6mkux/vffe91nK0vX0eUVo0J5WeC+4znmIhVet0iBJg45
         GNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745902827; x=1746507627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k54PyA3qe+UbX4AzHMockqDzIGWdHV1GUXIbKPo2M9I=;
        b=YwlBHhOJTJBjVXMlFzhnK+/iULSR6vimCFC1DkBiCmNLm2oJgoeU3SHQeYXKdoZhg1
         vxkv/WJpxUlJNEQ8s0hkrtcKj9NdG/0r0hqqDV/+cJepn4XeJCb08Oje1NPUQyvjhatu
         GXYsBKYbw6hW/roeHq2YV4mjoQscrUVADNbjggfECtcoasO4aFc7k1vE2mwzWXWfFWMi
         nH+1A/p4yheSAUbGsxnj6OyqkxN6OjRCfBZDdzoaBkgDPZWZ1pq4mDJO4Ptb1PiSfhKX
         t0mjf9k2f8PuXBUXBT9KBTVj2GIbi/VaYhDR5NyReDtLSqpdeQgFtGVfCnlMAvsnJcYt
         naJw==
X-Forwarded-Encrypted: i=1; AJvYcCVMfl8dAWefA0XtUhvwAYS4z8mc1WtewoTLaMAnGyvBtd0zfI9eaaRbwtZtbLxZ0DSl0ZSq3Vh+eoxsNw==@linaro.org
X-Gm-Message-State: AOJu0YxQS9PdP61Qqry41QAHhhjdCsu3gSRSiNsbLBUQR3hhKS8oQAcp
	P+lgAFkMFOc469nCz29+WeCZbzcbx4pQTY4HBa2vAO5LWSiA5XdXv7Wudmr5R+7r8GFsQ/VxssO
	e5G8=
X-Gm-Gg: ASbGncvJcu45uutje8zIll+ghj/QOlO0wOG31861vziQifSebsCvRSaYUbq5aKGZeUi
	QRoh79evo+cb8yE5wvTd3oAaSayyr47EMJRV7A8ADv/T2VvweNf7nRC749J5bW9OIA6IlgpmGlU
	Xy4HqeSavmmqADpDB0TQIIqb5N0s0zwIa3SXyglJPX60NKZMKgyMNR1T4k4ozLuLMNvZidR/AIh
	PSsOEXIS+ALVFLqz61suruQX7LzFvUGMx1kFHH5c91emXjF3HIYGlYfPhu5j2xorExUho60TsZs
	PKkwIHl6gFJBdxtU4yXT2ooKcwKZ7vzH0m2RkS2g
X-Google-Smtp-Source: AGHT+IGBsvYnMwHnQTWjvEkq+70PORjBWNX+JNL7swJfV4JLCjXOenAAVaroor531SGQHMVm8lxvuw==
X-Received: by 2002:a17:903:3c47:b0:216:3c36:69a7 with SMTP id d9443c01a7336-22dc6a8744bmr177357855ad.45.1745902827034;
        Mon, 28 Apr 2025 22:00:27 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd6f7sm93004015ad.76.2025.04.28.22.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 22:00:26 -0700 (PDT)
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
Subject: [PATCH 12/13] target/arm/cpu: compile file twice (user, system) only
Date: Mon, 28 Apr 2025 22:00:09 -0700
Message-ID: <20250429050010.971128-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Z+gL3zNPZ3X2

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index c39ddc4427b..89e305eb56a 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,6 +1,6 @@
 arm_ss = ss.source_set()
+arm_common_ss = ss.source_set()
 arm_ss.add(files(
-  'cpu.c',
   'debug_helper.c',
   'gdbstub.c',
   'helper.c',
@@ -20,6 +20,7 @@ arm_ss.add(when: 'TARGET_AARCH64',
 )
 
 arm_system_ss = ss.source_set()
+arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
@@ -30,6 +31,9 @@ arm_system_ss.add(files(
 ))
 
 arm_user_ss = ss.source_set()
+arm_user_ss.add(files('cpu.c'))
+
+arm_common_system_ss.add(files('cpu.c'), capstone)
 
 subdir('hvf')
 
@@ -42,3 +46,5 @@ endif
 target_arch += {'arm': arm_ss}
 target_system_arch += {'arm': arm_system_ss}
 target_user_arch += {'arm': arm_user_ss}
+target_common_arch += {'arm': arm_common_ss}
+target_common_system_arch += {'arm': arm_common_system_ss}
-- 
2.47.2
