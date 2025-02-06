Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1846130njb;
        Thu, 6 Feb 2025 14:13:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUU9wEf+gnhVcfPLWwttl7lj9x1UMyYP2GosuFtbkwRq/tHJGftfprGQ4S+5AgolPDzSR2h8x9xXelcVQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGHMqUNOdy4ovkpuULgKfioj5bvsdDsZ9o33d+O6lJ2LQFtc3b+vCg2R/hhotkhBYOIb8KJ
X-Received: by 2002:a05:622a:1493:b0:466:96ef:90c with SMTP id d75a77b69052e-47167ad0988mr13849681cf.41.1738880031765;
        Thu, 06 Feb 2025 14:13:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738880031; cv=none;
        d=google.com; s=arc-20240605;
        b=CxLWhkQ/XlzTbkEOrWWozqQzOEB6vlOldJJaXpLMI7WUidbcSViKuPBlzGaqYZutlI
         zgEiGKgJqNbE/XKa/BedNA6BrNUqQyqjTWVxZk1z/wZJlAtuUgbcD6z36pcWtMa9KZaa
         /nxUbMP4DbhTBKGI5FxeT19rTIB/WldWr+YE0AaYIFiS1BG5Hv7LfIIikWGrQMvk3EkY
         b+mf9L2zv+fLHqNeozG0RmRxq7q2bA6yB39snTIlrKM21kgFzPnSaWd79TOiXRXHVG1x
         te7+HYkP9Eft254fUPdSdzCRRlY21XUhV76kfNaOzLBpWL++FytARJyWqRLf41UAO6jt
         Jptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=T/InBvBeBSuPehQy0FZ7ql+eBOm3DOFnaxnrJsbjG5E=;
        fh=jlwyXkcUDvyQfd0YEux5uhxVdLChTHSBE1QB3Zj4P2w=;
        b=ShYjEAHe+7AmSXZWL7OYGBRg8wxGJADdTCtlZC8VHeMXbt2bTUsFfXDGMQA2DlEFRM
         lqX4eWs1uuAWPYcTFGNZogDSTVgGLKjGqt/XTUpCbOO3iZPvLWndC5yFejhPMCJ9ESBs
         wrT8HAGY44+l1pW+sjCbK8hdxomXGThRlwR2ocbNL9pB/bAXG28KedV71GJqOGEigAfw
         ilBTnxDu4brUxk9A8kX223ZEJr7zYIm20dlVb+/+IEenRr0MEEXGgdS5FjqeeUnO3YZe
         t5zyqfgBfW+CElWYlg5seIfMj2i586RjjZBrNFfHOiIxPMhNw0s+vYgWitucFhZctAHV
         Zu6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=kHVKRrEL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153b90ac0si19533901cf.357.2025.02.06.14.13.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 14:13:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=kHVKRrEL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tgA75-00060s-Ro; Thu, 06 Feb 2025 17:12:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <30zOlZwgKChQGE1u8DC108805y.w86Ay6E-xyFy578707E.8B0@flex--wuhaotsh.bounces.google.com>)
 id 1tgA6x-0005uX-MP
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 17:12:39 -0500
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <30zOlZwgKChQGE1u8DC108805y.w86Ay6E-xyFy578707E.8B0@flex--wuhaotsh.bounces.google.com>)
 id 1tgA6v-0001Ww-HT
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 17:12:39 -0500
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-216311faa51so27151185ad.0
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2025 14:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1738879955; x=1739484755; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=T/InBvBeBSuPehQy0FZ7ql+eBOm3DOFnaxnrJsbjG5E=;
 b=kHVKRrELMt5VC1YHCxgLeD9JIoGQk2ezJgLPNq7zecaW+seopNRUi0tDVUUacdAgqt
 7c4CK8PTGOfwmJpOoGyLKCCnJFy0FuZOSg45l41psVsasOMLdL/0nTwotC2/KKprN8Mp
 /24TFvIFRdfrXQPGMo9Fsn9AcpNnbozZN+M8R0CNTUBsYMX3g6X2HxqVKkCb1eAj0Wa6
 NTmDDImVYvoiM9C3ReodxF7QYUJGPfKKRZA/3EWaEgIAvG2YPUpc5IplcecYccHnUtUX
 gaHe0LFW4L1esOjpoiIMy5QzBcfBo5+bR/5p6NsIBtBxz20S+K7MPptlRkZ323231tJ4
 HD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738879955; x=1739484755;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T/InBvBeBSuPehQy0FZ7ql+eBOm3DOFnaxnrJsbjG5E=;
 b=i4Dw8NgVGEEoD03sbTI64zcfQd56pBnc22EMNmV+nQOajZ6iujDDwpPy2npN9aAa3t
 BMbxkoR7J1RtKMJ0fNhisQQUHTUYlH55//fDQJf3Y1wcQpVgt2FboBdiCCDwnxRKUdS1
 zf26vFx7B+wpTUjLdm3OeJLNzuL9RVgdgwS0lxnXwyCfNVD1VZlCbwLoIvwGN+Z05ASg
 8aSrHtC6HjuLRPQgxiX2uNAbL7MVCBFYGljXx0c0lB4dhsKuOmTh4J1cMrP3qwST6RkT
 kTybdn4ahGIbhK3GPj2f/nBHncxPjnJrH7Y2FQOphVbpfvujBqWD1adEARrTDTNRcGyn
 i9tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWysFfNLG5eHt3KInBfIVxaKZQbQT49UrjTbFJshSLwteIJ0OgPVBrLXyC+0e7qctn+otw40CdV0Oqd@nongnu.org
