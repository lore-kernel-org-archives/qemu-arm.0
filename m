Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2892137ejm;
        Mon, 24 Apr 2023 08:28:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350YHEy8wIys++gTSGJ51VZkfBOXLSY8mfzrRntsZRjVAw6sRvewDzuMOKVuzxYA2DiI7qaGg
X-Received: by 2002:a05:622a:64a:b0:3e6:59c2:cbae with SMTP id a10-20020a05622a064a00b003e659c2cbaemr23972490qtb.34.1682350110625;
        Mon, 24 Apr 2023 08:28:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682350110; cv=none;
        d=google.com; s=arc-20160816;
        b=UuKuUEzFY5crac9Klu/wSxZ0jFB7eWhvZPOZwakZUe+XVT2H91UGggD9+ZQpPNKxcN
         vQyJyNLJ07K2fjVTaX3pLU9/t7ZWi9bPOORVXHk0WlmOaw08Ol40BQn1XWFeiNyl/GKZ
         LSKolD3D6v9m/nLVq/uMzUPnWjcQcJ1xA10WqtrptigX+kL+Co1G0eNJkCWnl3YrOvIs
         AeESawb09YYLatVHDq1cttQWh5bpUcRljEhk4n9psfZe5jJgEIPtZ0g7EStQytDfzkvS
         5se3Gv4f1RBRY3dqXzbc8N52RPU+jYQ1wd7lAzc7Z/MtZ/yju+oVZXdAl+dKbJJQqcqS
         tLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YnTnpb/oRrMNBNJ0ApTxJdoFLFl10qOphFuNP0DCCUU=;
        b=ZITgDOfWD1BPUCWYDFGCUz1K/99lgY6k5ATGCE2OsZb/gK1/KS+5JTjKBdet8JbdhQ
         U6u5MkwZUby6PtlFx5pJJp2zl0i+2UZE0H6Smbjbm3nJmWFwDpphX68pwOxXhKMWWbXS
         9CDdmiThGsP8LkXvtwiKX845+F0I+DUAHnKpHXzDiVabw+3/qV3xRkFnXtK/vJezblLA
         QgbUtVuK1qqUeI78McA9WvWWLrWA8loNmEKSuUbvYqm9YEPwdQkf80gcJGYMpl0KaDVa
         Se9fLOiC84EQELc0wKYboTEPTQt+rUY/0WfAwN5JaSrwkQ1yt+GbFiF1g34v2JcdVDt+
         w9+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f8EpeHyY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u1-20020a05620a0c4100b00745e97ba532si7844547qki.736.2023.04.24.08.28.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Apr 2023 08:28:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f8EpeHyY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqy6F-0006kl-Qu; Mon, 24 Apr 2023 11:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqy6A-0006jR-0T
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:27:29 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqy65-0006sW-BS
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:27:25 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f1950f5628so33286065e9.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 08:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682350040; x=1684942040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YnTnpb/oRrMNBNJ0ApTxJdoFLFl10qOphFuNP0DCCUU=;
 b=f8EpeHyY54VprktfHG/XyBsX5br9tra7f77EMN8mLmSbi5ZWbG9NBzjZFEb0OYPDAD
 mJp4HxvOSVCGzHu+w6q+hSr7EaICR3bdWz31p0tTnifHwha4sLBNPdqMJs3vJu8xX35c
 /+IlZBBkyxEGNQjy8IE/1E+XpVZm2uxHlHlTmONPmX/naD2l1Cw8nEUwuLXBy5oZpUD4
 WiUyZ4D3ANezM8Ep7vwkXWe5XdfOMthBshY9PJm2EJJj92usOZNUy94gyhLIWF2T7Z7i
 4dj2hdRIGfjvrFsG2PgO0RLHWBcQLTibZgdvt/pkgS/vuw3ll7S0UwGH7Dqb//bs8zIK
 ubLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682350040; x=1684942040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YnTnpb/oRrMNBNJ0ApTxJdoFLFl10qOphFuNP0DCCUU=;
 b=AuyYtCw/7+dZpvklyO1d2eIlP5lzGTfxE89H8Jiqlh6/2NTJWDnO84Bc2xFHgqteMo
 YULzYdCL3kR9kqnbBFOFmslMLLZQ2t7+GIQOM8TSsMxgz9f//VSUA2E0MDvjmrDceAd9
 8wxcDrHkKQ6/J3kfFGpo/nSPeXuO0CoG8MKLmkCw4oUXv6CFC4a9LfJsyC6ybPlAob5e
 Rv5qOwT1JLglOw7YEuuhiOu4ZR8ijRbuK2Whnw6BVpcgAE+f6fVvTQtzSp5Z6Qta52zz
 EoeUBFy89nXcvBjVzin1Z7qkp5F8r9GmvmWsLqrLrFe6f2F+/TfF+qIdy6gD/cZc/0zg
 YOGA==
