Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2787027wrg;
        Mon, 17 Jun 2019 10:56:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwM5Ps31b805p7wd6LbXB9n6zyrKl/jnFLHj4MAIroHBA5lLqcF2vLAAMx33SxX+fqEPIop
X-Received: by 2002:ac2:418f:: with SMTP id z15mr26885883lfh.177.1560794162694;
        Mon, 17 Jun 2019 10:56:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560794162; cv=none;
        d=google.com; s=arc-20160816;
        b=ZQrS4pnAtI8pTMx49gD8T/u555ZaU+NGfz5KBthYtTcsbvFU104E6GJGp67AGgB7Us
         P3a9f9p0w7Dwe6VGQB2hj6e4Ljum3rDg2vy3YnNqRLFxvIDHy1dXO1SolO3w3He7kOgR
         TWrneIZGabZAMI6ejqX5LxPIpDkkjI/uJp/wUbeIfWV3TYTgP48Pmb+iv7Y647iWATma
         ub5xgQHAyybd5hfRdLkCVqtrQ2MPkYeo7wgxgyJw3AakcvCgVImB3hoj0XDsOX9ypHeb
         Lv7pYsLGfQSpmCRW6GyxiC9Sbckz1ZrZkTj/VIIEsBAVaZoT3FHgN5sL/FLBWb1eaeMY
         k/IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=zKgJAfwPo8FOYTHjapPuTGTNS3c99ejdEGatbxYgWDQ=;
        b=PRbtGZOHKUopdEP7PTezh6r8OZYh0Lbc9KOeUPBZ/SNNrsojsBR+cBSqDNTxnHkI+i
         XQ2vBiAGfEstPcdwwtlGtkvsgIOjkyLSVDnbLlyXlKIle2KrG4CSnUiue3kPduCIKV4d
         Omw0292mU96YUrurHCc3zCnfVwA/072gX9We8VeY1kc0sPTmZdyWpvRQ3kyTaniVs3Bs
         KfTxmGCK4YoaX6AAikby+JmlpI8cev8SOmm1VrfGWy8074nK9wUHJwuA2H+pa6ot0N74
         U9VOLMUVZfhZzirqpADgvF71j8cMhRO5lSx7IjEt9+Rs8LMT/beFabogUafTUpAHecza
         1DAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xUCOyFhe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9si3113092ejm.224.2019.06.17.10.56.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 10:56:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xUCOyFhe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50664 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcvrN-0003Kr-ND
	for alex.bennee@linaro.org; Mon, 17 Jun 2019 13:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50788)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hcvp1-0007iT-Ou
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 13:53:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hcvp0-0000gN-1W
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 13:53:35 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:39457)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hcvox-0000eP-SW
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 13:53:33 -0400
Received: by mail-wm1-x344.google.com with SMTP id z23so305658wma.4
 for <qemu-arm@nongnu.org>; Mon, 17 Jun 2019 10:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zKgJAfwPo8FOYTHjapPuTGTNS3c99ejdEGatbxYgWDQ=;
 b=xUCOyFhemrpJA+/iI2WRVZ2yl1on1d11KGVAusGcu+jFM1tubF2R0lZnSu9OYt39ML
 ywYiqPlVQDh5aG6EeZPUVakYpUpsck5ZePwRTDzuG1mHZMTF01owgQ8/OucjwlUOPVWv
 4wbddUAlu4RkwoLOuZMjSNAj6NE030fyMgomAT727nXYbdcphl6GLxeh+0vtCDkFRyzG
 JHJ+qhbdCYVjbISs6diRyfDOWAy1popaLjovZTclhZe8HERkTx757tNdnfrRUA4f3rjs
 qAO6+ViHOr7An63iXBEFIk/WSIIaR6VTNB22LoV8e741wCIYv/KpMnABVfhGkmgI3pUN
 saTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zKgJAfwPo8FOYTHjapPuTGTNS3c99ejdEGatbxYgWDQ=;
 b=HZ9ncAwdYorXHy5lQZmBcqj9Z8zwh/6t7kpC7xxeOOwBfcM4gEQVrU6Fap9PrrKx2p
 pirC8GV0dhkio/Blq038TV6NeTeUoynt20Qym3YaNShM2hjyvgJlJTTS2G89JVdMijyD
 vL/DulHc96n5Atdg8sP+BeAGmJGSRP6lFjfg92fPyNd5vIJ/QrpcNZ7z7TLK0YsMFvAV
 30awNQxrWuMMzPoCnR/RnE7y8mKp14XtvFS4YkpHJwE0AtNXhgFSEvOHC7SKmgFvO2fH
 EjTUsmBGqOhywQZuMSwx9Zo95ybdQSSnyRam+Q617gBokxa81GZtJgVsC3vv3umwq2LF
 bZng==
