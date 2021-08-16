Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1588245lfg;
        Mon, 16 Aug 2021 11:03:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwECB9N2vSU1lfPJNAmCfwH7XI9oUSz7Nz8xOX8wt9ZqE+AlSDdwkWAx7xbQ7z3f55cFf+r
X-Received: by 2002:a7b:cb44:: with SMTP id v4mr301506wmj.169.1629137006608;
        Mon, 16 Aug 2021 11:03:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629137006; cv=none;
        d=google.com; s=arc-20160816;
        b=lm9RcghOB7bUNiGlppSbUe40KjN0FxYORY6lu71eAjZzh0mgg+3Tky2D6U2X0xBEVz
         ksHBExtVK8PRdlOwzrEV/M3W1EHnKIWYl/V9G5WD4QeGlOjmHAJ1723HPjmVwDAiMd3O
         FRelh6brO9+byPJR0e6lT7tEK9iIIvtUmRQoqAAWOlFeaMrPcgyxEwj8TBruspqu30vb
         NbwnIHDZGau0uE+GaxZSI0iN31BeoCwtwPUZNvqc86tDnu6oshqnJ6FKJyvHYz9JwoLX
         0cNWXbu94dqCut7bynb08qZ40D5ipcCBId9E8zmuwg2YKKo342QY5Shrly6HCbes6RuL
         v56A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8Cu4H8n9Z1bc76Lx0NocvUz9gleAslEdWynQ2KHVsWo=;
        b=Soc99wJE/6fC2SZsN1Vptuy4hZAt9RPjB8WwruxZNq2/idPbJ9oQlZE0MYLTvQHgOi
         7iEYv+AsVtPDlCCoethDc2JL5WXeJ6bxMPRHRspNgTNxakl0d9M5nUR349b4cKrNqhLm
         7Reb+SxUMoq9YvcXoHSLSR+zUv/FCMaTPPAV0TowIasYLQ8vG4i9gsgIuo3llRUUyKfM
         BBbHbry24oAPtoXUTwpVc1rO1MMLIrhxs0/RchFMlHL4ktSvrFV0MzmFpa4LtJ8/6phg
         bjcT2Yn/FPKvo/nTYDIKAgBsKbq0DKBosMnwsNFdpQLy54GNdQaIqOzf5vbT93aqvvnT
         c4+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JuJWEkKa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a19si5669177ejg.718.2021.08.16.11.03.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Aug 2021 11:03:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JuJWEkKa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFgxJ-0002lU-Gr
	for alex.bennee@linaro.org; Mon, 16 Aug 2021 14:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFgx7-0002fr-G9
 for qemu-arm@nongnu.org; Mon, 16 Aug 2021 14:03:13 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFgx3-0004bu-Uz
 for qemu-arm@nongnu.org; Mon, 16 Aug 2021 14:03:13 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q10so24867184wro.2
 for <qemu-arm@nongnu.org>; Mon, 16 Aug 2021 11:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8Cu4H8n9Z1bc76Lx0NocvUz9gleAslEdWynQ2KHVsWo=;
 b=JuJWEkKamTZxqZjmhAUVX2NKvw3HcOB/kG2ZCrkRpzrh959b95acSMH5yx6AXEV1Dx
 d1pRdLNLkRmdatGBD+R6tpHhVsfICQgzELoKKYCqilVHFjV4oDku8QiNZC/sAt9hEq9d
 0arj0tsroNk/xE50+ltZZNMqPRtK61yczefRjHASGdI8n4+escw+dob8LPVF3x+GFv52
 ym/nG+WnpesuH32v4gU9MIPxf+D0uOQLTHDEszGKtnuEu5bxnaqcsSrlMScKpge4cBq8
 nP/jKaQ/yRmOChvYrjItrcZ9BKcDceS1qJeRQ/t5aCwct9CUiGLLWPmimWDxPLIIpbPx
 KMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Cu4H8n9Z1bc76Lx0NocvUz9gleAslEdWynQ2KHVsWo=;
 b=suRUqPcLDhReCHPTzyG8ZwqDQojQUuBGN63DYfjKysClN/vlmNSDFQtVw7LdXR7hYN
 EL2Ft//SL5RAw9kp6w7hYkJfZTnxz35wC0ZfyqbsKOAPwixsWUkDBnXf2uKQeXPa22Qo
 xkHefQx7Uhsj3cEDtmyNSsJ3qhNP87IZyRdTMgDjXvknxZvob9SIDmODiPeS0XuFqRR3
 +clvemJIxmfcwesSot+b0dNL0uvtXhGzvE7WnmQGkH24jXusmo9JSFx/wfG1jyHJjrAt
 DcLGuVej1O/Z87UbRD+VdMaOv0uru1275AmYbIjZOSKy9h5hfsAJsSV0V+yrpMfi0n06
 e4AQ==
