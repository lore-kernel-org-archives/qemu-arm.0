Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp777315lfq;
        Fri, 8 Jan 2021 11:54:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSBJxpwivTKhSeq58HQ0e/1gyVz7nnlIcJfDuuHFsthGKuFPtkwg76xo1TQNL4v2Y+sbDr
X-Received: by 2002:a25:c147:: with SMTP id r68mr8325520ybf.278.1610135642290;
        Fri, 08 Jan 2021 11:54:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610135642; cv=none;
        d=google.com; s=arc-20160816;
        b=r/EjepEJpAkGFr+fVgaMddU1iAUw+85/17TbGaOtUHsKZ06VrVdfXsPN8FbWTteumA
         +ja9Cpx4XlJQmCqld7PZ+ee+O91RQAfsUxJTFxbxq+AWfbkp2FTxD1+78IkhF5TYWOUg
         nldTQQx7coQuNis9VU2nb6dvUkl2RIpFzMmuAuulP/G1456XXZZVPpFLZIpRb/lg74MV
         KJpMozBixTCGa75JNlTEuV1VzFsKaXBGqqmLWlw9VC4crxKwpz17oo55HuYOGXE2OII7
         sj2ZiB5+3lUmNO8VjikzqHh9qCRjXccfvoX6gxhYqGlQ4jRjEMSgTOZq/J3b9XC6ySEb
         gFrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=P2ajQPIFYRSDLifvESHkyonYhqAc+VzA8sC/bR0K24E=;
        b=B/dvk5KTpgPpBb27I4SKxcff5q+k1um0BkQZ1dpkLyfEOeAZlbCL+z7d9DDGok3r8I
         TxSbtj1vfki1hkvJl9wGbcu3vlUBF3wr6ABh8UXkKDXZbjPyx22GR4njsO66Klwvyzb1
         W5or5NMHW7zGAXmxATcIRXuN4rqxSQE+qgIeTQcuOdBsRJ3DML2tVkWmgpKuDl7CajdI
         HjC/XibOPZvhWTShwUCVwook8MnO60+BvS6DHVdvgUTPBIPEsZr/AQsCcWwTgr8RH5Qc
         x6cwte3ZdpOoP2JwRSD+FqFZi8+mC4OrxmaYPLyV2ju2krggCsDOv4a8pcvis6oj+o2o
         SWug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fXCVOBji;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13si11331990ybm.9.2021.01.08.11.54.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 11:54:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fXCVOBji;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxxph-0003ZT-NG
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 14:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxxno-0002DL-8n
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 14:52:04 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxxnl-0004VE-Jn
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 14:52:03 -0500
Received: by mail-wm1-x32e.google.com with SMTP id q75so9407321wme.2
 for <qemu-arm@nongnu.org>; Fri, 08 Jan 2021 11:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P2ajQPIFYRSDLifvESHkyonYhqAc+VzA8sC/bR0K24E=;
 b=fXCVOBjimAlPdAlSeFRP9cFMU7VseqwDMVJFm+XhFds8l/gZOI/L1exZbX+b1yeBI+
 9aBh53mDl7fFFF4aKbZBy1Bb9C6qz06WyXJ5cKGp6kR4Kx346hvAu0Hgc/N2AdcR8/S7
 CjPudtFf9AJDqj+7yrwYYmkqwF7CWQXYOC1pvneWwrHs+N7BX4cfWJnwarT8KbjF+g9e
 hzmYnRovnmoS7Asxq6RKQ0tLSyheIux2rqYpyxjRzt3RBZQltRyvhLZiYSZpDzVxt/xw
 W6MWEggaSCv4OJhhqnSdGy1+urEPbIVeu0LurmmUcYbXeGnIrtQKlCTWGlisWfvS9Ms/
 rwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P2ajQPIFYRSDLifvESHkyonYhqAc+VzA8sC/bR0K24E=;
 b=JTkyq5ZLIUwEd4zIcxRaFUJINfol4y1p1iMFuQC42Kp/W79h2VV+2z94CVscozdStw
 VmAnDUR89+8wGV9yZlW4MILAgkqgUpYait+unOa9/NleNS1x6+NQZs3JY0lp3iO3HNFB
 sl9OWanXiIiSkGJt/ze67FaY9ybQs78ewXNeLmKNXRvNKM1By6hvkFMG5xGw2PV4Sx5C
 UD+jbu+xU+V0zr1RbyQVSB7uXq/eSxUXsfG6NOu4rsTceal/QkfhlceE+fHWqG1SVi6w
 SJGODQFIumg5J7AuyspT8jk3W/kBIVcz2cU0Mxea06HddbTOk6QX3ETEiROg7XZo+GRr
 Jvjw==
X-Gm-Message-State: AOAM532TLGmmSqyQ9d9GtUZXa6m9gC2zm2v7ZUKn23CS4axPgqvrrwj8
 Dn5W8awVU+GCf3GkyOScf4ZrrU0+VgJrMg==
X-Received: by 2002:a1c:61c3:: with SMTP id v186mr4426243wmb.146.1610135519909; 
 Fri, 08 Jan 2021 11:51:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b127sm15338635wmc.45.2021.01.08.11.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 11:51:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Don't decode insns in the XScale/iWMMXt space as
 cp insns
Date: Fri,  8 Jan 2021 19:51:57 +0000
Message-Id: <20210108195157.32067-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: qemu-stable@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wchf8cBt8k+O

In commit cd8be50e58f63413c0 we converted the A32 coprocessor
insns to decodetree. This accidentally broke XScale/iWMMXt insns,
because it moved the handling of "cp insns which are handled
by looking up the cp register in the hashtable" from after the
call to the legacy disas_xscale_insn() decode to before it,
with the result that all XScale/iWMMXt insns now UNDEF.

Update valid_cp() so that it knows that on XScale cp 0 and 1
are not standard coprocessor instructions; this will cause
the decodetree trans_ functions to ignore them, so that
execution will correctly get through to the legacy decode again.

Cc: qemu-stable@nongnu.org
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
With this Guenter's test image now successfully boots
and shuts down again.
---
 target/arm/translate.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f5acd32e76a..528b93dffa2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5282,7 +5282,14 @@ static bool valid_cp(DisasContext *s, int cp)
      * only cp14 and cp15 are valid, and other values aren't considered
      * to be in the coprocessor-instruction space at all. v8M still
      * permits coprocessors 0..7.
+     * For XScale, we must not decode the XScale cp0, cp1 space as
+     * a standard coprocessor insn, because we want to fall through to
+     * the legacy disas_xscale_insn() decoder after decodetree is done.
      */
+    if (arm_dc_feature(s, ARM_FEATURE_XSCALE) && (cp == 0 || cp == 1)) {
+        return false;
+    }
+
     if (arm_dc_feature(s, ARM_FEATURE_V8) &&
         !arm_dc_feature(s, ARM_FEATURE_M)) {
         return cp >= 14;
-- 
2.20.1

