Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75597C8303C
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 21:22:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFE6-0005mS-Ua; Tue, 08 Jul 2025 16:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZDwf-0004fQ-Ch
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:25:39 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZDwY-0001m7-1k
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:25:36 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-60c4521ae2cso8509878a12.0
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 12:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752002726; x=1752607526; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3HsYTLj5EGS3LIX+JzyfOQ8PUo130XOAvWfkSjLItdQ=;
 b=jJ2+ELPaI/XJ+O7MzFx8+au1MzlrDvSPmveXT7F3jEUQAEERls1VIgwCRD5nrjWcii
 yqFoIao7FOoQm7fLYz+WnFbWmgHgAjKwQgaIixonUb9lXibTamn5hx/Ng62/tfYYTeyf
 HuvOQJdwloDMdQ+2GtHS3srPuEa2m85pV2Y6ah0dBY+D0YVt/ijdOdj4XiClrmu8n+3W
 sQqbfFIOd6ohc80ErFeuOoc1ldyki2cnBFfaQCkH96j4GTVD7YStIO+jpl1SoDX18tFp
 LZBak20eSS03T+qcglifJvZysnSfPcaCSRt2a7+kv9tzBjb6wfnKU2q8wTRtK+hBdODb
 sh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752002726; x=1752607526;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3HsYTLj5EGS3LIX+JzyfOQ8PUo130XOAvWfkSjLItdQ=;
 b=vZ97KuN1eNML7bN9hRFec9I7DQLDTQujBlG2/rirCGG/427P+S2in0m0DoG9o90jHH
 832ASJhpaiA2ztQteLW8RUVQ65lNz/d3miG3j8s2p9aVaPW2C+TqAuCuPOzinoEj2QsB
 ivHKRqaq5b+w6cIO+9uaFEyVtEqEgj7EKztobK7hqjeTrVG5yzx54APo+IrmgII6Nm/0
 vc9fF42Kz9JxvVFvrdaicgjmuJjeQIlUcJkPRyAhb/mHpjilxJmDYvREN2dSw9qri+Au
 bWmaP3M7QXkX3Se7lptQ2XFYNG4T/EO4Vg21Sf9hT98hDvV90qsJVHndUoEwS9kWK2QV
 q3cA==
X-Gm-Message-State: AOJu0YwVimtYt+58uMqErxhvnhD51u2qAgHzIEtu/6EjuIb1C8x0I+df
 /IIGEHd/yqjRTGkmDqKzACdyVunhAMtIbLpFwjGKgeNmeqN0/F5peaHqNa5XmQ/e1gt1Skoy8MS
 +s5TZ
X-Gm-Gg: ASbGncv7MmdcCyqV3vNYVf0XFBtVfDy/zDfQttFFZUT/TnfRVE8DrducDrZ7bn655AE
 fE4h1p8O63bdTu4040XO/2iJhs2uIrKkmFucQzdg6MDn12ZwoYD86s2Vv9HXqhvX/NEJoxOxPXY
 33Nv+v6j0lOVg30AF8Cz18jSd0T7vmAKBITIjhrs5/z9IprxQVIOUi26gC3nu52u541mvuFujuR
 9cdEE9FDHhJj8QYd50t16QsiOpxl2g3Scch5A8xglgExBrFgBX36C7bE8IL7ykY13pHikblhHns
 0ZRZwkFXLD0rskJMeOekvycdP+P1qkSiXNlBnBPh88CgCGWn7h/FgUqxk+uuA2RgQ7/C
X-Google-Smtp-Source: AGHT+IH7zJde7I8fbcPdzlEJEgC+vFaRV9u7yJkZcHsXc+sVNVghZbtval3q9/JwE3wy5rU8Hts/jQ==
X-Received: by 2002:a05:600c:64ca:b0:453:9317:8aa0 with SMTP id
 5b1f17b1804b1-454ccce358emr27822845e9.32.1751975561259; 
 Tue, 08 Jul 2025 04:52:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd4a68ebsm19731255e9.39.2025.07.08.04.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 04:52:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 0/3] hw/intc: handle GICD_TYPER2 for KVM GICv3
Date: Tue,  8 Jul 2025 12:52:35 +0100
Message-ID: <20250708115238.667050-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

The GICD_TYPER2 GICv3 distributor register is one that is added
for GICv4.1; previously this was architected as a RES0 location.
Our TCG GIC doesn't implement GICv4.1, but for KVM the kernel
might support it.

This patchset:
 * makes GICD_TYPER0 reads not trigger a bad-read trace
   event on the TCG GICv3, for the benefit of GICv4.1-aware
   guest code
 * migrates the GICD_TYPER2 register value on a KVM GIC,
   so that a mismatch between source and destination
   can be caught by the destination kernel

Note that I have only very lightly tested this, on a
host which (I believe) doesn't have a GICv4.1.

Changes v1->v2:
 * fix comment missing bracket
 * fix reset handling so this works on GICv4.1 hosts
 * move get/put code to be with the other GICD regs
 * new patch 3 to drop a barely-used debug printf macro

thanks
-- PMM

Peter Maydell (3):
  hw/intc/arm_gicv3_dist: Implement GICD_TYPER2 as 0
  hw/intc/arm_gicv3_kvm: Migrate GICD_TYPER2
  hw/intc/arm_gicv3_kvm: Drop DPRINTF macro

 hw/intc/gicv3_internal.h           |  1 +
 include/hw/intc/arm_gicv3_common.h |  6 +++++
 hw/intc/arm_gicv3_common.c         | 24 +++++++++++++++++++
 hw/intc/arm_gicv3_dist.c           |  9 +++++++
 hw/intc/arm_gicv3_kvm.c            | 38 ++++++++++++++++++------------
 5 files changed, 63 insertions(+), 15 deletions(-)

-- 
2.43.0