X-Gm-Message-State: APjAAAV4OoxgYmMCCPi/+s9iqgBKVpCunVfx3zYueAoXpHhUwwdqZqwT
 iRoI87K4VbCtKgUyhCwP+fgdw0lpvuosaQ==
X-Received: by 2002:a1c:e0c4:: with SMTP id
 x187mr19004489wmg.177.1560794006206; 
 Mon, 17 Jun 2019 10:53:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t14sm8713619wrr.33.2019.06.17.10.53.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 10:53:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 17 Jun 2019 18:53:15 +0100
Message-Id: <20190617175317.27557-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617175317.27557-1-peter.maydell@linaro.org>
References: <20190617175317.27557-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-arm] [PATCH 4/6] target/arm: Use _ra versions of
 cpu_stl_data() in v7M helpers
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
X-TUID: 1RfAFLgJuPy3

In the various helper functions for v7M/v8M instructions, use
the _ra versions of cpu_stl_data() and friends. Otherwise we
may get wrong behaviour or an assert() due to not being able
to locate the TB if there is an exception on the memory access
or if it performs an IO operation when in icount mode.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 375249d3c72..866fe54780e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8141,8 +8141,8 @@ void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
     }
 
     /* Note that these stores can throw exceptions on MPU faults */
-    cpu_stl_data(env, sp, nextinst);
-    cpu_stl_data(env, sp + 4, saved_psr);
+    cpu_stl_data_ra(env, sp, nextinst, GETPC());
+    cpu_stl_data_ra(env, sp + 4, saved_psr, GETPC());
 
     env->regs[13] = sp;
     env->regs[14] = 0xfeffffff;
@@ -8557,6 +8557,7 @@ void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
     /* fptr is the value of Rn, the frame pointer we store the FP regs to */
     bool s = env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
     bool lspact = env->v7m.fpccr[s] & R_V7M_FPCCR_LSPACT_MASK;
+    uintptr_t ra = GETPC();
 
     assert(env->v7m.secure);
 
@@ -8582,7 +8583,7 @@ void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
      * Note that we do not use v7m_stack_write() here, because the
      * accesses should not set the FSR bits for stacking errors if they
      * fail. (In pseudocode terms, they are AccType_NORMAL, not AccType_STACK
-     * or AccType_LAZYFP). Faults in cpu_stl_data() will throw exceptions
+     * or AccType_LAZYFP). Faults in cpu_stl_data_ra() will throw exceptions
      * and longjmp out.
      */
     if (!(env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_LSPEN_MASK)) {
@@ -8598,10 +8599,10 @@ void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
             if (i >= 16) {
                 faddr += 8; /* skip the slot for the FPSCR */
             }
-            cpu_stl_data(env, faddr, slo);
-            cpu_stl_data(env, faddr + 4, shi);
+            cpu_stl_data_ra(env, faddr, slo, ra);
+            cpu_stl_data_ra(env, faddr + 4, shi, ra);
         }
-        cpu_stl_data(env, fptr + 0x40, vfp_get_fpscr(env));
+        cpu_stl_data_ra(env, fptr + 0x40, vfp_get_fpscr(env), ra);
 
         /*
          * If TS is 0 then s0 to s15 and FPSCR are UNKNOWN; we choose to
@@ -8622,6 +8623,8 @@ void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
 
 void HELPER(v7m_vlldm)(CPUARMState *env, uint32_t fptr)
 {
+    uintptr_t ra = GETPC();
+
     /* fptr is the value of Rn, the frame pointer we load the FP regs from */
     assert(env->v7m.secure);
 
@@ -8655,13 +8658,13 @@ void HELPER(v7m_vlldm)(CPUARMState *env, uint32_t fptr)
                 faddr += 8; /* skip the slot for the FPSCR */
             }
 
-            slo = cpu_ldl_data(env, faddr);
-            shi = cpu_ldl_data(env, faddr + 4);
+            slo = cpu_ldl_data_ra(env, faddr, ra);
+            shi = cpu_ldl_data_ra(env, faddr + 4, ra);
 
             dn = (uint64_t) shi << 32 | slo;
             *aa32_vfp_dreg(env, i / 2) = dn;
         }
-        fpscr = cpu_ldl_data(env, fptr + 0x40);
+        fpscr = cpu_ldl_data_ra(env, fptr + 0x40, ra);
         vfp_set_fpscr(env, fpscr);
     }
 
-- 
2.20.1

