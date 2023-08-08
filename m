Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1877110ejb;
        Mon, 7 Aug 2023 20:13:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhPuxy5mgzGfhBl5gQ0aj5oQWnLXKYKZABj4QQ369NSztHybbU/Tv/WenDMdtKmZHlh4QP
X-Received: by 2002:a05:622a:c5:b0:40f:dd5f:d36b with SMTP id p5-20020a05622a00c500b0040fdd5fd36bmr14300405qtw.23.1691464415527;
        Mon, 07 Aug 2023 20:13:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691464415; cv=none;
        d=google.com; s=arc-20160816;
        b=OjhWzjO69bpZYuQQS8ybCdIAy+z/v7z5FDPk+V0guaG5sDo14QYDQTYai/8HR6rN8k
         pe9Q22uCHm3VMGekX0TiRE+js6vMiP6S0c0A2ikbzwygThblr5rBG3oGHcrpV5ynWV3c
         C66a0VfB6Z10r3HxLNwifbkN/lUz7+5R3u7X3TvhSqo+cAP5rpGTS21tEFejj07Jyi4U
         TZKyVgoTtlr+yO/0sdjxxNeE0yqT75gzW3sQKTLgg66Og8pYVHNwOOUFtAGyYVuXLpCS
         wOJldliBGZdY0xvAe2MWoVKtBJ0rw7jxIehAgikjcREp2YD3qZ9oqO58EZ0BlmMnibjB
         XT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=beXQyTRLGdD+zrgylrsHYTELdRMMXnrVVBuGcJOXCHg=;
        fh=hqs26moy805PsHbwd88lUczy2QdlfF59ojSMxj/DeWg=;
        b=M6w4o2OFVpgRJdoidGGH/QaAv/32ueMZsKdn6bNLNcI78vnBngDolae0GmITJvzHdy
         4eghfkr39WfBtXf1S44jMHcWjoLZg8Z4fEyxFhg9Ectd+LJ22/M5J02wQCImkjzSqW4m
         VASg9ewbdJ0iZXE/VbqGx0oqinsKcDUUE7mP8IgdDTe+OPI1/fqzQAVrBii+T8O+CRUw
         uXaLGwI6MWntcWz6k7Sofn05cy9/H/9MLUgay3+JmdvcvJ+tpiwRZ7+YnC07sN9VLto6
         Y8rbYEyBWnAeERbd6SOqWBiN6AEksGxzCRx0nqa52JINi8RfVRPxt2NSFWonis2/ONSj
         8Zcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iDVMP18r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1-20020ac85b41000000b00403a491f7e1si5803512qtw.50.2023.08.07.20.13.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 20:13:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iDVMP18r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qTD8R-0008Ri-0W; Mon, 07 Aug 2023 23:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8P-0008Q0-Nl
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 23:11:49 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8M-00006m-Jq
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 23:11:49 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-686f0d66652so4949747b3a.2
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 20:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464304; x=1692069104;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=beXQyTRLGdD+zrgylrsHYTELdRMMXnrVVBuGcJOXCHg=;
 b=iDVMP18rzv9csWNh0WdGZIWaCPqWys/mxgMYr0W1vj2iiEHZhsjWfDozIi+ovBKLoX
 lkK6hFeyxu9BOv5x5CLNiWhIsPU8vduD6z2XaHrfJM6npn+om9dPKIvmCJU/0tB/VTBQ
 2OEc4RQrlNMH2Qzhs/BGRvabkZNxNG/OPQrOl0AvAlwb/qas79DvN8BDwdk/nN6BYAZv
 TcrMHSybUsvHVKYkK2wjCnX7iE9yK3J9/gkQ5j8kX9k9j98aDAlHDgajMWvipLGoRLnH
 RAoWhGvx1zw+tprzQA2lpZGT09axpFLngJnr2/ys/s16f1AG9xPjKkUrgZa2v4jZB2pt
 xSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464304; x=1692069104;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=beXQyTRLGdD+zrgylrsHYTELdRMMXnrVVBuGcJOXCHg=;
 b=SbgHS6o7VAXTEuaXgDuAs03BOhNRiTThOsUeCxlEHVqOZVRM10rjs1eW4KuSDfsDe8
 Ps3lVsReknJmQLKYU56+YFtgvQds/OmnVq6fbAR+xJbnMVFa0lNqEbJ+LT5IPTnHSMVN
 rTBiczeJg/9g28hHAZIVHXXHaF2Y3Ro9Ajmh6BcDlVFY1LU6gzkHSYUdsvwAKyBWIWzR
 BVw4QjkhUe1kHTFp5u2cAfP2AEob4CpQIMxI0w1YuisyCqkdwnv53OF771wioIyNPtB4
 N3dEarJo6r+vyWWQ4c8Pf/Ur+/vGcWruOqJ9eTh/Iny6XBrqSyPObZYKjWwHQmnx74Tj
 kYQw==
