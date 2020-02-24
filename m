Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp843277lfg;
        Mon, 24 Feb 2020 14:22:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqxA3UVqeirJ2OKqi6bnA7LgnEB3GtWx8zsx+v9dg6idDIwLCKbG0rKu+5oxkbH2ayJUu/hn
X-Received: by 2002:ac8:7309:: with SMTP id x9mr52354476qto.338.1582582967077;
        Mon, 24 Feb 2020 14:22:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582582967; cv=none;
        d=google.com; s=arc-20160816;
        b=g4KDrodzidn6nJ/KtxwjREYfLy1vMuS2itTpE1YeMO32DcBm9ZNtH5t5gVpRlTEbl5
         H8mVSVvwpH0XV8wp6aIxVQidiSH3JiQa7QHCBOu8VPLdrxtlFtiePPrvhNjC6HzgfJ82
         WB3NBjlt5h1WTChSRphV4PzJTfN7s1147DYTTft/tzTjT646THFQw7xKQpNNTaIHqg6j
         yOxG/FMKSD8NNTynabsQaRhaXxkGtPOZTTAngOqsMX6YQphRo/j6k6VLGLL1+cQIMk7Y
         ilhFGH1l42XOpd6lLiUWxTXvkm1YqIhz6A05XqAcFH6w7ARw0zpmh2QOhHXMRWEKTWqV
         sWdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=NdhOCLWIrz3fKIXemltzqY1AnfnjgmcetiILUwX+2Hc=;
        b=uovfIRkrHnE68pVT7TojMsdPXZu0rpu24RCtUpjI3/4oFh2CoDowMD9VPCflZxIiZT
         I4g/3iMbL6Ov9mxYRVDI8o0+WgMxRHX1mu58RQxVGCDS2+PzsF3c8oRl8oDaWD6f8NOn
         3GLs4lTWf/JZ8nexhZmlqvx/P/0Dduu80eXmIsyMQLEeNqkBeUieRW3c+yxvpaigFfND
         7gOXFwE++G7mkoN3c9uv7KzyQURMTNK0Wt3sbMIKh0dZQn51qtGLgh1Wjvcy6JfWE2MC
         dvpwwzkr2zDLW0vr/DaTyF5w4wOnq+mathogb0W2SXM6yGvLino1wwlQKrWZ9upRX4P+
         Mtew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AQ0nbMbb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21si6981565qtm.365.2020.02.24.14.22.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 14:22:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AQ0nbMbb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6M7i-00042O-FC
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 17:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37638)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6M7Z-0003yG-Cw
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6M7Y-0005ib-3r
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:37 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:46642)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6M7X-0005hx-Tc
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:36 -0500
Received: by mail-pg1-x52d.google.com with SMTP id y30so5817617pga.13
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 14:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NdhOCLWIrz3fKIXemltzqY1AnfnjgmcetiILUwX+2Hc=;
 b=AQ0nbMbbKnOeXsuYdonsMfDDDPEJjkI38Uzua9Vt26W3gFIcZspa0QnA8fAqDipIpB
 87NkJClQkVnM0wsekdo+cCMIFK+V4+nQuLHMiLLXJ7dOZyhzTviRwjdV0pVjXRirJsr5
 SIpt4EaeZ6Z2o1IUjH8cbk3UiQVnr6sZuT8apcOD8BMVqLA9TqIWuflksMCK0DjNXI8q
 aVsCNsBDU0B8UJ764Zf7m5/FpDca5pmrr2Hsuj0QRnqpMcrlw8BkY5+WxAp0lKMRm3WV
 4babYVtAAUVWX0tmFP/zsYlmsdj3cmf7qy21ifmYPRQOPCu1OMqkOmX9BSx4eGyC6Mn3
 cDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NdhOCLWIrz3fKIXemltzqY1AnfnjgmcetiILUwX+2Hc=;
 b=eAbd43QrwEOA1S4qtJ9YsAF7a3fiT6R35eeoMXWEIFDbXyRI7swBfXvAoT42EYzRUS
 hQu8N4nA10oBB9FdyWAcLSiBITRL3X8qPvPZroK8ANOINHQ/xoGTofeqwg4s2Zp+ncLn
 hSveTecJpM1XLseiJmDPxDjDw6hPjELR2WaCEFEKuGG11DoRlVGL2PJLoohEx/3FEEiv
 nmYWXcW9wWFjSI8ovnjhI+SsrzrCx2FM7OiCvThExiLZx8h8Dp8EX+qn07nY2AmBZXtJ
 4eKUa+PNltz2fwcfTzQ926OMQ12vUPVzl6kEXD1JXJC5dAuE1Mow3E2RVYBJuvCLOgR+
 H5zw==
