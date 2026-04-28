Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E909EFF885D
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 09:34:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHep9-0003NH-8w; Tue, 28 Apr 2026 05:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHep7-0003Ll-Gi
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 05:33:45 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHep5-0007Px-VN
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 05:33:45 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4891c00e7aeso85067615e9.2
 for <qemu-arm@nongnu.org>; Tue, 28 Apr 2026 02:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777368821; x=1777973621; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xekvDfh2dxmdIlEXP7S2Vcn3LeIat4hsKRy3BWYX78Y=;
 b=ZNYDD/TBdbg9ZFMv0YOWdwvc1VnuJeYJ8eVMBHbDMFtcQqz97fY+Uzn0g2dE7sOy+2
 1tacZmXQefLp+9TGSFM90pSyflOLpuYIDxfj26MzgFVkfJ7IHeJaDb9Z3FNEN61ARwbk
 xbuUR3m2jVmXgKYQ6IqTaZxwJe2+bBylZUefhRk6BvcYiiawKZDZShPs3xq0i1+1uUV+
 YDl/+Gj/Q1FZLohdKglHkvNKxtwy5dM9ExSe8dFkbr8ZoJzXvXlaxg1OfVjIMtGgerCS
 JlNMnIsDhUdyp1s+AcIw4iwvpiDYYtvyAHZIfYJGLthU8rWedMBETsgRfYMnkf4AAGMr
 GlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777368821; x=1777973621;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xekvDfh2dxmdIlEXP7S2Vcn3LeIat4hsKRy3BWYX78Y=;
 b=VlJFHTgsnEi07rDkE3fJOzG2Xu8ODdBNzmAiUqzgGSCoWRvhSsE/VWIiTfdrJ1TOvG
 JnsEHnLVw3JBIDBVEp9hUXX2iBH+62o1UK+s59BzmgPNZd463BGz8gYTLfY5Oq+a7gxi
 P66NDOVPOhX5uI558c7gbI7GQHyTYwg6hZCO7fb0GtuQbsVC8/Fm+/EhhPQu3eYZ3cOb
 zr8D+p9mWkQw1aULbb1xW6ro2J2AbeAAAh1Rf0v8UQTaWFaOl68rGYUUq8CnJ0KUloUV
 kQK3QtOrum1hb4NmMk3sVPfuLKAk0OjmKHtcdshcIZ3KNzdHvMYB0pjCv+8VQM03SpiU
 DVjQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8p+NU8AVMXICFsEKZkExbT3U/BreCCmjEkwcdZziu780l0Jf9S7IXJ7wra6w6PA500MkIOUmnDKA==@nongnu.org
X-Gm-Message-State: AOJu0YxoltZ8+XVHaLtJFIiPLZSjmdutCSddypYUmwaofJh07DmAQYZ7
 IGC/rp+1A5Y/QB7BRZoB2QVPCUXj5AmrXIGq3azsiPHaM4jpHjDVHGvGKsvp+rmzwQM=
X-Gm-Gg: AeBDietTDcG7LHTUmL35j4GWBlnstmY5no/b/uv/NAs6RGQwzhcygyYgaI7f0rnR6jK
 ryUokwFC7raalX2hx8jgGGE2anfotK5sxiqPo7r5b0OcQMd/snMgCUxlcjnleryqpx+p5zOI8FY
 paCp1YR+ctU41QgIchvCuASyKoL47dIgY13vomEoHs6f3REL4lN9l9NmyW4amtu5xkt9XSFXkPo
 oyPvpbZVG2M9x8DFMYrwjjBm6GQk0kgoomASdbLi8oxoQ9k107IB/PI+TO4uW77eWKVzGYRWdk6
 8G4EoZMQ8uvRSj5PIc1hzcQJ0jCBWqFai8zdKrleOJwoNeveedSPxD832Bm6IYK7v/BwaUXuSir
 3X40rtkJ1SSTeBhwRjdRCl6QRo0c37TBA5+pnZM7u+EriCpw1Wjq2ZC4ccBOK8jWRD4t1T7FcTJ
 m21YPBtqaKwjz5p6oL6bu2frn5H33W/i7sTipR3dfi4b7cjpiq7nqD7+9oBhmBhWFnUnIhl8GlE
 zeT7PAbtVfJxOmXgP5p6C6w0HVJIgyBt+wP4JbAwA==
X-Received: by 2002:a05:600c:3b13:b0:488:9e43:9690 with SMTP id
 5b1f17b1804b1-48a77afd324mr38740385e9.10.1777368821504; 
 Tue, 28 Apr 2026 02:33:41 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a774d7a1fsm19665595e9.4.2026.04.28.02.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 02:33:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
Subject: [PATCH 0/4] MemoryRegionOps .impl cleanups
Date: Tue, 28 Apr 2026 10:33:35 +0100
Message-ID: <20260428093339.2087081-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

This patchset is some fixes to MemoryRegionOps that were
accidentally setting odd .impl values, plus an extra assert
that we can now add that a MemoryRegionOps doesn't set
.impl.unaligned true but .valid.unaligned false. They're
originally from the CJ Chen / Tomoyuki Hirose patchset that
aims to support proper synthesis of unaligned accesses in
the memory system core. I still want to get that patchset
upstream, but for the moment this is a set of simple
cleanups:

 * riscv_iommu_trap_ops set .impl.unaligned but not
   .valid.unaligned
 * npcm7xx_fiu_flash_ops failed to set any .impl at all
 * xtensa_mx_pic_ops failed to set any .impl, and was
   less strict than it could be about .valid

Patches 1 and 4 have been reviewed.

thanks
-- PMM

CJ Chen (2):
  hw/riscv: iommu-trap: remove .impl.unaligned = true
  system/memory: assert on invalid MemoryRegionOps .unaligned combo

Peter Maydell (2):
  hw/npcm7xx_fiu: Specify .impl for npcm7xx_fiu_flash_ops
  hw/xtensa/mx_pic: Specify xtensa_mx_pic_ops .impl settings

 hw/riscv/riscv-iommu.c |  1 -
 hw/ssi/npcm7xx_fiu.c   |  5 +++++
 hw/xtensa/mx_pic.c     | 27 +++++++++++++++++++++++++++
 system/memory.c        |  1 +
 4 files changed, 33 insertions(+), 1 deletion(-)

-- 
2.43.0


