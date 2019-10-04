Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp334959wrm;
        Fri, 4 Oct 2019 04:50:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwqIZBXIg56zPuhCxgGkljYZV4MNQc3lln3fPFe1SmyIKpQKw8+4SV8wrLy+FJ2XQ9li5wN
X-Received: by 2002:a37:aa58:: with SMTP id t85mr9406841qke.381.1570189822550;
        Fri, 04 Oct 2019 04:50:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570189822; cv=none;
        d=google.com; s=arc-20160816;
        b=xHpnLg1EgAjaWQKIGlTB6IxzB6E7bOr/Lg8WiNzCQDxYTBDaX2NQaQSwltqE9mwNQq
         gOEnOgkaOjSleUB6Jnr8M6Ltns6IhdH4wJb/kWi0xwEBcc+28JtsmSDFLtnRqz3oxS0m
         GeUTN2ZbimaQBD0YwOSH1vHm9qt50jUiTfG9rPbRcRCygHEGAv4QWmgRxTmRtkZSP//6
         HslHCGm3v791gDyWYp6jVq6o42S3uuDcQ9RD2mO4WsKPgOrCVkqfMqS67fw/nxFc5Tvz
         ZBSKhw75fZfebZ9x6PxbV0Tc6qy3uxRJmwmjhDtHTMa25+X7T2HlU8ZdlQFanwYN2glV
         zSkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=KKScjR57hVzYNGoNM4hmpoJkxC9aOZTTXFxkpS3XYJU=;
        b=MyObSUW/5vWVVVPQ9sMR72CczmitI4S1Ch3ApyfnEnsWx2pixDpNF9h1GNnjO6omnG
         X44LUihumahj72DwAnN+fncJCSTWPIpy0/3pGeYGV88IyMB1CeQxc4u1gEsR+aZ2wL1w
         dYTPwrGd7XgQJQlSY9ZrdBDUZhgKBDnBj4CMjwTdfiDuyA40rqvR2OybxaMwOL3vh/fC
         v8qw066og4K+RM0c/9V88T9n3PJ1OLHs3f4OiIeLxnMn/qv3WgqL2AkXSaBb7WMhG9Hh
         JFRhroLWUkFKD+4D/jw/dl7nOhB/ApLw53U/jMKPdmUiI0WtJ8dIGjXH5mBAwqjiszeC
         hsTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="PLe/dyjb";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r48si5657605qtc.202.2019.10.04.04.50.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 04:50:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="PLe/dyjb";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGM6H-0003Yj-8n
	for alex.bennee@linaro.org; Fri, 04 Oct 2019 07:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55227)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iGM4s-0003U8-SK
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 07:48:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iGM4r-00013C-2Z
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 07:48:54 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:45825)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iGM4q-00012N-Rj
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 07:48:53 -0400
Received: by mail-wr1-x441.google.com with SMTP id r5so6753639wrm.12
 for <qemu-devel@nongnu.org>; Fri, 04 Oct 2019 04:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KKScjR57hVzYNGoNM4hmpoJkxC9aOZTTXFxkpS3XYJU=;
 b=PLe/dyjbnLO0yCxR5hbSOoMAb7CyHzT37GXzRhEWA23w3LqPmLjJX2e17O8PAg+tJB
 HfFQKoQJdLQPFyiKTXTW8nyB8pBJVpa+r/Qfyl7aEjvZvjYJIGLeQkge0J/7Fe2MKnDM
 ukyo2fLWoAuBmrSu56ErEz1KOP/KSOW3fQog+Jp6kfRKr/NkBBJzavXuvfuvEfGVw+Rm
 KHtTjko2x3MmYyUu/asDZWJ6UdrdLJGN0RisW2EaiDbyrmEntwEBRhve+s2g5Rt+xUUY
 20Q/XH/vGgZ6NJCMWL6FETLArdak0z3TEyVWDDkMRu+F+DWsYPu/94Q0+qP/1xOw6kKb
 f1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KKScjR57hVzYNGoNM4hmpoJkxC9aOZTTXFxkpS3XYJU=;
 b=S3p4ha3qCz8ix1b1A2Hd0jtsuiZmZkadT28/pqZuLhTOQGoxkGY3+P2Ox0nPN7OMOZ
 gGRyLnNnXjwNTJacKwnLUSUM/pL1F8tO55Cga8mDOUhPp2UMEbXVmBEhikmaxweI20Gz
 3EiAIuFmCM0rTWQH68Q9G2fyj+cAuHCFmpQI+XP29qb2wHpd5mB5hL4ERN5KiDiFbd/Q
 jcqv4kdRxIwhBx541Lep51zmlZKcJ3uCYAdiKAHlOtxN4hio0l5RF0lHCvSd2kp0DF/T
 r9lEFGPen296PD4uCVD5GCQ6ibaSltcWATwAVTtb/FvBKq4VDsF1iLZOqk9rtdDlRRbV
 ascw==
