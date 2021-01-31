Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2599790lfo;
        Sun, 31 Jan 2021 03:51:15 -0800 (PST)
X-Received: by 2002:a1c:dc41:: with SMTP id t62mr10885031wmg.106.1612093875555;
        Sun, 31 Jan 2021 03:51:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612093875; cv=none;
        d=google.com; s=arc-20160816;
        b=N2J6i7qNY4RZGGqqDnQeCodpqC07GvGah3pLhPN6Z02cjA1BW4fWL5kvz6+zbcQ6Zm
         1Uq5kIOCdrzlFXSBkzcBxJMN1u3ERX6sV2T3z3eVZRt/jDAeS8HKxFKKwgexiHnQfmRY
         FnCpCqLLgpQf8iTinxLC1TRdAFlS+d1H4s8KJX/JmmsyQ1t8hBafKnkklRQsnqrN4Vos
         KkDFywU+7RO0JDce63JNQ7UDztwBzSdm0UQi1xidB9Sy9mXYBpqELNlsa10PAtDKaGz5
         PVAPQmpExDBNYYdCZL4lp3sDQS0QlXQb0aI/Y33y3j1M1r84uT6ehM1yoT+B1BFCA30y
         j2wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=sHwmePAwBZnB/6MQG332p6aeurp1aOW9YUVHNzJgQQk=;
        b=KCqAoENdldTX1p0dxub+BOtVl7WuPUh/el93uT28Y+y6KZsTKB7ROR7ocl38bPJkFD
         zr5apVoPqroR1PKDpolATgRGksWj+KGEEeJGB2UeBKLBHN9nlbKfi4vWqCQ9HVbYoFTh
         EhlrI5BLvlz/53KPo2HA4JbLDNha/fFegN7HihbL0WBfMm0fAqPRvHt5R98jvs1As0cv
         QJVLuutzL4SvJcoypKCHVA48DrxiBgW357jA5dzryUSx4rnks4bysH3MGNtgP1KL0qFR
         Mdm1eK6JVsmsyi82UhY9AWW+VAmBfTQqQv1jTmO6IruhsW3TCGdwF5x+B4GSJOBnnOZ/
         99Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=gl98KYub;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3sor6592509wms.24.2021.01.31.03.51.15
        (Google Transport Security);
        Sun, 31 Jan 2021 03:51:15 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=gl98KYub;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sHwmePAwBZnB/6MQG332p6aeurp1aOW9YUVHNzJgQQk=;
        b=gl98KYub5B29/tDooPia1xnr8+DmGiIx/UpfjZiG2dzed7ztMbOcE8dmG/zmD7gDo/
         m3xjb2iOLwq4AAnp936pJB2UouZ3Pp0jvFX0EsfKlRJ2IQmdAGNbxE9BodCmgzqA3Ct0
         TLXHEvox2NBLbAcOgZDzUhtVagwSvVh+EsbIlZWKE051QySQy3QpembGI0HzfLJ9puRy
         Xc9uTGEJSYwRLljm4PblNNWj8OU/kwtZNbNwvbfxiI6dFrNbjLw1T9pEqCv3Q5LxRi+F
         3FtUQXdmzCR18IAHolP9KhcEobiw7hrsRc8eUqk1F42n4Xisy1QOrEZgC5TAU0cnF0oB
         3m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=sHwmePAwBZnB/6MQG332p6aeurp1aOW9YUVHNzJgQQk=;
        b=DWc1ucckArWu8+T0X6dyWXnE+yrzOW7eKjgVYsHydO1z8Wta968kGffQfDL5b5kFLS
         O9A2jEFJlPuDzDln0DTyvGzCnhpUMNMDsG4xS07gpMvOjO9UPviTIJQpPwbIEmwF64WU
         jzZnXZivZlEjl0YxTWLMeGpiISDYVYSivGf1ytUcfjgAVPe2mQ9ZAD9w8v1h65gRW+qO
         Bfvd+Zj+XlOpYSoBQCd06847F4W5ZAgx8NA6K4Ry7xGTMyJkzpjU42iEIVJ/0EEydo+V
         18aTEGDghA/yxnWybihs2RDTDlF4RPkakpsnae8duTsLVWSpI2ba9AcEKquE5N+H6V33
         lR3g==
X-Gm-Message-State: AOAM5300B7KbjGeM4aptW5jIFnCjetRk3qApwoVSmT8qyk9EUj/PpNMM
	MF3y/N/ujNgkFy83X8R3wzwoCnTufKM=
X-Google-Smtp-Source: ABdhPJy9DTxPrkq+mLcZ2GZAl5OyfPZtxNOXX4s39rpFzMKgY9kX7aWG61oNhcsR+ZIgBSBAHI6dug==
X-Received: by 2002:a05:600c:210b:: with SMTP id u11mr11134979wml.16.1612093875310;
        Sun, 31 Jan 2021 03:51:15 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id r16sm1563538wrt.68.2021.01.31.03.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:51:14 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Fam Zheng <fam@euphon.net>,
	Claudio Fontana <cfontana@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-block@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 09/11] target/arm: Reorder meson.build rules
Date: Sun, 31 Jan 2021 12:50:20 +0100
Message-Id: <20210131115022.242570-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131115022.242570-1-f4bug@amsat.org>
References: <20210131115022.242570-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DOUcj/vPhQIc

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Reorder the rules to make this file easier to modify.
No logical change introduced in this commit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/meson.build | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 6c6081966cd..aac9a383a61 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -14,31 +14,36 @@
 
 arm_ss = ss.source_set()
 arm_ss.add(gen)
+arm_ss.add(zlib)
 arm_ss.add(files(
   'cpu.c',
-  'crypto_helper.c',
-  'debug_helper.c',
   'gdbstub.c',
   'helper.c',
+  'vfp_helper.c',
+))
+
+arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
+  'cpu64.c',
+  'gdbstub64.c',
+))
+
+arm_ss.add(files(
+  'crypto_helper.c',
+  'debug_helper.c',
   'iwmmxt_helper.c',
   'neon_helper.c',
   'op_helper.c',
   'tlb_helper.c',
   'translate.c',
   'vec_helper.c',
-  'vfp_helper.c',
   'cpu_tcg.c',
 ))
-arm_ss.add(zlib)
-
 arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('m_helper.c'), if_false: files('m_helper-stub.c'))
 arm_ss.add(when: 'CONFIG_TCG', if_false: files('m_helper-stub.c'))
 
 arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
-  'cpu64.c',
-  'gdbstub64.c',
   'helper-a64.c',
   'mte_helper.c',
   'pauth_helper.c',
-- 
2.26.2
