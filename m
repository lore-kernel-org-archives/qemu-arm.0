Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1371365ejb;
        Wed, 19 Jun 2024 05:50:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTtMpbWN7inkL5yEl7VhLUR3/P36pgwzc72XL4P+2bbdVF63DouAoBAUXGwOMVaHUNlqsO8pFfRZh6UPArD6iQSgsK2uKf
X-Google-Smtp-Source: AGHT+IHWlinAbRRbrdRBifqQK/r2nr+lztHrtigatngPoT7hSZCKWOUEe1vVQHmX9YGT5nm8PRnH
X-Received: by 2002:a5b:b05:0:b0:dfa:ff74:f24f with SMTP id 3f1490d57ef6-e02be16fd06mr2874925276.28.1718801432633;
        Wed, 19 Jun 2024 05:50:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718801432; cv=none;
        d=google.com; s=arc-20160816;
        b=1Dqbk7FotOSAObhJJ4kkN7IYFFMHcoEB2LjkuYZNpME9p1fpyeMaJbRnyZo5xaoQQo
         Bi4JSXrVWky/cfkpYnwYfXvyEyXeMqaDeslGHGXEue+//cOdIv3QJNRqph4IWMwmxfJM
         Bgv+4MTaYbexi4nSNYPPsnymnfptTiMM5vcQrGAE5XZZalVavUAM1vVDoNyOJCNZdUs5
         ulw+q1njrV4c7n2aMY98GecI+sBwM8Ukt6FY8MjNyNKcWY/UXx+UC0Mf6innLqNHn0Yc
         uBCFs0nRg0JITgp8fYY6qQbmfmxsGDEiAPx9+pIjMat6gmREfugq012MqMQbNxSD+uCO
         H05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7LS7O9dFBi9P9NXcnsBVdZ2SR50qoYr4kXRSECVup2M=;
        fh=/B4jBORy0vwqdm2BkteD4YJEAizsMgGaiVEt086pz30=;
        b=BCZWHXYynWsBBfl5XWD+JA2RwMzjDvdCJAaoc/1S4TDOGGZBDqsPYgci0W0qrDl25z
         YrltEbAQO2SSN5HFNPZ0QE7RJw7MGfteFUFyxGmb67AN1N6hGsao0OMqrRfpH8MC4oyu
         yS5KWpozi/46MYaV/2TtkWgjS1WZnYNnyjBLPIEvGAiT4yU/PN9NRjoE4IM5InXqwD+Z
         HTs46Kd60frfnYpyaHpEoAxDePJTxxivy1+xIsgKtb2mP5IDPtAPHtEgu8RiZBnvhkri
         gY/485TxmGgvd0aXsbDU/I9ZHHNYs+MgcVAdhCNmTwtHJW4hN94LmCtXlPUaA4PNE+db
         ZIwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FzoSGmDi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-441f3128083si154388521cf.779.2024.06.19.05.50.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2024 05:50:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FzoSGmDi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJuka-0005Zr-GH; Wed, 19 Jun 2024 08:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sJukY-0005ZF-IE
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 08:49:19 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sJukV-0008Mn-Ep
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 08:49:18 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57d07673185so1220406a12.1
 for <qemu-arm@nongnu.org>; Wed, 19 Jun 2024 05:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718801354; x=1719406154; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7LS7O9dFBi9P9NXcnsBVdZ2SR50qoYr4kXRSECVup2M=;
 b=FzoSGmDixW/9NjYRB2i0eamBEKWbQjnJyfqu9WX8Poan0UMuBvTzfiVEXPIbUmo32T
 56sB18je4J+AsJ/uHX6gFbbbRAfeBYjIKjVDIN3b+6o+si7sCPb/euJmhOm5S9r0MZdO
 MJqvvM+9cPMHHmN+nWYDlm5XWbhl9WFhdDQ3S9vHLgzrq81vwSxYHDmlFTuaFL8AjUPe
 Mly3/g7BU0PohJ4KvBLTGrw4rGHuWP67fDfziefDCeKy1E/VulWbdXdEvqKDBe+aOShb
 yzW6Z5Qhn5/95Kq37M5LJOMOpXY26Nm16twC6wXgqLJ+H/bxVXMnA2gZQ/mzIUOXg9Bp
 MRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718801354; x=1719406154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7LS7O9dFBi9P9NXcnsBVdZ2SR50qoYr4kXRSECVup2M=;
 b=UKTzf9Lv4uRFy4Ur8X+f7glLdCj8nyIHU3RUEW+SxBvqZcqUpiV2uf5qf4SbEjXVjz
 xZRUslE/gn2ZtAv1ojTDc/SE/6lZjH0JTdWFMzfgPuE+i39DRa3D0uw630WOLXWNg+L6
 j1HYXcn81NaXidNyjRjoL6HRbTa0iCmxjNFsF3PkgTcQpNCEvEM7npN5ODIgKzKHUvkC
 GhBC009KLCX12TweWdpyqm6NafOfSTlKVXUKd+Cgl2ry4Rh7VHxSUNocqqQZXjZov5PO
 zPTLy0WWQ4eUrsyXVlmJ0C0HFv9+mpC8cTboG+KoylR0ke6A79cg1U/sevwwnVaxqJbO
 8ULw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf/NRPd1m7XvkeANd/tQbIntapls8GtF1mKWEFjt1eY+48dTdzMdtnn/I15YqipN8FnS8QR9pPV59nSZWuHBU3Gg59
