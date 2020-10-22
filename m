Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp6725307lfa;
        Thu, 22 Oct 2020 09:44:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycoQWRHO8PdrxKgtD5/aFARyi92jgn3Hshd8n6EVs4n2WeVhqjPlhLf5wHfx2a7NGJjpz+
X-Received: by 2002:a25:b316:: with SMTP id l22mr4481586ybj.395.1603385092628;
        Thu, 22 Oct 2020 09:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603385092; cv=none;
        d=google.com; s=arc-20160816;
        b=voy/wkp/40J0EKeRsSldMnTQ5spMvSqHNOo9LhfDBn/y8a4IXBxS0Sb0bVX/6v5zPB
         b36e++DCDbRziHBA4NISQcHFHvFPystZcHTdOv4gydI9TrgXbPsg6x8nQ7ggUT9kTF5H
         auK9bBcSsj3JYAi6lmmc3uzznah0H7fw/wbWVBYy9IxaEEvxIjT2MhdDCYjjK3Um46Zt
         8knVPEOnFAzMKf3GoivHXAwohWsO3bFJVbFe6hBtIJFR9hnrP663x6ecokue9ChoeYov
         YIveyLf0MXprRVzBvqQACBaWJWQXdF4a/yicHMPOb5dOqGJWohHOoTfz677pW4cBaGjo
         p9og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=MbIpHBCwt6E/zRDH/KaZ6m6xgeXJwLyukVW4piGrJ7M=;
        b=bbFyLjmdmMWympmaS19AGtWxfbLdeMDHw3KoyzDY/P3SSg+QtiA5YtwfYPU1waQSiD
         2C4Rp4dPlrGzEIAsL7ZZxn3TYde/TUKGi/oCCFiMyFmFUcRXlMv/ySPdnjDroy5Se4Dw
         Bcy6TBR6qDHm1eBA7UoRjzKJWrHjSvnv7PGSnSnI9LW+W7TBt4mD5BPkZz02VdtuaPVG
         86C8cqhjThIowMAegaQJ15XV0k4HxoHACDrKZfT824vT87C5WauGg5+r6TqWvP8TSYSJ
         5Ut9PNC2fkIvoGAS5ABE0mTB3owsThL1Uo6BAMBBdRjn8n2b4cORmvAaYLWNNG4KA4dD
         sx6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=phtNzjuV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16si1718108ybg.22.2020.10.22.09.44.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 09:44:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=phtNzjuV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kVdhs-0006sP-19
	for alex.bennee@linaro.org; Thu, 22 Oct 2020 12:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kVdhG-0006NR-CA
 for qemu-arm@nongnu.org; Thu, 22 Oct 2020 12:44:14 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kVdhE-0007DT-Ma
 for qemu-arm@nongnu.org; Thu, 22 Oct 2020 12:44:14 -0400
Received: by mail-wm1-x344.google.com with SMTP id k18so3007877wmj.5
 for <qemu-arm@nongnu.org>; Thu, 22 Oct 2020 09:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MbIpHBCwt6E/zRDH/KaZ6m6xgeXJwLyukVW4piGrJ7M=;
 b=phtNzjuVaKqNQssqH6b4BhIVOE4kegLK8X3vrneF67Dmp8Nq76pJ9vVPpmuO08nJph
 IvXOKOztjBkmjSmR5I6uN65btWX4Bt2e1dZChzrLd9vKffhwQU7OHJCwaUwednJWZZ3X
 u3YKoDJ0ds11yYv2neGrHE7vyAXXrwnWNEIZpOa3G6XmL+v6STMRcvUqDdBD7fTqWQEi
 zSxZlgH2oUXC9Ee2sxxaoSEQjxZ4LGSS5PNbSp8Y04iP1g0WyhEFz2HFp+QJk4un7Y4q
 CR/Lv2nHaaL+1+4y2MYlYbL1ElKh7DVy1uv1adagJgZTqWpyg8oY9kUs7UniB7r+Xvu0
 GXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MbIpHBCwt6E/zRDH/KaZ6m6xgeXJwLyukVW4piGrJ7M=;
 b=Ao3TmKcU+usfvTulLGw/9WB6m85heqshA1ux8EizK3C9gneokiLxgsH+XHwsM1atIi
 DwRBS4+SY6ZewevNtrHR3wbACOKK8kQiKmwJVku0sAiS1hjRe9/Qjk57v6I6WjXA97nf
 15o6ZdrbsnbvbUyXubpNNVmEzDUjgL3+NRfwhrSoRhTd/YAFtKRnFt5FwIeuHqSo5j41
 W++2js0oCfj/af9BLU3j0Lrxk2EisiCDOyBNdOoiOmryv7Kj05ZBHOsfBqwrfDV79wY+
 yQZgEgcI9TJbHAD+bpMNp76oD8KH9b0ydMzAxugR9O7Br5zGkTVyzzwwFifgoOouWABz
 EZZg==
X-Gm-Message-State: AOAM533+h6sxdQNEgUp/jWBO92YXVolIbfkKGy1CVOMauvWErvxOnZyN
 Slfy0eEg7/7u7XiI89TMtOLLBL754qQ1wQ==
X-Received: by 2002:a1c:8056:: with SMTP id b83mr3358841wmd.124.1603385050571; 
 Thu, 22 Oct 2020 09:44:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e20sm4480294wme.35.2020.10.22.09.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 09:44:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Get correct MMU index for other-security-state
Date: Thu, 22 Oct 2020 17:44:08 +0100
Message-Id: <20201022164408.13214-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: KPtsK8ZcEYl/

In arm_v7m_mmu_idx_for_secstate() we get the 'priv' level to pass to
armv7m_mmu_idx_for_secstate_and_priv() by calling arm_current_el().
This is incorrect when the security state being queried is not the
current one, because arm_current_el() uses the current security state
to determine which of the banked CONTROL.nPRIV bits to look at.
The effect was that if (for instance) Secure state was in privileged
mode but Non-Secure was not then we would return the wrong MMU index.

The only places where we are using this function in a way that could
trigger this bug are for the stack loads during a v8M function-return
and for the instruction fetch of a v8M SG insn.

Fix the bug by expanding out the M-profile version of the
arm_current_el() logic inline so it can use the passed in secstate
rather than env->v7m.secure.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/m_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 036454234c7..aad01ea0127 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2719,7 +2719,8 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate_and_priv(CPUARMState *env,
 /* Return the MMU index for a v7M CPU in the specified security state */
 ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 {
-    bool priv = arm_current_el(env) != 0;
+    bool priv = arm_v7m_is_handler_mode(env) ||
+        !(env->v7m.control[secstate] & 1);
 
     return arm_v7m_mmu_idx_for_secstate_and_priv(env, secstate, priv);
 }
-- 
2.20.1

