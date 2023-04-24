Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2595736ejm;
        Sun, 23 Apr 2023 22:42:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350ahOaYzRY9p+iEAuEH93JOg2yaypzVX7ojlpGMarwU1VcH1iBjGNioboxsf75bf4WyOZW46
X-Received: by 2002:a05:622a:24f:b0:3ef:472c:8b2f with SMTP id c15-20020a05622a024f00b003ef472c8b2fmr21393789qtx.36.1682314926492;
        Sun, 23 Apr 2023 22:42:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682314926; cv=none;
        d=google.com; s=arc-20160816;
        b=bsPdFECrHWrlHNR27jPZUumtVEA1XEPaSFp8KDuoBfZX/hV6jns3GfOUjRTT5jeMbZ
         69nmsrN5ZtrM23Ag+PK1rovZz489BbSGIXoDCx6gFdO2hNkZhTdwhbtfU/geZO9bS0Ks
         lP23DX26okMqgOZmYcnWNRVrWC+6TLk/+q6/euGflMEhcSMlf4EtbiAS1xudcVRdcZcr
         TGVwbSG8TCA5/yhLM1kuo7/txOoaPf2mymEcCgS3CisoSjHtxbVt2ovOMGfa2Pemrd+b
         ZifMjVHaVzZ7ay0Kltlg6bMdLJQnR71wYYYnXjJWekr+P/bYsDuAZirN70ixYMH3/1UT
         e4Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=7dfGiQBKAXIqxBwrd740S4+peVDG4jIjn+MoYXewMdY=;
        b=KzTSrdDiaf+kvhNsc06CxgrdTkRskOKZTQplhBUpQnwXjJ1PyVbJON2FTLQcfYKdrs
         0nz/sA+lW4ygKxOXFoDAnDmuOadpIqwUQaS+LsrGFZhpS9xwA61nb3fYSOxgQMvgz2IZ
         hpT82Anl+JZshH+JlnlMvWOa2WBwOuDztQs6BnusFfDRQnNQ/zXNC0lY83x/lBaJwC4B
         1APblptXLpm3OTnH62AJ3X21QTKOL/F5bHv4S4WkCLXaHAIrX+Mkt6VrWg4MipW7PFi/
         lGOTS++H1c5NDHacPZaodfA/mosyu8zXTbZq/hkTnALAi3Cn8cQvCY6Fg0jHaumr0iKV
         Qi8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uaeGlagl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k16-20020a05620a0b9000b0074c473c1542si6157800qkh.369.2023.04.23.22.42.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:42:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uaeGlagl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqowv-00059e-VB; Mon, 24 Apr 2023 01:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowt-00058D-IL
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:41:15 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqown-0004Di-6d
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:41:14 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f19a80a330so9364665e9.2
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 22:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314866; x=1684906866;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7dfGiQBKAXIqxBwrd740S4+peVDG4jIjn+MoYXewMdY=;
 b=uaeGlaglkdcapwbYzoj95n7PAEMsEhH/d6ikHY8YeI6WVWcWjxWc0Wkqr55OdcwCLq
 i3pdFxL8YsuYPDkDJxJK+UZtFa4S8sJVeDThX9vRJvObJ1WT6rZFUyv3M1BCgWtXSI31
 X174F6qKIaZY5Tmi3fgGTIeBcVgVw5ZFZFZbEFWSfM4sUZXlT7Mbh3TIxePKjP1mgYvN
 uEo9gRlMo9gF3x8bYoMcAvlJZkJj/Sn9OD/zSafPT+QQPw1jScIYl6J1uRdRd/8G9bcV
 o3NLVc0Ul9lRR2xdmn/FEvQ0LfCloVZfqiMqCP6tX6I/S70c6G+EaTj6H+4WjtM7hKTb
 yHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314866; x=1684906866;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7dfGiQBKAXIqxBwrd740S4+peVDG4jIjn+MoYXewMdY=;
 b=k/H0GbT4ePvAGGBNtKoXPBBXLmDsJ4Ie4jMM118vOhmI5WXmOYWZxAvXZLGoeCNFyL
 psxoc8zIzPpFro4F/U80oZvE12ByKm16cum9d0TFmo+CGr4rcA5qLBZbKNk03ibynCpJ
 71bsKVRg3wEEIXe5HdJvbLYWPwACbvfh13zmUwRICs281SXRi/bHdXs4p5j7ReHDh/II
 jqTcyHZ+LSG23g5z9tdymQwJzq2Uyo0dgj2hi2JacO1Stk16vDNKkB0tUpYNFZzCo/vN
 I/5pxf3TionE2K9JujLYeAUW6s5mdquXXLvJdtKPCuTVXscWjjeBPxf2Y76KOOhu2Xil
 OzCA==
X-Gm-Message-State: AAQBX9e5AwF+5n4VXQv6zfk/tfUHMdMnXEoJiZynwClXEyMIQ5Qpn+4h
 lDVo/Sc12vv0o0RTm4XjkP7iZg==
X-Received: by 2002:a5d:46ce:0:b0:2fe:2775:6067 with SMTP id
 g14-20020a5d46ce000000b002fe27756067mr8138395wrs.28.1682314866418; 
 Sun, 23 Apr 2023 22:41:06 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 00/57] tcg: Simplify calls to load/store helpers
Date: Mon, 24 Apr 2023 06:40:08 +0100
Message-Id: <20230424054105.1579315-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yIh5F9jTaENN

