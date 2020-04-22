Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp192881lfm;
        Tue, 21 Apr 2020 21:33:27 -0700 (PDT)
X-Google-Smtp-Source: APiQypInv2b0VsB/1EgxsyehV0lCth4A6pTHlDsHK04hCAeiJF1uPcgCWL47X/iJT6LlGbFt7KEd
X-Received: by 2002:a05:620a:308:: with SMTP id s8mr25251770qkm.436.1587530007451;
        Tue, 21 Apr 2020 21:33:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587530007; cv=none;
        d=google.com; s=arc-20160816;
        b=M6OpMjtf9mGNUVGmzZhpKHgNc1mNYcxC60Bg7l+Y2aloVbAdVnqLpnj6GMkI7lXK/P
         V6H+dVQEjUWMoESXaMffmMyvxM4rpG0N265ype4G6yxORxO5C3Sj0EiiUT3LQyDCHgPN
         o+HbP5CL05U1u3wvMXOVI5+RxcgQPKDtg6wyQWQH2pS7feWMUFcnwGTW4BQDkJH3ku6n
         tEFAHKK4HMDMBY2CknSmr3OKqX9hfdIK/9iJls0EYwroy578MHwoQFbUtcV1WLcoFuoh
         pYtSuNZxABYlYD1ClNNz2YtKe8us57zFU0FQkOPWy0UGOm7/fr3q9VmwtT9yp2pxnASz
         nobA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=pKbOEWyU9fNjeLYwA9C79bvgdQrUPgdTmUZ8kMVD8Co=;
        b=NLr+jYnCvoRlUvtdcVeZt2XT+rmCmUKNOvoQwoMOD/X5/DYTlTQmDZpAL+AaKhpgEk
         2ZmMlsUXYlbpldu23Jo8TRv4EANjuKX07Pp26zBpbQ4VszG3uBKn/uHQI6rSs3zKKaLn
         etfasYdPFH/3HDQcoiy9T3jLyGQsg077pXKIEjEMZkUjlKmWj9pYpaqTIwbThBuVmh5A
         5/0Tyil6jRBM9/As8Qv1ef9Mt26bYB2f3nSjatUlqlq5cD4EWcj+zL/cZlnK4xiAPA/m
         jJXqNfjjuyhcznh4HZ0LTjQTqWUZhbY+w6MMzX8X84J6W+g0w1pKzKWLQd7cvNZxzKPe
         3sNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cpl34NWf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d24si2474406qtj.104.2020.04.21.21.33.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 21:33:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cpl34NWf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jR74g-0000Nh-NV
	for alex.bennee@linaro.org; Wed, 22 Apr 2020 00:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49916)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR74U-0000MI-8y
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR74T-0004Yd-DH
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:13 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:41930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jR74S-0004U1-Un
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:33:13 -0400
Received: by mail-pg1-x532.google.com with SMTP id h69so460647pgc.8
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2020 21:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pKbOEWyU9fNjeLYwA9C79bvgdQrUPgdTmUZ8kMVD8Co=;
 b=cpl34NWfMv1tdZjFn30IoeUxm3ibIczCV842NGy2PQ0bkWQC5AZiCl2zCP7xdR7IAj
 BNGhIbFiUWfmoMpmxVv1ruuHDufwVulGO3y4rrVuSuWFzbhmcChqRsdp2qW05ckoM9I2
 cxdfJnl9eXhjpNs92as4UU+BszpadzE2QWeIEIyUQfkrtVkQHH6pUvPJJNW7lKbQCYsm
 MNSSTsFFCoz1EoDVDDNeWBsfn5lJ/v7SooszQq8d76WyhkqKCkovQev+qlPax9KcXqfe
 a81/EAn8jXfNJJhNWsM6VVtRbHTWvau180b8bwD6UAd65V+y+ITgN/mJVAsesFSIW93p
 T2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pKbOEWyU9fNjeLYwA9C79bvgdQrUPgdTmUZ8kMVD8Co=;
 b=FOpqNyxGp1DVrbhYxIPdQh5ivHCFx1DA06hNbvb3Bht0dBjq6jyNEacuWh7DFs4Ffy
 pvEpQ5L6oKDbT93NuF16K3kr89qAHubPSyQHTKxHN4/WkVfbnn3Nesq35QCZNjXhhGzu
 hIg8015bMl5hyR+rALMofmzY8TRdAq53U9HiHB0hA9SxB4eBnD9KU9jfUFdxvjZF97gG
 /VjaD7BUKQg6hyPMv7tF2in79+BUB2UImoUrw3T0QbFfD/lI8se9Fgo5YnI8IXNNP0Ox
 leoH1a2aqkgteAORgA94I6/d6I5cJH0+09uG3Y8MnBGWVRs+mIk1+51gdrlVJxNaqbpi
 sZeg==
