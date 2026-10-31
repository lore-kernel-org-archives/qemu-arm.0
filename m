Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB33E606A320
	for <qemu-arm@archiver.kernel.org>; Sat, 31 Oct 2026 14:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lYlUEw2l
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNAWY-0000ty-1l; Sat, 31 Oct 2026 10:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovankhai97@gmail.com>)
 id 1xNAR8-0008O9-BY
 for qemu-arm@nongnu.org; Sat, 31 Oct 2026 10:52:05 -0400
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dovankhai97@gmail.com>)
 id 1xNAR5-0006YQ-O7
 for qemu-arm@nongnu.org; Sat, 31 Oct 2026 10:52:02 -0400
Received: by mail-dy1-x1333.google.com with SMTP id
 5a478bee46e88-3535bf8b3e0so2395315eec.0
 for <qemu-arm@nongnu.org>; Sat, 31 Oct 2026 07:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793458313; x=1794063113; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=L7ochma7yIOUoWS70+D40B5SHG6wByT/y6Iu6Vp3fks=;
 b=lYlUEw2looVlrrwI7L3Z+ToDmAtnkPjH74d1U8WSX/bCAIAds1hBw2iOwHSOCUauy2
 pSodhK4BrMZ1WvSO9CH2/Ru9URJZ+re9Hno6lzzWg8zdo9pEjAEsk0foUsG09+lbzFc2
 dgFFiMlJ960tgiL+spsiryuLtnTvbFw0vemxp03Hs/k7i1wUf1xne7cYtWLXV8Fq6BLW
 6aHqHkleboj4E7JznJeOnqB/enwhLG5yzt7o0C25nbDeUYwlA1Nt93b2Ut4iUxZhdLRR
 hdD5f4PbWHClz5QkdUCFnpjYb2MFfQCGRs7b50MJ4k92iVSOwDPgODeya1Dq1PlsuOEt
 MNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793458313; x=1794063113;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=L7ochma7yIOUoWS70+D40B5SHG6wByT/y6Iu6Vp3fks=;
 b=r5BZmW7Z3GjOeFaJtv+hLIrpd4bdubqu5T2fXTOFCkQeublN6PyJroORzMc0kgPR3q
 R3W2lQp/VBx7pXQKqIsBpJ5T1N91+Ri3QfXOaE0FFP1u/KeJw+wEAXyTLW6+tQ4w/ceB
 jHy2kJeS4zBZ4Cvu98YouUScgCyFs7gmRlEUphvTa9OLZcaT43Dz0Sbq/joxtozuRLf4
 TaevqaIoT6bRkQMO2qFY6WJvTg0xfIyrnVpGoiVJaHU6PznrKYBNvPHCi28XN3POrzsO
 kDiJgIQAE9skeZ0f49msqh34AfIdYFqoWQE5chYqVWGe41I3HzjNMBwkSiK0hvYNCjSg
 vcpg==
X-Gm-Message-State: AFq9FYI3fsKLgi0/U/fKgN/5nolyC42nMUfSkajU/lA/vpfiH2VUxNb5
 53jZXw3IpMTtcsTy6yotRJAry5DYXVyIXr0q/wxKmFJ6EbaK10apC+sR
X-Gm-Gg: AYBFou1OytXc4hbcR5EZAlbzUvhfrponSALd82Q8Y7T7hdM66pvKKYYyQMjY9YyCxrN
 eo0EkdXb95epoXI5leq1yIMtNOQ9ElnOsQJRlg6IZmTlACnj1dKJOWpNL9mXfT9uMlDCvaolzj+
 MLMFDu5KwEe6yaiIe57SoDMsbRMk5e4FmPUsoNwQDRRO+zQNGR0qI5VXNrR8hhgsjzkx2H84Vra
 Zb9pYyDSDXFPbrW2uXVjQ4E0hdq9kUi2jiAXc5V/m2D76vVJsHDar3h7GQ4ys5e3TPGa9MptH4G
 4HZTuAgt+BvxMTtOEgVcJ8g1LHhQtxyh/4dUxbZ55ePPL13Q8eEisru7dkoieIgFnl/j5vBmmjJ
 QhJey45IleH98dKPIV7ioDiDI1C6n4jiqcw/dcOI91pKDB6LttEo/Be9r+e472g2KfDzHN9UxkO
 HA5Xs/VrFnKi8AdUO5kagdk3gsFSoTeUTm94aijC9Ffezsv4EgDdiiQDavj4aTAbcecIl0qvuGw
 /xInkfd17QuKRJCvedM4OGbaW9FDM5SoD5pL5n72NdPwf3plQMInirFwpspMIPnlor2wrKCtxqk
 i2aE4xc8JryE5cwMKH6WaCJxEzHH1D7i