X-Gm-Message-State: APjAAAXz8nLOC8t1u0+lmLcqHjTSsxPMXJ33cYEBaWEiXk2xy7ZVz0uM
 jzzV24JpPFv1E54Ug7bSMVks3Q==
X-Received: by 2002:adf:ec44:: with SMTP id w4mr10820503wrn.251.1570189731325; 
 Fri, 04 Oct 2019 04:48:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t17sm11962094wrp.72.2019.10.04.04.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 04:48:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RFC 0/4] transaction-based ptimer API
Date: Fri,  4 Oct 2019 12:48:44 +0100
Message-Id: <20191004114848.16831-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w3nSbUMAbSoz

Currently the ptimer design uses a QEMU bottom-half as its mechanism
for calling back into the device model using the ptimer when the
timer has expired.  Unfortunately this design is fatally flawed,
because it means that there is a lag between the ptimer updating its
own state and the device callback function updating device state, and
guest accesses to device registers between the two can return
inconsistent device state. This was reported as a bug in a specific
timer device but it's a problem with the generic ptimer code:
https://bugs.launchpad.net/qemu/+bug/1777777

This RFC patchset introduces a change to the ptimer API so that
instead of using a bottom-half for the trigger a device can choose to
use a new 'transaction' based approach.  In this design (suggested by
RTH) all calls which modify ptimer state:
     - ptimer_set_period()
     - ptimer_set_freq()
     - ptimer_set_limit()
     - ptimer_set_count()
     - ptimer_run()
     - ptimer_stop()
must be between matched calls to ptimer_transaction_begin() and
ptimer_transaction_commit().  When ptimer_transaction_commit() is
called it will evaluate the state of the timer after all the changes
in the transaction, and call the callback if necessary.

I'm sending this out as an RFC to get opinions on the new API
before I proceed to converting all the users of ptimer. (My
plan is that the final patchset will start with these patches,
have another couple of dozen patches changing the other timer
devices using ptimer, and then have a "delete the BH API/code"
patch. Or we could split the "change to new API" parts into
smaller per-architecture ones.)

Patch 1 is some new trace events I added to the arm_timer code
while I was investigating the original bug report.
Patch 2 is just a function rename so we can keep the nicer
"ptimer_init()" name for the new API.
Patch 3 adds the new API and its implementation.
Patch 4 is a sample conversion of a ptimer-using device,
which fixes the reported bug:
https://bugs.launchpad.net/qemu/+bug/1777777

thanks
-- PMM

Peter Maydell (4):
  hw/timer/arm_timer: Add trace events
  ptimer: Rename ptimer_init() to ptimer_init_with_bh()
  ptimer: Provide new transaction-based API
  hw/timer/arm_timer.c: Switch to transaction-based ptimer API

 include/hw/ptimer.h              |  77 ++++++++++++++++++--
 hw/arm/musicpal.c                |   2 +-
 hw/core/ptimer.c                 | 116 +++++++++++++++++++++++++++----
 hw/dma/xilinx_axidma.c           |   2 +-
 hw/m68k/mcf5206.c                |   2 +-
 hw/m68k/mcf5208.c                |   2 +-
 hw/net/fsl_etsec/etsec.c         |   2 +-
 hw/net/lan9118.c                 |   2 +-
 hw/timer/allwinner-a10-pit.c     |   2 +-
 hw/timer/altera_timer.c          |   2 +-
 hw/timer/arm_mptimer.c           |   6 +-
 hw/timer/arm_timer.c             |  43 +++++++++---
 hw/timer/cmsdk-apb-dualtimer.c   |   2 +-
 hw/timer/cmsdk-apb-timer.c       |   2 +-
 hw/timer/digic-timer.c           |   2 +-
 hw/timer/etraxfs_timer.c         |   6 +-
 hw/timer/exynos4210_mct.c        |   7 +-
 hw/timer/exynos4210_pwm.c        |   2 +-
 hw/timer/exynos4210_rtc.c        |   4 +-
 hw/timer/grlib_gptimer.c         |   2 +-
 hw/timer/imx_epit.c              |   4 +-
 hw/timer/imx_gpt.c               |   2 +-
 hw/timer/lm32_timer.c            |   2 +-
 hw/timer/milkymist-sysctl.c      |   4 +-
 hw/timer/mss-timer.c             |   2 +-
 hw/timer/puv3_ost.c              |   2 +-
 hw/timer/sh_timer.c              |   2 +-
 hw/timer/slavio_timer.c          |   2 +-
 hw/timer/xilinx_timer.c          |   2 +-
 hw/watchdog/cmsdk-apb-watchdog.c |   2 +-
 tests/ptimer-test.c              |  22 +++---
 hw/timer/trace-events            |   7 ++
 32 files changed, 263 insertions(+), 75 deletions(-)

-- 
2.20.1

