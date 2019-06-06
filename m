Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4712923wrg;
        Thu, 6 Jun 2019 10:11:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyIckg3oTohr2BPKIfe07rPrTet1vHWO0oEjouyrKFeaKAzzYN3VtQGEckZE/5O1zrbB+kW
X-Received: by 2002:a37:ad12:: with SMTP id f18mr39977185qkm.3.1559841064731;
        Thu, 06 Jun 2019 10:11:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559841064; cv=none;
        d=google.com; s=arc-20160816;
        b=tXOZAXEODWOkt4a+M/NyMSm56TwItPkzFGLiPXJE7fbz+Zehb37u1a+2N7RIzBYlwk
         LexkH/LTBJKoFePy3jH7D4ytwAc1ErKTv9XSG4rI/gTsjXEYU+XiSo2Mai3aEdFSuhPs
         BUrfA/9DxtiV5O5ZMoq38ILIdxa9vaexWz+9YdDvkECBE2x5kNxZBUuxZCv6HIJ4Iql6
         22xZyfi/7tTloB/UVV6LQtiTkADcUQ96NGMmwjxCTEz62+R9UJrUx4U30skYP4GokxeG
         RbVZisNZ7jBQ0GTXzn0RkqreVDWBO8GOuHArFeIc6Fsn9dIW5wIC5YmSD9jUc5I5lTKJ
         NpEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=+1eWxKuIPwR4Tloaz6TIjljvK8BIfg7auA41U3tlw74=;
        b=icI9armB+1mNqRwntBWm1Gi2GRY2zLCVbuck9q8c1zB9bEOqaHgS7EIfBq9mHaphX/
         HJkPGVvi62i4Ikq9OUoZUo0u3UXJhQ9//uh6cIM57KPEl+E8AF//W3ZS/ZgX2T0qJ7iK
         1ZMmLNlwoeVNN79BOT3VLwNUEH8koXf4ifw59cJmfYuW6gCTvhE7B5yAPKU0G3NLuSbY
         PnlSIbEqoMrxqcTdWTkKLn99AmdaJ2PWzhrthJeibSocdt6RPtrL4Pz6B7J130DoRhVK
         KPBIdukOReOeNsciMwT+pzuKUAo6dvcQeb6m81ecDFxvajVfKeO3kkXgNk2OmDi676bD
         Wm2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eHm8JCBj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d21si2062705qtj.176.2019.06.06.10.11.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 10:11:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eHm8JCBj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35478 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYvuq-0007YN-7M
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 13:11:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYvuf-0007YB-Jo
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:10:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYvue-0004g1-Ag
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:10:53 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34671)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYvue-0004U0-2S
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:10:52 -0400
Received: by mail-wr1-x444.google.com with SMTP id e16so3252925wrn.1
	for <qemu-arm@nongnu.org>; Thu, 06 Jun 2019 10:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+1eWxKuIPwR4Tloaz6TIjljvK8BIfg7auA41U3tlw74=;
	b=eHm8JCBjM0XyARgnPlT4t6xuzBk107s9RI1XrhIde6WogKebEPjG4gIwnNC6VZsbXZ
	JUtnKg3etT5CwY3cjzjUJ7asPZC31xuwfk6W4gTSEFO3zPkSvbgCJL2I9w6rVbqLpJGR
	oIZr4jGcrJZUA1iUCKs7763P7mfAeZEL4HRY57HBJUJuFgwj3GBVoK/lMTgpbqs1BIur
	JL0+bqXia+i1NzhZn8yuJf0HbDqNIpe7umzDmpvdlrxEVvEQpioZDlDN+9b+eoaO1RU/
	Kr2RTjgajdcjtJOopl1PHjWyHZYZpDXW+90fSkjJiOR958b48E3bSZkOrsn1lAwgbHeN
	dHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+1eWxKuIPwR4Tloaz6TIjljvK8BIfg7auA41U3tlw74=;
	b=cybefBAiVW9f19wwO3zApY7/ESKqM/s6k7kYdqzX1ME+vyOuo8Qt1Z8c4cG2IJvyHT
	BaUvzT+p4WC859k4hYobJI4CKtSD0yJ04BmsJLu3VS9MGnzS41S1m+hbnFqF7CECrR6K
	SzFdsCqHT/NZuM59X5765LHIa81kPWhXgp3vW7O+KKldc2KDkZ1sk1MeI6+EcHcIFRvl
	o1DyWvQkYFt82LROvfcprmdfFlJ39UOIAfdTcYYVNCO69f0Fj2PerDm5J0w+GAHM/0XO
	bl4kJRFcLR71EHuwPk+eok63qcIwk67Lqr65VSQCtQnAZ4zCUESvP8uUbh9fyA2PwfFa
	ekMw==
