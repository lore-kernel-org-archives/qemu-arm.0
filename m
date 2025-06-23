Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2509979dyb;
        Mon, 23 Jun 2025 05:20:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWglXOAHqzpw3X60uvJBPz2zXqtpwJgbpOjMWIRI0XJye3q8ec/1lsQWczpATgg31lBswwmS7ll6h5hNg==@linaro.org
X-Received: by 2002:a05:600c:458b:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-453655c6142mr118632025e9.21.1750681215377;
        Mon, 23 Jun 2025 05:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681215; cv=none;
        d=google.com; s=arc-20240605;
        b=LStZWo5zT8NQFaKjoqz8Vrt8+wqldBWOLnCO5CAS91jxaWnD2/l2M24BJAR2jvfuG/
         s9GAV59BIL0PMhVd6CRQSY7dV7meiuGwt32jmOdhdb4KPXaGA30QQ6mQWrPXM/1RatVE
         P+ndjhUShi1fgEEys0y/3OChA+nyBr6Nopn2fH0OOYjeSmQRpeDIe0qxgIF4b3Gl0X8D
         5L6slGHE0Gb3TaCuv/LFCfU9sc0C51fDTtnGY33IVLr8HE6aqObsiRi6UdXLwaQMZRDl
         vFWLLkFXELcck7fY/4CP9T/73lWJs+nLEstDOWsGA9owCoDQiNWfwdU8K4Hqn+aaaAte
         /CJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NW0Hu04oFurHIvjEpsNrwT15qBihdHLv3c5t8qKFRhE=;
        fh=RoWjtrel0XYgtI/b4xA2GXqhGEFNlkoh6y0kQqNjino=;
        b=k4vaYPqUpyUFB7UPLgMlH3RAkI8LuTEr2Qn+meK0Eva1iI6YmQYOibrpV+H8+BtZyO
         AYy0siV7YygarKCvgViOVRwuVEXABM54pAJ5YK4haZdlU7yRjlYxMLtBUx5/YZa1V7v4
         uqKbG3PK6DfnZBAPqmlK519XzkiZrHklbK58j+BgaxsZSsVmBTOsKr7Fj/+cUPlM/vFo
         WqSQ6lSSGQxqiDzgIIGykiquq9W2a/XjnIsCq3Xevi8sZCnIP28XaMWF4Auv/Cx7V0F5
         1JwNDp29dgADoCylazOIciA6F9f6alG5R6GY4pyVqlARUT/w96UM3s6OyxjLNKKNdk+n
         DtFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PTJKebNm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453646fd335sor26602065e9.6.2025.06.23.05.20.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:20:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PTJKebNm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681215; x=1751286015; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NW0Hu04oFurHIvjEpsNrwT15qBihdHLv3c5t8qKFRhE=;
        b=PTJKebNmfUXhUXjDzz6wy0Fzm+taIaaETEqfSzX5ZC7qaTskD8BQfAbmAKPn5wEnOJ
         0suVI8UrfEeH++1BdwrQES4WhDIZ8SwD7m32Ca+c8XnC9ZoB6C1JaeE51odsUZZv/d7z
         Jxj6GPZ7x3LVLA5Jyi0nqrv0ravPK5bHj+755P1q3bQLirWarIt9FJV2U47L897aaY6A
         fH47A+uu8Ttz3Y2x2xM0U4JaOaReTd5gwUAnAetBk7crgZG+QN3Va1CdjaVhC1VavDFu
         i9yfQ2u8v29TFWyodBso8kqiDxZUbksXgyLjDMjo95tLRhe6umhBPefeKhUrKxjNE/2F
         W8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681215; x=1751286015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NW0Hu04oFurHIvjEpsNrwT15qBihdHLv3c5t8qKFRhE=;
        b=K5W6lm+7YuzqFeXumrZZHTWvLENO8mSgWDHA2/jd16DeIJ/Cn/7YEN11P009DhAl/Q
         Ls4FlB8elLvor4wC4nrskOsUPkEHjGp/iWPJ+44QncW+XzLoukEGUWpJOffoAjMeH++F
         kfCADdYl8L+UQdd8HZd+/Y9MVO/+Cl0BqeTDiLkeBSyeHvWKKJEFK55g8FXCUrvXGl/u
         jhnBs2jCEZYV4fY4TP3w6J9llFLAeI6/UKgJP0Osj5xhoPwcJrPPhi+lWg6XcOqBdxLk
         /BnLjfnQaWdp8k5Tw88rNeiGEpyTfK/dck9UXewxC07YTux3T7iX2bs4jcbwJ28430ne
         ofzA==
