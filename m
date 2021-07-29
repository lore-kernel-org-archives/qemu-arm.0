Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5537214lfc;
        Thu, 29 Jul 2021 04:15:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEeac1IjHbhGxsgpeZkh1jVM47tHmDxMgbtwcOqvRFtJygqywvZJ49iXbUKWZhDDltE5/6
X-Received: by 2002:a05:6102:2008:: with SMTP id p8mr3613836vsr.28.1627557350715;
        Thu, 29 Jul 2021 04:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627557350; cv=none;
        d=google.com; s=arc-20160816;
        b=Y6NPuqLEmT5bTM/XG+YabLL4cALCDqjiY0Sbr9g0pjfRNXw4Zivk518vTU2NbeQPMu
         w0zOSmqPSsl37FG2CR2kBdPTAhznQOUW+B0S/4M8hzCQrFxxG5+SdhSQCUeg64ucbFLN
         9TtJ0/FtpZEBbEef7GIOQO48kVzGs16U4JtPba6qwuV18CgYFsuVCdxCuzwH0ErTWNit
         63nLPAjsVGZTOB42qkcwj64jsmWD8nXkJO0S9g0eMc2NbtfMZ8eCUkY68i2NjXh6gnXu
         bS0mN/L/E5dmT9BOOdGJbHK/B3MbX7AySM66VVDUcOeNx0HYKNwFGZStNrUWELz1eg1H
         tCSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ZtDYgvBEq5EqQ2Fjyt4QJHmL5eTW+pDDkgFsDDg2i6I=;
        b=KhID2cWdeR1BC3KnrNATSE34rtHQkKk9TKNtSpfgVvvhwq+JR2K7XOBvO2RWeTO0A3
         gpB4hkrohxiPB3zEVY+8nwX9XfKhAlSjwfILfAs5bFYSImjVczThE4n7JxnYfE7d9h/l
         sP12Hkg3AZo0NVh5GUHAQKJJBzKZ5x1jyG3OclfhjiOKT+IxW8PXaObwTZkrwHKlDDie
         2a9gWhidfX6d8fGzO/DeIoVi+yowjNsmqVHDIyIhU5JYQTEcGr2RLw1KQgkE3Uj+q+sL
         xtM0KHlixb17U0KfoAm3S+QMN/a75oHY5ZW+rMQ2itVskuJ4jEM4WeGnRPzZUBqVP8cA
         Usgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rrYIgLMJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e23si1347285ual.6.2021.07.29.04.15.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:15:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rrYIgLMJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m940z-0008On-Lj
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940U-0008OT-Go
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:18 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940S-0000sq-K5
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:18 -0400
Received: by mail-wr1-x431.google.com with SMTP id r2so6483059wrl.1
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 04:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZtDYgvBEq5EqQ2Fjyt4QJHmL5eTW+pDDkgFsDDg2i6I=;
 b=rrYIgLMJfyBEf5PzqjC0rfndd1JR1y96Sj9zDFEKtw7KKv4k5ZkdKHNYkeZqYsjq5Y
 Cr2H2Yjo9FZ0i/JOJAOfY2Tm06zckLt7mCy7xktUleI0ALz+ttII64yZupHSMDTAYgHF
 NbPenccsDU4Z0QBvTibaDVrAn7BSVjp1RBCyNgEVxA2LNhC0ZabxVe1DfdEQzoSP60zN
 KFgmbEQH5v7g7RoGlf5mJGZTiQOaiP3/j4Jf0p7axjspNsTuQezHWUs4OAnsBOu2JJLd
 7svp/12NajqdYZP2q+BlrLJoWI0+iE/VX2LPztxlOmq+V7+D0VhdSM4eU0wUpfh7HHzm
 /L4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZtDYgvBEq5EqQ2Fjyt4QJHmL5eTW+pDDkgFsDDg2i6I=;
 b=MtB7ppiyzL+GpPfJi6Ea6K9IO2SndejXAIPoAAVO4/98dNpHGo8VkofKCf6cbM0Uw7
 KqgDgC3edNZu8cxvYQLsemoBjrWteyrVJra4aOdlqdhTr3EDXSm4pORXyNkhaLDqv1km
 r8Q7J+b383tavBstSv8P+9HXd+v3QliBbQGvSM5pSh6SS1fi7GOkDtn5kAo9eqqU2yVO
 xO/OkT7zKJP4Y2OQHzgcLgn3C79e9N8tUIr2IhVrJqxXvbu5IwZOtPqyxrm90EkpvEyE
 tMGu5DDfIX7v8KR+khHOr0mVaekxSv+B0zBj3PtX+if8ialWaMFqVxvpzPRmeonsuMdk
 gBUg==
X-Gm-Message-State: AOAM530c/u3l8b5lxhboBwyIscvLOLO7v0rZMIzdUZ1i5myK51J2tsFO
 txKWrrVCC3vnQ8AhlFqG5MnMiIZsxMoiGQ==
X-Received: by 2002:adf:f202:: with SMTP id p2mr4259002wro.240.1627557314965; 
 Thu, 29 Jul 2021 04:15:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 00/53] target/arm: MVE slices 3 and 4
