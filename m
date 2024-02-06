Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1791127ejb;
        Tue, 6 Feb 2024 05:31:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHj3sBrvcpsYxSR9JZy+MF7FIF0anT6l2Vivu+cbcmDHNKphfz9LTMysvH4JgcC/olKuaMz
X-Received: by 2002:ac8:460a:0:b0:42c:25fd:de75 with SMTP id p10-20020ac8460a000000b0042c25fdde75mr2095041qtn.6.1707226290844;
        Tue, 06 Feb 2024 05:31:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707226290; cv=none;
        d=google.com; s=arc-20160816;
        b=c5AoAhD8zJzOu6SRUFJOOL1r80ITH2hKzsVRpLrWZz9x7iXpu2u/Fb+x3nyUNtdBxL
         X8hQr5mCFvpweXVUcfNn3aQDwnf92gJoo3MDH1paTF2ffbRTxzyWbBtoNQ93XORjp0ED
         0n5KaHVoZjAD5Um59/bhhA/242tYCr04RZOjl2X/hESBXSUVNOoQ3i2yd2jG1SJASOdH
         0xymqTXzeH1H7sePcgHH56zwxz2njo+KztDdvgVXo4kA/Y4jC92f3UhtpihnBErr4aQ9
         Q9ZzWCAsiSqMpaSuyHuPap7qiE2UzZEWIVPiAR+joQgoAl/5V+MnblDPji4qf01er6ZN
         Od5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=i5+zyl23hVZuAKNLfLW8qwmlrpXibq7GbXzW+djyeAc=;
        fh=/ZHIhKi8CxsF2mR36kk7URgelocUzELNpX399Zr5NAM=;
        b=Njo6ZeQkBOc7x8Mn81sFBvE0otbR6uPxJcZ+L2bxawii4SXfRgHDjIj6GmL1yQjjCt
         mxncVfvRu3+Rp8vfj5f+fVZGTYnNQmGqY3e2yXFYhD766wHiOKP5CHhKo7fVS0KToaNd
         mOOiS0nA8IPZhU2dqGHCBPimWqAtJ75tIEoNDJmdYmUbY2PxFE7Aj8lwoyEvbrpx0eHt
         xFgucMgOpMr16oCzWrm0VzIskTzWBVGcuWHR9skLEcZ1I8EHHwjLRGNQR4uG62ZP/lxS
         spS8DT54qzph/ugidhTQcFHRu6D17B+4onUopRRNZSrfETAtAwPGCO9dv3wo2NrFMYHF
         NA/Q==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wy8dvwnG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCXk2aJZUEtpRmCNrkFlE3wKW4A5+uTpl05kzKOkWfCTLWNyVqNz5Yh3dIbdVfEK4gwCqDTPGTO2QVf/cbwwq5vIzCUmpqgq
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17-20020ac85811000000b0042c3b7b7908si45318qtg.350.2024.02.06.05.31.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 05:31:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wy8dvwnG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXLWJ-0000rP-MM; Tue, 06 Feb 2024 08:29:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXLWE-0000iX-Gv
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 08:29:46 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXLW8-0008G3-5w
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 08:29:46 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40fc6578423so37492805e9.0
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 05:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707226179; x=1707830979; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=i5+zyl23hVZuAKNLfLW8qwmlrpXibq7GbXzW+djyeAc=;
 b=Wy8dvwnGA+5VjV6Wv+iaQcV03x9idvLGSikV0kCTYNIZt0KW4dAjwwXAbFYf2Rge+d
 7sWIqwT5Y+WA2oRF573VqPxISh04iFFFza+WfVC/AT5ePT3xwxFaxXUkV0ZJ/h4AjEtA
 nzc+si36ZYBp8HDqqItibgVtM/GPXQTQeNkzedaclAyrx2RZ2WVctqcN4xRl74Qfqz/x
 bxbgOKNeMa9bqncz2R2fVruu5A093CuG2NJZf88o9r+FUQT3ZthbsokMhawdN+k+izcA
 ZtM6nSTFerdUVewf8Jwgq5Sd9Cm74QPCM0qrCH0PAy3ZK/5dyZtXi9RHUlYYcJCS1Ek7
 mmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707226179; x=1707830979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i5+zyl23hVZuAKNLfLW8qwmlrpXibq7GbXzW+djyeAc=;
 b=XOHEfio7DhDbuexCxJBW5SV4IX0v290hpWEJLo8P42LVgaWGSgaiFOQi6Klw8rCRO+
 wTBlrZstHPTqWFFhF2fIjVaA9pZqNlSUM1ghGK8uYKDs40X/EgiaYUavgUSjGhkLvPgA
 K5gxMIwZzb9LQza11WJPKAXufgJNe76oezEIQKCUKpBUPuq46PoVgXxphHRYJKDW+slt
 dh75wM6lkNQbSJn/+jhOxGHEwU+5sEsaWnnKgs7VdDYjASlAWmPMiayK0Ubm3NQ1+p7v
 mjH4b5OL/4ykkbzmwVbyRJxsfkWxJIebJwfLmUfF2EErKhFlPsnZB9EN+rrMDd3LX5nv
 NUcw==
