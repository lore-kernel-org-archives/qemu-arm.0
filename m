Received: by 10.25.0.23 with SMTP id 23csp2145192lfa;
        Wed, 7 Jun 2017 08:29:31 -0700 (PDT)
X-Received: by 10.223.130.86 with SMTP id 80mr24797924wrb.111.1496849371713;
        Wed, 07 Jun 2017 08:29:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496849371; cv=none;
        d=google.com; s=arc-20160816;
        b=JicMSCD06PFFnvMSQa6Vip/n/obMEam3iF8w9rD69F/CFWIZll2S3cGe78LWkqSP5Q
         MIBMHHLLi+RB1e9oiIXDARb3hoKS39BlJ+XH+nE1HshxuivcdjbwKEJtAkBHijTISq59
         ZNUxC+a11fJ6Xi2zGZz4q+8dMbl1asjhMMVOcv0I7DbuXGgJpS4Z3heXL6i/r6cgXFAi
         eiSlQDzuES2ZPGE8sNGW79SUtSQDBlrMekfUJFJBkmdbgsjUKkFEsitXoH4uPFdfKzdx
         u5svoWw8ZWs6WdTihvJ2rFasj+PrcQQv63nFN487OddcIqYGWgPtVK5Kix5DlVyytGGk
         mW4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:arc-authentication-results;
        bh=L+CuRvHOG59xA/b+dmIFW2QokFj58phcC4v9TgKUFbA=;
        b=uBdFuQDxCltI8RgkO7mgyjaiockUW0SwciqDqCY2l8K1JQdTr9fVtgvYMBCP0hUOH7
         VkTK1h0paFAAgua61LYZKgg/XMdc0lkwBmeGzeIcnSZrFgVrFCIC4EdVuh9N1hK0g1Fw
         mXtbhvwZh34/7JNE9g0Ujnk0n7jqHHAK124tiplYMWDJDty9tdqs+DgCdut77U/ZmpIE
         sb6H9j9t/pgq4ijHMDYwZaQv+qeF3IIx8/uO4ShnGA4st6qYiMerGqymR/9WfwgT+QYE
         26FyOmOUgEFzOMqMuapCSq63hpNKLRsbpthEQhT33kJi1MmiYFl7O/EEDyavRrZfgxwb
         I+2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id c22si2268783wre.34.2017.06.07.08.29.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Jun 2017 08:29:31 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dIctm-0004hr-Bd; Wed, 07 Jun 2017 16:29:30 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] arm_gicv3: Fix ICC_BPR1 reset value when EL3 not implemented
Date: Wed,  7 Jun 2017 16:29:29 +0100
Message-Id: <1496849369-30282-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /g3buxjE5nIC

If EL3 is not implemented (ie only one security state) then the
one and only ICC_BPR1 register behaves like the Non-secure
ICC_BPR1 in an EL3-present configuration. In particular, its
reset value is GIC_MIN_BPR_NS, not GIC_MIN_BPR.

Correct the erroneous reset value; this fixes a problem where
we might hit the assert added in commit a89ff39ee901.

Reported-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 09d8ba0..5cbafaf 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2039,11 +2039,7 @@ static void icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
     cs->icc_pmr_el1 = 0;
     cs->icc_bpr[GICV3_G0] = GIC_MIN_BPR;
     cs->icc_bpr[GICV3_G1] = GIC_MIN_BPR;
-    if (arm_feature(env, ARM_FEATURE_EL3)) {
-        cs->icc_bpr[GICV3_G1NS] = GIC_MIN_BPR_NS;
-    } else {
-        cs->icc_bpr[GICV3_G1NS] = GIC_MIN_BPR;
-    }
+    cs->icc_bpr[GICV3_G1NS] = GIC_MIN_BPR_NS;
     memset(cs->icc_apr, 0, sizeof(cs->icc_apr));
     memset(cs->icc_igrpen, 0, sizeof(cs->icc_igrpen));
     cs->icc_ctlr_el3 = ICC_CTLR_EL3_NDS | ICC_CTLR_EL3_A3V |
-- 
2.7.4