X-Gm-Message-State: AAQBX9fyQNoEj6nevMj4tTtQ+raFjpG5jbZufOjpGnomDTtG/QD7GDHC
 PEASv2NOrAMd9ZsXn0b74atroTIKcG+oQoLZ2DA=
X-Received: by 2002:a1c:7211:0:b0:3da:1f6a:7b36 with SMTP id
 n17-20020a1c7211000000b003da1f6a7b36mr7761722wmc.0.1682350039748; 
 Mon, 24 Apr 2023 08:27:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a5d45c1000000b002fdeafcb132sm10971517wrs.107.2023.04.24.08.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 08:27:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 1/3] hw/arm/boot: Make write_bootloader() public as
 arm_write_bootloader()
Date: Mon, 24 Apr 2023 16:27:15 +0100
Message-Id: <20230424152717.1333930-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424152717.1333930-1-peter.maydell@linaro.org>
References: <20230424152717.1333930-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vlsVmwSgDq6B

From: Cédric Le Goater <clg@kaod.org>

The arm boot.c code includes a utility function write_bootloader()
which assists in writing a boot-code fragment into guest memory,
including handling endianness and fixing it up with entry point
addresses and similar things.  This is useful not just for the boot.c
code but also in board model code, so rename it to
arm_write_bootloader() and make it globally visible.

Since we are making it public, make its API a little neater: move the
AddressSpace* argument to be next to the hwaddr argument, and allow
the fixupcontext array to be const, since we never modify it in this
function.

Cc: qemu-stable@nongnu.org
Signed-off-by: Cédric Le Goater <clg@kaod.org>
[PMM: Split out from another patch by Cédric, added doc comment]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/boot.h | 49 +++++++++++++++++++++++++++++++++++++++++++
 hw/arm/boot.c         | 35 +++++++------------------------
 2 files changed, 57 insertions(+), 27 deletions(-)

diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
index f18cc3064ff..80c492d7421 100644
--- a/include/hw/arm/boot.h
+++ b/include/hw/arm/boot.h
@@ -183,4 +183,53 @@ void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
                                             const struct arm_boot_info *info,
                                             hwaddr mvbar_addr);
 
+typedef enum {
+    FIXUP_NONE = 0,     /* do nothing */
+    FIXUP_TERMINATOR,   /* end of insns */
+    FIXUP_BOARDID,      /* overwrite with board ID number */
+    FIXUP_BOARD_SETUP,  /* overwrite with board specific setup code address */
+    FIXUP_ARGPTR_LO,    /* overwrite with pointer to kernel args */
+    FIXUP_ARGPTR_HI,    /* overwrite with pointer to kernel args (high half) */
+    FIXUP_ENTRYPOINT_LO, /* overwrite with kernel entry point */
+    FIXUP_ENTRYPOINT_HI, /* overwrite with kernel entry point (high half) */
+    FIXUP_GIC_CPU_IF,   /* overwrite with GIC CPU interface address */
+    FIXUP_BOOTREG,      /* overwrite with boot register address */
+    FIXUP_DSB,          /* overwrite with correct DSB insn for cpu */
+    FIXUP_MAX,
+} FixupType;
+
+typedef struct ARMInsnFixup {
+    uint32_t insn;
+    FixupType fixup;
+} ARMInsnFixup;
+
+/**
+ * arm_write_bootloader - write a bootloader to guest memory
+ * @name: name of the bootloader blob
+ * @as: AddressSpace to write the bootloader
+ * @addr: guest address to write it
+ * @insns: the blob to be loaded
+ * @fixupcontext: context to be used for any fixups in @insns
+ *
+ * Write a bootloader to guest memory at address @addr in the address
+ * space @as. @name is the name to use for the resulting ROM blob, so
+ * it should be unique in the system and reasonably identifiable for debugging.
+ *
+ * @insns must be an array of ARMInsnFixup structs, each of which has
+ * one 32-bit value to be written to the guest memory, and a fixup to be
+ * applied to the value. FIXUP_NONE (do nothing) is value 0, so effectively
+ * the fixup is optional when writing a struct initializer.
+ * The final entry in the array must be { 0, FIXUP_TERMINATOR }.
+ *
+ * All other supported fixup types have the semantics "ignore insn
+ * and instead use the value from the array element @fixupcontext[fixup]".
+ * The caller should therefore provide @fixupcontext as an array of
+ * size FIXUP_MAX whose elements have been initialized for at least
+ * the entries that @insns refers to.
+ */
+void arm_write_bootloader(const char *name,
+                          AddressSpace *as, hwaddr addr,
+                          const ARMInsnFixup *insns,
+                          const uint32_t *fixupcontext);
+
 #endif /* HW_ARM_BOOT_H */
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 54f6a3e0b3c..720f22531a6 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -60,26 +60,6 @@ AddressSpace *arm_boot_address_space(ARMCPU *cpu,
     return cpu_get_address_space(cs, asidx);
 }
 