v1: https://lore.kernel.org/qemu-devel/20230408024314.3357414-1-richard.henderson@linaro.org/
v2: https://lore.kernel.org/qemu-devel/20230411010512.5375-1-richard.henderson@linaro.org/

There are several changes to the load/store helpers coming, and making
sure that those changes are properly reflected across all of the backends
was harrowing.

I have gone back and restarted by hoisting the code out of the backends
and into tcg.c.  We already have all of the parameters for the host
function call abi for "normal" helpers, we simply need to apply that to
the load/store slow path.

The major change for v3 is prepare_host_addr(), as a merge of several
routines and some code from tcg_out_qemu_{ld,st}.  This is pulled back
from my (working) atomicity patch set, making i128 easier.

The patches are many, but take heart: the diffstat is -523. :-)
About 1/3 of the patches have been reviewed in some form.


r~


Richard Henderson (57):
  tcg/loongarch64: Conditionalize tcg_out_exts_i32_i64
  tcg/mips: Conditionalize tcg_out_exts_i32_i64
  tcg/i386: Conditionalize tcg_out_extu_i32_i64
  tcg: Introduce tcg_out_movext2
  tcg/i386: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/i386: Generalize multi-part load overlap test
  tcg/i386: Introduce HostAddress
  tcg/i386: Drop r0+r1 local variables from tcg_out_tlb_load
  tcg/i386: Introduce tcg_out_testi
  tcg/i386: Introduce prepare_host_addr
  tcg/i386: Use indexed addressing for softmmu fast path
  tcg/aarch64: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/aarch64: Introduce HostAddress
  tcg/aarch64: Introduce prepare_host_addr
  tcg/arm: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/arm: Introduce HostAddress
  tcg/arm: Introduce prepare_host_addr
  tcg/loongarch64: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/loongarch64: Introduce HostAddress
  tcg/loongarch64: Introduce prepare_host_addr
  tcg/mips: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/mips: Introduce prepare_host_addr
  tcg/ppc: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/ppc: Introduce HostAddress
  tcg/ppc: Introduce prepare_host_addr
  tcg/riscv: Require TCG_TARGET_REG_BITS == 64
  tcg/riscv: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/riscv: Introduce prepare_host_addr
  tcg/s390x: Pass TCGType to tcg_out_qemu_{ld,st}
  tcg/s390x: Introduce HostAddress
  tcg/s390x: Introduce prepare_host_addr
  tcg/sparc64: Drop is_64 test from tcg_out_qemu_ld data return
  tcg/sparc64: Pass TCGType to tcg_out_qemu_{ld,st}
  tcg: Move TCGLabelQemuLdst to tcg.c
  tcg: Replace REG_P with arg_loc_reg_p
  tcg: Introduce arg_slot_stk_ofs
  tcg: Widen helper_*_st[bw]_mmu val arguments
  tcg: Add routines for calling slow-path helpers
  tcg/i386: Convert tcg_out_qemu_ld_slow_path
  tcg/i386: Convert tcg_out_qemu_st_slow_path
  tcg/aarch64: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/arm: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/loongarch64: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/mips: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/ppc: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/riscv: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/s390x: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/loongarch64: Simplify constraints on qemu_ld/st
  tcg/mips: Remove MO_BSWAP handling
  tcg/mips: Reorg tlb load within prepare_host_addr
  tcg/mips: Simplify constraints on qemu_ld/st
  tcg/ppc: Reorg tcg_out_tlb_read
  tcg/ppc: Adjust constraints on qemu_ld/st
  tcg/ppc: Remove unused constraints A, B, C, D
  tcg/riscv: Simplify constraints on qemu_ld/st
  tcg/s390x: Use ALGFR in constructing softmmu host address
  tcg/s390x: Simplify constraints on qemu_ld/st

 include/tcg/tcg-ldst.h               |  10 +-
 tcg/loongarch64/tcg-target-con-set.h |   2 -
 tcg/loongarch64/tcg-target-con-str.h |   1 -
 tcg/mips/tcg-target-con-set.h        |  13 +-
 tcg/mips/tcg-target-con-str.h        |   2 -
 tcg/mips/tcg-target.h                |   4 +-
 tcg/ppc/tcg-target-con-set.h         |  11 +-
 tcg/ppc/tcg-target-con-str.h         |   6 -
 tcg/riscv/tcg-target-con-set.h       |   8 -
 tcg/riscv/tcg-target-con-str.h       |   1 -
 tcg/riscv/tcg-target.h               |  22 +-
 tcg/s390x/tcg-target-con-set.h       |   2 -
 tcg/s390x/tcg-target-con-str.h       |   1 -
 tcg/tcg-internal.h                   |   4 -
 accel/tcg/cputlb.c                   |   6 +-
 tcg/tcg.c                            | 582 +++++++++++++++-
 tcg/aarch64/tcg-target.c.inc         | 363 +++++-----
 tcg/arm/tcg-target.c.inc             | 726 ++++++++------------
 tcg/i386/tcg-target.c.inc            | 707 +++++++++-----------
 tcg/loongarch64/tcg-target.c.inc     | 376 +++++------
 tcg/mips/tcg-target.c.inc            | 946 ++++++++-------------------
 tcg/ppc/tcg-target.c.inc             | 637 ++++++++----------
 tcg/riscv/tcg-target.c.inc           | 508 +++++---------
 tcg/s390x/tcg-target.c.inc           | 393 +++++------
 tcg/sparc64/tcg-target.c.inc         |   8 +-
 tcg/tcg-ldst.c.inc                   |  14 -
 26 files changed, 2415 insertions(+), 2938 deletions(-)

-- 
2.34.1

