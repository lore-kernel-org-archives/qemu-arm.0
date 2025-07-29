Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A917C83F26
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Jul 2025 16:40:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ugnND-0003Fi-Qk; Tue, 29 Jul 2025 12:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1ugn1H-0003GI-BH
 for qemu-arm@nongnu.org; Tue, 29 Jul 2025 12:17:57 -0400
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1ugn0z-0001GQ-Pv
 for qemu-arm@nongnu.org; Tue, 29 Jul 2025 12:17:36 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1753805834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=3yC2zAVo+sPt1zg+bMAqISz5bl1NtbX9eWGvEUo8XqM=;
 b=mnKdAmFEL1d5S1Z+UCOhvJ8NIkX3TDB1YjNU/5XLvHl2sCd/V6P5paXOKzz0e3LER2lBwx
 wi8WmsDj9Dckf2fQVsLSFIN3nDgeGVT5zGPD2sN+luK960E2QqC1ZwHKdC4/Sz3vSYXzln
 iYHJtusQ6lzvYFYajo3KtjPyHwAhZ6k=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH 0/2] hw/intc/arm_gicv3_kvm: two small fixes about register
 accesses
Date: Wed, 30 Jul 2025 00:16:48 +0800
Message-Id: <20250729161650.43758-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=2001:41d0:203:375::aa;
 envelope-from=zenghui.yu@linux.dev; helo=out-170.mta1.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

Zenghui Yu (2):
  hw/intc/arm_gicv3_kvm: Remove writes to ICPENDR registers
  hw/intc/arm_gicv3_kvm: Write all 1's to clear enable/active

 hw/intc/arm_gicv3_kvm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.34.1


