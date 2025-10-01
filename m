Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C59CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 18:04:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v413R-00028D-4O; Wed, 01 Oct 2025 13:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v413Q-00026G-3h
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:55:52 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v412z-00011g-Nv
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:55:50 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-46e504975dbso612275e9.1
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 10:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759341318; x=1759946118; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SkQiV8/WxMAsAF/tO7oGNDf2WwINp6DCDeDQzDnnWeY=;
 b=VzO/E1T8FAsD0ZDX9WjZNJC58hO34Up7m3i3vCaF22TV3+NRfQMsiIOuiJcyuMi6Xy
 L6r5s0YLKDGiszz7wU0fEtgV8dDZxZx3FQYWX1UFvGNaWHHXo8//+qdqp6vvGgqgdDH7
 kaZPjkjX/FhWhW6IFSzLY+FjfnVX0jUq6/cPxqD+lAxNUDu11FE/WD+M4phzv7gqrYEP
 oBUQk+kCXDPngSUUjofx1HRC7ZhsE0lRuJSV6Ciypg316FZtq3JqnJeJC18rnOONab4j
 Lec0sxwg9dcK9mkmGqnSD3/yYUwbaRt7eKFgXNDtcOmc/jZaDCrhOAySIWGy7QTX+9vu
 lIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759341318; x=1759946118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SkQiV8/WxMAsAF/tO7oGNDf2WwINp6DCDeDQzDnnWeY=;
 b=vSb/L2VBSrUfxrzXgr97kX98zlnJ++xuxn4xiKY1m/aI/ohlLrIyhJs3Ch/yjYJxI5
 t0EE+eLvEWl7F6SSL+2634hxlxYGufSOFKLBot3A3qxE/YF4E+q11nLf0uwCU7YOkxWX
 Rs2sjdPabXhd2yt/ovmgoSt4qVBvL4+E4FKIOBk52tDRxKPqJn+ypSjdwEWZqODenwCq
 x+kS5tpiKiXW5qd4bVQ1mhIWUaBTEKlRxv576HixCfx0xyb1OVv36vPhifi0QypwdzOu
 oV18zfwG1eM/f1lW9DQL1fbwOPKS+Ow93oOn2lDhBC0JN7gGHot6wV4gC/716WJoSg+A
 fJPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpsEnmKtC7fa7EBWPU+R6ZbAYswvb6u2oL90W2aLft5fMgDtfG8mRpNsPKipAjKFBXFU0sFtepeg==@nongnu.org
X-Gm-Message-State: AOJu0YxHf8hl0nFhzh4lCQsSjYhOeNEUTvLsYp49XPbTYJwhcg/0W9tg
 WZ2qNJkmsi8+ACUsEB3YqDPCriCNsrzn2XBTZG4JwPj1CcX3f3yKVxUqYcoVIFkq7Zg=
X-Gm-Gg: ASbGncsJ75TmgTXokIpJd/k+scPpXlz8DrA4htZtQqP772+h1+xtLzkXmmmg7myLK5T
 SGhnzcQqP9PU1AnMS/kr1iDh3p7XSFoeaQmYagil1MbP72uxk0MAOzfmS+G7ElEz7Eklely3XpB
 e4CbowPqBCyooNg8Ms46XaJhun+tmyyPQmg7g9EKjyUBLqJi5Lh2n5IW6wtFI9sh0roEFbNeevP
 BV9l9nEH4l5fACwoVAi5g8mJnuXSKOXsPlAUdE16VlAznPtVCLjGN39W6IE6cf+6jmKKp7uc4yH
 wmtWyfVZ4X7pJ7A2SiQn03ppPGKN2k3EAi/6x3rgYcvhnIZIInoBqjxDRBVyu8+QUG3yNpLKUs+
 kJgwU+HWWBROCYw5y7gIeXPEUew2ImBrjRnUE02X/JzkKzmGE50ss5/u0FUN0WE30X/U+czezsG
 HKSRn9eLz/O2uh2/fX9cDm8z8Q+Q==
X-Google-Smtp-Source: AGHT+IHHgUi4fwM6+XTet857QFCrk3UGmPYPPJoZifC7y5X6DWSEAq4/DeuzncR1cjyeDBGduhFF9g==
X-Received: by 2002:a5d:64e6:0:b0:3ec:e152:e2ce with SMTP id
 ffacd0b85a97d-4255780b3bfmr3329278f8f.32.1759341318066; 
 Wed, 01 Oct 2025 10:55:18 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f02a8sm90075f8f.39.2025.10.01.10.55.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 10:55:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Jason Herne <jjherne@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 kvm@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>, Eric Farman <farman@linux.ibm.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 05/18] target/arm/tcg/mte: Include missing
 'exec/target_page.h' header
Date: Wed,  1 Oct 2025 19:54:34 +0200
Message-ID: <20251001175448.18933-6-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001175448.18933-1-philmd@linaro.org>
References: <20251001175448.18933-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


