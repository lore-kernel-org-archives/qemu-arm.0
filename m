Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1182909ejc;
        Mon, 22 Aug 2022 16:25:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7wxJS64lUHglnn7TT4kMZgaPKRCFN9O6M0/MJ72/ddE33G+zzCcz67QgaQbCGlp8z3G4RM
X-Received: by 2002:a05:622a:24c:b0:343:7d3b:4953 with SMTP id c12-20020a05622a024c00b003437d3b4953mr17355384qtx.562.1661210702666;
        Mon, 22 Aug 2022 16:25:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661210702; cv=none;
        d=google.com; s=arc-20160816;
        b=p2OQW5z2CJDBu4UILOB2Ishgk3aDsRdDXUnVxcy/bqMxJedHBeAq9u7Lvv4uheHhgh
         iQuli4V4gEmqg9UpQ44dBSWfwZQ7Bh8POL39bYuC5yOcsY6/TPrm4/g0+FluspXYoIO2
         h4dLGWprJBmrxk3yt65tII8mfJRahy+9YMYCgtnwKqPM8GP5Lr9zv/+/fpWOzJ8W0ik2
         tYjcgfArv1kCKLbPHWVBAJIPWABA9BE2oFsFRu7WVLJYdRqo6A+aMAult2ej7Vimlt97
         bUHr3XEsIppo27ndF4fxChT5lXJZukh+E/J9AYAjN+foopZcOzUugezN9P2y1puZt2mj
         stTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=SvDhIasflD3fFGSr3B+wLFa2QLtjyvoOxN0qJKvVlP8=;
        b=gx0bYxMk6ClHdM3AUUdJju4mIPRliIcKxPw+uR+uuJ1v1GolvfuVNSHZVc4o/SdouH
         4J6ErCxFVIEb+POUf8QwzEILbWVF/AhWuWwjVpX4heT7VH6zcCwL/okZ0hXH2QstHnRV
         f9yxQi56FLEMylVghAeN0nwh5Yw3Gqzjp3nyHp3bXtRxlhK7RQz463MrZ5PzMjgdC4Xc
         ubf9QnGGYm0ehOdY1rRlBqRo+yiUpZL9DSbbXsgROJdUQZA2bMkdSTQ3gJF2Fxp6u21b
         btxSotRSj/hWBuwitABcrkXBmkRRJHCb3z6DSGJuSJaNd5x766EPyhJbJSCFaj5I/2aw
         6Muw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MeeVFZMh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k19-20020ae9f113000000b006bb591f194dsi5216438qkg.141.2022.08.22.16.25.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 16:25:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MeeVFZMh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQGn0-0006ZT-2G
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 19:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlk-0005cb-Fd
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 19:23:46 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:36390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGli-0005aU-Jx
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 19:23:44 -0400
Received: by mail-pl1-x633.google.com with SMTP id c2so11304921plo.3
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 16:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=SvDhIasflD3fFGSr3B+wLFa2QLtjyvoOxN0qJKvVlP8=;
 b=MeeVFZMhC9NM+Pv4fSPKPVH3AXTQymDFTapacRdYEOCZBD/g3b4RTczet9vPwcrKwI
 NczcyNLDiTSueiFz6VPx4P1K3pdiR4ubKYYm1QXR51PJDZZt9TsMzetyW4fix008/2eU
 s2lFP0NbWzUb1JR/kpYFWE3hmWjIi1DyONwrri+BfrxPYc6zPGDaNzxzWW+RFjsWA3IT
 Ut1d4X3V7xIizMGjqTLsEcteQPpKxASsma2GGJVA3tK5BGcYk6BGjBzCnS2svo4WPLRQ
 Sq2lDyBEYHcPKNGowMpBO3XH93INb4s+3qnGYw606VeUEnegBhRYS11ghVi/ZJa4try9
 qEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=SvDhIasflD3fFGSr3B+wLFa2QLtjyvoOxN0qJKvVlP8=;
 b=eVFdb3VgG3Z64sahes+8JVcOZdyqJa21xEJjMooICj8gCOFqOyu3CB80iauww5RoNf
 m63HJHi9vOOcaviLL21/wnP0g1nrvWvGM5MdSwsewRkabfP/sHbcVzWWgV5Yhd/yNyg1
 3EUEIbL46CmitFegBxn8bYLsuugSkM2gx4dGbcsbcaCnq1H+MaeT31yy68ZcR1sUNCa+
 gW0Uub7ADUY7WDLlwRfjbXGhVZAF9LTskO4+11YttO/0o7P1vtejZcJbaPtMN6PEkxmx
 1VuMHx91ZHQsHkgjmVVgu0YlcDy28mR+W6bi76JuFKzIqQCQIFlG9Oxa4f6qz6PxwzCE
 u/5g==
