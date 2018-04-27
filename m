Received: by 10.28.4.212 with SMTP id 203csp168046wme;
        Thu, 26 Apr 2018 17:29:05 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqgaQ4s0AeUol04KMM2Ysgc7YF8a1j+eReM7XwTO8C9vBv2NSks5iUx6c7ERiY2WTbX3GJB
X-Received: by 2002:ac8:31ca:: with SMTP id i10-v6mr188174qte.166.1524788945281;
        Thu, 26 Apr 2018 17:29:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524788945; cv=none;
        d=google.com; s=arc-20160816;
        b=eBpmu88O/eNmMtMcdMr+M0CuiLSV6fdV+ZqZZpKL9nnpsaHkdoRumwFw9hElCTme8t
         gMvhvyj4nipDZNraqU7Ke+lTJfsY07sY+aj7UIgOuxK14EbYoo7cy4i17QW3t7i2tNOC
         /84nTa6a3hnH3NtrE6h6UFIw/iRuVXR+cSDkAijU9tisKKKuLI79c4kB2IAAjs6bV+Qj
         2SYCxpbn5eRARLJfjG0zqBl4xhZzoMcKc3G5BEXeO4Ultl5+TEmO8vQQnX2XG5sbRfmH
         18dZtxkGJXfRBtaAZ7LKzd2ZTDGYdDV/+1yUmDLkyXi/s5O3PM+1kFiDXOd6hnHjXvFy
         Bcsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=ISA6sXf01iU83rynk6P57VZzQ8PJr5R2j4ueWJh+z64=;
        b=YQnMiFQ3leM8/r2ohG9UIEz35UkyQ7CXfoN/AG/VwN11NDgzijMY5zRKfdSb6+yiDh
         eu6KXMQYhZ+t9JvQHDsKuNHSBHmuJJ2zm4QWv2f29698zpCLYAoIBAN1C0XZIUHVxiFi
         liVluPUPC99VT7Xc+xZYrAt9XscRoYZyHrp636P6v4iVsR1PufnvtMOxc9cA6ZE68QlY
         QxAZwMIzA/0u4N7jDheQNQHVa+U6iubh8k49TsaXMvQJOgO8R71iah8+DD2J5sXb1M70
         ne8A508Trup3TGIYMagw5AqbkXIbcTjAK3W+FjvFm0cVCVJMMrHAd2BwRkHrwqr/gYAx
         Rvhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Pj5QAtRF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q13-v6si90574qvd.273.2018.04.26.17.29.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Apr 2018 17:29:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Pj5QAtRF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45106 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBrG4-0003CE-Ju
	for alex.bennee@linaro.org; Thu, 26 Apr 2018 20:29:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fBrE6-0001x2-HF
	for qemu-devel@nongnu.org; Thu, 26 Apr 2018 20:27:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fBrE5-0004OR-JN
	for qemu-devel@nongnu.org; Thu, 26 Apr 2018 20:27:02 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:36463)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fBrE5-0004O1-Dm
	for qemu-devel@nongnu.org; Thu, 26 Apr 2018 20:27:01 -0400
Received: by mail-pg0-x243.google.com with SMTP id i6-v6so152368pgv.3
	for <qemu-devel@nongnu.org>; Thu, 26 Apr 2018 17:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=ISA6sXf01iU83rynk6P57VZzQ8PJr5R2j4ueWJh+z64=;
	b=Pj5QAtRFqouDfIigdkFPhzsjSdSvOMBQ7Ly/QlndkUPZ39efqiwV6pyZB7RMT1DVAA
	OFe44K8BdoMmlhMA+Vo0ezOniMpNwG77/d0jOGgZFTOmcqs20u7/hMT4Y5mzvjygT9hj
	0QPEJEddI9KfTHMsp+jlkb/q9jJMeYuA/u958=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ISA6sXf01iU83rynk6P57VZzQ8PJr5R2j4ueWJh+z64=;
	b=aBYAGyQWwOqS7y8ZKV+F5cWS0NNSLj2mQCpwLthxCzkHZ6dnLRly1sZlKuUQB2X8Wd
	xivc+kjLgBP/HzAnrmwJEhYTvriByiM63mvq97ckX0Bj+qnhEyyF3OvTxm8ra6s/Piz4
	rGArBX6lWsda4hJwHwQef21/q18B13Z2TBWbj37XuFG4zre0XTWOHNWrXMZyhGB+ZMLh
	baiYWkd8f3OvIqbhKDNWD5bh6A+mVl8QqPbqDbabc3/K/uWmng6HgiuP1G/GGyZFa9aW
	jgjCkhn0zOgUDj6PRqxT1uqRvvkA5GVziRyurWx8F0MvbYEI92XTwV6KrX3OPC0jMvZY
	Z7Dg==
X-Gm-Message-State: ALQs6tDpkV3jmvYq3WhsUKb7WM5F3+KwU5h1mX1dG0Ko4O0KVMDlznAT
	3nduLEaHFF2WoS7S2FTibQ2+YltT0J0=
X-Received: by 2002:a63:8348:: with SMTP id
	h69-v6mr168395pge.378.1524788819963; 
	Thu, 26 Apr 2018 17:26:59 -0700 (PDT)
Received: from cloudburst.twiddle.net.com
	([2605:e000:112b:41da:c94c:5ee7:de92:7d78])
	by smtp.gmail.com with ESMTPSA id g76sm86338pfj.102.2018.04.26.17.26.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Apr 2018 17:26:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 26 Apr 2018 14:26:42 -1000
Message-Id: <20180427002651.28356-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-devel] [PATCH 0/9] target/arm: Implement v8.1-Atomics
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UMUGEQgRvHUX

This implements the Atomics extension, which is mandatory for v8.1.
While testing the v8.2-SVE extension, I've run into issues with the
GCC testsuite expecting this to exist.

Missing is the wiring up of the system registers to indicate that
the extension exists, but we have no system CPU model that would
exercise such a setting.


r~


PS: Given the extension is mandatory, it might be better to save
feature bits and file this under ARM_FEATURE_V8_1.  Thoughts?

PPS: Testing for this will proceed overnight.  It takes a while
to run the gcc testsuite and I'm ready to stop for the day.  ;-)


Richard Henderson (9):
  tcg: Introduce helpers for integer min/max
  target/arm: Use new min/max expanders
  target/xtensa: Use new min/max expanders
  tcg: Introduce atomic helpers for integer min/max
  target/riscv: Use new atomic min/max expanders
  target/arm: Introduce ARM_FEATURE_V8_ATOMICS and initial decode
  target/arm: Fill in disas_ldst_atomic
  target/arm: Implement CAS and CASP
  target/arm: Enable ARM_FEATURE_V8_ATOMICS for user-only

 accel/tcg/atomic_template.h |  71 +++++++++
 accel/tcg/tcg-runtime.h     |   8 +
 target/arm/cpu.h            |   1 +
 target/arm/helper-a64.h     |   2 +
 tcg/tcg-op.h                |  50 ++++++
 tcg/tcg.h                   |   8 +
 linux-user/elfload.c        |   1 +
 target/arm/cpu64.c          |   1 +
 target/arm/helper-a64.c     |  43 +++++
 target/arm/translate-a64.c  | 375 +++++++++++++++++++++++++++++++++++---------
 target/riscv/translate.c    |  72 +++------
 target/xtensa/translate.c   |  50 ++++--
 tcg/tcg-op.c                |  48 ++++++
 13 files changed, 583 insertions(+), 147 deletions(-)

-- 
2.14.3