Date: Thu, 29 Jul 2021 12:14:19 +0100
Message-Id: <20210729111512.16541-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ga/HTiQlrjtE

This patchseries provides the third and fourth slices of the MVE
implementation, which gives us complete coverage of all instructions
and brings us to the point where we can actually enable it.

In this series:
 * fixes for minor bugs in a couple of the insns already upstream
 * all the remaining integer instructions
 * the remaining loads and stores (scatter-gather and interleaving)
 * the floating point instructions
 * patch enabling MVE for the Cortex-M55

Things still to do:
 * MVE loads/stores should check alignment (this will depend on
   the patchset that RTH just sent out, and I didn't want to
   entangle the two features unnecessarily)
 * gdbstub support (blocked on the gdb folks nailing down what
   the XML for it should be)
 * optimization: many of the insns should have inline versions
   to use when we know we aren't doing any predication

But none of those are blockers for this landing upstream once
we reopen for 6.2.

Still to review:
 03, 07, 10, 21, 26, and the new patches 36-53

thanks
-- PMM

Peter Maydell (53):
  target/arm: Note that we handle VMOVL as a special case of VSHLL
  target/arm: Print MVE VPR in CPU dumps
  target/arm: Fix MVE VSLI by 0 and VSRI by <dt>
  target/arm: Fix signed VADDV
  target/arm: Fix mask handling for MVE narrowing operations
  target/arm: Fix 48-bit saturating shifts
  target/arm: Fix MVE 48-bit SQRSHRL for small right shifts
  target/arm: Fix calculation of LTP mask when LR is 0
  target/arm: Factor out mve_eci_mask()
  target/arm: Fix VPT advance when ECI is non-zero
  target/arm: Fix VLDRB/H/W for predicated elements
  target/arm: Implement MVE VMULL (polynomial)
  target/arm: Implement MVE incrementing/decrementing dup insns
  target/arm: Factor out gen_vpst()
  target/arm: Implement MVE integer vector comparisons
  target/arm: Implement MVE integer vector-vs-scalar comparisons
  target/arm: Implement MVE VPSEL
  target/arm: Implement MVE VMLAS
  target/arm: Implement MVE shift-by-scalar
  target/arm: Move 'x' and 'a' bit definitions into vmlaldav formats
  target/arm: Implement MVE integer min/max across vector
  target/arm: Implement MVE VABAV
  target/arm: Implement MVE narrowing moves
  target/arm: Rename MVEGenDualAccOpFn to MVEGenLongDualAccOpFn
  target/arm: Implement MVE VMLADAV and VMLSLDAV
  target/arm: Implement MVE VMLA
  target/arm: Implement MVE saturating doubling multiply accumulates
  target/arm: Implement MVE VQABS, VQNEG
  target/arm: Implement MVE VMAXA, VMINA
  target/arm: Implement MVE VMOV to/from 2 general-purpose registers
  target/arm: Implement MVE VPNOT
  target/arm: Implement MVE VCTP
  target/arm: Implement MVE scatter-gather insns
  target/arm: Implement MVE scatter-gather immediate forms
  target/arm: Implement MVE interleaving loads/stores
  target/arm: Implement MVE VADD (floating-point)
  target/arm: Implement MVE VSUB, VMUL, VABD, VMAXNM, VMINNM
  target/arm: Implement MVE VCADD
  target/arm: Implement MVE VFMA and VFMS
  target/arm: Implement MVE VCMUL and VCMLA
  target/arm: Implement MVE VMAXNMA and VMINNMA
  target/arm: Implement MVE scalar fp insns
  target/arm: Implement MVE fp-with-scalar VFMA, VFMAS
  softfloat: Remove assertion preventing silencing of NaN in default-NaN
    mode
  target/arm: Implement MVE FP max/min across vector
  target/arm: Implement MVE fp vector comparisons
  target/arm: Implement MVE fp scalar comparisons
  target/arm: Implement MVE VCVT between floating and fixed point
  target/arm: Implement MVE VCVT between fp and integer
  target/arm: Implement MVE VCVT with specified rounding mode
  target/arm: Implement MVE VCVT between single and half precision
  target/arm: Implement MVE VRINT insns
  target/arm: Enable MVE in Cortex-M55

 docs/system/arm/emulation.rst  |    1 +
 target/arm/helper-mve.h        |  425 +++++++
 target/arm/translate-a32.h     |    2 +
 target/arm/translate.h         |    6 +
 target/arm/vec_internal.h      |   11 +
 target/arm/mve.decode          |  463 +++++++-
 target/arm/t32.decode          |    1 +
 target/arm/cpu.c               |    3 +
 target/arm/cpu_tcg.c           |    7 +-
 target/arm/mve_helper.c        | 1899 +++++++++++++++++++++++++++++++-
 target/arm/translate-mve.c     | 1154 ++++++++++++++++++-
 target/arm/translate-neon.c    |    6 -
 target/arm/translate-vfp.c     |    2 +-
 target/arm/translate.c         |   33 +
 target/arm/vec_helper.c        |   14 +-
 fpu/softfloat-specialize.c.inc |    1 -
 16 files changed, 3911 insertions(+), 117 deletions(-)

-- 
2.20.1

