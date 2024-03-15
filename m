Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp988853eju;
        Fri, 15 Mar 2024 06:09:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZKzhL3CUV/fIMRynkTgY3O0c6i4zqt5q+u1ligIJCe0/wXweP0VyM5DNZGM4LWj6ntIYbbQmjax1p4EMFUIZV/vbdy1BR
X-Received: by 2002:a17:907:7da8:b0:a46:8c03:b659 with SMTP id oz40-20020a1709077da800b00a468c03b659mr1197965ejc.42.1710508161209;
        Fri, 15 Mar 2024 06:09:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508161; cv=none;
        d=google.com; s=arc-20160816;
        b=AeLw+RMwONOZx3F2/HY5bMWfjCBPwIHYigldZIXPUvBB5bEAteyIV3BYUVYx2+lrcc
         rXwkNuSA9p+6zlXk17ME8CJaA/76HNmZfbj6yWz6hfKZuxXA857u3bQ81womhtjzQguc
         uLwL/ZngEYKhV3mRelftRlha1a5Id9zjr370LQ+NWr12GUYZsXkDlWpharQH1GjNNMn6
         ZYZVBbGCOOMiEkccwFz5poqNP/IY/zpGjfs1RgWjU4a1lEhwSBNg9WTta9PxneznTivg
         fIrpR/2kwj9IVv5poHwOdCfgSuRVRo8u0sJ7hBFrMDTuKcWcSygXm04x2CVuK3sB2nqK
         CK+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NCfHsLOktJnJk/FrjkYW88SQD28CKLAyjY7rSKM5rcw=;
        fh=7lA50/rabhoLe9Y5fuobgLwgx5bFn+52eVu+VVpYOoc=;
        b=F8oayablt9BRAFfo7nNZvuH17WMhOSVlu2iVO9jz8TAXlebGdO9eY0ZFVDQ+43O3Lu
         1eP2eyNcEUcmy1r2oO3qCRC9OdShw5TmD6qvNlkMQjUMfuLR9bn62xpOMTVFWMo/2vsf
         kWmfQVsMIHxZwmcBcxIVEuPLDEcsGjFA4aKVlsuQFsyknjKR4si1HnlXGnec+QEhMZ89
         zrPWo/0zm166PWSDQIZR7IZo5yDBkyFYCoonLm0P6S/DdWNdhlz/aHDPqhCfzjrewjaH
         71VZjlMXNIMe3VuCwwu4TFjpRozlv+ox07qAWNWcz21VlfOKNKxHgirGsTmKsdO3NrOv
         UmHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bFGbS9Yz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y8-20020a170906070800b00a4692a02c41sor306935ejb.12.2024.03.15.06.09.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2024 06:09:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bFGbS9Yz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508161; x=1711112961; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCfHsLOktJnJk/FrjkYW88SQD28CKLAyjY7rSKM5rcw=;
        b=bFGbS9YzZRwsY6vVxY9g8Cbl7wlvYcPjCqzLkJ6IY19/pgoMyqiPHJaaZi7Y3cA5b4
         7A34jDivkFQK14W+C7uV3elQfccftuVwZ6iC6FwYtLjYBhJHKZDiQzAtlKPhdqSxFSZv
         XL8luOtTaxL0uTsVVuC1nzDTG1yd3/FbLF/UY4EzuvVP2NM3AvSuUWBkimR1cOuDHVh+
         pZM44QS1cOg4Q1b0n9sPIqCkZQ8wC9APqZB0eJzrT7cHhr3a6LneFdzXXtp/9+IQVQoj
         tX5NKeqx2tCLdgYyG97Ee//e58xpS2esdaHLhAlQrHIUggDCZaNi31vpeGpQJq0tj3AI
         QNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508161; x=1711112961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCfHsLOktJnJk/FrjkYW88SQD28CKLAyjY7rSKM5rcw=;
        b=mxA2VYq1gKzFov6HjGAV1gu/+B2qPUdPr6hxqxLcnUxun4yNb6L3ILcAR/Nig6xwTQ
         54IgcgxtEzJzzJ9gZsJccOw+IyVzUP4QNkABN1xNLiyDwRDx8VEqbZCpS/evEGJ4Lq9S
         HmxVzcBru0KFS8+VbGU526Pbmyw5Ilkl2NDR7A4Dg0ok/PVnU4l2Pgk4PA3W32LR0gz7
         ljN34QdGrEh4720XYJAWr5wvY2/wwBH6QQbnTxA1fM6x3766Ax06EmPsgzqE/6WHKKY5
         LshwnvqGxhM+gq4JoYBbxXMb2qGxLFefVq7rVopS40CbRdVISTeehUsDv9TRjFD0PRpx
         HgFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5pLWadFuF0na4ZSNOcMhzP7AdABBTQPysmq7+5r04+RpOLEaRhwBzcXItMbPsdzj2/5TrxN5c4Y6KWE+moom1ir+/w3nw
