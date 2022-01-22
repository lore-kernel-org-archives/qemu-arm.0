Received: by 2002:a0c:df87:0:0:0:0:0 with SMTP id w7csp1732354qvl;
        Sat, 22 Jan 2022 10:24:46 -0800 (PST)
X-Received: by 2002:a05:600c:1d21:: with SMTP id l33mr1044346wms.134.1642875886651;
        Sat, 22 Jan 2022 10:24:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642875886; cv=none;
        d=google.com; s=arc-20160816;
        b=Joia6jd5GrCLQKmt/5U0fQBvcGicJ3z3Mr9fySVU2Cg5ffxC7jyzhFf2ExcV5O7xpw
         eO+cIqsZhM3HUes9dFTIpKNlCwRSKS2DVKEWyw+nkXMjVYObL1VbE8NcahRZXVIyw1c/
         BwfNM9nS1xUG5DCz8790NwSJAc1Xg+mJ/3CZY+iSdUL4IOUA5BGCTmZU/0DsC/PfNoj+
         2ySDBbewQejbkFJrRM22YypPVdZjrZOETPY0zK3Rjqog4+dJRfT8L6C4BWJmiPRDvfQ5
         pbt5BcJ9jMeCirr/rS3983II5DIDd1OrsuBla2HF7LTP20TKeH19Y4aIOOV+eWf8Af75
         RL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=oio/6hQtxU+ak5mBC4OE0O9hK4DvVfj15JxHsC1mIdI=;
        b=pjRXM1uiKLzXmEAZR8s0lxMQ+J9oNDrLrKWHCk5f/Vj8rVitfGOH9hp1dSDa6QJEBF
         kiqddQZmi/jdBikPAQJVz4IaQxPUG3eqwgy8OQfFE+R8KNLEvJVjW64UDUk5ikwhYFfa
         ruaiuONQY8ilxfzwR5qz8rO3grNSb5pndAxBTrOSD7k3QJQWiYaOleFp1ePEyOSyp/Kw
         d303AQSnquTzWBnwe+UsEBuEZXvDH9UisnbtpmguGO6QZ9hnNACHwwbQamRXhToxKWtF
         mYIPm8LWdAZ/NtwSZLs9IZwjd9zgC+Z+0OqFafGu7z4zzUWIOVRY6z7IS95e2j2nyYii
         aZaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D+5BRtnh;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w15sor381817wrq.57.2022.01.22.10.24.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 22 Jan 2022 10:24:46 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D+5BRtnh;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oio/6hQtxU+ak5mBC4OE0O9hK4DvVfj15JxHsC1mIdI=;
        b=D+5BRtnhiOOliUfLNP4O6XoCj+XizSg2q9MaO9a6gcjhF2jVTjYrMFjuinpqxPK4Q2
         NixPheBwfdzRozt7GXUzZys2bQOH4WPMfNKJNg59nDFuoSwBaeSGBEQdCYqHA7NzFi+Q
         eucZKJzsgD9ZXoxXxM1ommDDNpWH/AspKs8EyM2DzirNRIqGhhrXTN2OJoG3OLmAjqhk
         eUmgZh5BKm2QFRn5+921yfpuO/RrhIk73o9oM0EOYqs8irHK3YFul/dX0AZcwFtOMX+f
         qKPYJitLPb/fdVgi0Vh7bJGFAJ75GCO/IUi8GUkkR/hbbqEXMvmgEi2Nq69Wju0yGHU8
         PzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oio/6hQtxU+ak5mBC4OE0O9hK4DvVfj15JxHsC1mIdI=;
        b=NF2qSaFzUyp4VERTRlxifHbIxGCtZ5I7kvOjM3f3ue956Th0LRpaoQWgT+DDKpTk4B
         4XBsSMTw97+WJIKSRRQ9EJ43rO7FgKb8g+Dzzc94m7Dyem2CvMwziix/T/RXvIOmqV+Q
         7OwbccRD1gMlu78XEU0Lc3uAj+EaI5WAyl87YW12aQjYWnDBZqh9XrkpHj16mgJj+qJS
         MZROE2t2w6r3dqo+7FDErqrnVLTwR93QvuCxZG7UZTgJNMIn8cOH90PWfjVZLntlgNc+
         C7Cc8Fzf0pCBnzfd6/rpac+9Vv8jAXXXnUh1l2bCMwULjx7Gwp9G8KBkNeT0/Qdu7Cw2
         3sbg==
