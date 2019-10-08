Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5431964wrm;
        Tue, 8 Oct 2019 10:18:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwQvsPKgwNyQkja5VmxytZDkQT6P6clQPA2eYLCP2sXynT0Z86WlN8V/pVr0acCiOlbENHV
X-Received: by 2002:a50:cf8b:: with SMTP id h11mr33479175edk.236.1570555090971;
        Tue, 08 Oct 2019 10:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570555090; cv=none;
        d=google.com; s=arc-20160816;
        b=CWyReKvudLEfRS/MCsbl6iBCR9VCBxV/dfQDm/SUQGYwZnTqR5pMHu6r3anGOCZx+8
         6alrzSjAfiGMlyPH1pcKnZSqDjUXasUk8tIXMQmtZQnwUvgyDGqQ/HbCmSsMa1pxKkrZ
         F2JjIooBm90YobCToehOe/gerzN1fPhOL1U28H67YQ4ad/tWHxT9QDgTiAcQOt6oCyIK
         K8m1oVElFqKmdCrLilCZn16inVjAivgIu6ySwXSMTFii83rgiN1/r4Ia3oH6nxci1cq+
         djqSZk3ZevDnwsrIT+GibFSFwYOw6QFmohChGsuQWQFdu/OYxmm3eqGEmHs+kea/eLLD
         jJOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=8AuF6SMXMBBdT0XSJXR/ilON3JQ4cBrYF0nDxaIc89g=;
        b=q0eaLmuXu1+qpSzFy0+L0fHOEU2yf9jTqO4jvLVTwYHAeNHyX6dS5f0Wdku5Ft9v0N
         kJsj5mVklJbuJH0ZO55P6RClGBCzn4LxQZDRK85fiBhrGGYz14Bj4+w/otgJbyh4g1Fn
         Z8oplafO39UFrWdOIfsl6h0EeiopFNYzmNIZvSafYKrNj+lx9G13bafA+CEJ0Ner698R
         1dd2SkDotTuPwO9G7I/vOWNKJ9mYoqywbGQrCuIZsOEU60hJbbBCA3Nnjy/4a0mEJQ5k
         6wX7gDJjmndRAcjqAWeW0JAg3h2B5KlIYEOeiMftmVwhi3ieef+pj8asPJ5xVCvIM0Yv
         B1MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xXXzBDnE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a38si11570717edf.260.2019.10.08.10.18.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 10:18:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xXXzBDnE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHt7h-0006ZM-1b
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 13:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48660)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7L-0006Yn-80
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:17:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7J-0002AT-A8
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:17:46 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34533)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iHt7I-00029z-WE
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:17:45 -0400
Received: by mail-wr1-x435.google.com with SMTP id j11so14537697wrp.1
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2019 10:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8AuF6SMXMBBdT0XSJXR/ilON3JQ4cBrYF0nDxaIc89g=;
 b=xXXzBDnEHqoGfk1Igk6dXc+vq+j8g8yqHEHwEBphqK6mid76AvbXkyauyf4TndMdOS
 VYaB4PZB1Iy+/XVgERbquT0NEN9Z+u7081JbFXZ73ocvmoc7m0BOdPEztGY5+gIxyTLh
 HBIXeNHLpnRr5xuAh44aekNs7vIyznUrsa9rf1NKAH3/cT8bt0VDiGZJ3q+pWQ/zmIi3
 qb+VrcchbqplnffReb1QjeCkxVbM5LPVCFQlH933At2TYdN25jBTpY2cGVgRaSl/P0Zr
 hdVGoq5T0aqoAZ55K9EFR1F56uOB2gSOBaApmOa+02u4oOLhZeOfNPDf31W7Q4W2Z7vR
 NADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8AuF6SMXMBBdT0XSJXR/ilON3JQ4cBrYF0nDxaIc89g=;
 b=LLT2ZBHOtdHczPZ9MioOLbI+c7bNpfZUgl2JfR5nxdge3Y71kjWYOisSppASCRKXbO
 HXEvAxufp6rEejLbTq3LCzN4wEa37VZC0teGu7ssff2vldT/V9rVwh3ZpPWX0h7q9AkX
 ADrurc7lQMF5bh4zuic3VcGab7qqyId5XLl8RtcdYPTcr+rbRMtHibf1ifRIr80gJH27
 KyCENs9NJByC/Grwm1XllcxmKWLJX1nfKO127TJDzebFuGnW3z3JD40KzGx61PiMYr2+
 G76h1Da7vTlbUeNlqPNB10gi5oQXvuZdl6Ks4To88mP/yyNI9Azafuz00f7RlXxGBgKD
 jGvA==
