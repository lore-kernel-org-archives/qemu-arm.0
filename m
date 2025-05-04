Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756153njj;
        Sat, 3 May 2025 22:29:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXM90QU/XVfxv/pxH7hC/xLQ/p7qMjfENKGTcAQPaPRKbHqQBEbITSx1wWDY1UouXh2LIaMByTheVmmQ==@linaro.org
X-Received: by 2002:a05:6a20:9f4a:b0:1f5:80eb:8481 with SMTP id adf61e73a8af0-20e06436606mr6803892637.13.1746336578305;
        Sat, 03 May 2025 22:29:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336578; cv=none;
        d=google.com; s=arc-20240605;
        b=WLoNyH+pkSacM7FTu0EFG31Ep88DQTSO89B4btlClOs8dvXq72jE1k5AzuCJ/17aUq
         T1Viex+f3kaqWeiBRbfbTgvKAyMNSNF2cDqt/i7yNfiuMT5n5bbE7wVxqyuxvLkcWDQV
         ieUQV6RhQ0zD5WUKwjDYo26qZyIAlBQhjsI+nx8mc7pC/gMw9SS9CE0wcDGk9FXRausE
         txY8cRU/NW2GYSeRpc/q5suYuumGPJu6edx6zZzXjX5t10D35rqMKn8IvCrWQMZfg3n/
         NNTfPcoT2r7uuG53Frg6/UCw03enNiq5kyCoYUd8EykHp4tCAEi2ETrymI8M9KWTBs3i
         UoKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=u/RowU+G9lDkd5OLEKmfnzuDeOXrVzkwWk098+SYGJQ=;
        fh=sOm2KKkDJtPf2lMKSVABCogVOajebhxvC0w1y547rOI=;
        b=kw4U849kuM45vho8mlesolp20EyOjvjrwa4qyVWGnC8yFjRbcrsR+zZfYq07Mk5Jp2
         8n5B5vQkX0vylTlnSQeGEl9jaKh9w2Kk8zs5PCZfcwvBlapIeSv9As5ihPTK7thpqN+w
         Y890EUgfjlTzorVPiywMaKMN11htbVHryH8Fsay7z84RwKNPlrUmgiOBDiaud66S+s2F
         o405xC7H7ZPcYlMYAMah0sYAoTyaPVnM++0qsblqsztsEa4mJZ1adaXXvIEm5Q5nUpMi
         r7JFADyFAUW3gHQcSZFiRuRWb69CW2TCF0Q9dypxhWN93ByUdYS2iARX0sM7X/eC1F1q
         EsFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A5azZuN6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9b325bsor5569514b3a.5.2025.05.03.22.29.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A5azZuN6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336578; x=1746941378; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/RowU+G9lDkd5OLEKmfnzuDeOXrVzkwWk098+SYGJQ=;
        b=A5azZuN6DtUtaJkj1gEyqmnQ36gkcZBfib4fsql16YabllofVMw1ok9mh1PRDpaDRv
         joLzRkogQlfLxUHW6/E2WfbzVqjyMbJbDRH41c0iYKiE6Hd3X6E9tKJ4MDouViGN2PMD
         3HQoWHhmlakw3vkG27ha6NmymXLcWiBUwInurEQ+5YNCp5jeDb9vNIiO4i7FijzwbQ6k
         F6F226rxgsKwhbp2sizOmzVLbOxu3X1nsByZLeU323eTJ/Ys2/tP+f4ZaltAZhceLx8u
         7pOFrj/wUFdl0n7psViwsjpWNAuOTFNeLJOZxpDouuWmkw0GgiSxjcaUBLYXYpKhnIaQ
         vaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336578; x=1746941378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/RowU+G9lDkd5OLEKmfnzuDeOXrVzkwWk098+SYGJQ=;
        b=GwPhJy9qjgMvxmgln8AkIUSV3abOQ+2fBpnwJSgHLikFrOS3XMjQ+AhfbBkafD9A2u
         XszC3/RRLFoGGaEZubZe7FvVPsvo+kevvQ4p3asG0r2yjKCRVUggqfmiCwieF74LMJan
         vEa+KIXtuA75lnCONO62+W3Yy/jABqfEDV4QLgxKFpttMLBxmLtLz2DVxKpLMI6zK6SH
         Odme1Gg+kPuvUZJ7EIzWupfnIWzQQzJXP5c9ie88uyaMMN8y1qwFDv5Ito0sSDr1Oc3s
         ERYSslNHAmKgmL7TfIGlM1X4sprrb5tUA1cgSgaINzmPKtPVXH8MdzvBwGsghEIf0R+H
         jz9g==
X-Forwarded-Encrypted: i=1; AJvYcCVt+Be9GMli9UOnStqmRJj1V5GOI7zRECxaJVzEwVxlz8msdhZcURmVRgWamwBhgt034eDjYo0x3+AjrA==@linaro.org
X-Gm-Message-State: AOJu0YwRRfgN3i9X6QxkBpqBb2kKK+QI3YxUraU294KNyiB36ZYZOBeg
	3iqdsWfj/DcJI7cSaldOoG12wOpyWAvKiaQjeL1hZDMlHxRsk92LDrLX+YBRjKjLOA==
X-Gm-Gg: ASbGncuECtl+PGPmp22t8cF3CmSyw1HVdWv6tzP5KTA5LSeccMs6cCNyRen17wn9X+y
	MIhMKZC7Nyh8Ni4+0dQZB/e0/9Bm14El0SNx9xTmPiBoskbqxGk6xPRdySwBkrB9O3blumv+GwM
	9ceObq/GSkdKe/jw6c1RgIpeu1+hAivlbgKo1jFbuNiyi5LRiw0kF7NvL1nUYl3gGgONCoRLCmj
	CLk3p9ySWokydjyjlNO4kAgWz2kshTszd1DRY/q6WoTV+i2/ojFmkb3dmF5JVJG8Ekk7TMipEzV
	+xOikRgeMDdqEZ2o81QIOcXYcpKa25+ih0KrbC6t
X-Google-Smtp-Source: AGHT+IFaP6D5Ew8hDYaflp+HVUummZVr2ncTgzSc1dejl9uu0i0B5hfKlcfV+xs9jmY0up0zG7JkNA==
X-Received: by 2002:a05:6a00:450a:b0:73c:3116:cf10 with SMTP id d2e1a72fcca58-74067443390mr6685540b3a.23.1746336577838;
        Sat, 03 May 2025 22:29:37 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:37 -0700 (PDT)
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
Subject: [PATCH v4 20/40] target/arm/debug_helper: compile file twice (user, system)
Date: Sat,  3 May 2025 22:28:54 -0700
Message-ID: <20250504052914.3525365-21-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 6oZ4uGRldU4q

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index de214fe5d56..48a6bf59353 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,7 +1,6 @@
 arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_ss.add(files(
-  'debug_helper.c',
   'gdbstub.c',
   'helper.c',
   'vfp_fpscr.c',
@@ -29,11 +28,18 @@ arm_system_ss.add(files(
 arm_user_ss = ss.source_set()
 arm_user_ss.add(files('cpu.c'))
 arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
-  'cpu32-stubs.c'))
+  'cpu32-stubs.c',
+))
+arm_user_ss.add(files(
+  'debug_helper.c',
+))
 
 arm_common_system_ss.add(files('cpu.c'), capstone)
 arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
+arm_common_system_ss.add(files(
+  'debug_helper.c',
+))
 
 subdir('hvf')
 
-- 
2.47.2
