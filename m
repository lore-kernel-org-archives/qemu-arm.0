Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1014476lff;
        Fri, 10 Jan 2020 10:02:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqxsjmLQEzCo6hrrhkg5oi6TBTINPulp6+nHMPWr1KCUeWAy8uW93aSuZjJYmnSbRaN6EFZQ
X-Received: by 2002:ac8:404e:: with SMTP id j14mr3327578qtl.312.1578679351353;
        Fri, 10 Jan 2020 10:02:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578679351; cv=none;
        d=google.com; s=arc-20160816;
        b=s3Q6fpw9Pk0vGfoDCdMTn9zp/3SUjaiHjfts/WFf/uAHxzVYVdD+LNYCERHsZ6rW3R
         fVr/SNaBcYmwGd040w+MAQU0/pbkZ7L8UpwXLVvsS73FcHjoyOauqwXCkRzZMpiHRyVa
         FefzUVqcd70wCucC4uwSLNE3KXZH0bEgwAW8ToirV45q6+hogkyF91GUgLi85ZDF/IF3
         5ouE0QmHsBgXhQhxoeqgZ6/+oDDFUlG9g67rDEB9iKjJdODeBgTaxd5ST59f0xE/c9lo
         IgPeOfihNp0BTxMkMncX/TBFV0uNAU06d/sTXj6bPZxKcrCXGC8RNe4xf4wGK7fC03rN
         jtVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=kLudMn4JyTZiBhnPslBShyQC8ViDH7jidoKTxFl4ngU=;
        b=nykBHF2GwYe6rLkszsTwC+FrIVTPLOdAOADORXRPJV0Ju75lYu2bAbldGi1lli8j6N
         ysn2s5GywYJSgH9gMOdNCHQE0K7XXXC+JOlCQFDXK6t+Zwxvw0bIRUU9i7rz9SKYZl4q
         T03kCyJsA4jr1DOOR0ZUXloBrRGuOQq/wzcuk2y/tIMN1kBWE5jcXgY9sWzPnJQGtPJj
         nVw1UDnWLmZuhXJu9mflHqUs6SrIlzbtsanue0YhQ5p0q3WxNm0RV7LAlmKFL9XZ/FBi
         gBclcoUMux/dkczmg94tg/7NLwyMpOCIxL9Q4xRY7qOaIu/viav/0CM+ph0qRIlBFxD+
         nE2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2si1616260qkn.286.2020.01.10.10.02.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 10:02:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipycA-0007mN-N1
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 13:02:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51040)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Jeff.Kubascik@dornerworks.com>) id 1ipyc1-0007jr-5h
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 13:02:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Jeff.Kubascik@dornerworks.com>) id 1ipybz-0005rb-Up
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 13:02:21 -0500
Received: from mail.dornerworks.com ([12.207.209.150]:34882
 helo=webmail.dornerworks.com) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <Jeff.Kubascik@dornerworks.com>)
 id 1ipybz-0005iE-Q1; Fri, 10 Jan 2020 13:02:19 -0500
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: [PATCH] target/arm: adjust program counter for wfi exception in
 AArch32
Date: Fri, 10 Jan 2020 13:02:11 -0500
Message-ID: <20200110180211.29025-1-jeff.kubascik@dornerworks.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.27.13.179]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 12.207.209.150
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 56VfOGX1Uv6u

The wfi instruction can be configured to be trapped by a higher exception
level, such as the EL2 hypervisor. When the instruction is trapped, the
program counter should contain the address of the wfi instruction that
caused the exception. The program counter is adjusted for this in the wfi op
helper function.

However, this correction is done to env->pc, which only applies to AArch64
mode. For AArch32, the program counter is stored in env->regs[15]. This
adds an if-else statement to modify the correct program counter location
based on the the current CPU mode.

Signed-off-by: Jeff Kubascik <jeff.kubascik@dornerworks.com>
---
Hello,

I am using the ARMv8 version of QEMU to run the Xen hypervisor with a guest
virtual machine compiled for AArch32/Thumb code. I have noticed that when
the AArch32 guest VM executes the wfi instruction, the hypervisor trap of
the wfi instruction sees the program counter contain the address of the
instruction following the wfi. This does not occur for an AARch64 guest VM;
in this case, the program counter contains the address of the wfi
instruction. I am confident the correct behavior in both cases is for the
program counter to contain the address of the wfi instruction, as this works
on actual hardware (Xilinx Zynq UltraScale+ MPSoC).

I have tested the above patch and it works for Xen with both an AArch64
guest (Linux) and an AArch32 guest (RTEMS). I'm still getting accustomed to
the QEMU code base, so it may not be correct. Any feedback would be greatly
appreciated.

Sincerely,
Jeff Kubascik
---
 target/arm/op_helper.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index e5a346cb87..7295645854 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -295,7 +295,11 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
     }
 
     if (target_el) {
-        env->pc -= insn_len;
+        if (env->aarch64)
+            env->pc -= insn_len;
+        else
+            env->regs[15] -= insn_len;
+
         raise_exception(env, EXCP_UDEF, syn_wfx(1, 0xe, 0, insn_len == 2),
                         target_el);
     }
-- 
2.17.1

