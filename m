Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4729620lfb;
        Tue, 17 Nov 2020 07:56:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsGsNArU8AULzjUILDOlU3HDbV+ipCdWXbl4h3zgOBbicRLE4IFya5jJW3TjNjCwms/TnJ
X-Received: by 2002:a25:cf95:: with SMTP id f143mr261539ybg.216.1605628611530;
        Tue, 17 Nov 2020 07:56:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605628611; cv=none;
        d=google.com; s=arc-20160816;
        b=qlG8VNLEBO1WWKw050X6buzy2cyxXsRPuNiVXVXjuAwk7h7XbvWypHygk3vj66WJLw
         ifgAmar2ohJ+sSOOqXq97sMDIg7zOeatqwOAEgYvzVJPm6HhEK/SYVONuIJFiGB/KByo
         Db1v1U0C/VLUBGhry9mK+w6cWEUryaHyX1yKYb7B9/6uBd/SehthbnzOCzW0pMJ0m5Ol
         j/CDXUOj2VRx4OWTFTpUa6Rc+TptQ6Ov7kDUbQALvQpuQUCiBmyhwqvlh0buqLFW5VKz
         hx85G0a5XZqYvR7kcHw/caZ36C3MgJOetE5zQaHDsJebd06T5Aw84AQ/3SQKvbDjR0ao
         OmnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=PbtN+t3/nZ+/wjXy+MgLGmSuQ3MGPFUppcgHnPJ0HW0=;
        b=umX7OdNinqQ6R1XE23chKaTa43GERV8Z6U1Ot+lsBzEeR9w76gbfNCqTmMWp0q7zyQ
         WQVRFglM2xLum+w6rca7nDETNfQX0T8U2QkX6Cb6RdndZEAj2VHFGdmgn2tBmL61KC/p
         ZacntiEoNlmiLHmLCzVvsMcu8wg/+ABU/NdCKE8Fv72q6g6UWgZSQGS+S6mdOUWoQna5
         +46yntcxn8dnITjo0cHa08At30tu/wBTtu9ApdgavzQA9AXET7g6pUW/wnepmoC31zkM
         BEbxsN5YypKynomBqaF1nNyE+irDTnDM/ZdX4HO94hjzx8pO2iVXqpFpPwyvg2ZJ30LT
         B/mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HpsTD+LM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9si20904901ybi.161.2020.11.17.07.56.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2020 07:56:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HpsTD+LM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kf3Le-0005op-TK
	for alex.bennee@linaro.org; Tue, 17 Nov 2020 10:56:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf3LW-0005n0-BA
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 10:56:42 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf3LT-0004aK-5b
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 10:56:42 -0500
Received: by mail-wr1-x443.google.com with SMTP id d12so23642826wrr.13
 for <qemu-arm@nongnu.org>; Tue, 17 Nov 2020 07:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PbtN+t3/nZ+/wjXy+MgLGmSuQ3MGPFUppcgHnPJ0HW0=;
 b=HpsTD+LMjQIGeYyqmzA9sjeQ8x5ixsQLJ16B/EYe6UuQqjfqRhGrp5TdOiuqAgkS3R
 h8N9bChXslK4nQSOI0e5ujfxe5SjJaXWZD3o/O/RQdg+spSK6ExPyJ1iGetJwL8qRJ9E
 u/MlgmRq1X4dkEvNQI8RxxQ/BNiVELYl6NYpvjzmhRmi5u8mrXE0d3B36RcXX8OkK+nc
 sQ5wXuCUAfucTuUbL7lrTI0JZwp85G3NMWGvAuqRgJoDeP8UAWCAntkRpCZNqUrD+z+2
 /xNseuqeRa/hPKJ6Fej8cLecJQU6FsBLICn5Ozd3THUrpitHUUnno6CTUMW2UckCjc2F
 71Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PbtN+t3/nZ+/wjXy+MgLGmSuQ3MGPFUppcgHnPJ0HW0=;
 b=Sx0aEXmeFzpR1k9SdW3SnL2onTWgtCckqixO/++mRtByRFGEnBrCBv646w0FOPe+eL
 HsmpInf24uxfd1FqZcMWSLMq71kiUZFseKdvhJICattFR3oL/9lqhxnNcL1cmA7EJIO4
 T/goyjn7EJxNbuqYPFA9ZSMhlrPkpn/5vuCKYiKhHWpC6aUmYK7vQ87GsCUYx57srfZ8
 I/DxQN7W4qhRdzPxDY9DrFV5u+G/jBlkkhQMQFyG8JbyYoElG7ym5Q8HENbUCaLSy11L
 DESHo+fvy8gFkt5mun2Pbk6EXIMQbT8l/NJk6FsljIt/fGJKXG8+ZGqVCeI98xPnGRDz
 GaJg==
