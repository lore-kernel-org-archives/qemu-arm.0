Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1169576lfm;
        Mon, 17 May 2021 04:11:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOtgEv73Boq/tbofQF7xTghhuU1CNHg0ZqsFP1H0rnF5CPSD21Pv//9kFuy4ynAzdrwsPS
X-Received: by 2002:a05:6102:6d1:: with SMTP id m17mr2428429vsg.8.1621249887962;
        Mon, 17 May 2021 04:11:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621249887; cv=none;
        d=google.com; s=arc-20160816;
        b=kWjcjWOgXQ6VO00WkTZmvEmGkECKjQ/SvFrcEcKKlP9fvjqzDzjotIto8Uvr3Vx5Je
         GXhi9SHxxypq3KHpU7yQSjOB8MaHEBfXZnPsg0S83eY4lsH6HLFL6LkJgdnuzjt529tB
         zwduLU2zu3zIaVkZ6JCFzNlBrfYo/Unshn2CCPSb1qEVaduIouQ/7O2Lz0GW0/uuDLBD
         P6y9+EmtNrPatrMcrujx1ONvQUwVhklTa1Rv73hcC1+KJkh5/Kq07RhoecPqwWCbNCgL
         5EtO5xhuMNRKW37GlMPpDj5TzGRFTgfVxmushr3p+8n+pt8getnH1qQ96BYITAR0Q7ni
         mQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=62bRjuN6Hv82DBcOqLhZSxPlLlMeXZkMX2kFXTADKa8=;
        b=Q1pWxw7pQ6AL2aarHMmdAWEtlquCA3QHUyTxEFkqBjrYm1SdW016oKwBSXOVslWh0K
         LIC+AFULXqgN0fTK4JmTVrbpnH6DC+pgzRNl4pliGvkk92ffwdxz1NdprVN8wkyq72x+
         a03K6qiiKZUIF9QoM/iFEcubKegwN27xRSkNAqcbaHCvFaFvc2QGytSwFeLnFsSpYX82
         ywajJlggKxwXyShEXnHkhBYTihFgHPf5v0NFLkOVO/vkp3cPIqdILyJMY4Z0KRqRysU3
         CFG7yt+4grp6kAo4RqHqAsWc66ktG/3tTCCrH/x4twtXpiXAw3yn8exFoqWNN10Li0cc
         zniQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="WRR9/ZTG";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j24si6863515vso.108.2021.05.17.04.11.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 May 2021 04:11:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="WRR9/ZTG";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:50890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lib9j-0002RP-6N
	for alex.bennee@linaro.org; Mon, 17 May 2021 07:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liarY-0006ck-Uk; Mon, 17 May 2021 06:52:40 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liarX-0006nB-8c; Mon, 17 May 2021 06:52:40 -0400
Received: by mail-wr1-x434.google.com with SMTP id v12so5875522wrq.6;
 Mon, 17 May 2021 03:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=62bRjuN6Hv82DBcOqLhZSxPlLlMeXZkMX2kFXTADKa8=;
 b=WRR9/ZTGXumMwQZEBcx5Hs6N/5Olc0JagEXe+Tmnno2wD6IAr3o7LfKMfRoqj4pqSe
 yiYcxf6JAJYranESSCijaJ+stNpiHhYTIMTWKPa1DqEHM+0e9lzTPw0bUv/42NB8g2la
 DW7YEx32YzsytDjFXT0EyWGnXPz2+wQhlfKeujlrH0Ciqu03oo7d9eAhXaF8xKa4aCoT
 +kP6v92Sd4auYTQraXwNYBW3jwnIWsgfhxL3Vzz8T8mbu1XuER/Qxdrb626CH15f9DLk
 Edd73Er13ctIL3c7dY9ogD/Sk84sJn0mJMk1mx6jvbk4z5yS6UIDnrkx/RIcxU4+U53Y
 KZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=62bRjuN6Hv82DBcOqLhZSxPlLlMeXZkMX2kFXTADKa8=;
 b=t1TYMLzSMK7WiwrwN/LaQD5TheiCnRUAZnSMkmwegwdkVmXqdx1tkkDQlDr6R7SmRG
 BMAunPPVj7CynnAWzphlEo9QmNwRbVst3So0P2krpunkL5Vg6mMEfJbDH8X7XtWmd7Uh
 G1ezKQzg4gIdl4MH0Asc9f545RrQ10FRUeOgSI/O35sjP6VuHnRrPj402NjWjDJf/Rpg
 QG6mr2jGFNGlHMDcE7/PGClK5wjm/iaxT29tFPEBy3koIhEOaSqgttD0D6zQO44M+BKI
 QW58ISsrB0zH+AEEYt6Io4FtFGL9HxOnV7EDl8sJh0vM3KNwabZCZzc5Tc6JSTl1a2+w
 U9ng==
