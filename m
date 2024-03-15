Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp988961eju;
        Fri, 15 Mar 2024 06:09:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXG7w//RF/Yu8WLAmweU9yy4TPf+4JeFcNbXtNJ2LsE1iU0a/V0hfnKgvwiH91ztBb0fgpk4XxIXA16LHCmW/W4SGuiTisY
X-Received: by 2002:ac2:5511:0:b0:513:bf20:d8b2 with SMTP id j17-20020ac25511000000b00513bf20d8b2mr2953001lfk.65.1710508169505;
        Fri, 15 Mar 2024 06:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508169; cv=none;
        d=google.com; s=arc-20160816;
        b=A6Lg14cnKPf4kGpIDtDAuWP91elH6nteAkZn53HtkGgJE7dWcEPgf1IpjzxD1z9bQP
         PymCBkBUtmcslbXAwSi6GT/GwWkXzXBTxUMui8NElXnJtbsHLQqZ1fzWug1cXbOc4ZXx
         yDTo2rw4woVqh6vaoI3rOeKUNQsyiBw3tcTbJVNblFbFxqhaUliUE7Ku7dPxhXKeFI0Q
         fP/QvFsYv9FjolqayVG/LEtOo4D8o8xCjDqSm6QFfVQ4TKEnLNhYdhS0jEiYq5HAZKGQ
         XHjEav8ZrL3ma9LSpkqcBUTw7dSAtBKErYuRKtK9vsOC6SXDD3V+ZSr2tpcucsIl911d
         FeMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=38DwNqP/w4iyE7cU/eTej+AEZTmllcOjbkkM5XAd0Sw=;
        fh=4caIyAPT45oZ/OOSw5RltRbUCLwqEjeYRnmOIZW/ZiQ=;
        b=UT6BmgWiXvMDhXHWrquB2gbxgT4Vc0JsClg2clb0gG9Xi31BRNUrl7B7t8g6+msTyq
         8G/YzdpLJcvrAq5hwfrtwqspd6uDe9Kzz6yGFL13VQvkigBVbmn8YP/UQNWmZiQQHCRT
         Ty7MoD/NhsXJGK8j0/7+0/bdxCz3m2FSyRuEeKClSCKxA/zbPu4+4NwwQi6zBOWE7ptj
         7MbweGZDwLP6GOB3mupLuU0R2HuAtHNuTyBe/m3Vbr46vHzuHVMtPGNQQ5wlrSzUKGNM
         h1sYks3zES3fDbFYSWEqfkr1RsB6QchzsEvbiFo9qzzuiYZv0HJqpN2JCOiehPrYokdY
         7XUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b4oDrv8r;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m6-20020ac24286000000b00513c17765fcsor829608lfh.2.2024.03.15.06.09.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2024 06:09:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b4oDrv8r;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508169; x=1711112969; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38DwNqP/w4iyE7cU/eTej+AEZTmllcOjbkkM5XAd0Sw=;
        b=b4oDrv8r81C0pwUh0IfH7VxP2m0z8DC/xurH1Bk7uwthWFq6ACZxMhxekg/Ak+QVyK
         lt3CmMseysq/FcXF2LUVHXw0mwkRohkdEmMofLqwzDoIfnhRAUh3tWY/k6U6G+jOsFmk
         ykf0pPYb8T3CQTqTxHW6VpGpnvlFhVe92qw3tzOxMTV3DqjKBN80/mvxH0kVaODmSMEC
         8YwFnyU2aAJkZ7FPl+CSV9ccRhRj2oWNxoaci4zbN1bkr9p+5uEBAHy8iMVHJumIYlW0
         3xHEdPEaRs3FJR0H/54mM4dZcIBqJ8m7QcRGzr8tNy3tAtNZki6wQwf6O+ZaEsm3n7HX
         b8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508169; x=1711112969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38DwNqP/w4iyE7cU/eTej+AEZTmllcOjbkkM5XAd0Sw=;
        b=UD+d0HgPgZeisFDa8jH8+CJ6+2UpUVZ2I3Uy+UnsjVLjK5szfGCknq+6nsq3W/SIHL
         PTaikHehv/Jjbhb3OcvMKMPx02XjnehEQwf6/mf1tkzf32c7CDBDlEpUB1E+qiaUnOGg
         vCUSLUOtsWtGfciJoWfoKBiVEQ5WIHjSqnUxedcQFDNw3dc/yDzI7/qKhf8wo3P7DFRt
         NmepV6OciUgFPp5CzrFdMhw9fQHtrga7cSYIySOoq8sUhu2T/vMQ0BW4TVUVVXjDN+7M
         tKSkmg0raiE9xlE90wM7QUO46xYybayBO7XM2+2g7TqpJkilymRm4GZ5dBr2G04k1DYM
         6I3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjwekgMXSS4SPuDoBDJxSCXGBdOOzXhI60DZTSLeVdV2+8dZAvEJNfdN4wJgZ1Xyll0nS5KWdpcXXk0sG1sHlkgeX5onxU