X-Gm-Message-State: AOAM530zoIoxmgxlCw/vk/E8L+snH8cjXAkxEG3cFyi77oAFbT26s+Z7
 MiWVujh4Yf3+Qetp2O4DeuVHU5nELjzFjw==
X-Received: by 2002:a5d:4a50:: with SMTP id v16mr207592wrs.106.1605628596644; 
 Tue, 17 Nov 2020 07:56:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x63sm4464052wmb.48.2020.11.17.07.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 07:56:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] linux-user/arm: Deliver SIGTRAP for UDF patterns used as
 breakpoints
Date: Tue, 17 Nov 2020 15:56:34 +0000
Message-Id: <20201117155634.6924-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YH0Rr7Cr8vhS

The Linux kernel doesn't use the official bkpt insn for breakpoints;
instead it uses three instructions in the guaranteed-to-UNDEF space,
and generates SIGTRAP for these rather than the SIGILL that most
UNDEF insns generate:

https://elixir.bootlin.com/linux/v5.9.8/source/arch/arm/kernel/ptrace.c#L197

Make QEMU treat these insns specially too.  The main benefit of this
is that if you're running a debugger on a guest program that runs
into a GCC __builtin_trap() or LLVM "trap because execution should
never reach here" then you'll get the expected signal rather than a
SIGILL.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is not a "fix" for LP:1904210, but it does bring QEMU's
behaviour into line with that of the real kernel on that binary.

---
 linux-user/arm/cpu_loop.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 13629ee1f6a..3d272b56ef0 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -205,6 +205,24 @@ do_kernel_trap(CPUARMState *env)
     return 0;
 }
 
+static bool insn_is_linux_bkpt(uint32_t opcode, bool is_thumb)
+{
+    /*
+     * Return true if this insn is one of the three magic UDF insns
+     * which the kernel treats as breakpoint insns.
+     */
+    if (!is_thumb) {
+        return (opcode & 0x0fffffff) == 0x07f001f0;
+    } else {
+        /*
+         * Note that we get the two halves of the 32-bit T32 insn
+         * in the opposite order to the value the kernel uses in
+         * its undef_hook struct.
+         */
+        return ((opcode & 0xffff) == 0xde01) || (opcode == 0xa000f7f0);
+    }
+}
+
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
@@ -234,6 +252,16 @@ void cpu_loop(CPUARMState *env)
                 /* FIXME - what to do if get_user() fails? */
                 get_user_code_u32(opcode, env->regs[15], env);
 
+                /*
+                 * The Linux kernel treats some UDF patterns specially
+                 * to use as breakpoints (instead of the architectural
+                 * bkpt insn). These should trigger a SIGTRAP rather
+                 * than SIGILL.
+                 */
+                if (insn_is_linux_bkpt(opcode, env->thumb)) {
+                    goto excp_debug;
+                }
+
                 rc = EmulateAll(opcode, &ts->fpa, env);
                 if (rc == 0) { /* illegal instruction */
                     info.si_signo = TARGET_SIGILL;
-- 
2.20.1

