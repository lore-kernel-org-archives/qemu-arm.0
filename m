Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1128825lfg;
        Thu, 1 Apr 2021 22:38:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKW1FC1TvXeFejSylc0snjLnvI74GBsTbk668r0VhiwrSc+rLntOAYEVUBNpNHFh+YXXMz
X-Received: by 2002:a02:7f0e:: with SMTP id r14mr11295329jac.112.1617341886039;
        Thu, 01 Apr 2021 22:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617341886; cv=none;
        d=google.com; s=arc-20160816;
        b=0s0CUTaqIojjXdlbHIJ1yMI7lPwKbmIYUlEbXVv+s9EfuJGCWv5vDAT4l/cNnKPPNV
         JthBWZT6p0uv0w/K6ng1ijILUm0C7tF+i407XshdqVYYtlt4RbOWqZri2GejcIuFtQiD
         /b1JctI93FXab3e1C0HZVNibjIcvPx9lKeEq7oTxP5NvKTeAE4xDOtTaAIjibLJ9u1zV
         4fLyKJN82B5NjtNFEGCSLcCpLvdT5I3lvXCtTUxGQVxBilgeeb4rwRtRS67MvZEqrYX8
         oqlguL+OQDi+Hjj1+NuP3cRJafvLPt/lMcJwk4q/QDXlKov9YXS9nT8xmid0s55gEWNi
         mHag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=P7OeMQi9Fy965ZESvD0QJwHLzMPBCmAGEybjj57QBfg=;
        b=Bw6lDcOKhSvMOujPdB+Qx6Uo9+q4LbKHljFNf2snlvOWCJgeaWldrsMyqnKgHj31aP
         0KakYec47w4oAfVR/+rRJLblRvhLsQpWNfwH3WvHpxIeiPDBuZh8TYujeemVrCyDYZKC
         J4+Ux9ZezAFJHR0opPpEFflriia7UByzDf62D+Z0MjfU/8/d2KpXgyzdmi8yyfQ+UvPb
         eXdi09sU51bqMm0IE3ZorGaQs3kYD4Ep0/vwBtYAkT+wLmqkqOIpQw2w9K1l2dwJQ98f
         BgmQ/DkO1rmtSqZ/HaW5KETt2WOzkeEBE92wpE3icUSW0FdsfeFacTnOIwWcRJNGNm2m
         jWPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MhVf18zZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11si6914724jaq.60.2021.04.01.22.38.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Apr 2021 22:38:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MhVf18zZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lSCVR-0004Rb-2w
	for alex.bennee@linaro.org; Fri, 02 Apr 2021 01:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSCUz-0004QU-Sq
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 01:37:37 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:53997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSCUw-0004SE-Hg
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 01:37:37 -0400
Received: by mail-pj1-x1036.google.com with SMTP id t18so2234819pjs.3
 for <qemu-arm@nongnu.org>; Thu, 01 Apr 2021 22:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P7OeMQi9Fy965ZESvD0QJwHLzMPBCmAGEybjj57QBfg=;
 b=MhVf18zZkHK2y8Dn+XeLdDZiZmuk3qfm8ZcumoXmjUOs5mTqOYmhfY5RAbJuL0kkBH
 eYD6Eea0Aq3EACI7jFtorBncC0cq/Dt8jcODDhO5ZWu84N1x2gZ9Vniue1dzLhrdERY7
 ugi11IKe+YBAkkWEB9YECl4PzQwESI6whvRiV4JAczPtZF6WOy/Fkpt35MAGXGoFPA7W
 gTrLKqOCXtoXl0PVoq4MiHAYjJyKVCXBg0SnD8VWH2gFPT8/erGFojUA0J/I2RDOER/4
 gObL46lErwkj8hLr0CLpVIDJoyIQ8Ox8seLMSUg1KXMhEwYRQ9Ddnc1F5PZgEMu3fxdI
 MzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P7OeMQi9Fy965ZESvD0QJwHLzMPBCmAGEybjj57QBfg=;
 b=l8usbcHjiofYEb17pjWJ6tdRSlBE/h+djdOhQ6bdQXDPLFaC1Q/rz/q85tyUc3H7an
 H7blgZvv7d+fkQILP9MVlRFe0MXGEjFTuDjUAfHjkpDBockVtK6d0Ev0/j4hkWQTNcci
 1qyK90+b3wG03k2RukzzRYUH24oDTPM24+st2ZkJqEsUcHbHxRO+K0JcVdH84LVuN1+k
 VeMkqTAML03Cyin3oPPm15KTljkx+W+vLvkR4UV/aZt7b+vhmBPI9jx3W0HlgXMEcA0M
 vCEe0Co4g+zzGyipo8ltJQKCBhLpHR9ZXWv9PeKvH3f5vd/ZMAgCr3SxCYwQ4EtahI/b
 dH8g==
X-Gm-Message-State: AOAM5321mqkamxE+Zyi3zb9jv46C3BcjmF2gvOCcouPz3pTJX52es9ue
 Bm6h9xi6TmVzS0Iu+QpTxY95e2oppanfVA==
X-Received: by 2002:a17:902:a404:b029:e6:23d:44ac with SMTP id
 p4-20020a170902a404b02900e6023d44acmr11073449plq.50.1617341852062; 
 Thu, 01 Apr 2021 22:37:32 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id g10sm6908074pgh.36.2021.04.01.22.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 22:37:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/arm: Fix unaligned mte checks
Date: Thu,  1 Apr 2021 22:37:26 -0700
Message-Id: <20210402053728.265173-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
X-TUID: X+syaYn2Kwvr

I was incorrectly assuming that only the first byte of an MTE access
is checked against the tags.  But per the ARM, unaligned accesses are
pre-decomposed into single-byte accesses.  So by the time we reach the
actual MTE check in the ARM pseudocode, all accesses are aligned.

There's probably more that could be simplified here, but I did try to
keep the patch small-ish.


r~


Richare Henderson (2):
  target/arm: Check PAGE_WRITE_ORG for MTE writeability
  target/arm: Fix unaligned mte checks

 target/arm/helper-a64.h           |   3 +-
 target/arm/internals.h            |  13 +--
 target/arm/translate-a64.h        |   2 +-
 target/arm/mte_helper.c           | 171 ++++++++++++------------------
 target/arm/sve_helper.c           |  96 ++++++-----------
 target/arm/translate-a64.c        |  52 ++++-----
 target/arm/translate-sve.c        |   9 +-
 tests/tcg/aarch64/mte-5.c         |  44 ++++++++
 tests/tcg/aarch64/Makefile.target |   2 +-
 9 files changed, 179 insertions(+), 213 deletions(-)
 create mode 100644 tests/tcg/aarch64/mte-5.c

-- 
2.25.1

