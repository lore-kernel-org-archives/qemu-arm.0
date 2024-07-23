Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2672227njc;
        Tue, 23 Jul 2024 11:13:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQL7czTMhk9n9z4k+V44WH+kvWd4I83xpVIF/zaxBKtiiYPygEVFh4EdzxFOfdI3aubLGfx9TiNMNIYq8mU/OGV4SgoTG3
X-Google-Smtp-Source: AGHT+IG8TE4eLFpTJe3v6KlbBbdPp1PQR1zQcGEMdnmYYIeKySDznUCJZifBt8Ub16eCmSIwIyDx
X-Received: by 2002:a05:620a:19a7:b0:79f:137b:6e75 with SMTP id af79cd13be357-7a1a6642259mr1268156885a.67.1721758383888;
        Tue, 23 Jul 2024 11:13:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721758383; cv=none;
        d=google.com; s=arc-20160816;
        b=EwztHkzDg+8/HjflqTD7LVUn7A+UsU5AfWNavCvNsLvAK9pMAANkz8aZb/Epnk66/y
         nPH1HigSxWLKKtPChz1laCjseg2Q6apAFj97RhSbm0klcJZmsM6xUPOHAwvvJIrLbufy
         G8YL7uyz5wimFpWjATYZ/B/IRBY3pdh6+Ras23B3arYCv1VlpHtjs8JEgBVb3IPNmpVt
         M7U9LyXdWRvpVkTpeNidgsMdmbc/tQG5+hi/wANaksoR4qAw88otUewwvo/T1nvK8/Fa
         Iy184RjluJfh0wl2p9riCMxdo+2rMCZ8aHfgPWF6dd+P273y7VG774ac1/3SU5MBGOms
         p9LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6NVVykiWpqYjvD45AibIwwzA8pM6gZ3sTQWN+WDs9eM=;
        fh=z0IrW9fpHUYyVOmAcUXUSjJn4QSrY86InsdpXMpvHQ8=;
        b=Pe0cv2uMoG0jFuDf5W4o2mc2QiMHVP7kzDRcfDbW1Q4QSGnCiAXyJz19DQTJP1U3Dx
         Ble+LFFqTj002UnDv8D0cCMRY7sCcut564mF8XjeREgCyaCIzIrlKBX0+6Ivr+tsfemw
         7hYDNon0AIjkKiznWRHdl3lUx5WHioRcGJFs691XXJxqqDFYt9+n6/62OQU+cUpUAPYP
         1x9gy96S0GAyg15cZHt8zkkcw4DpMMGcjngZMvbJITr7Q7QwQEsHRZjeOHeP0qO3EeyO
         JzDwcrZ2NHbhIKKdrywx6ZeW0AWpw61MF5qm7KyzXJiwe/YKzfoNDtU+oua6L3f3NQ44
         7uDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=vy9IW+yb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a198fb026csi1074713285a.166.2024.07.23.11.13.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jul 2024 11:13:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=vy9IW+yb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWJxU-0002ig-8u; Tue, 23 Jul 2024 14:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWJwv-0001HZ-Cm
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 14:09:25 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWJwq-0001DW-42
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 14:09:19 -0400
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3970f9331deso23590705ab.2
 for <qemu-arm@nongnu.org>; Tue, 23 Jul 2024 11:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721758149; x=1722362949;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6NVVykiWpqYjvD45AibIwwzA8pM6gZ3sTQWN+WDs9eM=;
 b=vy9IW+yb5ZvHlHDXR9l27hPTuodJP9CYJbLIRqWQl7M/1ho9EsDYDpSnsrkH6kyWer
 HFf28khJCxKhqkg073Le9G4NpH1jq+LA22FtdCTyePDTCjaI0Y/tXujarAcs2+n2qU3D
 Ln2JiJGzwzFhNfFmpP2+ATjPpWkDqw5yqg20tJQVq2GON08UujeR+zyEDhK8gUSOXnM3
 hmn+QrxKKqoWvS0qJHdBMIvLjGHCpgKXE3S9CN3b209ZHTyWTBzk7Wk5x0hm8YPNwqF7
 xFaWPF1w8KcFzdr+5TLvqdz9OMnEhrPYxjeHVp55Q68W9NzEL1hxClq22NFlFTUJeopL
 qz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721758149; x=1722362949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6NVVykiWpqYjvD45AibIwwzA8pM6gZ3sTQWN+WDs9eM=;
 b=GgXNi8h1TsRYtW+eQVLaEqRTFd5wkKYYjPgjcThNYDkGVdG+/X6S+fuyOIvVcGapLT
 w3VlqkP7J7l8+C/5rjeOq2LcFwSceQ6nV29Eg7tG4JpVTgYRSiZdVDZY0BebG86z6XFO
 YZXE7s4KZ3D07FRDrfidFpWTFOsQ+6rFU3QsNX4epzON/yBndmeT+6voMkiqWCD4fFQ8
 SbkJ2mm1V20+hY1ITVPSX2imHnxeIKBlzILPdFPZOI1PchJGPg2xvBhdN0ajT4/WyW4d
 i47WYE7fgPvCYmV/40wfXqYmVSsk+y0+KUKbFvKnZcBBoO5cvNp01EF+vZ3kxmtnRbqC
 2rVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2bDqF0FwK9b293pvUupmPRoqw9jVrwCx1t0B+wBpa74cgWP38CkD+EA29K4JyBeNGx5NDPjlU072Qxe1ICqhTLRXY
