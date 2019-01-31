Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6845757wrt;
        Thu, 31 Jan 2019 05:07:45 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5k2PCuFLzgqSTxOH6BwcAA/kDIF5B4RIlRaWOwlrjfHYxbVP5QLZw+yHnbvmF1cxCFsek5
X-Received: by 2002:a25:b701:: with SMTP id t1mr33275717ybj.81.1548940065260;
        Thu, 31 Jan 2019 05:07:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548940065; cv=none;
        d=google.com; s=arc-20160816;
        b=aJ2GaVLPfsud9SSpcs2nLG0iKyKPZ7KqUItzFd/qocPhz6HDiNYo9VzCRedgVfXuVl
         pvapZAczT2UhV/i4rFLsh9Z7kmFmeG6LGIZUQHX0FQha7D2EYIM+jqT1HDTh4Hz6R4Do
         BNpIQHohod76MWFmWqAglHpPWgPf8LdOyFh68q0YohSDX44/2v0RhfwlnEH1pzIhx7Fl
         iAsX5YMVztNiqvnPOE2wmT9EK1HjKGhzGaDwWHbyMxYbkqAXhvVFVcSYtHAjLpommcrD
         ZofqbLiUnctnIm+xLRGHFzNCCjrRnij+Gzx6pBiCK+KTW3cEOj/qnAp8BNA/0FYoV7SI
         uumA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=0JO8RPLDHt6vVAFDC7iq+vX8nhpxSiNaD91+Ug+YDzk=;
        b=zCABybpQbZkHcZAtloF+zD1qIBUOJVoz46E0thjyDATvSHZgt4K0ymgksQ0uzSKX6P
         PnNxOTROvLzZp8BGd6upWH4hoVtONoq/mvPTR6GvR0lk5mhW+qSV4wnf1JtVvQHmgIO2
         anh1H87jxdhQ+ipmvyvo7p1LV2AFqQ/Z48bt+1uqsb9xB/SG58IJpGTAZIRFUCTACVRk
         UVjzMApqCHQ1W2kYS07z2myTCtCDql9uVknRsOpUnkVZnAErQfu1mWfvBaTDcAm2LlvH
         qDPbU50T+o2GqhLc++rpVUZKCBdP1tXVQlrYsLNDrESNylBDdFGwzq2mEFnX1jqnhkea
         45+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nb59Kl0v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v65si2617762ywf.79.2019.01.31.05.07.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Jan 2019 05:07:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nb59Kl0v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gpC4G-0006C9-Ph
	for alex.bennee@linaro.org; Thu, 31 Jan 2019 08:07:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpC3d-0006Bj-OY
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 08:07:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpC3c-00082j-RA
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 08:07:05 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:38331)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gpC3c-00082D-L4
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 08:07:04 -0500
Received: by mail-wm1-x344.google.com with SMTP id m22so2488677wml.3
	for <qemu-devel@nongnu.org>; Thu, 31 Jan 2019 05:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0JO8RPLDHt6vVAFDC7iq+vX8nhpxSiNaD91+Ug+YDzk=;
	b=Nb59Kl0v+3p6tkbJR2PCaO7QajeT/VOjszk2uOVfvYEaTN1/eBZi4yzvOUsoZgcDoD
	n7ULiHkFqCf/bf6AuwkRTXFpiYbW7nI+7NvjiWV2/XAB5j5NMfIm09AR2lgLHADIYpWo
	eFtYVxu+hFXftyNmbM0wQUuL0AaDsgOPk5G4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0JO8RPLDHt6vVAFDC7iq+vX8nhpxSiNaD91+Ug+YDzk=;
	b=iRzGDsiJJ/gc4GdRbQjvzgOnq4dqciA9MdjIWKH59BVgYpTnvH6H9eef7zS2AV+TeN
	IZ3j4BoZZ0VFx1B9Mz2Y7weBAQrNvHIqkEXgatHc+QRbd2+lMKXJRTgdyz+G59LXB9qY
	muZVpaVNjrAhCkpD1ECHNDAaZvAIOnKJcVAunw1VKdnq1vb3KVuDHlGXpANM6tzEXL7v
	xsJ98wE8gdgwOo81P0k6tShb/i3x0MI+M858mcPheuEZwZeqSxiioACkvpgnqp2jpo9W
	fd1LR4dgO7DlcZ/vQTz4i3zz2/IcX9LLgfoIBeNJ2QUq+bsokoZwp7k4y6G25+s2HOeJ
	80Og==
