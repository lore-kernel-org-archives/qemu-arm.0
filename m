Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4107713njb;
        Wed, 11 Dec 2024 06:45:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU2JzQ3tfYD33Lf7dqkGmlaRb0gKDF7Orus+Cp0ro7UWpWaW3g+hrjsfDFVab0wRXnc10dQFACoD/PchQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEPy8Ce4rd2UFnsDdzwNBIwwkLry8h2B/snoQFKnBtBPF5AB80Rx0h4U5Uts9tG5kcmAAGH
X-Received: by 2002:a05:6102:c13:b0:4b1:3409:944a with SMTP id ada2fe7eead31-4b245d8631emr367432137.2.1733928355479;
        Wed, 11 Dec 2024 06:45:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733928355; cv=none;
        d=google.com; s=arc-20240605;
        b=VfmcE9RBxhdxDmL4zyA7riZ/zHACreBIsH08pc1NW4x5Ux1M/Roub3ek4dOc7FJs3f
         NhrEJlP2HEKDrDMMoq3KUQPNxdZ++AnkHwAXiGRwjkEs9yU9jKFoxvz8Rja9dSSGrQFd
         VvQvXUtSEf0Ecp1qVaewlgsc7noKYJ93vMMUnu6UzGLgkErKEeg7EblN/8RjpY6GTUdT
         ONOKJSp2XfA0VSDn73+r90y8hAzKGvCGBw2UhM5OGc+PEQJr64OKkvKhSz5EKpoKMkzQ
         i/nZRMXJL5WhUymwBaNaZLk7fNSnZn1xHUywWbmNSQYdVccinPZee79sPGLio5jwBAz0
         /z3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=G5JRzKrOBu8p2naVBHN4TEm9PW9soALL8/T3IRSujEg=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=gcqZhA9XntQAZnKw4aF0yNQqIytZXAnfvCjMv2+mOUiFG1a4U5eH4s4RpXTO+e9Kls
         TDeZ9qWMD96qGsbmnQ261TbR/MLGTythU0XRKRRZROMmuk9qEIc8YSc2+ZWWn1FEbq73
         uJce55xZ7e++gudqdQEFv/E4aS2l9sFZruo7e+SrdRIYEMMZL8J+ZzfpB3+J3PKAqHvh
         sNjRewhe0hg/od5ZGCO1e+9Qkqjff0XKGqpAZtQiqAmURFoN+IQWQ2Hbp0eL9zWsy9kQ
         +tQ/Oi+j6sMfhTHx8ct2MNc4C9s+lbTd+0tS1s1LLvxcrvyjQ/r0kXLaX9nUWIFieJ/D
         lL4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=abqFYTQ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afe067fd76si2085187137.79.2024.12.11.06.45.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 06:45:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=abqFYTQ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLNxJ-0006re-Oj; Wed, 11 Dec 2024 09:44:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLNxI-0006r7-1N
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 09:44:48 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLNxG-0003r6-BH
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 09:44:47 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso12297815e9.2
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 06:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733928284; x=1734533084; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=G5JRzKrOBu8p2naVBHN4TEm9PW9soALL8/T3IRSujEg=;
 b=abqFYTQ9YeFcJKDz6JJjlSdTtrvT/s5hgPTLXgf5BgBVGB8zCtA8fGPoE8wuj/9Nte
 mE3EB5xehp+c5dJbfkEMqssxfTID9g6PrInBi8MriAWVK/NLU1D4lNXXA2DNkJBEEm3x
 3fXg0LzQdNSQY6pjr660HPX7d881pyr1XaKLslBOUPvzTEqg5Xpl4zu2e8+GY9gzF9T1
 nsHVo/4r+kvWrhEt+6snQUJ4Ve5uL8KYrCS+SrNhbfSEILVySV+sP/XtmnDjQ1nsq+5g
 kLYGfqKKu12ffMTqL/olmN2kd9fNS1yaxVT8tNxG+eeSsA1f1B5kS+7FUdSQXwW7v9Da
 POJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733928284; x=1734533084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G5JRzKrOBu8p2naVBHN4TEm9PW9soALL8/T3IRSujEg=;
 b=mPvh3KJjCZg1ZIdr7asmkfGQGNG0cbSmfjRdokNs1HmdLWtZwEwE2bUe56ekmz8KNi
 MRW2UkG+Lms79x7I+l3+WaMDeOtCexaIvp+O3J+xQcRZcAJ1sK+QClUGa7e4gAoxpWxn
 TWYGFUaoSfPvfKtsRyoR3t/dfHob10zGgnLieqdvXOCZHO7l9hIn2Hb3i2xc+vlbdT6z
 jMNoOi08M5JffPBpQA7mvtEpRwSlS5bMvQRg3/nFwFXuoooSfbbFetZoo16ZWzRd324K
 Ue8fX3cIZzEvOzRYT0RkTFR3jigmyzIACHMEsn0P67daeV3r8/+GPm6MQupgzror51iN
 WnVQ==
