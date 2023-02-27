Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4294041ejc;
        Sun, 26 Feb 2023 21:37:28 -0800 (PST)
X-Google-Smtp-Source: AK7set9++/QXbmuymRo/sGSv25L2QuL7QUFjFJ2HwfPCwrePdycbYM9mSR245hW66KFFK40MhLiA
X-Received: by 2002:ad4:5ec6:0:b0:56e:9dd8:4812 with SMTP id jm6-20020ad45ec6000000b0056e9dd84812mr49812401qvb.3.1677476248542;
        Sun, 26 Feb 2023 21:37:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476248; cv=none;
        d=google.com; s=arc-20160816;
        b=YMFS56xgnTjs4xzQRaleFK7i9cErJeHQoTvy9evLrjq2/pByIyFi07xxamrWqqRz0n
         DkWSCG53waA9wcBy2CvXZtCaKTx0H/AT9nalkJmX8mxJj0WK9brA3BWB3VKBLGlVc71q
         46JT4LawTn46EnBjLJFZc1BsffxeWdpjczEmz2MtRE/vl+3QbvXc72U5wYgFi0Y+kxvG
         7Z0vEqCHvhpuL4SLK/IEN4rTB2h+dbUEClDGV0vJZj5BHVETPRgDmMzGsSD2UK/KwBZK
         H9TFbj55GehFbXOel8qtp2X8Fa8g1Xk3CjmZyvg9XUGZVjJlyJbD72QlNi20ELUXeAII
         S38w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=B2k63odgqwCwMmlbN0Ay9HxzLH/H4RVV/EBr82yWI7k=;
        b=raU6oT9tWvE/E8ErWJ1M4cgqB3mfyPUEYVvcwEURQU2RaFNFvuc2RluXT5nkWCZgBa
         VwYR62uLJfhfFdro22UtPrXoGM4J3XW7Bt/NTBaUg5vi0MDISQkZu8aR0D3d8DHgBdnO
         WtZX51/xoJenRNiZaxTp2GzTpxSZ2NrDQxJc23CNSMUH4sMfoNge/vRHJ2bW0s/uEwVn
         wyj113ZXX8mwvI+/E97rL6A/veZNABT700p7Z2LRWw2/zYJ1bmXrE7Zek7byFJ8rzcW3
         snC8fxAJNT6tL394UtiWpJobt7vNiwALBoGKJ42DfdV776KQmY04p1/oyxhhWzOg5YnV
         7PAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mI3JkLRN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l26-20020a0c979a000000b005355b070980si5217688qvd.463.2023.02.26.21.37.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:37:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mI3JkLRN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWCF-0001O3-AW; Mon, 27 Feb 2023 00:37:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCD-0001Hq-3a
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:37:09 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCB-0002Oc-Av
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:37:08 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so4382460pjg.4
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B2k63odgqwCwMmlbN0Ay9HxzLH/H4RVV/EBr82yWI7k=;
 b=mI3JkLRNmk389spVlxsA6a+OCzUabjk1K20R4AyZ3J8IXm8U1Whi86fIordpk8z1E5
 caRRjwvaAkxhUBUo6jdI1TxMRqN9cDjBuLo6YepoG+wZFixrXpLzMTTiFa+rPTSnF7l9
 8r1+Z/J1fST0PVr2niMw8iZhggWvQCfIatZyuRLegB1kuyK2mRDDZiUJyf44VpVSvynH
 14mdRwL8/TRwza5iOR98b2rdY8qLbT0oqG8c72kea3luKfQixBSxKXP1iKje3F1/zNt9
 rvGAYA17WLbJ5HwAbaxpwul0pkIgo5H1aUvXGIjBp16Q3QcIxDYJqp5+GIBWVh5KKGD4
 i+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B2k63odgqwCwMmlbN0Ay9HxzLH/H4RVV/EBr82yWI7k=;
 b=s37/mRthkB5CdEmydOo+k5jzlXBg7h0btIepg6KovVHhKXMH3tSfUvM8rjUSTxuaLx
 1i47xnyyv69ZMnjUtq9NRUg9j0IYZ/hVDWZObS+tolknsYUCTZtuddvZV+amPCjslt2b
 jEZw/xwsUk0efJ9nMCbHxBaoTwRyOMNfoxD30Vu8Ld4EEQHdMhyv8kZV3Wd8E8sGMvFq
 EMHVXkaaErieGMFdayHCnruQt76QVmRhRBSwo4JhlRcoq8bPz7evMIsxEPUpI6MLJmXA
 +RDtKM9flWRP/BYzqAPUts6ZyT38IsBqfK4jXwdM24OR7kYVN76j+4UZyE8rLGYJWukQ
 t6lQ==
X-Gm-Message-State: AO0yUKXLBL9nl/5EaCGyvRjEig57fGqT3CWiz7Zh0oKjCUStb8DeAnQ4
 /EaTFcDDXd2pgyzKUD95KbjKMjPm5t7ZArFNpkg=
X-Received: by 2002:a05:6a20:9382:b0:cc:7faa:ae10 with SMTP id
 x2-20020a056a20938200b000cc7faaae10mr10906796pzh.54.1677476225919; 
 Sun, 26 Feb 2023 21:37:05 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v4 00/31] tcg: Simplify temporary usage
Date: Sun, 26 Feb 2023 19:36:30 -1000
Message-Id: <20230227053701.368744-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Zd3hob9C7wP8

