Received: by 10.28.4.212 with SMTP id 203csp1809203wme;
        Thu, 3 May 2018 04:58:30 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo34mhtQqN3IakXPVJ8FqslTXMBn+FtFOQriAD3jMi/dgEiVxT2/udi0lhxW26JOJE1ha9J
X-Received: by 2002:ac8:25e2:: with SMTP id f31-v6mr20132770qtf.12.1525348710372;
        Thu, 03 May 2018 04:58:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525348710; cv=none;
        d=google.com; s=arc-20160816;
        b=nMSmVYhrgZRLQ4E9cbaQvcSwxkjWlawPWdiY1DxuUYpmNrckHN+a4U2VGJFApJalWb
         L8kwCzgGG2MEe8+UL0AlXzsuAGnROpk7KJc8LipIDcKBjXppozp6O/xMF1aJiCpl1k+P
         FlmjbAlpzkkBinSXE9A7HWcFMOkDESBKqVqRGZX5uimSMn/MSdpIBdVM+abpgyQRkgp3
         FwvymMmL6E9XAdM49BDHvYBEHA2SJvBVtZP2Omk5ImG+yYki8Pmnjdj2aD8LA7M1r0yl
         0ZTWPrWoEkr6bnGcZh6OyIrtiUy9LPOyMILq8MKIMOEp+Ihvx+aCjuni66wFS056aPPp
         fn/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=fWGQiK9J/n9qSd7ycRglbLNoFafem+ioUfRQq9TuolI=;
        b=JL3Rzky1/oE1ydMKf5ERTXQqYc+fyfBPa3gQ1C2qmWeAHgLk8jtS5JCrNiznMV4/lu
         Dgd13KacarvDEBnmcE8JgXhnwLfUVJGofmx/4WI0xkpyikNYT87HsomoUDSz8Eccfoiq
         7ixiYiXjo2vXdzSFDJzy9CGjqDMnTdzIQZXgEV0m+0TuSsn4jZofpq75i89yWjm48aOS
         3279+3cbREY0MMcvLnkZHXdg4tGwgNsM1QdEGipXK3QyrvOV9+LFZJXEeR0NX6Jv75Rq
         TYY1FjDh8m19U1oyog35ZSBKT5r7QE3DyemP3+GRru+tzK+OZjpPAKk9OMI4/3Q2pmQd
         0hLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bez4LYlh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 2si2902591qkm.181.2018.05.03.04.58.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 04:58:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bez4LYlh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55530 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fECsX-0006RU-Qq
	for alex.bennee@linaro.org; Thu, 03 May 2018 07:58:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1fECqe-0005E4-5P
	for qemu-arm@nongnu.org; Thu, 03 May 2018 07:56:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1fECqd-00071N-BI
	for qemu-arm@nongnu.org; Thu, 03 May 2018 07:56:32 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:39856)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1fECqX-0006yN-2A; Thu, 03 May 2018 07:56:25 -0400
Received: by mail-lf0-x243.google.com with SMTP id j193-v6so25545040lfg.6;
	Thu, 03 May 2018 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fWGQiK9J/n9qSd7ycRglbLNoFafem+ioUfRQq9TuolI=;
	b=bez4LYlhDP/7Y6oeJaI3x6iGye4T1DsLP5gEZSrH13Q+g+EMHlSeRrX+heoJQQAHIl
	MpQNBy0x55aCO9U0HMrW7PZhdn4zELgJCdQrJuthYVk3OImfnLefI5trmy5/coM++Vrl
	VoyyT61lyhf4EOioEh937/mYwBsxPCqX6c+0DelUorTYa+y78DlCmxa85FMruW/80xQe
	NcjZHxKjYgIkq6t1q2zppPTdgfS1+lWMC6GJMpfaUpkmMrXzqVlKdgm/J7Ep65jpFy0d
	e9QPeOeQCl6mj+ZAAjRd/VBfVLshrVdNDPkaVc2/RuINYjXB15/FFCz0psBBBLDQnY4O
	kFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fWGQiK9J/n9qSd7ycRglbLNoFafem+ioUfRQq9TuolI=;
	b=h9tzt/bWPiDxqfdT1/mDtXouxTQkr0Rktb4DgYSrQ3mR24Ps+3sZ8FtcDEJVnLKcKi
	5WmLdpkH7rMhTY1UdXxZf8LSBhIOIF5CevRyGqfyKpshzOLWmzSvkWzWTKTCNXztuJzY
	jalAWA3Sgml/T7oc7VRU0KpUovssUgHhZ79mywj+43yCJbilnMUHJrOGygC0SI3fn3l2
	cYMOTYF4BeDb4uNEGXdmN08m7frAE8zMHJIWiaUBqKx3aFKhlMWslua4dCiS9UbX31Px
	dwxt4CktqzIqQyEAc/jWjhFf+V1rQZr37VGXRNd8qiNPpQQ4D+69DLzDm+navGdFAAP4
	p5xw==
X-Gm-Message-State: ALQs6tAeBQkoLmFN/kbgkS9RBXsxeUt32eWtCviW47mbv+pGxwIAneox
	ZGe3Y6MgiZzBOKbx91Hz2Y7blA==
X-Received: by 2002:a2e:9218:: with SMTP id
	k24-v6mr15346343ljg.70.1525348583400; 
	Thu, 03 May 2018 04:56:23 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	p74-v6sm2802822lfe.42.2018.05.03.04.56.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 03 May 2018 04:56:22 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  3 May 2018 13:56:19 +0200
Message-Id: <20180503115620.10596-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180503115620.10596-1-edgar.iglesias@gmail.com>
References: <20180503115620.10596-1-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: [Qemu-arm] [PATCH v1 1/2] target-arm: Add the Cortex-R5F
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
	alistair@alistair23.me, frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hizhtvS2nS4X

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add the Cortex-R5F with the optional FPU enabled.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/arm/cpu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d175c5e94f..7a7035c037 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1341,6 +1341,14 @@ static void cortex_r5_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
 }
 
+static void cortex_r5f_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cortex_r5_initfn(obj);
+    set_feature(&cpu->env, ARM_FEATURE_VFP3);
+}
+
 static const ARMCPRegInfo cortexa8_cp_reginfo[] = {
     { .name = "L2LOCKDOWN", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 0,
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
@@ -1801,6 +1809,7 @@ static const ARMCPUInfo arm_cpus[] = {
     { .name = "cortex-m33",  .initfn = cortex_m33_initfn,
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-r5",   .initfn = cortex_r5_initfn },
+    { .name = "cortex-r5f",  .initfn = cortex_r5f_initfn },
     { .name = "cortex-a7",   .initfn = cortex_a7_initfn },
     { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
     { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
-- 
2.14.1

