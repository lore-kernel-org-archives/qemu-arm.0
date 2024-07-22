Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2155893njc;
        Mon, 22 Jul 2024 14:45:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZm7CGSRV8Mz94DqsLewbMVWI9gyhKiOREPUGUrGUpyEVyN++3/J2Tq6MITbR2yBsb3wPl6ODWANsRO/RdCvG3p+ljaq37
X-Google-Smtp-Source: AGHT+IHOhsrz3wD74Vlkw6Zo8Rm52MdTukCmfRwf47VRYsATjbcV+Opm7q/ScRtNN71BxQcreVvu
X-Received: by 2002:a05:622a:50b:b0:446:5bbd:4802 with SMTP id d75a77b69052e-44fa5352e61mr100130491cf.56.1721684726129;
        Mon, 22 Jul 2024 14:45:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721684726; cv=none;
        d=google.com; s=arc-20160816;
        b=EFU5gP5h2Q0O/2qyRPV3qru6N42aKvL2b39xp0RCPNxweprrlnEjSTNCR7Sn4n/kzL
         vf8IL74mK/uK2kWznopmMaerCM/njG6lEtzhezNZwPSlDRPX5re169kdZPzveIWAN7hY
         UM3/KFV76KSn7kkG9LbM/AaswcgPZoJOanWKPqfGhkbJcmf7rSfcwb4EIpzFBWB2hpGf
         7uxKNp3VvTINaZL4WSiGqzEOEE74W3EH77w2evtThtK2bxZ2Wwax+fvlaVKfFcDtbBe/
         V1hl7tGZyTtneaY/WbVdMiqtGN3ImHYjs6ReUeq6/iiqwY3dnlTGk+gJ4Cv9i0DOn3F2
         jsLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=htzmk2/K+pRyHcINVlqMN9Cf2KcnbziuOXxz3Bx5eFI=;
        fh=52mHZO/kFpQLZehN5Hs93/PN2v8wD4W6puPDGTDbfbc=;
        b=iy3CQ7R9kXzvvZw3XXEBAiVEgWuYYzA2M/Z5J+WNbwHAh7eTAv5vHnIALNb6inE676
         ZUSWzz5r4UOx6lkxB17CvsYzHIR88sIjcpMTgliS/zBWGgrDJotXPfRoM9zlCXnV5kO+
         ipxQUsxqxhWvGyObJIWGKN49kHGrK7TXR2tMcNO+Bn+LVAfECCyvhOroZSSRKF0ALk5w
         f51zxnEG0XSJg6Jz2T736mipaAsYxPcc58VBLk0T84zihvYDRxMnU8OOH/q6vSmN11/y
         UYqSPCGCMnplLDOWZuf1OniKXEB8UMuoNgfWbJzrOEgQ2rBhQvwyfAcex8W2d/IKi5iS
         0/vw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=Q7p7BXAe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9ccf8c86si93180321cf.34.2024.07.22.14.45.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 14:45:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=Q7p7BXAe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sW0qF-0005w3-0h; Mon, 22 Jul 2024 17:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sW0pz-00054D-UO
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 17:44:56 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sW0pv-0004K8-T4
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 17:44:55 -0400
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-396db51d140so20196005ab.0
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 14:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721684690; x=1722289490;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=htzmk2/K+pRyHcINVlqMN9Cf2KcnbziuOXxz3Bx5eFI=;
 b=Q7p7BXAe99KQR4PifoFNy572eoP/uNChEYLfdhfjT9M8iPyW08+kt/i5jZOJLAKVsk
 p1aAuQP9bQB6ZGWqU27oUySryDP9tzU3gXtYCU031kBzqeHfc0NVaN2MIuj4AnAtZqQh
 IaWqs5LG9FiPX1aQbumFIjN0ZbCpZ+3YtQe0oKk7sExyPT/arnBD7Qoy3BXgUuIanwq9
 9NIlpKKclnlio3oqKy6v6pEAyo+bsTK9VbsPhJi0v+PayMHVY2/A7eoKGLoyObxp2arM
 Fj4c6iBByDqGvzz5CJ6QnlfwanDZyDt/icF/fD1EBq1ezO/tnaG2muIu4Y4gCl8Q/b+3
 Uabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721684690; x=1722289490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=htzmk2/K+pRyHcINVlqMN9Cf2KcnbziuOXxz3Bx5eFI=;
 b=IHukTnzvdbxVR9YvoSnowq/X4zPLqNYYPXTbWBToJwbY9zXBlk3aJjSOrPHkZ+vabI
 KvIBatyWGEIvWjGG5Ck4WlzM90jO0WMTgazkLFMYifEC/XD0s0nWnxGHl+S5xd0ygAv9
 5FPAD87eKpivoKBYIEHjU+6PkiIW+o2QTzguzXbHopmhZFwbOhelxQy4/A1U8J5vzbBb
 6r0OB8sITGuWf3WXLLIog1oNNZRIrjoW1WEgcrBHhqBP57/gSaSY/krwHuD3L8jHFOba
 6aCa6Lxn5ctwX40XcEanTIV9gLyprXUJgxqI1LHIAUzdNY95MABSY8roq6axY0NjovFi
 jmbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs75KC9OSykKSblaDPGPQvWv8iJgCrL3nSBF6GnYp1Z89vXwY0mZ3NbqUx4gIo0c4K53I2VZ53xXt3MMp1JGEd3KLd
