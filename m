Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3753793lfh;
        Mon, 23 May 2022 13:49:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvxhdNGyMiJjGObGSqqa9Ruyf0xwxRQg0HnP02U72eg49vbkulvx+WicQJHQDUiRblPjMD
X-Received: by 2002:a05:6214:14b4:b0:461:d451:90c1 with SMTP id bo20-20020a05621414b400b00461d45190c1mr18482841qvb.58.1653338951879;
        Mon, 23 May 2022 13:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653338951; cv=none;
        d=google.com; s=arc-20160816;
        b=DHRdBlOJMecyUHOfAWt6MmTkMf1KwLRNgMvgSOkSJxbuL9r/V+AO6r4bn+rleyCVxW
         991tJhGFFxwD/xun8Ruh8+oOjoSt81mLfSk65HzU/DLgZ9m6ng1PL25BCn5CxBzjVi72
         f4Td8Ig+Mb4gDDLDDZJS69Fl0CbcYprKa7Sw0HlK1GCKvCNtY4Cc1owMqIfH7fzoBc4m
         47oPQomAs6CUVfCn3jaZgZxjZTlBGuO/6M0XAXhNgQ/wm8OSFv18QS3y+8QiHkpefu5p
         JU5LsO4Vj+4/22nrQzwclFbI3fsn05LcGZZDYbcpGNCSXiDh9734r3Xe3dCoUIVXoIu2
         ejLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=YbH0Qi07uHBhhPIRS648hMMOWcj5g+xQWUqXIeZS4go=;
        b=asxaXbDMSiw0EEngTu2ErZowDLkax/CUOOXD/A9IgbqHg1FMJyrQXPtRidnV06tgH3
         /lLsmH9ZRs+KYCBC/TZLv35P/HOpqAWr++VVyv3a8X1PegMcvjzPSu4QLKshY0DGW1jJ
         yKgaGw58I6bfgR/v2wFUlEe+6zM0avx9Xj9qKeDmMct5x4AK6ee720BD+MPwF8Sve+YU
         ZcINykBaNXljAQgXP1S/ytyhr10nUpVVoGAmTecXxrvRLZ1Uu6CJd51A6wrO/lW7UwKx
         USaFyJAtsqAgDwBZYnsrt5l2JfCDMW9KE3dHkDpVAsEL33szMI/0Yw82S3in/QlmuZ4F
         PcyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XQQ5NiQj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o27-20020a05620a0d5b00b006a0e55849b3si2658729qkl.225.2022.05.23.13.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 May 2022 13:49:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XQQ5NiQj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntEzH-0001r5-AP
	for alex.bennee@linaro.org; Mon, 23 May 2022 16:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntExx-0008DZ-UY
 for qemu-arm@nongnu.org; Mon, 23 May 2022 16:47:53 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:40485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntExu-0004z3-O3
 for qemu-arm@nongnu.org; Mon, 23 May 2022 16:47:49 -0400
Received: by mail-pf1-x433.google.com with SMTP id i24so14699167pfa.7
 for <qemu-arm@nongnu.org>; Mon, 23 May 2022 13:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YbH0Qi07uHBhhPIRS648hMMOWcj5g+xQWUqXIeZS4go=;
 b=XQQ5NiQjDIqlEamOI1J2NgslAAp4VGYx5hej74TuEFfdM17+auxQmbvejijcfks7Df
 qQxjUTFKLdjch5Q+ZAACneZn2e02tO6Suxz+ut9bI9lee9BNjUEK/4xyy9Evx2rwBQ39
 KYLX0SLRjcsEeSBvHxFaTTwvK3rTHfPdVjzIXnlVH4AsgYslSepDseax2SsV0xGu/0QO
 YkQ/0jxqbZGCo11nOeqlZmExTgz70rkkFn1lGRARGj4jAW8pFKN1axc8kc7P77k3F834
 EqYpvRjtdnqNktogCaRlIDiRSWruL+7qvsxC3MdH0RbxYODP3+uFpktXlg42QQB4nLZ7
 WpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YbH0Qi07uHBhhPIRS648hMMOWcj5g+xQWUqXIeZS4go=;
 b=HhTDTa1O7aSAcf5zWlKuN8Jwl6JeH9IzbB90BsHD9OHXSTX8wYygPJFilqHkERs3Fd
 g81zpyek+Z5zpdWoDwuVNcHi7MzvHMcwsLYyXfudtnl/+54iwhKszFjaD4yqUmn0+E7u
 8sXnREu4Qzo7Zy6y0okyPVj7GEQVsVhT3VrSG7qHuz3RGE9kJC35l2f9oLkcYfjwx1jP
 K90qG0T7gzy5gTy/caDNQyZNa2RK/mWE8EVk1glTUOU3xRiTaAVTUZuj59kbZG1vRkxg
 5kdfwdmk0k94399HCXnR0jTtzZXL37O/6umQmnoThjHmyXdunvN6xm+iiUG3CAhbRsAq
 /U2A==
