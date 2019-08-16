Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp769609wrs;
        Fri, 16 Aug 2019 05:58:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw4TDDXQDZllsMKamQYczmlhvfYO3vxOanPQDBmdLxZru6b1oRuHZBjhzhUnPdXa8VPAbSc
X-Received: by 2002:a17:906:e10b:: with SMTP id gj11mr9107942ejb.138.1565960321603;
        Fri, 16 Aug 2019 05:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565960321; cv=none;
        d=google.com; s=arc-20160816;
        b=s+eqxEY3YeAVaSKCdyzQZsi/HRuAtdMVLg7rzqVfs2TIesb9sG6lnymHh6IyVa+9jT
         ewEHl+OqenmPEXviLO50cybRpXMIGL3XCqJgyc5VTxmniQrbnVdZ5m++CBIa8E6EmC5v
         BgJi/8w7ykuMVO8YVmIRPXNboS+SZBZsQsJu2ltI79o8wRV5sFKsgLFwjRcsOkmpHxS2
         TXF0/6ylxh0TKdFdaAGyvotyVtXnDKqaZ98AZ2RuP5s+s4V5s9dzjOD9O6T4KMUAYvxL
         vPmlt2RzuXRrYxAv4f/pV/fEujK0BCNXD0cGHAPnQC3BNXB233DoNRKLjJ7vFVLIKuFZ
         YNBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=kiHYxixAH+hnIg9DQ+VKLaTdfWcHEjePhgVIqnM4T2g=;
        b=tYDqZ7aESb88eHe/pW2+1itc36l4BWTkGVRMUgh5n8Z3dPS06jr0dYtmjsEseHvqnA
         KWjQJODUbliaGKxIR4gQBh1Mp12k89TvarqW77fh2HiyFbxUpN1aluR2xHjuHKopQ6jA
         3+xZWCR+Ch/Tqke5ANER/1A2pG9Q98aATdywNxCnxESfLEXyiYubkNXrta0CeIzEGrM4
         uPaVdsg9jYre7TftfD/Pd07qFiX/7BD9hUx17gUVj4zC/szXLVJE4fouWhhjaLN2KvP5
         h33zaGd25EyzSCJbdStMwrEZCqA9B6BwFeMZqSHedifqHXkLh3+eJxaQSTX/qdK41976
         zxpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cK6JxAMP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4si3397924edf.366.2019.08.16.05.58.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 05:58:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cK6JxAMP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyboW-0006PB-66
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 08:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60924)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1hybo1-0005yO-2l
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 08:58:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hybnz-0000Ln-Iq
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 08:58:08 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45552)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hybnz-0000Kt-D0
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 08:58:07 -0400
Received: by mail-wr1-x444.google.com with SMTP id q12so1445193wrj.12
 for <qemu-arm@nongnu.org>; Fri, 16 Aug 2019 05:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kiHYxixAH+hnIg9DQ+VKLaTdfWcHEjePhgVIqnM4T2g=;
 b=cK6JxAMPmhtLCGGXFI5/HleR0DoMx/pe8kfq3ZVwcrXmxKpJjFW7FnoRoqDIgbCd7D
 0R3o/IkUbIrhdxmE4qzXHdgnYKxPyp6hueC23cAVx+dr+lDUbUbxEsF8wc6Cd+tiaH+5
 tsWTqGkRjk4Go9rG3NH6RhDnrG1AKGSDADHZAm31NYAMQLcov/Qviof6jZdwrUF6ZKYv
 YWQQE8mhyoZDKCkXNs/IuqN3+D4AS/rw1QXupeBbESymC9zLbi8NkY1EvhYzwJZa04EO
 WpXHAenQv60qr2GsHEbnM6Mw3feR71C1AEjnbMfYSucao5YxBfFAmVsmX9WqujOBj1yf
 670g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kiHYxixAH+hnIg9DQ+VKLaTdfWcHEjePhgVIqnM4T2g=;
 b=roWyQGDZXkOLgGQvvnByFAJiDAN3ZxEZz71PzkOZ0OWNACORRh3QFZYtXcPwdieezh
 uXpmzBPdw5g667WEM4r4ytbhrmABthSEX1vp6iJjD9a0ZRpnEQYWFIzaQ5CgXZ5oe2lH
 pRWy47NZ6BvBOwJ7wa3dM+x383iNHtY5O09VjsC10YzGzO4aIB0uQ7q2pVlP7IU/4qJn
 LSVkdqyS2A9frzu7OO3Jb1PEjpDSznFgTobCzpLymTUzO+2+fgtEd44aJzooZhqTBBas
 4yS7nW/GXoZyUAVYRsIw8rZ7VonDZ5kLfNrnpYbjRPlHo2dt/uDaZ7ejwN0smiqY+L1t
 heJQ==
