Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4307102lff;
        Mon, 13 Jan 2020 08:01:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqzOurDG7xWXVQzYDhXAgkLHhL81YKy97uOGxfyDsRU31qJCkYRJut3x1JBI3e/RuSTwcvFd
X-Received: by 2002:adf:ffc5:: with SMTP id x5mr19513652wrs.92.1578931304016;
        Mon, 13 Jan 2020 08:01:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578931304; cv=none;
        d=google.com; s=arc-20160816;
        b=Cd6B7htjpfdccjygswc3tePV9XEMysuE4x8gOTSafT4/DxM7w9Mxx8xs8uobro1FqB
         EGdUh3GUbq8tMr+QD9Nh0qQQoUvrfjLI6sEFnvKK5w6+MC1D7hEGAF6Fm0VSHduGb9ep
         FmRRvFezjwrwQMScBzpKWWzItDyxQ405Xnlj7tPi8N8hNHLPg/ofmvj7lZZXHUO/5PUE
         G0b6Nvf4iqQMV0sfF8AWdFieFyirjFBYYkzsBep9pAKtJNsMGMC/AEspDP01CeJIQjUE
         OU59XwLa+KifkRUq5Mz70Xk++BpU4okOMh5E6oV/5aRHUFTlLc+kGnAMhIcYSguB38qK
         2tNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=dSlu2Mp+pjbyPw10tnH35j9HSrr/+ylwZPcEEo644kE=;
        b=VMOWbOxWa5A04qJWnMez2lP/zOF7lboLtFh+SAkQw3wxUO8ff1/peIiwnMAVswz4Zf
         5dlhUvnRf3jmAAda1+R7g/i3sOY7WwqdM3cUWw5lfmbtKFj3/cOF5MxS1ZvpXBk+bVkb
         mNhB540N40rMjS5GRRAFFUCpzLIpZ/I8IHjdABGkBH66ZQd3Hm3Juz6s5v7P2ZwsVsSH
         4T1DEu7KlhFL4CtZ9Yy05u+ZK5jR/DEm5BnXmeZiv6sbU1tDjEF7hNCM+TqmoCQ342Z7
         ojEA2GdnIwupxhwzSxT/5mD407wt0hG8tR8Y9BjDQE8d9+51I7qyZ+IHryqKp642CBR9
         JXhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s24si7630569edx.223.2020.01.13.08.01.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jan 2020 08:01:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ir29u-0007hG-47
	for alex.bennee@linaro.org; Mon, 13 Jan 2020 11:01:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40403)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Jeff.Kubascik@dornerworks.com>) id 1ir280-0005mC-DZ
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 10:59:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Jeff.Kubascik@dornerworks.com>) id 1ir27z-0000zg-3w
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 10:59:44 -0500
Received: from mail.dornerworks.com ([12.207.209.150]:20859
 helo=webmail.dornerworks.com) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <Jeff.Kubascik@dornerworks.com>)
 id 1ir27y-0000vg-W4; Mon, 13 Jan 2020 10:59:43 -0500
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: [PATCH v2] target/arm: adjust program counter for wfi exception in
 AArch32
Date: Mon, 13 Jan 2020 10:59:34 -0500
Message-ID: <20200113155934.97572-1-jeff.kubascik@dornerworks.com>
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
X-TUID: PY9Ln1Km7fi5

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

Changes in v2:
- Added braces {} to if-else statement, per patchew feedback
---
 target/arm/op_helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index e5a346cb87..27d16ad9ad 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -295,7 +295,12 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
     }
 
     if (target_el) {
-        env->pc -= insn_len;
+        if (env->aarch64) {
+            env->pc -= insn_len;
+        } else {
+            env->regs[15] -= insn_len;
+        }
+
         raise_exception(env, EXCP_UDEF, syn_wfx(1, 0xe, 0, insn_len == 2),
                         target_el);
     }
-- 
2.17.1