X-Gm-Message-State: AOJu0Ywfk38RyRyfso/XaH3o//1ZIJC6IJXItJuKb77Wsw+3y5IkGYsL
 dhW/QaYA6uhAYa40pilcF+uTJkPwaDMhITCpnRcFwOnqyDed87Chj43djDIKuFQ=
X-Received: by 2002:a05:6e02:1a8c:b0:383:6af0:eb08 with SMTP id
 e9e14a558f8ab-398e420f849mr117635995ab.1.1721684690581; 
 Mon, 22 Jul 2024 14:44:50 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c2343d2ff3sm1816830173.128.2024.07.22.14.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 14:44:49 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Ajeet Singh <itachis@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 07/14] bsd-user:Add set_mcontext function for ARM AArch64
Date: Mon, 22 Jul 2024 15:43:06 -0600
Message-ID: <20240722214313.89503-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240722214313.89503-1-imp@bsdimp.com>
References: <20240722214313.89503-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1UIN6ic1Xrrf

From: Stacey Son <sson@FreeBSD.org>

The function copies register values from the provided target_mcontext_t
structure to the CPUARMState registers.
Note:FP is unfinished upstream but will be a separate commit coming soon.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Ajeet Singh <itachis@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240707191128.10509-8-itachis@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/aarch64/signal.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/bsd-user/aarch64/signal.c b/bsd-user/aarch64/signal.c
index 43c886e6036..13faac8ce60 100644
--- a/bsd-user/aarch64/signal.c
+++ b/bsd-user/aarch64/signal.c
@@ -95,3 +95,25 @@ abi_long setup_sigframe_arch(CPUARMState *env, abi_ulong frame_addr,
     return 0;
 }
 
+/*
+ * Compare to set_mcontext() in arm64/arm64/machdep.c
+ * Assumes that the memory is locked if frame points to user memory.
+ */
+abi_long set_mcontext(CPUARMState *regs, target_mcontext_t *mcp, int srflag)
+{
+    int err = 0, i;
+    const uint64_t *gr = mcp->mc_gpregs.gp_x;
+
+    for (i = 0; i < 30; i++) {
+        regs->xregs[i] = tswap64(gr[i]);
+    }
+
+    regs->xregs[TARGET_REG_SP] = tswap64(mcp->mc_gpregs.gp_sp);
+    regs->xregs[TARGET_REG_LR] = tswap64(mcp->mc_gpregs.gp_lr);
+    regs->pc = mcp->mc_gpregs.gp_elr;
+    pstate_write(regs, mcp->mc_gpregs.gp_spsr);
+
+    /* XXX FP? */
+
+    return err;
+}
-- 
2.45.1

