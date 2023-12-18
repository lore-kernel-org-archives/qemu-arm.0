Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp722601eji;
        Mon, 18 Dec 2023 03:34:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdE0bbjMOL8WEs4kp/eO1oPRZjTNhS11RuSzzDupFhUzAuzSZbYxR7SqxRaV5XMbrop9+I
X-Received: by 2002:a0c:be8d:0:b0:67a:b50b:6bf3 with SMTP id n13-20020a0cbe8d000000b0067ab50b6bf3mr18093883qvi.32.1702899247406;
        Mon, 18 Dec 2023 03:34:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702899247; cv=none;
        d=google.com; s=arc-20160816;
        b=ehEXSwLgfXSSGLk5GZmBPZEERU+HOt+rQ/NrQgkt0zF7LSuxP8SSYbXp+A4KUveNYL
         iRVipelh0YWkbMiXkbxIHAexqfVQBeSC8OlmHdx5Kcp5NjSPiwImx44HvxNMzOML+oFC
         gQiQq8Rcyuw6oHi8eVYCZPR9mKYgrXtb7Md4GsZhxRFJI0llQoYdQlXZIcyv+tQepK9j
         gm3+xdyZ0OEponGpcPNOc6QkdZc/k1xAL3y9tiECXhXtf1YcEuwIywIruOmdqJIcn4TV
         IDagPT0jA76lxLQE9wyfGp4pT4MmxOmmVeIXrzNTnG2U2FzR7JggRk/qtYedNiGMAatK
         bFVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=W8Km95/I79yd+g2RdegOUvHS7Z7Mlhpw+dHaXH+5iSw=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=rSZkJ4+JSrm4wl2zi9w52N9kP8cxIfprEz+GoyD6VJBly56lNsFc2MfMKHqNemhejl
         jT7HM4YqY6zcxTRNWhaNjkAarVHjnJGzb7rPzpNmSjmYI6ovvcs7LUpHvIgm4DfVWyVI
         vD09tKr+pCBl2WVzuaP/nEH/ZdTZQfgVEhNk5pDn3cbSMiHgfJ0kptlt4LqRHL6jskSO
         R85h4F22NvBdlG2uflF4dZKJF5E4lyP3vQH/2dOwWLlAXShkr9AKB2zmAxaAPD2jQvzR
         6LWrPhGtCqhd+HnM3+Y5ppDbjboEzPmtPGLtUdL1TosNKYGzqMAR0+cPtHXsn2kmFmJF
         6Isg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hREfcNlF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14-20020a0ce34e000000b0067eec442a00si8003620qvm.515.2023.12.18.03.34.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 03:34:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hREfcNlF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFBsH-00072s-46; Mon, 18 Dec 2023 06:33:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBsF-000706-AL
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:27 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBs7-0003Mc-Kz
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:27 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c31f18274so35456555e9.0
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 03:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702899198; x=1703503998; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=W8Km95/I79yd+g2RdegOUvHS7Z7Mlhpw+dHaXH+5iSw=;
 b=hREfcNlFY7opQZfj6oqpy+Gjmzvs6C0oVa+UcgH72cqxZFWR5yLoXPMK9jHau9y0va
 UCe4xG1xSnU1x1JMfziZFO36PQFhzFStHjYGgIDhmKA0JAaFSSj262mO2a7z/+Gtdc/Q
 uFCsgKRp7D7bW1mXtD89p7pi2IBGx/2s621QHL3xnQPOO5X1fzOQR6D091cDHh+xr3e6
 s2oRtgK3nQ6OQV9HRaVA9cFKNAh8BA+woC3qH3FcxbR/APY/nDJRy2p4Zt1k1SPy6i5a
 MmC6zYgxnBXJjAESYPeL8Hsyd0pnoSFwpm2Z4jKM4gYaqYIABJmXC3gCuCYlYFLpb9dQ
 HuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702899198; x=1703503998;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W8Km95/I79yd+g2RdegOUvHS7Z7Mlhpw+dHaXH+5iSw=;
 b=QzSvxssd+cDuVGzVnJTyMBmJmTdMCyPkUl77yzAFshX+5krSSjDdKz5tYnhgIQ40R5
 9UbUuDq1fPQaL8BlmX3eVSK5Th9qbrUs5vATZc33CPpvy6wEKRfUtBcjdZgWdcRDCVbQ
 VfWlpm6UK0Ryya9Rp9XCduzKm/1yJ8ASzzeojhY9jbHp3nn+l2HPxkAA4d4vU2C/dGfK
 EBMgh9XFVUdOZWdfXmDk7omGWg2d5mbzH4QS1SY4+40V8EjypnkDOh4oB9wu25epPmOm
 1dpAG7SALzQLwn4zidCO5VcMd5hsn4AFqhg3+LBHKYHz5isrGJC4q5JgCwM6k5ytbio6
 BxHA==
X-Gm-Message-State: AOJu0YyPzdSqg7EJm8zdno/xKGQlCOhqD03grJy4/8n4Mm+drwrezwLW
 48F3O+dWizVv3F8IfNytLB0j2P9hTJHaIIVNOqk=
X-Received: by 2002:a05:600c:319b:b0:40c:2fa2:f6e2 with SMTP id
 s27-20020a05600c319b00b0040c2fa2f6e2mr7536963wmp.190.1702899198319; 
 Mon, 18 Dec 2023 03:33:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b003366da509ecsm671193wro.85.2023.12.18.03.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:33:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 24/35] target/arm: Handle FEAT_NV2 changes to when SPSR_EL1.M
 reports EL2
Date: Mon, 18 Dec 2023 11:32:54 +0000
Message-Id: <20231218113305.2511480-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218113305.2511480-1-peter.maydell@linaro.org>
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: DSyZB+vEGvfT

With FEAT_NV2, the condition for when SPSR_EL1.M should report that
an exception was taken from EL2 changes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 45444360f95..38e16c2f8a5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11405,10 +11405,18 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         aarch64_save_sp(env, arm_current_el(env));
         env->elr_el[new_el] = env->pc;
 
-        if (cur_el == 1 && new_el == 1 &&
-            ((arm_hcr_el2_eff(env) & (HCR_NV | HCR_NV1)) == HCR_NV)) {
-            /* I_ZJRNN: report EL2 in the SPSR by setting M[3:2] to 0b10 */
-            old_mode = deposit32(old_mode, 2, 2, 2);
+        if (cur_el == 1 && new_el == 1) {
+            uint64_t hcr = arm_hcr_el2_eff(env);
+            if ((hcr & (HCR_NV | HCR_NV1 | HCR_NV2)) == HCR_NV ||
+                (hcr & (HCR_NV | HCR_NV2)) == (HCR_NV | HCR_NV2)) {
+                /*
+                 * FEAT_NV, FEAT_NV2 may need to report EL2 in the SPSR
+                 * by setting M[3:2] to 0b10.
+                 * If NV2 is disabled, change SPSR when NV,NV1 == 1,0 (I_ZJRNN)
+                 * If NV2 is enabled, change SPSR when NV is 1 (I_DBTLM)
+                 */
+                old_mode = deposit32(old_mode, 2, 2, 2);
+            }
         }
     } else {
         old_mode = cpsr_read_for_spsr_elx(env);
-- 
2.34.1

