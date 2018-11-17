Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp623966wrw;
        Sat, 17 Nov 2018 08:06:07 -0800 (PST)
X-Google-Smtp-Source: AJdET5cVBBpqTHJOjQ3YAmCD4QqXcvMcsqfO3ZRvYZHlBPB1JeUCvMQPTIPN7cDkYxZy7LlqS4+P
X-Received: by 2002:a37:18e5:: with SMTP id 98mr14773042qky.333.1542470767465;
        Sat, 17 Nov 2018 08:06:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542470767; cv=none;
        d=google.com; s=arc-20160816;
        b=hex6R9d11GWbYynGNm78txLzfwxLXoKj+VoYcJbVGBFDFTSX44VxtcsdrSdjuRVwyk
         B6TjYR6fJ3Gb9//t/cr/rdsKy/1FeonqvyPNrkpCTdY3JYtpomtVaqbxGDtO55oMMrI+
         TcGlQw7f5J79FZdRe+JX0Y5Hl9Yy6Aca/kN3V2sFsZZ4+6PIxmevWzIpz+wm+OYVCT3W
         cCmXnYXjTnCUZUL3krqkHmsRP4HhboeO/nZ/1aI/u4akC8ze7dVXjuw/XP4xlyhZ6/AT
         BdXXiawXDP6hfdS55u/NFJbU7KT4qbfisSAM02mY87HnTICcIg3/plF6AtWmQVNd+7MI
         bOMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:dkim-signature:dkim-signature;
        bh=bs0DmEh7fGXt4/wA4so/UDyoHX7RL/ZRJuNeR/zGOPU=;
        b=eTI3eiN97k14dzpTbiQcf7UD1qLStJvCf6evuYgOt6t2BYmikugqwKUfvJebQ9ziC9
         kL6PVO1NMTKNB1xhOaFhPcUmVBE5jACkdp9+LiQ4Fsbo+Zl4WEohPy6hN1nGd7nWuE2F
         tvmQXyOfFPQBxGYvfngS80xvFppTAlU8FtNJH9TTLZBliJtH0AZBJaZd4DWlro1RD/7J
         esn/q2YaHdZ47UnH7JBRmJddob3FIsBKTk+pohIR1K1llZ6dUmE635byvP8ySuNHHSpE
         8wp4okF5cou7VVNvrt986ejhBUHkI723jd5RYjAQql4mSXsGQCO+iONWxCsmvMjoSX5S
         Kg7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Rd56CaRQ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="SLKWS/sy";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="SLKWS/sy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q31si6312416qtj.66.2018.11.17.08.06.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Nov 2018 08:06:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Rd56CaRQ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="SLKWS/sy";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="SLKWS/sy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49739 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gO36k-0003oM-Sp
	for alex.bennee@linaro.org; Sat, 17 Nov 2018 11:06:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gO33c-0001ka-Il
	for qemu-arm@nongnu.org; Sat, 17 Nov 2018 11:02:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gO33Z-00044Z-8x
	for qemu-arm@nongnu.org; Sat, 17 Nov 2018 11:02:52 -0500
Received: from greensocs.com ([193.104.36.180]:33677)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gO33Y-000441-T3; Sat, 17 Nov 2018 11:02:49 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 9B147556F9;
	Sat, 17 Nov 2018 17:02:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542470558;
	bh=9/+C8EhFGlAA+gk0k5h3+3ilqnF7Jrv6IXT4uwu9wiE=;
	h=From:To:Cc:Subject:Date;
	b=Rd56CaRQpYqKZu1syxlTv+iRl8c1vaJzmqEAYm69VycalcMZcOvytpfbkXJ0fy0Fy
	56XGzVSavQ77RhZVH8bDMpOOJ+Wxm4LPWEBgcS1QxizBUH5m1FbLjD93oG6uX+HdHf
	F/qVZBIROLUJCUkMzqxiqPWfLMp87i729VG9wrd8=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=SLKWS/sy;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=SLKWS/sy
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Darx9NIDvAbF; Sat, 17 Nov 2018 17:02:37 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 9F2916FD8D; Sat, 17 Nov 2018 17:02:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542470557;
	bh=9/+C8EhFGlAA+gk0k5h3+3ilqnF7Jrv6IXT4uwu9wiE=;
	h=From:To:Cc:Subject:Date;
	b=SLKWS/syuSyVkkkkGiQZZ3wPPUoU6cztiu1rOJFwLOzyKh/qhgQDrB7ivKrXHl7Of
	1BUilMnck6L1sAZflfyploUuOzUWLbbjmqL+RJMCmEay8ruDSLtWfqvGJ7sGiPGStf
	tAX8aVW7FYWKFRN6bERZMGya6L9GrFpxpqIQ3XXk=
Received: from michell-laptop.hive.antfield.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 3F2D0556F9;
	Sat, 17 Nov 2018 17:02:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542470557;
	bh=9/+C8EhFGlAA+gk0k5h3+3ilqnF7Jrv6IXT4uwu9wiE=;
	h=From:To:Cc:Subject:Date;
	b=SLKWS/syuSyVkkkkGiQZZ3wPPUoU6cztiu1rOJFwLOzyKh/qhgQDrB7ivKrXHl7Of
	1BUilMnck6L1sAZflfyploUuOzUWLbbjmqL+RJMCmEay8ruDSLtWfqvGJ7sGiPGStf
	tAX8aVW7FYWKFRN6bERZMGya6L9GrFpxpqIQ3XXk=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 17 Nov 2018 17:02:13 +0100
Message-Id: <20181117160213.18995-1-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH] target/arm: fix smc incorrectly trapping to EL3
 when secure is off
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /OXpxCphw84N

