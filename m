Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1028135wrq;
        Wed, 23 Oct 2019 08:18:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwB13JnqxkTWPueAX/WazDJimavU9bIYcv/Mss++DOWg/19npEibV2dSgTpRcKEVcTj8TGw
X-Received: by 2002:a05:620a:12c4:: with SMTP id e4mr8738055qkl.336.1571843912555;
        Wed, 23 Oct 2019 08:18:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571843912; cv=none;
        d=google.com; s=arc-20160816;
        b=hU2o04r/swlTm6FeKZEm9Dnx/rMxqCHPkWzn6nOVqybyKZiFhheZunP7/KsNXbEdfn
         Ezpc5DZ2MQhbZGPtEjL/A6xnUlgUj5rMJT4xi4DC1F5FCum8QJswF44quYB29TxMnH4R
         zPVyhQp0R0Dx+z1ZQdV0SpeNiECDcZyDqy+IID+bk2iJaBIud8fIZ3Mnzl3dQF/1TR3t
         IclMHXyon8ZK8Owoz8glD3P4ivkVDhijktW2cK/igOhogAGa5u7mD7j8led3RpW8eKT9
         t4ozSuznZKOeQWdAGgV4IlI6r+wgq6thogDqmXVx9i8VPrbYSZCXZne76QyLzCrgydIk
         W/5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=G2RHHCFtsP5auZ4wmaveYQuuH6u7l3/77Cc/6E9VhRU=;
        b=01RAGt0E4K5KVRA4s2AQEko5NQn0OyN0+8zvEsRdH+LaRsQi434mH5GuBAUCYPh1Qf
         US6q+yW81Y2aah4LyMg17fk4yDbYClEpU8XlIcZ+zA+M49ARaP7e/wrQd99fxaRzAy1Y
         Jrdy6IVG7ZswosH/pMuJdEPhtRB+7FiPIENmnwqoWNNr8uZDoWTZOkycrccF92h3JHDA
         XnxSfuOuDrKX1yOFUXe/Tjusy6OsVIMcx17bjX8NQI33plVpkCFZYPjq0Py5vTyUhIPQ
         FAqarrw4/B4hHVehnyGhsKO4IeVHPjNiYlCggIutE2s/+kkJ05IJYbzGqqKzUqhFGkZw
         Ahhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oNlh9OpJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a28si2332707qtn.194.2019.10.23.08.18.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 08:18:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oNlh9OpJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNIP9-0004ql-9m
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 11:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34968)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8e-00080c-KH
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8W-000175-M3
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:24 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:46545)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iNI8P-0000y8-Cv
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:17 -0400
Received: by mail-qt1-x842.google.com with SMTP id u22so32676852qtq.13
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 08:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G2RHHCFtsP5auZ4wmaveYQuuH6u7l3/77Cc/6E9VhRU=;
 b=oNlh9OpJdglfNTjhTYgZNIGISi32kTmvH0YOBux5UM5605QPr0d0B0bAinIAoZqDsT
 vvk1WvcbqN3oqgrbadClOCpr8emdHK41QHVkTcDyscl6u224wbq/zWtViA6MCZkrE+jK
 XwehN3wEmhMKbG42dCxegyLjpLHkDeEh2kJgzKho+osgSpFOzVvK5PQyuB8AqRJrGgD8
 iA2SWYzLcP5R8ocqQZdgP4+i37Ks0HCgXWpNHc0qugJDDm5jz51eX5I6WW0q0H/ykv5d
 INSDxa5e3ke5H6MqPPgJZ1ge1cj8T6n64Qcn5g/ffMLve8P2ycUF0BaBBTeyA9Jw9hXt
 5KSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G2RHHCFtsP5auZ4wmaveYQuuH6u7l3/77Cc/6E9VhRU=;
 b=XehFFZ7g9+Y6jlaiIFUdCNSMPhHRX+QwLRNmrDobOaj0qe9M+29Joxx9DshIVDoOi6
 v3eM0Bc7TuK7nzf0Dm2ekMK4FOBR7iRt4ZsEI37eFGunC7tK0e55HND/jTm6IvrAHem5
 Nj+y+OERSo5SNL9PpfHTtp4DWrNRcsRy4Sz/ctbxG6CZhC1SeUMd1wgt+vbhnG6gGgrX
 rFFcAoPn9k6j14LMCPuDwxV73V5BWTmKrUbx0CBZ8F/p9MbbP+X+xYisV71v269WAezB
 796JHhd0YF4rim+9mt7ZYDv3y+GZ25dwBw+8hRYhIg/SlWGpnj97APHRzf/GX/EmtJ1s
 uD+Q==
