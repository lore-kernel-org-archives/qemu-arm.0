Received: by 10.223.150.237 with SMTP id u100csp783370wrb;
        Tue, 7 Nov 2017 19:25:06 -0800 (PST)
X-Google-Smtp-Source: ABhQp+SfpKDpQsUONRMZC1Ag1bW+CBZ3suzcWR9EhjQAd1Q6QEP7XBV01hUoOq/dSzCKqAvfwPaW
X-Received: by 10.129.145.139 with SMTP id i133mr555129ywg.506.1510111506537;
        Tue, 07 Nov 2017 19:25:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510111506; cv=none;
        d=google.com; s=arc-20160816;
        b=ueQrb4Y+F1tUJrJEmmLnnvsLxLSd21+sU095KSJwG8BZ6/288ki1C/EJHtV4pXC5+v
         cAEw60RnVoGxQ2uCqCyWTPqBr7f5UzSe+n+ZmKcAgE66mUgV/L0cidtxZQ9rfhbe3gTL
         b+nBPAqrH/8a+cPqVnTN7wGOVjEEa9YjFiCxTeWopEW2es0aiSneTR24Ah9MigwPmLCF
         Atn3UmMT6RKgOhUyJCcyGR6UJj86jBxrrnXcEeMhhCQLbaRMeTbPWWM9f14XSHmn4xsh
         wPKzNHogk02yxymqHPq13ppkZz68I9uZ2Ds0+Ujn3bHwo71OM8iykBH1tG2h/0Y5wpKg
         x4+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=V3cclVfuC7oFwvi3lVmvbGi6mkgo5Q16+v9Za8vT3I8=;
        b=Mn1PQGykbtG3tiicloQtzhI19/RfFWE6AIdTaIlQlIHmOh9ETgRKFQZ/9xW+tTJKHi
         ru5JQgRpXGmfpaRW1yRa0uBgTdqse8BAHRU8L8z/jevp+TStvUI9rVGwj8k5aQ4EXnoM
         XuB0RuhK8PtZ/Opeg9U+UZUeVISECdQG50s9ChsOJndfzHcufuq93xHNv3yXcHNR4jIp
         vKbZ3JeS+6oDPyQfYq3TWeQ7n2+UE7YBnSISdZwZOkg4xhjZiZJGEg0umvncUD/CLW3b
         HUdo+bIuDNj3rEKNy7BmgrX2uDqIE0/WicrlQ5nb1+yzhv5kdEGuBd2t9GY/z+snIyWB
         jfpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UXq3le01;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j1si640292ywa.594.2017.11.07.19.25.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 19:25:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UXq3le01;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57114 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCGzB-0004sk-VU
	for alex.bennee@linaro.org; Tue, 07 Nov 2017 22:25:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1eCGz2-0004sd-Pd
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 22:24:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1eCGyx-00006Q-RK
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 22:24:56 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:48492)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1eCGyx-00004y-JA; Tue, 07 Nov 2017 22:24:51 -0500
Received: by mail-pg0-x241.google.com with SMTP id v78so971501pgb.5;
	Tue, 07 Nov 2017 19:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=V3cclVfuC7oFwvi3lVmvbGi6mkgo5Q16+v9Za8vT3I8=;
	b=UXq3le01nR/HHI2lisCDRrtF+OTs0dLJEdcy+lUGrynCqGGcWbvuOh8S5ht1NhUzcy
	7LIRoxbr73j56bvRgh6/U8ux1cqnmNaCRPNMlZNxGs8j0bRUUiVJ3O4TDia5oD4DffDd
	wJqK7jJu36csYUspqk5nmUq4BqU92UZvFjMnzp0foDejWoPKKAlPDOs+9/V52u+UfBde
	S9BQ34yBnExyCrhWXzQuLooqvG9Kcg8j6pD8VIBH5y7ISqgUdi0bkHBD6AUmsmcDfhXN
	elhcYfVkN8q7fGP9sSZaLextHIYbOwo8ZcwCJt3VgNCwWa6cXzl1WO0R8qRvI8Kah54L
	Nw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=V3cclVfuC7oFwvi3lVmvbGi6mkgo5Q16+v9Za8vT3I8=;
	b=Ie0R5YVNu0WRrZh7k/J5ZvxowSQLe09eeewbXAOa1cKcgyLwPCGkQsQl5XAk/WBCYX
	QqQEZVm/SJQmbewpfy8rfmF+HduziPzucHQxHoXMTITH5bXeOnoEwmHIYMdkU20w2T8N
	YJGuLID3pEcsm4DzW7RMOdk/hKoh+0pQv7LN7RGn41LtxvezEYzHlLWhBrPbjiAnLBza
	zPvsofo4JVCSeJBlqgkuqx55taTY1T8hm328a3T7qv+ZrVZxFDZqVqojGNTUclVdhhEH
	bkyna1JtmEAD2FXd7cvKo/APZD7/Z28JMS7eIvo8y4C312q20nc+GlanubHkjvHpAqIr
	AUgg==
X-Gm-Message-State: AJaThX76JqDF/mJfAmfy5AP4Ia6dZO5jzuNCt54J1FahFFw9x9t/dqnS
	n0S4zLY5B0QaN/Al5gMJ7tg=