X-Gm-Message-State: AOJu0Yz8hvmZKMAzDnzuy5Ir3Hd+36d8/rwWpirm6By+FOxRRUldydw/
 OgA388B1I5fIOC3r97pFAy3SNzoztq9BhlULOky7EuudnUzRwO8GATknwGT+6GAjONItJzQaq3Q
 i
X-Gm-Gg: ASbGncv4rqIVGjHujt6HfvARbd9lHhE77iPYPShaC89rYM1jE9BcefAJ0y0Uzys3X5M
 GgWG82LwrAnMVgyZ+PcvtAeIrGRZJSILjifutzZY4XqE7gO8rsA6nu4bgUAVRAIiNZdyR1z1MJW
 c7DWbrFYVVek12XjDQ0QtLb9HSXDj+VntgIlWLConQe6XwQn75lPprDn1zOFNveSObjPHtlFNTH
 SyD8/7sQ8jTaFqA8Drw5c1NWWpAwPn9ikOQjEOqrqRpWTpQRWl1mNTjhlW/
X-Received: by 2002:a05:600c:3109:b0:431:5044:e388 with SMTP id
 5b1f17b1804b1-4361c3f4ff1mr20807295e9.22.1733928284563; 
 Wed, 11 Dec 2024 06:44:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4361e54ef20sm19477685e9.5.2024.12.11.06.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 06:44:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] target/arm: Add ARM_CP_ADD_TLBI_NXS type flag for NXS
 insns
Date: Wed, 11 Dec 2024 14:44:36 +0000
Message-Id: <20241211144440.2700268-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241211144440.2700268-1-peter.maydell@linaro.org>
References: <20241211144440.2700268-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: MA9NocLYftV4

All of the TLBI insns with an NXS variant put that variant at the
same encoding but with a CRn field that is one greater than for the
original TLBI insn.  To avoid having to define every TLBI insn
effectively twice, once in the normal way and once in a set of cpreg
arrays that are only registered when FEAT_XS is present, we define a
new ARM_CP_ADD_TLB_NXS type flag for cpregs.  When this flag is set
in a cpreg struct and FEAT_XS is present,
define_one_arm_cp_reg_with_opaque() will automatically add a second
cpreg to the hash table for the TLBI NXS insn with:
 * the crn+1 encoding
 * an FGT field that indicates that it should honour HCR_EL2.FGTnXS
 * a name with the "NXS" suffix

(If there are future TLBI NXS insns that don't use this same
encoding convention, it is also possible to define them manually.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h |  8 ++++++++
 target/arm/helper.c | 25 +++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 87704762ef9..1759d9defbe 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -126,6 +126,14 @@ enum {
      * equivalent EL1 register when FEAT_NV2 is enabled.
      */
     ARM_CP_NV2_REDIRECT          = 1 << 20,
+    /*
+     * Flag: this is a TLBI insn which (when FEAT_XS is present) also has
+     * an NXS variant at the same encoding except that crn is 1 greater,
+     * so when registering this cpreg automatically also register one
+     * for the TLBI NXS variant. (For QEMU the NXS variant behaves
+     * identically to the normal one, other than FGT trapping handling.)
+     */
+    ARM_CP_ADD_TLBI_NXS          = 1 << 21,
 };
 
 /*
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8e62769ec0d..c2a70f8c053 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9146,6 +9146,31 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
                     if (r->state != state && r->state != ARM_CP_STATE_BOTH) {
                         continue;
                     }
+                    if ((r->type & ARM_CP_ADD_TLBI_NXS) &&
+                        cpu_isar_feature(aa64_xs, cpu)) {
+                        /*
+                         * This is a TLBI insn which has an NXS variant. The
+                         * NXS variant is at the same encoding except that
+                         * crn is +1, and has the same behaviour except for
+                         * fine-grained trapping. Add the NXS insn here and
+                         * then fall through to add the normal register.
+                         * add_cpreg_to_hashtable() copies the cpreg struct
+                         * and name that it is passed, so it's OK to use
+                         * a local struct here.
+                         */
+                        ARMCPRegInfo nxs_ri = *r;
+                        g_autofree char *name = g_strdup_printf("%sNXS", r->name);
+
+                        assert(state == ARM_CP_STATE_AA64);
+                        assert(nxs_ri.crn < 0xf);
+                        nxs_ri.crn++;
+                        if (nxs_ri.fgt) {
+                            nxs_ri.fgt |= R_FGT_NXS_MASK;
+                        }
+                        add_cpreg_to_hashtable(cpu, &nxs_ri, opaque, state,
+                                               ARM_CP_SECSTATE_NS,
+                                               crm, opc1, opc2, name);
+                    }
                     if (state == ARM_CP_STATE_AA32) {
                         /*
                          * Under AArch32 CP registers can be common
-- 
2.34.1

