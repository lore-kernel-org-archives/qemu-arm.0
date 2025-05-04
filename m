Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756122njj;
        Sat, 3 May 2025 22:29:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXfzZcRQVvlP64xsiyeGLoSkXsyipQByholN+5/KYTMbV7AAhrlrV8xeDthcAQsJXUzZ/mbbFHBWxKGWQ==@linaro.org
X-Received: by 2002:a05:6a00:3774:b0:732:56a7:a935 with SMTP id d2e1a72fcca58-74049265f69mr17726634b3a.12.1746336572152;
        Sat, 03 May 2025 22:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336572; cv=none;
        d=google.com; s=arc-20240605;
        b=L6m12PBbP7CsQ0Z73Gubxy5wR8yIzd9ClLaKtAT2zRLrL6b0NBpUGUHSzPGTzNg2wH
         /d4Rmph+hQBjt/dXjlq8NuBhZILZQVb+If3p4JZzWoj6bIppNVdbz44B362UDGGHGssM
         v433KcVoP5Vt0vcGGx1d2EnJ1TAZ+gS+foqiPH5DA8EIPAK9+tsbGBpo8DlNgzWmJOcf
         X5nPMFNILxlvdwjKsmFuD0ZItltPCO2IUvP4KsYwOikvXHtn36fJIz3xwRGYUpsgcj90
         LN2D0EUfNbsRyriFbIJZr3kPEhx8s+Nq673aPmwZnIltbIfiuiTXOs7+u9ta4RE3//dz
         ZgeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Emf7r2NlJCGBegzvSaP4+YNHnVcvC5KK1KGZi+oKRes=;
        fh=muTdy83GWbK7Zh+nernI5PhTZAc8q+MmW8dGH9dLft8=;
        b=UG8VA4n6EnPjVa6OP/kFyYZPMvn9TepkNd7+TOAaMNOQMaNWdf+YS0AK0qut+7LJ7k
         14robt2WSEM8yMqDjvJWkofY6aFTPfYjeGN+RJrVFtgUrr5GPys/es++ZXa3F9wL+JxP
         X4xgMlsqordOwSfQZ7wnAleLRw8n5cBv51yiBLgeyXBxPXrWuzNzeA4n6w4Zynam1NDq
         AgYvv+9/TjN4l5/AdvuP791FApQZ6RO/WPKZnrtqqtOUHU1Q9EP2tx5r3/imMH6iVyu0
         PGkTOznkYrncuOF7G5LaSe7ape8kla9u7kvEYmSBuVTEiHWoXgcjF0iF6TNkkqnY7cYp
         MyuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JiiHWJx1;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa16a8dsor3060251b3a.5.2025.05.03.22.29.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JiiHWJx1;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336572; x=1746941372; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Emf7r2NlJCGBegzvSaP4+YNHnVcvC5KK1KGZi+oKRes=;
        b=JiiHWJx1lv+fFyx8ce/1kODYYR4NxfPRC2FQPQQrokrz0HnKLXehDiCDCOEs6IIYnr
         rbfoJFUd9s6muMsX75NUtiHwZrw4Zfj8ukyX4WcpRSijAVV3fCvs5tWOYwvuFdCpyQ3a
         2spupZy/BXEGWNvZfkrvu5rfTr0HT75kDfmE3FeguNeF7DV9MLnXkImP6lE40nL44Ksa
         xWexng8sAHuVuAMdKffOPqwM8sGDLoIkoN5AMBT5hFcpBu0bKd04iWlwud6EzMF3PqMe
         PWHHqj65Co0s9wwegL8G7mVcVDvTOj5Pg+37XExCzMXLw4aDm18zzNDOfL6kZ9wSQ8fE
         ZJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336572; x=1746941372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Emf7r2NlJCGBegzvSaP4+YNHnVcvC5KK1KGZi+oKRes=;
        b=UwBohS2L0tzfrS4Pzac98trHeDyQnoP+gkX+MK0ZTQRZ24XnMkWrnoJF1SobSlY5Rw
         7BJGRraNJdB8SnPhZcSWG5+Ia8pQ9dP5ItewWl5vT7Az8cqibxl4aA4Gl7JelmKORHh9
         ftzV92A1uiSqKduPLAdTaVUrK78WlRPJoKtLLGQuwBw1V0M4PvYu8jkaWBNBK2BTCY/8
         Xgqe7/aeSKPD9kB3AT+ITYFb6yed7n/JZyIBuaiOsYitPvSqZHSBDCKHsQIFmcrRpT7u
         Jrd3Yy2LnhofTtjUdguATy8SvJ0Gm+7r+7ZZGZnDbPHyMtyVfm1303yWb0lwn3hqJnkh
         4HkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdGLdlLRx+4rOz068N98ccds1wuhtckBHj5SAE8rnyKtWJB6KbFRU7rMHLus3ZgKJacosI5oookfHL0A==@linaro.org
X-Gm-Message-State: AOJu0YykTDLLtaGQfVgY0FIQcbI2OXQm53cCcdiT6w0wnBbBLOmDsvXp
	BnSHonmGsThmhc3204Z8nU+UdlRFisXKpVaxIdCHP6YbsvXNeBCf3EtDBJX0HWByhKhT5nl81YH
	M0taGFA==
X-Gm-Gg: ASbGncvD4dbnRSds3/IfZhdfwHcpSJZ0LBjuyMLqKRsIN3KlsuOD35ciErpOMYtKivQ
	p8iUQ8Zy7RnZrhTJG3LzyWCLPSUafm9JXJQ/3R8WPVIkhQVAvuVeuYd1MpfGkWem3aqYz3oaz8x
	vXu30bC9JaVIpUzFLLhITKReTVlefxX+WBUWZMWEqsNeeqAzi77X5pLH/iT86qh68I7x+seJ3qM
	yrTywgmOVN3+q0vPD6uuCr8lT6BbY69Eteh9nIqn0SmHh2wv6kBBqssZ9snGYNQLn/T9VqldZ9m
	hvmT3xSj3YB+vTAKe67rQBT/Bxuc93/JzL7TXSwJ
X-Google-Smtp-Source: AGHT+IH252EWjnH5DLBOIaSkYHKk6fED8pkBcv5fssuzsDnYonZrqjLHB+BuPp4SpV0ym3S7HAaCVw==
X-Received: by 2002:aa7:9311:0:b0:736:bced:f4cf with SMTP id d2e1a72fcca58-7405798f929mr14072441b3a.0.1746336571700;
        Sat, 03 May 2025 22:29:31 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:31 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 13/40] target/arm/cpu32-stubs.c: compile file twice (user, system)
Date: Sat,  3 May 2025 22:28:47 -0700
Message-ID: <20250504052914.3525365-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: fGiqjHMCuzc/

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
