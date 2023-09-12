Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2372719ejx;
        Tue, 12 Sep 2023 15:41:28 -0700 (PDT)
X-Received: by 2002:a17:902:ec91:b0:1c0:afda:540b with SMTP id x17-20020a170902ec9100b001c0afda540bmr1621304plg.8.1694558487881;
        Tue, 12 Sep 2023 15:41:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694558487; cv=none;
        d=google.com; s=arc-20160816;
        b=cvJBaTnQMPTmRO+luGrS50Qnpf2tifanLfXD6TNM0VTa5FX4qPUYXSdTqIn75A9X2S
         dta/GhvNMc4MObm9p02IUh9f7HBDQWpMwQzZsc1kUzghUq/wi4Bh7PKjNuFDhZEOt++x
         iindeGS916fn7Hm3cJ+bE16nd5LS1nEsThM3GYhkGCjpquTznnTIlNfTQO5ifOf88z8x
         2eaO0gxTPXhz/sSYRQHKzi4y1613BxehShLKhyT9odntT7FRcQOAoOY1rrc85/zfjjoG
         +w9qb1DT5MtCwWvY207SLnmDQgqgsVbtFW7Ar/saCVsmM6BeTkfAJ5z7pNAfQif5ynG9
         P2HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=H0ux6zXnF8QbZYj0sOR52aBDTFuqL60bkneT20E5OaM=;
        fh=t7HWvzoxPcFAE84Fs1r+jS6BhLdo9YU6fOrIt8mFYOk=;
        b=sQ7Om29VMfK3ZeYpPjEuz/cmG3AERNc6NEqbr5pzSa0b+BwdP1rrSDDTX9afQdmzha
         aI3CbOdZ4dN2z9r6r9jWPPlkb9MQ9kSK3uZLl5AKBhy+dL6iVdYmsjrKKzJdnUxz1Tyn
         /h2BHxv6x9NYJDH61FIJh+3YVAu7h1IluRRoi9+kg7M6g/QxXL41jspLjQngLWZOlVsc
         bwFM983V9vyr2UOHMZ58yPDC4XrYohHzhh2ZcDash1qM2vkIqmeRr0qw0MSnJUsMAx9b
         z8rtqaN+IuamYEo1AnvsQ/LO6EEeW1P59RL/Dq9ob9JMKotNG/2GBcKu0cKBstoVbt/j
         mIbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=x+0mmUUr;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i17-20020a170902e49100b001b8c6ca0c33sor6426546ple.17.2023.09.12.15.41.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Sep 2023 15:41:27 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=x+0mmUUr;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694558487; x=1695163287; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0ux6zXnF8QbZYj0sOR52aBDTFuqL60bkneT20E5OaM=;
        b=x+0mmUUrTUnDVQ11iAV1yzyhXc2AXl/z1vBOCAGHOQeeXhD8y/gSP+1ZreDs3/YEGK
         sRxC/b7yVYJ62MrwLu+WhaSkY8/F5+HMVGBSxwfLfXavuGUi9IHJ1ESfRs9NLyaKsH7/
         qdXidfZXRzBIvF6M4eEXbjx0I4DQun4C50pMPtz9Si3XQMJXcCUoq8ldhv/blF3hW7H5
         AHThqA9Q7LJ2K/6WUEgQ4lvJbM3YYG9GtAF0PMK7JHDNlh52u40ySG3A3S+5fVRGU4fV
         vBF0tbxyzvb9l083x7B2wXmWPi1FvNr3vMLtYhOaLZ/teKTW+Q0MyqgYCEaQ4mSQzpLq
         E44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694558487; x=1695163287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0ux6zXnF8QbZYj0sOR52aBDTFuqL60bkneT20E5OaM=;
        b=oW5vlYfz+XP5sQNBijJcQAvBbjzCeicQY//lnpk8ZoNUcIQeh5rkGnuCLibk9jouOz
         Bu+ji9aZsFe+OxhK51Hxe/USArJ+T2U2hdm1MW97bzEiS22+NJGWuJ+ScOuhyd6r0S3K
         t/q5noVl8trjGZEKaxHiCegbXZY/eQooJk9qd4Ano6jFKju/ngZ7svyFaDQiiFkaV4s0
         UvuP/4XbiT9MJ5313WtBihD6WvKX/fwICb3WD6m46SKY+TJBViH1SYfS4ATWWKf/qHGo
         F7Id9+j7eOeBu9T/JId3ZidZ1hiHaws0ZG0kcY4OAJXTUnkruJvgffDHlRI4OH/ItK6r
         f8Ig==
X-Gm-Message-State: AOJu0Yy8vgRaxBlz38XQwHlKc5DZYnUCk99G+tn4/7Cz8R7uz0UJ8/ia
	edLM3y4tHLb1ii/cddtTvW6/+1iSP5Re4NMriCQ=
X-Google-Smtp-Source: AGHT+IF1JHr2yhceeRbbHBmXUjE1ZbMqi5N8MdlStT9aWvV7Aot386QLD+UHRoYKWUfWWubhMd/t5w==
X-Received: by 2002:a17:903:22c9:b0:1c0:9d6f:9d28 with SMTP id y9-20020a17090322c900b001c09d6f9d28mr1356064plg.11.1694558487322;
        Tue, 12 Sep 2023 15:41:27 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id l13-20020a170902d34d00b001bbbc655ca1sm8996977plk.219.2023.09.12.15.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 15:41:27 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mikhail Tyutin <m.tyutin@yadro.com>,
	Aleksandr Anenkov <a.anenkov@yadro.com>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v3 06/12] target/arm: Move the reference to arm-core.xml
Date: Wed, 13 Sep 2023 07:40:55 +0900
Message-ID: <20230912224107.29669-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230912224107.29669-1-akihiko.odaki@daynix.com>
References: <20230912224107.29669-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: o8MaX4w64vCF

Some subclasses overwrite gdb_core_xml_file member but others don't.
Always initialize the member in the subclasses for consistency.

This especially helps for AArch64; in a following change, the file
specified by gdb_core_xml_file is always looked up even if it's going to
be overwritten later. Looking up arm-core.xml results in an error as
it will not be embedded in the AArch64 build.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0bb0585441..6ff6ff2d55 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2389,7 +2389,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 26;
-    cc->gdb_core_xml_file = "arm-core.xml";
     cc->gdb_arch_name = arm_gdb_arch_name;
     cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
@@ -2411,8 +2410,10 @@ static void arm_cpu_instance_init(Object *obj)
 static void cpu_register_class_init(ObjectClass *oc, void *data)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
+    CPUClass *cc = CPU_CLASS(acc);
 
     acc->info = data;
+    cc->gdb_core_xml_file = "arm-core.xml";
 }
 
 void arm_cpu_register(const ARMCPUInfo *info)
-- 
2.42.0