X-Gm-Message-State: AOAM532kcKW9Y//aEK2ayQTLMazNvBzXjzNfnv2romCwqI2MgqY4fUdY
	QjP9d/Ms/niNEvCYvInynWxy1qUK
X-Google-Smtp-Source: ABdhPJzdF0rSDCi/lqElQPQDejk2PaVTeQU1T1KFzNYwWKIU3uTEhhMGC3uSGv3ovdmg/zCQGal7wQ==
X-Received: by 2002:a05:6000:1869:: with SMTP id d9mr8118810wri.398.1642875886232;
        Sat, 22 Jan 2022 10:24:46 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 10:24:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 00/14] arm_gicv3_its: Implement MOVI and MOVALL commands
Date: Sat, 22 Jan 2022 18:24:30 +0000
Message-Id: <20220122182444.724087-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: psGmn2ryZAUm

I noticed while working on the new-in-GICv4 ITS commands
that we'd forgotten to implement the GICv3 MOVI and MOVALL
commands. These move interrupts from one redistributor to
another; Linux doesn't use MOVALL but does use MOVI if
it wants to power down a CPU (when it needs to migrate
interrupts formerly targeting that CPU to a different one).

This patchseries starts with a couple of patches that I
found useful to improve the debug logging when I was
writing this. It then has a collection of fixes for various
minor bugs that I noticed while I was in the code (including
yet another fix to the table lookup bounds checking...).
Finally the last two patches implement the two new commands.

thanks
-- PMM

Peter Maydell (14):
  target/arm: Log CPU index in 'Taking exception' log
  hw/intc/arm_gicv3_its: Add tracepoints
  hw/intc/arm_gicv3: Initialise dma_as in GIC, not ITS
  hw/intc/arm_gicv3_its: Don't clear GITS_CREADR when GITS_CTLR.ENABLED
    is set
  hw/intc/arm_gicv3_its: Don't clear GITS_CWRITER on writes to
    GITS_CBASER
  hw/intc/arm_gicv3: Honour GICD_CTLR.EnableGrp1NS for LPIs
  hw/intc/arm_gicv3_its: Sort ITS command list into numeric order
  hw/intc/arm_gicv3_redist: Remove unnecessary zero checks
  hw/intc/arm_gicv3: Set GICR_CTLR.CES if LPIs are supported
  hw/intc/arm_gicv3_its: Provide read accessor for translation_ops
  hw/intc/arm_gicv3_its: Make GITS_BASER<n> RAZ/WI for unimplemented
    registers
  hw/intc/arm_gicv3_its: Check table bounds against correct limit
  hw/intc/arm_gicv3_its: Implement MOVALL
  hw/intc/arm_gicv3_its: Implement MOVI

 hw/intc/gicv3_internal.h               |  43 ++++-
 include/hw/intc/arm_gicv3_its_common.h |   1 -
 target/arm/internals.h                 |   2 +-
 hw/intc/arm_gicv3.c                    |   1 +
 hw/intc/arm_gicv3_common.c             |   9 +
 hw/intc/arm_gicv3_its.c                | 258 +++++++++++++++++++++++--
 hw/intc/arm_gicv3_redist.c             | 115 ++++++++++-
 target/arm/helper.c                    |   9 +-
 target/arm/m_helper.c                  |   2 +-
 hw/intc/trace-events                   |   8 +
 10 files changed, 416 insertions(+), 32 deletions(-)

-- 
2.25.1
