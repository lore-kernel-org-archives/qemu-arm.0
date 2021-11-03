Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp4293627lfv;
        Tue, 2 Nov 2021 21:04:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+FZk/IRd5OeEauCjpvM3t8jgcbzcMgBwsrumZwGN+a8E+dfuaL0/M2Rfbf9/caNGOZ6gO
X-Received: by 2002:a05:6808:130c:: with SMTP id y12mr8832944oiv.24.1635912283358;
        Tue, 02 Nov 2021 21:04:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635912283; cv=none;
        d=google.com; s=arc-20160816;
        b=0TQi6TlIKt7EUjDYArTiD2LKSM/z/98tV1odjKYrEHvyjqk6AZcecq2ChLhE7OQf7q
         Tgj3KBu6DHcMDbXIvYdRaU594+3oz/DvHTfeBvfXAnuzsPWEAxfCYkGMmFqCB830ujXa
         hruaCdenIvig+wY34FveXluSCYYcZySAnf5IoOYIsAW2hIiMzvdQmOUNE3sa+PewQ4Mp
         sy2avknknfoGgav7KhEzUInpyc1fAsYpbngifD5PCcWyk6nMB3bK5rFCFcDyHD3ADXw+
         dgb5wiCFJM+UiKl6kHU505QVlkeNWYaBn7EaaOXQX+IjHnJl58u4txIfL15Dn5AHrD7p
         0laQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=NHJ/SF6iOxyqykACaNp1q0DJ2H6kHi8msEbDEmyiepw=;
        b=vT5RConkJ7d9XXgQvvA0YEd8mRkMAhqxkcLBw/e8he2GKVaq/6FAE9S9oXwtLuFFoi
         Au98bEhOA7F1CFHs/j1nRd9shpEldxHclmykv5tVbf8ttXbC+jrq0FDriV72CnpVNz08
         MLPeealqPGT980DxN3GbViyZpeyZPADnlw4V20uPUxbz/EUAS7OAWEe0U5p5PQ5ZtBZE
         aURcPdLdvVBPK97d6JZQe9CEqDd15h+eiWWOPJBW1sXhBPtYyHwhlKxxogjuMu36Sw6n
         Xf/GEuIu/gs289Hrs6OUcOxAT9EapZJG3jqRYMacX7Fdb4K2TeSCGSDsC9WX8UlC2DLA
         pCmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ko/ZjUCw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n23si1504109otf.252.2021.11.02.21.04.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Nov 2021 21:04:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ko/ZjUCw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mi7Vy-00055i-KW
	for alex.bennee@linaro.org; Wed, 03 Nov 2021 00:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VF-00054i-OY
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 00:03:57 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:37483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VD-0000tY-FJ
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 00:03:57 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id u16so1496228qvk.4
 for <qemu-arm@nongnu.org>; Tue, 02 Nov 2021 21:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NHJ/SF6iOxyqykACaNp1q0DJ2H6kHi8msEbDEmyiepw=;
 b=Ko/ZjUCwXM5Zy2m1W9sHsaEfmEA7iVbzV+VYKSNUEURMGTZKVfkvrWFmSY9t5lX1DN
 zJfWliwnPhvxCvHoh2kYjqU3fo7PCPUxFhPDqTi3eUla8Lm+kaQNFoSvF2t9e7UW6VN3
 VQMl+HwDJnOexwXVxQ1R3O0xzFKQlGiRHHodM6wdL8Xi5SZT9I994jS/QkQviJBdWhDZ
 3LnvzpVinQED0QHLF5Z9MrSyzEKcxyKMtontNlG2OEz31VRicdW9xMdMRje4YsDfLZ3p
 pzRWaZIM7BD/P5LhL9uPzValQ/vxgHh9Xiff4HFRhdOlFIhQeXC6BxxBI80QEBnnwEVu
 wmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NHJ/SF6iOxyqykACaNp1q0DJ2H6kHi8msEbDEmyiepw=;
 b=ge5BfmMa8yUu8w3VUEpkg2QztfnW63KXivG7G1HyDqO71vHTR3otuM9vy3OAJhGzDM
 wy9oIAm8TnYhWDCgYPyrVrsWx3jsGOsEEeXQJw1qskO9zy0ejSOdKEvnkAGDbT5uoLce
 xVmJe35FTES2uj7H2Iq+bPJrIzTLScYH7n6YOv/ZyBJZqX9f3OPtAvmFFitOzUMba37/
 E8Qau9ocBIQMqa6e2gGxm6ZV8Txa3DYGJf8UkuQO6QaJhMKm4ZYKAQfUXDCvQhKR73TC
 MOXPFftKv/9u6BFVy4aDOtVbfNPwsMxniTtNJFpXaEdyy9Pw/2Pf2lj9ueRftZ6InB6D
 XhCA==
