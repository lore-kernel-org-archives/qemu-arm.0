Received: by 2002:a17:907:686:b0:a6f:1bf6:7fc1 with SMTP id wn6csp773182ejb;
        Mon, 10 Jun 2024 09:23:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcxFFrGqR1sRdwt+J2LM/bzsnPhz1HkYwrTU5JabArotkWiMKbU4Lw4rn9oSUdenC2ZT27jsa8RZrdMFqUbhPTOhYRfjMV
X-Google-Smtp-Source: AGHT+IHhwPLK8eYFA//tgwXrmiHIGJ6F3IX/Jpil8iRaXJysOeI0PRL8dH1jcGvPIPUgdFQFD3T1
X-Received: by 2002:a05:6214:5882:b0:6b0:86bd:dc92 with SMTP id 6a1803df08f44-6b086bddf3cmr12691226d6.50.1718036638650;
        Mon, 10 Jun 2024 09:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718036638; cv=none;
        d=google.com; s=arc-20160816;
        b=vubLqp8Yt1qn24UNHGgUUQvCGYCLl3YB1slNw9BreNkvIJlZAdq+Jq3D39Q/JztYtN
         P/HfbAQND/g68LeG7lqaDYpXFD+1n78Bx+2LKDKdUxFAYK4s0A5m7jyhh0cxusSAxddt
         cQmTjZpcaL0zFDcjPFOG59N5Tix5lg/NTuXOUIzmgvhLanU/SM5bnuxIT2/BDZRkPnUb
         hDFRkrlnkuLCFyzjaHMxJ44ktVmthDkSHoxTeLKSbaCpebrsCj6y8rLkFqHiJW9uRuPH
         fRDHyRqPW1fUpyETt/6ur068qcuWDf5Z0fvWHJnlJ/ZJ7d/MG5v+z2W7ZAcpS/H+aPUb
         QArw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=MmJqXEo/cvQTcJBBQgnUyi4Q/sMvVbORelXofEHlP2E=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=k42K7iRyNWFuQLyVLe7snwi0/zFUwSRLnLvPrxdk+aMu0Y/Ip8DqoniXHJNvrLaXRH
         BFGrM6xGFQQ8JrkVtNqgNDyR/RclPEvddAB+qaTb3KBCIoxWcpfEBvz1FGm2Vv4+lLKJ
         gUG4S8TTEWzr562wP9VIH4c9SRCzWsxg0Ds6UR+wvCFOzNWqaKsrXsTPC6n4WZbK1nU8
         GqU94NpXQrjKNzMTdS/o+CIrMsjPpGr6BeOWXuBy+eycdYEbKeqINa+5XAWRKz3hawqe
         pedrlJgzs7BXRqTKC1/3X7EiBGMMstcMcYlHG/E+XL+B+aT6624vvnIRPRPShJSWlLzZ
         dxyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TUBsaGmX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b067958f14si67110046d6.258.2024.06.10.09.23.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jun 2024 09:23:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TUBsaGmX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sGhoE-000451-Td; Mon, 10 Jun 2024 12:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sGhoD-00044M-6u
 for qemu-arm@nongnu.org; Mon, 10 Jun 2024 12:23:49 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sGhoB-0005ku-8x
 for qemu-arm@nongnu.org; Mon, 10 Jun 2024 12:23:48 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-421cd1e5f93so1397565e9.0
 for <qemu-arm@nongnu.org>; Mon, 10 Jun 2024 09:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718036625; x=1718641425; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=MmJqXEo/cvQTcJBBQgnUyi4Q/sMvVbORelXofEHlP2E=;
 b=TUBsaGmXCXRKSGFInEc+G5T0yUrTQMJ3KD/LhfYzeigk9ieRDBY46cr0QqaTjdAqUP
 jEmVYhvG4yZ5RiSXV33LOW4NRcjmOx9OpMyjaT+RsrLMeqwdmRnLGICcFXAn5NjvCE8N
 2mh5mrOFUZx0tCKa2FIHAGYHuMGbaKqvwPMArXP9k+PosqKtQTQvprXu1/5u5EHIPQIM
 4F1B7eFkzXZeha6DWo7q3+WKkVqKKeLHUao12+ZGFlap2aNlOrhaWZUuKSE1yhUgMsep
 U4wl90k599LFWwCFvDMNKTCnQaE0twqTak0h8x1Cd6soQwDo1dbZY9qsUWrKDGV9QUVB
 8JUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718036625; x=1718641425;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MmJqXEo/cvQTcJBBQgnUyi4Q/sMvVbORelXofEHlP2E=;
 b=cK9hwjv/6nOGYavWVKYSodydEIApdE8PCnqu9FUtUCQH5OCaRoBH2y8BBUWzmWFLgy
 JzmYLkgCzJ4EribbQQ7URfiLp8asvCO0VRE5iIdmFCQeUGRNNb3Y9C9gdB2L/EjtA80t
 MA7diaFpAqKZsP5LOtmyum3l0DA4aIYVYSAON3xfHRhiA6qNjjnCy9f0kXdNyYBGqR6e
 5icUVXBotQciFOonkE542X710DJcaTNXgx49vZoqSi+5zp6i1cUasuIPU7WvqDATeAAi
 NjPqQRxBtx2Vnl0u2ujYN5pZBCzgayHiOOVUGKpdVLpzmL4ek3Yj25GSq68u++Vxx5ii
 JzIQ==
