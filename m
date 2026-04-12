Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74902F45A1C
	for <qemu-arm@archiver.kernel.org>; Sun, 12 Apr 2026 11:03:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wBsab-00080L-Ue; Sun, 12 Apr 2026 07:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyanglan718@gmail.com>)
 id 1wBsaW-0007za-MV
 for qemu-arm@nongnu.org; Sun, 12 Apr 2026 07:02:50 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yangyanglan718@gmail.com>)
 id 1wBsaV-0005gx-5S
 for qemu-arm@nongnu.org; Sun, 12 Apr 2026 07:02:48 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-82cebbdab08so2752830b3a.2
 for <qemu-arm@nongnu.org>; Sun, 12 Apr 2026 04:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775991765; x=1776596565; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P0I64YhpyMjlwXh0rYcyNuTHHPF6A4RQnkGlKp1Ga9E=;
 b=k5HbrsAy/6QOmud2HTSY2i6AbMmq9bwvBVqI3hVCiuz/rK0Wh1LeVCPAe/yOmvzhoH
 shWKhpcNg1WEnvTKVWZs+Q+m0KnXrJlMQaBLcOVQj9N7g5n6EzBSXITfNfyX73xm34/R
 02abNVacsT6fdr2URL0NjQB/GzveaZHHyq0cVNVmpx6594nzTWkGIrR2Fe1ohk4ECf8z
 5RZxybmmqO29fxd7WDjG/wuRsaU0zYJQ/SuLDPojZ018g4likJboC2dUiM6dcvrt4rxN
 17DBANOiIfqoJy1D1mF9x92qHMYuiUN4DMOTjsYwh3whL25b/m4SVwDzfbCRgmiNH51I
 DbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775991765; x=1776596565;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P0I64YhpyMjlwXh0rYcyNuTHHPF6A4RQnkGlKp1Ga9E=;
 b=MvAFoVTfwPzt1RMQYq1VWzwGER5WntDo/jbB2CsNd2bg8+2LjMpZje+F4Vtl+lxzyk
 KOIP0Br0owfBIrAwlp0zNzeFZNhCT766OdagtguiSx8VUcr7EwffDMTqNEnjvq2os6K/
 jocI/vKisshC72DPfHR92BIZtoaXFArnZH4GDrwOKJ1gAjQzRy5BbA8fNTScRFqD0Arf
 ilxzJzdxZtGE++3ZrIwQgOojhJHcfVbURsiZ/Z/Muy0bfBuTXpbTUsO18SYwH7iN0j4h
 crlxm4eP7t+Gd6cgtsJmbmTZrcdVYga3rK1HONALzX/UKb7GMpBF2Mbqfv0H6d0/Sn1C
 hODg==
X-Forwarded-Encrypted: i=1;
 AFNElJ99fcNaV+JqzxRDs+791mgBIsqFLzv8Dus5dJghHRVomafXHCCC5GJ6W6hTmWlwtl8sU63lJDrXug==@nongnu.org
X-Gm-Message-State: AOJu0YxlJxWLG6D22t6FzVPeGG0jtYwEUn4YjMM7icucDxGswtn+9bGg
 u7efCtJ0tEA1iFZ0+K9UEwRUatMNpvM8jq94jLt/ZE9c22/EzqDCNHdf
X-Gm-Gg: AeBDievVpyB1CBjvBa7W26epxYkT36usHJjlcefrNtbaFvRi3Hj3Qm4KZGAGBtU6JwG
 LpQxSHoCP2E1sY1gjfD3Y/KGSkUklnQAiBZun+rXzO+wcKE1OVKl8hEYsGEyJllv/DJzibHXhgD
 SgDKEc4+z8Hj4HUcoGsjBd08ByXYvW4uwfDB/Z9AbaFljhqX+rJXNbo785+cdKmfZ7wuOJDEgLJ
 /fGmZ3f1wJXwG9moaqAgEsolo7gT8L3wUpB7WgN8SXPomHcQtz7FWlWLDNCMTdjgjXWmUmbEYpR
 LXx8+Un+ws0+eggjPfRWCBLc/D7xp2P+iWcE62nfLT5CxXwdvicvcnRh84oURFZU/MCFYr8Pdea
 C5VBGEr4NimIbExXDkr5tXnG+RNp2DUAzHLNm/3PQzEbmYL5IgSgV39jiTpu+i4CFNXM11nr7j5
 SP1/NiAFCXGRhyFZooEcM1u4o5YOZui6UQ0Mc=
X-Received: by 2002:a05:6a00:9a3:b0:82a:75be:d377 with SMTP id
 d2e1a72fcca58-82f0c2c8331mr8694877b3a.41.1775991765118; 
 Sun, 12 Apr 2026 04:02:45 -0700 (PDT)
Received: from archlinux ([58.38.119.35]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f0c20aed6sm7996263b3a.0.2026.04.12.04.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2026 04:02:44 -0700 (PDT)
From: Yucai Liu <yangyanglan718@gmail.com>
To: pbonzini@redhat.com,
	peter.maydell@linaro.org
Cc: jcd@tribudubois.net,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v3 0/2] i.MX6UL LCDIF device model and SoC wiring
Date: Sun, 12 Apr 2026 19:02:38 +0800
Message-ID: <20260412110240.93116-1-yangyanglan718@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=yangyanglan718@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Yucai Liu <1486344514@qq.com>

This series adds a basic i.MX6UL LCDIF device model under hw/display
and wires it into the i.MX6UL SoC.

Changes in v3:
- merge the previous "build symbol" patch into the device patch
- drop the unrelated hw/arm/meson.build line-wrap-only change
- fix commit message formatting (use real newlines)
- use 16 KiB for the LCDIF MMIO region size in both device and SoC map
- rework register indexing/storage to match 0x10-spaced register layout
- apply SET/CLR/TOG semantics only to registers that have those aliases
- set CTRL1 reset value to 0x000f0000
- remove redundant 32bpp host-surface check
- move realize-time cleanup to unrealize

Yucai Liu (2):
  hw/display: Add i.MX6UL LCDIF device model
  hw/arm/fsl-imx6ul: Wire in the LCDIF device model

 MAINTAINERS                       |   2 +
 hw/arm/Kconfig                    |   1 +
 hw/arm/fsl-imx6ul.c               |  12 +-
 hw/display/Kconfig                |   4 +
 hw/display/imx6ul_lcdif.c         | 453 ++++++++++++++++++++++++++++++
 hw/display/meson.build            |   1 +
 include/hw/arm/fsl-imx6ul.h       |   4 +-
 include/hw/display/imx6ul_lcdif.h |  37 +++
 8 files changed, 511 insertions(+), 3 deletions(-)
 create mode 100644 hw/display/imx6ul_lcdif.c
 create mode 100644 include/hw/display/imx6ul_lcdif.h

-- 
2.53.0

