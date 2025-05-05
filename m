Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178817njj;
        Sun, 4 May 2025 18:52:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcsB5KF2t2op06t/FUHnAFUANrAMk3O+oRA4uMLiIrBgBXvdiYNzx3zsLVrIB0ui7IydGcEEvEHBqyfA==@linaro.org
X-Received: by 2002:aa7:8542:0:b0:727:39a4:30cc with SMTP id d2e1a72fcca58-7404917164dmr18410683b3a.1.1746409968810;
        Sun, 04 May 2025 18:52:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409968; cv=none;
        d=google.com; s=arc-20240605;
        b=ZcsDn5/AVkwLraF4iNms3DOIbq5a+ef50YkLSi+LWs0LUYAD9mysyCB596AOj/Ze22
         oPPYuPNhV80mhfjs/OQEav+cnH2v0hPLWPPMQ0t/TOaXEYzMRIiRLPEmTlzLPdV9j0/m
         xH4Y0danVWo4mtmW7zhGb/KpOQ6lA4RqBGWVmPAe5bhvqvQKnNPUSf3rQoKcRe7NYqAT
         vHWqC3aPJWHoRav6/qIPOL7VWFf80YGBzL4nyZ+1yS9I/v0aQ7uCPmSZSahVfOUvZQ2O
         DLysEZXrvu/DVHwEcacPYM4bk9tI2QNG/nuMg1GlfUHx9skt7Es/Z/qRtEEopwFn7Cht
         6W1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZaY3toZMvHik6Oxfda0st+OdZGZoqXe3KmHGIqEM8+g=;
        fh=X0OB6r33P1NbNx/i2f0eTmKHgGIF6EsSoC5KXNCuNVw=;
        b=OPd/U3CkKd7Az5e3VyB+d6qqf7dFHQq+9JFhmESkGRQhcR04YlOlLrdgaTvF44etx4
         kvNOk3XNiV0bYBXN5BX427QaURuABxeFeijANn8v1UaxqO2gYI2wqH/+u6kLUBUEIjU7
         UYnoOn+qpLgZBreSZgyiA2i6473rcwgoP0A5msbaFxkmrFpSXO1Lfg+YlcPYNViJ+7M5
         ZqEfYtrO9Gx7404rEm3I6ydRQ5cuZ1044WYeqP7kYZ0h8MIdcYX8lz0ABABAoVbUqW6+
         uP+HQGAR035TU/ngVt91IgoBJuHDR+fQwl1yea3Ot719p6C1/UZSTf3dcpgzb3+ZXXuq
         IiaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RGnUuI5Y;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7403a77bf0csor2640109b3a.0.2025.05.04.18.52.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RGnUuI5Y;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409968; x=1747014768; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZaY3toZMvHik6Oxfda0st+OdZGZoqXe3KmHGIqEM8+g=;
        b=RGnUuI5YwoaH1AluhcXtWk5WIODlJBnze9G492r482ishnQSDH3nap+3IfIlG6WvVy
         xAQFffmWnrGgz4TIaheO5UkhLA2Dpzjnm3Cnodey33wQOossa8I4URMT+eF1XXC7u9pA
         2Jc7q8l960weqQcIxBRfk1s0qajODENqPwpsyFzPu0E8svyPVv8niosaVTJS0E52JnuV
         kPgci8WxYqXbL7WRm60m0SYbPJ2W/gxixTOSJBykio2aX7/DE0R0/m5GEFNktmKMMApE
         JSC8oi9jVqVc37jpNF/0Nzfxb2x7z9+JGC77shm3MAyPei+5nHbYlwOelHJ2hZBQxXyQ
         r6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409968; x=1747014768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZaY3toZMvHik6Oxfda0st+OdZGZoqXe3KmHGIqEM8+g=;
        b=D2Ue+NKtva//w71NbiZsnKiSasHx+ApiPsvmJJiZuFcvFbArxdxaRuEEWmBUydsGB5
         3XcqiQRDSvCVCf18AH9lfiKkFHSlw3hFZoPPweCLH8epwfjPX/9QY2D/KX5erg1slVYM
         G7dEA0XdaT5TTvvquSZYnR/F9zlriGyX/yU5HY8ovGKcnaB9nHfqtJh/eKdvRDeFSOZ2
         6IUMBKptPTlT5FjfMB3Xl5HFGZltG2vLDAKevMN9ALFa9JYxG6yjsV1WUEtHnKUqzjwK
         Ik7v5ChF6JP+MuthjueHrPnu817jBLG54jW7d5sBpbh5UdHl5gdzdetoeM+Yn6mAdxLj
         s9RA==
X-Forwarded-Encrypted: i=1; AJvYcCVOtIKBGiEmq6MzfZr8F7JFq2eA0yrsaYo7ReUcfwuoDMhlTLNnG3jxOfLsLakJZFv+AAD/SPgQzN+j+w==@linaro.org
X-Gm-Message-State: AOJu0Yy2HBdLsr622gRlzUbAZxJyObA+FEvZrgRom11oZwR1DBOgcewf
	p1sq5F0QMTD2gPktpF44knJHb3vv9mb3iSefr6DXyTube+2qKl6d5HG6scKrOSqq4dhKGArZWo+
	kLPUsig==
X-Gm-Gg: ASbGncv5fMn//0dIYTz66geN9LqAJGz2LOD4xpt/x5tOB0mF0lI053Fh52HIDMRnoXL
	DYTxB2Z93q3ZiDSdVMlzW1pxk0I5YHnkkcYxj31I2B/SbLgVeZOJe/mZ7QV4g6TJORwG8C3Dkhc
	tIB8YWfKmmd2ibLgugwfjRUSn51/DZj9/nf0iWHctqYCBNyiupq5c0bK6Rjs5g+EvIZc5Se9w6+
	59XOdGcI0o3skRCz3dLLUTTSnNCQgsW6jCtsy6unhfiRx09zRB4a+gffjrYWL4OD2T4U/ReKYGj
	sJPTmMPrjHIVh9/aNFEDuaqRh6Uq4WOZV1kPIWB8
X-Google-Smtp-Source: AGHT+IGMm7xh0qrjrDmS5dokWUiqHyCM8ckPHkrd3OnayFEN11uivxurPNZNriZNLtkAQt4mHaKPwg==
X-Received: by 2002:a05:6a20:c890:b0:1ee:c8a4:c329 with SMTP id adf61e73a8af0-20bd47660fbmr21220313637.0.1746409968309;
        Sun, 04 May 2025 18:52:48 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:47 -0700 (PDT)
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
Subject: [PATCH v5 22/48] target/arm/helper: replace target_ulong by vaddr
Date: Sun,  4 May 2025 18:51:57 -0700
Message-ID: <20250505015223.3895275-23-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: As923G2378zT

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 10384132090..7daf44e199d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10621,7 +10621,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     unsigned int new_el = env->exception.target_el;
-    target_ulong addr = env->cp15.vbar_el[new_el];
+    vaddr addr = env->cp15.vbar_el[new_el];
     unsigned int new_mode = aarch64_pstate_mode(new_el, true);
     unsigned int old_mode;
     unsigned int cur_el = arm_current_el(env);
-- 
2.47.2