X-Gm-Message-State: AOAM530K2Nrd257AsFsLEgJPZCKNr0Ak9YNIz22rmOxykeJhDE+ejsYF
 m5c3DOSh/b7dwg4ZRnR8HVvBQCvmnSoP3A==
X-Received: by 2002:ac8:701b:: with SMTP id x27mr42549414qtm.246.1635912234275; 
 Tue, 02 Nov 2021 21:03:54 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id br20sm730408qkb.104.2021.11.02.21.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 21:03:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/10] target/arm: Fix insn exception priorities
Date: Wed,  3 Nov 2021 00:03:42 -0400
Message-Id: <20211103040352.373688-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TEoXsxocDgCj

Raise pc alignment faults.
Fix single-step and pc-align priority over breakpoints.
Not yet fixing insn abort priority over breakpoints.


r~


Changes for v4:
  * Rebase on master.
  * Split some cleanups into new patches.
  * No special cases in helper_exception_pc_alignment.

Changes for v3:
  * Rebase on siginfo_t patch set -- while probably only
    force_sig_fault is required, I suspect minor conflicts
    with the other cleanups.
  * Typo fix.

Changes for v2:
  * Handle the exceptions in cpu_loop.
  * Fix how the instruction is raised for aa32 el1.
  * Add pc alignment test cases.

Richard Henderson (10):
  target/arm: Hoist pc_next to a local variable in
    aarch64_tr_translate_insn
  target/arm: Hoist pc_next to a local variable in arm_tr_translate_insn
  target/arm: Hoist pc_next to a local variable in
    thumb_tr_translate_insn
  target/arm: Split arm_pre_translate_insn
  target/arm: Advance pc for arch single-step exception
  target/arm: Split compute_fsr_fsc out of arm_deliver_fault
  target/arm: Take an exception if PC is misaligned
  target/arm: Assert thumb pc is aligned
  target/arm: Suppress bp for exceptions with more priority
  tests/tcg: Add arm and aarch64 pc alignment tests

 target/arm/helper.h               |  1 +
 target/arm/syndrome.h             |  5 +++
 linux-user/aarch64/cpu_loop.c     | 46 ++++++++++++----------
 target/arm/debug_helper.c         | 23 +++++++++++
 target/arm/gdbstub.c              |  9 ++++-
 target/arm/machine.c              | 10 +++++
 target/arm/tlb_helper.c           | 63 ++++++++++++++++++++++---------
 target/arm/translate-a64.c        | 23 +++++++++--
 target/arm/translate.c            | 58 ++++++++++++++++++++--------
 tests/tcg/aarch64/pcalign-a64.c   | 37 ++++++++++++++++++
 tests/tcg/arm/pcalign-a32.c       | 46 ++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  4 +-
 tests/tcg/arm/Makefile.target     |  4 ++
 13 files changed, 271 insertions(+), 58 deletions(-)
 create mode 100644 tests/tcg/aarch64/pcalign-a64.c
 create mode 100644 tests/tcg/arm/pcalign-a32.c

-- 
2.25.1

