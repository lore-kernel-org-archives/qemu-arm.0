Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp989417eju;
        Fri, 15 Mar 2024 06:10:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCViUEDHWdta77ePrc8CRDXav73HN2vb4YIZhhpB7RlnXVdr8lvBlLGUrmsBe9Lc5a65JsgHwjEePY2GxVWDNIEJqpILJn/6
X-Received: by 2002:a2e:86c4:0:b0:2d4:57c5:886d with SMTP id n4-20020a2e86c4000000b002d457c5886dmr3519914ljj.1.1710508208411;
        Fri, 15 Mar 2024 06:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508208; cv=none;
        d=google.com; s=arc-20160816;
        b=Nktizt6I7el1V4HyAao4XGkEAAY0wsAWCa2aWO34dxFbGoeYS1Rsy7oCg51ZZY1tYL
         WRspKVzu2mAe9Mq2psrUgmCUzpf2LmDPGxsoAAbpUJjPkNSlhLTBnVtwZT0cRGA2z4EN
         znxwe6lbTQ48GMt10900wrjlpjogwcfudiWR9XG0q3m6PiXRKKxHe/+bbl0CV9Yu6esH
         wL2UZrAFjeXFf/Z9h8lCxZxRqg0/6mydYUdK6+xnj7Kz2HJP/I1XEU6SEgLwl1m4BC+g
         eoV2DzMWBYp+nCm2Y0LRCpHltpoDxrb2grZxhIkdOamPCQXI1EHG1rvyn09/GVFBXmRc
         hJmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qDIsKXjb1Jl9yBqR7T/u0FWdWtcs/rDVYwZEhcpoxew=;
        fh=LVaI8glXXTv9B2cqZnJMJoH48z2E82bbFLz/x29yKwA=;
        b=pBObq6NcDDtauZzjixe94NYdEPBuJXCs+YMQK3LX2r5PJaHOZbkas2cpI97XDyDufg
         vv+8Z0dQek2Ey9BXs4JJkf0ZnolN1W5b3JRzmWUhGuGbmsfgXoGo870Jgi1jlLMqii3s
         CNtrp9mzNcSB4VniEHzUsCgYA0ITXs5O9I+0z7IBen9fIGrhGiIyXULb6EvHBmR2WPKl
         0LgPAk3Hrw/l2d/kzBlcaH9ECJgx2CBv+Q0lH07MLF5NJXIdoGwPMZy7RRZnW3yE0vou
         2Dfs53OX3fPmZxr9liZjDEBHS9A3E5DxRKA9fgZJf5A3w1ZO0oMHrl81S+Gs8V9Fecdm
         Xgtg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DwxEqJzh;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t21-20020a50ab55000000b0056836c2c1b4sor1089086edc.12.2024.03.15.06.10.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2024 06:10:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DwxEqJzh;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508208; x=1711113008; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDIsKXjb1Jl9yBqR7T/u0FWdWtcs/rDVYwZEhcpoxew=;
        b=DwxEqJzhNL1clT+4LjllDqU8e6Pqbi1Hj4FkjUgmicNwguVAzT/EWhce2Vjcr7UGgY
         0mCcB0Q3hWspktYadXdmTDu9IIqbjxaoroGHtvRkQgAxMOQgTQ007tZPK3U8zWytYkp/
         /bt3eQFc1ds90zbzKHtFj3GNx+iEQBKHaLwrubDZMG2L3+RIKmFGKRikQnoCFYEFj4dP
         iYXK8c4SIQYIpR3k3qnp0INWuh54LWaJBod8iuXNuZ7IU5mLEE4mloxLm5lJZ+RxefmY
         LiLx6aQiSfMAUq8mns0d8wfrDTaJSy6J4wv4+RwQK4IOuKXBeFo64IbE8/6hRClGyGiJ
         4aRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508208; x=1711113008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDIsKXjb1Jl9yBqR7T/u0FWdWtcs/rDVYwZEhcpoxew=;
        b=CgYeHQHQKCW+Ubn3Nww0eu53WSu6OHw8Oxmx2NAmwmj1OaJR+zZYbCKm5pd3EmaIXw
         6ZwAuozBzokmELXElLruL8AH5RK8XEhMrSlerkVsL0Qd7rTMcetCwRb9utafwNOnHrMz
         GOps6DTdCZDV7SFvc3zH6WnUD+KG2RSXLGujkbnnSDq0WdlLA5151klHQn8lLvoUO1mL
         9gSMv0286YZw+Es3DtEF0HoYxB7HZlnMbNY9A+wbRK5pKqyxjEM/ako/0OM5GuIZonnO
         T3J/6fcZVxQ/mfGliDXNfJ8bmm8McNdo8+f0HOlW8iITnXubw/xLcEcLZ2ZQEBLbZVBx
         7FiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx/Gkdlli6FE+Hzx/CwatNXfwxuFrLP0qTASDk7Pathk8Z7R66oTj2zHyLRna5P+y+QJPmaWGXFa9pGmSaAB/dbTOuOHIQ
