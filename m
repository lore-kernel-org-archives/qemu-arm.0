Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5705725lfg;
        Wed, 3 Mar 2021 13:47:16 -0800 (PST)
X-Received: by 2002:a5d:4dd2:: with SMTP id f18mr775068wru.366.1614808036328;
        Wed, 03 Mar 2021 13:47:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808036; cv=none;
        d=google.com; s=arc-20160816;
        b=v3wPM2ctbAM3mLwUouWbmVVku8XgllYHU81R+KrQw+FnRQwobae4azNEB9vFoUsaWg
         0cNZCKk9y+FKJFCACzjFwfJHknJqBsb3AGNAfNCNhUdoYSEcD0VNlzp41+VCYzmMomOH
         muIGXSSs9Vt5+ZhtWGZzt527M2elkfPiiS0WjJkvipSwMOruGQmd5FcNGMSTKNjaBOeC
         UdryrrtRHfV/pJYfp4wh77IlO6i8ZJyDfD6DfnDXcG9oaLLQl8h9wOhvQo5ZJ7/Meqwa
         brmGv3xpefDfs5qnQJ7C0mCZ9p3O7nAnM18uK7CU7ESwV5LNtfNt5TJsmgjzAM1Y5TSL
         Qvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=nOq5iyMcYnp2lkKz6qC+70BZoqGGdKahRqfZnxYC4Rc=;
        b=xeym6q2NYtcaJ4MALoWtT6OEamoP4ad0KLHRiQchdpBjnjLHO1qBzzk6ToE95bIBWS
         1kR1YUWRYH5fQe3XuCo8rKlaXHR0wnTOGZH4qnZJtlljiJNKOg0fl3kD9YRWvov0YwDd
         6R9eNdglIjZTZBVw42k9XIukwjB5XETgeogJzx5+0ROtml7sm6kjKRZ8yN12QOHiK7Eb
         wYbSRDXbG+bJlSTcdxNxcVwESJChCPsNBpxDefB9bGOrDbWMGBHHxohPpPgTBL488P/B
         e+C+UTilMT/NAQzObpnv4CakRCZcGjcaCklYvvC4WNQeuhDLVah13pSL8KgZbhpA+5ES
         yXEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="ob9T/IF8";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m10sor2979652wmq.0.2021.03.03.13.47.16
        (Google Transport Security);
        Wed, 03 Mar 2021 13:47:16 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="ob9T/IF8";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nOq5iyMcYnp2lkKz6qC+70BZoqGGdKahRqfZnxYC4Rc=;
        b=ob9T/IF8pG3omCkUey8hZX6Zx7f/qFNS8f64yw1AyRwFuSD076C682sM2erR4ocbQU
         JI/mwJBIvoQcvXgqXFvxtE6Mh59PC+5MAfHCa1hGm/7Bum2WBheuFYXSCbXb34FUBAz9
         EIshU88rrJBoDZXaFDDoD+WeCdTEYl+gx6LwgbO6YLUBRUbNlAd4ab6DynTVnLdtJQfm
         /mVCqTPvrwKM5u+F4e77Z2QaGYlBJ+nQRmbeQrSZw8+LH4j3tTdtz5/UNqikv2JiCLCx
         JgS00huMSB/2//7895ClqsbrdoWElh45WFNh+k28SaTDiTu8PQIvcC9/awgn+lxzgR1O
         bbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=nOq5iyMcYnp2lkKz6qC+70BZoqGGdKahRqfZnxYC4Rc=;
        b=lleejxuzyV3pp5KD3g4qBOCIFl6WsaUVvMz4o5qlH6c8tcheshDFA+HVLcwX+TnI7R
         j0bgyThmuXezqsHgyIbJ6djtNoykttDGHkyBhorQfn7zZVC6MdN1+dKRuZo6IfA/vWHR
         DnhZoZ9Aen4VIUD3iAV0vBMphnaPHhw7yf9sNfTRCN3JTdJb2SqgGUbYx+CTLkhVmJmX
         yXd0xgzio5xQtabROj+xLL4aa+zlKDIHmtpmqBO6sw8HJi5FN929FfA/3PSucT5uA67X
         ttx4kt182sWyyt+58oE1Gd5hfzOwm8cx+8Ga/xT7fZJnJm+n9ZPZdfdrXoOEIuFOOP8w
         KFAg==
X-Gm-Message-State: AOAM531pOs7BrDWaOzIpPdoqtI6JqxKAuo3IDmGhhRLOxFrtWT4Q9dQK
	hY64cfe5Kt1zB5V8Uy0jlXQ=
