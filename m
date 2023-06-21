Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp807219ejt;
        Wed, 21 Jun 2023 05:19:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Msm2p0sWAF3i3keNUP0/DZSATWRvZcwcc93XT2Hgw1NJAkCeNsiBcV7es+eaSixsP1WM/
X-Received: by 2002:a05:6214:5098:b0:630:1faa:a404 with SMTP id kk24-20020a056214509800b006301faaa404mr8435271qvb.39.1687349962895;
        Wed, 21 Jun 2023 05:19:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687349962; cv=none;
        d=google.com; s=arc-20160816;
        b=U+Xyf5T5K8FVj9JZsVGwksRBGFLpcc7kQ6lbB6FRGx4ezXLFyM7/1BljNqalyKCHFp
         CbziQKbpuDitrUnSoFieHlNI8Afu4RFkIHgpxJzOOzrSN4z6GGLtjuEytqCKdNX6or5D
         3435urQEljE1u78e7YIS+RaKSrtVx1wptCJUzOYkQ9JtjcQITbOugj2FzVWlIofJFgMp
         VB2vcljZMPZco48ngGL4SEeWlt3vUeqWhO2xThNHJJzm2b/G6mjKRWWXN/RsgPudRGf9
         e87XR9RuXSbydBT8gM0N4hBX5oebl9owVihYsTtIbb/FY7QxepW613dH8QpOXJ6S03C0
         fBwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=rAlG+17uYbn7z1dUbnSUSzcIUYLPGuyIhBKFla2/xV4=;
        b=dB5cgL4iMziO7iwp/KuIwrkWir7+cIfFjif3d2L4no0al+fObfsGXNhW0myxBVbLwP
         j8fJ8cNLUxRiDz1TqszYuCKIRJDhY7X7tGtcQnd7TQj8sdEPO2/9MLW2xrfpRLi/7Ibc
         Pi6mmMkAk6DQODmYZV6GtFCvnXrwR8bNOwM0lrB2cJQWWKlkdSaBFCiUjO68NWVeTycg
         36cxOiNReHfW3VVHM/DKwjdPed9qFXxM8wMJl2RmVAM/YHpxcPSmCnEPlUBRPRVtdQpQ
         z8l92LEVnv7WevAzOVup700migrctme2ALeWbXOc/Y7U0pGd/dLxshKGlRncnKFu9upJ
         VuNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G+TzgQLa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw4-20020a0562140f0400b00625943d8186si867055qvb.335.2023.06.21.05.19.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jun 2023 05:19:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G+TzgQLa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBwnm-0006al-LG; Wed, 21 Jun 2023 08:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBwnk-0006ZA-N5
 for qemu-arm@nongnu.org; Wed, 21 Jun 2023 08:19:08 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBwni-0000Fj-SD
 for qemu-arm@nongnu.org; Wed, 21 Jun 2023 08:19:08 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51a324beca6so7723469a12.1
 for <qemu-arm@nongnu.org>; Wed, 21 Jun 2023 05:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687349944; x=1689941944;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rAlG+17uYbn7z1dUbnSUSzcIUYLPGuyIhBKFla2/xV4=;
 b=G+TzgQLaO8hS2VnlLm5E3hWjjyXUy/V4LAgFB50QspZ+2X8eRyPsP4vtMRLdHpx4M9
 pLkq5hNstQKgWxvuSfKtU0idY9PXUbKrfCSVQx07RWztGKCdFgAF8R1LJdUBMmc0P0Xu
 7vyOs3MLP3wTyHZLvv9NgIFzn+9B1/4grbcfYtJs852Dqds7Yq1Gp8oX7mHom9zgFRy5
 qvwm07RaInxo7K7GC+uJY8ja3a/qjapTqgMxIaNrwop2LRIfPJEHECNNzoOgEG57jiqd
 rDbeSaCHGkTCpb7B9g+J3AiSrBBrB1zf7eAONUPt27FlZ5p7VhFyrzKnn+aO9713ffEK
 4QoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687349944; x=1689941944;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rAlG+17uYbn7z1dUbnSUSzcIUYLPGuyIhBKFla2/xV4=;
 b=Lcl4HUzNx5HwkQTEYWiVYMTn76qyPbJtmgZVSwAgtWj80HAKhtbRVFX7LaLEhGzls2
 JFK8YQq01geJaRZ8o1WyAf2b5C+WkzUc0H5/Ilz6hSDcz9/bFingB7eNycJZE3iBMj2B
 udm52wylwZVTHiPZkwdnAfljidjwhDBDYi7MYOgquhHXarjRQYVi2SZy8V3ZuSHzZlxN
 up/IRqLgeL+NMODDyBUY1A4LAPGvGGP6ZacuK2h9bz5go8SPzCHmwaTFXGqrzL/ZdzeM
 563q+fdT92SRqnSkQWc8mCXAcQrWrPcX6WLXJA3UuJZ+pOHacZREKDXAPqzSmsQWyMJs
 ovzA==
X-Gm-Message-State: AC+VfDxIfFEHeqy/gB9rYbtjali+5fz2+fIHj7lW/vsskXosJaKQbDoK
 IhqBqNTuQ7DqUbiIp60GTlpOMFY2hGe4ACymsJcXFPhm
X-Received: by 2002:aa7:d04f:0:b0:51a:2edb:49ab with SMTP id
 n15-20020aa7d04f000000b0051a2edb49abmr10451265edo.28.1687349944697; 
 Wed, 21 Jun 2023 05:19:04 -0700 (PDT)
Received: from stoup.lan ([176.176.128.70]) by smtp.gmail.com with ESMTPSA id
 s6-20020a056402014600b0051bdf152295sm543176edu.76.2023.06.21.05.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 05:19:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 0/9] {tcg,aarch64}: Add TLB_CHECK_ALIGNED
Date: Wed, 21 Jun 2023 14:18:53 +0200
Message-Id: <20230621121902.1392277-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: XAVW4ZY7Xpa1

v1: https://lore.kernel.org/qemu-devel/20230223204342.1093632-1-richard.henderson@linaro.org/

Prerequisites and some of v1 merged since February.
Split TLB_DISCARD_WRITE renumber to a separate patch,
since there are now dependencies in tcg/.


r~


Richard Henderson (9):
  accel/tcg: Store some tlb flags in CPUTLBEntryFull
  accel/tcg: Move TLB_WATCHPOINT to TLB_SLOW_FLAGS_MASK
  accel/tcg: Renumber TLB_DISCARD_WRITE
  target/arm: Support 32-byte alignment in pow2_align
  exec/memattrs: Remove target_tlb_bit*
  accel/tcg: Add tlb_fill_flags to CPUTLBEntryFull
  accel/tcg: Add TLB_CHECK_ALIGNED
  target/arm: Do memory type alignment check when translation disabled
  target/arm: Do memory type alignment check when translation enabled

 include/exec/cpu-all.h     |  29 ++++++--
 include/exec/cpu-defs.h    |   9 +++
 include/exec/memattrs.h    |  12 ----
 accel/tcg/cputlb.c         | 142 +++++++++++++++++++++++++------------
 target/arm/ptw.c           |  28 ++++++++
 target/arm/tcg/hflags.c    |  34 ++++++++-
 target/arm/tcg/translate.c |   8 +--
 target/sparc/mmu_helper.c  |   2 +-
 tcg/tcg-op-ldst.c          |   2 +-
 9 files changed, 190 insertions(+), 76 deletions(-)

-- 
2.34.1