X-Gm-Message-State: APjAAAWT70Qg1Mng1DnQuBtik6+3VFU1MwnG/WsVkz0JgpPaJ/wDafh0
 lEps1/SjiQtC39X4PqE3R3qk2C6ryhtACA==
X-Received: by 2002:adf:e708:: with SMTP id c8mr11046060wrm.25.1565960286137; 
 Fri, 16 Aug 2019 05:58:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a19sm17594348wra.2.2019.08.16.05.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 05:58:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 16 Aug 2019 13:58:01 +0100
Message-Id: <20190816125802.25877-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190816125802.25877-1-peter.maydell@linaro.org>
References: <20190816125802.25877-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH 1/2] target/arm: Allow ARMCPRegInfo read/write
 functions to throw exceptions
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
X-TUID: igJvpy5WSFBs

Currently the only part of an ARMCPRegInfo which is allowed to cause
a CPU exception is the access function, which returns a value indicating
that some flavour of UNDEF should be generated.

For the ATS system instructions, we would like to conditionally
generate exceptions as part of the writefn, because some faults
during the page table walk (like external aborts) should cause
an exception to be raised rather than returning a value.

There are several ways we could do this:
 * plumb the GETPC() value from the top level set_cp_reg/get_cp_reg
   helper functions through into the readfn and writefn hooks
 * add extra readfn_with_ra/writefn_with_ra hooks that take the GETPC()
   value
 * require the ATS instructions to provide a dummy accessfn,
   which serves no purpose except to cause the code generation
   to emit TCG ops to sync the CPU state
 * add an ARM_CP_ flag to mark the ARMCPRegInfo as possibly
   throwing an exception in its read/write hooks, and make the
   codegen sync the CPU state before calling the hooks if the
   flag is set

This patch opts for the last of these, as it is fairly simple
to implement and doesn't require invasive changes like updating
the readfn/writefn hook function prototype signature.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           | 6 +++++-
 target/arm/translate-a64.c | 6 ++++++
 target/arm/translate.c     | 7 +++++++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 94c990cddbd..021b552334b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2206,6 +2206,9 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
  * IO indicates that this register does I/O and therefore its accesses
  * need to be surrounded by gen_io_start()/gen_io_end(). In particular,
  * registers which implement clocks or timers require this.
+ * RAISES_EXC is for when the read or write hook might raise an exception;
+ * the generated code will synchronize the CPU state before calling the hook
+ * so that it is safe for the hook to call raise_exception().
  */
 #define ARM_CP_SPECIAL           0x0001
 #define ARM_CP_CONST             0x0002
@@ -2224,10 +2227,11 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
 #define ARM_CP_FPU               0x1000
 #define ARM_CP_SVE               0x2000
 #define ARM_CP_NO_GDB            0x4000
+#define ARM_CP_RAISES_EXC        0x8000
 /* Used only as a terminator for ARMCPRegInfo lists */
 #define ARM_CP_SENTINEL          0xffff
 /* Mask of only the flag bits in a type field */
-#define ARM_CP_FLAG_MASK         0x70ff
+#define ARM_CP_FLAG_MASK         0xf0ff
 
 /* Valid values for ARMCPRegInfo state field, indicating which of
  * the AArch32 and AArch64 execution states this register is visible in.
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d3231477a27..908a186bfec 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1729,6 +1729,12 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         tcg_temp_free_ptr(tmpptr);
         tcg_temp_free_i32(tcg_syn);
         tcg_temp_free_i32(tcg_isread);
+    } else if (ri->type & ARM_CP_RAISES_EXC) {
+        /*
+         * The readfn or writefn might raise an exception;
+         * synchronize the CPU state in case it does.
+         */
+        gen_a64_set_pc_im(s->pc - 4);
     }
 
     /* Handle special cases first */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7853462b21b..da38e15be8d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7228,6 +7228,13 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
             tcg_temp_free_ptr(tmpptr);
             tcg_temp_free_i32(tcg_syn);
             tcg_temp_free_i32(tcg_isread);
+        } else if (ri->type & ARM_CP_RAISES_EXC) {
+            /*
+             * The readfn or writefn might raise an exception;
+             * synchronize the CPU state in case it does.
+             */
+            gen_set_condexec(s);
+            gen_set_pc_im(s, s->pc - 4);
         }
 
         /* Handle special cases first */
-- 
2.20.1