X-Gm-Message-State: AOJu0Yx933MzBw9+fVCwoPARnNxAxtXLQ01A0nGy9xfVfF1McrBvMDGp
 ZgaQDclhPhdlP0UqGZ6H2GM1KBiJxrtlSByCYPNYP1sJxTDus5e5eQDG4+Lh02unICnrYWKWKRO
 VPAO/uw2VTw==
X-Received: from plgp1.prod.google.com ([2002:a17:902:ebc1:b0:216:271b:1b41])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f64b:b0:216:14fb:d277 with SMTP id
 d9443c01a7336-21f2f20d241mr90871695ad.22.1738879955123; 
 Thu, 06 Feb 2025 14:12:35 -0800 (PST)
Date: Thu,  6 Feb 2025 14:12:03 -0800
In-Reply-To: <20250206221203.4187217-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20250206221203.4187217-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206221203.4187217-18-wuhaotsh@google.com>
Subject: [PATCH v4 17/17] docs/system/arm: Add Description for NPCM8XX SoC
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 chli30@nuvoton.corp-partner.google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=30zOlZwgKChQGE1u8DC108805y.w86Ay6E-xyFy578707E.8B0@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NoOFfK7/1hdV

NPCM8XX SoC is the successor of the NPCM7XX. It features quad-core
Cortex-A35 (Armv8, 64-bit) CPUs and some additional peripherals.

This document describes the NPCM8XX SoC and an evaluation board
(NPCM 845 EVB).

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 docs/system/arm/nuvoton.rst | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index 05059378e5..e4827fb43a 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -1,12 +1,13 @@
-Nuvoton iBMC boards (``kudo-bmc``, ``mori-bmc``, ``npcm750-evb``, ``quanta-gbs-bmc``, ``quanta-gsj``)
-=====================================================================================================
+Nuvoton iBMC boards (``kudo-bmc``, ``mori-bmc``, ``npcm750-evb``, ``quanta-gbs-bmc``, ``quanta-gsj``, ``npcm845-evb``)
+======================================================================================================================
 
-The `Nuvoton iBMC`_ chips (NPCM7xx) are a family of ARM-based SoCs that are
+The `Nuvoton iBMC`_ chips are a family of Arm-based SoCs that are
 designed to be used as Baseboard Management Controllers (BMCs) in various
-servers. They all feature one or two ARM Cortex-A9 CPU cores, as well as an
-assortment of peripherals targeted for either Enterprise or Data Center /
-Hyperscale applications. The former is a superset of the latter, so NPCM750 has
-all the peripherals of NPCM730 and more.
+servers. Currently there are two families: NPCM7XX series and
+NPCM8XX series. NPCM7XX series feature one or two Arm Cortex-A9 CPU cores,
+while NPCM8XX feature 4 Arm Cortex-A35 CPU cores. Both series contain a
+different assortment of peripherals targeted for either Enterprise or Data
+Center / Hyperscale applications.
 
 .. _Nuvoton iBMC: https://www.nuvoton.com/products/cloud-computing/ibmc/
 
@@ -27,6 +28,11 @@ There are also two more SoCs, NPCM710 and NPCM705, which are single-core
 variants of NPCM750 and NPCM730, respectively. These are currently not
 supported by QEMU.
 
+The NPCM8xx SoC is the successor of the NPCM7xx SoC. It has 4 Cortex-A35 cores.
+The following machines are based on this chip :
+
+- ``npcm845-evb``       Nuvoton NPCM845 Evaluation board
+
 Supported devices
 -----------------
 
@@ -62,6 +68,8 @@ Missing devices
    * System Wake-up Control (SWC)
    * Shared memory (SHM)
    * eSPI slave interface
+   * Block-transfer interface (8XX only)
+   * Virtual UART (8XX only)
 
  * Ethernet controller (GMAC)
  * USB device (USBD)
@@ -76,6 +84,11 @@ Missing devices
  * Video capture
  * Encoding compression engine
  * Security features
+ * I3C buses (8XX only)
+ * Temperature sensor interface (8XX only)
+ * Virtual UART (8XX only)
+ * Flash monitor (8XX only)
+ * JTAG master (8XX only)
 
 Boot options
 ------------
-- 
2.48.1.502.g6dc24dfdaf-goog