-typedef enum {
-    FIXUP_NONE = 0,     /* do nothing */
-    FIXUP_TERMINATOR,   /* end of insns */
-    FIXUP_BOARDID,      /* overwrite with board ID number */
-    FIXUP_BOARD_SETUP,  /* overwrite with board specific setup code address */
-    FIXUP_ARGPTR_LO,    /* overwrite with pointer to kernel args */
-    FIXUP_ARGPTR_HI,    /* overwrite with pointer to kernel args (high half) */
-    FIXUP_ENTRYPOINT_LO, /* overwrite with kernel entry point */
-    FIXUP_ENTRYPOINT_HI, /* overwrite with kernel entry point (high half) */
-    FIXUP_GIC_CPU_IF,   /* overwrite with GIC CPU interface address */
-    FIXUP_BOOTREG,      /* overwrite with boot register address */
-    FIXUP_DSB,          /* overwrite with correct DSB insn for cpu */
-    FIXUP_MAX,
-} FixupType;
-
-typedef struct ARMInsnFixup {
-    uint32_t insn;
-    FixupType fixup;
-} ARMInsnFixup;
-
 static const ARMInsnFixup bootloader_aarch64[] = {
     { 0x580000c0 }, /* ldr x0, arg ; Load the lower 32-bits of DTB */
     { 0xaa1f03e1 }, /* mov x1, xzr */
@@ -150,9 +130,10 @@ static const ARMInsnFixup smpboot[] = {
     { 0, FIXUP_TERMINATOR }
 };
 
-static void write_bootloader(const char *name, hwaddr addr,
-                             const ARMInsnFixup *insns, uint32_t *fixupcontext,
-                             AddressSpace *as)
+void arm_write_bootloader(const char *name,
+                          AddressSpace *as, hwaddr addr,
+                          const ARMInsnFixup *insns,
+                          const uint32_t *fixupcontext)
 {
     /* Fix up the specified bootloader fragment and write it into
      * guest memory using rom_add_blob_fixed(). fixupcontext is
@@ -214,8 +195,8 @@ static void default_write_secondary(ARMCPU *cpu,
         fixupcontext[FIXUP_DSB] = CP15_DSB_INSN;
     }
 
-    write_bootloader("smpboot", info->smp_loader_start,
-                     smpboot, fixupcontext, as);
+    arm_write_bootloader("smpboot", as, info->smp_loader_start,
+                         smpboot, fixupcontext);
 }
 
 void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
@@ -1186,8 +1167,8 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
         fixupcontext[FIXUP_ENTRYPOINT_LO] = entry;
         fixupcontext[FIXUP_ENTRYPOINT_HI] = entry >> 32;
 
-        write_bootloader("bootloader", info->loader_start,
-                         primary_loader, fixupcontext, as);
+        arm_write_bootloader("bootloader", as, info->loader_start,
+                             primary_loader, fixupcontext);
 
         if (info->write_board_setup) {
             info->write_board_setup(cpu, info);
-- 
2.34.1

