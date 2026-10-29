Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5C0606A31D
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 16:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cL2JnN6I
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMSlD-0005p4-7Q; Thu, 29 Oct 2026 12:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xMSko-0005e8-UF
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:13:26 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xMSkk-0000Y9-1C
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:13:26 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-48e04773687so947177f8f.2
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 09:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793290397; x=1793895197; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=yNUYKhaF5H3g5eksgQQV46oOh6IBPKeBXaamkf/sgO8=;
 b=cL2JnN6INGgFZnPT9wguGQAz6Udm799y/14NioX05P7QdtpxjEHezhPASTrk15viFh
 qs2tTONGWf2H26Y+HKZRtZ0bAezc97IKM8yMGqKbW2oHh8A5UJA6qxGv2TqYpoOJlukp
 QkdFyESyvlzdjZrqXjoMqV5gLLIK2CjS1eFqKyNEAcDfWvlSeWhEdz2qHbvgQMj/Cn0Q
 YEkhORTdOOfnfQCcRgeeLQwQRg80guNhYkL0lkYAnhjumTXDFGdoOxUUj0QjVPd73gby
 lS248evpa8pqIJ8Dyxi1BXlEiWpo4kafTqOnKLhPAUsgQC++H7ehmGCG2QVQbe9sczAv
 wNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793290397; x=1793895197;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yNUYKhaF5H3g5eksgQQV46oOh6IBPKeBXaamkf/sgO8=;
 b=RwBX7RQFSXwkysd981ZKuSy3jWd56dg/jYYR7cff4bM05wNOIFaZT6Yc0jWHiS6JzA
 SCa6tj98odunrKl6qMpIq1be2TWnusmZ1Ly4gcEOvMlDaxTAvf53N99mQYp8JaP2BCk3
 l6qn3/iU0aI5y0LpOZm/9sE7HX8bPn1IFKKp15qc+n/wLy+0Zgq0oOTUJ7biO9xsVMGj
 6b0R5i5ahUopplvo4FxT2kWmhLPwChiULeNRNPkmlwz9q2aLSlLvzelHZLql3zP7hINB
 NCRiqAx63s3Kt1vzYBjBan5BMW12Ayx1fbGs/jVNm3BTveMdWPIL0BxeLf80R/PcpOBZ
 TgTA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzVoPw+lvxZZ1sRQY2L1cvmm4C4QqEUc543lkTyuh7IHz1dlUDAFc9glHQpHvVJ8DXeCBs3eNzzeQ==@nongnu.org
X-Gm-Message-State: AFq9FYJGoCwwewnw1zLF2iECPNnU6iBYF8jc6/yj/ihj5OSdzEEQMvnk
 1d7QWyh53E85Cq2p8Nf2+Qsn8wFODoF34y3ZUchw5oryRUHqVrmSpJuFX+u8xTOVINU=
X-Gm-Gg: AYBFou3Q71LYL70iC0Nti1BAU8yOp8xzPKKiO9hM9jqPE6dPG/Tc0EMZelOr3NDnAFj
 N5xK3//v761/Qo+/Byjtw/NRraf1rAmHESKGyWdeycutu3tXt9yhmoS1p6ZAouNr4QTbj8xZHCG
 BqeDkdgYZpBE9stUlzCRoJtA2GZVpClIwOhVYUpVYOeYhDMh5me4ILPvzxGRux7MFniDDkH2Qz7
 rBW8PN3VG2+w3aMi6s5JlOmny0uij4DRlVVV4LEshCtdu1jnopIBOhlEF8nA8TZ8iAbfcLuw2iC
 PV1+B9QNb2I0D45M1kdLPQDwtPVc53yVdffe0RXx4l1JdyUhg1wu+a95SIfYq3VMCk4kHCCvJct
 /8IM4Sn3zxb6lchYLTj0Vj7qIbfvE+UD5CinU86V+06+9Evex9nLh8Rpwwl/BEPEDzhDyvlWnQs
 dnBXFzBIAX77Z28k/02xUcvKT2J9O7SGgb+9fxU1prB91vYuwzPwUSd5Py84rH4A9cLoZgIno9z
 p1rSsXvesR8RSG5g6APS4rWh2p6CMBpS9tCocCO+EVWEdJpWN06PrKUZJQU5WWeRVoKFQYclBc9
 VFZ+TtnKMRKcoqN7xUVDNlabj0K4zyyZNtUmlGTuGDRxSJu6xg==
X-Received: by 2002:a05:6000:4919:b0:48d:ff71:dd97 with SMTP id
 ffacd0b85a97d-48e5d319cc9mr13311602f8f.7.1793290397181; 
 Thu, 29 Oct 2026 09:13:17 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e6dfad2f7sm70600f8f.43.2026.10.29.09.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 09:13:14 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A438A5FA91;
 Thu, 29 Oct 2026 16:13:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Chao Liu <chao.liu@processmission.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Hao Wu <wuhaotsh@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 5/8] target/arm: simplify wfxt_timer_cb to only trigger
 cpu_interrupt
Date: Thu, 29 Oct 2026 16:13:07 +0000
Message-ID: <20261029161310.2065290-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029161310.2065290-1-alex.bennee@linaro.org>
References: <20261029161310.2065290-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

HALT_WFE will always be cleared when leaving halt via
arm_cpu_leaving_halt so we don't need to worry about atomic games in
the asynchronous timer callback. Furthermore, a WFET timeout or
event-stream expiration is not an event that sets the event register;
doing so causes a subsequent WFE to wake up immediately.

As we only need CPUState to call cpu_interrupt we can also simplify
the user data and avoid needless casting to get to it.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Fixes: 01b223f895a7 ("target/arm: enable WFE sleeping for A-profile")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 510fc9eeb3b..c690e2c8937 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -885,26 +885,12 @@ static void arm_cpu_leaving_halt(CPUState *cs)
 }
 #endif
 
-/*
- * Unlike almost everything else that messes with the halt_reason and
- * event_register details the timer callbacks are not in the vCPU
- * context.
- *
- * To prevent races we atomically consume a HALT_WFE and set the event
- * register. Either way we trigger the an exit event.
- */
 static void arm_wfxt_timer_cb(void *opaque)
 {
-    ARMCPU *cpu = opaque;
-    CPUState *cs = CPU(cpu);
-    CPUARMState *env = &cpu->env;
-
-    if (qatomic_cmpxchg(&env->halt_reason, HALT_WFE, NOT_HALTED)) {
-        qatomic_set(&env->event_register, true);
-    }
+    CPUState *cs = opaque;
 
     /*
-     * We expect the CPU to be halted; this will cause arm_cpu_is_work()
+     * We expect the CPU to be halted; this will cause arm_cpu_has_work()
      * to return true (so we will come out of halt even with no other
      * pending interrupt), and the TCG accelerator's cpu_exec_interrupt()
      * function auto-clears the CPU_INTERRUPT_EXITTB flag for us.
@@ -2302,7 +2288,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
      */
     if (tcg_enabled() && arm_feature(env, ARM_FEATURE_V6K)) {
         cpu->wfxt_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                       arm_wfxt_timer_cb, cpu);
+                                       arm_wfxt_timer_cb, cs);
     }
 #endif
 
-- 
2.47.3


