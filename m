Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp483998lff;
        Thu, 17 Jun 2021 05:20:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLdZT5nV5VuYDIv7JPn+K8kVjyrBxLI8Uo9vwDP+Ym5q2CuPoEl176j7jDttk25ylb17Rm
X-Received: by 2002:a5d:4e12:: with SMTP id p18mr5545112wrt.105.1623932418378;
        Thu, 17 Jun 2021 05:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623932418; cv=none;
        d=google.com; s=arc-20160816;
        b=ljIiomW1I//68m9tg48bmY9PSAq8fWwt+3c7pl9sfcJEvo4DholVmk65Ge68pl/m5e
         bLEoJxLNobLHWb+kx8y5I9QAp/VXygTfQ7QF80p5lmCcT0cSR9LNv7TPTfjoh/5Rn+zZ
         MeWASVFdCLi6BV6IS0/VcbMwMo+3bpMRigUFIb8cNCvx/vV5+ilNFl727ckXyTOHLoS/
         /GuqmDPLPB/AQAmrtoV1+juG1mYetcJUpvP1nSIVrzF8OKSbbdchQzSKPMJuIgPV8F/M
         UMkFuXQ963RvCoDD6a0yhrOvD5dSSEuGRjs6L8SMSJEwjuW+LdFuYRF9CL9EiUDpXap3
         GKrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=0apxWPgQTsjMO30jLdGi2qRipMwjtbS4l8GmHNHVzGc=;
        b=EkzwSlfLaJqm1t6AHQPCYZ6/8CQN8IghmAW2HEv51MKhuPL1tUbe/LLERhmfnxDLON
         Dm65pZh9WlB2JsWNSkjJDyTHVtvC3LRATN6WG6OUpCwVw+LnaaiOAZW9UK0XBDM9qNgy
         bS5XTp6mhJqZoDpBSLLFpZ93XbdfLlo9ofzCL9Ee/xj/ad1iYencrmHJykb+i0odcHNC
         My0Q/eGrEPjzAub97smzeuDBz+JFWieKCuZaPqoMPz3JePIsIKUI+hlp2INZbJr+ltCC
         Wndl6gDrVfPsmyvmETp5sdHpv8QEDUZnEJhl6e6hEb2aSlg72WTZTNFAoSGtmHAdWGlk
         lJ5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OQRJD07A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15si11114608wmn.179.2021.06.17.05.20.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 05:20:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OQRJD07A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltr0L-0000B2-DF
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 08:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwj-0000pJ-Vx
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:16:34 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwh-0006tW-Ur
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:16:33 -0400
Received: by mail-wr1-x431.google.com with SMTP id m18so6545776wrv.2
 for <qemu-arm@nongnu.org>; Thu, 17 Jun 2021 05:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0apxWPgQTsjMO30jLdGi2qRipMwjtbS4l8GmHNHVzGc=;
 b=OQRJD07AKcaBc1C/E7mRNH8S0j5JPwhCo/oYwwbLXWEGeVe3fD+ZMhRAR2he0Xu4Ht
 MmJmqtVa9n/Ke3jXkSG1Wzn6mnZ+IGl++yjjEz+OijNscn/bYWJvruONe6UkKozORIKO
 A+vuN8hhdHbcH5AfcBG80WF7PkOsdX5MKcblQSDtF4Ngxi+h0A9JsVFUPy3G0O1n+FGo
 Yc1tZzetc8fTudACC7yzSJ7sc3PGksLzwPHQbqE05n2uXRjfF3cayqZN7D+4kKUG/yKi
 EULwelrcdVYniV1JSztZsr7YyYgdpdVOOqecngDEcIWRuHCJXYmv6KkrwsKThar49TEg
 JsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0apxWPgQTsjMO30jLdGi2qRipMwjtbS4l8GmHNHVzGc=;
 b=sXe93cudhz/ZVNOgsYOMvjaTgn5XcAlvm8MdNOb+qXr8YYcjFzj+JuMuyhAvDS3Ux8
 KO+o4uTXVMziiqaDH7Son5lhoe94jAyR6oMKJWOcyvqU+VWcn6HZO1fX1Xw7YHMpB2aK
 i25bubI10M+8kESlEPM/YdsWwOCbDsA8UoTuuqA2Sb8SuQNGpq3at4C3/+9orOpQ8rIZ
 nvFC6qUJifUUsJ7x6NXE0fgnVRNkT4l1+od6hO8x0LcVNP9XB+JbB6ir3NmbbyoYkoxE
 RDBr7hV/aphgkzgo9UT6uO1DTjIuJQCkb0CW3pR23/NmAXyq9Kjw9Y49hh9mTIUtC6IQ
 Wsgg==
