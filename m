Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6E0C83F1D
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 07:19:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubZwP-0004bs-P8; Tue, 15 Jul 2025 03:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubZt2-0002VI-SN
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 03:15:38 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubZt0-00021W-ND
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 03:15:36 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so3803512f8f.2
 for <qemu-arm@nongnu.org>; Tue, 15 Jul 2025 00:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752563730; x=1753168530; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jK3VHhVp0eVShcAqpjGBRXDmPLTaiJrK+trki6OAZaY=;
 b=llYz9pi+GS68hsRs3UxY4YY+rN7irCj9K+Umx13Cxs/24yh4EWf0K+RQamolW8cdz4
 SyBiR1XMx7dsUT2TZe45nylPs1AiupeC/J2t9wb5Q9vEmQ9vGrFbkHKDYCWB4w0ElbR7
 MDKm7HBlHbwTVr5C3mCLD5hGbOjyv6BvxUwoIlDd9bZc+48bQUIe10M80t5iAw+RVXYA
 DwSC2U8YtYm1zkgS7Xk5sdSIlkSpd9kON8bh7PnhPX2DkVJbxrqT9Nr/8Ze1UO7VpjSU
 6d2Kd7K8Vaz93WT4UdrxyndTEMJb6/2Qk2C+yyMpw38NBmhnEwyBPd/t9r73i1WbLDFx
 ECIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752563730; x=1753168530;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jK3VHhVp0eVShcAqpjGBRXDmPLTaiJrK+trki6OAZaY=;
 b=akN3ofb2PNXAlTenNskR6IoU/eczbdlvJrcVZsht9VfBRxNIB+Xc7PWtv2OF3t2+x7
 xkB2fEx3TluMM/boND9C++57DCtfS3phQQmNIgUVv++U3H7WPSNkfCgDbpLvKWaRVHcb
 oHtyIACxX36kFhH/n9uyDYIJt5wcLQK/llyP1QhRxW+FWi/rhBa2lgAECDXhHcUoGTGO
 L9goXinPyUwWzkZbx55c5vlNNEdTBJQm8RuqCjAG8ZqZ5sstfRDl4yL4N0MzwBk9oygI
 cRJEmACU1s7igB5RB903eN1CFGGZ5BKhS8VSqZ9NxIr/W1RX9rROEVxG5BqzhLU7T7L/
 S00w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAIX31jGQy9R/QpM9nAlP6iq6bqPqEzQEj9fynCsSOJJY1U6XRcpaoevHhHCoBKhCI8Fut1oChZQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx12Fa2bqYIh6eFbOD5dKrkT/2vwCWbTEODj3SoLw+3yTDJXV4I
 Ntf63dWLuYSgncpq8nZaGyzzlg/AyBgfk2hQ9mleBFyqAl/AhD1ZPGgRO1hwDNCFg2M=
X-Gm-Gg: ASbGnctTiYgvOn/fsypLV87zEdGymkl7gzj/8HqEPcMFbimPPFTpaFxp7JSrFVpVR4I
 bpltDqIJzu/9l1rxZzG35fCHN5F6NSxF7kTRME9Ul3G9FC+40XEcFWNjvg4T4efu17wSjAP9Kfw
 85Rs+WFpE2F/Gi3576t+21wQNWLjo8MQh7QaSqSMhLT+ZCr9x/yN8nRNjBfaT742WsHZD1hyaCO
 F8PeH/4CigwrybniZd00avTAXY3pRDSgvvsGqKpudBFIBnhXBKVo9a5QttMZgUq4mketAeMR9NQ
 rVrg+LktjYhLsx/F8k56IYp9YYiMI+oKl/b1SGvUHAfstHxdoQ+fDH+ARFMDBZJAiJVqjS94Js5
 J90mdD5uJcnE/bJDC0H6g8RKqK/v9vGoUrPqSzI1qMOiYW9YBZhgxG0rrgCnhMIDJQYC+0pKJhI
 18sA==
X-Google-Smtp-Source: AGHT+IHc/hNaSxV/q5zS/EGfLlhOgnJMNAW+20yw+IkE5PFdUkO2Ro8e29tK1H+hW7tz8zfDXyx3sg==
X-Received: by 2002:a5d:64e2:0:b0:3a6:ec1d:1cba with SMTP id
 ffacd0b85a97d-3b5f2dc2ce7mr10700753f8f.20.1752563730160; 
 Tue, 15 Jul 2025 00:15:30 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4561976784dsm57489215e9.18.2025.07.15.00.15.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Jul 2025 00:15:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PATCH v2] hw/arm/xen-pvh: Remove unnecessary 'hw/xen/arch_hvm.h'
 header
Date: Tue, 15 Jul 2025 09:15:27 +0200
Message-ID: <20250715071528.46196-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

"hw/xen/arch_hvm.h" only declares the arch_handle_ioreq() and
arch_xen_set_memory() prototypes, which are not used by xen-pvh.c.
Remove the unnecessary header inclusion.

Cc: Xiaoyao Li <xiaoyao.li@intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Based-on: <20250513171737.74386-1-philmd@linaro.org>
---
 hw/arm/xen-pvh.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
index 4b26bcff7a5..1a9eeb01c8e 100644
--- a/hw/arm/xen-pvh.c
+++ b/hw/arm/xen-pvh.c
@@ -10,7 +10,6 @@
 #include "hw/boards.h"
 #include "system/system.h"
 #include "hw/xen/xen-pvh-common.h"
-#include "hw/xen/arch_hvm.h"
 
 #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
 
-- 
2.49.0


