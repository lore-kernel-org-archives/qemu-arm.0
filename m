Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp242896ejk;
        Mon, 29 Jan 2024 07:18:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGV1XkY0i96uygrcuzHMF0wPHdm43aHq0+hKf/XGJliRHFoTVryycTSkGvhpT6EoGWIvQ5s
X-Received: by 2002:ac8:5a55:0:b0:42a:5128:629e with SMTP id o21-20020ac85a55000000b0042a5128629emr7160600qta.64.1706541538837;
        Mon, 29 Jan 2024 07:18:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706541538; cv=none;
        d=google.com; s=arc-20160816;
        b=yykLaJCHE1+3gTMZGDvVrc7q4KNk4IsbX7Dq3A39BZ5nNIuavoFAG+Ah5Hl7294BuR
         TdVxY7DTCAj432xnC+s1WYYc5jmQeDYsHQbSr37g5m7kIeShtwXOk/ZKYjGqMwQsYlIc
         NCpcpfBMByoTZzw5Wlrqa8tmVD3uKIE0YvH/8Y2GD8UtrW7xa6Pa89FCSvVeOMfTqYeX
         LrPrkbQfP8oqhglb6VKble/pIg02oDN48upv1V51Ll4PnsbpaSUE9huvlI3Sfn9XwoS8
         L+ICalS4ZCc4pjSE2bZzr0oI6hB/Sp2Pv95w8ZeMgL+5ivRlyyUMsNz80CsndzP/vY9Q
         vvbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=oz+zTTfGm1MKa4a97HFk11IR2+Bank2vY+LpKIqyLck=;
        fh=RW1HAZg32p608XjkiY/EhNjMRMqNofGjo6c7Iogb25w=;
        b=NoGnbxHC58GwMKg4mC5eSdV6CTX0i6CEIQWCMUgB3NFVipJFI4l4V5Mg4KGIQ5pw+R
         XBvSgtzAN9XLj7qQ6baFuGXPzG0zddsftzQbcZdKhFTkC+lYKhrLtpmLJD1zUO0WnqBf
         eLdtmVVcN1WbZ/Mn9sZkqTZUMGJQ+qOh7gG+stcdLwwApLvTuTbTMXlgKqsl1PIgc5H+
         4xfk5DB9iezMGmnlwXcBmfD4hvDus//QcwFNw2ieoeGKXGzN5c7J86xsP09K48hfmArN
         RyhMir+WfVm+aEevDpQRduqxjvFQp8qHhJf6JLAEMmre04RuFZ3p6ua5ieirpZDB2g+Q
         xm1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pfqxMy28;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p19-20020a05622a13d300b0042ab1872442si76517qtk.290.2024.01.29.07.18.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jan 2024 07:18:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pfqxMy28;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUTPC-00073I-ES; Mon, 29 Jan 2024 10:18:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rUTPA-0006yR-9d
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 10:18:36 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rUTP8-0007PZ-BU
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 10:18:36 -0500
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5102e2ab56eso2046472e87.2
 for <qemu-arm@nongnu.org>; Mon, 29 Jan 2024 07:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706541512; x=1707146312; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oz+zTTfGm1MKa4a97HFk11IR2+Bank2vY+LpKIqyLck=;
 b=pfqxMy28pDWE244/PIe9tpSb1jXdcq6Y0PkLBLQKe2VRKLac706aog4AWxt5L4vgW5
 7agX3055VPSRQHentic8SS8iJa/9WY4arv93MU+Z5YcTAYoVNvROVw63MDMNxZXxUi+t
 5LZze8NEEsdBMZ32DEmD7FS7eM/1c3//BZn5nH6VjeZmRWwlIkmgZuj2PIMVbk9+XRHy
 E4CZLqahWCl4sMtR6RLUmNic94nTsHdMLo7dLG0xkqZhOPJWp4w4i2Tzar2qZFeFDHll
 37Dci8FUhJPanD5uRYZy6DYFkE8PPPxxY4NvfkpaY8xBdi0Uahy9QtoxxrEZTuSF6iX+
 tuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706541512; x=1707146312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oz+zTTfGm1MKa4a97HFk11IR2+Bank2vY+LpKIqyLck=;
 b=hyjiiEsneVVCKJG049XQ2/soFjjt7j8HEqgtq+6gibQEFcI97lBxCn0DY+xoNoxd89
 YfooDyBAwwQmINEEjSIfOrC0pC6MonKQ+VWp7+me44tTjjYl9H5ZQV7dnRjOWQi++99d
 3voRmC2G3BDIuoW/eRcyTkibcZIG5ILzO+wZ+f3t5oKvRjpdUnwanPq3IrYIf+JvgJCK
 1v2+yUz6OTBcP6xzHFOlyTKYmqg3wW4mEyKuode5csI/UTwcQEW7Vrtx2HOI7gDJKc8U
 OoR8y0q9f5rAnUlcpKRszQUgleBbVojclSmbGKuQB6NFfVmlOzoSBu3k+NQZ/PJQGdlB
 fv+g==
