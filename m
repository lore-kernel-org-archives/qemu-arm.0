Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1225730wrm;
        Fri, 18 Oct 2019 10:46:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyIsxvOca/ZAZC3G252BDr6JfAdEAuTLlmvIRqlyLfAnq9GNLc6KRsQDcZUVnKtRpHI1w3E
X-Received: by 2002:a05:6214:108f:: with SMTP id o15mr10965526qvr.145.1571420779830;
        Fri, 18 Oct 2019 10:46:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571420779; cv=none;
        d=google.com; s=arc-20160816;
        b=kD3zp7BZf1pNk/EeaMTAHkmccgUE3sokQIaeYLKhXFD7zbjRZjMqhp7WcoqvaUXPa1
         2fHXSoluW9clnbkCAKeLcw6k44Pdva/SemTAuC49fuCpu9Ulks7Q6BjS9sltw9RHOvrj
         8wMLXuvCq6NxoCvltxBUjHTlq98B7AfmI9peHwtHml6BacVc92hiki/den1WGvAOFeHW
         uXjbZsBOIXg4rKCxiFxC81V2V90A6Iwm8PjjO1RrUGKWWX5mHNqJ9hLmmt1y/B9gqbZv
         tkxJiTZkfjMlrLT+ReOhmudT/0jyAiITMASxuoTi9KjBZespMk77XcUPz+ZPyF6ZxLLJ
         1WXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Idl8sKo+MyTPxfki1g38jo0djbqo1vGnN91+OptSag0=;
        b=uCuGDtf8zWAMZtAcy7Xw0HyLo1DiY1DmRozgQSoemDucXb8vVlXH3EhIt0NDAfSMZP
         OG5enJZ+mzJI+VqMp8uWP0HGV9xmMUPhnb4rRJrrdA8SUOSgMXPAq0k9j96FUlbEQ5BS
         GyN8qYcjtNzl1pRhYupbdRa8XlIckiriJnPFZkrEHSySU4xGwpMKg1PjXBKSh3WRIIgP
         BQVTKC+9IIiycSnvu5ZTQhsWnUcYAnLUbs5inVMw9H42EpFhrQMTXoiaHIAiZeGOCVNE
         eBRD95TrmFW4eDdPHTK/7d8ToiuZvkZ6DX43ZJUPjCbjJn2KIruTP4Twvug6erl14USn
         IVpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HKe30JEt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 56si6950157qvn.79.2019.10.18.10.46.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 10:46:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HKe30JEt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWKQ-0006R9-7n
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 13:46:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59009)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIl-0006On-V6
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWIk-0005Iw-Gj
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:35 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:45757)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWIk-0005IJ-Af
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:34 -0400
Received: by mail-pl1-x62d.google.com with SMTP id u12so3174042pls.12
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 10:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Idl8sKo+MyTPxfki1g38jo0djbqo1vGnN91+OptSag0=;
 b=HKe30JEtyjBtIxjAtp+/GAoa0jb+rryOZTp/GNwwPSlG4ovdTD33pq7PgN7jF0nfex
 oErWxayL5t+fnMJ2RqzaI/z5uDcl1ExRKXLBQFfGE/9Sar31+uelXSsdbdvwSzy33ugR
 fokRP2VEQlRMZXZnd4lhEhY3MdxttTzRKrQ/YIAdP0MeK2XvcKHHvYIhxUM/Yl+tIvDG
 OyC8lvJQ8NQyKSQEQhT8Fuh6qLGeckG3BtafJ1XExconNYsWtNSUjrQfCn6lSDjrOqe0
 Mh2mZn6rZ0fTpNA5MLmy4nURDpgsawWcwUoSvnzS05THolOP4+QBSJCwpj1MVEWM48xQ
 kiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Idl8sKo+MyTPxfki1g38jo0djbqo1vGnN91+OptSag0=;
 b=huej+z1g4BeUk6+W670TJB/ITJowS5Wspp7qPKGq9TguIbqFCBw5sJLvyz6nHfN6Of
 CRHt2gYerXQuLusw4C24Fx3rwEwcgze/t0mLqla3nEYcWoXvLOoYQbVVzuP28rUxxX4E
 PNEOw4Jg7N1PnNgp1Q/Fekvt2MvToWnCO8XlNabo8VUtsivk65sMYBaxOn8cZfWNZp3n
 /tMqMJ949eEyoHwNWg81208EUsX4EQFPAKzs6wU78BrKbZZv9VzA/0/SF12K6SN8AdFs
 tOHi8/vVT9hleblVgqxwdF9PHNWSxGJcnfdcVkz4M+oPbkJ+RIZd8h7CuoKuWUFzdxJl
 33bQ==
X-Gm-Message-State: APjAAAWJX4Whyihrh3GoYvdvF/lyaR2Gc04yQ6vhPA5i7npLdJ4qGzc3
 nFwbGKsbCmVg/0YraT8BWXnUvCISFl0=
X-Received: by 2002:a17:902:7208:: with SMTP id
 ba8mr11152737plb.305.1571420672612; 
 Fri, 18 Oct 2019 10:44:32 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 00/22] target/arm: Reduce overhead of cpu_get_tb_cpu_state
Date: Fri, 18 Oct 2019 10:44:09 -0700
Message-Id: <20191018174431.1784-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::62d
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Irb11r3cy3QV

Changes since v7:
  * Rebuild hflags for all successful nvic writes (Peter).
  * Rebuild hflags for Xscale sctlr writes (Peter).

Changes since v6:
  * Regen hflags in two more places for m-profile (patch 19).

Changes since v5:
  * Fix the debug assertion ifdef in the final patch.
  * Add more calls to arm_rebuild_hflags: CPSR and M-profile
    These become two new patches, 18 & 19.
  * Update some comments per review. (Alex)

Changes since v4:
  * Split patch 1 into 15 smaller patches.
  * Cache the new DEBUG_TARGET_EL field.
  * Split out m-profile hflags separately from a-profile 32-bit.
  * Move around non-cached tb flags as well, avoiding repetitive
    checks for m-profile or other mutually exclusive conditions.

  I haven't officially re-run the performance test quoted in the
  last patch, but I have eyeballed "perf top", and have dug into
  the compiled code a bit, which resulted in a few of the new
  cleanup patches (e.g. cs_base, arm_mmu_idx_el, and
  arm_cpu_data_is_big_endian).
...


r~


Richard Henderson (22):
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
  target/arm: Rely on hflags correct in cpu_get_tb_cpu_state

 target/arm/cpu.h           |  84 +++++---
 target/arm/helper.h        |   4 +
 target/arm/internals.h     |   9 +
 hw/intc/armv7m_nvic.c      |  22 ++-
 linux-user/syscall.c       |   1 +
 target/arm/cpu.c           |   1 +
 target/arm/helper-a64.c    |   3 +
 target/arm/helper.c        | 393 ++++++++++++++++++++++++-------------
 target/arm/m_helper.c      |   6 +
 target/arm/machine.c       |   1 +
 target/arm/op_helper.c     |   4 +
 target/arm/translate-a64.c |  13 +-
 target/arm/translate.c     |  33 +++-
 13 files changed, 390 insertions(+), 184 deletions(-)

-- 
2.17.1