X-Gm-Message-State: AOJu0Yy48Tjz4ikAlAJoSZwj0bK1M0tP+b6wpm7HyY3c8Vt0F7LWecwA
 p0kOrOicpuKc6QQB65EYUIBNtUqg9uLHq3hjdKHoFqA+Wu+FV7t5G+zX1AtQAYU=
X-Received: by 2002:a05:6e02:1a6a:b0:376:410b:ae67 with SMTP id
 e9e14a558f8ab-3993ffa3d27mr116355045ab.16.1721758149299; 
 Tue, 23 Jul 2024 11:09:09 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-397f7a2827csm33361775ab.53.2024.07.23.11.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 11:09:08 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 12/14] bsd-user: Define TARGET_SIGSTACK_ALIGN and use it to
 round stack
Date: Tue, 23 Jul 2024 12:07:23 -0600
Message-ID: <20240723180725.99114-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240723180725.99114-1-imp@bsdimp.com>
References: <20240723180725.99114-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
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
X-TUID: Yb3ny0KxhLFk

Most (all?) targets require stacks to be properly aligned. Rather than a
series of ifdefs in bsd-user/signal.h, instead use a manditory #define
for all architectures.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/aarch64/target_arch_signal.h | 2 ++
 bsd-user/arm/target_arch_signal.h     | 2 ++
 bsd-user/i386/target_arch_signal.h    | 2 ++
 bsd-user/signal.c                     | 9 +--------
 bsd-user/x86_64/target_arch_signal.h  | 2 ++
 5 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/bsd-user/aarch64/target_arch_signal.h b/bsd-user/aarch64/target_arch_signal.h
index bff752a67ab..b72ba7aa504 100644
--- a/bsd-user/aarch64/target_arch_signal.h
+++ b/bsd-user/aarch64/target_arch_signal.h
@@ -77,4 +77,6 @@ struct target_sigframe {
     target_ucontext_t   sf_uc;  /* saved ucontext */
 };
 
+#define TARGET_SIGSTACK_ALIGN 16
+
 #endif /* TARGET_ARCH_SIGNAL_H */
diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 02b2b33e07a..10f96b8bfc9 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -86,4 +86,6 @@ struct target_sigframe {
     target_mcontext_vfp_t sf_vfp; /* actual saved VFP context */
 };
 
+#define TARGET_SIGSTACK_ALIGN 8
+
 #endif /* TARGET_ARCH_SIGNAL_H */
diff --git a/bsd-user/i386/target_arch_signal.h b/bsd-user/i386/target_arch_signal.h
index 279dadc22c7..2c14153ab6b 100644
--- a/bsd-user/i386/target_arch_signal.h
+++ b/bsd-user/i386/target_arch_signal.h
@@ -88,4 +88,6 @@ struct target_sigframe {
     uint32_t    __spare__[2];
 };
 
+#define TARGET_SIGSTACK_ALIGN 8
+
 #endif /* TARGET_ARCH_SIGNAL_H */
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 8b6654b91da..da49b9bffc1 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -728,14 +728,7 @@ static inline abi_ulong get_sigframe(struct target_sigaction *ka,
         sp = ts->sigaltstack_used.ss_sp + ts->sigaltstack_used.ss_size;
     }
 
-/* TODO: make this a target_arch function / define */
-#if defined(TARGET_ARM)
-    return (sp - frame_size) & ~7;
-#elif defined(TARGET_AARCH64)
-    return (sp - frame_size) & ~15;
-#else
-    return sp - frame_size;
-#endif
+    return ROUND_DOWN(sp - frame_size, TARGET_SIGSTACK_ALIGN);
 }
 
 /* compare to $M/$M/exec_machdep.c sendsig and sys/kern/kern_sig.c sigexit */
diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index ca24bf1e7f7..f833ee66cef 100644
--- a/bsd-user/x86_64/target_arch_signal.h
+++ b/bsd-user/x86_64/target_arch_signal.h
@@ -97,4 +97,6 @@ struct target_sigframe {
     uint32_t    __spare__[2];
 };
 
+#define TARGET_SIGSTACK_ALIGN 16
+
 #endif /* TARGET_ARCH_SIGNAL_H */
-- 
2.45.1

