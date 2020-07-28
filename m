Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp466938lfy;
        Tue, 28 Jul 2020 03:38:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxANceU4dfO3i8OEmKT/ZVxLLP3kIT8EdQpo4mXdL7Plt95f8TfGNPRpvX0NtsuZJ+ejkxn
X-Received: by 2002:a25:1f55:: with SMTP id f82mr41585059ybf.103.1595932685370;
        Tue, 28 Jul 2020 03:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595932685; cv=none;
        d=google.com; s=arc-20160816;
        b=uOD5QZxYMC8ZQsJFwB1HCdZwhmxyXQUvf3GMjnpdCxerG2BvP0E3JFMFPI1gdJ+/d+
         gyobEa9RqpjoElnXrlkhw6mmYkd0wqMHgmY1Zz/uweaEX/IqVqbAkO/qnQvT7l6VVOHZ
         VWoZEiTc2yNhq1QIde4/IKY8W9+VJeu7nRg41iVf3ZEqndddYFSmRmNT91m0etGIi1R+
         Xc1c+/YKXKU+va5u0BA+COzIbOGTcF9tNBpNEYwfzpoJrSSwbKWi9Zf6dZUfPjPvO7Rw
         xR3xUR+TUL04y2isy+YqncfivqcEMd1ig7jgzEtZAz5cfibioqkWTqI9fue78efTVhEv
         vUIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=MuL01ug1d9rCh7z9d9DHphbv9uJzL7Lki+sHKMO8sc8=;
        b=KKVuU94RsJRI5yspfoDapqrXQkpT3Fsg8eY71ur44CfXOFVF7cKhA17jJvUgoBCYR1
         mtrtfTbcmiKQqHLfmfRm2cZC8hbIQTi1uRJbz89H+8pVfaV+FH9aNc0OEMfqhsMiV8FY
         G7Ycpr8wZHqJ1eeV783nQ+V9Y6UjRBqgJcB32r/vb9ggqfDQi2WcZUlYVqQ+JzSkEsZ8
         8Pz03S7HhuATRR0gpAsUjbfVxxKKEVNH6kn+B5g3n3jDn4SKNgBFJdZejhDdJ5Z+WFo9
         O7ndUabzQp4+fVNnn/P/BWAB8WD1wPHvT52YTyzMJrDPR+Pe3MusIOi2KcBjNLJvFrdV
         /cDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=En6MP5+O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7si2362911ybb.51.2020.07.28.03.38.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 03:38:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=En6MP5+O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0Mzk-0004sV-Lw
	for alex.bennee@linaro.org; Tue, 28 Jul 2020 06:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k0MzY-0004jQ-Jr
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 06:37:52 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:32839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k0MzV-0002lJ-H0
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 06:37:52 -0400
Received: by mail-wr1-x444.google.com with SMTP id f18so17791799wrs.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2020 03:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MuL01ug1d9rCh7z9d9DHphbv9uJzL7Lki+sHKMO8sc8=;
 b=En6MP5+OLse5Z8aZFFwlsnTBv8TZHfSgb/j7SmkDdxnTe2Jf1GT+oyLGArrBn5bt7p
 FlFcCsIfidPI7zzhYQZd8IgnB39+kO1AnC1N46dDi9r+eebH/9iKL/PMc9u4J/T/Xr78
 kXubBirwO0Wb+PqxU1lZLtc488tXYSNEuVvvi7OlFmNe/qhUuMhtbsn9BGPJZBZNIzHm
 xAFOjKXXCjotjUoeK3zH1qL0/gFXN/g0MU22xL4FvmIPm0vXNoTmozpUKIQvQLpNSGnt
 AVojcvSMeRCizKvOWvvXNVDCUFnnUJXN/0u/HFQn6PJ8LpVsnplb8BUKDoBrqte0e3gv
 89gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MuL01ug1d9rCh7z9d9DHphbv9uJzL7Lki+sHKMO8sc8=;
 b=eobHQmyg/mOyVROPwtAQ2pSYUO54r3lRsiqdcZ8B210H8GtSQiVv3qb+sJU45EUmiD
 YQXKLg2ikVpMJ0LnehrxVtELgO8oGo3VH0AfY9tPI39oLWqgrxFHGq4Co4FD5cobfRUJ
 Ofq0vyM6Ye2N1t+KmXaJ1JupLJsB9iLbGFygwclcyirJwSQ9t25n6+b5tqqL2sBV/YFw
 CNf5zhnpUoliOo9WUemU/Lj6LyeSsFhPPcbmxyrknrgKA7trjNJjfOx6ef2DONDDyHnh
 Nz5EWgL0FwzpKgWnL8rAMHgfshOQTscSX0ktfvws01/5ef0WyZybdBFVgD6bKnJinBE+
 F3Ng==
