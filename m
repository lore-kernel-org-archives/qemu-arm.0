Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0518DCCA468
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 11:58:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3YzJ-0000X1-PX; Tue, 30 Sep 2025 07:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1v3YzB-0000Uw-Uo
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 07:57:39 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1v3Yz1-0001bI-8B
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 07:57:37 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3fa528f127fso4597003f8f.1
 for <qemu-arm@nongnu.org>; Tue, 30 Sep 2025 04:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1759233441; x=1759838241; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YxDOVkEyGo0OGUeuSAKTdiFhdGIyySSchCgCk2JXJ04=;
 b=ZA5KAAR0zl8REjurIcM6Lil/CyVsyxmM13MalOyqZBh1Mjz5aKArOrAiOnDVCQovIK
 pfrOGhs33p3ZLXG0xHx1k2JM0pB6h+wjrxJnHMj+I7EFvRUUQDdNPNQn6UgKUHd6YNzW
 2m4ztZyQ7LsG8odLG++pnClJ/xNySCAV49wj9if4PCAWZ34KN7Q907tOyQ7oYrBFA45l
 THNatwQ9+utQ+tfSFf+bWvVQGH7T6Tn56kFhwudd7bzm9L4oKATnFiwHCD5WhsG3sTAG
 dZqmXgf+QspVxbCk1kduRXxL8yXnjjbRhWUu5/0FMPxCyDwA35Q4OBB3MfhgLgTx2bkM
 +RaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759233441; x=1759838241;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YxDOVkEyGo0OGUeuSAKTdiFhdGIyySSchCgCk2JXJ04=;
 b=t5SmwiQWChEk9caHtBrZQFfgyOVASUR0B1h6b1aLZ8NQJ2vfRYALmi0mYKxTsE+UkV
 qhClZ0F56wgkVOjaktOdfB25R7zZN7yBnD/fD0Mij1ZlhRMj3XSuIN9CLEsnmAU1OYSR
 TtLx+oo1QoNb1sTeP51vzadzKwr/VAvyHHehGvzz0//VeIwvcOL/N1BVLKz2B5f3cXw2
 UVF/oTxw644aVVnK9cRUwV6a2u87S3NrmtcugmvKJZ99H1WuTq9kYh1eIl+TnbMsAH/f
 gWdAVHAHDCd+xsYRVKO9ztLbnVl+0R1/0DldsNDgXPAOGRgWKOGiM7ky/6V6cOizDRdd
 QYqQ==
X-Gm-Message-State: AOJu0YyJ0RZdmtJK77SLBju+UZwrLCDzGD6uSFoqNbAy4CdG1BX9CsSz
 tWYSlibL86EUceejk7cYErmviLhsTQLT0cATvmFk45jBaSWmIhGLUkPH1iGDLz0iNSofXBxl/Ze
 +XXo=
X-Gm-Gg: ASbGncvscb9el94odtOFHs/SHjvSi3BJSocRZHX4TWXfgRclwzEVp811cz5BOrHVGur
 Rk0mq1lPKmMLWDjYGHf+y8O/Y7nbHDpsBp701tLZHTJiFFYoYggFuUP0qgGcRxt+DIR7ISZYhEz
 Y08XbfXgaaxSz7rX5gUyC9EZ0+eo6UpvAYcejHX9NHDb43L2WPfCiRkYKWZxw+Yc1ELzCa3yj9D
 1DU6nmzFMtzevbjW2lwGQFs1oRB/jqDIXcNY1GrPoHqqYj93apcknizdVzaCBl1EK8p7uvC78wV
 Biv7Gm8fiJZ5YQWOkxegg+tqc1e1qttGp7cq+gERSBYlAxtAobWVGoj+jeR/TVQ/X5iI4k4aIHy
 XWMNYH/DZtLoKV+4v2x7z8b84fHoTL3EC5oFSnZzF8eURc8qYLNV8OdxTTEWc7fqZD0Ih5R/fGL
 sGTZneWrYrKoO+UCR+PVuA/lugYey4v6+d0Q3btGID/64=
X-Google-Smtp-Source: AGHT+IFzVKD6sllrtozuOkWovR1MMDak3c2rNrQE5T0s3QvYyvOnxNh0Z+/47T8pWqDfo59Bmshg8Q==
X-Received: by 2002:a05:6000:2903:b0:3ee:1368:a921 with SMTP id
 ffacd0b85a97d-42411e9ddadmr4394583f8f.28.1759233440813; 
 Tue, 30 Sep 2025 04:57:20 -0700 (PDT)
Received: from chigot-Dell.telnowedge.local
 (lmontsouris-659-1-24-67.w81-250.abo.wanadoo.fr. [81.250.175.67])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc7d3780asm22448289f8f.52.2025.09.30.04.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 04:57:20 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, edgar.iglesias@gmail.com,
 alistair@alistair23.me,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH 0/3] hw/arm/xlnx-zynqmp: wire a second GIC for the Cortex-R5
Date: Tue, 30 Sep 2025 13:57:15 +0200
Message-Id: <20250930115718.437100-1-chigot@adacore.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=chigot@adacore.com; helo=mail-wr1-x42a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The first two patches are minor improvements before the core third
patch.

This was initially a single patch split as per review comments (see [1])

[1] https://lists.gnu.org/archive/html/qemu-devel/2025-09/msg05899.html

Clément Chigot (2):
  hw/arm/xlnx-zynqmp: move GIC_NUM_SPI_INTR define in header
  hw/arm/xlnx-zynqmp: introduce helper to compute RPU number

Frederic Konrad (1):
  hw/arm/xlnx-zynqmp: wire a second GIC for the Cortex-R5

 hw/arm/xlnx-zynqmp.c         | 103 +++++++++++++++++++++++++++++++----
 include/hw/arm/xlnx-zynqmp.h |   5 ++
 2 files changed, 98 insertions(+), 10 deletions(-)

-- 
2.34.1


