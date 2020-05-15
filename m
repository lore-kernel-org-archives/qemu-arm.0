Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp547321lfb;
        Fri, 15 May 2020 07:21:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDT1qu0XasQKi+j/DX/9mVzDzgfwM0JjjmZFudc7euUR5Imb9c5odtCJdBJ+cGBbKUWp6I
X-Received: by 2002:ae9:e901:: with SMTP id x1mr3444839qkf.131.1589552471547;
        Fri, 15 May 2020 07:21:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589552471; cv=none;
        d=google.com; s=arc-20160816;
        b=aDEnkPH+y8YLp9yeeIbAWucG6+tPjx6XZPcJmI1Vg2B4kcrKGa3VThinbgg0u58Fxn
         M1qlEIxRSRvWqhCnB0y02kwX6TtYQArd2v3zW/281s3LAVyMq7ax0WoXa6Ke6/CYUIE7
         uzYjr7CSJIW5ksAeHGFMXgO60ALUf7kCJGS1UaD0vBFkbCFr5HvAxdIGJbvxtmajedDL
         9sAn6nDkCG47DlAj96mXBZK587Y5+xUIKTMgwo7zO+DbIVFAkvwDmBPZSx4/pV9fg5TH
         OWdPkZtIBFgWbH69SILaFVt8Q3heDFoMqF2N1aFqat8HpKenNvYsplFFCEjx9rhCxCKi
         gnVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=aL6ItULe8uy/C+feP/tdNAy0BWvdReAXzNWosk7d33A=;
        b=ZVxgH479qcmPiJqcs+QTcrOpL7JpWIPcOPFcjXzN8Rvvct/2vzBTEPc4SR38BOyn0f
         YVPiSvAtFmwQ2QNat5iEQFuy0E/TEahxVtKMUfgxvkm7TSz5Bp0LW6u2ALAQ3B0AdyXY
         BxhW0qpWH2N16g7OaMXP5P0II7V0askZFXW7wF03EIBh8OhQf6HU45RBAcH4RVrQ8cDp
         wZZa9DncovhPtTyvQDaj6JhVvqwSN3bmpS1Vt/k4IyDLvGpYkuofwra+JUOlyc5iVd52
         rcfyKSbXKi7uPJ+uB4wc0Wa4lpYyZCIkiMoPxVPe3LVR/OWGV3WLqOeORLj08NFjMJmq
         M8Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q5r2vyxQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d27si1342647qtc.52.2020.05.15.07.21.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 07:21:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q5r2vyxQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZbD4-0000cN-Pt
	for alex.bennee@linaro.org; Fri, 15 May 2020 10:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZbCv-0000bI-8R
 for qemu-arm@nongnu.org; Fri, 15 May 2020 10:21:01 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZbCu-0003rL-9r
 for qemu-arm@nongnu.org; Fri, 15 May 2020 10:21:00 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e16so3755487wra.7
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 07:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aL6ItULe8uy/C+feP/tdNAy0BWvdReAXzNWosk7d33A=;
 b=Q5r2vyxQ8ge0ZWy8b8ROWYPNGUvz43I8u4UtyA3idBuQSmcBo7aJzCOAeA+wdVetX9
 TLeWNrrV4KlYoGRIWVRjfazsiIpX04rwypQ25nmgm8vroyHjfWA7psJado6Wf4EW3h9v
 YmsBaKuenMcxCbvisglyUP0yJRs9540EzEKav0ftnw2xdHBIH2n/T/cMB/Gfrt07Mp9p
 lSUXSEBf3jkkrgPA17Zf+iSdYIVBG6u861tkpaqlkx1D9PsCUDjTf9RTmrjZL+WrWH3m
 ju6LY3Amf5g5Cgabhk2eyMXWgEQSdcntgiPH8r1gnWDXAzEN629stmhe4zaxrGi7H6ay
 xpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aL6ItULe8uy/C+feP/tdNAy0BWvdReAXzNWosk7d33A=;
 b=hZLCEKqKUgF637n79x+64Y32CG7hQkpI1FBovDYsSGav9miwKv6ZqcCNtxGc/Zm3Ct
 LejiJhlpNk6JHbWLjKTxDLzXLpdb1ZskL4tvx3/ZjVirDKpjBVkSoUbcqAKAPCmDMhNl
 c35LByFGgPZFOGN8hB9LhTs8diR33ffBNJRnJiOWiKGBKngtLOUfxVRRGE/FZuJTsiNF
 q47/5piF8dgpre22X5PLMmnm06dT8dOPVHE/FvwCY0rlXcZmhGfmG+p3UcJGDYGnAuiZ
 NAX97KGOYs4TIne8R7LCVFCTB49gI+jZpwKuymJUO+d0G/yacWpG8Nv2ZoowMoQcBWj7
 n2YQ==
X-Gm-Message-State: AOAM532Ds+CT5GIDpp8zUqELlsrl618iNVQS3OWnPdEZ8pYBuGWWBDWf
 0zd69F2IkeubdvD3aVQ105zck0bgrQXu7g==
X-Received: by 2002:adf:face:: with SMTP id a14mr4444256wrs.397.1589552458682; 
 Fri, 15 May 2020 07:20:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s14sm3738327wmh.18.2020.05.15.07.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 07:20:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/10] target/arm: Convert 2-reg-shift and 1-reg-imm Neon
 insns to decodetree
Date: Fri, 15 May 2020 15:20:46 +0100
Message-Id: <20200515142056.21346-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mKeeMjzjIKqR

This patchset converts the Neon insns in the 2-register-and-shift-amount
and 1-register-and-modified-immediate groups to decodetree.

Patch 1 is a trivial dead-macro-deletion that got missed in
the 3-reg-same conversion.

thanks
-- PMM

Peter Maydell (10):
  target/arm: Remove unused GEN_NEON_INTEGER_OP macro
  target/arm: Convert Neon VSHL and VSLI 2-reg-shift insn to decodetree
  target/arm: Convert Neon VSHR 2-reg-shift insns to decodetree
  target/arm: Convert Neon VSRA, VSRI, VRSHR, VRSRA 2-reg-shift insns to
    decodetree
  target/arm: Convert VQSHLU, VQSHL 2-reg-shift insns to decodetree
  target/arm: Convert Neon narrowing shifts with op==8 to decodetree
  target/arm: Convert Neon narrowing shifts with op==9 to decodetree
  target/arm: Convert Neon VSHLL, VMOVL to decodetree
  target/arm: Convert VCVT fixed-point ops to decodetree
  target/arm: Convert Neon one-register-and-immediate insns to
    decodetree

 target/arm/neon-dp.decode       | 280 ++++++++++++++
 target/arm/translate-neon.inc.c | 662 ++++++++++++++++++++++++++++++++
 target/arm/translate.c          | 511 +-----------------------
 3 files changed, 944 insertions(+), 509 deletions(-)

-- 
2.20.1

