Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp989087eju;
        Fri, 15 Mar 2024 06:09:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXFmh9Pcri89+UZQ9+KiAPfzmSwXKJV2oumdNW2l5Hual8RSZG8rQ76euo+rF0UT+BsynsP/b3/n8ATED41/PtKsT/4RJqW
X-Received: by 2002:ac2:5bce:0:b0:513:5a3c:e8cc with SMTP id u14-20020ac25bce000000b005135a3ce8ccmr3452476lfn.19.1710508181010;
        Fri, 15 Mar 2024 06:09:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508180; cv=none;
        d=google.com; s=arc-20160816;
        b=h8kNXZJC0EhOSbboDwwOTg29VvYuSP3ZxJOciwQbv/ky0bNPmCDIk5bspgGcrofKCG
         0WU+W+FALGSqDxVPyxCtiYUDYdWuooN3uES3vxkhu0vEW9I+OFmXkUvkfbgSow3mYO03
         tarZsVINHN1/KbsP33jlzxeUr04IJ8z7JaQ1sD5mT/zK8808UuUoBv5IcCxYYMzMsPcK
         5DUreBl5OoGnofF8xC9ZmU7nUenggAyLjudrBjZ/sBGfwlpTtk3KjXHAGG8aNaG7EB1a
         uFhYQ+up51XblTlfwO1DrWhWKDNcokSSBY7/lK+RGUBbiKc9lFMWv4tqjhmyweCgxhEX
         QUAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xkGMjK1G9yFAmyZjfysW+oy0VEwc0DxCtLcyXCgX4n0=;
        fh=9DVifIYSl6Y0daHHuFULH0QIo/yPjhQTyFY577gj14o=;
        b=X7R4/lqj0+cavOPZIpys6lWwWAxQdH9SGnr3rpo2tl3GqeNCVh1D6ROsh5NgnKhzp+
         3Z2A/cyBd8BJTt6gaEj288f+FvcajNejziCb5p8Fos13ZJm9WnnEfPA4q6XgLmy3X2vF
         NEsgl/3oKMWPX6y9TQ7IhSvospg58uqgHv7iYtcqzP5Qdc02supoHUl/Yj7ZFnLk1KH9
         PSXwgnMf8nuBNn9TQSLNtcmdMl3J9wJ5BypriAYwYPn8X2QM0t+TYut0VYSbsZmFidO3
         SAJtYo5uBKaOD/e1oGkghJWnDd1S5bx4y4VMDMdlYbxUr2oXIEooALQPVksEWQuz5fQX
         aG3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uj/YuiA7";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l28-20020ac2555c000000b00513d5d1c285sor619825lfk.21.2024.03.15.06.09.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2024 06:09:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uj/YuiA7";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508180; x=1711112980; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkGMjK1G9yFAmyZjfysW+oy0VEwc0DxCtLcyXCgX4n0=;
        b=uj/YuiA7MBuBjot6HTF3m+w0JrOLAw8WnPMwD/xi16l94CMjBtQp7gsSGc2EFOeAyf
         tf5z1iY/P5KQi1uvDKIFp07QUAaBmS1fjRXStDveVgC/WLt93onIvxOY0H5TtZB42MgN
         MWbUhKbT60TxV7ATTcT1lujCniwO9NPd17wAh9QaL1/zwb2qiCTiywEbI6gkTlFnz0ei
         lI3llw8SCHQIl6i1QF5OIx9HIdP/SBPCkt70Bidyk1GNSAfJF502tBhL/6lTXMQ/7q9v
         KB5q4Wo4EFHyBF5sUHhYpWgcTNEi02RvGEYXPvksKyaTx7veqhoaaUIdbEgSONdtu3kz
         HRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508180; x=1711112980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xkGMjK1G9yFAmyZjfysW+oy0VEwc0DxCtLcyXCgX4n0=;
        b=SxlzlkagEkHX1iNpQPkv90mHp1gia2WFXlCmkU6KMYkLz/8J6y8CPmIZrORVzOGlk5
         la8WjMgEJJqzbzgnvLygkXEfImdRSPEFG0zfbOjCWoDBWycDugyHNTB+NRQXAoYo0AYw
         tKqRLvwi98gRVdNytuTbRKL/4Ef0tggccOgXU+yegEBVL+pViu3ZNulqlJO0JeusTs8o
         NjpdtZPuR3CYfOcGjhXdD5LS2Wm7fDFRR4LU8VzL+eTSfsg9erbverA91C0wv+ReyXP7
         WdFak01yq/M2mDVxEQlYh5WHnG5Gxx+//+nLrqFONP1pCX2d3XMjiqClRdE6igEjnHD0
         kCIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL8fAAPhjo/UNs0GPyp4ybKxjKtJvTlPX9FOXpSYxbwuWcL96ZNU1iX0FzcFSVHa1UuwM6EI+XWW+o0JP8s+LbQZVlNcsf
