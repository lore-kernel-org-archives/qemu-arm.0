Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2416936lfb;
        Tue, 7 Jun 2022 14:07:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6lafX7qSQchhx8Dtf+J6dFJy2geDKuy/xzEgRv/ppNcm5/WFYOgP6Tt2CH2FI+XpVjn5H
X-Received: by 2002:a0c:fbc4:0:b0:467:d5e3:af2d with SMTP id n4-20020a0cfbc4000000b00467d5e3af2dmr20741774qvp.115.1654636034637;
        Tue, 07 Jun 2022 14:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654636034; cv=none;
        d=google.com; s=arc-20160816;
        b=LUpjD2RdcE0tpuNa34Wnx3Nml/Uz6Hi+6YcT2PfAiThc3SZiQMVWLZ+iX9gtvGyARx
         5CGCPztgLjTCLYhKzMHs13rBUXf1PO6hxuogop8/5HgD5doo3chwBPN+5mhvvaCQ7pDk
         zMP6JIYmag/fPnIFGISoqp2/Pg4bv3u6g9nhkAGZ4OIdTkjnThnn8uzuBBN/LgarNj+j
         7p0cHdCwmH4xCWKcjqV8dOs1//CftKmFLBiv1WmDxLIUF5xngsU9pBx92OCgyOPqKOFb
         oCVEWVG/CxXsGf7tIi1aAhhkH6ryPYmkcOdLSXJ0lYBYy1qF7W9evwu1E3zXkAA6mUYC
         rRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=u3mG8wDmfQDUdFmC25VMT57BuuE4O0ooDRoJ9UT54UY=;
        b=M7VkU9T2YMr3dab6ze7ZmwuQ98EAdyDdQH27kITmcAP6r8DYz+n6bVBbbjWMAL60EL
         VPSRO7PFcHJ6N5b2/ZezqdFqNeSe/uRgNpUovoQ7imE6X8BIhEUktK1V8RGeIZV0Dbkx
         TNcgpvPQ1KHytRmGDSwaDwVwf4CJY2BhiQolslAdWx1JyzrSRVaHzgbX7gNAYFYhl/fw
         W8LzgIAMMUOS4wdtmJrycTxIOuI3ax+a0b+5X4d3gkcTWj3CtNo5R5Ti5UH42Fohl7qP
         n9WERHyV/Ow9dqgMwJ3QSWyqF4ePLyKhy1pwK647glU4cOywJWbH5uGh3j0oHaau8n0K
         fZug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CTYYilsQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3-20020a05622a118300b00304da33ef29si8091568qtk.314.2022.06.07.14.07.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:07:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CTYYilsQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygPy-0004L5-3t
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftU-0008Hd-Jx
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:40 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftN-0007Er-FW
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:40 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 q12-20020a17090a304c00b001e2d4fb0eb4so21871585pjl.4
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u3mG8wDmfQDUdFmC25VMT57BuuE4O0ooDRoJ9UT54UY=;
 b=CTYYilsQNzBZqcdO4ar0ypDz5XZ1HXOYderHcVkiFB0jXBbSWFi4bUoAo7VXRitVVv
 61nFUoZ8nqPyekHUfDHZB/F37jEcQ/zP4GChaB7g9iTZRopCIX9Vnr0NzIYi7D6uk/ct
 K1+DSehphgD8MB5S0GefEEKa80oi9qRPlQpLaj2isJ6j761YqiHZTl9miOAE30yYjzEb
 zVKwJNeVPj0Z0DfVcE19QIJufcnKlOwljCL/45jjjHiAH3ZEZl9/I3QUwpsoCgZfMJgR
 oTnYZ2ievOWB2FNlx6ic0dttj32ApYl41HyK0uedVJnJbBIOEkCMEXhGRXVE0x3vaBx+
 YObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u3mG8wDmfQDUdFmC25VMT57BuuE4O0ooDRoJ9UT54UY=;
 b=DA4KOK0k/J6H/63KYOaRbUXeIu/3ez32b8ar6WmmGW17+LF1v2BWQlFJ3H6eRkCV7c
 ZEw082EBtc+s9S3soCZx6KkjggiDI1PRRMfnhG+Fv9Nv+L1YVN3Dm47CXs23fgxHAhkq
 0b+ROdpzQCQUGJyCWWpEQ/AAXZYUBIow5fCbz/G0dJJcYtFHQbGc82gcAn8dmUh8q5MV
 OjP1oEELNfSLxc0/oBlzg4FTab7c+TzympTBjsP0gv5q+CX5ZTdD1fVZ0XeYTuFNu8IE
 KVk6/57RLD3+RzSJpPsnR2C0zdOF27LdV+2KBfWR7cs0jXKIAH1OTMBsjSyj5oisGED5
 g0mQ==
X-Gm-Message-State: AOAM531HIg0Tt5a5/sko0/PqOVdQYxJZOCNlT4pYL2YeQ3zByAux2OxR
 oLhAtcIu+c8j3fiSTFL1lsbztw==
X-Received: by 2002:a17:90a:ce07:b0:1e3:50eb:64d with SMTP id
 f7-20020a17090ace0700b001e350eb064dmr41160732pju.22.1654634012639; 
 Tue, 07 Jun 2022 13:33:32 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 27/71] target/arm: Add SMIDR_EL1, SMPRI_EL1, SMPRIMAP_EL2
Date: Tue,  7 Jun 2022 13:32:22 -0700
Message-Id: <20220607203306.657998-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rvrCkfA9wddt

Implement the streaming mode identification register, and the
two streaming priority registers.  For QEMU, they are all RES0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 46318515a8..e7e94213b1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6355,6 +6355,18 @@ static CPAccessResult access_tpidr2(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+static CPAccessResult access_esm(CPUARMState *env, const ARMCPRegInfo *ri,
+                                 bool isread)
+{
+    /* TODO: FEAT_FGT for SMPRI_EL1 but not SMPRIMAP_EL2 */
+    if (arm_current_el(env) < 3
+        && arm_feature(env, ARM_FEATURE_EL3)
+        && !FIELD_EX64(env->cp15.cptr_el[3], CPTR_EL3, ESM)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
@@ -6412,6 +6424,27 @@ static const ARMCPRegInfo sme_reginfo[] = {
       .access = PL3_RW, .type = ARM_CP_SME,
       .fieldoffset = offsetof(CPUARMState, vfp.smcr_el[3]),
       .writefn = smcr_write, .raw_writefn = raw_write },
+    { .name = "SMIDR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 0, .crm = 0, .opc2 = 6,
+      .access = PL1_R, .accessfn = access_aa64_tid1,
+      /*
+       * IMPLEMENTOR = 0 (software)
+       * REVISION    = 0 (implementation defined)
+       * SMPS        = 0 (no streaming execution priority in QEMU)
+       * AFFINITY    = 0 (streaming sve mode not shared with other PEs)
+       */
+      .type = ARM_CP_CONST, .resetvalue = 0, },
+    /*
+     * Because SMIDR_EL1.SMPS is 0, SMPRI_EL1 and SMPRIMAP_EL2 are RES 0.
+     */
+    { .name = "SMPRI_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 4,
+      .access = PL1_RW, .accessfn = access_esm,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "SMPRIMAP_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 5,
+      .access = PL2_RW, .accessfn = access_esm,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 #endif /* TARGET_AARCH64 */
 
-- 
2.34.1