X-Gm-Message-State: AOAM531T1XwGk79dDVAUiBzCfmV8OGXUdkfzJXSvv8ri3ou6bvWqbuD9
 zyDpOqvTzQLh+7YZs+vmLkQ0x6OepN8B5A==
X-Received: by 2002:a5d:67c6:: with SMTP id n6mr7646400wrw.150.1629136988403; 
 Mon, 16 Aug 2021 11:03:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id u16sm240053wmc.41.2021.08.16.11.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 11:03:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/arm: Implement HSTR.TTEE
Date: Mon, 16 Aug 2021 19:03:04 +0100
Message-Id: <20210816180305.20137-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210816180305.20137-1-peter.maydell@linaro.org>
References: <20210816180305.20137-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: Pqtxvu7O6yJY

In v7, the HSTR register has a TTEE bit which allows EL0/EL1 accesses
to the Thumb2EE TEECR and TEEHBR registers to be trapped to the
hypervisor. Implement these traps.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    |  2 ++
 target/arm/helper.c | 18 ++++++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9f0a5f84d50..cf3c90f768a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1536,6 +1536,8 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_ENSCXT            (1U << 25)
 #define SCR_ATA               (1U << 26)
 
+#define HSTR_TTEE (1 << 16)
+
 /* Return the current FPSCR value.  */
 uint32_t vfp_get_fpscr(CPUARMState *env);
 void vfp_set_fpscr(CPUARMState *env, uint32_t val);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 155d8bf2399..262e787f690 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2446,20 +2446,34 @@ static void teecr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->teecr = value;
 }
 
+static CPAccessResult teecr_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                   bool isread)
+{
+    /*
+     * HSTR.TTEE only exists in v7A, not v8A, but v8A doesn't have T2EE
+     * at all, so we don't need to check whether we're v8A.
+     */
+    if (arm_current_el(env) < 2 && !arm_is_secure_below_el3(env) &&
+        (env->cp15.hstr_el2 & HSTR_TTEE)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    return CP_ACCESS_OK;
+}
+
 static CPAccessResult teehbr_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                     bool isread)
 {
     if (arm_current_el(env) == 0 && (env->teecr & 1)) {
         return CP_ACCESS_TRAP;
     }
-    return CP_ACCESS_OK;
+    return teecr_access(env, ri, isread);
 }
 
 static const ARMCPRegInfo t2ee_cp_reginfo[] = {
     { .name = "TEECR", .cp = 14, .crn = 0, .crm = 0, .opc1 = 6, .opc2 = 0,
       .access = PL1_RW, .fieldoffset = offsetof(CPUARMState, teecr),
       .resetvalue = 0,
-      .writefn = teecr_write },
+      .writefn = teecr_write, .accessfn = teecr_access },
     { .name = "TEEHBR", .cp = 14, .crn = 1, .crm = 0, .opc1 = 6, .opc2 = 0,
       .access = PL0_RW, .fieldoffset = offsetof(CPUARMState, teehbr),
       .accessfn = teehbr_access, .resetvalue = 0 },
-- 
2.20.1