X-Gm-Message-State: AOAM5322xfbCVIbjdse/8+ttZNtUFc0ROeLvNqoEovf6PdXDQ7dvqaDS
 5L6LnB5qKHV02/V5OnUOUZ/tqiAceCvb0g==
X-Received: by 2002:a65:6bc4:0:b0:3c2:2f7c:cc74 with SMTP id
 e4-20020a656bc4000000b003c22f7ccc74mr21486096pgw.307.1653338864124; 
 Mon, 23 May 2022 13:47:44 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 00/18] target/arm: tidy exception routing
Date: Mon, 23 May 2022 13:47:24 -0700
Message-Id: <20220523204742.740932-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6jwuzS2lmDC3

The target el for raising an exception currently lives in at
least 3 places: exception_target_el, arm_debug_target_el, and
in {sve,fp}_exception_el.

This patch set aims to put all of the routing into the same place.

For the purposes of prep for SME, the goal is the last patch,
where we do not confuse the level at which SVE exceptions are
trapped with the level to which exceptions are delivered.

I suspect that the existing SME prep patch where I remove the
fp checks and then compare fp vs sve el, is flawed while this
route_to_el2 line is still present.

The end result for debug exceptions isn't quite as clean as I
was hoping, but hopefully it's still better than before.


r~


Richard Henderson (18):
  target/arm: Allow raise_exception to handle finding target EL
  target/arm: Use arm_current_el for simple exceptions
  target/arm: Move and expand parameters to exception_target_el
  target/arm: Move HCR_TGE check into exception_target_el
  target/arm: Move arm_singlestep_active out of line
  target/arm: Move arm_generate_debug_exceptions out of line
  target/arm: Hoist arm_current_el in arm_generate_debug_exceptions
  target/arm: Use is_a64 in arm_generate_debug_exceptions
  target/arm: Move exception_bkpt_insn to debug_helper.c
  target/arm: Move arm_debug_exception_fsr to debug_helper.c
  target/arm: Move arm_debug_target_el to internals.h
  target/arm: Create raise_exception_debug
  target/arm: Move MDCR_TDE test into exception_target_el
  target/arm: Mark exception helpers as noreturn
  target/arm: Create helper_exception_swstep
  target/arm: Remove TBFLAG_ANY.DEBUG_TARGET_EL
  target/arm: Add cur_el parameter to arm_generate_debug_exceptions
  target/arm: Remove route_to_el2 case from sve_exception_el

 target/arm/cpu.h           | 128 +---------------------------
 target/arm/helper.h        |   7 +-
 target/arm/internals.h     |  64 +++++---------
 target/arm/translate.h     |  14 +---
 target/arm/debug_helper.c  | 167 ++++++++++++++++++++++++++++++++++---
 target/arm/helper-a64.c    |   7 +-
 target/arm/helper.c        |  25 ++----
 target/arm/mte_helper.c    |   7 +-
 target/arm/op_helper.c     | 128 ++++++++++++++++++----------
 target/arm/tlb_helper.c    |  10 ++-
 target/arm/translate-a64.c |   1 -
 target/arm/translate.c     |   1 -
 12 files changed, 289 insertions(+), 270 deletions(-)

-- 
2.34.1

