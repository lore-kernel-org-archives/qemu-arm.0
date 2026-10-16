Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420B6CC6B38
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Oct 2026 09:41:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHeRU-00084K-3N; Fri, 16 Oct 2026 05:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1xHeRS-00083x-Pq
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 05:41:34 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1xHeRQ-00071k-Lf
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 05:41:34 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a018dc1f98so49585415e9.3
 for <qemu-arm@nongnu.org>; Fri, 16 Oct 2026 02:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792143690; x=1792748490; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=66EECe90o14dw0yTOpJUJ+OjrObtLrPJ5Zqjapy5tkc=;
 b=BTcAXJeU+lYhg7XobWIbFjGwHuKY0lLFLVJBFbuSWh9wTRQD/scgwja+Ecji9U9Eat
 m/pnIsYNz6jx3sqJM+OWukYyHisPzGoli2xlWgwqSvrmvsKNY4PwquOvtVGDnxW2cMGM
 +QUOZHRamSlRRWntGD3m6J3nZJEGiQPIv5WF3gUZxW/bzuFiygJkNGA7XcLLFB8LGTD0
 qrAClT7SwqQDluWzgY2Doo2rjMcSg7NzDnDChKabx5HA/9cOuj/fWUgFaDekoH/C9GX4
 qu3OE5tql4NtMfvMyu53gyvCLpCQNx/iPnyOb/m4SpR5IUy2cgEbS14lwFlLMZIAZfol
 5/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792143690; x=1792748490;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=66EECe90o14dw0yTOpJUJ+OjrObtLrPJ5Zqjapy5tkc=;
 b=yrR4NlDWsqtAmBw8BV2bAlVLhL3iUpi38RyyMIY/z3BFXcFr9YM1tIbgWzDKZ0KfTO
 xHlj3Rw55PAILQJOcF/iyYgwvgneBvrO1alVDonnhkoJ0Sbgr3yr/p/DjNjpyWPkalNo
 9OonwiVctpUccV24WlF4gAJ0aTaFZ1ObkgGt/C4dObqBJUpnDGGyfOYVeMO0+ulxGp13
 7RKQZtgopd6gEdm7Y4HRnqaV4DRWVlSoEVMMhmMcdLd2KKKlJIddYI8jgL+meD1cTVHd
 3bPRrvskfpjyD/4Tsz7bk2WpWtOMei0pO6CeyxupVDnSF1ZbgyFekkToTUAVf0fKdrH2
 HiEQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwjjE6NqYGAXOQKx1TjjQzLSa9ufauNVcvjZvXQfKYCzjhA93kNMa4TlC1qCBM9avDfh2a4CkJS5w==@nongnu.org
X-Gm-Message-State: AFq9FYLYF7uFfUiGCw7jvmUF+ryovcs39NXUxAdRzCG325iYjqexVbma
 iqAAFR9CjY4xt64KcJTy6mAuIPOW9Xnzd4+7PAXPtAIGSNBtUdpvkCR+U7W14EuH/+Y=
X-Gm-Gg: AYBFou1LqTAQKmbrvxKEwrkxuRAWfqGNq0gqMRY77eRdC7BWCw7ouA/8FtLHPQ8EQ/X
 U6cFYEGe5/aAklgDTtJDmp1W3BJFqypQ3ZLItI9QTYKiFdQmPW6YXHKSraeQaClNEFCd+QhUCwB
 VJywOLXrrLLhoZoiIe1sVmpWK+fvYPGVpelGnymigNJILjueBq3PP9lTUypiSkXLoMYizWqrb7B
 Q3b9hj2NwQ0OaPV3gXmt9gJrLmmAiABXngekw1UhW46dE2+J+ngB/7WiIgcKBAyTIwuow0hqjFj
 hQo6n+IUGTc7JLYTfQK07kI8qddnXictk5jVdcXhI8Mc/tP3D/0NaTboLjkXWuQfV1lPoJM/JHX
 V9jUJ7PF8elZGAdLFNuEZEiUe3/0y0s90DaAU4n2Na1QS5sF9ePHWAK4Xv1h4CrAWfGpiCYWCJI
 zv5mBDXHQozRrZPFUWqiOkckq8TS84DvCE9jzYu+ph2nM4gizR7bj58VUizKMtKMRfTryMVRBYH
 w==
X-Received: by 2002:a05:600c:4e8a:b0:4a1:78dd:dd28 with SMTP id
 5b1f17b1804b1-4a18e4d2b31mr446516035e9.27.1792143690239; 
 Fri, 16 Oct 2026 02:41:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:8f73:128f:8f43:e3ec])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1cf05009csm28649385e9.10.2026.10.16.02.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 02:41:29 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH 0/2] Add SMMUv3 Root registers
Date: Fri, 16 Oct 2026 10:40:50 +0100
Message-Id: <20261016-jmac-smmu-root-registers-v1-0-e78e8879d347@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACfx0WoC/yXMQQ6CMBBG4auQWTsJrcLCqxgXpfzgkJSamWJMC
 He36vJbvLeTQQVG12YnxUtM8lrhTg3FR1hnsIzV5Fvfu9Z1vKQQ2VLaWHMurJjFCtR4jJfJwYf
 +PHRU86dikvdvfbv/bduwIJbvj47jA9DsA1Z8AAAA
X-Change-ID: 20261015-jmac-smmu-root-registers-dc4f1e2a63b5
To: qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
 Jim MacArthur <jim.macarthur@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-6be7c
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x334.google.com
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

This is preparatory work for further SMMUv3.3 features including RME-DA.
We are adding in patches originally authored by Pierrick Bouvier 
<pierrick.bouvier@linaro.org> and Gustavo Romero <gustavo.romero@linaro.org>
in a way that will avoid conflicts with Tao Tang's upcoming SMMUv3 Secure
state patches. Since Root registers do not use the banking system, this
should only conflict around the offset check near smmu_write_mmio and
smmu_read_mmio.

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
Jim MacArthur (1):
      hw/arm/sbsa-ref.c: Increase SMMU space for Root registers

Pierrick Bouvier (1):
      hw/arm/smmuv3: define Root registers

 hw/arm/sbsa-ref.c              |   2 +-
 hw/arm/smmuv3.c                | 229 +++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/smmuv3-common.h |  22 ++++
 include/hw/arm/smmuv3.h        |  13 +++
 4 files changed, 265 insertions(+), 1 deletion(-)
---
base-commit: 5acdfee7f068d88813c989c52f76bb64a06121ca
change-id: 20261015-jmac-smmu-root-registers-dc4f1e2a63b5

Best regards,
--  
Jim MacArthur <jim.macarthur@linaro.org>