X-Gm-Message-State: AOAM531BWnOjdCLKsnsGaNiiBUnOKs0JZ69lxVheI+wqFO6MaP74YA+u
 rCRJ026it19QypfAObIZKdPWyjxHowxGTg==
X-Received: by 2002:a5d:6a41:: with SMTP id t1mr5438938wrw.113.1623932190438; 
 Thu, 17 Jun 2021 05:16:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 00/44] target/arm: First slice of MVE implementation
Date: Thu, 17 Jun 2021 13:15:44 +0100
Message-Id: <20210617121628.20116-1-peter.maydell@linaro.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ubYhnNUJ92hq

This is the remainder of the MVE patches (a dozen or so are already
in git). All reviewed, except patches 1 and 2.

Changes v2->v3:
 * patches 1 and 2: pass MSIZE into DO_VLDR/DO_VSTR macros,
   so we increment the address by the correct amount for the
   widening/narrowing accesses. Increment the address outside
   the "only if predicated" condition.
 * patch 9: used the header file and renamed to tcg_gen_dup*.
   I also added in a tcg_gen_dup_tl #define.

thanks
-- PMM

Peter Maydell (44):
  target/arm: Implement MVE VLDR/VSTR (non-widening forms)
  target/arm: Implement widening/narrowing MVE VLDR/VSTR insns
  target/arm: Implement MVE VCLZ
  target/arm: Implement MVE VCLS
  target/arm: Implement MVE VREV16, VREV32, VREV64
  target/arm: Implement MVE VMVN (register)
  target/arm: Implement MVE VABS
  target/arm: Implement MVE VNEG
  tcg: Make gen_dup_i32/i64() public as tcg_gen_dup_i32/i64
  target/arm: Implement MVE VDUP
  target/arm: Implement MVE VAND, VBIC, VORR, VORN, VEOR
  target/arm: Implement MVE VADD, VSUB, VMUL
  target/arm: Implement MVE VMULH
  target/arm: Implement MVE VRMULH
  target/arm: Implement MVE VMAX, VMIN
  target/arm: Implement MVE VABD
  target/arm: Implement MVE VHADD, VHSUB
  target/arm: Implement MVE VMULL
  target/arm: Implement MVE VMLALDAV
  target/arm: Implement MVE VMLSLDAV
  target/arm: Implement MVE VRMLALDAVH, VRMLSLDAVH
  target/arm: Implement MVE VADD (scalar)
  target/arm: Implement MVE VSUB, VMUL (scalar)
  target/arm: Implement MVE VHADD, VHSUB (scalar)
  target/arm: Implement MVE VBRSR
  target/arm: Implement MVE VPST
  target/arm: Implement MVE VQADD and VQSUB
  target/arm: Implement MVE VQDMULH and VQRDMULH (scalar)
  target/arm: Implement MVE VQDMULL scalar
  target/arm: Implement MVE VQDMULH, VQRDMULH (vector)
  target/arm: Implement MVE VQADD, VQSUB (vector)
  target/arm: Implement MVE VQSHL (vector)
  target/arm: Implement MVE VQRSHL
  target/arm: Implement MVE VSHL insn
  target/arm: Implmement MVE VRSHL
  target/arm: Implement MVE VQDMLADH and VQRDMLADH
  target/arm: Implement MVE VQDMLSDH and VQRDMLSDH
  target/arm: Implement MVE VQDMULL (vector)
  target/arm: Implement MVE VRHADD
  target/arm: Implement MVE VADC, VSBC
  target/arm: Implement MVE VCADD
  target/arm: Implement MVE VHCADD
  target/arm: Implement MVE VADDV
  target/arm: Make VMOV scalar <-> gpreg beatwise for MVE

 include/tcg/tcg-op.h       |    8 +
 include/tcg/tcg.h          |    1 -
 target/arm/helper-mve.h    |  357 +++++++++++
 target/arm/helper.h        |    2 +
 target/arm/internals.h     |   11 +
 target/arm/translate-a32.h |    2 +
 target/arm/translate.h     |   10 +
 target/arm/mve.decode      |  240 ++++++++
 target/arm/mve_helper.c    | 1175 ++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  759 +++++++++++++++++++++++
 target/arm/translate-vfp.c |   77 ++-
 tcg/tcg-op-gvec.c          |   20 +-
 target/arm/meson.build     |    1 +
 13 files changed, 2646 insertions(+), 17 deletions(-)
 create mode 100644 target/arm/helper-mve.h
 create mode 100644 target/arm/mve_helper.c

-- 
2.20.1