X-Gm-Message-State: AGi0Pub7Pgo4j2UFDwCa91h++KxZXbExlu10CGGWGeaffYbB4xlmnCTb
 bUEuQc4l3YOQXZ+5VjdbsnHRHA==
X-Received: by 2002:a63:d510:: with SMTP id c16mr25175137pgg.123.1587529991233; 
 Tue, 21 Apr 2020 21:33:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id l137sm4129613pfd.107.2020.04.21.21.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 21:33:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/18] target/arm: sve load/store improvements
Date: Tue, 21 Apr 2020 21:32:51 -0700
Message-Id: <20200422043309.18430-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::532
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
X-TUID: jbLop1xYcxRu

Because there was a separate v2 of one of the patches,
avoid confusion and call the whole thing v3.

The goal here is to support MTE, but there's some cleanup to do.

Technically, we have sufficient interfaces in cputlb.c now, but it
requires multiple tlb lookups on different interfaces to do so.

Adding probe_access_flags() allows probing the tlb and getting out
some of the flags buried in the tlb comparator, such as TLB_MMIO
and TLB_WATCHPOINT.  In addition, we get no-fault semantics,
which we don't have via probe_acccess().

Looking forward to MTE, we can examine the Tagged bit on a per-page
basis and avoid dozens of mte_check calls that must be Unchecked.
That comes later, in a new version of the MTE patch set, but I do
add comments for where the checks should be added.

Version 3 drops cpu_probe_watchpoint, because while adding new
documentation I found we already had cpu_watchpoint_address_matches
which could do the job.


r~


Richard Henderson (18):
  exec: Add block comments for watchpoint routines
  exec: Fix cpu_watchpoint_address_matches address length
  accel/tcg: Add block comment for probe_access
  accel/tcg: Add probe_access_flags
  accel/tcg: Add endian-specific cpu_{ld,st}* operations
  target/arm: Use cpu_*_data_ra for sve_ldst_tlb_fn
  target/arm: Drop manual handling of set/clear_helper_retaddr
  target/arm: Add sve infrastructure for page lookup
  target/arm: Adjust interface of sve_ld1_host_fn
  target/arm: Use SVEContLdSt in sve_ld1_r
  target/arm: Handle watchpoints in sve_ld1_r
  target/arm: Use SVEContLdSt for multi-register contiguous loads
  target/arm: Update contiguous first-fault and no-fault loads
  target/arm: Use SVEContLdSt for contiguous stores
  target/arm: Reuse sve_probe_page for gather first-fault loads
  target/arm: Reuse sve_probe_page for scatter stores
  target/arm: Reuse sve_probe_page for gather loads
  target/arm: Remove sve_memopidx

 docs/devel/loads-stores.rst |   39 +-
 include/exec/cpu-all.h      |   13 +-
 include/exec/cpu_ldst.h     |  277 ++++-
 include/exec/exec-all.h     |   39 +
 include/hw/core/cpu.h       |   23 +
 target/arm/internals.h      |    5 -
 accel/tcg/cputlb.c          |  413 ++++---
 accel/tcg/user-exec.c       |  247 +++-
 exec.c                      |    2 +-
 target/arm/sve_helper.c     | 2237 +++++++++++++++++++----------------
 target/arm/translate-sve.c  |   17 +-
 11 files changed, 1985 insertions(+), 1327 deletions(-)

-- 
2.20.1

