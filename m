Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp309323njb;
        Thu, 27 Jun 2024 09:23:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXh0xWtmw6B+V0eO5SFQBImVjht0R1vzBXmDNNVsC5lKbCE9slPxYjB/f9K0HH0vgO49MpuPr37wYWlGbNgoMQdSwS3OnB+
X-Google-Smtp-Source: AGHT+IHmcfRnmk+QAhnrdgnXz888CZeaUu6Px5dFjkchiBnmxEke304CSRZvGc24tY7ynuuGkgd6
X-Received: by 2002:a25:b07:0:b0:e02:bc69:5665 with SMTP id 3f1490d57ef6-e0345571cb0mr2603171276.60.1719505396079;
        Thu, 27 Jun 2024 09:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719505396; cv=none;
        d=google.com; s=arc-20160816;
        b=N69Q0Y/Lhd5/P6BrDHYJbTXHQ3SVwuYmGuJFdlHpSHnrSIbQHHVzUaFRwEfHmGufqd
         RsN7bF76/u2/4cSKEZLhO/RGx8oH5nRBgkoKtOnujzNXA6oivFanHReDCi7FV+E7yehW
         ijb0H/tTSnR5i73ThDcXB3rkSJQ0o4RduSgX+tWaodlZDT2zN6u6rHfIlJKMC1EFAlBp
         qwzQHkadjgMYi+aljJ2+BvrxrKHsOBIN6Ag92EGOw5ZpS70nSINF4KoK/Fwbm9UUXNbX
         dyoPUwH2iUIrE9pXOoP6zr/sdLObZxyUsP3blvMsI0tXlksFMDF0mVA2uopRd5vHdJFw
         srCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=4gNEJ7+L3PN7xtgjGNFEWvLx/YiUkhV8z3R5GUXOwXM=;
        fh=DqIIoYGV4y15eQNFznI154lpGOvtB0zeKEnnOP//DR8=;
        b=VyQ4ysI7/WqRuOtDkDm++9/Bw95jijQ+O/46TrkXuj2rNdQtELI5VpXWlQal2QuTW4
         GmR5MprrwnAkwTaKcYJ9oJGpYFnjdTYRza8kZ/JZBA6e5QpmgTPPCw7UQheppVIMy0FC
         5CWLwvvtcKxRuNCQm8EwL5978g97c/Wixd5BcUsbJklQKYqt9TTUUfBBihhVhM3hUse1
         56rZus2jnq/XL7+Y7wcf1zzeU33IAFo2r3KrTza7++A9BsrfpOJpmh1FCIu9vLvX8p9M
         Wv2a7pxpeSLpvDncsHBmxFnIBOTwPvCkhc+rgat6MnGDNJeQVxI89Wq0JiSXqYooI4bX
         59JQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SnbK82K2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446439e5c48si13363281cf.693.2024.06.27.09.23.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jun 2024 09:23:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SnbK82K2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMrti-0003Ry-6G; Thu, 27 Jun 2024 12:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMrtY-0003PY-3T
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 12:22:48 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMrtU-00074p-S0
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 12:22:47 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-36742cc9c12so715698f8f.2
 for <qemu-arm@nongnu.org>; Thu, 27 Jun 2024 09:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719505363; x=1720110163; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4gNEJ7+L3PN7xtgjGNFEWvLx/YiUkhV8z3R5GUXOwXM=;
 b=SnbK82K2aU4YjlPKHZpoJogl7szfENiVUa3yzQe+gkB5qnvfbRMj1wDKHGFQmVPh63
 BIUeBLJwvdq4tIva0Ry8lziaZhP3iiQxjuikRRm9qTsHZrTbu7t2LBfsWIFzCIi7uiGW
 /4Ubcp9iiwhZCzxF21OyBd05fe33RVX1MOmDQqyp6pZJ5cavHYhhgEuoR5d0dQ9CdC4t
 3EugSBi+p3D6gTsCNnfrb4N1x2JdPjfrFs4mmUhW1pBIrEzRqqo/Sq23InRkjN9Ojuwh
 v5G5yDOOTbeOKjunTn4CHJyphBdfxyIgpNQSu0RBljU/U4RtDtMUVVwP3t7S7YTYFl+8
 Klmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719505363; x=1720110163;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4gNEJ7+L3PN7xtgjGNFEWvLx/YiUkhV8z3R5GUXOwXM=;
 b=ru54QU2SiV+fRaXTo328zNrwSF0zDOYVK+A+0dv62OPmjs2baXgWGnvbtHEoSrhbhS
 8nrZzD+T7LD/rnmfEiXJLQYKhVrFEMwJVCAtV1uJzHOXpWeKX7V1h9dKWLzVbjCHjQWO
 gw3CBlZB4zr72Gi41BJGfh3if2SyIl/vbBud49H46ldBrYPMuzgf0iCNa/CPllf+BUZR
 kK9s4j6Fvcl8ts3lCVCcQMQtWRQzowh9+bTmg7JiDG95RBi80SK3wUpg7qdBPDp3wVPh
 sFLEExT31naPWC7Jd772gjDnjHkqxByuGdZudY4Q532kg37dlxBi8uPqMhZxWdW8qpA0
 ljTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIDt9JtXK43KWZIw9irBwTtxc4ZTRfnAtnXg62tmlyu0zdCxYqGaYrBZcYj+1G79FkBO8tTWYLjXc3BtK2U2GTyAUl