X-Gm-Message-State: AOJu0YwD1Txs3Xeq97W4rahUmhdfI34YL8akcXTyDBOEyjXoH3QA8xvF
 GHfG95wD2rLqWEicRvEc+5UfnwRMRSFUIJFAs8deT6jsO8aNRVP39OzngKYUv/w=
X-Received: by 2002:a50:8719:0:b0:57c:571f:e52d with SMTP id
 4fb4d7f45d1cf-57d07ebeaaamr1571053a12.36.1718801353752; 
 Wed, 19 Jun 2024 05:49:13 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.133.105])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da371sm8294617a12.24.2024.06.19.05.49.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 19 Jun 2024 05:49:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] target/arm: Merge gdbstub64.c within gdbstub.c
Date: Wed, 19 Jun 2024 14:49:02 +0200
Message-ID: <20240619124903.56898-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240619124903.56898-1-philmd@linaro.org>
References: <20240619124903.56898-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: XyQV4t6F0lin

Simple code movement adding #ifdef'ry on TARGET_AARCH64.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/gdbstub.c   | 363 ++++++++++++++++++++++++++++++++++++++
 target/arm/gdbstub64.c | 383 -----------------------------------------
 target/arm/meson.build |   1 -
 3 files changed, 363 insertions(+), 384 deletions(-)
 delete mode 100644 target/arm/gdbstub64.c

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index a3bb73cfa7..508b3d8116 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -18,6 +18,7 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "exec/gdbstub.h"
 #include "gdbstub/helpers.h"
@@ -310,6 +311,368 @@ static GDBFeature *arm_gen_dynamic_sysreg_feature(CPUState *cs, int base_reg)
     return &cpu->dyn_sysreg_feature.desc;
 }
 
