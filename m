Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E62C44516
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Jul 2026 23:24:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkrtk-0001SH-5l; Fri, 17 Jul 2026 19:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrth-0001Qd-MS
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:13 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrtf-0006wy-5g
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:13 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2ceae1ed204so60862185ad.0
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2026 16:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784330590; x=1784935390; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0XTzqP1IaisVAsyNJ2xKnLKxlyIiY6j16WEFEoC9ZrU=;
 b=oa9ZbTDEAN+yiZv9Szfjf43LT1OWCBve71lURXs30so0gMO+9qWnPvo4inAHapKuWY
 WPJ3Pw9AeSc9+stsIb2BUesSm2aFn5q0Ba3KAiO+Mhb6kh7AOibTIRFqsXMcVe0/C6n+
 sSgAq5woShbidEFVBDr5BW1b1OXbH5niIxADfmK3MjG28bRVq3J6MCxsIIBZPqFc1Zk/
 HQXjXk9adu7X9MhGOAbBWLtINkqc5WyTs8vCiWKxEjalauabGJFrPUcblyxKLvNCp/jr
 8cmb5vYNuVN6XQ4a5HQdvQQ9YjPLzVotBY94cxu3iFSX6llG0XcyxJIjoM3u2RA2FGq9
 6WWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784330590; x=1784935390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0XTzqP1IaisVAsyNJ2xKnLKxlyIiY6j16WEFEoC9ZrU=;
 b=nCe8AgWiR+zYtsyQmVdZrvAyi/nACyYfINp84cZz/958nm3yvoQRVpUdJ2xyXxYwbX
 1z7UfvTByJYaXKSM7Coe1nHIvpzU1jQvvHI6VJEjCW8uyYa3+khPj5iK/2b7wpnv/Rav
 7h2ngzadUpKjsZFIFtfBC98zANT7JqHHSGYUu0fyHg7EnjE0R4gQGe+eevj6eTi4VPEB
 9Ds+y5nuOoNzLufynfmEJOseuNqaf8jSWN+BfRJg7LCcFKrs3RYkeXlAEUoAr3cKvpMU
 N4PhCblbQf8mjUQ4tdaKqFnSArbT4WOPx9RbMaOrVn7zL2zQxIUSPLMFGKjQpL08G5Ru
 8Dcw==
X-Gm-Message-State: AOJu0Yz8vMcX72RVzfsc/WLJ1I6vAE4INH/R80PZ9JY2lY+AqyXaASId
 6kYqPGgiJ6erItKv31Uq78oRiec2gkdq77PxKFV+rUH76dIUgQk7RMUjEP0TqbOcXYU=
X-Gm-Gg: AfdE7clUcMrjuWnxiRKGPmeZpzEZU4i47y8aE2OzPE1T/Q1FylozDL+8wL5fmNdruaa
 /lbNw4n1WR95FzGXgKPG4sDDv8RDkg73FZiXVePQ06/jC8o7wsHKTAWrnee83xFWz4K/S2XbDM6
 ht0lfVA9g1hTMB24RZxjVC0z7kieP5LJTYTT1rEKFxAa0GZ++R7S//zKmeffuAQMSox0bMoRQyY
 xvBrQdRle4YPfSI4tENh0MSVlWiN0NbzNwKao2HFHOt3M+ma2nXuXIeLYE3b0YR1VsPA4qnStdu
 CKePiP+nkdqNdXC0oKhGwgaFCEe0CXcfCkadYafk2/X19M26IDWGzv0sVHp9tsEzq/E0ILGnkoq
 GSgcjxXA1oJCXMtXIFpZQKGy6l3+5uaiCixBlr3Wu+eaoUhdlGSQ376yj7PJudM0mL385zRFNtA
 rEmfVVv5g=
X-Received: by 2002:a17:90b:2e46:b0:38e:2a4:cffc with SMTP id
 98e67ed59e1d1-38e4b507f42mr4855302a91.25.1784330589626; 
 Fri, 17 Jul 2026 16:23:09 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce2a18a47sm8186261c88.8.2026.07.17.16.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 16:23:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 01/17] include/user/guest-host: Include exec/abi_ptr.h
Date: Fri, 17 Jul 2026 16:22:48 -0700
Message-ID: <20260717232306.378988-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717232306.378988-1-richard.henderson@linaro.org>
References: <20260717232306.378988-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

The COMPILING_PER_TARGET block uses the abi_ptr type
without including the proper header.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/user/guest-host.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/user/guest-host.h b/include/user/guest-host.h
index 506efc097e..f136f81f5d 100644
--- a/include/user/guest-host.h
+++ b/include/user/guest-host.h
@@ -80,6 +80,7 @@ static inline bool guest_range_valid_untagged_vaddr(vaddr start, vaddr len)
 })
 
 #ifdef COMPILING_PER_TARGET
+#include "exec/abi_ptr.h"
 
 /*
  * These functions take the guest virtual address as an abi_ptr.  This
-- 
2.43.0