X-Gm-Message-State: AOJu0YyV5xlhNhb2JPQSsSNAFr3lbxjyzO6jaobdWP8VqclxZ01QOx1S
	83mtH3uVDsQKLacDmPxabEiJV+Zn11d47wvT3SUl6gC2y1qJlmdK2ATn4lQWYZuKXw==
X-Google-Smtp-Source: AGHT+IEIqbu+dkyYORdlV0Gte9UybiujX61BXzptaCyYsWEUuL7ULvFX0eVwlBjaCfc67LjfUoRRVg==
X-Received: by 2002:a17:906:360a:b0:a46:9a13:362c with SMTP id q10-20020a170906360a00b00a469a13362cmr291836ejb.52.1710508160915;
        Fri, 15 Mar 2024 06:09:20 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.145.26])
        by smtp.gmail.com with ESMTPSA id g12-20020a17090613cc00b00a45ff1fe8dasm1693781ejc.115.2024.03.15.06.09.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 Mar 2024 06:09:20 -0700 (PDT)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.1 01/21] target/i386: Declare CPU QOM types using DEFINE_TYPES() macro
Date: Fri, 15 Mar 2024 14:08:49 +0100
Message-ID: <20240315130910.15750-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0SJcunQSYx1K

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

In few commits we are going to add more types, so replace
the type_register_static() to ease further reviews.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Message-Id: <20231013140116.255-14-philmd@linaro.org>
---
 target/i386/cpu.c | 50 ++++++++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 9a210d8d92..ebf555f50f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4991,13 +4991,6 @@ static void max_x86_cpu_initfn(Object *obj)
                             &error_abort);
 }
 
-static const TypeInfo max_x86_cpu_type_info = {
-    .name = X86_CPU_TYPE_NAME("max"),
-    .parent = TYPE_X86_CPU,
-    .instance_init = max_x86_cpu_initfn,
-    .class_init = max_x86_cpu_class_init,
-};
-
 static char *feature_word_description(FeatureWordInfo *f, uint32_t bit)
 {
     assert(f->type == CPUID_FEATURE_WORD || f->type == MSR_FEATURE_WORD);
@@ -8041,19 +8034,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     }
 }
 
-static const TypeInfo x86_cpu_type_info = {
-    .name = TYPE_X86_CPU,
-    .parent = TYPE_CPU,
-    .instance_size = sizeof(X86CPU),
-    .instance_align = __alignof(X86CPU),
-    .instance_init = x86_cpu_initfn,
-    .instance_post_init = x86_cpu_post_initfn,
-
-    .abstract = true,
-    .class_size = sizeof(X86CPUClass),
-    .class_init = x86_cpu_common_class_init,
-};
-
 /* "base" CPU model, used by query-cpu-model-expansion */
 static void x86_cpu_base_class_init(ObjectClass *oc, void *data)
 {
@@ -8065,22 +8045,38 @@ static void x86_cpu_base_class_init(ObjectClass *oc, void *data)
     xcc->ordering = 8;
 }
 
-static const TypeInfo x86_base_cpu_type_info = {
-        .name = X86_CPU_TYPE_NAME("base"),
-        .parent = TYPE_X86_CPU,
-        .class_init = x86_cpu_base_class_init,
+static const TypeInfo x86_cpu_types[] = {
+    {
+        .name           = TYPE_X86_CPU,
+        .parent         = TYPE_CPU,
+        .abstract       = true,
+        .instance_size  = sizeof(X86CPU),
+        .instance_align = __alignof(X86CPU),
+        .instance_init  = x86_cpu_initfn,
+        .instance_post_init = x86_cpu_post_initfn,
+        .class_size     = sizeof(X86CPUClass),
+        .class_init     = x86_cpu_common_class_init,
+    }, {
+        .name           = X86_CPU_TYPE_NAME("base"),
+        .parent         = TYPE_X86_CPU,
+        .class_init     = x86_cpu_base_class_init,
+    }, {
+        .name           = X86_CPU_TYPE_NAME("max"),
+        .parent         = TYPE_X86_CPU,
+        .instance_init  = max_x86_cpu_initfn,
+        .class_init     = max_x86_cpu_class_init,
+    }
 };
 
+DEFINE_TYPES(x86_cpu_types)
+
 static void x86_cpu_register_types(void)
 {
     int i;
 
-    type_register_static(&x86_cpu_type_info);
     for (i = 0; i < ARRAY_SIZE(builtin_x86_defs); i++) {
         x86_register_cpudef_types(&builtin_x86_defs[i]);
     }
-    type_register_static(&max_x86_cpu_type_info);
-    type_register_static(&x86_base_cpu_type_info);
 }
 
 type_init(x86_cpu_register_types)
-- 
2.41.0