X-Gm-Message-State: APjAAAVCfJAt6ncCjKBTT62iPHhxvRGy4wC/XJcqnfHjXWnkxGHcTo/0
 r6RyseGtaDRIrv9psSvvkCzKfw==
X-Received: by 2002:ac8:7052:: with SMTP id y18mr9879850qtm.24.1571842861327; 
 Wed, 23 Oct 2019 08:01:01 -0700 (PDT)
Received: from localhost.localdomain (198-4-20-64.static.cosmoweb.net.
 [64.20.4.198])
 by smtp.gmail.com with ESMTPSA id l189sm11030168qke.69.2019.10.23.08.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:00:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 00/24] target/arm: Reduce overhead of cpu_get_tb_cpu_state
Date: Wed, 23 Oct 2019 11:00:33 -0400
Message-Id: <20191023150057.25731-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::842
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mq1NIzbQdmFL

Changes since v8:
  * Rebuild hflags in linux-user/*/cpu_loop.c, after changing to big-endian.
    This allows the armeb busybox ls to pass.  I don't have a test image for
    aarch64_eb, but the code looks the same.

Changes since v7:
  * Rebuild hflags for all successful nvic writes (Peter).
  * Rebuild hflags for Xscale sctlr writes (Peter).

Changes since v6:
  * Regen hflags in two more places for m-profile (patch 19).
...


r~


Richard Henderson (24):
  target/arm: Split out rebuild_hflags_common
  target/arm: Split out rebuild_hflags_a64
  target/arm: Split out rebuild_hflags_common_32
  target/arm: Split arm_cpu_data_is_big_endian
  target/arm: Split out rebuild_hflags_m32
  target/arm: Reduce tests vs M-profile in cpu_get_tb_cpu_state
  target/arm: Split out rebuild_hflags_a32
  target/arm: Split out rebuild_hflags_aprofile
  target/arm: Hoist XSCALE_CPAR, VECLEN, VECSTRIDE in
    cpu_get_tb_cpu_state
  target/arm: Simplify set of PSTATE_SS in cpu_get_tb_cpu_state
  target/arm: Hoist computation of TBFLAG_A32.VFPEN
  target/arm: Add arm_rebuild_hflags
  target/arm: Split out arm_mmu_idx_el
  target/arm: Hoist store to cs_base in cpu_get_tb_cpu_state
  target/arm: Add HELPER(rebuild_hflags_{a32,a64,m32})
  target/arm: Rebuild hflags at EL changes
  target/arm: Rebuild hflags at MSR writes
  target/arm: Rebuild hflags at CPSR writes
  target/arm: Rebuild hflags at Xscale SCTLR writes
  target/arm: Rebuild hflags for M-profile
  target/arm: Rebuild hflags for M-profile NVIC
  linux-user/aarch64: Rebuild hflags for TARGET_WORDS_BIGENDIAN
  linux-user/arm: Rebuild hflags for TARGET_WORDS_BIGENDIAN
  target/arm: Rely on hflags correct in cpu_get_tb_cpu_state

 target/arm/cpu.h              |  84 +++++---
 target/arm/helper.h           |   4 +
 target/arm/internals.h        |   9 +
 hw/intc/armv7m_nvic.c         |  22 +-
 linux-user/aarch64/cpu_loop.c |   1 +
 linux-user/arm/cpu_loop.c     |   1 +
 linux-user/syscall.c          |   1 +
 target/arm/cpu.c              |   1 +
 target/arm/helper-a64.c       |   3 +
 target/arm/helper.c           | 393 ++++++++++++++++++++++------------
 target/arm/m_helper.c         |   6 +
 target/arm/machine.c          |   1 +
 target/arm/op_helper.c        |   4 +
 target/arm/translate-a64.c    |  13 +-
 target/arm/translate.c        |  33 ++-
 15 files changed, 392 insertions(+), 184 deletions(-)

-- 
2.17.1