X-Gm-Message-State: ACgBeo3yBuqWCrV+G1Mwj08TsjZPa3JcOn28zpjKTJfNwuAxMzFy4aus
 XOGmBGNbEXt67jRRnzvS9YP+UA==
X-Received: by 2002:a17:902:db12:b0:172:9e51:64 with SMTP id
 m18-20020a170902db1200b001729e510064mr21911846plx.140.1661210620166; 
 Mon, 22 Aug 2022 16:23:40 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa79731000000b0052d3899f8c2sm3809112pfg.4.2022.08.22.16.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:23:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 00/17] accel/tcg + target/arm: pc-relative translation
Date: Mon, 22 Aug 2022 16:23:21 -0700
Message-Id: <20220822232338.1727934-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XyLDXxWsO7wX

Based-on: 20220819032615.884847-1-richard.henderson@linaro.org
("[PATCH v6 00/21] linux-user: Fix siginfo_t contents when jumping to non-readable pages")

v1: https://lore.kernel.org/qemu-devel/20220816203400.161187-1-richard.henderson@linaro.org/

Just a simple refresh from v2 for the dependencies.


r~


Richard Henderson (17):
  accel/tcg: Remove PageDesc code_bitmap
  accel/tcg: Use bool for page_find_alloc
  accel/tcg: Use DisasContextBase in plugin_gen_tb_start
  accel/tcg: Do not align tb->page_addr[0]
  include/hw/core: Create struct CPUJumpCache
  accel/tcg: Introduce tb_pc and tb_pc_log
  accel/tcg: Introduce TARGET_TB_PCREL
  accel/tcg: Split log_cpu_exec into inline and slow path
  target/arm: Introduce curr_insn_len
  target/arm: Change gen_goto_tb to work on displacements
  target/arm: Change gen_*set_pc_im to gen_*update_pc
  target/arm: Change gen_exception_insn* to work on displacements
  target/arm: Change gen_exception_internal to work on displacements
  target/arm: Change gen_jmp* to work on displacements
  target/arm: Introduce gen_pc_plus_diff for aarch64
  target/arm: Introduce gen_pc_plus_diff for aarch32
  target/arm: Enable TARGET_TB_PCREL

 include/exec/cpu-defs.h                 |   3 +
 include/exec/exec-all.h                 |  51 +++++-
 include/exec/plugin-gen.h               |   7 +-
 include/hw/core/cpu.h                   |   9 +-
 target/arm/cpu-param.h                  |   2 +
 target/arm/translate-a32.h              |   2 +-
 target/arm/translate.h                  |  21 ++-
 accel/tcg/cpu-exec.c                    | 108 +++++++----
 accel/tcg/cputlb.c                      |   5 +-
 accel/tcg/plugin-gen.c                  |  23 +--
 accel/tcg/translate-all.c               | 168 ++++++-----------
 accel/tcg/translator.c                  |   2 +-
 target/arm/cpu.c                        |  23 +--
 target/arm/translate-a64.c              | 174 +++++++++++-------
 target/arm/translate-m-nocp.c           |   6 +-
 target/arm/translate-mve.c              |   2 +-
 target/arm/translate-vfp.c              |  10 +-
 target/arm/translate.c                  | 232 +++++++++++++++---------
 target/avr/cpu.c                        |   2 +-
 target/hexagon/cpu.c                    |   2 +-
 target/hppa/cpu.c                       |   4 +-
 target/i386/tcg/tcg-cpu.c               |   2 +-
 target/loongarch/cpu.c                  |   2 +-
 target/microblaze/cpu.c                 |   2 +-
 target/mips/tcg/exception.c             |   2 +-
 target/mips/tcg/sysemu/special_helper.c |   2 +-
 target/openrisc/cpu.c                   |   2 +-
 target/riscv/cpu.c                      |   4 +-
 target/rx/cpu.c                         |   2 +-
 target/sh4/cpu.c                        |   4 +-
 target/sparc/cpu.c                      |   2 +-
 target/tricore/cpu.c                    |   2 +-
 tcg/tcg.c                               |   6 +-
 33 files changed, 517 insertions(+), 371 deletions(-)

-- 
2.34.1