X-Forwarded-Encrypted: i=1; AJvYcCUdNxKqltQSPd+FrGbvTC2as+Bq0wm3x6fcUeOQcf657iiKvZdQKSM4t7ZnJoi9IqCQ1aOUQmzwzUpz5Q==@linaro.org
X-Gm-Message-State: AOJu0YzOQ0qGmdiwMMNtG8IEm7GTaBX3XskqcLnXHTm91soqJ5tF5Gb4
	H4eJ3OecfOqx4FB2MimRZKaz7FpuFmn/nHm9umobMy6eYI+mgVi4NORY2IUdn/xknJIXag==
X-Gm-Gg: ASbGncuQGqO5NL9pJuFXs+IgAMwzzILIh6RsP2Z4rAsUPFFW6a0SvxLp7WDxxZYS05Z
	ibMj13p/mgGvjApseUsN3+9EWYowUqqRbpBtxuR2J6iV8+d/gAwSEswRsA82W944mQfRanghLd0
	jkrauZNGtCOhwESwIIMPvsER7b6tQBbrdoApNBdB9RmaRcj5lgcsUkPJJlMwN9O/oufpYfOtk8W
	MeVHt+T6ZxB57j2xn6RsDhAYJNtp9v75QbbQ+xq0tFQrcnlXhfddZbc0bO74YIp0EYqSXTl+OmN
	BNkMWmKPezsrRIi49OeE1TF8+KBjGHhVzygKBw63HGGPSDOGXbhL7TBZ2sJo6hAbY3sgaSCjY9X
	bLESxM/dcehRekDmvXAfH9UmR9rCfIeo5bNGO
X-Google-Smtp-Source: AGHT+IFf+qYjcOwhbvT72NmXzsm0w8Ys9vtpByCOFfjMZimo/xqX2xIjROq90NsVmzqznUgThHB+QQ==
X-Received: by 2002:a05:600c:548a:b0:442:e03b:589d with SMTP id 5b1f17b1804b1-453656c2b8emr119430815e9.24.1750681214699;
        Mon, 23 Jun 2025 05:20:14 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45365af83easm103189385e9.25.2025.06.23.05.20.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:20:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Bernhard Beschow <shentey@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Cleber Rosa <crosa@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 17/26] target/arm/hvf: Really set Generic Timer counter frequency
Date: Mon, 23 Jun 2025 14:18:36 +0200
Message-ID: <20250623121845.7214-18-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Gz9qc2NC0RIr

Setting ARMCPU::gt_cntfrq_hz in hvf_arch_init_vcpu() is
not correct because the timers have already be initialized
with the default frequency.

Set it earlier in the AccelOpsClass::cpu_target_realize()
handler instead, and assert the value is correct when
reaching hvf_arch_init_vcpu().

Fixes: a1477da3dde ("hvf: Add Apple Silicon support")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index fd493f45af1..52199c4ff9d 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1004,6 +1004,13 @@ cleanup:
     return ret;
 }
 
+static uint64_t get_cntfrq_el0(void)
+{
+    uint64_t freq_hz = 0;
+    asm volatile("mrs %0, cntfrq_el0" : "=r"(freq_hz));
+    return freq_hz;
+}
+
 int hvf_arch_init_vcpu(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -1015,7 +1022,9 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     int i;
 
     env->aarch64 = true;
-    asm volatile("mrs %0, cntfrq_el0" : "=r"(arm_cpu->gt_cntfrq_hz));
+
+    /* system count frequency sanity check */
+    assert(arm_cpu->gt_cntfrq_hz == get_cntfrq_el0());
 
     /* Allocate enough space for our sysreg sync */
     arm_cpu->cpreg_indexes = g_renew(uint64_t, arm_cpu->cpreg_indexes,
@@ -1084,6 +1093,10 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
 bool hvf_arch_cpu_realize(CPUState *cs, Error **errp)
 {
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    cpu->gt_cntfrq_hz = get_cntfrq_el0();
+
     return true;
 }
 
-- 
2.49.0