X-Google-Smtp-Source: ABdhPJybBxHmtOr0x6nDcz7UdD4f4F8QSQ9xmJkLn/T5NNXJUmDS9ipEVS2QHUW3kivntBbKi86dRA==
X-Received: by 2002:a1c:2846:: with SMTP id o67mr838511wmo.188.1614808036119;
        Wed, 03 Mar 2021 13:47:16 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id r20sm7030784wmd.18.2021.03.03.13.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:47:15 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v4 01/28] target: Set CPUClass::vmsd instead of DeviceClass::vmsd
Date: Wed,  3 Mar 2021 22:46:41 +0100
Message-Id: <20210303214708.1727801-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: jdiINbtM7kMv

The cpu model is the single device available in user-mode.
Since we want to restrict some fields to user-mode emulation,
we prefer to set the vmsd field of CPUClass, rather than the
DeviceClass one.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/alpha/cpu.c      | 2 +-
 target/cris/cpu.c       | 2 +-
 target/hppa/cpu.c       | 2 +-
 target/m68k/cpu.c       | 2 +-
 target/microblaze/cpu.c | 2 +-
 target/openrisc/cpu.c   | 2 +-
 target/sh4/cpu.c        | 2 +-
 target/unicore32/cpu.c  | 2 +-
 target/xtensa/cpu.c     | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 27192b62e22..faabffe0796 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -237,7 +237,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = alpha_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = alpha_cpu_get_phys_page_debug;
-    dc->vmsd = &vmstate_alpha_cpu;
+    cc->vmsd = &vmstate_alpha_cpu;
 #endif
     cc->disas_set_info = alpha_cpu_disas_set_info;
 
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index ed983380fca..29a865b75d2 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -293,7 +293,7 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = cris_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = cris_cpu_get_phys_page_debug;
-    dc->vmsd = &vmstate_cris_cpu;
+    cc->vmsd = &vmstate_cris_cpu;
 #endif
 
     cc->gdb_num_core_regs = 49;
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index d8fad52d1fe..4f142de6e45 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -162,7 +162,7 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = hppa_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = hppa_cpu_get_phys_page_debug;
-    dc->vmsd = &vmstate_hppa_cpu;
+    cc->vmsd = &vmstate_hppa_cpu;
 #endif
     cc->disas_set_info = hppa_cpu_disas_set_info;
     cc->gdb_num_core_regs = 128;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 37d2ed9dc79..c98fb1e33be 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -533,7 +533,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_write_register = m68k_cpu_gdb_write_register;
 #if defined(CONFIG_SOFTMMU)
     cc->get_phys_page_debug = m68k_cpu_get_phys_page_debug;
-    dc->vmsd = &vmstate_m68k_cpu;
+    cc->vmsd = &vmstate_m68k_cpu;
 #endif
     cc->disas_set_info = m68k_cpu_disas_set_info;
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 433ba202037..335dfdc734e 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -387,7 +387,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
 
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = mb_cpu_get_phys_page_attrs_debug;
-    dc->vmsd = &vmstate_mb_cpu;
+    cc->vmsd = &vmstate_mb_cpu;
 #endif
     device_class_set_props(dc, mb_properties);
     cc->gdb_num_core_regs = 32 + 27;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 2c64842f46b..79d246d1930 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -204,7 +204,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = openrisc_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = openrisc_cpu_get_phys_page_debug;
-    dc->vmsd = &vmstate_openrisc_cpu;
+    cc->vmsd = &vmstate_openrisc_cpu;
 #endif
     cc->gdb_num_core_regs = 32 + 3;
     cc->disas_set_info = openrisc_disas_set_info;
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index ac65c88f1f8..bd44de53729 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -262,7 +262,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->gdb_num_core_regs = 59;
 
-    dc->vmsd = &vmstate_sh_cpu;
+    cc->vmsd = &vmstate_sh_cpu;
     cc->tcg_ops = &superh_tcg_ops;
 }
 
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index 0258884f845..12894ffac6a 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -146,7 +146,7 @@ static void uc32_cpu_class_init(ObjectClass *oc, void *data)
     cc->dump_state = uc32_cpu_dump_state;
     cc->set_pc = uc32_cpu_set_pc;
     cc->get_phys_page_debug = uc32_cpu_get_phys_page_debug;
-    dc->vmsd = &vmstate_uc32_cpu;
+    cc->vmsd = &vmstate_uc32_cpu;
     cc->tcg_ops = &uc32_tcg_ops;
 }
 
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index e2b2c7a71c1..6bedd5b97b8 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -218,7 +218,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
 #endif
     cc->disas_set_info = xtensa_cpu_disas_set_info;
-    dc->vmsd = &vmstate_xtensa_cpu;
+    cc->vmsd = &vmstate_xtensa_cpu;
     cc->tcg_ops = &xtensa_tcg_ops;
 }
 
-- 
2.26.2