X-Gm-Message-State: AOJu0YyOksCUNxKAn9K0RwUrO+zhCMCctYCcnsHcyOl6J1rg/NnuKvLV
 cXoMHvNpG7upI2dVTZeM2PItNy5/qCv5hxBIssQRTa8R4wVv0uANt+uDm2YnP3Q=
X-Received: by 2002:a05:6512:10c2:b0:510:1487:bcb with SMTP id
 k2-20020a05651210c200b0051014870bcbmr4624283lfg.64.1706541512038; 
 Mon, 29 Jan 2024 07:18:32 -0800 (PST)
Received: from m1x-phil.lan ([176.187.219.39])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a05600c444300b0040ebfbff33csm14445952wmn.36.2024.01.29.07.18.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Jan 2024 07:18:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Tyrone Ting <kfting@nuvoton.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Hao Wu <wuhaotsh@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 0/9] hw/arm: Check for CPU types in machine_run_board_init()
Date: Mon, 29 Jan 2024 16:18:19 +0100
Message-ID: <20240129151828.59544-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x133.google.com
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
X-TUID: Nhawrq61yxOR

Series fully reviewed.

Since v2:
- Rebased
- Remove default_cpu_type (Richard)
- Added R-b tags

Since v1:
- Add missing QOM parent for CPU cores
- Dropped Aspeed changes (Cédric)

Following Gavin recent CPU type enforcement cleanups,
restrict more single-CPU ARM machines.

Supersedes: <20240123222508.13826-1-philmd@linaro.org>

Philippe Mathieu-Daudé (9):
  hw/arm/exynos: Add missing QOM parent for CPU cores
  hw/arm/exynos: Check for CPU types in machine_run_board_init()
  hw/arm/highbank: Add missing QOM parent for CPU cores
  hw/arm/highbank: Check for CPU types in machine_run_board_init()
  hw/arm/msf2: Simplify setting MachineClass::valid_cpu_types[]
  hw/arm/musca: Simplify setting MachineClass::valid_cpu_types[]
  hw/arm/npcm7xx_boards: Simplify setting
    MachineClass::valid_cpu_types[]
  hw/arm/vexpress: Check for CPU types in machine_run_board_init()
  hw/arm/zynq: Check for CPU types in machine_run_board_init()

 include/hw/arm/msf2-soc.h |  3 ---
 hw/arm/exynos4210.c       |  1 +
 hw/arm/exynos4_boards.c   |  8 ++++++++
 hw/arm/highbank.c         | 11 +++++++++++
 hw/arm/msf2-soc.c         |  3 +--
 hw/arm/msf2-som.c         |  4 ----
 hw/arm/musca.c            |  1 -
 hw/arm/npcm7xx_boards.c   |  1 -
 hw/arm/vexpress.c         | 12 ++++++++++--
 hw/arm/xilinx_zynq.c      |  6 +++++-
 10 files changed, 36 insertions(+), 14 deletions(-)

-- 
2.41.0