X-Gm-Message-State: AOJu0YzJIuYsPUmmz6UWqBsDiPbgRorjexA8QKLjTuWYkjR+aoCFSd62
 w0K+xxCPhzd69U1qTRlqbv+U7WXsD06M+2QsbSr89ISSbdpIdNE5FxIYwVucCYCc+1RpdRbnsaT
 N
X-Received: by 2002:a05:6000:1208:b0:33b:3ceb:99cf with SMTP id
 e8-20020a056000120800b0033b3ceb99cfmr1167924wrx.67.1707226178817; 
 Tue, 06 Feb 2024 05:29:38 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWC4xecCLiqv1PUBtXswhEAx7qbwncmvQ70KK11G8lL00ywQnQzlU0WOfEqVkp9ASqU8Jo/BZ6hJbUfKnPvMK/LLtOboNM=
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a056000108700b0033b470a137esm1492932wrw.79.2024.02.06.05.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 05:29:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/13] docs: Add documentation for the mps3-an536 board
Date: Tue,  6 Feb 2024 13:29:31 +0000
Message-Id: <20240206132931.38376-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206132931.38376-1-peter.maydell@linaro.org>
References: <20240206132931.38376-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: xOwXUdWJKJNJ

Add documentation for the mps3-an536 board type.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/mps2.rst | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/mps2.rst b/docs/system/arm/mps2.rst
index 8a75beb3a08..a305935cc49 100644
--- a/docs/system/arm/mps2.rst
+++ b/docs/system/arm/mps2.rst
@@ -1,7 +1,7 @@
-Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``, ``mps3-an547``)
-=========================================================================================================================================================
+Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``, ``mps3-an536``, ``mps3-an547``)
+=========================================================================================================================================================================
 
-These board models all use Arm M-profile CPUs.
+These board models use Arm M-profile or R-profile CPUs.
 
 The Arm MPS2, MPS2+ and MPS3 dev boards are FPGA based (the 2+ has a
 bigger FPGA but is otherwise the same as the 2; the 3 has a bigger
@@ -13,6 +13,8 @@ FPGA image.
 
 QEMU models the following FPGA images:
 
+FPGA images using M-profile CPUs:
+
 ``mps2-an385``
   Cortex-M3 as documented in Arm Application Note AN385
 ``mps2-an386``
@@ -30,6 +32,11 @@ QEMU models the following FPGA images:
 ``mps3-an547``
   Cortex-M55 on an MPS3, as documented in Arm Application Note AN547
 
+FPGA images using R-profile CPUs:
+
+``mps3-an536``
+  Dual Cortex-R52 on an MPS3, as documented in Arm Application Note AN536
+
 Differences between QEMU and real hardware:
 
 - AN385/AN386 remapping of low 16K of memory to either ZBT SSRAM1 or to
@@ -45,6 +52,30 @@ Differences between QEMU and real hardware:
   flash, but only as simple ROM, so attempting to rewrite the flash
   from the guest will fail
 - QEMU does not model the USB controller in MPS3 boards
+- AN536 does not support runtime control of CPU reset and halt via
+  the SCC CFG_REG0 register.
+- AN536 does not support enabling or disabling the flash and ATCM
+  interfaces via the SCC CFG_REG1 register.
+- AN536 does not support setting of the initial vector table
+  base address via the SCC CFG_REG6 and CFG_REG7 register config,
+  and does not provide a mechanism for specifying these values at
+  startup, so all guest images must be built to start from TCM
+  (i.e. to expect the interrupt vector base at 0 from reset).
+- AN536 defaults to only creating a single CPU; this is the equivalent
+  of the way the real FPGA image usually runs with the second Cortex-R52
+  held in halt via the initial SCC CFG_REG0 register setting. You can
+  create the second CPU with ``-smp 2``; both CPUs will then start
+  execution immediately on startup.
+
+Note that for the AN536 the first UART is accessible only by
+CPU0, and the second UART is accessible only by CPU1. The
+first UART accessible shared between both CPUs is the third
+UART. Guest software might therefore be built to use either
+the first UART or the third UART; if you don't see any output
+from the UART you are looking at, try one of the others.
+(Even if the AN536 machine is started with a single CPU and so
+no "CPU1-only UART", the UART numbering remains the same,
+with the third UART being the first of the shared ones.)
 
 Machine-specific options
 """"""""""""""""""""""""
-- 
2.34.1

