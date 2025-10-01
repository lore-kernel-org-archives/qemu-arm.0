Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6239CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 08:23:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3s6T-0000eH-Ev; Wed, 01 Oct 2025 04:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s6R-0000dc-1s
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:22:23 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s65-0005Wq-E1
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:22:20 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46b303f755aso60736305e9.1
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 01:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759306917; x=1759911717; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SiAF+xKMY/ZjdE56BR2SJrHQNq0qMD7rf4hlNCZkp34=;
 b=aeO5ogdk/cXUoGYsbqgHA1HbZHTqgRQnFQoqWPV/8ZnXCy2/eGIl4/Y1KBiCXZJzgh
 94Qd4dJ91G1JLmt583n22kKn3TDkWTOJ0CxAIZeAhPqwpmNxiC6hQ3zZcFwqiR9dT3bG
 raA/ON0+UIropGj9VhTTxqj3HpznujFsMw3KI9mux5pQ297XUkmPwhNDzcqeHqL+K6XO
 WMOovZALJiRCeAfyHMpFziDW8KvvxGergBcQ6RJgySvIAZHA4m+D60/KhurD7lmtYVoq
 E7YRPWSkgnC/t0oTgdxrRJsSyNWE6G+N23+5qG/IRmOu1HicScPcj/kQ2uDZYoqT6mkV
 j1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759306917; x=1759911717;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SiAF+xKMY/ZjdE56BR2SJrHQNq0qMD7rf4hlNCZkp34=;
 b=WcOU23fjTzsm2PddP/mSuA8t+GQxkUVxeJdvywq6nSKZGPvCsZ1EGJWZWSuE2DgKhd
 wgwyEMymIC0mR9j3pfkz6MIdGarVwd6r7YeyfPDDL9hdZl7v9NvulLvCMelthxjR/MHE
 Qh0JW94Tm5hEiQpQ5YAGwrtBiV0PujyK3jR98IDhZoUi4j31o/SANo49eT1dPJC8ISv2
 QLcX1GhS86rYm8IcOIV0/vJc5Rit2TqoHrhe8vXMcvKxW/ZYqGHrU/GCHPVbM/OV3LEi
 AS8KG75ZL8i5LbsCUu5ag+CGEwsVgeXauGC2VKn63X9Ke61AE/sakdaYTcDt5TMiG850
 U2ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZl9gcEj6khMhxNEGXrWkoC8/MuHrmMJ6MywVqh+ab0mUSKBl80OhHqNsSGRvsgu6njCVI3XG/aA==@nongnu.org
X-Gm-Message-State: AOJu0YzXxzsEv8WjmUb14+4SCWnzok3cy73IEBZQw7YpdtkoPXJGVwvV
 lQrUb6QYENf/TooXVJUD5Wblra0+8NFas63CYhtXtYoT77D83TpXpMG2egXwHVZWFFI=
X-Gm-Gg: ASbGncvrmXkj16WZobiRe73D/iQ2Oc8A90F0QeTLcKAIALckuo840ha0A2FtOPEY/cH
 Mzuu07e2a33Lr39jujLRpT0FueCk/o/zBudp4Q2bELU1q8TbR36d3jiUEij4egLJ64kIBrh8hlk
 8vJmjlgVS72GD86l/Ogev/oi4t2I4zI54hAkVvRd64qxy9qImI1bUkKrNjx32SdzgRKw91EhY21
 ocdmo93Xyc5RHxc2AsBxcTz6xc3zGCxXY0ZRc+ZQaSxr4l8wpIQNPEdYrAmOsl5cL4dk2qMAFRf
 Uw40IoeMKhebBpOYatq9epbHOhu8JQK5ZmR1gUb9zeiJJOBr1WU8Rhizn2B5IT8zl9xLualT7pj
 togNCuxP8Z0Qykm0t42sOqY126Jafjs1559O1R3FNGTZVL55tL/cjsMTv2a6B6JWr6zpu/kmvYD
 +Njn6ETka4eODQ81/icdO/
X-Google-Smtp-Source: AGHT+IG2c0fzOsFiKbrvJ6/AoYIm/GgfiCoe/atI67XIMJvAlpgbgwgfqiNLjcER0nZiKAK5YPtzGQ==
X-Received: by 2002:a05:6000:220b:b0:3ee:1357:e191 with SMTP id
 ffacd0b85a97d-4255780b78bmr1411077f8f.30.1759306916617; 
 Wed, 01 Oct 2025 01:21:56 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc7e2c6b3sm27728732f8f.54.2025.10.01.01.21.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 01:21:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, qemu-arm@nongnu.org,
 Jagannathan Raman <jag.raman@oracle.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 kvm@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH 05/25] target/arm/tcg/mte: Include missing
 'exec/target_page.h' header
Date: Wed,  1 Oct 2025 10:21:05 +0200
Message-ID: <20251001082127.65741-6-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001082127.65741-1-philmd@linaro.org>
References: <20251001082127.65741-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

The "exec/target_page.h" header is indirectly pulled from
"system/ram_addr.h". Include it explicitly, in order to
avoid unrelated issues when refactoring "system/ram_addr.h":

  target/arm/tcg/mte_helper.c:815:23: error: use of undeclared identifier 'TARGET_PAGE_MASK'
    815 |     prev_page = ptr & TARGET_PAGE_MASK;
        |                       ^
  target/arm/tcg/mte_helper.c:816:29: error: use of undeclared identifier 'TARGET_PAGE_SIZE'
    816 |     next_page = prev_page + TARGET_PAGE_SIZE;
        |                             ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/mte_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 302e899287c..7d80244788e 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -21,6 +21,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "internals.h"
+#include "exec/target_page.h"
 #include "exec/page-protection.h"
 #ifdef CONFIG_USER_ONLY
 #include "user/cpu_loop.h"
-- 
2.51.0


