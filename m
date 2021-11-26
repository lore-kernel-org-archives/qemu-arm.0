Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp915432lfk;
        Fri, 26 Nov 2021 08:39:18 -0800 (PST)
X-Received: by 2002:a05:600c:4e94:: with SMTP id f20mr16143762wmq.77.1637944758769;
        Fri, 26 Nov 2021 08:39:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637944758; cv=none;
        d=google.com; s=arc-20160816;
        b=Hz4Khu76KecqS2ODVY7umKWs5PeOmbRaNpNehHWiL9z/uxyfrQaRuNYawzJFrFPBTJ
         6bPaQIbWMJwqLwBKt0WZUEOpZ3mm1hBq3BZWJRTVHhUDVNSFZxefihAEfilA9F8sRq/g
         mrHwvbSqhwgi0zRYFrNFBktc9aKr15RXr0p7JS4VU0mxOgKsZsnWw0lun+3wZlZCGnR7
         7LCZ2LPmIDx+vwWtXMRBugCNcmkdbzBiesii1jd4xtoi143z+ol001BDVqeYW1sHq/dg
         BJWscJ5MwyXYFkEQccSrl9c7c7wZukdexnQBzY2l1GEQvhoN9ry9bymBWhdgRw368Vcs
         a8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZqPIGu4Qy6PwTbAwCyp2FzT39HNpyMiA1WgHKTzzzs0=;
        b=P5uU+7C3dxmQWjC2jwOprvRLYIOvCDLbZWo0nwnMf/U0FNiTgpD8Rb/1O5TT5eS5d/
         IOPAu4GslDUTtLnT9hHF07ia9qgvH3AuqvxGw8d27pSNZZnRJOG24xYAGs/pBFYQE6Cy
         vhlJJJHXaG5EYHEgQoCOFv0r87Q0OnfAPmj7orbaOXKnqrGF/dPYfNmPaVYFWen7Y+8b
         mUI7WnGdpe9ymmUiwwT50ByEhJQixdsVga66koPLHb3zFlEkHM12KBEKOfvVFQHtEGOb
         U9CE/V/CvFr24wY/H/gQgNcDS4n1GzAECdAmSWt+tRfcjJ1LT9w4i6ap0hhzqD4cjHO9
         Nnnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iH02sJq7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r15sor4760057wrq.29.2021.11.26.08.39.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Nov 2021 08:39:18 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iH02sJq7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZqPIGu4Qy6PwTbAwCyp2FzT39HNpyMiA1WgHKTzzzs0=;
        b=iH02sJq7u9wZ2jWHkzf3Ivtu/sPN34t1bFsIOmg7P7DbQgk+VPoVnjglkOscvOp7xf
         qMWD2fEyr5bV86KASqqG7D40LFo5RjhcMP1UXvoxfSQ2csyqa5Wqb4xY3SKK/YZHUhE8
         1K39BK3YgtQIfGLN0AM6CaRWv4biOCLma5G93pHofMLVtAtSSNK5IdYxSJMRjwBv5eSd
         wulm4NisjJY6k8v4XLAXkwPftcaITla5soIRg0VeFqJVN0F1BqFBjceWhFFOrBBjolsL
         CvKQ/GxZHowJ0MbKDA+DO4dhha8FG9BsWuv2w3POwCACc4BqJlUHXZpDoyl6eFcYVbac
         X/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZqPIGu4Qy6PwTbAwCyp2FzT39HNpyMiA1WgHKTzzzs0=;
        b=FNX3CPs4lFTcoI47rvSeMmwKti9qgsr87q1xXaein37YlFzcCg3/cDo78C+C+SGZqb
         lNbj7ME7B35mEnTnNRdp/n62dz9CQA+ti06gHXEdpp82i7SXEzpy0o42c94rdjhZ9a11
         FnFMsf+3eF+X9daPHrN85ykF2cLC9VDERIFEYYHAftNIvwNsCsFL+t+doIs7g9jtINBW
         qBI5Ersrv17u0iKRFsQCIk0EBaPbJSjuIA3L50+Q20aKFhgt4IY1cq+7DaRcwBy/ozLC
         GqY+JsNym1RYaCFfjjpOVhsCZm/c3HpfMEzIxk7/dpxkqIMbcZ9c0Kq82Gz8HlSI+MWP
         k3cA==
