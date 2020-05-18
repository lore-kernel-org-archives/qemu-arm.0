Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3074558lfb;
        Mon, 18 May 2020 07:13:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze2+Vxl/KRfltoeEpDCILpdZHby9RFHkHbHfViLNNewMWLDOnPRf1FFsItwRFdk2l4RXxK
X-Received: by 2002:a37:640b:: with SMTP id y11mr16437385qkb.266.1589811202459;
        Mon, 18 May 2020 07:13:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589811202; cv=none;
        d=google.com; s=arc-20160816;
        b=S4tOrARoyUb9IxzObYNdUFBd6kvchiMW8rG+t5ZC9yz1ruld0MrZYoRtlWZ4ZSK09S
         uuTY8NJJ+zAE9JTLo+4E4Klog5uVc1wJSimyyAyEbvSCljyWQMsZkE6FFVrzns7LtE8z
         0ooNmkshmyQ3I4SmoDEwxHZhgHwTC+O+atJTPACh0b+juvQNFBsIPODI0JzwYgowIZRC
         H7l/et6a0YEGjxsB9HpGY3uAVlLjXk9n6dYy7kPxZvvDsrN+MQ4qAQICSGTk8SAZJ8Gz
         leXF/2BQQIIDNbiw5eF2d5RxhHyXtTznTWyvw/JC/t4ph/6N+qhqyP02YaUHUt/HNf9K
         nIXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=qO0DEQsgPpTJ3W4/yS4w/C15HNNzg8b4HlcX8EpUruc=;
        b=f4KobKmaNuKDHgA9PMUqID1Ed79JK325l04xXQBVW3mCE+Xj0Z7VZa4VDCa+YFPyTp
         /cssmyzPnDRmgU6ltCtcUpyuP/hefAz3NlANV3J/0AADy3j2l3oUSF94udByIN4RCc2h
         cXPTA0ZJ4wPAitHqOTN/o55tDdr8Y3aFTLUHXVGRZ4qz+zSx6RcSgmLFpYSBtvUFDAD9
         o9YF91iTT/CTuomnE9JHj7AfbNbxM5vTffbPZ1cqd2p3dt9jORNDrivnlcQts4etEyWt
         5iomEyJk5dB5D559uxKgPKgOAf5G8+MMN2LZbfVWn56QncSmpubW+O0CdCnF47WORWtk
         lKpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XmKgEizO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12si5370687qvz.215.2020.05.18.07.13.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 07:13:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XmKgEizO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jagW9-0002cf-Qj
	for alex.bennee@linaro.org; Mon, 18 May 2020 10:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jagW3-0002c9-11
 for qemu-arm@nongnu.org; Mon, 18 May 2020 10:13:15 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jagW1-0004mz-Q7
 for qemu-arm@nongnu.org; Mon, 18 May 2020 10:13:14 -0400
Received: by mail-wm1-x344.google.com with SMTP id u188so10622185wmu.1
 for <qemu-arm@nongnu.org>; Mon, 18 May 2020 07:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qO0DEQsgPpTJ3W4/yS4w/C15HNNzg8b4HlcX8EpUruc=;
 b=XmKgEizOBA1chni4ASZaRYuql3iwXDMa7UlnILXK2ermaciojwvuDedMYpVfDQI+Qq
 cJz9LaZqXPOD2VOO+tNge51ZKsr6MBkBU5DmyMeR5kjsfZtdJi92hxE62LT10hNYjUjS
 rLGJDt7duZlqcDUyILQdAHELxiev9CE7VStJTBz+Iw3UOZm8OcyvWJntl2TIinkdUPLt
 Od+SRWvoEeelSMTMGjp8urvH/SMAx3uIal2BAcR1CZiqpzBBXKGe1TAAueMPi2O4/e+t
 1sC7bPjmdkXJycEdaMvMOITHj7VZBN4NF33VdsmUPfUx9m41lZStxoUONsMz0IzuMuNO
 RelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qO0DEQsgPpTJ3W4/yS4w/C15HNNzg8b4HlcX8EpUruc=;
 b=kZu8WT/sAQmPmK9WKE6pnc0ZLI7dvZoRHHvtqKep4WR+NLxwK8guZd790Sbw31vj9J
 4PNbjvWsTo0wEpFoA53nMR7o5/I/7vE5Ke3dEVEvJK9Wtggrk3g1xhwD0zX0zgX3MkSc
 GbuadeOpJndmyRzQgUVaUYFYFC3bkzqGSe6jbJ0bDXpq+pmC1iE8wG2DJdrxBxyqAk4h
 B+ptekixs5YWY2cUdj+ARzamC78O9hV294a0+CnWjkB4VfO7ex6sV3R2Bw+V9CZfYSEn
 Ns9Rf3x8o7hbx1F68ZC0bCXtlTBzpuUYgjdDVH5oyp4poM64Oa+eJSkux9gg0GXFxTPP
 1E9w==
X-Gm-Message-State: AOAM531TQO3qcfHy8Wzx82vcapTn3ywbozBYvAJdKwbl4k7p8R1p+QTE
 ssrDGnBXSpurGbUMCc2l1/4K5AKJxJZbdw==
X-Received: by 2002:a1c:6344:: with SMTP id x65mr20647401wmb.51.1589811192092; 
 Mon, 18 May 2020 07:13:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l19sm17229075wmj.14.2020.05.18.07.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 07:13:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Allow user-mode code to write CPSR.E via MSR
Date: Mon, 18 May 2020 15:13:09 +0100
Message-Id: <20200518141309.11998-1-peter.maydell@linaro.org>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BofMI5LP2coT

Using the MSR instruction to write to CPSR.E is deprecated, but it is
required to work from any mode including unprivileged code.  We were
incorrectly forbidding usermode code from writing it because
CPSR_USER did not include the CPSR_E bit.

We use CPSR_USER in only three places:
 * as the mask of what to allow userspace MSR to write to CPSR
 * when deciding what bits a linux-user signal-return should be
   able to write from the sigcontext structure
 * in target_user_copy_regs() when we set up the initial
   registers for the linux-user process

In the first two cases not being able to update CPSR.E is a
bug, and in the third case it doesn't matter because CPSR.E
is always 0 there. So we can fix both bugs by adding CPSR_E
to CPSR_EXEC.

(The recommended way to change CPSR.E is to use the 'SETEND'
instruction, which we do correctly allow from usermode code.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Bug reported on IRC. Quick-and-dirty test case at:
 https://people.linaro.org/~peter.maydell/msr-setend.c

 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5d995368d4f..677584e5da0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1230,7 +1230,7 @@ void pmu_init(ARMCPU *cpu);
 #define CACHED_CPSR_BITS (CPSR_T | CPSR_AIF | CPSR_GE | CPSR_IT | CPSR_Q \
     | CPSR_NZCV)
 /* Bits writable in user mode.  */
-#define CPSR_USER (CPSR_NZCV | CPSR_Q | CPSR_GE)
+#define CPSR_USER (CPSR_NZCV | CPSR_Q | CPSR_GE | CPSR_E)
 /* Execution state bits.  MRS read as zero, MSR writes ignored.  */
 #define CPSR_EXEC (CPSR_T | CPSR_IT | CPSR_J | CPSR_IL)
 
-- 
2.20.1

