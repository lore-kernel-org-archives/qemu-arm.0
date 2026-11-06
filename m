Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED2E606A339
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 16:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wzw3NsKf
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPMwg-0005tj-Pd; Fri, 06 Nov 2026 11:37:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPMw4-0005pM-Bo
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 11:37:09 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPMw0-0006Ov-LJ
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 11:37:03 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4918c2d727fso488980f8f.3
 for <qemu-arm@nongnu.org>; Fri, 06 Nov 2026 08:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793983019; x=1794587819; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=M1m1Iu2vqaoZc/EaTd9O9TTTPYMif4rFTGp2681SKeY=;
 b=wzw3NsKfddBoQzPtnl7g47vm6YlnB8qA0JHWJ1KYnYdJkHEOlR3R/D3+OZX70xNz0Y
 YhpwMZ3nvdNwpzsDPLqmKVrWAhcy/k95i3p4A3c+MnIXIW/Xobj2nyHL5zbdhwBaRLRj
 WSNenzqbeEnVkixgwl3ZkJ3D9QpRwXRIMRfvpUUw2K4EChw6UeUUq2/qnHT8CLX/nYN6
 IYJhO0PGIpvQVoGANEzP3zIW0e37v4jFUkhfHyZKwLwX2BylQKYnfrIdDnPrRFcFBSqm
 c4DMs7ZTD5bJyanACTxfUzsvC0HiDBSGvBYAkk4B2L7q2U7JwZd1qrb5LRStc/VspFdK
 w8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793983019; x=1794587819;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=M1m1Iu2vqaoZc/EaTd9O9TTTPYMif4rFTGp2681SKeY=;
 b=aFHbBgHI0t0dbrWsViceAOHvZ1uASB8g1kjF90nJyhIngJRKjkS6FzlZ7wzkO9KM4j
 ZgdyCzDYgJDoXHzTdqD5yLk7aGf7b6xMDBwPzCkWpKIpFEhKkmDwFptcvBhLF/CO93di
 qV0cmVkkVP+6Z9XYjgOXqrDd9rR78ZbfyC6W+XCRuRB1B+PLU9AQYn1SBhv+sf+rQLVj
 IXKN1lgV/bQ66D3PU7q717S6rozCruqyUahyDti5IUwZeqSDcomm3hDjIVfN35izvngz
 TazAeLIUbVa353cOfPe5q47xGrng3AzHi2tvyVvuqwpvCmjqBvYBwooSYhjw7RDkekIn
 dMkA==
X-Gm-Message-State: APuU4Z8tqMdpxPG0bLw5e8BilxMPZ4HaTFscL1/X0u7UzPb8Mf1KJEsV
 uQVmmkQHhCBYNV9ddnzAIpiKBtadWwMrqTcirAS6UqSqkBqW5oSeJF+nKi2uwLdt34IULBp8fpp
 WzvwqiCk=
X-Gm-Gg: AYBFou3ZhrdCElDsIynK1FdgkNbLaOa3DlmE1iZC8vnzAYJBTqEu4RvKuUjjlC1Lli9
 VgfYfH22jtw+D+fL3ivsIpt2E+VRYkNPbKGGH9sXiVrfW9VxE98HrRZLHUu8mkkKckX3DUUqbsz
 fi0jbfgIDC+pi/yw1n9ifPdK6JTNFLbvSSbsMsKHr6s11IoL61K4bLkWEdl1AEvUY4b1oDz/BAR
 gviErlN7+cctEC00tM2LMS8weQwylGk/Wj8MlXWyaKQB/0qz8prksYdX2l4pfV3lXcmKarQLT/5
 1P6s/EHGd+SGeJ3DYIdodim1se+gpFYiJwrtmHViXoEoL4je6PrNlBQW3PYW6NKv07qQH+MKd0Z
 G4FF4/9OsLzUuCPeiQhn89KSLsittU7ksySa7Evko5+SrlEDO4AziCT/JbYpm0uu7HeZwFovrZz
 vKDIiYDYMX4fV/IB8v3BJpR1DKWOvff72D5ms+HzaDJSQQQxI885Re81Jx2NNzdQTMYSBrtDYg5
 21krXFU4UfMbp81zYy6eGrF3A99Xw5u3eW7JuyiKxcF0e48bQtebgLZCnzSQVtRHR+4/DW1lhk2
 tpYfwnICTANf8nPS8pC0UnwTAFUyYyjZxiTboRHY0V9b5vCVmpK2UxyislIunhQSKKcwAD1dWHj
 1bL6jG3N88IYE//MTnpSBtdbTvA5TUDTWOQ==
X-Received: by 2002:a05:6000:3112:b0:488:823d:5086 with SMTP id
 ffacd0b85a97d-4926fe2c06fmr5701818f8f.0.1793983018690; 
 Fri, 06 Nov 2026 08:36:58 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d3d60e78sm4517912f8f.1.2026.11.06.08.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:36:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v2 for-11.2 0/2] Fix 'version' arg of VMSTATE_PTIMER
Date: Fri,  6 Nov 2026 16:36:55 +0000
Message-ID: <20261106163657.3825938-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The VMSTATE_PTIMER macro is defined to pass a 'version' argument of 1
to VMSTATE_STRUCT_POINTER_TEST_V.  This means that the field will
only be used in migration when the vmstate struct that uses
VMSTATE_PTIMER has a version_id of at least 1.  This doesn't match
how we define other VMSTATE_FOO which don't take an explicit
version_id, which is to use a version argument of 0 (e.g. all the
common macros like VMSTATE_UINT32 are written to pass 0 to their
VMSTATE_UINT32_V counterparts, and so on). It also doesn't match
how we define VMSTATE_PTIMER_ARRAY.

The practical effect of this is that users of VMSTATE_PTIMER in
vmstate structs which explicitly or implicitly have a version_id of 0
were actually not getting their ptimers migrated.

This series:
 (1) fixes a mistake in wdt_imx2 where we bumped version_id
 but forgot to bump minimum_version_id
 (2) fixes the macro, and bumps version_id and minimum_version_id
 for the 2 vmstate structs that used VMSTATE_PTIMER and had an
 implicit or explicit version_id of 0 (vmstate_xlnx_csu_dma
 and vmstate_k230_wdt) so they cleanly fail migration from
 old to new QEMU

Changes v1->v2:
 * wdt_imx2 is no longer affected as it had a version bump for
   other reasons, but patch 1 is needed to correct an error
   in how we did it
 * patch 2 now bumps version on the affected vmstate structs

thanks
-- PMM

Peter Maydell (2):
  hw/watchdog/wdt_imx2: Set vmstate minimum_version_id to 1
  include/hw/core/ptimer.h: Fix 'version' argument of VMSTATE_PTIMER

 include/hw/core/ptimer.h | 2 +-
 hw/dma/xlnx_csu_dma.c    | 4 ++--
 hw/watchdog/k230_wdt.c   | 2 ++
 hw/watchdog/wdt_imx2.c   | 1 +
 4 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.43.0