X-Gm-Message-State: AJcUukf9Cdth0cRJSRRtaVIc69IQks4bBLykl8oHO7v3LbBUYODUu4fq
	Kwa/ub+hPDCd0ky7rO93heYbmg==
X-Received: by 2002:a7b:c7c7:: with SMTP id z7mr31420339wmk.74.1548940022914; 
	Thu, 31 Jan 2019 05:07:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	h16sm9719135wrb.62.2019.01.31.05.07.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jan 2019 05:07:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 31 Jan 2019 13:07:00 +0000
Message-Id: <20190131130700.28392-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PATCH] target/arm: Make FPSCR/FPCR trapped-exception
 bits RAZ/WI
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Martin Husemann <martin@netbsd.org>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zn5GyiaDQijY

The {IOE, DZE, OFE, UFE, IXE, IDE} bits in the FPSCR/FPCR are for
enabling trapped IEEE floating point exceptions (where IEEE exception
conditions cause a CPU exception rather than updating the FPSR status
bits). QEMU doesn't implement this (and nor does the hardware we're
modelling), but for implementations which don't implement trapped
exception handling these control bits are supposed to be RAZ/WI.
This allows guest code to test for whether the feature is present
by trying to write to the bit and checking whether it sticks.

QEMU is incorrectly making these bits read as written. Make them
RAZ/WI as the architecture requires.

In particular this was causing problems for the NetBSD automatic
test suite.

Reported-by: Martin Husemann <martin@netbsd.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Martin: this is a different fix to the one I suggested you test,
because I realized we need to make these bits RAZ/WI in the aarch32
FPSCR as well as the aarch64 FPCR, but it should have the same effect.

General note: the difference between "RAZ/WI" and "RES0" is a bit
subtle (see the Arm ARM glossary), but the main distinction is that
RES0 bits can often be implemented as reads-as-written whilst
RAZ/WI bits never can.
---
 target/arm/cpu.h    | 6 ++++++
 target/arm/helper.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b8161cb6d73..15e1464460f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1404,6 +1404,12 @@ void vfp_set_fpscr(CPUARMState *env, uint32_t val);
 #define FPSR_MASK 0xf800009f
 #define FPCR_MASK 0x07ff9f00
 
+#define FPCR_IOE    (1 << 8)    /* Invalid Operation exception trap enable */
+#define FPCR_DZE    (1 << 9)    /* Divide by Zero exception trap enable */
+#define FPCR_OFE    (1 << 10)   /* Overflow exception trap enable */
+#define FPCR_UFE    (1 << 11)   /* Underflow exception trap enable */
+#define FPCR_IXE    (1 << 12)   /* Inexact exception trap enable */
+#define FPCR_IDE    (1 << 15)   /* Input Denormal exception trap enable */
 #define FPCR_FZ16   (1 << 19)   /* ARMv8.2+, FP16 flush-to-zero */
 #define FPCR_FZ     (1 << 24)   /* Flush-to-zero enable bit */
 #define FPCR_DN     (1 << 25)   /* Default NaN enable bit */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 66faebea8ec..c5f10ddbe92 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12508,6 +12508,12 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
         val &= ~FPCR_FZ16;
     }
 
+    /*
+     * We don't implement trapped exception handling, so the
+     * trap enable bits are all RAZ/WI (not RES0!)
+     */
+    val &= ~(FPCR_IDE | FPCR_IXE | FPCR_UFE | FPCR_OFE | FPCR_DZE | FPCR_IOE);
+
     changed = env->vfp.xregs[ARM_VFP_FPSCR];
     env->vfp.xregs[ARM_VFP_FPSCR] = (val & 0xffc8ffff);
     env->vfp.vec_len = (val >> 16) & 7;
-- 
2.20.1