X-Gm-Message-State: AOAM530IxNmFpYojXsLLM5itG9PzGL3VBbBDzjxaGOvQ6Ro71fITMrTL
 cCAZIP47gOaYeF54j5WSwH9bxD/sErS75A==
X-Received: by 2002:adf:f14d:: with SMTP id y13mr2556205wro.261.1621248755997; 
 Mon, 17 May 2021 03:52:35 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id n7sm16178413wri.14.2021.05.17.03.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:52:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 11/23] cpu: Assert DeviceClass::vmsd is NULL on user
 emulation
Date: Mon, 17 May 2021 12:51:28 +0200
Message-Id: <20210517105140.1062037-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6zd/wmzgFp5p

Migration is specific to system emulation.

Restrict current DeviceClass::vmsd to sysemu using #ifdef'ry,
and assert in cpu_exec_realizefn() that dc->vmsd not set under
user emulation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v7: Check vmsd->unmigratable (David)
---
 cpu.c               | 2 ++
 target/sh4/cpu.c    | 5 +++--
 target/xtensa/cpu.c | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/cpu.c b/cpu.c
index 34a0484bf41..6fe4af27975 100644
--- a/cpu.c
+++ b/cpu.c
@@ -141,6 +141,8 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 #endif /* CONFIG_TCG */
 
 #ifdef CONFIG_USER_ONLY
+    assert(qdev_get_vmsd(DEVICE(cpu)) == NULL ||
+           qdev_get_vmsd(DEVICE(cpu))->unmigratable);
     assert(cc->vmsd == NULL);
 #else
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index ac65c88f1f8..35d4251aaf3 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -218,10 +218,12 @@ static void superh_cpu_initfn(Object *obj)
     env->movcal_backup_tail = &(env->movcal_backup);
 }
 
+#ifndef CONFIG_USER_ONLY
 static const VMStateDescription vmstate_sh_cpu = {
     .name = "cpu",
     .unmigratable = 1,
 };
+#endif
 
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -257,12 +259,11 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = superh_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = superh_cpu_get_phys_page_debug;
+    dc->vmsd = &vmstate_sh_cpu;
 #endif
     cc->disas_set_info = superh_cpu_disas_set_info;
 
     cc->gdb_num_core_regs = 59;
-
-    dc->vmsd = &vmstate_sh_cpu;
     cc->tcg_ops = &superh_tcg_ops;
 }
 
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index e2b2c7a71c1..a66527e2d45 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -176,10 +176,12 @@ static void xtensa_cpu_initfn(Object *obj)
 #endif
 }
 
+#ifndef CONFIG_USER_ONLY
 static const VMStateDescription vmstate_xtensa_cpu = {
     .name = "cpu",
     .unmigratable = 1,
 };
+#endif
 
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -216,9 +218,9 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_stop_before_watchpoint = true;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
+    dc->vmsd = &vmstate_xtensa_cpu;
 #endif
     cc->disas_set_info = xtensa_cpu_disas_set_info;
-    dc->vmsd = &vmstate_xtensa_cpu;
     cc->tcg_ops = &xtensa_tcg_ops;
 }
 
-- 
2.26.3