X-Received: by 2002:a05:693c:2805:b0:36a:4009:58f with SMTP id
 5a478bee46e88-36a423e5474mr7640678eec.22.1793458313403; 
 Sat, 31 Oct 2026 07:51:53 -0700 (PDT)
Received: from ubuntu.lan ([2405:4802:913e:86f0:fc32:76b2:b6d6:a3f6])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a428c17bdsm17541006eec.6.2026.10.31.07.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 07:51:53 -0700 (PDT)
From: Khai Do <dovankhai97@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 strahinja.p.jankovic@gmail.com, Khai Do <dovankhai97@gmail.com>
Subject: [PATCH 0/5] hw/arm: Add Allwinner H618 SoC and Orange Pi Zero 2W
 machine
Date: Sat, 31 Oct 2026 21:51:42 +0700
Message-ID: <20261031145147.32683-1-dovankhai97@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1333;
 envelope-from=dovankhai97@gmail.com; helo=mail-dy1-x1333.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 31 Oct 2026 10:57:32 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch series adds emulation support for the Allwinner H618 SoC and
the Orange Pi Zero 2W single-board computer (SBC).

The Allwinner H618 is a quad-core 64-bit ARM Cortex-A53 SoC. This series
follows the incremental skeleton design established for Allwinner SoCs:
- Patch 1: Introduces the basic H618 SoC model with 4x Cortex-A53 cores,
  GICv2, ARM Generic Timer PPIs, UART0/1, SRAM A1/A2, and stubbed unimp MMIO.
- Patch 2: Adds the Orange Pi Zero 2W machine with 1 GiB SDRAM and kernel loader.
- Patch 3: Separates the ALLWINNER_SID Kconfig symbol so other SoCs can reuse it.
- Patch 4: Extends the Allwinner SID eFuse controller to support configurable
  capacity up to 512 bytes (required by H618), preserving backward compatibility.
- Patch 5: Connects the SID controller into the H618 SoC and sets the default UID.

Verification:
- The series has been tested using Zephyr RTOS (v4.5) running on the
  orangepi-zero2w target, verifying UART0 output, multi-threading with
  ARM Generic Timer (k_msleep), HWINFO UID reading, and SID OTP (512B capacity).
- All patches pass ./scripts/checkpatch.pl with 0 errors and 0 warnings.


Khai Do (5):
  hw/arm/allwinner-h618: Add Allwinner H618 SoC emulation
  hw/arm/orangepi-zero2w: Add Orange Pi Zero 2W machine
  hw/misc/allwinner-sid: Separate ALLWINNER_SID config symbol
  hw/misc/allwinner-sid: Support configurable eFuse capacity up to 512
    bytes
  hw/arm/allwinner-h618: Connect Allwinner SID controller

 MAINTAINERS                     |   8 ++
 hw/arm/Kconfig                  |   9 ++
 hw/arm/allwinner-h618.c         | 233 ++++++++++++++++++++++++++++++++
 hw/arm/meson.build              |   1 +
 hw/arm/orangepi-zero2w.c        |  85 ++++++++++++
 hw/misc/Kconfig                 |   3 +
 hw/misc/allwinner-sid.c         |   8 +-
 hw/misc/meson.build             |   2 +-
 include/hw/arm/allwinner-h618.h |  60 ++++++++
 include/hw/misc/allwinner-sid.h |   8 ++
 10 files changed, 415 insertions(+), 2 deletions(-)
 create mode 100644 hw/arm/allwinner-h618.c
 create mode 100644 hw/arm/orangepi-zero2w.c
 create mode 100644 include/hw/arm/allwinner-h618.h

-- 
2.43.0