X-Gm-Message-State: AOJu0Yz948KMgViP91bciBnqmNsCEPkFKv5h66zwi1rHrw0lcYeC9BCo
	Q0q2DxO9uwQBCNxrKk5sAAHe6mm42hKToFsCIv5oX39Zxefw4EHNF7wwrQNGU2l65Q==
X-Google-Smtp-Source: AGHT+IGUqlgwpBs0iVH+nA4YB8mpndxs+sUNctHnYtgA2NyEqcGCBN6lT+1elp7U+umu/qoGxw6VQg==
X-Received: by 2002:a2e:9850:0:b0:2d4:7829:4d13 with SMTP id e16-20020a2e9850000000b002d478294d13mr2977270ljj.50.1710508167582;
        Fri, 15 Mar 2024 06:09:27 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.145.26])
        by smtp.gmail.com with ESMTPSA id qs28-20020a170906459c00b00a45efdfdd1esm1685202ejc.40.2024.03.15.06.09.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 Mar 2024 06:09:27 -0700 (PDT)
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
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH-for-9.1 02/21] target/mips: Declare CPU QOM types using DEFINE_TYPES() macro
Date: Fri, 15 Mar 2024 14:08:50 +0100
Message-ID: <20240315130910.15750-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hXneSssCbHD8

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

In few commits we are going to add more types, so replace
the type_register_static() to ease further reviews.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231013140116.255-15-philmd@linaro.org>
---
 target/mips/cpu.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 8d8f690a53..c096d97fe3 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -594,17 +594,21 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
 #endif /* CONFIG_TCG */
 }
 
-static const TypeInfo mips_cpu_type_info = {
-    .name = TYPE_MIPS_CPU,
-    .parent = TYPE_CPU,
-    .instance_size = sizeof(MIPSCPU),
-    .instance_align = __alignof(MIPSCPU),
-    .instance_init = mips_cpu_initfn,
-    .abstract = true,
-    .class_size = sizeof(MIPSCPUClass),
-    .class_init = mips_cpu_class_init,
+static const TypeInfo mips_cpu_types[] = {
+    {
+        .name           = TYPE_MIPS_CPU,
+        .parent         = TYPE_CPU,
+        .instance_size  = sizeof(MIPSCPU),
+        .instance_align = __alignof(MIPSCPU),
+        .instance_init  = mips_cpu_initfn,
+        .abstract       = true,
+        .class_size     = sizeof(MIPSCPUClass),
+        .class_init     = mips_cpu_class_init,
+    }
 };
 
+DEFINE_TYPES(mips_cpu_types)
+
 static void mips_cpu_cpudef_class_init(ObjectClass *oc, void *data)
 {
     MIPSCPUClass *mcc = MIPS_CPU_CLASS(oc);
@@ -629,7 +633,6 @@ static void mips_cpu_register_types(void)
 {
     int i;
 
-    type_register_static(&mips_cpu_type_info);
     for (i = 0; i < mips_defs_number; i++) {
         mips_register_cpudef_type(&mips_defs[i]);
     }
-- 
2.41.0
