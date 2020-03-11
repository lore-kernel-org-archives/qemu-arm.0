Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp386953lfc;
        Tue, 10 Mar 2020 23:44:42 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs2Qdb2Ga8MS5wQ8anWQtxCpAk25ZbIU1/ZrizFMH/j/MxO8NgoGtar57tJJN/mamqUJ/jG
X-Received: by 2002:ac8:4899:: with SMTP id i25mr1356879qtq.364.1583909082252;
        Tue, 10 Mar 2020 23:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583909082; cv=none;
        d=google.com; s=arc-20160816;
        b=yd29QFeE3GE5BiqlCdfBt2RUMXkL7yOO8doZgVYiOTpMHrBk7eJjmp0xr/SgT0vI7L
         Rlz0elJI0WwZ/v/DHwYliKjekbXfn00k38RA5nTObLe8HK74YrWqTRl3vBm+dDFryYh0
         M1mkTqcqNNNhVEdNCJP7ma3WpVFfUojO8QZomnv5Uzn0Gs3vh0qcnd60ABjSH8jUiQru
         sWemSnuUxu83L2U/KajWRi5p2RLVXFzveWLBZfZsWZuUy9g2AGrtGVUvBnQBKUTEq1kL
         OICOLD5hEklGAfIHPxqioDExge4oX5ODEv1p8tlPZFm9E9W/twJN+Z1OqyLqNSQRYVLn
         58WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=87Rk2Cus7V553zmUHZsKztsptlyw22li5a6Jn7L7yqM=;
        b=UMocY5eoQAIWXxOQ1rdX22K7wV4hLUXzdl7CiCFQSj+EEEp9JOAcSNDFKATe1+SP7l
         FJ4muJnStIAjSmzYFu1eN2PwmEN9NUTqjrjsvIK+cm7gcFOJeSWd2lgsTkGndns20nxs
         GEfsf6dRPAdnij1IWraanzkfA+2e/sxVFlpadaqzYNj1Mmm2YBG4PEEwF/R2ZIX9VT/v
         iOZ+JN+MDq4JBoNUzKaLrAZtGOh1v9IT6KoGAavPP+wYQYVr/19Z10NXu0Wy1KCR6mQ8
         UrqN9FjaGQZEcQbHleRijlTNu5dcf4QW5zLtL95camJ61Ou+yEoSeKdRb7iblKi5CliO
         UMhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jIgyyhhI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si441700qve.106.2020.03.10.23.44.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 23:44:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jIgyyhhI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBv6f-00066G-Iy
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 02:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59276)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jBv6O-00065s-II
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 02:44:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jBv6N-0001bR-Cx
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 02:44:24 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:50435)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jBv6N-0001aH-6L
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 02:44:23 -0400
Received: by mail-pj1-x1036.google.com with SMTP id u10so484709pjy.0
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2020 23:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=87Rk2Cus7V553zmUHZsKztsptlyw22li5a6Jn7L7yqM=;
 b=jIgyyhhICLIjSLjLOWshNGCsIO3EQvMaTa7iEm8NKuV8QZ9UJwuQRkCjtsLUCR/QXg
 XKMmD8xH12NDTBtCYLD+TkhKFfDGqEgPzV88rbZ6iFwkVM2af8liN5kEmH8Tw+JnuDzV
 5zke21LSBMF6RyJt++Eemyl69h26vEMSG+opDF6jCVJajDO6Jc6XpM1khqY5QopSvYzw
 8sHfRpjfBGXtBCgxcwKxj081Tu83gSMsZZS4SzVpYMDXmgYdn/6I8zC02ho71Zq8VmBg
 3xt3IJWm9Ydwfvkp08rcPY1MympoADfyvXSQQw80QxRLooMnIsdQ9o4Kf86gErCoEz7y
 mopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=87Rk2Cus7V553zmUHZsKztsptlyw22li5a6Jn7L7yqM=;
 b=jA11ibErMtv8Vli9yzFdWpj8uuOvAS9J6lH7BXmWZh9LE/NMqxpAdQcvtkQkCdiqqa
 xC24fnKTvJ35JmbAyRgP1BtQgLOx26wpgsN52XFu4zmWGAZYRYSyx1QU1yfpYcSbP0MS
 MyOOx8ZiV5bTVRn+77OrnhdGskAp8DhU/nmUr3ETzfkxMtMdIMeAEK81VzdvRub4V7xq
 H8WNRw/XIbZfTFMdyLht4qKIC6XvLmuhSzETkpv46cYNLkYYZlvhSaZMwM57I/h+uo8l
 2i5psKaW0X+OsYRgoSUucq47WsWSrF6rjf+1Gfo3YlPvw6HjpqECEBvQZ1bTp4Owqs47
 TQKA==
X-Gm-Message-State: ANhLgQ2MJjkBSU5m715xvxgbe4B8XFILQQE85AiRozD2/9E2lRYeqm2W
 cWtf2woFgm/WT0iyCfwvitvlfg==
X-Received: by 2002:a17:90a:8d86:: with SMTP id
 d6mr1870847pjo.119.1583909061773; 
 Tue, 10 Mar 2020 23:44:21 -0700 (PDT)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id z3sm50137807pfz.155.2020.03.10.23.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 23:44:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/16] target/arm: sve load/store improvements
Date: Tue, 10 Mar 2020 23:44:04 -0700
Message-Id: <20200311064420.30606-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1036
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
X-TUID: 2fRjtKLqe9JQ

The goal here is to support MTE, but there's some cleanup to do.

Technically, we have sufficient interfaces in cputlb.c now, but it
requires multiple tlb lookups on different interfaces to do so.

Adding probe_access_flags() allows probing the tlb and getting out
some of the flags buried in the tlb comparator, such as TLB_MMIO
and TLB_WATCHPOINT.  In addition, we get no-fault semantics,
which we don't have via probe_acccess().

Adding cpu_probe_watchpoint() allows to *not* stop a first-fault
or no-fault load when the page contains a watchpoint, but the actual
access does not hit.

Having these available means that we can handle all of the watchpoints
for a given set of loads/stores all at once, before we begin doing any
actual memory operations.  Further, the actual memory operation on a
page of ram that has a watchpoint can still use the fast path.

Looking forward to MTE, we can examine the Tagged bit on a per-page
basis and avoid dozens of mte_check calls that must be Unchecked.
That comes later, in a new version of the MTE patch set, but I do
add comments for where the checks should be added.


r~


Richard Henderson (16):
  accel/tcg: Add block comment for probe_access
  accel/tcg: Add probe_access_flags
  exec: Add cpu_probe_watchpoint
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

 include/exec/cpu-all.h     |   13 +-
 include/exec/exec-all.h    |   39 +
 include/hw/core/cpu.h      |    7 +
 target/arm/internals.h     |    5 -
 accel/tcg/cputlb.c         |  178 +--
 accel/tcg/user-exec.c      |   36 +-
 exec.c                     |   19 +
 target/arm/sve_helper.c    | 2238 +++++++++++++++++++-----------------
 target/arm/translate-sve.c |   17 +-
 9 files changed, 1404 insertions(+), 1148 deletions(-)

-- 
2.20.1

