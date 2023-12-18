Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp722877eji;
        Mon, 18 Dec 2023 03:34:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEWIi6tRWvqylZ5r0+yAjmp7pOVBVpKtdpOTCXkpqeZobNv+JH3CtPbnIEY7Eo0V+/TaxS
X-Received: by 2002:a05:622a:251:b0:418:1088:7d69 with SMTP id c17-20020a05622a025100b0041810887d69mr22489378qtx.18.1702899278355;
        Mon, 18 Dec 2023 03:34:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702899278; cv=none;
        d=google.com; s=arc-20160816;
        b=hAGwzwlKe7gGRoxVMIVMUsqmwHCiPAFNqBxc7fg9F6GTc4e4m8EfW8ML0CSalxu9kC
         JIu3a/VEVFZi0M3Zkl+KG3LBKHPpCZHs3uslp9u7aXYlHIXlJ8Fl0EAMMrEMCA+vvK0x
         OlZ4tVJMRurLy+7rvkdAIvI+Ny1JOv65OrP7HPE3FvXMXtWV/pf3zOnxQXxQ1zB8Iva5
         ylEy/G1T6N3nzR3nhv6kaJkdVWJ4ND/oNJ0w7Y76pjwrF1hwPK5JjSplULHu9gJqwwbR
         svH3rlO25V0DUZkkMHzMaQeQ4OvzxqyeMtXL7MlTI8M/Orn5fLNZRtjSzpqSAotATj1g
         /1mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rIyXbTygsThOVzP4jBkF7Rj3QO0R5JlePmQL1JlO97A=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=WtbcVNWXy5GCjCx2+4dF7+XVKeEe0IMnn6580Fnd8uX/YVpT367m9KJfIGVmxvwonA
         HOifoclHBNkIXbvc9lhgunZhKAGyJqlSouBKjve7GOC5OYjqqpZQI2rG2evCPXWKwcxI
         RLtcMLqN9r+edDGpwaDcGeqW3TwPr9ZCt+Kp0JGthUIgeGUnSaX7576A330ppO8YaQB3
         v3mKkkWV4dMSTBQswxbqIyOpMe6iQmogbrnLVuks/MGXET5IraHHFObvsLz6FLpL9WQ3
         A9GszxojI2xH21mUaCu8IX3vrwu7Rbkowfwtibk5er3jeI8F/L4GbQG1v/nYBlE6oQL8
         4uPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IYkHe442;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cn12-20020a05622a248c00b004254e5138fesi26125014qtb.260.2023.12.18.03.34.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 03:34:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IYkHe442;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFBs9-0006f0-C4; Mon, 18 Dec 2023 06:33:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBs6-0006bU-3a
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:18 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBs0-0003IH-AO
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:17 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33664b4e038so957699f8f.3
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 03:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702899191; x=1703503991; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rIyXbTygsThOVzP4jBkF7Rj3QO0R5JlePmQL1JlO97A=;
 b=IYkHe442q5CBR70lIuFgjBrYM3Eyrk6VYnWQWYo/+TrH04Ur/fLevm/qM+/Kgc51We
 Tbm71kJHHw1wx5PtVpPDHykPpKVQEv2WRI0K/QeP7ShJUl7UJycv2doNtrawvEK+ALxO
 TlemXQopmoAeKVSjQTVZqGCkS5oq5DqscLcK7+SdVsqZ6+DGK24Kl/n0kSznLisGDdqx
 0LEQSINn10sSs/mtuCryZX/+xZ2Th5uSBgw6uL3z3S5yrNw2oosoyYp/fnRJIjptta02
 N+IRUZtEq52eZ/OvI10688pVcohIRDYGclpV210X92uEN//imOZcrRqxkqPDKWPeeNRk
 WzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702899191; x=1703503991;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rIyXbTygsThOVzP4jBkF7Rj3QO0R5JlePmQL1JlO97A=;
 b=IWH4XIB1uyDWuIX+jYQDgdgsnZcHEF6rIWo1mV3AUeKocZF7LUwQ0brNAs77k+yNy6
 4vjY5LdIiPiY4b52dI7zI5FvvO4ezAaoq/h7jnrsXaG2QY3DDKDXiSGNaUORTa1dgXz4
 hGKvNHx1jtl7mRssdeV1pcnNkU28tp1yBSAeteZkTKIgaunA8ItslqYdmcf9ZD+goMq/
 Xu2Ms02kJ92VhQYfqeLZJI+3LA2F6G1VDqn/kMNz+mNk/HsA9YUhfSaWIe3evc8a8E0f
 wDYi6Di3neyBWXAPpUBa9zN0nLEegJwke0ZmAtHjOS+/0XLraMiw/o8gNZgUe8GXAKH6
 OAKg==
