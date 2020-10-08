Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1491571lfq;
        Thu, 8 Oct 2020 09:25:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfaJnRKQo7espE2jLew9D3yUoaKJTw5lblITvFoyhCx1y2hpFneFCsbM9z9mix4UnMz5pI
X-Received: by 2002:a25:bcd0:: with SMTP id l16mr12633127ybm.129.1602174336880;
        Thu, 08 Oct 2020 09:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602174336; cv=none;
        d=google.com; s=arc-20160816;
        b=kX5cxkjBrj3ufJ52pte71eFBtZjlcFAon5r7T4bRBX3aQohh+5lcGkWw5vxJsCMBTg
         uSbUhXB0cPVV54yp6/INeJNI++GRhrUYvb1bBIbPtqRR8gP/Z7SrFgGtq28lZioOijJ0
         qagrdYWhjvvYe1nqjy8YL9e42wXWxs+KnucndmHCUQujMEcQBSHjac+vhxN7AKEP9gBH
         bVW13mDGsGCFmCUr7UDu6WlF4Bx1rM42FKi7Nj9szdoy3VtgBtFE5DfdmgXhp+7mcm/+
         RiPyB451ON9xVbFDL15Wrz9zRyCDfiPxgvoMU5saox2cCF0pYzqBtjxYQ0tfC8KJFiPy
         gtGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=siDQkbvJh9Bvpko0a5lV9YTIkAumZtHw2Xcw/++VZdY=;
        b=S2vXsza7xEVfADJrIQoiTfIRIlqqOcJt7F1tMspgUyVdkr093hjOepdasW782Nl8dp
         b8RkpopsxihXfqEQ9wM+LwvWdacluS1AP1ThWD/2PreJG0WD1Sqi4s+eSBebZDlw395n
         bgcj/Q3xriqyczJaf+ASMy9P8ZSjEN2TokoXUNIk+ccxBQXhgQvi0yScDDAksQT6XyUP
         8exOAqbW/3JrBGjAr3CWVnq9zFiR/w2T0eG/QNJG6pmnYoZ9s73ir2VC0+HQnCL3lizA
         NflwRtnfKSeYpnxoEK4gdkO1zOakuxOJpt5+FZvi5oLlPXFWA1qQPr9gLsjR5NmHI+zj
         Gd/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wye5DEjH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i136si4119480yba.307.2020.10.08.09.25.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 09:25:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wye5DEjH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQYjY-0005wT-7R
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 12:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kQYgL-0002V2-4E
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 12:22:17 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:45555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kQYgD-0007e0-0n
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 12:22:16 -0400
Received: by mail-ot1-x342.google.com with SMTP id f37so5958676otf.12
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2020 09:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=siDQkbvJh9Bvpko0a5lV9YTIkAumZtHw2Xcw/++VZdY=;
 b=Wye5DEjHWxQHtc/xyy4JqjU0Jj/GF+1CrQloR02V1GTG4c/t8gNQqdXxBJwSVgW3Nq
 9Jubj0jphT3qdYuPh2t0kJA0SeRHDZMHqkxd8Y0PZN33xV+FIdJ8j3kYq0H0+gZEE0TF
 cm2AI5VBuACe1OWLCqBLYu8YR3FKYTEtSIyCDpO45klC+gB9fhM4Sg3gnIlpUmSuBdQx
 AM2LKgjyCuIpCU9ca8vDQvWrZaTehsZOMBvRO5lVuGrIY/B7cx4rtWe1mdPB122a7dGf
 i9lyREBIJfUy4EfTRrC6zggXbW9ybd5UWSBmOGti1/GduE1FQz9Gcdmc8voz1A9ZZ+TO
 0Cpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=siDQkbvJh9Bvpko0a5lV9YTIkAumZtHw2Xcw/++VZdY=;
 b=qXBVfjhQwZbR9JHFxe7vDwu6D76NjaVuqiXicGHfTh+FggfjJgHmLZzgom8lZzxhuU
 9dbT/1UvEDHa8kVPO7pC8Buo7LD7uL7xum/paCkF3n445lZJdcpYZOv8X/saZ8irmLE3
 02kGKr+pJ4f9n+CbxLwVviYJu+u7vusrnxH9rdGxzILBSOBxL1KdrSmxDwq+qJ6qnT3b
 2+YWWAV+YGK/sj6iBVKTd+gtbvSwSk50GAW8POuKotVWJRL1P88Rloqi/70yNjsL0O7r
 bIm8LfGYO5FfzUnJH8zL4itef0boESMIpXNXWjugM3iDQa81XSjxxOb4DplnAeNVF8G5
 NdTw==
X-Gm-Message-State: AOAM532IfZORs/NdE3axnqSGUBLH13+Dl0HmRdz+tvawjasxWjVVIFje
 Ou0UChHxzwqbJLFDF5FxwzOeeb6Hm7y/318g
X-Received: by 2002:a9d:2a83:: with SMTP id e3mr5346596otb.237.1602174119678; 
 Thu, 08 Oct 2020 09:21:59 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id l138sm5076218oih.32.2020.10.08.09.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 09:21:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/arm: Remove redundant mmu_idx lookup
Date: Thu,  8 Oct 2020 11:21:53 -0500
Message-Id: <20201008162155.161886-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201008162155.161886-1-richard.henderson@linaro.org>
References: <20201008162155.161886-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, vincenzo.frascino@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m5nQTchRi8Mc

We already have the full ARMMMUIdx as computed from the
function parameter.

For the purpose of regime_has_2_ranges, we can ignore any
difference between AccType_Normal and AccType_Unpriv, which
would be the only difference between the passed mmu_idx
and arm_mmu_idx_el.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 5615c6706c..734cc5ca67 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -563,8 +563,7 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
 
     case 2:
         /* Tag check fail causes asynchronous flag set.  */
-        mmu_idx = arm_mmu_idx_el(env, el);
-        if (regime_has_2_ranges(mmu_idx)) {
+        if (regime_has_2_ranges(arm_mmu_idx)) {
             select = extract64(dirty_ptr, 55, 1);
         } else {
             select = 0;
-- 
2.25.1

