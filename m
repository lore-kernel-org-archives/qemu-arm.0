Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp915403lfk;
        Fri, 26 Nov 2021 08:39:17 -0800 (PST)
X-Received: by 2002:a05:6000:1848:: with SMTP id c8mr15750244wri.265.1637944757331;
        Fri, 26 Nov 2021 08:39:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637944757; cv=none;
        d=google.com; s=arc-20160816;
        b=RmrAc5tKeIUMknNb9uiizDUIXYXQNuXSHI0fW4mhSb2zzSOfeDas6THrgnYz5EE8ZM
         Y+Xn6k+pqWMyXGBSxh3Ebg9Vsx+PK4netg5DKHQsS4F1GsSc5Pu2GmrAV1gp6AtYiZ+k
         dc6Lot0VjYPw/Vx8iSeOnypPMAGR4SyTVUBjUwPjs6eOvHdmquCtp25zv8Zjf/ucEvqE
         JtHDDXpZgdzoUSVJ34HaQCAqFa9FQpKuCtwStoxTygx90WhmZOW+puQ8PN5mQ1byCKEq
         zqIDq4XE5vmEcOAWtuUaaVAbvYUW2AcdhEF1oV+zAhfeRiC6E+ccDDgda/MLEnqX8CDX
         vJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=Ne0ZZY7CP8ngWRBKnIGwHYwnzIuCtxGGrO8uqvdjtxw=;
        b=sgk5aOdMVUyVm2rRS1XlVWOVggikI7Ub/eWjcndKDGJxEYxDzhafOT2Bu4W1tydjML
         RtrFaFL5IDYgK/uQr/Og+3BV3MAweuNj7gXvB/CtNHZBaNWBwn7czVxELsq/kA9g6ser
         y0dA2QuC3nu2ExXiayT3xwU3pZPKiGcT5//B3+Excqwt5O3KivAPoMriLMlmvlcCPbDj
         7Y5ejRifT5/M2+eVKgM5vTVm/BkegU4KhWo5DBw2+sWUT1YDQ2ymG2Z4O4rG2N1x9SEf
         S2VICxus43RKYJ7JU27zyzoZ/5nD7wrlVikxwPt0vTzH2MfG2VBOgWiT7f/4Zr/8/MpV
         aejA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eF0XzSoe;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o11sor4712886wry.30.2021.11.26.08.39.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Nov 2021 08:39:17 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eF0XzSoe;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ne0ZZY7CP8ngWRBKnIGwHYwnzIuCtxGGrO8uqvdjtxw=;
        b=eF0XzSoeavTbETYE9iCoeSz7UkGjztWGq4gF6e6hSce56oifStDRExf07oXqJtI30w
         SdnrIxptygV6D+L5CP6E/NdHa3w5x3fjNuE2R42nbXOI/DOORYANBZEsAnyayXS4VhcA
         njiincXZDOA15Q7G0j33yKKjBTHZ4Iglm21kdE8lF6PKQDQJJ4MY03kUfivtjvm3oeCD
         jQo3XySYQy32De3BWObd2YFwF1d/3P9pO6KU3FHylxal8MQMmka6y+C0qGOm7UZoNTYb
         3zXPlUgcUJMlqa2AljTBH4pnOL5Xq7Qi6MOpSlIkh2AcAslceRG8gkWOZ8qn+mqhLORR
         UpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ne0ZZY7CP8ngWRBKnIGwHYwnzIuCtxGGrO8uqvdjtxw=;
        b=FTrmgBtCyNv2ikcZy484rEKqGuaQL1c/l8g+Nk5KyOw7sNbVrTkxwyr1W22bgVIPHE
         +h/a0jZy7zrJLadRWYggRMwkyh6cQT+nuteprNvJ8HqA5/RTkQ1F7ktmxeQCNiSdTnhd
         Fusf1ST21thcEB5OI8Xm6SBosg+AWWsK+MwHALfM2CYMT0qnQ+QVmA7ScTHKX/4AJILs
         1t88HNcsq4Cih+NAKtfbhWMaCGvjvt6aZ0WEQAnskDSa4LRNXsSKpldFghZwlcH5NZ9u
         RB0ueLvut0acrQ1Z1VdK877tXng+TJvnYip7bmYGk1dyk+bMTFzMMrhnN8LI18CIrOaW
         PVGA==
X-Gm-Message-State: AOAM532NAT9I8Wr+wdWjrCPcXRb4uwOLm1hK13t40Oy7lzoCo7quXo8C
	6Z1lk7R/4ZtwlxP46wHhxcNAwODU
X-Google-Smtp-Source: ABdhPJwlh4ENSg/Y7dYXg0LqmYaz/1iSUoGhic4SmfWu7Qtft0WRaUhBFLNAU5A4zamPNGOgqHQrtw==
X-Received: by 2002:a5d:47a1:: with SMTP id 1mr15105533wrb.436.1637944756975;
        Fri, 26 Nov 2021 08:39:16 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id b14sm7837698wrd.24.2021.11.26.08.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:39:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH for-6.2? 0/2] arm_gicv3: Fix handling of LPIs in list registers
Date: Fri, 26 Nov 2021 16:39:13 +0000
Message-Id: <20211126163915.1048353-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: CV1CVDgrnrTQ

(Marc: cc'd you on this one in case you're still using QEMU
to test KVM stuff with, in which case you might have run into
the bug this is fixing.)

It is valid for an OS to put virtual interrupt ID values into the
list registers ICH_LR<n> which are greater than 1023.  This
corresponds to (for example) KVM running as an L1 guest inside
emulated QEMU and using the in-kernel emulated ITS to give a (nested)
L2 guest an ITS.  LPIs are delivered by the L1 kernel to the L2 guest
via the list registers in the same way as non-LPI interrupts.
    
QEMU's code for handling writes to ICV_IARn (which happen when the L2
guest acknowledges an interrupt) and to ICV_EOIRn (which happen at
the end of the interrupt) did not consider LPIs, so it would
incorrectly treat interrupt IDs above 1023 as invalid, with the
effect that a read to ICV_IARn would return the correct interrupt ID
number but not actually mark the interrupt active or set the CPU
priority accordingly, and a write to ICV_EOIRn would do nothing.

This bug doesn't seem to have any visible effect on Linux L2 guests
most of the time, because the two bugs cancel each other out: we
neither mark the interrupt active nor deactivate it.  However it does
mean that the L2 vCPU priority while the LPI handler is running will
not be correct, so the interrupt handler could be unexpectedly
interrupted by a different interrupt.  (I haven't observed this; I
found the ICV_IARn bug by code inspection, and then the ICV_EOIRn bug
by figuring out why fixing ICV_IARn broke L2 guests :-))
    
This isn't a regression -- we've behaved like this since the GICv3
support for virtualization was first implemented. I'm tempted to
put it into 6.2 anyway, though.

Patch 1 abstracts out the test we were using already elsewhere
in the code into its own function, and patch 2 uses it to fix
the EOIR and IAR behaviour.

Based-on: 20211124202005.989935-1-peter.maydell@linaro.org
("[PATCH v2] hw/intc/arm_gicv3: Update cached state after LPI state changes")

Peter Maydell (2):
  hw/intc/arm_gicv3: Add new gicv3_intid_is_special() function
  hw/intc/arm_gicv3: fix handling of LPIs in list registers

 hw/intc/gicv3_internal.h  | 13 +++++++++++++
 hw/intc/arm_gicv3_cpuif.c |  9 ++++-----
 2 files changed, 17 insertions(+), 5 deletions(-)

-- 
2.25.1