The biggest pitfall for new users of TCG is the fact that "normal"
temporaries die at branches, and we must therefore use a different
"local" temporary in that case.

The following patch set changes that, so that the "normal" temporary
is the one that lives across branches, and there is a special temporary
that dies at the end of the extended basic block, and this special
case is reserved for tcg internals.

Changes for v4:
  * Add patch 23, target/hexagon/idef-parser: Drop gen_tmp_local

Patches lacking review:
  07-tcg-Add-liveness_pass_0.patch
  17-tcg-Don-t-re-use-TEMP_TB-temporaries.patch
  23-target-hexagon-idef-parser-Drop-gen_tmp_local.patch


r~


Richard Henderson (31):
  tcg: Adjust TCGContext.temps_in_use check
  accel/tcg: Pass max_insn to gen_intermediate_code by pointer
  accel/tcg: Use more accurate max_insns for tb_overflow
  tcg: Remove branch-to-next regardless of reference count
  tcg: Rename TEMP_LOCAL to TEMP_TB
  tcg: Use noinline for major tcg_gen_code subroutines
  tcg: Add liveness_pass_0
  tcg: Remove TEMP_NORMAL
  tcg: Pass TCGTempKind to tcg_temp_new_internal
  tcg: Use tcg_constant_i32 in tcg_gen_io_start
  tcg: Add tcg_gen_movi_ptr
  tcg: Add tcg_temp_ebb_new_{i32,i64,ptr}
  tcg: Use tcg_temp_ebb_new_* in tcg/
  tcg: Use tcg_constant_ptr in do_dup
  accel/tcg/plugin: Use tcg_temp_ebb_*
  accel/tcg/plugin: Tidy plugin_gen_disable_mem_helpers
  tcg: Don't re-use TEMP_TB temporaries
  tcg: Change default temp lifetime to TEMP_TB
  target/arm: Drop copies in gen_sve_{ldr,str}
  target/arm: Don't use tcg_temp_local_new_*
  target/cris: Don't use tcg_temp_local_new
  target/hexagon: Don't use tcg_temp_local_new_*
  target/hexagon/idef-parser: Drop gen_tmp_local
  target/hppa: Don't use tcg_temp_local_new
  target/i386: Don't use tcg_temp_local_new
  target/mips: Don't use tcg_temp_local_new
  target/ppc: Don't use tcg_temp_local_new
  target/xtensa: Don't use tcg_temp_local_new_*
  exec/gen-icount: Don't use tcg_temp_local_new_i32
  tcg: Remove tcg_temp_local_new_*, tcg_const_local_*
  tcg: Update docs/devel/tcg-ops.rst for temporary changes

 docs/devel/tcg-ops.rst                      | 230 +++++++++-------
 target/hexagon/idef-parser/README.rst       |   4 +-
 include/exec/gen-icount.h                   |  12 +-
 include/exec/translator.h                   |   4 +-
 include/tcg/tcg-op.h                        |   7 +-
 include/tcg/tcg.h                           |  64 ++---
 target/arm/translate-a64.h                  |   1 -
 target/hexagon/gen_tcg.h                    |   4 +-
 accel/tcg/plugin-gen.c                      |  32 +--
 accel/tcg/translate-all.c                   |   2 +-
 accel/tcg/translator.c                      |   6 +-
 target/alpha/translate.c                    |   2 +-
 target/arm/translate-a64.c                  |   6 -
 target/arm/translate-sve.c                  |  38 +--
 target/arm/translate.c                      |   8 +-
 target/avr/translate.c                      |   2 +-
 target/cris/translate.c                     |   8 +-
 target/hexagon/genptr.c                     |  16 +-
 target/hexagon/idef-parser/parser-helpers.c |  26 +-
 target/hexagon/translate.c                  |   4 +-
 target/hppa/translate.c                     |   5 +-
 target/i386/tcg/translate.c                 |  29 +-
 target/loongarch/translate.c                |   2 +-
 target/m68k/translate.c                     |   2 +-
 target/microblaze/translate.c               |   2 +-
 target/mips/tcg/translate.c                 |  59 ++---
 target/nios2/translate.c                    |   2 +-
 target/openrisc/translate.c                 |   2 +-
 target/ppc/translate.c                      |   8 +-
 target/riscv/translate.c                    |   2 +-
 target/rx/translate.c                       |   2 +-
 target/s390x/tcg/translate.c                |   2 +-
 target/sh4/translate.c                      |   2 +-
 target/sparc/translate.c                    |   2 +-
 target/tricore/translate.c                  |   2 +-
 target/xtensa/translate.c                   |  18 +-
 tcg/optimize.c                              |   2 +-
 tcg/tcg-op-gvec.c                           | 189 +++++++------
 tcg/tcg-op.c                                | 258 +++++++++---------
 tcg/tcg.c                                   | 280 ++++++++++++--------
 target/cris/translate_v10.c.inc             |  10 +-
 target/mips/tcg/nanomips_translate.c.inc    |   4 +-
 target/ppc/translate/spe-impl.c.inc         |   8 +-
 target/ppc/translate/vmx-impl.c.inc         |   4 +-
 target/hexagon/README                       |   8 +-
 target/hexagon/gen_tcg_funcs.py             |  18 +-
 46 files changed, 682 insertions(+), 716 deletions(-)

-- 
2.34.1