X-Gm-Message-State: AOJu0YyVVJaK/gyPVEmjq5Fw8Xt9dD1kD5uguBtMj7UFeOrc7GldSt0R
 /zuPYGLbei86KtSsuD2I+cI/MSYb05yH/U2yJS4=
X-Received: by 2002:a05:6000:889:b0:336:96d:475c with SMTP id
 cs9-20020a056000088900b00336096d475cmr8115437wrb.5.1702899190943; 
 Mon, 18 Dec 2023 03:33:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b003366da509ecsm671193wro.85.2023.12.18.03.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:33:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/35] target/arm: Record correct opcode fields in cpreg for
 E2H aliases
Date: Mon, 18 Dec 2023 11:32:39 +0000
Message-Id: <20231218113305.2511480-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218113305.2511480-1-peter.maydell@linaro.org>
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dEPr0FnIDchD

For FEAT_VHE, we define a set of register aliases, so that for instance:
 * the SCTLR_EL1 either accesses the real SCTLR_EL1, or (if E2H is 1)
   SCTLR_EL2
 * a new SCTLR_EL12 register accesses SCTLR_EL1 if E2H is 1

However when we create the 'new_reg' cpreg struct for the SCTLR_EL12
register, we duplicate the information in the SCTLR_EL1 cpreg, which
means the opcode fields are those of SCTLR_EL1, not SCTLR_EL12.  This
is a problem for code which looks at the cpreg opcode fields to
determine behaviour (e.g.  in access_check_cp_reg()). In practice
the current checks we do there don't intersect with the *_EL12
registers, but for FEAT_NV this will become a problem.

Write the correct values from the encoding into the new_reg struct.
This restores the invariant that the cpreg that you get back
from the hashtable has opcode fields that match the key you used
to retrieve it.

When we call the readfn or writefn for the target register, we
pass it the cpreg struct for that target register, not the one
for the alias, in case the readfn/writefn want to look at the
opcode fields to determine behaviour. This means we need to
interpose custom read/writefns for the e12 aliases.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f1c7fbf319c..c6f069b74cd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6506,6 +6506,19 @@ static void el2_e2h_write(CPUARMState *env, const ARMCPRegInfo *ri,
     writefn(env, ri, value);
 }
 
+static uint64_t el2_e2h_e12_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /* Pass the EL1 register accessor its ri, not the EL12 alias ri */
+    return ri->orig_readfn(env, ri->opaque);
+}
+
+static void el2_e2h_e12_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    /* Pass the EL1 register accessor its ri, not the EL12 alias ri */
+    return ri->orig_writefn(env, ri->opaque, value);
+}
+
 static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
 {
     struct E2HAlias {
@@ -6605,6 +6618,28 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
         new_reg->type |= ARM_CP_ALIAS;
         /* Remove PL1/PL0 access, leaving PL2/PL3 R/W in place.  */
         new_reg->access &= PL2_RW | PL3_RW;
+        /* The new_reg op fields are as per new_key, not the target reg */
+        new_reg->crn = (a->new_key & CP_REG_ARM64_SYSREG_CRN_MASK)
+            >> CP_REG_ARM64_SYSREG_CRN_SHIFT;
+        new_reg->crm = (a->new_key & CP_REG_ARM64_SYSREG_CRM_MASK)
+            >> CP_REG_ARM64_SYSREG_CRM_SHIFT;
+        new_reg->opc0 = (a->new_key & CP_REG_ARM64_SYSREG_OP0_MASK)
+            >> CP_REG_ARM64_SYSREG_OP0_SHIFT;
+        new_reg->opc1 = (a->new_key & CP_REG_ARM64_SYSREG_OP1_MASK)
+            >> CP_REG_ARM64_SYSREG_OP1_SHIFT;
+        new_reg->opc2 = (a->new_key & CP_REG_ARM64_SYSREG_OP2_MASK)
+            >> CP_REG_ARM64_SYSREG_OP2_SHIFT;
+        new_reg->opaque = src_reg;
+        new_reg->orig_readfn = src_reg->readfn ?: raw_read;
+        new_reg->orig_writefn = src_reg->writefn ?: raw_write;
+        if (!new_reg->raw_readfn) {
+            new_reg->raw_readfn = raw_read;
+        }
+        if (!new_reg->raw_writefn) {
+            new_reg->raw_writefn = raw_write;
+        }
+        new_reg->readfn = el2_e2h_e12_read;
+        new_reg->writefn = el2_e2h_e12_write;
 
         ok = g_hash_table_insert(cpu->cp_regs,
                                  (gpointer)(uintptr_t)a->new_key, new_reg);
-- 
2.34.1

