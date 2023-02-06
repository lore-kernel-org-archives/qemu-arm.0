Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4641937ejb;
        Mon, 6 Feb 2023 14:35:47 -0800 (PST)
X-Google-Smtp-Source: AK7set+CNa4Mch7UBYZ0IAddGMHixqPbmlxdVSCFeDeHgAG7mjiPFY8GDKhipiacPgRKt+F78ZoR
X-Received: by 2002:ac8:5d8d:0:b0:3a8:20fd:7111 with SMTP id d13-20020ac85d8d000000b003a820fd7111mr1844242qtx.39.1675722946949;
        Mon, 06 Feb 2023 14:35:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675722946; cv=none;
        d=google.com; s=arc-20160816;
        b=jsIVfYkFWt6nq9RBcCetEeXMCcpUYpNraSzvSSl8nd7l5R4kyMryxXMpbQMWcBdFa1
         Zn42TkL9bvbdmFS1RvRfcBwTVEhomrByC1GS5KQqlJuwZoKwW+MFqayg2xVMN5TCgeSB
         NeJUOmjW1ZB6auVDQ2XO9IEJIh8vEU7fQ7lQTfDBSz6JQudWXrbfdSKqlOhmlQhe5KCL
         LqIvLLFJS/wl7jzNduhJTBLzcnpTkIG1c5NrptatJEyOmsMzKE2GjdAnR9nbqDORILcC
         EIox4VawekkIRmLNdw9Arqp5g48psTJJbsuwSYTb3JTJzFtETvVDABuzaAyuozE9WdSN
         Upjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PqS8f1SsLczkqeP2a5G3rABOyp0fVyhf7LwTVRK5JbM=;
        b=y5v089iHq7RP9JrmLaviwpXqBFODBRmyDO2qG5luA9Us0CxOyZMgdSvT1gqLy9PPGd
         L7REBLEDWhwdZDgyFaJPr9hKd+wEl7nowhgs4jUZZKQSX4Sf4pRA7ZuNrZzcjv3PWr3y
         bnagaPt8EI/htMv5sRe3m5kHvOCNDC0Y1J0HhZ9KMzcZ7/lACBi8DL7qDIQeeDfyW0Le
         PDXuCRDhqWrSuforLA6ivupj21pNG5OBVXDh0jeSOMBWeNJbYnwSXK9VRHlg4I3o3nU6
         f8DJ/16QLlB6R+NcJWD+cxSZodO0BIdlZWnb1cL3fLYOsfYD6FlS3njNYzRf+9yTiFzp
         8Uhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VcQPq29o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v21-20020a05622a131500b003b9ba906cb4si9302734qtk.538.2023.02.06.14.35.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 14:35:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VcQPq29o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPA5K-0001or-Sy; Mon, 06 Feb 2023 17:35:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA57-0001jd-3t
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 17:35:28 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA4z-0004R1-8q
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 17:35:22 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so11920112wmb.2
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 14:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PqS8f1SsLczkqeP2a5G3rABOyp0fVyhf7LwTVRK5JbM=;
 b=VcQPq29oDvlBhGLhvTpTQy6lsGEwc5fzIWcgFrIwcL7y40SCRV3nzJgeKMA9/eQBWJ
 2DpTKvrqN6NPihFphi6F7VXDSBrKr9FEAwURq8EOD2m/bP0suDzfdwj8SyDQvnvckRfx
 a17SdDEX1QJhQ1tUWB8B+CeO2kA7nDeP5d/1+hV3XBaaBlCBTjDIAPMBWwl/nrKb8dRo
 4M01yK3ZvgZO6H+dJwk9YMUcbDI3nUDHxPqwSkIQTWvZ+YRf98WtgglsFZfPCAvIiGZM
 RHZENNbKa13TCEvS9rEIQLHVl8eq4vkW0h4/0leM8wzU80CyYFD/N2QhX7qhO0GuPsdj
 0SVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PqS8f1SsLczkqeP2a5G3rABOyp0fVyhf7LwTVRK5JbM=;
 b=qozcY8OS76E7u4bCyh5go97RXNhrD73OHYJW23Z/BVaFpAhHBND8rWDzqLxWVXL+xj
 ayZhuaAd7tIpoS1uSs5VwgInsC4WGNKeeN4n0fjIHq75OjJIbZGudkICznJi73O8Nrmx
 pgb0BeR17yJM8q5IphrkXkurMOFnIzbNV/JOZ+zhzxMTkM++zoG112CYY3LJb/fTNnED
 nDQN/6RagYIj/HU1Tblx9IwAh+lGPLpsUgCSkMzUbh857xXJdKTJX2rGjXA8vcTvuQaz
 4BTdY6/Enq8a+tVeDhALUZQTeM/fAlqVge/j8FgDMqjQwdt1BVkdsurCsipTgFgoROPs
 AWGA==
X-Gm-Message-State: AO0yUKWjvwdPj8EBs9zHjBw5/c8o0ITaOUalGvPVVWe1ALQ0tBpQz4Ck
 Tf6lKkANgpumP+e+P/3nqrlM8g==
X-Received: by 2002:a05:600c:4d21:b0:3dc:3398:cf87 with SMTP id
 u33-20020a05600c4d2100b003dc3398cf87mr1149674wmp.11.1675722915674; 
 Mon, 06 Feb 2023 14:35:15 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c4fce00b003dc1a525f22sm12732030wmq.25.2023.02.06.14.35.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 14:35:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 02/11] target/arm: Simplify arm_v7m_mmu_idx_for_secstate()
 for user emulation
Date: Mon,  6 Feb 2023 23:34:53 +0100
Message-Id: <20230206223502.25122-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206223502.25122-1-philmd@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: vjD6OL1vLBcs

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/m_helper.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index e7e746ea18..76239c9abe 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -150,7 +150,12 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
     return 0;
 }
 
-#else
+ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
+{
+    return ARMMMUIdx_MUser;
+}
+
+#else /* !CONFIG_USER_ONLY */
 
 /*
  * What kind of stack write are we doing? This affects how exceptions
@@ -2854,8 +2859,6 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
     return tt_resp;
 }
 
-#endif /* !CONFIG_USER_ONLY */
-
 ARMMMUIdx arm_v7m_mmu_idx_all(CPUARMState *env,
                               bool secstate, bool priv, bool negpri)
 {
@@ -2892,3 +2895,5 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 
     return arm_v7m_mmu_idx_for_secstate_and_priv(env, secstate, priv);
 }
+
+#endif /* !CONFIG_USER_ONLY */
-- 
2.38.1