X-Gm-Message-State: APjAAAUY0cX+osO5kVfWR1T6ZwPshKB+abosw7jwSww52KD8/reCRYRl
	2v91jnphMS7mBwwbZokAu9L1LyE37Q2FSg==
X-Received: by 2002:a5d:53c7:: with SMTP id a7mr16244855wrw.91.1559841048806; 
	Thu, 06 Jun 2019 10:10:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	y184sm3037092wmg.14.2019.06.06.10.10.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:10:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:10:46 +0100
Message-Id: <20190606171046.2732-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH RISU] arm.risu: Add patterns for VFP<->gpreg
 transfers
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1GV1NNtQre85

Add instruction patterns to cover the "transfer between
Arm core and extension register" spaces (A7.8 and A7.9
in DDI0406C.c). We omit VMSR/VMRS because they might
have side effects (for stores to special regs) or give
results dependent on previous execution (for loads).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I think these are the only VFP insns we were missing.

 arm.risu | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/arm.risu b/arm.risu
index af73345..9009e6b 100644
--- a/arm.risu
+++ b/arm.risu
@@ -111,11 +111,6 @@ SBC_imm A1 cond:4 0010110 s:1 rn:4 rd:4 imm:12
 SBC_reg A1 cond:4 0000110 s:1 rn:4 rd:4 imm:5 type:2 0 rm:4
 SBC_rsr A1 cond:4 0000110 s:1 rn:4 rd:4 rs:4 0 type:2 1 rm:4
 
-# vector duplicate (reg)
-# b:e == 11 UNDEF
-VDUP A1a cond:4 1110 1 b 1 0 vd:3 0 rt:4 1011 d 0 e 1 0000 { ($b == 0) || ($e == 0); }
-VDUP A1b cond:4 1110 1 b 0 0 vd:4 rt:4 1011 d 0 e 1 0000 { ($b == 0) || ($e == 0); }
-
 ########### Neon loads and stores #########################
 # These patterns cover all the Neon element/structure
 # load store insns, ie the whole of the space in section
@@ -707,9 +702,6 @@ VFNM A1 cond:4 11101 d 01 vn:4 vd:4 101 sz n op m 0 vm:4
 ########### Extension register load/store #################
 # The following sets of patterns cover:
 #  'extension register load/store insns' (A7.6)
-# Still TODO:
-#  '8, 16 and 32 bit transfers' (A7.8)
-#  '64 bit transfers (A7.9)
 # as described in DDI0406B
 ###########################################################
 
@@ -775,6 +767,31 @@ VLDR A1a cond:4 1101 1 d 01 rn:4 vd:4 101 x imm:8 \
 VLDR A1b cond:4 1101 1 d 01 rn:4 vd:4 101 x imm:8 \
  !memory { reg_minus_imm($rn, $imm * 4); }
 
+########### Extension register transfer ###################
+# The following sets of patterns cover:
+#  '8, 16 and 32-bit transfer between ARM core and
+#  extension registers' (A7.8)
+# as described in DDI0406C
+# with the exception of VMSR/VMRS.
+###########################################################
+
+VMOV_core_single A1 cond:4 1110 000 op:1 vd:4 rt:4 1010 n:1 0010000
+VMOV_core_scalar A1 cond:4 1110 0 opc:2 0 vd:4 rt:4 1011 d:1 opc2:2 10000
+VMOV_scalar_core A1 cond:4 1110 u:1 opc:2 1 vn:4 rt:4 1011 n:1 opc2:2 10000
+
+# vector duplicate (reg)
+# b:e == 11 UNDEF
+VDUP A1a cond:4 1110 1 b 1 0 vd:3 0 rt:4 1011 d 0 e 1 0000 { ($b == 0) || ($e == 0); }
+VDUP A1b cond:4 1110 1 b 0 0 vd:4 rt:4 1011 d 0 e 1 0000 { ($b == 0) || ($e == 0); }
+
+########### Extension register transfer ###################
+# The following sets of patterns cover:
+#  '64-bit transfers between ARM core and extension
+#  registers' (A7.8)
+# as described in DDI0406C
+###########################################################
+VMOV_core_2single A1 cond:4 1100 010 op:1 rt2:4 rt:4 1010 00 m:1 1 vm:4 { ($vm != 0xf || $m != 1) && ($op == 0 || $rt2 != $rt); }
+VMOV_core_double A1 cond:4 1100 010 op:1 rt2:4 rt:4 1011 00 m:1 1 vm:4 { $op == 0 || $rt2 != $rt; }
 
 #####
 # v8 only insns
-- 
2.20.1

