Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67604CCA471
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 17:59:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4130-0001qk-Ti; Wed, 01 Oct 2025 13:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v412w-0001pS-MD
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:55:22 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v412k-0000n5-EW
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:55:22 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso538835e9.2
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 10:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759341302; x=1759946102; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0oYtvp1Jy05y+cs5OqqW4cigIw/Evuwzbdyi31MB4Sw=;
 b=LWZdqDNPE4DXTYy/ohCZBp8K8X8XzWEu/DuKa9DjpcgXXh/VxLf8s03btlru560e9r
 uBchJ8cRTPJmk8NPUwUOvlG3E07pQi9W0SwD+uxk/snda28ArsRbr7oRyfZxXTKFs5Xk
 RhQ6MpU52gfaaMMi1TSsb3PWRj3hmY29SXGIGosHSCkX+KBwyJcTNoD17etj8EL/C7tE
 jPzlAH029rFB5zFxldSPa6/qT71sXsrcw+lmw+23sP6KBAZagQKh3t9f/xrauZ+0UUwY
 TES2mNjZpHoo1fQc0/RnxeuVZenyNidBHVTi3Xy8Usndyx1V2vOdar7m5XSimjwEuS6i
 diJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759341302; x=1759946102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0oYtvp1Jy05y+cs5OqqW4cigIw/Evuwzbdyi31MB4Sw=;
 b=oBtAPsuadD5pOMqLvRPE2C8IQQOWHZRp5R0GPFI3oJxDzXkYccocrG3c1nxD56n5R1
 ycsfTzXY9OG3gR1mP4KyoJ/gnlscWM/Dh4isR+AzUjl76FXTDQbBuv8156NVT1se3719
 ElrUIILyCG7xJqMnqe9xZRhmx4IiJbzvwRT+7qfwKyT0BJt0L8EIejpiMENSkzLUQ+Xd
 1dSJb2dQDfARcYmJ677jB78/epkVFkI8109PwWamIDAkRKbmhAgkDxsrSqETP7iItlEZ
 W0UDYlkEccolFfezTKdpN34Cb/1u9+v+20fv0XlMdgyoEZNQrzKji2mnTq31I01ViMzE
 VGnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIP0QaxsdCB7PVWnvyPSQCqWl11fu8/MVMpt1GDpJPHrQrAW9p4ga5Coh3hLZ0iRlJwOiqMuGauQ==@nongnu.org
X-Gm-Message-State: AOJu0YyYNChNJeuHm9BqEBHRWJnA9UfN+TsVZiqonCcS8Lb/1tW9r5Jh
 LTDxOX0rxt9xSRVt82i8EmL6OjoohWOMsVb2r+uVkmzJKiqFcNyQ5+RaS14tpuMOjb8=
X-Gm-Gg: ASbGncvF11WHMbHVfrcU/3ZvElEP8JmRLjAhQ6hXyvnDVWi+OJNcp7BSwQVpEPhHMZG
 4FFBBIJQa+Yg9+YTwuIxZg1VLF9BrbPTsxUJAyMPks8LbjxHbrbAiYjJVS4shrYHYCUGzganMuD
 M1pvBt/IrIZaq3C41AvPY8+8G8sQq7G/heZDiUzNXy1s4L1EISV2rRnCd9A6BLElQuv5ho4GrUG
 xq8Q/5pIm4a7z9m15v2AlwfTFxHIz52Ucjsn8V+vxpJ4bi6YpYfLNbZ/Ib+6ieaQqgjQGI5Am0/
 2DCGH2VUcSTnJMrWjTCxfTvCIJkR79aXPSxhTyKakEgJkpV62xch7P9JC42+x6y6yuKAJqMBC6d
 SOQXec4Xdl79qTtSNBY4xJ2j7zXpAnMvERsLge6ST6+lmBZbT6GRjdPsJbXzYcb/c5J9rn0Wt3H
 7UdnINuXhnknHtd1TowxecTPs/OQ==
X-Google-Smtp-Source: AGHT+IEE+JOgdQcWDCLTXQOhks4UvOy7ZMILGVzu3gYLgsHV3P63UTkJyw5YOjk/WtC4nRuVfjLM/A==
X-Received: by 2002:a05:6000:2f83:b0:3ee:2ae2:3f34 with SMTP id
 ffacd0b85a97d-42557803ac5mr3634173f8f.13.1759341301952; 
 Wed, 01 Oct 2025 10:55:01 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f027csm94114f8f.40.2025.10.01.10.55.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 10:55:01 -0700 (PDT)
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
Subject: [PATCH v2 02/18] accel/kvm: Include missing 'exec/target_page.h'
 header
Date: Wed,  1 Oct 2025 19:54:31 +0200
Message-ID: <20251001175448.18933-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001175448.18933-1-philmd@linaro.org>
References: <20251001175448.18933-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

The "exec/target_page.h" header is indirectly pulled from
"system/ram_addr.h". Include it explicitly, in order to
avoid unrelated issues when refactoring "system/ram_addr.h":

  accel/kvm/kvm-all.c: In function ‘kvm_init’:
  accel/kvm/kvm-all.c:2636:12: error: ‘TARGET_PAGE_SIZE’ undeclared (first use in this function); did you mean ‘TARGET_PAGE_BITS’?
   2636 |     assert(TARGET_PAGE_SIZE <= qemu_real_host_page_size());
        |            ^~~~~~~~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/kvm/kvm-all.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index e3c84723406..08b2b5a371c 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -36,6 +36,7 @@
 #include "accel/accel-ops.h"
 #include "qemu/bswap.h"
 #include "exec/tswap.h"
+#include "exec/target_page.h"
 #include "system/memory.h"
 #include "system/ram_addr.h"
 #include "qemu/event_notifier.h"
-- 
2.51.0


