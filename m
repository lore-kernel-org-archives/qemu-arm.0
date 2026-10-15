Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EAFCC6B1C
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 03:37:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHCHr-00053k-Uc; Wed, 14 Oct 2026 23:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xHCHp-00052t-W4
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 23:37:46 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xHCHo-0008Jx-De
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 23:37:45 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-89a756e5d20so3766861b3a.2
 for <qemu-arm@nongnu.org>; Wed, 14 Oct 2026 20:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1792035461; x=1792640261; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=odqEaUh7f60I3OiDEsMS+R3AbpE42KkGMAJEvO3ZAOE=;
 b=MY6NfCvdtj9QMgFMnLHZQhzM8xPEIN7tBn2N4TVziuGPHoOh9TbCCa8MPVr7Mg+u7X
 c40lUl6ZnxG5EFabC3Oo7uHKQ6lCQR6CDvYbiUdib73yVzZDUt9Trct/ECURI6KU0+mr
 iZfqdBfURBfkMn4yuY8TcjFsOVbR2VmF62WbwwFYdEscZCo6tjVschAGfBhpSp7x5Z+Q
 KabDbg98sEsrunLgl5NS7NG40TJzko11KAAhlr8AB1SycpREwMdUw17jJfyZY2+Ix2U5
 a9WfZjSBBKzKm72zOw+20OZPAiTDTAWO6Kjhl6PyCV3+iy6YiWcisHsq6Y7OI6t77lxM
 r4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792035461; x=1792640261;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=odqEaUh7f60I3OiDEsMS+R3AbpE42KkGMAJEvO3ZAOE=;
 b=ivVoBQrqqlLyPrb57Ud7uhUhTSg3jCpyjlWx1Rl3Uoew8Rree3Ier5Ps3KoA7zDuLZ
 3T6YqxE3oDvd6uWj9mBGVmV39Eqg2IhdmyczYSZsCJh9+jJlW97d6vTosUWVzT0xgYOA
 sOxB3O/b6My8xm0xhkZi6mGE5wAdUwAB1HqduTyKLT5xEBiOs6IkjAOZuHlA/GDD7Tto
 scEaU/se7UiGOojszWgilpQk7wwnmFGiFrlpNlPAWjDyKXocK7EzWSEe0fEcgO8hJOg3
 E7DZ+d3539tKNjCTmm/eQ6UKGNzlmemXGXj5+aw4Zv67kDS2NdfbT/T7I0titbrM3QWj
 /aqQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxogXxNthJ9LEMk9rShE+/VE4ZnQVP5Yo8r2PKme5IFfE7ALQzBWYFY75jJ5Pjad/llWSEbV6ESEA==@nongnu.org
X-Gm-Message-State: AFq9FYIze2r/o27cFktHsfy/EFMDFfwc7mhXfzivV88pJ7S1EzMbz2Tj
 EVVbosSzEsJeCsOIZm8kQ6VoArGk48/uzPZuZQ0n+klqQFnDbN8Q63cVZFfN0cjCnho=
X-Gm-Gg: AYBFou0zrNLzFVFXyFyyo2Nq+uRVA13kGBp9blFYP+UO2WL0Qv4W9NYXs6EUEZ7g2Wq
 psAK6gpniy0oaB5FUmUTyYsLxd7od2YicD/r9Rc/woAI+EA3wX0M+xEsL4Zq11UWx58OGwjUqad
 CznDAkX4EYgkOZ21nZgCMQKGjqJoMytksWqZvn+olV/24btH6cg4FF9T6IsNEawzXng0MkbYuxH
 5mAvKJS7CERT1XGqPid4Cq6m3Gv4SDXMTn6rQhPZfjRO+kNzuDb+4eSPky9ya4hgS7Trhb54d3g
 4LI6/BSsqUkpfxd52u5EPsaPQ4Ed8Nn4+r9y4WC140yCLbweeSxR71zZVlK4Ydl5wFsEjkkzQZw
 UchENDcdhFhoACb7PzV6O7pzFaMNY+X7J/Dv16fG+GbXg53ileZLRgn9LM+EPO0eg7z7vuZ+VpH
 e1Ahu/Lp9zVbnuRN4zKt2ZFOcPb/6IzDsnDDpagIZbw5RC6mdcUnjb8Al5iQd+p+iFQp0jOuYnb
 QTtgO2wh+vHxb8w/LF6vZhQjWax/vzAsXRc
X-Received: by 2002:a05:6a21:70cb:b0:3c3:6f6c:aa21 with SMTP id
 adf61e73a8af0-3e16bd857e3mr16235041637.11.1792035461295; 
 Wed, 14 Oct 2026 20:37:41 -0700 (PDT)
Received: from jchang-1875.internal.sifive.com ([136.226.240.181])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cd635c612a9sm559188a12.17.2026.10.14.20.37.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 14 Oct 2026 20:37:40 -0700 (PDT)
From: Jay Chang <jay.chang@sifive.com>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq),
 Jay Chang <jay.chang@sifive.com>
Subject: [PATCH 0/6] hw/dma,net: Fix Xilinx AXI DMA and Ethernet
Date: Thu, 15 Oct 2026 11:37:27 +0800
Message-ID: <20261015033733.35116-1-jay.chang@sifive.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=jay.chang@sifive.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The Xilinx AXI DMA controller supports 64-bit descriptor addresses,
but the QEMU model only handled the low 32 bits during stream
processing.  This causes descriptor accesses to use incorrect
addresses when descriptors are located above 4 GiB.

This series updates the descriptor and MMIO handling and fixes related
AXI DMA and AXI Ethernet behavior.

The series:

- Add 64-bit descriptor address handling to stream processing.
- Add separate 32-bit and 64-bit MMIO access helpers.
- Fix DMASR W1C and DMACR start processing behavior.
- Reset both DMA channels when DMACR_RESET is written.
- Do not start a transfer when TAILDESC is written while the channel
  is halted.
- Fix AXI Ethernet RX packet double-buffering.

Testing:
- Tested Xilinx AXI Ethernet networking with U-Boot.
- Tested DHCP and ping.

Jay Chang (6):
  hw/dma/xilinx_axidma: Support 64-bit descriptor addressing in stream
    processing
  hw/dma/xilinx_axidma: Add 64-bit MMIO access support
  hw/dma/xilinx_axidma: Fix DMASR register handling
  hw/dma/xilinx_axidma: Reset both channels on DMACR_RESET
  hw/dma/xilinx_axidma: Don't start transfer on TAILDESC write when
    halted
  hw/net/xilinx_axienet: Fix packet double-buffering issue

 hw/dma/xilinx_axidma.c  | 249 +++++++++++++++++++++++++++++-----------
 hw/net/xilinx_axienet.c |  12 ++
 2 files changed, 193 insertions(+), 68 deletions(-)

-- 
2.48.1