X-Gm-Message-State: AOAM530ZOl5Ml8badPMMlKBpK/WYFPJIzSe97vrMSNJwBRAT6OR00x9o
	ovmQywfqo9v6HdNTDOIHixC5pwO5
X-Google-Smtp-Source: ABdhPJy25DKRcaKVJkpDo7IM5SRjcLw5J+PmpLgDdtqB+VldmJeiXDQFouHqByduZpdTuDUcuFBeVQ==
X-Received: by 2002:a05:6000:18ac:: with SMTP id b12mr15483833wri.355.1637944758440;
        Fri, 26 Nov 2021 08:39:18 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id b14sm7837698wrd.24.2021.11.26.08.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:39:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH for-6.2? 2/2] hw/intc/arm_gicv3: fix handling of LPIs in list registers
Date: Fri, 26 Nov 2021 16:39:15 +0000
Message-Id: <20211126163915.1048353-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211126163915.1048353-1-peter.maydell@linaro.org>
References: <20211126163915.1048353-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: SIPUGKqeHWmz

It is valid for an OS to put virtual interrupt ID values into the
list registers ICH_LR<n> which are greater than 1023.  This
corresponds to (for example) KVM using the in-kernel emulated ITS to
give a (nested) guest an ITS.  LPIs are delivered by the L1 kernel to
the L2 guest via the list registers in the same way as non-LPI
interrupts.

QEMU's code for handling writes to ICV_IARn (which happen when the L2
guest acknowledges an interrupt) and to ICV_EOIRn (which happen at
the end of the interrupt) did not consider LPIs, so it would
incorrectly treat interrupt IDs above 1023 as invalid.  Fix this by
using the correct condition, which is gicv3_intid_is_special().

Note that the condition in icv_dir_write() is correct -- LPIs
are not valid there and so we want to ignore both "special" ID
values and LPIs.

(In the pseudocode this logic is in:
 - VirtualReadIAR0(), VirtualReadIAR1(), which call IsSpecial()
 - VirtualWriteEOIR0(), VirtualWriteEOIR1(), which call
     VirtualIdentifierValid(data, TRUE) meaning "LPIs OK"
 - VirtualWriteDIR(), which calls VirtualIdentifierValid(data, FALSE)
     meaning "LPIs not OK")

This bug doesn't seem to have any visible effect on Linux L2 guests
most of the time, because the two bugs cancel each other out: we
neither mark the interrupt active nor deactivate it.  However it does
mean that the L2 vCPU priority while the LPI handler is running will
not be correct, so the interrupt handler could be unexpectedly
interrupted by a different interrupt.

(NB: this has nothing to do with using QEMU's emulated ITS.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not sure whether to put this into 6.2 -- I haven't ever seen
any actual misbehaviour, I found the bug by code inspection;
and we've behaved this way since the GICv3 support for
virtualization was first implemented, so it's not a regression.
---
 hw/intc/arm_gicv3_cpuif.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 7fbc36ff41b..7fba9314508 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -653,7 +653,7 @@ static uint64_t icv_iar_read(CPUARMState *env, const ARMCPRegInfo *ri)
 
         if (thisgrp == grp && icv_hppi_can_preempt(cs, lr)) {
             intid = ich_lr_vintid(lr);
-            if (intid < INTID_SECURE) {
+            if (!gicv3_intid_is_special(intid)) {
                 icv_activate_irq(cs, idx, grp);
             } else {
                 /* Interrupt goes from Pending to Invalid */
@@ -1265,8 +1265,7 @@ static void icv_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
     trace_gicv3_icv_eoir_write(ri->crm == 8 ? 0 : 1,
                                gicv3_redist_affid(cs), value);
 
-    if (irq >= GICV3_MAXIRQ) {
-        /* Also catches special interrupt numbers and LPIs */
+    if (gicv3_intid_is_special(irq)) {
         return;
     }
 
-- 
2.25.1