X-Gm-Message-State: APjAAAViGyIgRaAR5SmRqUijfjDtJSIlwohHPFCRkpCksbidjbxPugDV
 DA/yh8C7bG+nmlCGLw7lWPYB+05ijn105w==
X-Received: by 2002:a5d:5261:: with SMTP id l1mr3135822wrc.182.1570555063310; 
 Tue, 08 Oct 2019 10:17:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z9sm19135541wrl.35.2019.10.08.10.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 10:17:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 00/21] transaction-based ptimer API
Date: Tue,  8 Oct 2019 18:17:19 +0100
Message-Id: <20191008171740.9679-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hm+HhfBjE70G

Currently the ptimer design uses a QEMU bottom-half as its mechanism
for calling back into the device model using the ptimer when the
timer has expired.  Unfortunately this design is fatally flawed,
because it means that there is a lag between the ptimer updating its
own state and the device callback function updating device state, and
guest accesses to device registers between the two can return
inconsistent device state. This was reported as a bug in a specific
timer device but it's a problem with the generic ptimer code:
https://bugs.launchpad.net/qemu/+bug/1777777

This patchset introduces a change to the ptimer API so that instead
of using a bottom-half for the trigger a device can choose to use a
new 'transaction' based approach.  In this design (suggested by RTH)
all calls which modify ptimer state:
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
The callback itself is called from within a transaction block,
so any changes it makes to ptimer state that re-trigger the
timer will mean the callback is called again once it has returned.

Changes since the v1 RFC patchset:
 - In the ptimer implementation patch itself:
     * ptimer_transaction_begin() now sets need_reload to false
     * fixed assert condition in ptimer_transaction_begin()
     * ptimer_transaction_commit() now has a loop to call
       ptimer_reload() again if the callback function updated
       the ptimer state such that it needs to trigger again
     * fixed callback_opaque arg name mismatch in doc comment
     * don't cache delta, period, etc across ptimer_trigger() call,
       because the device's trigger function might update ptimer
       state
 - New patches which update all the devices used in various
   Arm boards to the new transaction-based API

(Most of the bugfixes listed are the result of the extra testing
in the wider variety of ptimer use cases. Thanks in particular
to Philippe for putting together a test image for the exynos4210,
which has several ptimer-using devices some of which are pretty
complicated.)

There are ten non-arm devices using ptimer:

microblaze and ppc:
  hw/timer/xilinx_timer.c
ppc:
  hw/net/fsl_etsec/etsec.c
nios2:
  hw/timer/altera_timer.c
cris:
  hw/timer/etraxfs_timer.c
lm32:
  hw/timer/lm32_timer.c
  hw/timer/milkymist-sysctl.c
sparc:
  hw/timer/grlib_gptimer.c
  hw/timer/slavio_timer.c
sh4:
  hw/timer/sh_timer.c
unicore32:
  hw/timer/puv3_ost.c

I do plan to convert those as well but this series seems big
enough to be going on with, and it means I can avoid the
awkwardness of getting acks from multiple submaintainers
on top of wrangling a big patchset.

thanks
-- PMM

