Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp4133980eje;
        Fri, 14 Jul 2023 08:49:46 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHmL8Is4p5mv3g6e1+XCE8GAY6IOmhIpTUWDYA6jKnol5ZEQNqxhEff8Ljmza+fDqIZDyfd
X-Received: by 2002:a05:620a:240a:b0:767:e57e:fdc9 with SMTP id d10-20020a05620a240a00b00767e57efdc9mr5643311qkn.37.1689349786776;
        Fri, 14 Jul 2023 08:49:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689349786; cv=none;
        d=google.com; s=arc-20160816;
        b=Ved1akfSTC0x0amBlx1UWj9pUz7SxGGVmSUBYOl9YjzlNcYhobnWzZ0qK+CzzVDu0W
         P0yO5OMUob/sCBcHiK0IThUNN1h7OT6PKGI0cm5ov+DKbW6H6QplTYwmvCHGYTFU1aAK
         Xbgor5ccDQ1twnJR8Y/3JqOQWuFjDThR3P2TgTqxOokOTCpzYZVqU4rV5PJIhPAh0u+n
         h+dSdmtR9kYxlarJC4p37/YTM+h6f9rOuRwBdCSpxZhkP55K7MTTwfhv/+JeoYRgfjLw
         B0PK2IPwmUzLP54mdLZaS9vtygZhuwjj3SXu4cwz9j92HdomacY0x0ElNbTQPDrbZ31c
         Zozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eumrElobNKY7spGfBeTnnGIQlpKlfLkNgQIpTApqm4A=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=Bi8CHycxGFx5jWKvwCtiASQlycdB/H7MLIXBpHcWx1LYxZELMTyQRWjzS5qc6i1WeZ
         dV58Q+AjaGLmb6mZyNI0xdx9OlL2qiE5Qfb3aXGNUN1cKGwKoRjU7yaS1EXN6pCPR/pS
         a2X7gcVbSzTdJkqZ3FVQ/6642W04ZUZp/SgMyW7U6y8Aflkpkbi9Ecit6uiP9YMP+eRL
         qgYCAcN4TZCfzetHJ/AMZnNWmKt7j1cjHy3xgRXbCKfYOJCDhoPhU/5R2SlAtdBTUZEI
         8/Kzd3N+Mr39R6L6BX84VRE+tBIVvdJI/390xIpKUZQomT7I6Dw+oVqsrqcUJNstF1PN
         R+Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cOMxZxTZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8-20020a05620a25c800b00765ad978f97si4660991qko.517.2023.07.14.08.49.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 08:49:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cOMxZxTZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qKL0U-0007DM-Et; Fri, 14 Jul 2023 11:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKL0S-0007Af-FE
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 11:46:56 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKL0P-00074z-Ik
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 11:46:56 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31427ddd3fbso2180215f8f.0
 for <qemu-arm@nongnu.org>; Fri, 14 Jul 2023 08:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689349612; x=1691941612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eumrElobNKY7spGfBeTnnGIQlpKlfLkNgQIpTApqm4A=;
 b=cOMxZxTZSusyAN7gU2a2FwtyDh6UbYDuXmLaARWxcgFkn6B9v6aDW5s0o5CXNlOzzb
 XyiUh6M7HwiUkVwGEawzRPjpEfsJHKivHo6hYemogucxjX5l0UtkN/ViMCkbFoIMQpIQ
 NSqFxTENp3cg9IQNo+BDhjW1Qb1lezkmSDUNNbv1f+gxCeIsnkIOewXz+Fqf7HdM8y5g
 BmtEFyeMaZPP9xAGvcOeDyDeURLMvoW5pg2drDZzxn/dc0sI8A9vUqj5O2VYGI3ArN7F
 e7xd8/xBJpLOWzQ0KcB5ebnLn7Ersu6dMJWVVa7ZWdWdg4T8qV12yn6ILHTMngrS/OEb
 ZJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689349612; x=1691941612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eumrElobNKY7spGfBeTnnGIQlpKlfLkNgQIpTApqm4A=;
 b=D0o2JMmMIddxD0/nXy9igidIh+yQxY0l/rZNMZ4ZS7N8Ve4WxGaJcHX2VrZQrvfevy
 FCmFr3dLUK0WO3/6lVRq9ujAW3dD1X6PwdSs4WrMJHOBBXckXk9Gp5AJrr9nUwP6rooZ
 OUSuEl1UOpBVqqGgisDc8RKChG0DwDvfa3LRJr4EIM+Le/H7zfhz5Bd+fwb/et6PK+S0
 MdJMm36vNFTOIUG2431zxKg14JFal2uKPM+ab3vwro8oPkC6n0yxbHGwveqy8IjiPj5g
 Gv5oQ01tDWr01x6yaCkroeM5diDlX1b5b+3bvVFi3mBui1Ah1bn6L+YYJ2bDBd/+WeEI
 ICrw==
X-Gm-Message-State: ABy/qLaPGN8tCRyOUZfswV6qprLAHQk8afLfY/ZVTwrjSGxp9LMu45/a
 3AG7V7R/OFV4PG+9CKZCUyOCUwTolHc7/IqnV24=
X-Received: by 2002:adf:e8cb:0:b0:313:e146:1816 with SMTP id
 k11-20020adfe8cb000000b00313e1461816mr4235335wrn.24.1689349611852; 
 Fri, 14 Jul 2023 08:46:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d49d0000000b003143bb5ecd5sm11214025wrs.69.2023.07.14.08.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 08:46:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/14] target/arm/ptw: Don't report GPC faults on stage 1 ptw
 as stage2 faults
Date: Fri, 14 Jul 2023 16:46:36 +0100
Message-Id: <20230714154648.327466-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714154648.327466-1-peter.maydell@linaro.org>
References: <20230714154648.327466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: /yoxM4ULvW2K

In S1_ptw_translate() we set up the ARMMMUFaultInfo if the attempt to
translate the page descriptor address into a physical address fails.
This used to only be possible if we are doing a stage 2 ptw for that
descriptor address, and so the code always sets fi->stage2 and
fi->s1ptw to true.  However, with FEAT_RME it is also possible for
the lookup of the page descriptor address to fail because of a
Granule Protection Check fault.  These should not be reported as
stage 2, otherwise arm_deliver_fault() will incorrectly set
HPFAR_EL2.  Similarly the s1ptw bit should only be set for stage 2
faults on stage 1 translation table walks, i.e.  not for GPC faults.

Add a comment to the the other place where we might detect a
stage2-fault-on-stage-1-ptw, in arm_casq_ptw(), noting why we know in
that case that it must really be a stage 2 fault and not a GPC fault.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index bafeb876ad7..eb57ebd897b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -600,8 +600,8 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         fi->type = ARMFault_GPCFOnWalk;
     }
     fi->s2addr = addr;
-    fi->stage2 = true;
-    fi->s1ptw = true;
+    fi->stage2 = regime_is_stage2(s2_mmu_idx);
+    fi->s1ptw = fi->stage2;
     fi->s1ns = !is_secure;
     return false;
 }
@@ -719,6 +719,12 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
         env->tlb_fi = NULL;
 
         if (unlikely(flags & TLB_INVALID_MASK)) {
+            /*
+             * We know this must be a stage 2 fault because the granule
+             * protection table does not separately track read and write
+             * permission, so all GPC faults are caught in S1_ptw_translate():
+             * we only get here for "readable but not writeable".
+             */
             assert(fi->type != ARMFault_None);
             fi->s2addr = ptw->out_virt;
             fi->stage2 = true;
-- 
2.34.1

