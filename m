Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3512666lfb;
        Mon, 13 Sep 2021 02:57:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvGfqpAqpgPSN8F/6jSFVS7+Efy7UHhvMOW14ySTPWPH2d8MUuNpRMtRB27FC537RMYwgb
X-Received: by 2002:a25:5645:: with SMTP id k66mr14048799ybb.259.1631527042159;
        Mon, 13 Sep 2021 02:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631527042; cv=none;
        d=google.com; s=arc-20160816;
        b=psAU3cxBLAP90MV/OVh8h3V+lgeGLu9QHQjCuwinP9BuoMDfeKROrLqsGwtj7ZaWl5
         dTgr9XZbNXI6K60R/5tkyu/NKegROMJa/zEn8z7NXzBQtmwWJ0OqPY6qlAsFJe0ovvSx
         OweuIjUUBFwORDpPK1kY60Zej+q9+DMQ2yA6knqb/QgYvS68STjrj693gpzy2LgAKgqs
         /it8DiFdEtj9XUORbwDWw+KJsBvR0mPDVLnMdYAraWutYEFms7YlD6U/+P9leAW3t5LV
         72iVwfCI7t+9MKVA3rlLN/a/kEc/qe7c7FmhgjsK8/39qouO7DJaF64dPvK3UtQ0t+kz
         3j2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=9jap4PU7/eqioHoMoH2P+o8wmj0ULMYRqc/JtNk4Smg=;
        b=A61hQOiAybYzTqM9gyf+daZSDZZcnntLya3XsslXyG33R9AdtSVMaAt3k4YbOPckcw
         Ea7Q5G9ULbngtBLAuSx8jTFT7p5KplesNrNSFeQQk7Spo7N+7A7sIHFQ+PE2phPFUEKu
         s1AdP4lmOoiBoIvFi+oMO4dJo/IWt7yu28ljGZ1WAerE/ey+F7TW7g3SLEiPEfmgHwwD
         UYit4uJoyittggmQILiz4oG2X5VrKy0eYIf0RwWpvo4bdcoqAM8qJzTJpOB2IYZVNwE9
         1kyonk+5sCWqN1p52ijWOvk6k5UnIw9VOtVzPWoySjevcWXqmq0MbnRrMiIMAYPdePqZ
         rpPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yw1D5GTd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a16si7057847ybl.62.2021.09.13.02.57.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 02:57:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yw1D5GTd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPiiH-0002eW-GX
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 05:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifl-00071c-Sx
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 05:54:45 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifk-0001pS-44
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 05:54:45 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 b21-20020a1c8015000000b003049690d882so3629577wmd.5
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 02:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9jap4PU7/eqioHoMoH2P+o8wmj0ULMYRqc/JtNk4Smg=;
 b=yw1D5GTdqk0bsuAFTJN3a64en+nW6MKxbVdrtJWUD5p9NWAeDjFC2FyQ2sQfhe/eFV
 qnC9bNWZaILJBJAAAp8Rxvu52ZZTPRKOjBxokKwy67m0y1o6vD7zcA+s0ElTpSAGlmbu
 PxTTtWQeAu57Po7N/Enc/ABXPofDbc0OpDkng374ssrfKPc7SOHCN4b1pq8Kf8zAA7y8
 y4zq24LpBV4PxGBsltAhPsXhuBamkFqjYEZNUFNyi6TpEjDVp8vaSFrdXEz/rZ+jpwmT
 iS5SqzDSuFyYw1unzP8qJKWefd+n67f7Z9oL2VTITCp4XfYQyb3K2BBKePtE7UsduZ4k
 JqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9jap4PU7/eqioHoMoH2P+o8wmj0ULMYRqc/JtNk4Smg=;
 b=sfpTHifn+38S9TiJg6aEoMV7PM0XuvMZ4cisjcfkvEEAybYcofDRfMURL6RWHZ2QDS
 Lv23coz392ARDeKFuF2wADSlTpmaXsIbwQw0uyVeSsphd8azC7ksAnHkMJ3CRHzla2FS
 1ExFr8XoARo/N5i3CCkDWsj0HFfhFVPKwqoEif0J51PXJdsyxdWW0SjqVjt/Tw6VzWm8
 Pp6FFAB2yVj6WtBn+v46Ejzq8f9OO/6mnoQaZCrm+MzuRyJyjxkMbrz2kNnM58Qvd760
 LwjLYCO1L4hj0cxJ3PMP4fbodNS0c48AOHmYHJWe7mX1WTuCswvzJxPjQ8ibSH5tJEBU
 PIxw==
