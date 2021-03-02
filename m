Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4538110lfg;
        Tue, 2 Mar 2021 06:58:30 -0800 (PST)
X-Received: by 2002:a17:906:b047:: with SMTP id bj7mr21312022ejb.335.1614697110227;
        Tue, 02 Mar 2021 06:58:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614697110; cv=none;
        d=google.com; s=arc-20160816;
        b=GPNiIZ+wFlg0yM837icOoFFVLLW4HoUdXyeTHyTK1BCEb6+0CWjiZwn/XRD1E8LyAk
         M4/5mzeSMvWKHj7QvTM2Kwb+c964xhxw4oKGALPaA0Uu/YyCh6VMWGFMsP7ouLxAeiat
         oOw4/5OfzmDtpXNgsNhSmbwWor904PMywzOCNtgXiQj/oYrQL2V70eLGQGo5QjM2oetU
         H6q3UsE5Ie1L/8TlkaQ2pwnJdexiR2zh0oNs08BNe/2Y4p6fKBgdeDO05u79zUGVqLqo
         Rd0N1Mcob1wqDswFKDjixUssVfc//8hhJRv+OXqlOsBpLk54u3Xo7r6tn0qxTBhvz+hy
         +9nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=nOq5iyMcYnp2lkKz6qC+70BZoqGGdKahRqfZnxYC4Rc=;
        b=spFbgI9uiGG91GOhaz6L5Usya8CGVCWKllDSqJNkBcpiVYx8YZ8v6iOfnX4N+cfrru
         ptZhwBPRCIqxVH2LviFQtuMKcVV74oMXVUhd/w04z11FopemKew2qJadxlG37iMWIZ7x
         eoUc2Fh4lNWHW0rNCiYaTaWYA4FoUeMIdZ8tIsuQoVl6hek+lG/yP9Q/mhy6Xsk5FfpY
         2irP3KgiPR3GlRtI89OgGC50S9P11LPfm7vbNy6RZL0yVcv3T9CjOxEfx9OfoWbiOJ9y
         MxLGgAPHcAmMr+X8pq2oeTZrG3+2fuwDJVeO2SRr0LKPP9sUh7qQSf6ZVIzKEaO8mZft
         NmUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QoLfOdXl;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k8sor10723034ejz.27.2021.03.02.06.58.30
        (Google Transport Security);
        Tue, 02 Mar 2021 06:58:30 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QoLfOdXl;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nOq5iyMcYnp2lkKz6qC+70BZoqGGdKahRqfZnxYC4Rc=;
        b=QoLfOdXlHLmowLZWaZMbLVHZ/VJvR62ZBAI4f8Nkve7/977q+cpLfMgRoLR5+cMx/N
         wl8kIr6d+sBwDDUlCpY14WVoAx/pHr8fqR/AdvtFsX5O862Pa2sK5KvuzYk0oVGdszRD
         /WgQTCVcYuXy/BbAmaVEOJd41hN3/BJs6ty07RAr5QKToIu0fLPn1VzyTDWiDRZxhJmD
         dKUcGnoC/mk5Zp6BQ+mmLtaOb+U31BmENk+hk17Lpny5BO1VJMy2aVhW3mJr00kqGhnd
         00t2LdB9qf44sL/DrB0W1dn3Z0r8cnDZgoNen812LIYz+CGnJ6a7oxHsmFpi9VI9FZSW
         GZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=nOq5iyMcYnp2lkKz6qC+70BZoqGGdKahRqfZnxYC4Rc=;
        b=sK0hnmTNkdE3EGC3dc/1hOl66em1iE4TrVHhV0a7f4uCeWTEXVVmLQsUEXLa4W5M1J
         C0hConEpJgSuP0KTaHCZeZRf0iTH1VswFpx4rd1WBM0OBgQDY/ovz8T39nZWOUKT8uYc
         fljlF9SpNNWUlVuRxjb5YLPVXC+pCP4HsveqiThgV1beiNZVviFkVpqlICgaIpfWXWII
         sUzRNKVH++6AOEMm5abZJrZFetStZTrV6X8DCShZ8cGUGg8wX5ON07T+GlsL/EpGMoIx
         mvJpVktebdUVqVCaJwsEB5fX3mvtu4kI7pioF0Zinigdb4ZW7xidpRvDkgq1O2eqtRFh
         Whmw==
X-Gm-Message-State: AOAM5339BC5TBtMWmexRsDrs5yZtVoZuX9CDG5IUG818guKH3OIl0qAi
	uD5Nv43d8nZBk1aLkXXlkAw=
X-Google-Smtp-Source: ABdhPJxPDVoCPFyYidIi8kxBRuO5ZaCNBi34uPz+PUzoV64jR18SwyjokZ5+MdnpUKAcm/nTEqcxIw==
X-Received: by 2002:a05:6402:445:: with SMTP id p5mr21430090edw.20.1614697109974;
        Tue, 02 Mar 2021 06:58:29 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id y8sm17817784edd.97.2021.03.02.06.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 06:58:29 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Max Filippov <jcmvbkbc@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Stafford Horne <shorne@gmail.com>,
	qemu-ppc@nongnu.org,
	Anthony Green <green@moxielogic.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Walle <michael@walle.cc>,
	Marek Vasut <marex@denx.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-s390x@nongnu.org,
	Sarah Harris <S.E.Harris@kent.ac.uk>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-riscv@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Taylor Simpson <tsimpson@quicinc.com>
Subject: [PATCH v3 01/27] target: Set CPUClass::vmsd instead of DeviceClass::vmsd
Date: Tue,  2 Mar 2021 15:57:52 +0100
Message-Id: <20210302145818.1161461-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302145818.1161461-1-f4bug@amsat.org>
References: <20210302145818.1161461-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZCNVkU58g4MB

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