X-Gm-Message-State: AOJu0YyjmwXNNwti52GA+3e49uyF99jv1V197kPbbsm6jCnO16tcWlsk
	+eczsTo2c6RUH9OODqvxttnlsOmHzmfdWkOWtnrwFzWV8du0YQLYq/UOtlL9Trjjqg==
X-Google-Smtp-Source: AGHT+IHpHtbKvMjVVyy3n1oFAdNafsLrOa9Ad04r6RdA8Gsvr4YycfqtkVPsX2+fpJ/zynsRUwxdAw==
X-Received: by 2002:a2e:808e:0:b0:2d2:a38c:d706 with SMTP id i14-20020a2e808e000000b002d2a38cd706mr3159290ljg.17.1710508180605;
        Fri, 15 Mar 2024 06:09:40 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.145.26])
        by smtp.gmail.com with ESMTPSA id cx14-20020a05640222ae00b00568af798c9esm578595edb.90.2024.03.15.06.09.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 Mar 2024 06:09:40 -0700 (PDT)
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
Subject: [PATCH-for-9.1 04/21] target/sparc: Declare CPU QOM types using DEFINE_TYPES() macro
Date: Fri, 15 Mar 2024 14:08:52 +0100
Message-ID: <20240315130910.15750-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: la9VIiG1vX4N

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

In few commits we are going to add more types, so replace
the type_register_static() to ease further reviews.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20231013140116.255-17-philmd@linaro.org>
---
 target/sparc/cpu.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index dc9ead21fc..42b13ab63f 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -949,17 +949,21 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops = &sparc_tcg_ops;
 }
 
-static const TypeInfo sparc_cpu_type_info = {
-    .name = TYPE_SPARC_CPU,
-    .parent = TYPE_CPU,
-    .instance_size = sizeof(SPARCCPU),
-    .instance_align = __alignof(SPARCCPU),
-    .instance_init = sparc_cpu_initfn,
-    .abstract = true,
-    .class_size = sizeof(SPARCCPUClass),
-    .class_init = sparc_cpu_class_init,
+static const TypeInfo sparc_cpu_types[] = {
+    {
+        .name           = TYPE_SPARC_CPU,
+        .parent         = TYPE_CPU,
+        .instance_size  = sizeof(SPARCCPU),
+        .instance_align = __alignof(SPARCCPU),
+        .instance_init  = sparc_cpu_initfn,
+        .abstract       = true,
+        .class_size     = sizeof(SPARCCPUClass),
+        .class_init     = sparc_cpu_class_init,
+    }
 };
 
+DEFINE_TYPES(sparc_cpu_types)
+
 static void sparc_cpu_cpudef_class_init(ObjectClass *oc, void *data)
 {
     SPARCCPUClass *scc = SPARC_CPU_CLASS(oc);
@@ -984,7 +988,6 @@ static void sparc_cpu_register_types(void)
 {
     int i;
 
-    type_register_static(&sparc_cpu_type_info);
     for (i = 0; i < ARRAY_SIZE(sparc_defs); i++) {
         sparc_register_cpudef_type(&sparc_defs[i]);
     }
-- 
2.41.0