This commit fixes a case where the CPU would try to go to EL3 when
executing an smc instruction, even though ARM_FEATURE_EL3 is false. This
case is raised when the PSCI conduit is set to smc, but the smc
instruction does not lead to a valid PSCI call.

QEMU crashes with an assertion failure latter on because of incoherent
mmu_idx.

This commit refactors the pre_smc helper by enumerating all the possible
way of handling an scm instruction, and covering the previously missing
case leading to the crash.

The following minimal test would crash before this commit:

.global _start
    .text
_start:
    ldr x0, =3D0xdeadbeef  ; invalid PSCI call
    smc #0

run with the following command line:

aarch64-linux-gnu-gcc -nostdinc -nostdlib -Wl,-Ttext=3D40000000 \
                      -o test test.s

qemu-system-aarch64 -M virt,virtualization=3Don,secure=3Doff \
                    -cpu cortex-a57 -kernel test

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 target/arm/op_helper.c | 54 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index eb6fb82fb8..0d6e89e474 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -937,43 +937,81 @@ void HELPER(pre_hvc)(CPUARMState *env)
 void HELPER(pre_smc)(CPUARMState *env, uint32_t syndrome)
 {
     ARMCPU *cpu =3D arm_env_get_cpu(env);
     int cur_el =3D arm_current_el(env);
     bool secure =3D arm_is_secure(env);
-    bool smd =3D env->cp15.scr_el3 & SCR_SMD;
+    bool smd_flag =3D env->cp15.scr_el3 & SCR_SMD;
+
+    /*
+     * SMC behaviour is summarized in the following table.
+     * This helper handles the "Trap to EL2" and "Undef insn" cases.
+     * The "Trap to EL3" and "PSCI call" cases are handled in the except=
ion
+     * helper.
+     *
+     *  -> ARM_FEATURE_EL3 and !SMD
+     *                           HCR_TSC && NS EL1   !HCR_TSC || !NS EL1
+     *
+     *  Conduit SMC, valid call  Trap to EL2         PSCI Call
+     *  Conduit SMC, inval call  Trap to EL2         Trap to EL3
+     *  Conduit not SMC          Trap to EL2         Trap to EL3
+     *
+     *
+     *  -> ARM_FEATURE_EL3 and SMD
+     *                           HCR_TSC && NS EL1   !HCR_TSC || !NS EL1
+     *
+     *  Conduit SMC, valid call  Trap to EL2         PSCI Call
+     *  Conduit SMC, inval call  Trap to EL2         Undef insn
+     *  Conduit not SMC          Trap to EL2         Undef insn
+     *
+     *
+     *  -> !ARM_FEATURE_EL3
+     *                           HCR_TSC && NS EL1   !HCR_TSC || !NS EL1
+     *
+     *  Conduit SMC, valid call  Trap to EL2         PSCI Call
+     *  Conduit SMC, inval call  Trap to EL2         Undef insn
+     *  Conduit not SMC          Undef insn          Undef insn
+     */
+
     /* On ARMv8 with EL3 AArch64, SMD applies to both S and NS state.
      * On ARMv8 with EL3 AArch32, or ARMv7 with the Virtualization
      *  extensions, SMD only applies to NS state.
      * On ARMv7 without the Virtualization extensions, the SMD bit
      * doesn't exist, but we forbid the guest to set it to 1 in scr_writ=
e(),
      * so we need not special case this here.
      */
-    bool undef =3D arm_feature(env, ARM_FEATURE_AARCH64) ? smd : smd && =
!secure;
+    bool smd =3D arm_feature(env, ARM_FEATURE_AARCH64) ? smd_flag
+                                                     : smd_flag && !secu=
re;
=20
     if (!arm_feature(env, ARM_FEATURE_EL3) &&
         cpu->psci_conduit !=3D QEMU_PSCI_CONDUIT_SMC) {
         /* If we have no EL3 then SMC always UNDEFs and can't be
          * trapped to EL2. PSCI-via-SMC is a sort of ersatz EL3
          * firmware within QEMU, and we want an EL2 guest to be able
          * to forbid its EL1 from making PSCI calls into QEMU's
          * "firmware" via HCR.TSC, so for these purposes treat
          * PSCI-via-SMC as implying an EL3.
+         * This handles the very last line of the previous table.
          */
-        undef =3D true;
-    } else if (!secure && cur_el =3D=3D 1 && (env->cp15.hcr_el2 & HCR_TS=
C)) {
+        raise_exception(env, EXCP_UDEF, syn_uncategorized(),
+                        exception_target_el(env));
+    }
+
+    if (!secure && cur_el =3D=3D 1 && (env->cp15.hcr_el2 & HCR_TSC)) {
         /* In NS EL1, HCR controlled routing to EL2 has priority over SM=
D.
          * We also want an EL2 guest to be able to forbid its EL1 from
          * making PSCI calls into QEMU's "firmware" via HCR.TSC.
+         * This handles all the "Trap to EL2" cases of the previous tabl=
e.
          */
         raise_exception(env, EXCP_HYP_TRAP, syndrome, 2);
     }
=20
-    /* If PSCI is enabled and this looks like a valid PSCI call then
-     * suppress the UNDEF -- we'll catch the SMC exception and
-     * implement the PSCI call behaviour there.
+    /* Catch the two remaining "Undef insn" cases of the previous table:
+     *    - PSCI conduit is SMC but we don't have a valid PCSI call,
+     *    - We don't have EL3 or SMD is set.
      */
-    if (undef && !arm_is_psci_call(cpu, EXCP_SMC)) {
+    if (!arm_is_psci_call(cpu, EXCP_SMC) &&
+        (smd || !arm_feature(env, ARM_FEATURE_EL3))) {
         raise_exception(env, EXCP_UDEF, syn_uncategorized(),
                         exception_target_el(env));
     }
 }
=20
--=20
2.19.1