X-Gm-Message-State: AOAM530bt399ItTL8CmiexEqVRn29jitAidU3oTF6bD5uMk8/UjQGPjU
 aMTeVfTOuxTLq0zfRYBWb8FLgTxul1T7xw==
X-Received: by 2002:a5d:4710:: with SMTP id y16mr25245982wrq.189.1595932666778; 
 Tue, 28 Jul 2020 03:37:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w16sm18634657wrg.95.2020.07.28.03.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 03:37:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.1? 0/3] Fix AIRCR.SYSRESETREQ for most M-profile boards
Date: Tue, 28 Jul 2020 11:37:41 +0100
Message-Id: <20200728103744.6909-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: etk6wJhcACbH

QEMU's NVIC device provides an outbound qemu_irq "SYSRESETREQ" which
it signals when the guest sets the SYSRESETREQ bit in the AIRCR
register.  This matches the hardware design (where the CPU has a
signal of this name and it is up to the SoC to connect that up to an
actual reset mechanism), but in QEMU it mostly results in duplicated
code in SoC objects and bugs where SoC model implementors forget to
wire up the SYSRESETREQ line.

This patchseries provides a default behaviour for the case where
SYSRESETREQ is not actually connected to anything: use
qemu_system_reset_request() to perform a system reset. This is a
much more plausible default than "do nothing". It allows us to
allow us to remove the implementations of SYSRESETREQ handling from
the boards which currently hook up a reset function that just
does that (stellaris, emcraft-sf2), and also fixes the bugs
in these board models which forgot to wire up the signal:

 * microbit
 * mps2-an385
 * mps2-an505
 * mps2-an511
 * mps2-an521
 * musca-a
 * musca-b1
 * netduino
 * netduinoplus2

[I admit that I have not specifically checked for datasheets
and errata notes for all these boards to confirm that AIRCR.SYSRESETREQ
really does reset the system or to look for more complex
reset-control logic... As an example, though, the SSE-200 used in
the mps2-an521 and the musca boards has a RESET_MASK register in the
system control block that allows a guest to suppress reset requests from
one or both CPUs. Since we don't model that register, "always reset"
is still closer to reasonable behaviour than "do nothing".]

We still allow the board to wire up the signal if it needs to, in case
we need to model more complicated reset controller logic (eg if we
wanted to get that SSE-200 corner case right in future) or to model
buggy SoC hardware which forgot to wire up the line itself. But
defaulting to "reset the system" is going to be correct much more
often than "do nothing".

Patch 1 introduces a new API for "check whether my qemu_irq is
actually connected to anything" (the test is trivial but the
encapsulation seems worthwhile); patch 2 provides the new default
and patch 3 removes the now-unnecessary SYSRESETREQ handlers in
board/SoC code.

thanks
-- PMM

Peter Maydell (3):
  include/hw/irq.h: New function qemu_irq_is_connected()
  hw/intc/armv7m_nvic: Provide default "reset the system" behaviour for
    SYSRESETREQ
  msf2-soc, stellaris: Don't wire up SYSRESETREQ

 include/hw/arm/armv7m.h |  4 +++-
 include/hw/irq.h        | 18 ++++++++++++++++++
 hw/arm/msf2-soc.c       | 11 -----------
 hw/arm/stellaris.c      | 12 ------------
 hw/intc/armv7m_nvic.c   | 17 ++++++++++++++++-
 5 files changed, 37 insertions(+), 25 deletions(-)

-- 
2.20.1