X-Gm-Message-State: AOJu0Yz6epJW6cBCWEk8QkEivUsX9E5ZDYsWlonTagiHEF0dzdChNLP9
 +gMX9X/KILsru1pfKb5wfMHLp4IjKWgXVz/DrNA0ZV0PyUYwEhWagYM1A99spXo=
X-Received: by 2002:a5d:5f54:0:b0:367:47e6:c7ce with SMTP id
 ffacd0b85a97d-36747e6cab8mr2190647f8f.6.1719505362779; 
 Thu, 27 Jun 2024 09:22:42 -0700 (PDT)
Received: from localhost.localdomain (33.red-95-127-46.staticip.rima-tde.net.
 [95.127.46.33]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3674357fdcasm2360704f8f.36.2024.06.27.09.22.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 27 Jun 2024 09:22:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Hao Wu <wuhaotsh@google.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 devel@lists.libvirt.org, Luc Michel <luc.michel@amd.com>
Subject: [PATCH v3 00/17] hw/sd/sdcard: Accumulation of cleanups and fixes
Date: Thu, 27 Jun 2024 18:22:15 +0200
Message-ID: <20240627162232.80428-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: MCWw6IhAhQ9v

Since v2:
- Tested-by from Cédric recorded
- more patches added :S
Since v1:
- various patches merged, few more added

Various SD card cleanups and fixes accumulated over
the years. Various have been useful to help integrating
eMMC support (which will come later).

Full series for testing:
https://gitlab.com/philmd/qemu/-/tags/emmc-v4

Cédric Le Goater (1):
  hw/sd/sdcard: Introduce definitions for EXT_CSD register

Philippe Mathieu-Daudé (16):
  hw/sd/sdcard: Deprecate support for spec v1.10
  hw/sd/sdcard: Use spec v3.01 by default
  hw/sd/sdcard: Track last command used to help logging
  hw/sd/sdcard: Trace block offset in READ/WRITE data accesses
  hw/sd/sdcard: Trace requested address computed by sd_req_get_address()
  hw/sd/sdcard: Do not store vendor data on block drive (CMD56)
  hw/sd/sdcard: Send WRITE_PROT bits MSB first (CMD30)
  hw/sd/sdcard: Send NUM_WR_BLOCKS bits MSB first (ACMD22)
  hw/sd/sdcard: Use READY_FOR_DATA definition instead of magic value
  hw/sd/sdcard: Assign SDCardStates enum values
  hw/sd/sdcard: Simplify sd_inactive_state handling
  hw/sd/sdcard: Restrict SWITCH_FUNCTION to sd_transfer_state (CMD6)
  hw/sd/sdcard: Add direct reference to SDProto in SDState
  hw/sd/sdcard: Extract sd_blk_len() helper
  tests/qtest: Disable npcm7xx_sdhci tests using hardcoded RCA
  hw/sd/sdcard: Generate random RCA value

 docs/about/deprecated.rst        |   6 ++
 hw/sd/sdmmc-internal.h           |  97 +++++++++++++++++++++
 hw/sd/sd.c                       | 145 ++++++++++++++++++-------------
 tests/qtest/npcm7xx_sdhci-test.c |   7 ++
 hw/sd/trace-events               |   6 +-
 5 files changed, 199 insertions(+), 62 deletions(-)

-- 
2.41.0

