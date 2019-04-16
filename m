Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3917181wrx;
        Tue, 16 Apr 2019 06:17:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwfgfPj/KwsI1xsTC9hdPcoY/6zgCZvbdHdVcrHSsMLHVzU6MMCuSoU0cNskiEA6Qaa3XHk
X-Received: by 2002:adf:dc4a:: with SMTP id m10mr51131811wrj.0.1555420678853;
        Tue, 16 Apr 2019 06:17:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555420678; cv=none;
        d=google.com; s=arc-20160816;
        b=lBDwZCzM6+e7QaLknNTBBXNCRQD56+A4OyTWFNwhp9GOZZgfTWXCKGc4eiiUvvQ1Ku
         msPyWu0INuzo8mJQN4M2aiJbslSl/1fiw2iLuIpm5LVlOWFLMc6TT89XaW4oRZPQ7HRu
         NNMu7Tk52irVgAycPJrNwylco7uGYAUDz6/DhwS6v2GAqMlfDnKzaeLZJlhtncvaMC9+
         oLaZgPiHs6IDifmT4Akmzbd0m8qYAUyOld8idYKz3ePkVjPO0/Z5a9eFNOALaQTO6mBa
         iqg5rmyTAokFrceKDxeSyKtu96TY5mnRE1WhNvHQxGUOgRxwsQtVMi8eWP0EjB7xyxxo
         Giyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=tO2IbzqkFfPLxQHEQtP7KD/Py5uleD69zDN6a2d6v0s=;
        b=Ly/4Q3GURMRqBqjXPXCEt4ubTOFY5MEiDn0IuWgrlVP/vOdmR5Jy4kbhD5CoQwSyHP
         t1c7PxhhSjhacHTpw/iXkDCLM1DmH+YQVhdxxWBXD5o1aznnMC4lLVZEzhxGT4fCBsOY
         tmJkh7Fe7qJ6bDzZlrcpexesQePtrKH1L5AIvzn6dvl/2cyA2Z3siw8t2bFRLN07WHK0
         +iN+rznlBCc9OROHXlRq/854O6+8H3tLVLH36vp/CDPUwou3owsMIUj3oaXAF2xH0utq
         X9H99LIGjGp/CRtFTzEvNbOOBdCc70/t9k4K9/GY8nwQ9R34M8pO+/c8BFTKjMUsDw2W
         GwMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g5BhKRB7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17si34778131wrw.294.2019.04.16.06.17.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 06:17:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g5BhKRB7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36616 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGNyH-0003eI-TJ
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 09:17:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNfc-0005BA-PA
	for qemu-devel@nongnu.org; Tue, 16 Apr 2019 08:58:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNfa-0001Yc-Ow
	for qemu-devel@nongnu.org; Tue, 16 Apr 2019 08:58:40 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34512)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hGNfY-0001Vl-Og
	for qemu-devel@nongnu.org; Tue, 16 Apr 2019 08:58:38 -0400
Received: by mail-wr1-x444.google.com with SMTP id p10so26962613wrq.1
	for <qemu-devel@nongnu.org>; Tue, 16 Apr 2019 05:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=tO2IbzqkFfPLxQHEQtP7KD/Py5uleD69zDN6a2d6v0s=;
	b=g5BhKRB7QoF5P+fGXAexdSpC1m8IYCNpc8uaDDbaLKubN4BHTVCGY3h6IB5RWIqQZA
	MbV0nk4g1nemo1xF1ayKqp3yRJop5eu+ERgC0mI0DrpjQQ2eE+4hJ7pBjZbzg6GplElH
	Kj6pOUeoCx+0P5kaz/buSy3cYm9Fc1yEjB9hMMksAw9KGWU/NoKcvVMjP4qSM+aPvEVC
	xArfrW0aM1oLfNFTFRkNaF/aYEH0gIC0adBh0y+SVtLsMdBQ2pIyhvNhg1NofUke05U7
	5z/KAkcV6d/7FQlR7UjRNmj2HInRvIJX6xQcGaaUgGqWLekq4ecwrSfQ6HwsyZjLHXFd
	m3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tO2IbzqkFfPLxQHEQtP7KD/Py5uleD69zDN6a2d6v0s=;
	b=MadBPL6Y4zJ5QeUJh1uPO60CtuQ1itiudLDPwGmX6n3Hz/qe9/mzwUa/+AeBaZa/W8
	ei17i2+NswzQVG2RfNhl3959fPNAq0qQZVPSJhpI+gJ3WJ+QKWgkeNya6j+5xDkRtZyZ
	35t//5F7rLhcMO63vJOqe69837KvodAKFpktdDsISUQsOfmGV+9pFdo98IpJpgJs4Y9A
	nG+KQzibuLmGiPUJb5D4aMuTWVxPWuje3/ZZP3X/oaupF58pQAtyvE7qRCSqrIu50X7Q
	sGN5Q6mzEXflNM+42XjKJ/9nundc4lXh6WSXHYAJg2VMFticzmFgzv2k0t2MnzbghwLa
	xUOw==
X-Gm-Message-State: APjAAAVPZUD38euyVtLiy5abR2/WuJ5XkU9yW9TatGxTrvEaHJ97n24E
	BZh5dqL3WpjYU61AcX/97vPVdEjHoPs=
X-Received: by 2002:adf:f78d:: with SMTP id q13mr51758249wrp.194.1555419515116;
	Tue, 16 Apr 2019 05:58:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	v184sm39476572wma.6.2019.04.16.05.58.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 05:58:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 13:57:44 +0100
Message-Id: <20190416125744.27770-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416125744.27770-1-peter.maydell@linaro.org>
References: <20190416125744.27770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH 26/26] target/arm: Enable FPU for Cortex-M4 and
 Cortex-M33
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hH7gR548xfoV

Enable the FPU by default for the Cortex-M4 and Cortex-M33.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index dd6c4f6da8d..00d3299e212 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1494,8 +1494,12 @@ static void cortex_m4_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_M);
     set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
     set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
+    set_feature(&cpu->env, ARM_FEATURE_VFP4);
     cpu->midr = 0x410fc240; /* r0p0 */
     cpu->pmsav7_dregion = 8;
+    cpu->isar.mvfr0 = 0x10110021;
+    cpu->isar.mvfr1 = 0x11000011;
+    cpu->isar.mvfr2 = 0x00000000;
     cpu->id_pfr0 = 0x00000030;
     cpu->id_pfr1 = 0x00000200;
     cpu->id_dfr0 = 0x00100000;
@@ -1522,9 +1526,13 @@ static void cortex_m33_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
     set_feature(&cpu->env, ARM_FEATURE_M_SECURITY);
     set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
+    set_feature(&cpu->env, ARM_FEATURE_VFP4);
     cpu->midr = 0x410fd213; /* r0p3 */
     cpu->pmsav7_dregion = 16;
     cpu->sau_sregion = 8;
+    cpu->isar.mvfr0 = 0x10110021;
+    cpu->isar.mvfr1 = 0x11000011;
+    cpu->isar.mvfr2 = 0x00000040;
     cpu->id_pfr0 = 0x00000030;
     cpu->id_pfr1 = 0x00000210;
     cpu->id_dfr0 = 0x00200000;
-- 
2.20.1