X-Received: by 10.101.82.193 with SMTP id z1mr867294pgp.312.1510111489849;
	Tue, 07 Nov 2017 19:24:49 -0800 (PST)
Received: from aurora.jms.id.au ([203.0.153.9])
	by smtp.gmail.com with ESMTPSA id c1sm4995739pfa.12.2017.11.07.19.24.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 Nov 2017 19:24:48 -0800 (PST)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Wed, 08 Nov 2017 13:54:41 +1030
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  8 Nov 2017 13:54:27 +1030
Message-Id: <20171108032427.11163-1-joel@jms.id.au>
X-Mailer: git-send-email 2.14.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH] hw/arm/aspeed: Unlock SCU when running kernel
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /YuL1eIUXJAL

The ASPEED hardware contains a lock register for the SCU that disables
any writes to the SCU when it is locked. The machine comes up with the
lock enabled, but on all known hardware u-boot will unlock it and leave
it unlocked when loading the kernel.

This means the kernel expects the SCU to be unlocked. When booting from
an emulated ROM the normal u-boot unlock path is executed. Things don't
go well when booting using the -kernel command line, as u-boot does not
run first.

Change behaviour so that when a kernel is passed to the machine, set the
reset value of the SCU to be unlocked.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed.c               | 10 ++++++++++
 hw/arm/aspeed_soc.c           |  2 ++
 hw/misc/aspeed_scu.c          |  2 ++
 hw/misc/aspeed_sdmc.c         |  1 -
 include/hw/misc/aspeed_scu.h  |  1 +
 include/hw/misc/aspeed_sdmc.h |  2 ++
 6 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index ab895ad490af..179ee66624b9 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -36,6 +36,7 @@ typedef struct AspeedBoardState {
 typedef struct AspeedBoardConfig {
     const char *soc_name;
     uint32_t hw_strap1;
+    uint32_t hw_prot_key;
     const char *fmc_model;
     const char *spi_model;
     uint32_t num_cs;
@@ -186,6 +187,15 @@ static void aspeed_board_init(MachineState *machine,
                             &error_abort);
     object_property_set_int(OBJECT(&bmc->soc), cfg->num_cs, "num-cs",
                             &error_abort);
+    if (machine->kernel_filename) {
+        /*
+         * When booting with a -kernel command line there is no u-boot
+         * that runs to unlock the SCU. In this case set the default to
+         * be unlocked as the kernel expects
+         */
+        object_property_set_int(OBJECT(&bmc->soc), PROT_KEY_UNLOCK,
+                                "hw-prot-key", &error_abort);
+    }
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_abort);
 
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 5aa3d2ddd9cd..c83b7e207b86 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -154,6 +154,8 @@ static void aspeed_soc_init(Object *obj)
                               "hw-strap1", &error_abort);
     object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
                               "hw-strap2", &error_abort);
+    object_property_add_alias(obj, "hw-prot-key", OBJECT(&s->scu),
+                              "hw-prot-key", &error_abort);
 
     object_initialize(&s->fmc, sizeof(s->fmc), sc->info->fmc_typename);
     object_property_add_child(obj, "fmc", OBJECT(&s->fmc), NULL);
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 95022d3607ad..c71e77729581 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -246,6 +246,7 @@ static void aspeed_scu_reset(DeviceState *dev)
     s->regs[SILICON_REV] = s->silicon_rev;
     s->regs[HW_STRAP1] = s->hw_strap1;
     s->regs[HW_STRAP2] = s->hw_strap2;
+    s->regs[PROT_KEY] = s->hw_prot_key;
 }
 
 static uint32_t aspeed_silicon_revs[] = {
@@ -299,6 +300,7 @@ static Property aspeed_scu_properties[] = {
     DEFINE_PROP_UINT32("silicon-rev", AspeedSCUState, silicon_rev, 0),
     DEFINE_PROP_UINT32("hw-strap1", AspeedSCUState, hw_strap1, 0),
     DEFINE_PROP_UINT32("hw-strap2", AspeedSCUState, hw_strap2, 0),
+    DEFINE_PROP_UINT32("hw-prot-key", AspeedSCUState, hw_prot_key, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index f0b3053fae36..35dc803604f8 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -18,7 +18,6 @@
 
 /* Protection Key Register */
 #define R_PROT            (0x00 / 4)
-#define   PROT_KEY_UNLOCK     0xFC600309
 
 /* Configuration Register */
 #define R_CONF            (0x04 / 4)
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index bd4ac013f997..f5da54e27105 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -29,6 +29,7 @@ typedef struct AspeedSCUState {
     uint32_t silicon_rev;
     uint32_t hw_strap1;
     uint32_t hw_strap2;
+    uint32_t hw_prot_key;
 } AspeedSCUState;
 
 #define AST2400_A0_SILICON_REV   0x02000303U
diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdmc.h
index 551c8afdf4be..a1b3232c5ef3 100644
--- a/include/hw/misc/aspeed_sdmc.h
+++ b/include/hw/misc/aspeed_sdmc.h
@@ -16,6 +16,8 @@
 
 #define ASPEED_SDMC_NR_REGS (0x8 >> 2)
 
+#define PROT_KEY_UNLOCK 0xFC600309
+
 typedef struct AspeedSDMCState {
     /*< private >*/
     SysBusDevice parent_obj;
-- 
2.14.1

