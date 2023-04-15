Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp724282ejm;
        Sat, 15 Apr 2023 06:07:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350b+H7/UphRDMT2busBxOb4zClFUoCUNS6zV4B3pmlpn3pPJUg1cazsJXFaE5lrfxqWKwqtU
X-Received: by 2002:a05:622a:284:b0:3e6:970e:a3f6 with SMTP id z4-20020a05622a028400b003e6970ea3f6mr12913671qtw.11.1681564031618;
        Sat, 15 Apr 2023 06:07:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681564031; cv=none;
        d=google.com; s=arc-20160816;
        b=yLMM4BJaIr54Z+xVAKl7YAmJlXYCa6bP65tk2psMs+6HzGF9gPeHfiDlMz7LddlNYk
         0PiDAVjBKtspMJ+rNl9P+C6WL6sXRa7xDaRrQ119xgogRA59UTC5Mh0oJzmU/RE+X36h
         SAbv0fdgqmz74uAPtUQ2NZ47yLqyWkKaXBMSvxshxJdCb5CHIuvAZkG3kPGkRS5ludvd
         GT7wDcfdM6cZ+gAJJDcdF2GL8pYoFYdV9aDZYUtJaNf9ivso7XKXQC1CC25xiHHAIk7C
         ZmCBBpSdRDE/CIVUnZTiQaFbqZ+tEGtlpBmF1CV28BSGYrePeiUcVZaD9R0WLKCVGaXz
         ORZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oFERySQsSWqxsgcmeziJzaaNINbANjak6JlRTjdRvws=;
        b=E5WBzaBW4q0Cr+DEOuvT6pLTgbvAvoByKT+AT9X9wEQc9nSRb5TssyUa+xgh5I5Avj
         dkqWgudcNV69dXrHkRllOorLP3kB9t7xPuyK5pftRxHNEfdBD+l3Lu/zHMh/oS63Un54
         R6HAJ0Qo4eWnXed5DW066EBoQ45jlHUowPiIy5iQhQd4hTqslsVDGuZXNsMciXjbUy2B
         wX50wDo88w69N4wk0s7WRImtPOm7TOQKmJdkfouFCz8unqA8GE1fNKXDkjskQCS6Qbbw
         VPJerwNXVUBctfsjSgMV/eoyqNsYhAgR6ZRx2m2rfVn4n+VlqMhRYnBINSfrRb2pEOxM
         kbAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=t07THnxy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14-20020ac85b8e000000b003e38c7504aasi3783707qta.309.2023.04.15.06.07.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Apr 2023 06:07:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=t07THnxy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pnfcM-0004kA-7m; Sat, 15 Apr 2023 09:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jszhang@kernel.org>)
 id 1pnbRU-000522-Hu; Sat, 15 Apr 2023 04:39:32 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jszhang@kernel.org>)
 id 1pnbRT-0000tx-2M; Sat, 15 Apr 2023 04:39:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 720B660E92;
 Sat, 15 Apr 2023 08:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CCD5C433EF;
 Sat, 15 Apr 2023 08:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681547962;
 bh=U8WABhsAkLpAnlwQZI56b2I0tzK5K4NZdbgTbNP5uPI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t07THnxyUjcJ+bFpNlttO7h99JAuMljggmnZk3RBZp6rJE0toqUomn0RAT6yJabzf
 ljHbBs2VogDd9GoV8R0FQGXFsXgx3FECCLRt0ziw6gVTPMEZkHIO8DdpbsqD7eWfxq
 exZ6lFA8XYdmUhGyNeAWh6vJbLZi6YGmMS2Hr4mHVRgqAtNa0OI7JrDBOqK65yPX0Q
 KwaX0a7MBw368w2N+UtWIHZHhs3SS5irXr07Xxq+144s4z4gpIkPJWKG9h88UFB0Lg
 O/TK1PKBkYZCx5Wq2XzaBpGXuB+nLCi9UvmWqYs8/ZHPEwovT4l50Ai+M2h173qnyB
 xFUSKl1Gmi69g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Peter Maydell <peer.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/arm: Remove ARM_FEATURE_CBAR_RO from A55 and A76
Date: Sat, 15 Apr 2023 16:28:26 +0800
Message-Id: <20230415082827.2054-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230415082827.2054-1-jszhang@kernel.org>
References: <20230415082827.2054-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=jszhang@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:06:53 -0400
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: U7oTTJFihvlU

Cortex-A55 and Cortex-A76 doesn't have CBAR, so remove CBAR feature
from them.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 target/arm/cpu64.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 0fb07cc7b6..85dc9d57ff 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -796,7 +796,6 @@ static void aarch64_a55_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
     set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     set_feature(&cpu->env, ARM_FEATURE_PMU);
@@ -919,7 +918,6 @@ static void aarch64_a76_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
     set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     set_feature(&cpu->env, ARM_FEATURE_PMU);
-- 
2.40.0