X-Gm-Message-State: AOJu0YxWTyMkejMrztXds6EjhRVNJDuyIaJKH0m5yD3dQlv5HueX4lBK
 9OHSdOmsqFGl17YAZwThv/c8MOsB0RQRkz6GQw8g623pG6n5ivj1jNM33IfNLv1Izt0Eha5Z465
 f
X-Received: by 2002:a05:600c:3d86:b0:421:81c1:65fa with SMTP id
 5b1f17b1804b1-42181c1661cmr42193745e9.13.1718036625372; 
 Mon, 10 Jun 2024 09:23:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2a6225sm147250405e9.25.2024.06.10.09.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 09:23:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] hw/arm: Create second NonSecure UART for virt board
Date: Mon, 10 Jun 2024 17:23:40 +0100
Message-Id: <20240610162343.2131524-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jHqOifo2fPm+

This is v2 of a series I posted back in October last year:
 https://patchew.org/QEMU/20231023161532.2729084-1-peter.maydell@linaro.org/
At the time I wanted to wait until EDK2 had been updated so it
didn't behave weirdly in the presence of a second UART. That
happened at the tail end of last year, but I'd forgotten that
we never committed the QEMU side of things until Laszlo kindly
reminded me a few days ago. So there are now no blockers to
getting this patchset into QEMU.


For some use-cases, it is helpful to have more than one UART available
to the guest, but the Arm 'virt' board only creates one.  If the
second UART slot is not already used for a TrustZone Secure-World-only
UART, create it as a NonSecure UART if the user provides a serial
backend for it (e.g. via a second -serial command line option).

We've wanted this for literally years; my first attempt at it
was this series in 2017:
https://lore.kernel.org/all/1512745328-5109-1-git-send-email-peter.maydell@linaro.org/
More recently Axel Heider revived the idea with a patchset in 2022:
https://lore.kernel.org/qemu-devel/166990501232.22022.16582561244534011083-0@git.sr.ht/

However it has previously foundered on the problem that EDK2 does
odd things when presented with multiple UARTs in the DTB. (Specifically,
it will send the guest GRUB bootloader output to UART1, debug output
to both UARTs 0 and 1 depending on how far through boot it is, and the
guest kernel will use UART0 since that's what the ACPI tables say.)

Several things here I think mean we can finally get over this issue:
 * I learnt about the device tree "aliases" node; this allows us to
   explicitly say "this node is the first UART and this node is the
   second UART". So guests like Linux that follow this part of the
   DTB spec will always get the UART order correct; and if there are
   obscure guests that turn out to misbehave, we can point at the
   spec and say "this is how you should fix this on your end"...
 * This patch, like Axel's patch, only creates the second UART if
   the user asks for it on the command line, so any pre-existing
   command lines will not change behaviour.
 * Laszlo Ersek has kindly written some EDK2 patches that rationalise
   what it does when it finds more than one UART. This means that
   we can tell any users who do want to use two UARTs with EDK2
   "you should upgrade your EDK2 blobs to version NNN if you want to
   do that". These are now in a released EDK2 and QEMU's EDK2
   blobs have been updated to a version including these changes.

Changes since v2:
 * rebased (the search-n-replace patch 2 needed some minor tweaks)
 * updated commit message to patch 3 with details of which EDK2
   release you need for second-uart support

Patches 1 and 2 have been reviewed; patch 3 needs review.

thanks
-- PMM

Peter Maydell (3):
  hw/arm/virt: Add serial aliases in DTB
  hw/arm/virt: Rename VIRT_UART and VIRT_SECURE_UART to VIRT_UART[01]
  hw/arm/virt: allow creation of a second NonSecure UART

 docs/system/arm/virt.rst |  6 ++++-
 include/hw/arm/virt.h    |  5 ++--
 hw/arm/virt-acpi-build.c | 22 ++++++++++-------
 hw/arm/virt.c            | 52 +++++++++++++++++++++++++++++++++-------
 4 files changed, 65 insertions(+), 20 deletions(-)

-- 
2.34.1

