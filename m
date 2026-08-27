Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC0AC5DF9D
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 05:12:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzSNd-0002UQ-4q; Thu, 27 Aug 2026 01:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSNb-0002Tu-Po
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 01:10:23 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSNa-00040v-Dh
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 01:10:23 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-38759bcd877so2406215a91.2
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 22:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787807421; x=1788412221; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=m8Kte4PTJGY69G7A8K62LLjGu3iDEpCuzO0dR9OmEVQ=;
 b=FJIInTNh2TP8GWwmEZmr8Kt5gbFPIL1Q752KUzWt6TVfmz+Rw0uoUrJGDwsprIPztz
 z5aIVhp43MxLxPaiMBLEL1BJclY7+Ed/p/09qBpHQY230cldqvBkskpZ6ajqbnqiktjA
 I8u0RzFiY9oiVFgJx50Cl3DNo38HMJy86dWfxPvM30qxDxDGnjl9H2RiOzFywGd2DfRV
 ErBfV9KjUOCW++c6ofhAYqBK4TNVlFmrdtOICUEV0i9LavdriLqSHNJZlI4M6vc8rgO+
 VnHDIMPEN0nz8gbx19aRUKk8BaMWnsnVTbgVuumM4y7kIseqKThV60A8uMK6ARwQECf0
 RMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787807421; x=1788412221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=m8Kte4PTJGY69G7A8K62LLjGu3iDEpCuzO0dR9OmEVQ=;
 b=nNp2pxoJVH85tzJKYbwvXDhNED23S1v0ZI1vsQBh7cNJ7b3+y83dqmb8l/YzN6oTEo
 3sX9hj+Fl6RMjXEddm3n/mrEmIKn+VOhhPbSwUoqiDQ04uG24u8ZDiukQV6jM+Kp8rUm
 +sTQMmUDUuXOpECp3gZ2qKH6gxE3mBgFy08L637nWLyFkAf8q27ZiPGWsmpQT9HgMTbb
 MB3oczngLhTtazShzgYCoZptVS3Fzcf+25kCYIBnOcVkvdRkidP/9FLuDmlrl276b5Ay
 FUtiI8Oybns2YoqVn4OqniaErZzNU0AciX1sNdC9Tp/EzXd3HhStByyQrBM78082rQ3b
 xKMQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqbsWV0Db3CVPh25LjgHmWbJFWjT65EI4oKbb7fHlM2hzodMSXwJVt1qDEVXIzjY/qDnO3o7gcshQ==@nongnu.org
X-Gm-Message-State: AFuF++m8W8dP1e4b7ehXSZaqIhk8Ed4UonAwMcdeyoEHFyMKDDjy6pvb
 uRdss63QyWlgfRGdh2UohIVeWDz+XnWp5WU3y/e6jDNwmMq9j9j5Upct
X-Gm-Gg: AR+sD12GLA5vEy5YQvFOaOcE70P13MYdu2zHgq7yJh7+qAUA4rlK9HneO1NoiniEwkp
 ngob8HBrsp+1jVruTgeiM4yYq0ulSWKkXFIGAQnBNJA6+rfYsJzhtSc6Mx16aYj3B9C4SLXAfOl
 L9q6frC635h4vfKOB3rH6vpuxyGUHEeb65dRqAdApTurCcL6qfVcLBf9nSPMx9IpCCLglxl2yw8
 rwXFmKevUaot2sZJTHQr2A9lpn501RTJXpxv6PLrTUBPisazKXF4yRXlj5IwyhY6Za14Z0Ax3Cs
 qLTUaeHIZAQLSdAE9WmpwmaSoeT8jmeHYYdjBbigYMcgtpDeF1em/Jb1OA/kQVFU/9cUW3m4MkY
 tc3dmlhcqmA6DeoD7G/68QmXN64+zk5NbjFQJ+eMZFfXv8jhRSxF8T6nz9xpuqCdHooM7KP3kcE
 z7z8rv54Fh1s+otgi/W0jIgD+uMsOmGiL/MoREY3jW61t6AZnL3SknCrryL6640NqZwDaUQaNb2
 /H4pxrJ3+feZV2YNpHA2giq2BzbIy0qJvnWQjae+8sFlxXQ7HqJsuYUV+UZPzjBJdgvFNIoNWb4
 uooJDv953jVqbC7Hmlqt
X-Received: by 2002:a17:90b:2b4c:b0:38e:97f0:aa4b with SMTP id
 98e67ed59e1d1-3966d4592fdmr26918579a91.13.1787807420908; 
 Wed, 26 Aug 2026 22:10:20 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39670599275sm2210473a91.0.2026.08.26.22.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 22:10:19 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [PATCH 01/12] tests/tcg/riscv64: Include stdint.h in semicall.h
Date: Thu, 27 Aug 2026 14:39:40 +0930
Message-ID: <20260827050953.67184-2-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827050953.67184-1-joel@jms.id.au>
References: <20260827050953.67184-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

semicall.h uses uintptr_t.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tests/tcg/riscv64/semicall.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/tcg/riscv64/semicall.h b/tests/tcg/riscv64/semicall.h
index 11d0650cb06c..2fdd322af91f 100644
--- a/tests/tcg/riscv64/semicall.h
+++ b/tests/tcg/riscv64/semicall.h
@@ -6,6 +6,7 @@
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
+#include <stdint.h>
 
 uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
 {
-- 
2.47.3