X-Gm-Message-State: AOJu0YyZqL42KunkZYPTChDBK06A8P/8YYLmAr6tuJgcNmqLAQ7ptEcB
	a+3RrO00/l/+qhSdI+TjTfNvGrHtiE8J2viRVgBwfZrehptVIiPs+XwgQZFTSNpjQA==
X-Google-Smtp-Source: AGHT+IHz6vQYIeOBcjGc+xE2c8P3SUzSTmtoEr2FLDXsqrRWBjGskKgF5u0V0+3R6przXpowCYuWpA==
X-Received: by 2002:a05:6402:5512:b0:568:9c6b:eb0f with SMTP id fi18-20020a056402551200b005689c6beb0fmr3550192edb.21.1710508207999;
        Fri, 15 Mar 2024 06:10:07 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.145.26])
        by smtp.gmail.com with ESMTPSA id dk4-20020a0564021d8400b0056706105abesm1689843edb.33.2024.03.15.06.10.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 Mar 2024 06:10:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org,
	Anton Johansson <anjo@rev.ng>,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH-for-9.1 08/21] target/sparc: Make SPARC_CPU common to new SPARC32_CPU/SPARC64_CPU types
Date: Fri, 15 Mar 2024 14:08:56 +0100
Message-ID: <20240315130910.15750-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: d+Uu6rYwJ3MB

"target/foo/cpu-qom.h" can not use any target specific definitions.

Currently "target/sparc/cpu-qom.h" defines TYPE_SPARC_CPU
depending on the sparc(32)/sparc64 build type. This doesn't
scale in a heterogeneous context where we need to access both
types concurrently.

In order to do that, introduce the new SPARC32_CPU / SPARC64_CPU
types, both inheriting a common TYPE_SPARC_CPU base type.

Keep the current CPU types registered in sparc_register_cpudef_type()
as 32 or 64-bit, depending on the binary built.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 target/sparc/cpu-qom.h |  9 +++++----
 target/sparc/cpu.c     | 12 +++++++++++-
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/sparc/cpu-qom.h b/target/sparc/cpu-qom.h
index a86331bd58..6ad283506e 100644
--- a/target/sparc/cpu-qom.h
+++ b/target/sparc/cpu-qom.h
@@ -22,14 +22,15 @@
 
 #include "hw/core/cpu.h"
 
-#ifdef TARGET_SPARC64
-#define TYPE_SPARC_CPU "sparc64-cpu"
-#else
 #define TYPE_SPARC_CPU "sparc-cpu"
-#endif
+#define TYPE_SPARC32_CPU "sparc32-cpu"
+#define TYPE_SPARC64_CPU "sparc64-cpu"
 
 OBJECT_DECLARE_CPU_TYPE(SPARCCPU, SPARCCPUClass, SPARC_CPU)
 
+OBJECT_DECLARE_CPU_TYPE(SPARC32CPU, SPARCCPUClass, SPARC32_CPU)
+OBJECT_DECLARE_CPU_TYPE(SPARC64CPU, SPARCCPUClass, SPARC64_CPU)
+
 #define SPARC_CPU_TYPE_SUFFIX "-" TYPE_SPARC_CPU
 #define SPARC_CPU_TYPE_NAME(model) model SPARC_CPU_TYPE_SUFFIX
 
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 42b13ab63f..9e27e16b75 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -959,6 +959,12 @@ static const TypeInfo sparc_cpu_types[] = {
         .abstract       = true,
         .class_size     = sizeof(SPARCCPUClass),
         .class_init     = sparc_cpu_class_init,
+    }, {
+        .name           = TYPE_SPARC32_CPU,
+        .parent         = TYPE_SPARC_CPU,
+    }, {
+        .name           = TYPE_SPARC64_CPU,
+        .parent         = TYPE_SPARC_CPU,
     }
 };
 
@@ -975,7 +981,11 @@ static void sparc_register_cpudef_type(const struct sparc_def_t *def)
     char *typename = sparc_cpu_type_name(def->name);
     TypeInfo ti = {
         .name = typename,
-        .parent = TYPE_SPARC_CPU,
+#ifdef TARGET_SPARC64
+        .parent = TYPE_SPARC64_CPU,
+#else
+        .parent = TYPE_SPARC32_CPU,
+#endif
         .class_init = sparc_cpu_cpudef_class_init,
         .class_data = (void *)def,
     };
-- 
2.41.0
