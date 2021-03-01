Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3943235lfg;
        Mon, 1 Mar 2021 13:53:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPgFVdiAhJYjghPo8wnEVSZGbh6QtzKeCnOCkgVbEjLyAhIgHGZQJbu1yP97X28umttJOc
X-Received: by 2002:a5e:c00a:: with SMTP id u10mr5411040iol.165.1614635609575;
        Mon, 01 Mar 2021 13:53:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614635609; cv=none;
        d=google.com; s=arc-20160816;
        b=BIrfVq5i8uaT5U3Fdjah6LZnRn1ZbosKASAverKiOxhSvTMp6QxF2TxNuHesN+nGw3
         HPDgxJlZRZQiJkP/hzpgLk2tEDLplxXgvdMK5eaz1Uo6KhSn0uo2ZHr+l/D2Pw7FGrX3
         m71OzTdev2b1g/y1D2E6c7X0eQPATLasj/913r7fovaNiSyfpGpRBNtzSxNoDl4b/qtO
         sXtdqY6iPN19hwOpYDzIzfpHX9ysUlm8E4SYX/sPAlYBKboexaHalVpyk5RHVBGqUyIo
         rOXEPsOXI7wgFrVB8nRYFSst/Av8KUOp0Zrpk81vskY/cb/NyDqEHE+fzbTfDlbPROaV
         bcoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nOq5iyMcYnp2lkKz6qC+70BZoqGGdKahRqfZnxYC4Rc=;
        b=b1zXS2CJ/WzeKVeCKyumT1ZCyK67anSJEunusTCVw5D52rAOmkST7IhOaujh08yHCR
         9YdJgoxQmaoFhg/mga72GXklSqgtn9BEs7CLv7pRQtijY2HxdFI9s21LE3Bmr18/LLFL
         noO3eGi1T20vNz8xD4tPyN5eyXL0ucnMFVCUq+gljrlI6kdicvjhtyA1kmsxbzPfn0v7
         WGO14tUcXIrO9Ely9Jon0jnFWiOi0xxWuj3j9iPcabOOwgtDGNlKR1LZTYFOge+DXRJt
         4GraPtcFBDvZXH+L1+DFS9Lm/0tRMtu1fxtjQowVfj/Ybf9+Hx366zklR7LhR17R3/z1
         Nj7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t0pGzOKn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t26si11976718jan.106.2021.03.01.13.53.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Mar 2021 13:53:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t0pGzOKn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGqTo-0002Qf-MT
	for alex.bennee@linaro.org; Mon, 01 Mar 2021 16:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGqRq-0000FG-Oa; Mon, 01 Mar 2021 16:51:26 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:37340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGqRp-0004mq-0R; Mon, 01 Mar 2021 16:51:26 -0500
Received: by mail-ej1-x634.google.com with SMTP id bm21so12327295ejb.4;
 Mon, 01 Mar 2021 13:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nOq5iyMcYnp2lkKz6qC+70BZoqGGdKahRqfZnxYC4Rc=;
 b=t0pGzOKnf5ZpOvCm5Y28TWHGQpYkmR/sdTOpQHUs5O4GMP7ySv6AzuyQ24ZR+f2mTQ
 disBbPz6o0XYwBpg//74hQCCoWYXrbauE5Kr65Z5cu2xGjdSHLgl67OcgWa3XUibhB5N
 +3bIk7zRjbFrhVFgjas7cTK+JKf8bsqGTzUL+ESJTmomp0EQ5GkcnsZzAGxcbWLBzRiZ
 tj9tmebrkwSY3Sjw9FwRKpiQo3K8xAKvUjy0oDROaKddgVW5TDh8F9tO6U7ymuuMExbd
 oVrpZK5uZsLJQNbUojsfG5SFX55PddMwqCfIdEvPwnWoFhX+YLag4BL6Z0I2UsN36X0i
 +acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nOq5iyMcYnp2lkKz6qC+70BZoqGGdKahRqfZnxYC4Rc=;
 b=jt7g5JNNXapy2wnYWIoJwcnpCGPnydbKPWRZsZjUZyEfGtXSX0Bs5bBovKg604ki5K
 oxhsxuS54oYup4J8Qicgu7nvz0DdRzT4rDLiSmogVK9ofM+88IgEgBFQMt3oP8VgcUuA
 YpLk4aZkIjoU6JA6MD8gZcYEKnJBgxhS8STVI17qENzs5GxxyvvuzqkOozJpK0JsskWU
 K4LzXhyTRrRSO2nyVBZ6EuXkvzbah0gXSYtdZ2KIb13aOGikPD1wiPUZoC3/MurfSqJr
 TZJUJqlGENB+YJd6kcXySpGUGytFqcVtSiu+VgfCAUFhpx7iX+qAdmKKNUlHYXdNO5Qb
 ItKg==
X-Gm-Message-State: AOAM533kl/PwogwEatemcQDfiNIDPT3/XLy3Jje9FT1we7gNfmgjC3Tj
 TCahJFIsg0owRtL3KeAHKNvyytxshW0=
X-Received: by 2002:a17:906:d554:: with SMTP id
 cr20mr1386495ejc.61.1614635481843; 
 Mon, 01 Mar 2021 13:51:21 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f9sm3826592eds.41.2021.03.01.13.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 13:51:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/17] target: Set CPUClass::vmsd instead of
 DeviceClass::vmsd
Date: Mon,  1 Mar 2021 22:50:54 +0100
Message-Id: <20210301215110.772346-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210301215110.772346-1-f4bug@amsat.org>
References: <20210301215110.772346-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DfiISd8DNWCq

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