X-Gm-Message-State: AOJu0Yw1lVek47d4EpzVXElOMp3bWarSRxrsdvsCZEqR8bPN0SBrBUC4
 x2viG3p4aLgvIl5wB6cNvPvf6Q==
X-Received: by 2002:a05:6a20:549f:b0:12f:bc36:4c67 with SMTP id
 i31-20020a056a20549f00b0012fbc364c67mr14021987pzk.61.1691464304626; 
 Mon, 07 Aug 2023 20:11:44 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH for-8.2 00/24] tcg: Introduce negsetcond opcodes
Date: Mon,  7 Aug 2023 20:11:19 -0700
Message-Id: <20230808031143.50925-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: aOGygNmmr2GA

Introduce two new setcond opcode variants which produce -1 instead
of 1 when the condition.  For most of our hosts, producing -1 is
just as easy as 1, and avoid requiring a separate negate instruction.

Use the new opcode in tcg/tcg-op-gvec.c for integral expansion of
generic vector operations.  I looked through target/ for obvious
pairings of setcond and neg.


r~


Richard Henderson (24):
  tcg: Introduce negsetcond opcodes
  tcg: Use tcg_gen_negsetcond_*
  target/alpha: Use tcg_gen_movcond_i64 in gen_fold_mzero
  target/arm: Use tcg_gen_negsetcond_*
  target/m68k: Use tcg_gen_negsetcond_*
  target/openrisc: Use tcg_gen_negsetcond_*
  target/ppc: Use tcg_gen_negsetcond_*
  target/sparc: Use tcg_gen_movcond_i64 in gen_edge
  target/tricore: Replace gen_cond_w with tcg_gen_negsetcond_tl
  tcg/ppc: Implement negsetcond_*
  tcg/ppc: Use the Set Boolean Extension
  tcg/aarch64: Implement negsetcond_*
  tcg/arm: Implement negsetcond_i32
  tcg/riscv: Implement negsetcond_*
  tcg/s390x: Implement negsetcond_*
  tcg/sparc64: Implement negsetcond_*
  tcg/i386: Merge tcg_out_brcond{32,64}
  tcg/i386: Merge tcg_out_setcond{32,64}
  tcg/i386: Merge tcg_out_movcond{32,64}
  tcg/i386: Add cf parameter to tcg_out_cmp
  tcg/i386: Use CMP+SBB in tcg_out_setcond
  tcg/i386: Clear dest first in tcg_out_setcond if possible
  tcg/i386: Use shift in tcg_out_setcond
  tcg/i386: Implement negsetcond_*

 docs/devel/tcg-ops.rst                     |   6 +
 include/tcg/tcg-op-common.h                |   4 +
 include/tcg/tcg-op.h                       |   2 +
 include/tcg/tcg-opc.h                      |   2 +
 include/tcg/tcg.h                          |   1 +
 tcg/aarch64/tcg-target.h                   |   2 +
 tcg/arm/tcg-target.h                       |   1 +
 tcg/i386/tcg-target.h                      |   2 +
 tcg/loongarch64/tcg-target.h               |   3 +
 tcg/mips/tcg-target.h                      |   2 +
 tcg/ppc/tcg-target.h                       |   2 +
 tcg/riscv/tcg-target.h                     |   2 +
 tcg/s390x/tcg-target.h                     |   2 +
 tcg/sparc64/tcg-target.h                   |   2 +
 tcg/tci/tcg-target.h                       |   2 +
 target/alpha/translate.c                   |   7 +-
 target/arm/tcg/translate-a64.c             |  22 +-
 target/arm/tcg/translate.c                 |  12 +-
 target/m68k/translate.c                    |  24 +-
 target/openrisc/translate.c                |   6 +-
 target/sparc/translate.c                   |  17 +-
 target/tricore/translate.c                 |  16 +-
 tcg/optimize.c                             |  41 +++-
 tcg/tcg-op-gvec.c                          |   6 +-
 tcg/tcg-op.c                               |  42 +++-
 tcg/tcg.c                                  |   6 +
 target/ppc/translate/fixedpoint-impl.c.inc |   6 +-
 target/ppc/translate/vmx-impl.c.inc        |   8 +-
 tcg/aarch64/tcg-target.c.inc               |  12 +
 tcg/arm/tcg-target.c.inc                   |   9 +
 tcg/i386/tcg-target.c.inc                  | 265 +++++++++++++--------
 tcg/ppc/tcg-target.c.inc                   | 149 ++++++++----
 tcg/riscv/tcg-target.c.inc                 |  45 ++++
 tcg/s390x/tcg-target.c.inc                 |  78 ++++--
 tcg/sparc64/tcg-target.c.inc               |  36 ++-
 35 files changed, 572 insertions(+), 270 deletions(-)

-- 
2.34.1