X-Gm-Message-State: APjAAAW3F+fRivrNQt3URW6ILn2y+agiONmDqihZirHURZWXA10UFZYn
 CNfjR3oOTzm1tj9r5ItNhGjGDw==
X-Received: by 2002:a62:5bc3:: with SMTP id
 p186mr31464637pfb.162.1582582954575; 
 Mon, 24 Feb 2020 14:22:34 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id o6sm13897097pgg.37.2020.02.24.14.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 14:22:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/17] target/arm: vfp feature and decodetree cleanup
Date: Mon, 24 Feb 2020 14:22:15 -0800
Message-Id: <20200224222232.13807-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52d
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OcXGL1wvziRL

The main goal of the patchset is to move the ARM_FEATURE_VFP test from
outside of the disas_vfp_insn() to inside each of the trans_* functions,
so that we get the proper ISA check for each case.  At the end of that,
it is easy to eliminate all of the remaining tests vs ARM_FEATURE_VFP*
in favor of the preferred ISAR tests.  Finally, there are a couple of
cleanups to vfp.decode to make things a bit more legible.

Changes for v2:
  * Replace aa32_simd_r16 by aa32_vfp_simd.
  * Add aa64_fp_simd, aa32_vfp.
  * Improve aa64 has_vfp/has_neon check.
  * Fix some "any" tests.


r~


Richard Henderson (17):
  target/arm: Add isar_feature_aa32_vfp_simd
  target/arm: Rename isar_feature_aa32_fpdp_v2
  target/arm: Add isar_feature_aa32_{fpsp_v2,fpsp_v3,fpdp_v3}
  target/arm: Add isar_feature_aa64_fp_simd, isar_feature_aa32_vfp
  target/arm: Improve ID_AA64PFR0 FP/SIMD validation
  target/arm: Perform fpdp_v2 check first
  target/arm: Replace ARM_FEATURE_VFP3 checks with fp{sp,dp}_v3
  target/arm: Add missing checks for fpsp_v2
  target/arm: Replace ARM_FEATURE_VFP4 with isar_feature_aa32_simdfmac
  target/arm: Remove ARM_FEATURE_VFP check from disas_vfp_insn
  target/arm: Move VLLDM and VLSTM to vfp.decode
  target/arm: Move the vfp decodetree calls next to the base isa
  linux-user/arm: Replace ARM_FEATURE_VFP* tests for HWCAP
  target/arm: Remove ARM_FEATURE_VFP*
  target/arm: Add formats for some vfp 2 and 3-register insns
  target/arm: Split VFM decode
  target/arm: Split VMINMAXNM decode

 target/arm/cpu.h               |  57 ++++-
 target/arm/vfp-uncond.decode   |  12 +-
 target/arm/vfp.decode          | 153 +++++------
 hw/intc/armv7m_nvic.c          |  20 +-
 linux-user/arm/signal.c        |   4 +-
 linux-user/elfload.c           |  23 +-
 target/arm/arch_dump.c         |  11 +-
 target/arm/cpu.c               |  67 ++---
 target/arm/cpu64.c             |   3 -
 target/arm/helper.c            |   4 +-
 target/arm/kvm32.c             |   5 -
 target/arm/kvm64.c             |   1 -
 target/arm/m_helper.c          |  11 +-
 target/arm/machine.c           |   5 +-
 target/arm/translate-vfp.inc.c | 448 ++++++++++++++++++++-------------
 target/arm/translate.c         | 122 +++------
 16 files changed, 498 insertions(+), 448 deletions(-)

-- 
2.20.1

