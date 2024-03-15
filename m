Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp989221eju;
        Fri, 15 Mar 2024 06:09:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSHbElKz13InJ2aXqCN7GuSV+VOGkp1WkuAAXbK51eQ9erqoM+w49vCNKqnbxc45UmgBOKArH6r0iPUVH+5hE5QzaHmbn3
X-Received: by 2002:a05:6402:550b:b0:565:bb25:bb7a with SMTP id fi11-20020a056402550b00b00565bb25bb7amr3525213edb.24.1710508194029;
        Fri, 15 Mar 2024 06:09:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508194; cv=none;
        d=google.com; s=arc-20160816;
        b=oox9bUzUV5zf+htA2KF8lCMVlZ9qrySPuJFf+wEPZPe7OzJnTnWtQIrrftPp6arPDk
         qPRo8px77sgHRzokgv3O2euWNzc656rUuHABeHY40pFDUcDmtCvlAvcSzBJB0LiUaqCG
         m02GcjwCz7IKKURm0RsQOHnJiEIbRbDkhXw7uh0aetGjN2TXy/Dgeeg+oq7/eyS1/7eV
         RgTlmGuPDwGglOdrKy8U/QMT6UgpvgceEtjkTVqG6u7ux7osmiKHRqoDI2NBotO3mdep
         CO3+S5LkcisPGXAdZ3+eW9XaU0pfSiAy5aEAsHrtEtT3KZg0h1eaJ3Gr6NEatvVYlwao
         HpVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ySG/dFK2HZQD+JLMFszQWRBPaJ0ef+Mlaqjr0ZCyRnE=;
        fh=N3ZGYn42mVYpQegzOMApz9ky8AhtJTFDpo7yY3Oq+30=;
        b=lZI4BH75ivmUF6QWuWgq9PsLMp5IJQQTdjR0coUTkIZtkJn8G9ViL2S+UvkkdiOymA
         AGsiWIbKuiOUy3Huqqq2embCyfZFkTjmMx9m20fMHlTbqca4S+D1k0N3gigF6rdogdKN
         z4D8p/toAj7RCt07jEBk9nP9dzBorlofILFm5qVgqbXrUnyt+ta1VDagXW0FtFSP3ceF
         AgdiQkMlYNEmFPIXv79kYfB/3PjDiM6SR34LdvXISLPoN5EJQ8Ve6qmRIWOo38tWZFiE
         MhqKlg9M3a/OPhNuBQ1bAopfHHjaoKaq9OElGl3z7obuS6cwg+98ueeu5o/d7vcC+e5S
         UsKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f5cTWkJ7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n25-20020aa7c459000000b00566ec4f32e0sor393077edr.10.2024.03.15.06.09.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2024 06:09:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f5cTWkJ7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508193; x=1711112993; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySG/dFK2HZQD+JLMFszQWRBPaJ0ef+Mlaqjr0ZCyRnE=;
        b=f5cTWkJ7YF1F74wU1MS/07HqpJJpl1kq55NSevJrUKvIgyOXvfZhXOvquWZQ61z0hw
         Ms+OD9YYqp9BATuMRyMoqvDtoegFBfgJLljOdDCPs6N1U/nLjO34/QR7a8XEZMnnwS/m
         ide4B+9rCfGHwWa9ub1kaHA0heifeC//nwMUxDXQiVCaWPEsvVcNa8KcItIiQvpxj+Sl
         mVkpLQdRay6CqBHBqchxCcJzrg9yQUuj+JH75sxpjalxfbNQNwBNHTJ97D21CnKaMSJM
         WIA2oJQuNEm7gfukag+OvxyCv6NXGF1xGs68MPvUG3CSVfeS4TDnewtZCFlkVMZ/YcYb
         qn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508193; x=1711112993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySG/dFK2HZQD+JLMFszQWRBPaJ0ef+Mlaqjr0ZCyRnE=;
        b=R4ZfZsIVBv5rzOCayV9OC5ZPOIWLGhzQe1Rg0ym+zvz1spvCp0HFu/T0Gbgj/ySm73
         3VCNT/kUhCLWJBkfvL/rdv68/H4GkzFhCyBGEWfePe49o75ldNQsl2wyxOSk/Lbdjuja
         mhuRWNDiy0q6b0GBVpIrmr9RcyeYVYkNUd8ZNNGUv94gNcCZED57oGWdAdfxdPhDwT6j
         XzKx5FPTQQtobn4NAS1JCc6b3oVxRyMSmHpozzO6jOapSApCYAI8SVExav+Qai25tqTi
         /BS5yk/eXmNiiPRbjqnRuQZy1QnmyLMESW0gIjKTyktQdXnA+Ho8AX+S2HnYWzTc+9R1
         Yy4g==
X-Forwarded-Encrypted: i=1; AJvYcCWzBfOCaQvQDpWo5I9hZ8bhzbt8GvIda+89tuhvWD/NWpl6//dos0LqVBOujk/mA87CFQH62kbCbksN53tu0BcZiKxLI64f
X-Gm-Message-State: AOJu0Yz6vqUfMUmqbFjJTKzeMWiJw3qvT06//lK78phrkZYsyEuTU8G+
	BIqCpDT9udTRlP8HEpipQre0wsAgdXMPPga5SiJkOf2n3hn12DALiS0vL3gI5oCL4g==
