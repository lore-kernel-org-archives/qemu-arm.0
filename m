Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5213738lfh;
        Thu, 2 Jun 2022 15:26:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjZuBHNZrdG0WkG3OoaXmew35oy4ZtzkIk5ZWrRqn2nPDxqw5I+XlLO4BUl4Nu95HkrLhW
X-Received: by 2002:a05:622a:1cc:b0:2f3:e619:8088 with SMTP id t12-20020a05622a01cc00b002f3e6198088mr5312281qtw.261.1654208759880;
        Thu, 02 Jun 2022 15:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654208759; cv=none;
        d=google.com; s=arc-20160816;
        b=ABvKLeeweHpNtj9VDNBgQh3dGTBd4Due0SAxnlinXZsuliFPv2Wq3TmBIQY7V8uV8D
         Lf7kODvEPq99KmEArhXAggsr37W5aVfxdRAWQEJD7/ZUGB91JvCEZT5squbms3g+1Rwj
         uxDHlv/dr5LjVl/XEHl2OHJGHqVdcHeXdl1Ji0rz7wHDNvqL/kNX32EveQxP9QS68gNW
         2MoqBg9Klzolaen1KJB3tLrooLGsv3e7ytexVViVMKNLENHxU+r0/rRddM8x+yYK/w8/
         eACIKNjwrQNj21sgFgeGCPvtH8g8qs4v5PVtLruAmXf+3TscblzSsnTqak29uq3O7w6K
         BnEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uyp8xWq7ZkrFhvOvNlw2bvzAu/rqhqAIEZWhdZkOs7M=;
        b=iyAdkeeHJGT58Yxo0VzxtMhkVy+qoKIHayTVP42fMhkpG3MPVDGcyfBm7I+vl3mbSj
         3KE4LVrg2SvV5qqIF5ltJE0CEGakI2Ps8IoAdLUcGNFH7ZCR+iVzJ7gU+hk4uBFzhZZa
         jN8dVnWpT7PBZCGejkDGrPZVcQ50iDDDFGhOZ9pUYUnlY0ngHwQXFlgnMfqD2l+FT/t9
         0nShiziQ6+PN9FaUTKRp21Gj4wlPu1Gd7f2SZ+/z3DdjOCYpZROgrsO8EWH7PfXPqg5d
         MdwzWAwIH/AOhKclKBsrkAmcDZ43dYgwU2J0+cogyH8AmvuJi9wHDFtkdVCqt2zTjE06
         wE5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BVtm5eeG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17-20020a05622a175100b00304ddef99eesi435267qtk.361.2022.06.02.15.25.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:25:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BVtm5eeG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwtGR-0004Uk-Dz
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh2-0004wq-Nf
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:24 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:50698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgz-0000Cg-4x
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:23 -0400
Received: by mail-pj1-x1035.google.com with SMTP id e24so6052240pjt.0
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uyp8xWq7ZkrFhvOvNlw2bvzAu/rqhqAIEZWhdZkOs7M=;
 b=BVtm5eeGApIAbjg/i8dZ9jQ452nDcr5Z15h3U5/iYtH3VsT7eGJqv4xKaKeAi/KnPD
 vGij/PFScAWjkaVpl6HAEnjmJkvbP2PWPfrTCitHOYgMJ+9QIj7KDuH2ZLeMYoyNZVE/
 wUGM3JBIZrADkcCmJ2exRCPY+QtTYn/BzFM7EC5VVv1PKdxUPtHrOM3YuuxOYydwyX0t
 /4Dda5lZd9LLk/76iI0ypyGq4nQ4B8pGtmny25OyQVuSEdkvtAgNQQcZWqoAP/W8TfjD
 K/YBgo3I0IeuDHO32QUpNCJvKJhkhat3bJwIKWWAemLR0bEJUOCxiar8KiTKCP1g27Vp
 j1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uyp8xWq7ZkrFhvOvNlw2bvzAu/rqhqAIEZWhdZkOs7M=;
 b=SRy9iadmThsAYPXuCoKF9patc81VhFEVaOb2WKkJfIfHk8q3O+e3Y6LnZR3UTHJyjG
 1zrzo4yzaes0dAxDLnbwd2I8xYKCR3hbqeyFFq5XbdWABlgEPek2eI+vvL/EwBbCWAma
 l05QHBMU5Ap7I8Aj2H28CYSLyUgaD7pNRzSBlU70LxctlE4LhVJNfA3y84hQNC+nLSDn
 zr48uhev1zvb6C8icT74/3IdxGF0hv2dVZTT46RnzaTNFKzZ6hWstU/n6BLY8lK517Ot
 rrpDfGMv9rOG+V9eTQCKJ6E7IZQareo6L7x1eBIQNOiV9lbE1lNKIFaiFlieabwp3n7k
 8lWw==
X-Gm-Message-State: AOAM531ySGMiewhGQKmXBsLJa69UpnhV5u0GeF4vPjjuASZYl2w5+QEX
 tVG3jWgVZHTtlug0as7mPZC+0rQVY11dxA==
X-Received: by 2002:a17:902:8602:b0:162:eaf:3630 with SMTP id
 f2-20020a170902860200b001620eaf3630mr7221759plo.118.1654206559784; 
 Thu, 02 Jun 2022 14:49:19 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 29/71] target/arm: Add the SME ZA storage to CPUARMState
Date: Thu,  2 Jun 2022 14:48:11 -0700
Message-Id: <20220602214853.496211-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2OpUtS2ZZ78g

Place this late in the resettable section of the structure,
to keep the most common element offsets from being > 64k.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     |  8 ++++++++
 target/arm/machine.c | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9bd8058afe..1bc7de1da1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -694,6 +694,14 @@ typedef struct CPUArchState {
     } keys;
 
     uint64_t scxtnum_el[4];
+
+    /*
+     * SME ZA storage -- 256 x 256 byte array, with bytes in host word order,
+     * as we do with vfp.zregs[].  Because this is so large, keep this toward
+     * the end of the reset area, to keep the offsets into the rest of the
+     * structure smaller.
+     */
+    ARMVectorReg zarray[ARM_MAX_VQ * 16];
 #endif
 
 #if defined(CONFIG_USER_ONLY)
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 285e387d2c..d9dff6576d 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -167,6 +167,39 @@ static const VMStateDescription vmstate_sve = {
         VMSTATE_END_OF_LIST()
     }
 };
+
+static const VMStateDescription vmstate_za_row = {
+    .name = "cpu/sme/za_row",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64_ARRAY(d, ARMVectorReg, ARM_MAX_VQ * 2),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool za_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    /*
+     * When ZA storage is disabled, its contents are discarded.
+     * It will be zeroed when ZA storage is re-enabled.
+     */
+    return FIELD_EX64(cpu->env.svcr, SVCR, ZA);
+}
+
+static const VMStateDescription vmstate_za = {
+    .name = "cpu/sme",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = za_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT_ARRAY(env.zarray, ARMCPU, ARM_MAX_VQ * 16, 0,
+                             vmstate_za_row, ARMVectorReg),
+        VMSTATE_END_OF_LIST()
+    }
+};
 #endif /* AARCH64 */
 
 static bool serror_needed(void *opaque)
@@ -887,6 +920,9 @@ const VMStateDescription vmstate_arm_cpu = {
 #endif
         &vmstate_serror,
         &vmstate_irq_line_state,
+#ifdef TARGET_AARCH64
+        &vmstate_za,
+#endif
         NULL
     }
 };
-- 
2.34.1