X-Gm-Message-State: AOAM5313iAr2M0CImXGtpZm4lUypO47kF96v/eHc6xET2nTlas/fhh+0
 tjGgIe5upqpHCTWdh/UDY+nlvCgwZHDSlg==
X-Received: by 2002:a1c:a913:: with SMTP id s19mr10031695wme.26.1631526882641; 
 Mon, 13 Sep 2021 02:54:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m184sm6475338wmm.3.2021.09.13.02.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 02:54:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 00/12] target/arm: Use TCG vector ops for MVE
Date: Mon, 13 Sep 2021 10:54:28 +0100
Message-Id: <20210913095440.13462-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cbOXja4Nvu0R

This patchset uses the TCG vector ops for some MVE
instructions. We can only do this when we know that none
of the MVE lanes are predicated, ie when neither tail
predication nor VPT predication nor ECI partial insn
execution are happening.

Changes v1->v2:

The major change is that instead of just updating the local
s->mve_no_pred flag when we translate an insn that changes the
predication state, we end the TB with DISAS_UPDATE_NONCHAIN.
The exceptions are the code called from vfp_access_check()
(gen_preserve_fp_state() and gen_update_fp_context()). We
can definitely determine the new flag value in one of these cases,
but in the other we can't always.

So patch 1 is new, and adds support to gen_jmp_tb() for
looking at the existing value of is_jmp so it can honour
a preceding request for an UPDATE_NOCHAIN or UPDATE_EXIT.
(We already were assuming this because gen_preserve_fp_state()
can set is_jmp to DISAS_UPDATE_EXIT if icount is in use.)

Patch 2 (new) enforces that FPDSCR.LTPSIZE is 4 on inbound
migration, because we now rely on this architectural invariant.

Patch 3 is the old patch 1, updated as noted above.

Patches 4-6 have been reviewed (they have been very slightly
tweaked to use a new mve_no_predication() function that checks
both s->eci and s->mve_no_pred, rather than v1's direct check
of mve_no_pred.)

Patches 7-12 are new, and add optimized variants of VDUP, VMVN,
various shifts, the shift-and-inserts, and the 1-operand-immediate
insns.

I think this should now be the complete set of optimizations
it's worth implementing at this point.

thanks
-- PMM

Peter Maydell (12):
  target/arm: Avoid goto_tb if we're trying to exit to the main loop
  target/arm: Enforce that FPDSCR.LTPSIZE is 4 on inbound migration
  target/arm: Add TB flag for "MVE insns not predicated"
  target/arm: Optimize MVE logic ops
  target/arm: Optimize MVE arithmetic ops
  target/arm: Optimize MVE VNEG, VABS
  target/arm: Optimize MVE VDUP
  target/arm: Optimize MVE VMVN
  target/arm: Optimize MVE VSHL, VSHR immediate forms
  target/arm: Optimize MVE VSHLL and VMOVL
  target/arm: Optimize MVE VSLI and VSRI
  target/arm: Optimize MVE 1op-immediate insns

 target/arm/cpu.h              |   4 +-
 target/arm/translate.h        |   2 +
 target/arm/helper.c           |  33 ++++
 target/arm/machine.c          |  13 ++
 target/arm/translate-m-nocp.c |   8 +-
 target/arm/translate-mve.c    | 310 ++++++++++++++++++++++++++--------
 target/arm/translate-vfp.c    |  33 +++-
 target/arm/translate.c        |  42 ++++-
 8 files changed, 361 insertions(+), 84 deletions(-)

-- 
2.20.1