X-Google-Smtp-Source: AGHT+IExmkLmMqoSeV72lixftAHxYOtVn4ReIk8rzurrdOHIVhJgEKO7oZjURsJA9vDI1+WjYK1UFA==
X-Received: by 2002:a05:6402:c50:b0:568:93bb:d0c2 with SMTP id cs16-20020a0564020c5000b0056893bbd0c2mr4363087edb.20.1710508193742;
        Fri, 15 Mar 2024 06:09:53 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.145.26])
        by smtp.gmail.com with ESMTPSA id 6-20020a0564021f4600b005682a0e915fsm1675523edz.76.2024.03.15.06.09.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 Mar 2024 06:09:53 -0700 (PDT)
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
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH-for-9.1 06/21] target/i386: Make X86_CPU common to new I386_CPU / X86_64_CPU types
Date: Fri, 15 Mar 2024 14:08:54 +0100
Message-ID: <20240315130910.15750-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xIT2KTJySwh5

"target/foo/cpu-qom.h" can not use any target specific definitions.

Currently "target/i386/cpu-qom.h" defines TYPE_X86_CPU depending
on the i386/x86_64 build type. This doesn't scale in a heterogeneous
context where we need to access both types concurrently.

In order to do that, introduce the new I386_CPU / X86_64_CPU
types, both inheriting a common TYPE_X86_CPU base type.

Keep the current "base" and "max" CPU types as 32 or 64-bit,
depending on the binary built.

Adapt the cpu-plug-test, since the 'base' architecture is now
common to both 32/64-bit x86 targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/cpu-qom.h       | 16 ++++++++++------
 target/i386/cpu.c           | 20 ++++++++++++++++++--
 tests/qtest/cpu-plug-test.c |  2 +-
 3 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
index d4e216d000..de28d7ea20 100644
--- a/target/i386/cpu-qom.h
+++ b/target/i386/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU x86 CPU
+ * QEMU x86 CPU QOM header (target agnostic)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
@@ -22,14 +22,18 @@
 
 #include "hw/core/cpu.h"
 
-#ifdef TARGET_X86_64
-#define TYPE_X86_CPU "x86_64-cpu"
-#else
-#define TYPE_X86_CPU "i386-cpu"
-#endif
+#define TYPE_X86_CPU    "x86-cpu"
+#define TYPE_I386_CPU   "i386-cpu"
+#define TYPE_X86_64_CPU "x86_64-cpu"
 
 OBJECT_DECLARE_CPU_TYPE(X86CPU, X86CPUClass, X86_CPU)
 
+OBJECT_DECLARE_CPU_TYPE(I386CPU, X86CPUClass, I386_CPU)
+OBJECT_DECLARE_CPU_TYPE(X86_64CPU, X86CPUClass, X86_64_CPU)
+
+#define X86_CPU_TYPE_SUFFIX "-" TYPE_X86_CPU
+#define X86_CPU_TYPE_NAME(name) (name X86_CPU_TYPE_SUFFIX)
+
 #define X86_CPU_TYPE_SUFFIX "-" TYPE_X86_CPU
 #define X86_CPU_TYPE_NAME(name) (name X86_CPU_TYPE_SUFFIX)
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ebf555f50f..07f64c1ea5 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -8057,12 +8057,28 @@ static const TypeInfo x86_cpu_types[] = {
         .class_size     = sizeof(X86CPUClass),
         .class_init     = x86_cpu_common_class_init,
     }, {
-        .name           = X86_CPU_TYPE_NAME("base"),
+        .name           = TYPE_I386_CPU,
         .parent         = TYPE_X86_CPU,
+        .abstract       = true,
+    }, {
+        .name           = TYPE_X86_64_CPU,
+        .parent         = TYPE_X86_CPU,
+        .abstract       = true,
+    }, {
+        .name           = X86_CPU_TYPE_NAME("base"),
+#ifdef TARGET_X86_64
+        .parent         = TYPE_X86_64_CPU,
+#else
+        .parent         = TYPE_I386_CPU,
+#endif
         .class_init     = x86_cpu_base_class_init,
     }, {
         .name           = X86_CPU_TYPE_NAME("max"),
-        .parent         = TYPE_X86_CPU,
+#ifdef TARGET_X86_64
+        .parent         = TYPE_X86_64_CPU,
+#else
+        .parent         = TYPE_I386_CPU,
+#endif
         .instance_init  = max_x86_cpu_initfn,
         .class_init     = max_x86_cpu_class_init,
     }
diff --git a/tests/qtest/cpu-plug-test.c b/tests/qtest/cpu-plug-test.c
index 7f5dd5f85a..97316d131f 100644
--- a/tests/qtest/cpu-plug-test.c
+++ b/tests/qtest/cpu-plug-test.c
@@ -90,7 +90,7 @@ static void add_pc_test_case(const char *mname)
     data->machine = g_strdup(mname);
     data->cpu_model = "Haswell"; /* 1.3+ theoretically */
     data->device_model = g_strdup_printf("%s-%s-cpu", data->cpu_model,
-                                         qtest_get_arch());
+                                         qtest_get_base_arch());
     data->sockets = 1;
     data->cores = 3;
     data->threads = 2;
-- 
2.41.0
