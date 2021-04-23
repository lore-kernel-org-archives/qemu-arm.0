Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1520655lfb;
        Fri, 23 Apr 2021 09:55:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgPG0Cv7MptCzJAPUnBMUJBd1Baozl9Ut6D8Qli7HGu82SvfbhQ+SatfToYFv9WQ2SPJeG
X-Received: by 2002:a92:c246:: with SMTP id k6mr3799264ilo.155.1619196906817;
        Fri, 23 Apr 2021 09:55:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619196906; cv=none;
        d=google.com; s=arc-20160816;
        b=OlP45kRjmMW+dcbd8U3DC3K20CKEs4p66tteol1s0Qe0+Sf9xQkbgJ/ozUUlukk1Hv
         bjJVxqo6c1rZu8YZSMHvlT6oQhdgQ3jKmTHFtMBMMM8m5yln2V0dCZeEjIKUe9SeoR6E
         1GouykLr867OOFLi9eYPqiK8DV6gceVYle42q2PuiviCjCUXjBxlZTXWlBRqNbNV7uJe
         CeMqjIRZWRRcTEdXmgrD8vtsUeic8kr0mN/dWqY4HQuyVbLBkbQE3re4UcJlgcSmoSM5
         XvyBVVpnxrmTyAvwBM72/M09/uNlKkQib1FDjz6IRt1E+c0SFO/cjjCkENCHvAWNsJ7n
         Wgvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bpMdaQI7d9VQlEQ+FXm6j0OmwDELWjGPjFeSPFqh+YA=;
        b=uQ18HKGdpNZwsWucRGN1qz4iGr/3Zlh6Eg/achpOx0imAXADSx3n7/YVPov6YX67uy
         BjINOjwI3VsAcCUd1QEuHa37RgjPdxOB5cq+B0L3YoAjZoIrMbf0DPoLbtyd0MUHzztw
         N+G52VO+tKvWP/OcxvxiXVjDz5+GqDk8x09IYxSnVjU/gZMG0Vo8hsXxQxXqTdPoWLvb
         sJdwbfEmIYFFhy07C2NYV4IFs6kXQ58lbmvvm69SrZd1A7Oh2N0GXvMoYROm5/PItayr
         G5HPO6uxdGJ/MP54FMB4a9VrH8IoNnmO0f/ht8fOcpcq4GVoS1EMEoxRB9jr2t3B8cMO
         1Hqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uE94mD8e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14si8179169jas.18.2021.04.23.09.55.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Apr 2021 09:55:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uE94mD8e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZz56-0008Lf-Cx
	for alex.bennee@linaro.org; Fri, 23 Apr 2021 12:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZz4X-0008Kz-TP
 for qemu-arm@nongnu.org; Fri, 23 Apr 2021 12:54:29 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:44818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZz4R-0008BM-En
 for qemu-arm@nongnu.org; Fri, 23 Apr 2021 12:54:29 -0400
Received: by mail-pl1-x62e.google.com with SMTP id y1so9856710plg.11
 for <qemu-arm@nongnu.org>; Fri, 23 Apr 2021 09:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bpMdaQI7d9VQlEQ+FXm6j0OmwDELWjGPjFeSPFqh+YA=;
 b=uE94mD8e7Wle6YtHIrYanc+d/zb9YfjsmmagnWvDGkOyJJJ0z4nViu1i07n0XHnRFy
 qNsVSEQzxpmhvfpxq72tBJ4wHgVymnJXdDkdyJV9cf6StzVq656jlORqXBoeI1jodUU/
 4s19/nC08W0RHtk7zAhiJpb5MTvS4ybUq6HASa6vI5VJ+hUsjGOfMg8c1CfDiEtVwpxN
 oT70Q0HltWVeLzAlBz/4CsakMg4CGoTh36BADSey55k6mVRgZ2Tg71NSgC2flkEdfifY
 ZoWuOmzypA0k5rGwLGwgOeUXWMylzsE+EbnRwCvVmZM2FV9oAWGRUZa+Z9IzJ4ks/TcW
 +gQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bpMdaQI7d9VQlEQ+FXm6j0OmwDELWjGPjFeSPFqh+YA=;
 b=MVD4AyVcptG2pCWjnTs9ifptHXAmu981v5hvEddg3LkrPsrPrLkISDfQz+9RYEvaB8
 NfoshRKw/B4p3e8snYM1y2I5s1YLMXMPV3C0FvgzHxfLnd2A9HtPU3AYxQwWuRpISUJN
 9WH+WLFy65QJSg8G7yHTQn/3UGuYtneVzQkjTbiiDyX+nc7GyOqPmJi2ElkAat3YSOU1
 OZzHe4ZefX4A4LDgWD/bG3k3h4BVHESOSS4+ZyhQeCat671T/SVMx2hcXnXO3bLEgBpt
 OtoKOfctklnWrMUzGodzDgyz34QVPRsFJcSskKihTelsKkgnVZIbg8xqTB8uR38HilQ/
 nHcQ==
X-Gm-Message-State: AOAM532oDpfP3qkA3x89hR4CbYqSInE4wsyhvj50waSRBI6+rN0H2+Np
 L0FYCajk/f6gW63yLtrkElLTtQ==
X-Received: by 2002:a17:902:b210:b029:eb:535f:852 with SMTP id
 t16-20020a170902b210b02900eb535f0852mr4546539plr.80.1619196856836; 
 Fri, 23 Apr 2021 09:54:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q5sm4918151pfu.5.2021.04.23.09.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 09:54:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] linux-user/arm: Do not fill in si_code for fpa11
 exceptions
Date: Fri, 23 Apr 2021 09:54:12 -0700
Message-Id: <20210423165413.338259-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210423165413.338259-1-richard.henderson@linaro.org>
References: <20210423165413.338259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QWyffsc3ugSm

There is no such decoding in linux/arch/arm/nwfpe/fpmodule.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/cpu_loop.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index e2a1496b9f..5f61d25717 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -262,29 +262,15 @@ static bool emulate_arm_fpa11(CPUARMState *env, uint32_t opcode)
     /* Exception enabled? */
     FPSR fpsr = ts->fpa.fpsr;
     if (fpsr & (arm_fpe << 16)) {
-        target_siginfo_t info;
+        target_siginfo_t info = { };
 
+        /*
+         * The kernel's nwfpe emulator does not pass a real si_code.
+         * It merely uses send_sig(SIGFPE, current, 1).
+         */
         info.si_signo = TARGET_SIGFPE;
-        info.si_errno = 0;
+        info.si_code = TARGET_SI_KERNEL;
 
-        /* ordered by priority, least first */
-        if (arm_fpe & BIT_IXC) {
-            info.si_code = TARGET_FPE_FLTRES;
-        }
-        if (arm_fpe & BIT_UFC) {
-            info.si_code = TARGET_FPE_FLTUND;
-        }
-        if (arm_fpe & BIT_OFC) {
-            info.si_code = TARGET_FPE_FLTOVF;
-        }
-        if (arm_fpe & BIT_DZC) {
-            info.si_code = TARGET_FPE_FLTDIV;
-        }
-        if (arm_fpe & BIT_IOC) {
-            info.si_code = TARGET_FPE_FLTINV;
-        }
-
-        info._sifields._sigfault._addr = env->regs[15];
         queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
     } else {
         env->regs[15] += 4;
-- 
2.25.1