Peter Maydell (21):
  ptimer: Rename ptimer_init() to ptimer_init_with_bh()
  ptimer: Provide new transaction-based API
  tests/ptimer-test: Switch to transaction-based ptimer API
  hw/timer/arm_timer.c: Switch to transaction-based ptimer API
  hw/arm/musicpal.c: Switch to transaction-based ptimer API
  hw/timer/allwinner-a10-pit.c: Switch to transaction-based ptimer API
  hw/timer/arm_mptimer.c: Switch to transaction-based ptimer API
  hw/timer/cmsdk-apb-dualtimer.c: Switch to transaction-based ptimer API
  hw/timer/cmsdk-apb-timer.c: Switch to transaction-based ptimer API
  hw/timer/digic-timer.c: Switch to transaction-based ptimer API
  hw/timer/exynos4210_mct.c: Switch GFRC to transaction-based ptimer API
  hw/timer/exynos4210_mct.c: Switch LFRC to transaction-based ptimer API
  hw/timer/exynos4210_mct.c: Switch ltick to transaction-based ptimer
    API
  hw/timer/exynos4210_pwm.c: Switch to transaction-based ptimer API
  hw/timer/exynos4210_rtc.c: Switch 1Hz ptimer to transaction-based API
  hw/timer/exynos4210_rtc.c: Switch main ptimer to transaction-based API
  hw/timer/imx_epit.c: Switch to transaction-based ptimer API
  hw/timer/imx_gpt.c: Switch to transaction-based ptimer API
  hw/timer/mss-timerc: Switch to transaction-based ptimer API
  hw/watchdog/cmsdk-apb-watchdog.c: Switch to transaction-based ptimer
    API
  hw/net/lan9118.c: Switch to transaction-based ptimer API

 include/hw/ptimer.h              |  83 ++++++++++++++++-
 include/hw/timer/mss-timer.h     |   1 -
 hw/arm/musicpal.c                |  16 ++--
 hw/core/ptimer.c                 | 154 +++++++++++++++++++++++++++----
 hw/dma/xilinx_axidma.c           |   2 +-
 hw/m68k/mcf5206.c                |   2 +-
 hw/m68k/mcf5208.c                |   2 +-
 hw/net/fsl_etsec/etsec.c         |   2 +-
 hw/net/lan9118.c                 |  11 ++-
 hw/timer/allwinner-a10-pit.c     |  12 ++-
 hw/timer/altera_timer.c          |   2 +-
 hw/timer/arm_mptimer.c           |  18 +++-
 hw/timer/arm_timer.c             |  16 +++-
 hw/timer/cmsdk-apb-dualtimer.c   |  14 ++-
 hw/timer/cmsdk-apb-timer.c       |  15 ++-
 hw/timer/digic-timer.c           |  16 +++-
 hw/timer/etraxfs_timer.c         |   6 +-
 hw/timer/exynos4210_mct.c        | 107 ++++++++++++++++++---
 hw/timer/exynos4210_pwm.c        |  17 +++-
 hw/timer/exynos4210_rtc.c        |  22 +++--
 hw/timer/grlib_gptimer.c         |   2 +-
 hw/timer/imx_epit.c              |  32 ++++++-
 hw/timer/imx_gpt.c               |  21 ++++-
 hw/timer/lm32_timer.c            |   2 +-
 hw/timer/milkymist-sysctl.c      |   4 +-
 hw/timer/mss-timer.c             |  11 ++-
 hw/timer/puv3_ost.c              |   2 +-
 hw/timer/sh_timer.c              |   2 +-
 hw/timer/slavio_timer.c          |   2 +-
 hw/timer/xilinx_timer.c          |   2 +-
 hw/watchdog/cmsdk-apb-watchdog.c |  13 ++-
 tests/ptimer-test.c              | 106 ++++++++++++++++-----
 32 files changed, 584 insertions(+), 133 deletions(-)

-- 
2.20.1