+#ifdef TARGET_AARCH64
+int aarch64_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    if (n < 31) {
+        /* Core integer register.  */
+        return gdb_get_reg64(mem_buf, env->xregs[n]);
+    }
+    switch (n) {
+    case 31:
+        return gdb_get_reg64(mem_buf, env->xregs[31]);
+    case 32:
+        return gdb_get_reg64(mem_buf, env->pc);
+    case 33:
+        return gdb_get_reg32(mem_buf, pstate_read(env));
+    }
+    /* Unknown register.  */
+    return 0;
+}
+
+int aarch64_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    uint64_t tmp;
+
+    tmp = ldq_p(mem_buf);
+
+    if (n < 31) {
+        /* Core integer register.  */
+        env->xregs[n] = tmp;
+        return 8;
+    }
+    switch (n) {
+    case 31:
+        env->xregs[31] = tmp;
+        return 8;
+    case 32:
+        env->pc = tmp;
+        return 8;
+    case 33:
+        /* CPSR */
+        pstate_write(env, tmp);
+        return 4;
+    }
+    /* Unknown register.  */
+    return 0;
+}
+
+int aarch64_gdb_get_fpu_reg(CPUState *cs, GByteArray *buf, int reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    switch (reg) {
+    case 0 ... 31:
+    {
+        /* 128 bit FP register - quads are in LE order */
+        uint64_t *q = aa64_vfp_qreg(env, reg);
+        return gdb_get_reg128(buf, q[1], q[0]);
+    }
+    case 32:
+        /* FPSR */
+        return gdb_get_reg32(buf, vfp_get_fpsr(env));
+    case 33:
+        /* FPCR */
+        return gdb_get_reg32(buf, vfp_get_fpcr(env));
+    default:
+        return 0;
+    }
+}
+
+int aarch64_gdb_set_fpu_reg(CPUState *cs, uint8_t *buf, int reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    switch (reg) {
+    case 0 ... 31:
+        /* 128 bit FP register */
+        {
+            uint64_t *q = aa64_vfp_qreg(env, reg);
+            q[0] = ldq_le_p(buf);
+            q[1] = ldq_le_p(buf + 8);
+            return 16;
+        }
+    case 32:
+        /* FPSR */
+        vfp_set_fpsr(env, ldl_p(buf));
+        return 4;
+    case 33:
+        /* FPCR */
+        vfp_set_fpcr(env, ldl_p(buf));
+        return 4;
+    default:
+        return 0;
+    }
+}
+
+int aarch64_gdb_get_sve_reg(CPUState *cs, GByteArray *buf, int reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    switch (reg) {
+    /* The first 32 registers are the zregs */
+    case 0 ... 31:
+    {
+        int vq, len = 0;
+        for (vq = 0; vq < cpu->sve_max_vq; vq++) {
+            len += gdb_get_reg128(buf,
+                                  env->vfp.zregs[reg].d[vq * 2 + 1],
+                                  env->vfp.zregs[reg].d[vq * 2]);
+        }
+        return len;
+    }
+    case 32:
+        return gdb_get_reg32(buf, vfp_get_fpsr(env));
+    case 33:
+        return gdb_get_reg32(buf, vfp_get_fpcr(env));
+    /* then 16 predicates and the ffr */
+    case 34 ... 50:
+    {
+        int preg = reg - 34;
+        int vq, len = 0;
+        for (vq = 0; vq < cpu->sve_max_vq; vq = vq + 4) {
+            len += gdb_get_reg64(buf, env->vfp.pregs[preg].p[vq / 4]);
+        }
+        return len;
+    }
+    case 51:
+    {
+        /*
+         * We report in Vector Granules (VG) which is 64bit in a Z reg
+         * while the ZCR works in Vector Quads (VQ) which is 128bit chunks.
+         */
+        int vq = sve_vqm1_for_el(env, arm_current_el(env)) + 1;
+        return gdb_get_reg64(buf, vq * 2);
+    }
+    default:
+        /* gdbstub asked for something out our range */
+        qemu_log_mask(LOG_UNIMP, "%s: out of range register %d", __func__, reg);
+        break;
+    }
+
+    return 0;
+}
+
+int aarch64_gdb_set_sve_reg(CPUState *cs, uint8_t *buf, int reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    /* The first 32 registers are the zregs */
+    switch (reg) {
+    /* The first 32 registers are the zregs */
+    case 0 ... 31:
+    {
+        int vq, len = 0;
+        uint64_t *p = (uint64_t *) buf;
+        for (vq = 0; vq < cpu->sve_max_vq; vq++) {
+            env->vfp.zregs[reg].d[vq * 2 + 1] = *p++;
+            env->vfp.zregs[reg].d[vq * 2] = *p++;
+            len += 16;
+        }
+        return len;
+    }
+    case 32:
+        vfp_set_fpsr(env, *(uint32_t *)buf);
+        return 4;
+    case 33:
+        vfp_set_fpcr(env, *(uint32_t *)buf);
+        return 4;
+    case 34 ... 50:
+    {
+        int preg = reg - 34;
+        int vq, len = 0;
+        uint64_t *p = (uint64_t *) buf;
+        for (vq = 0; vq < cpu->sve_max_vq; vq = vq + 4) {
+            env->vfp.pregs[preg].p[vq / 4] = *p++;
+            len += 8;
+        }
+        return len;
+    }
+    case 51:
+        /* cannot set vg via gdbstub */
+        return 0;
+    default:
+        /* gdbstub asked for something out our range */
+        break;
+    }
+
+    return 0;
+}
+
+int aarch64_gdb_get_pauth_reg(CPUState *cs, GByteArray *buf, int reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    switch (reg) {
+    case 0: /* pauth_dmask */
+    case 1: /* pauth_cmask */
+    case 2: /* pauth_dmask_high */
+    case 3: /* pauth_cmask_high */
+        /*
+         * Note that older versions of this feature only contained
+         * pauth_{d,c}mask, for use with Linux user processes, and
+         * thus exclusively in the low half of the address space.
+         *
+         * To support system mode, and to debug kernels, two new regs
+         * were added to cover the high half of the address space.
+         * For the purpose of pauth_ptr_mask, we can use any well-formed
+         * address within the address space half -- here, 0 and -1.
+         */
+        {
+            bool is_data = !(reg & 1);
+            bool is_high = reg & 2;
+            ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
+            ARMVAParameters param;
+
+            param = aa64_va_parameters(env, -is_high, mmu_idx, is_data, false);
+            return gdb_get_reg64(buf, pauth_ptr_mask(param));
+        }
+    default:
+        return 0;
+    }
+}
+
+int aarch64_gdb_set_pauth_reg(CPUState *cs, uint8_t *buf, int reg)
+{
+    /* All pseudo registers are read-only. */
+    return 0;
+}
+
+static void output_vector_union_type(GDBFeatureBuilder *builder, int reg_width,
+                                     const char *name)
+{
+    struct TypeSize {
+        const char *gdb_type;
+        short size;
+        char sz, suffix;
+    };
+
+    static const struct TypeSize vec_lanes[] = {
+        /* quads */
+        { "uint128", 128, 'q', 'u' },
+        { "int128", 128, 'q', 's' },
+        /* 64 bit */
+        { "ieee_double", 64, 'd', 'f' },
+        { "uint64", 64, 'd', 'u' },
+        { "int64", 64, 'd', 's' },
+        /* 32 bit */
+        { "ieee_single", 32, 's', 'f' },
+        { "uint32", 32, 's', 'u' },
+        { "int32", 32, 's', 's' },
+        /* 16 bit */
+        { "ieee_half", 16, 'h', 'f' },
+        { "uint16", 16, 'h', 'u' },
+        { "int16", 16, 'h', 's' },
+        /* bytes */
+        { "uint8", 8, 'b', 'u' },
+        { "int8", 8, 'b', 's' },
+    };
+
+    static const char suf[] = { 'b', 'h', 's', 'd', 'q' };
+    int i, j;
+
+    /* First define types and totals in a whole VL */
+    for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
+        gdb_feature_builder_append_tag(
+            builder, "<vector id=\"%s%c%c\" type=\"%s\" count=\"%d\"/>",
+            name, vec_lanes[i].sz, vec_lanes[i].suffix,
+            vec_lanes[i].gdb_type, reg_width / vec_lanes[i].size);
+    }
+
+    /*
+     * Now define a union for each size group containing unsigned and
+     * signed and potentially float versions of each size from 128 to
+     * 8 bits.
+     */
+    for (i = 0; i < ARRAY_SIZE(suf); i++) {
+        int bits = 8 << i;
+
+        gdb_feature_builder_append_tag(builder, "<union id=\"%sn%c\">",
+                                       name, suf[i]);
+        for (j = 0; j < ARRAY_SIZE(vec_lanes); j++) {
+            if (vec_lanes[j].size == bits) {
+                gdb_feature_builder_append_tag(
+                    builder, "<field name=\"%c\" type=\"%s%c%c\"/>",
+                    vec_lanes[j].suffix, name,
+                    vec_lanes[j].sz, vec_lanes[j].suffix);
+            }
+        }
+        gdb_feature_builder_append_tag(builder, "</union>");
+    }
+
+    /* And now the final union of unions */
+    gdb_feature_builder_append_tag(builder, "<union id=\"%s\">", name);
+    for (i = ARRAY_SIZE(suf) - 1; i >= 0; i--) {
+        gdb_feature_builder_append_tag(builder,
+                                       "<field name=\"%c\" type=\"%sn%c\"/>",
+                                       suf[i], name, suf[i]);
+    }
+    gdb_feature_builder_append_tag(builder, "</union>");
+}
+
+GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs, int base_reg)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    int reg_width = cpu->sve_max_vq * 128;
+    int pred_width = cpu->sve_max_vq * 16;
+    GDBFeatureBuilder builder;
+    char *name;
+    int reg = 0;
+    int i;
+
+    gdb_feature_builder_init(&builder, &cpu->dyn_svereg_feature.desc,
+                             "org.gnu.gdb.aarch64.sve", "sve-registers.xml",
+                             base_reg);
+
+    /* Create the vector union type. */
+    output_vector_union_type(&builder, reg_width, "svev");
+
+    /* Create the predicate vector type. */
+    gdb_feature_builder_append_tag(
+        &builder, "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
+        pred_width / 8);
+
+    /* Define the vector registers. */
+    for (i = 0; i < 32; i++) {
+        name = g_strdup_printf("z%d", i);
+        gdb_feature_builder_append_reg(&builder, name, reg_width, reg++,
+                                       "svev", NULL);
+    }
+
+    /* fpscr & status registers */
+    gdb_feature_builder_append_reg(&builder, "fpsr", 32, reg++,
+                                   "int", "float");
+    gdb_feature_builder_append_reg(&builder, "fpcr", 32, reg++,
+                                   "int", "float");
+
+    /* Define the predicate registers. */
+    for (i = 0; i < 16; i++) {
+        name = g_strdup_printf("p%d", i);
+        gdb_feature_builder_append_reg(&builder, name, pred_width, reg++,
+                                       "svep", NULL);
+    }
+    gdb_feature_builder_append_reg(&builder, "ffr", pred_width, reg++,
+                                   "svep", "vector");
+
+    /* Define the vector length pseudo-register. */
+    gdb_feature_builder_append_reg(&builder, "vg", 64, reg++, "int", NULL);
+
+    gdb_feature_builder_end(&builder);
+
+    return &cpu->dyn_svereg_feature.desc;
+}
+#endif
+
 #ifdef CONFIG_TCG
 typedef enum {
     M_SYSREG_MSP,
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
deleted file mode 100644
index caa31ff3fa..0000000000
--- a/target/arm/gdbstub64.c
+++ /dev/null
@@ -1,383 +0,0 @@
-/*
- * ARM gdb server stub: AArch64 specific functions.
- *
- * Copyright (c) 2013 SUSE LINUX Products GmbH
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-#include "qemu/osdep.h"
-#include "qemu/log.h"
-#include "cpu.h"
-#include "internals.h"
-#include "gdbstub/helpers.h"
-
-int aarch64_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    if (n < 31) {
-        /* Core integer register.  */
-        return gdb_get_reg64(mem_buf, env->xregs[n]);
-    }
-    switch (n) {
-    case 31:
-        return gdb_get_reg64(mem_buf, env->xregs[31]);
-    case 32:
-        return gdb_get_reg64(mem_buf, env->pc);
-    case 33:
-        return gdb_get_reg32(mem_buf, pstate_read(env));
-    }
-    /* Unknown register.  */
-    return 0;
-}
-
-int aarch64_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    uint64_t tmp;
-
-    tmp = ldq_p(mem_buf);
-
-    if (n < 31) {
-        /* Core integer register.  */
-        env->xregs[n] = tmp;
-        return 8;
-    }
-    switch (n) {
-    case 31:
-        env->xregs[31] = tmp;
-        return 8;
-    case 32:
-        env->pc = tmp;
-        return 8;
-    case 33:
-        /* CPSR */
-        pstate_write(env, tmp);
-        return 4;
-    }
-    /* Unknown register.  */
-    return 0;
-}
-
-int aarch64_gdb_get_fpu_reg(CPUState *cs, GByteArray *buf, int reg)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    switch (reg) {
-    case 0 ... 31:
-    {
-        /* 128 bit FP register - quads are in LE order */
-        uint64_t *q = aa64_vfp_qreg(env, reg);
-        return gdb_get_reg128(buf, q[1], q[0]);
-    }
-    case 32:
-        /* FPSR */
-        return gdb_get_reg32(buf, vfp_get_fpsr(env));
-    case 33:
-        /* FPCR */
-        return gdb_get_reg32(buf, vfp_get_fpcr(env));
-    default:
-        return 0;
-    }
-}
-
-int aarch64_gdb_set_fpu_reg(CPUState *cs, uint8_t *buf, int reg)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    switch (reg) {
-    case 0 ... 31:
-        /* 128 bit FP register */
-        {
-            uint64_t *q = aa64_vfp_qreg(env, reg);
-            q[0] = ldq_le_p(buf);
-            q[1] = ldq_le_p(buf + 8);
-            return 16;
-        }
-    case 32:
-        /* FPSR */
-        vfp_set_fpsr(env, ldl_p(buf));
-        return 4;
-    case 33:
-        /* FPCR */
-        vfp_set_fpcr(env, ldl_p(buf));
-        return 4;
-    default:
-        return 0;
-    }
-}
-
-int aarch64_gdb_get_sve_reg(CPUState *cs, GByteArray *buf, int reg)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    switch (reg) {
-    /* The first 32 registers are the zregs */
-    case 0 ... 31:
-    {
-        int vq, len = 0;
-        for (vq = 0; vq < cpu->sve_max_vq; vq++) {
-            len += gdb_get_reg128(buf,
-                                  env->vfp.zregs[reg].d[vq * 2 + 1],
-                                  env->vfp.zregs[reg].d[vq * 2]);
-        }
-        return len;
-    }
-    case 32:
-        return gdb_get_reg32(buf, vfp_get_fpsr(env));
-    case 33:
-        return gdb_get_reg32(buf, vfp_get_fpcr(env));
-    /* then 16 predicates and the ffr */
-    case 34 ... 50:
-    {
-        int preg = reg - 34;
-        int vq, len = 0;
-        for (vq = 0; vq < cpu->sve_max_vq; vq = vq + 4) {
-            len += gdb_get_reg64(buf, env->vfp.pregs[preg].p[vq / 4]);
-        }
-        return len;
-    }
-    case 51:
-    {
-        /*
-         * We report in Vector Granules (VG) which is 64bit in a Z reg
-         * while the ZCR works in Vector Quads (VQ) which is 128bit chunks.
-         */
-        int vq = sve_vqm1_for_el(env, arm_current_el(env)) + 1;
-        return gdb_get_reg64(buf, vq * 2);
-    }
-    default:
-        /* gdbstub asked for something out our range */
-        qemu_log_mask(LOG_UNIMP, "%s: out of range register %d", __func__, reg);
-        break;
-    }
-
-    return 0;
-}
-
-int aarch64_gdb_set_sve_reg(CPUState *cs, uint8_t *buf, int reg)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    /* The first 32 registers are the zregs */
-    switch (reg) {
-    /* The first 32 registers are the zregs */
-    case 0 ... 31:
-    {
-        int vq, len = 0;
-        uint64_t *p = (uint64_t *) buf;
-        for (vq = 0; vq < cpu->sve_max_vq; vq++) {
-            env->vfp.zregs[reg].d[vq * 2 + 1] = *p++;
-            env->vfp.zregs[reg].d[vq * 2] = *p++;
-            len += 16;
-        }
-        return len;
-    }
-    case 32:
-        vfp_set_fpsr(env, *(uint32_t *)buf);
-        return 4;
-    case 33:
-        vfp_set_fpcr(env, *(uint32_t *)buf);
-        return 4;
-    case 34 ... 50:
-    {
-        int preg = reg - 34;
-        int vq, len = 0;
-        uint64_t *p = (uint64_t *) buf;
-        for (vq = 0; vq < cpu->sve_max_vq; vq = vq + 4) {
-            env->vfp.pregs[preg].p[vq / 4] = *p++;
-            len += 8;
-        }
-        return len;
-    }
-    case 51:
-        /* cannot set vg via gdbstub */
-        return 0;
-    default:
-        /* gdbstub asked for something out our range */
-        break;
-    }
-
-    return 0;
-}
-
-int aarch64_gdb_get_pauth_reg(CPUState *cs, GByteArray *buf, int reg)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    switch (reg) {
-    case 0: /* pauth_dmask */
-    case 1: /* pauth_cmask */
-    case 2: /* pauth_dmask_high */
-    case 3: /* pauth_cmask_high */
-        /*
-         * Note that older versions of this feature only contained
-         * pauth_{d,c}mask, for use with Linux user processes, and
-         * thus exclusively in the low half of the address space.
-         *
-         * To support system mode, and to debug kernels, two new regs
-         * were added to cover the high half of the address space.
-         * For the purpose of pauth_ptr_mask, we can use any well-formed
-         * address within the address space half -- here, 0 and -1.
-         */
-        {
-            bool is_data = !(reg & 1);
-            bool is_high = reg & 2;
-            ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
-            ARMVAParameters param;
-
-            param = aa64_va_parameters(env, -is_high, mmu_idx, is_data, false);
-            return gdb_get_reg64(buf, pauth_ptr_mask(param));
-        }
-    default:
-        return 0;
-    }
-}
-
-int aarch64_gdb_set_pauth_reg(CPUState *cs, uint8_t *buf, int reg)
-{
-    /* All pseudo registers are read-only. */
-    return 0;
-}
-
-static void output_vector_union_type(GDBFeatureBuilder *builder, int reg_width,
-                                     const char *name)
-{
-    struct TypeSize {
-        const char *gdb_type;
-        short size;
-        char sz, suffix;
-    };
-
-    static const struct TypeSize vec_lanes[] = {
-        /* quads */
-        { "uint128", 128, 'q', 'u' },
-        { "int128", 128, 'q', 's' },
-        /* 64 bit */
-        { "ieee_double", 64, 'd', 'f' },
-        { "uint64", 64, 'd', 'u' },
-        { "int64", 64, 'd', 's' },
-        /* 32 bit */
-        { "ieee_single", 32, 's', 'f' },
-        { "uint32", 32, 's', 'u' },
-        { "int32", 32, 's', 's' },
-        /* 16 bit */
-        { "ieee_half", 16, 'h', 'f' },
-        { "uint16", 16, 'h', 'u' },
-        { "int16", 16, 'h', 's' },
-        /* bytes */
-        { "uint8", 8, 'b', 'u' },
-        { "int8", 8, 'b', 's' },
-    };
-
-    static const char suf[] = { 'b', 'h', 's', 'd', 'q' };
-    int i, j;
-
-    /* First define types and totals in a whole VL */
-    for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
-        gdb_feature_builder_append_tag(
-            builder, "<vector id=\"%s%c%c\" type=\"%s\" count=\"%d\"/>",
-            name, vec_lanes[i].sz, vec_lanes[i].suffix,
-            vec_lanes[i].gdb_type, reg_width / vec_lanes[i].size);
-    }
-
-    /*
-     * Now define a union for each size group containing unsigned and
-     * signed and potentially float versions of each size from 128 to
-     * 8 bits.
-     */
-    for (i = 0; i < ARRAY_SIZE(suf); i++) {
-        int bits = 8 << i;
-
-        gdb_feature_builder_append_tag(builder, "<union id=\"%sn%c\">",
-                                       name, suf[i]);
-        for (j = 0; j < ARRAY_SIZE(vec_lanes); j++) {
-            if (vec_lanes[j].size == bits) {
-                gdb_feature_builder_append_tag(
-                    builder, "<field name=\"%c\" type=\"%s%c%c\"/>",
-                    vec_lanes[j].suffix, name,
-                    vec_lanes[j].sz, vec_lanes[j].suffix);
-            }
-        }
-        gdb_feature_builder_append_tag(builder, "</union>");
-    }
-
-    /* And now the final union of unions */
-    gdb_feature_builder_append_tag(builder, "<union id=\"%s\">", name);
-    for (i = ARRAY_SIZE(suf) - 1; i >= 0; i--) {
-        gdb_feature_builder_append_tag(builder,
-                                       "<field name=\"%c\" type=\"%sn%c\"/>",
-                                       suf[i], name, suf[i]);
-    }
-    gdb_feature_builder_append_tag(builder, "</union>");
-}
-
-GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs, int base_reg)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    int reg_width = cpu->sve_max_vq * 128;
-    int pred_width = cpu->sve_max_vq * 16;
-    GDBFeatureBuilder builder;
-    char *name;
-    int reg = 0;
-    int i;
-
-    gdb_feature_builder_init(&builder, &cpu->dyn_svereg_feature.desc,
-                             "org.gnu.gdb.aarch64.sve", "sve-registers.xml",
-                             base_reg);
-
-    /* Create the vector union type. */
-    output_vector_union_type(&builder, reg_width, "svev");
-
-    /* Create the predicate vector type. */
-    gdb_feature_builder_append_tag(
-        &builder, "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
-        pred_width / 8);
-
-    /* Define the vector registers. */
-    for (i = 0; i < 32; i++) {
-        name = g_strdup_printf("z%d", i);
-        gdb_feature_builder_append_reg(&builder, name, reg_width, reg++,
-                                       "svev", NULL);
-    }
-
-    /* fpscr & status registers */
-    gdb_feature_builder_append_reg(&builder, "fpsr", 32, reg++,
-                                   "int", "float");
-    gdb_feature_builder_append_reg(&builder, "fpcr", 32, reg++,
-                                   "int", "float");
-
-    /* Define the predicate registers. */
-    for (i = 0; i < 16; i++) {
-        name = g_strdup_printf("p%d", i);
-        gdb_feature_builder_append_reg(&builder, name, pred_width, reg++,
-                                       "svep", NULL);
-    }
-    gdb_feature_builder_append_reg(&builder, "ffr", pred_width, reg++,
-                                   "svep", "vector");
-
-    /* Define the vector length pseudo-register. */
-    gdb_feature_builder_append_reg(&builder, "vg", 64, reg++, "int", NULL);
-
-    gdb_feature_builder_end(&builder);
-
-    return &cpu->dyn_svereg_feature.desc;
-}
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 2e10464dbb..10b7f8d509 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -13,7 +13,6 @@ arm_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
-  'gdbstub64.c',
 ))
 
 arm_system_ss = ss.source_set()
-- 
2.41.0

