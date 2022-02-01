Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp660744lfk;
        Tue, 1 Feb 2022 11:32:09 -0800 (PST)
X-Received: by 2002:adf:fb4a:: with SMTP id c10mr22022891wrs.243.1643743929793;
        Tue, 01 Feb 2022 11:32:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643743929; cv=none;
        d=google.com; s=arc-20160816;
        b=Dw1Ak8zIIwyYRtFFj+EqYZ/+FQzLwVvlsg9rY+mEuwaYtx2/VxxaBTkjDJuu2OYk4p
         KmBObput7uVk6KiXsUFwl5fQkt67ZvWi4z0EXSQaKCrWFgfxXBBPE9smA1QChK7lAidU
         CGMMMwRrNgjy5syj4bQ+pp3JRnvRmyLbNmnK0cJ2Adn8GudW1YMLfw27KMzFuaN4PrcQ
         in2c9odQP0RjejMNiArY9jEu08Zj0TMigBZagGv3M/42JG3U3eE1w8yeIy6n6l+V4AE/
         uFARfOhoChSU2dJx0Rbekg5H+c9um1V2RV1XQFWdBduIrEVVBt55sMeiayTcex/OMXdM
         PLpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=NNxoGTM339928Yo84PwOxlFiC7fEAQLsnAwUVkrE8PA=;
        b=krqRhKLVPzwfxhHM1tl/myzgPvzPhG6zoU3fb0P7syT//UGMJbKvN/0wt4Fsv76hkP
         C1uSA2GCbNlVj5/Qtg/2pCa/Um5S4evHJxD4oVJGXuuXMnCfS9B2PEpx/ioH1gUk3d+a
         bCteGW6uHl9O/RbBVifNfn4NXNCLy58iyNVVlTzJzKpSbcY9dC++g+nkqtRW0MsGXvJI
         HBpqevXZ83Ly/gUs2KPxDvxb8cfzWxUxnJoAKMWP6CfzBCR7q6hxfvFZKhiieEflUaaC
         1ZW8lSeOEkk53N4cESAN9XjZOp5UmKWi6xMsrhHPM17C/NrNnsplahiBNXAS13gqI1n+
         4vWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YF+9zX61;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n7sor1751013wms.11.2022.02.01.11.32.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Feb 2022 11:32:09 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YF+9zX61;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NNxoGTM339928Yo84PwOxlFiC7fEAQLsnAwUVkrE8PA=;
        b=YF+9zX61KuTHcViYxllPrM+r4NAINAqlrcNFRCRBFo/vZllYIqWB6Vq3+GKKXCGnCR
         /Yi1sqquVxG9KnkY/ONzpAx14v7lntfI82WmiHaIucDwROE8DVuumWCcBIiCdyokNOJm
         LKTDLX82U51LQFhhHZNpc+YcEiCd3O/D3KjlPBdxKUugO3g+5h9k/6XHCTRMBI6fxdLL
         2oDTaXHLyFWpRY1EKBO6KzIQlFsYBVZ/s92rQxlNq5xPZ4JcGLrWAde1ljpsldQOoAUF
         rrS/hN2bu+iWXT/jVdXHOZh9mrrLIgsTkllMGh/Y98P7w+/neSZvItvDWnBLIbhhb33i
         epzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NNxoGTM339928Yo84PwOxlFiC7fEAQLsnAwUVkrE8PA=;
        b=dbi82wGUouT4w57kxvZnG4sDfvPRDlCl9/7nrTWKzJ6Rw+zACwAwyVNtr7S5FXHyoQ
         01lzOr5Cqz/FExYzsQwPi7PYOJImSuTJVxSnBsWAxQZLbFQSpcAPT6WZ/47hUozgvaEG
         HXaIp3CHZizUDXGZNvtUU/rkaCRCeVVw3AGM2/AMcciP7JdUOG4fqcR5xWMtknwyHtIW
         LOD67iHRMeZpRGOXpA5hOeX/MBK/TxuerGR0hZkxy2+Lgb/1A3cYkvb3uzp/j6WZV83C
         h0qZMv4YU83ne44K9p6UifeQMKzN+9Z2Zx9esIca5jSRkSmAoee6MBs6okw0hiAZGbWe
         unxA==
X-Gm-Message-State: AOAM531V7ym2pvB3sYG4mh6HgoPESdehAsiWgrWf7MSkbWRzBx3jFruy
	OurZt15WKYBhONDGraVDBM2FzzLm
X-Google-Smtp-Source: ABdhPJxnrq5MRjRHns9Iuwfbrrx2hS0nXyA35zwy6u6qCh+vRUGukQjf3y2ZNzz/63koASUljN9d5A==
X-Received: by 2002:a1c:a98f:: with SMTP id s137mr3163722wme.51.1643743929353;
        Tue, 01 Feb 2022 11:32:09 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 11:32:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 00/13] hw/intc/arm_gicv3_its: more cleanups, bugfixes
Date: Tue,  1 Feb 2022 19:31:54 +0000
Message-Id: <20220201193207.2771604-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: nNQgSBOoVRXb

This is another set of patches to the ITS emulation; mostly
cleanups, but there are two bug fixes.

Cleanups:

(1) Switch away from reading command packets by multiple separate
calls to address_space_ldq_le(), and instead use
address_space_map()/unmap() to get all 4 doublewords in the command
packet at once in the top level queue-processing loop.  This gets all
the handling of loading words out of the individual command-handling
functions and makes them a lot easier to read IMHO. Plus it reduces
the number of lines of code by about a hundred.

(2) Unify all of the get_foo()/update_foo() functions that we use
for reading and writing the various in-guest-memory tables so that
they use a single style of API rather than being confusingly
different about how they indicate failure and how they return
the interesting fields from the table entries.

(3) A handful of less exciting minor tweaks.

Bugfixes:

(1) We were mis-calculating the address to use for the
last 4 bytes in an interrupt table entry, so they overwrote
the middle 4 bytes... The fix for this one is slightly
awkward because we need to handle migration from guests which
have in-memory tables written using the buggy code.

(2) We shouldn't validity-check rdbase in MAPC with V=0

(3) MAPI/MAPTI with intid 1023 should be rejected

thanks
-- PMM

Peter Maydell (13):
  hw/intc/arm_gicv3_its: Use address_space_map() to access command queue
    packets
  hw/intc/arm_gicv3_its: Keep DTEs as a struct, not a raw uint64_t
  hw/intc/arm_gicv3_its: Pass DTEntry to update_dte()
  hw/intc/arm_gicv3_its: Keep CTEs as a struct, not a raw uint64_t
  hw/intc/arm_gicv3_its: Pass CTEntry to update_cte()
  hw/intc/arm_gicv3_its: Fix address calculation in get_ite() and
    update_ite()
  hw/intc/arm_gicv3_its: Avoid nested ifs in get_ite()
  hw/intc/arm_gicv3_its: Pass ITE values back from get_ite() via a
    struct
  hw/intc/arm_gicv3_its: Make update_ite() use ITEntry
  hw/intc/arm_gicv3_its: Drop TableDesc and CmdQDesc valid fields
  hw/intc/arm_gicv3_its: In MAPC with V=0, don't check rdbase field
  hw/intc/arm_gicv3_its: Don't allow intid 1023 in MAPI/MAPTI
  hw/intc/arm_gicv3_its: Split error checks

 hw/intc/gicv3_internal.h               |  23 +-
 include/hw/intc/arm_gicv3_its_common.h |   2 -
 hw/intc/arm_gicv3_its.c                | 696 +++++++++++--------------
 3 files changed, 328 insertions(+), 393 deletions(-)

-- 
2.25.1
