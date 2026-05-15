Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087B9CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:27:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtUY-00068O-Dq; Fri, 15 May 2026 10:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNtUA-0005kC-3q
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:25:54 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNtU6-0000vd-Rm
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:25:53 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-45d96d21e82so1303390f8f.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855148; x=1779459948; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iMeESVfxoQL4XM+HmSKggMAQZr6iHvyZ6SpMkCmyMlQ=;
 b=xxr4DHVjwldXXkWJzo/oYmfRlyJhob6KnbOcbisSzF0VfsumVe+yujXVMrKPt/2W2h
 6XpUfeufdG0G28Bdf7mGPQNTGxO0xqq0W2qN6vHoQYHAYBnDluujhx/7V7VNbsGM8Ukn
 BUl45xc4Y9DaYzgxc7o4LzaqfB0vS0nInuKCP7hDb3md0JUq5/rzXp2e/krEFOBpKmxJ
 n8s3mCAUj8ykqdVmUI8XT7V82tRufW6FP0MXxDrC5B+xdyOryOe7XHCNmXhwijjS2ZWZ
 k/IMd4L+fE9v/SPXza6ie+iD3JA86QG9ioZaUM/K4FT3B2c/Fm5JvFk0+ViULDsjir24
 rHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855148; x=1779459948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iMeESVfxoQL4XM+HmSKggMAQZr6iHvyZ6SpMkCmyMlQ=;
 b=J31tp31iZzQQJpSAXgFNzTuaf+V+pE+DGnCmU6AfmLs2LfR5HCDxKnU8YI0q7+YEWY
 mopbwy3ynrYRYPHSNSJAScltmkqrhHSIwURrL1BpOw3ouK3PpAYnPxI33tMFoj9yGx4t
 81SFtM26Dk0bY7nWJk1xsncWK7XG7y2hgVck9J55klvPGme2WiBqHYO+WjXgR0HDStup
 MeVVFKdR7/CxJkOyRKNZE91PcXLyH82p7bJkGcNo0IQH5c5/BjsU2FpnmV2/q68BhHbJ
 wNomAgf26nXWvrDNwVUadpzmhg36WUahGhh5NraTGQnuYC2oPWoPFUJM8JlHvi6NHOYT
 9+UA==
X-Gm-Message-State: AOJu0YzlEetCDYimjiInR8vY58Sm8l3YERjwAUjnP28qXeh6Dxq9K2kF
 oLzuyNi91uaSxpbjFZTzSmxULA+q2khgj+D+psPnq686zcIeqVJDQAGsMYNOHQomIA+aZDDHpSy
 rCY2x
X-Gm-Gg: Acq92OFoTmjbctqlyUgkH5wQQLcwweTOcehqAFSThSyO6zb1dAihd4zTCWJodxKMHmT
 pPkOM2zvG5/vOt9xwShLaL5RtfkYul2nMjFRoNs1/djpOd35IEw6aGqZ5tzQqw2YL4/k3DiYcIq
 agkYTTwyL9qQHa/VkrbPtKHUE6a2/7SwvKVlNBiDP2PSnbtAqvUApJ7ClZowV452Uldp1lw//Pe
 tRCNgSK7FIaV/aur9K5TtKdwGT0FamG04wff1XU6tJyM3VCuL/3SXRDbWGZK5rw443bsVJ6Lk6C
 0CfUl5waggxQBCxlaVvBB27jxyCx8VL1HZMkwXZUj5I5ADrm80fXBsi61Ulz3EidMWsTlETb/Pf
 ZzWHathaEoYAINtmwT9jPJ29HsuX54Ucayv++/KBwRrykyV+cqJ4vnxTAvZkgmIYFSbSrJu3sbX
 Q6SG8NO3Yos9P0pQ4LhCDwZxiuxrWh7l1eYVa1l/gLDxJ2bzxwf/Y/UBZ51JAfBed8+R5Wl3y9J
 dyhQQ+GKKRi9l5z7iMG1o5gIDXZwG1/dSABFnaKviJJLDwBf0bT
X-Received: by 2002:a05:6000:2502:b0:43d:7e34:889c with SMTP id
 ffacd0b85a97d-45e5c5e68b7mr5918628f8f.39.1778855147705; 
 Fri, 15 May 2026 07:25:47 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a666fsm13560603f8f.36.2026.05.15.07.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 07:25:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 04/14] target/arm/ptw: Flip sense of get_phys_addr_v5
 return value
Date: Fri, 15 May 2026 15:25:31 +0100
Message-ID: <20260515142541.571911-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515142541.571911-1-peter.maydell@linaro.org>
References: <20260515142541.571911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index fa251f5b5c..1730caf180 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1169,11 +1169,11 @@ static bool get_phys_addr_v5(CPUARMState *env, S1Translate *ptw,
         goto do_fault;
     }
     result->f.phys_addr = phys_addr;
-    return false;
+    return true;
 do_fault:
     fi->domain = domain;
     fi->level = level;
-    return true;
+    return false;
 }
 
 static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
@@ -3793,7 +3793,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
                regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return !get_phys_addr_v6(env, ptw, address, access_type, result, fi);
     } else {
-        return get_phys_addr_v5(env, ptw, address, access_type, result, fi);
+        return !get_phys_addr_v5(env, ptw, address, access_type, result, fi);
     }
 }
 
-- 
2.43.0


