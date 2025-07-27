Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78138C87FD1
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:05:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwLx-0005fl-82; Sun, 27 Jul 2025 04:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLa-0004qB-99
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:06 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLX-00040q-1A
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:05 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-23ffa7b3b30so3139965ad.1
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603381; x=1754208181; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KbpMjeNAOgpQVH9iBoeuKkwL+dC1QrhKT8NKphlDlP4=;
 b=GJJmfbdxILLlEF2zVNIvKamnfckpXwwB4shyKFpDertlV7rst3835X/mZzDWNjUbRA
 fDvd0ZMGY1ePlaRIxLRg/8JfvusDVRBH+aZBaosAvoEz1KcQM9/pSIwZm2yxC1bwtOcR
 6gBEceKK+vxUtYvnBfeFdxyatYJDeZMKVVcyx3R+eRxFjd5F2qFrcuUGBJsIt6sqrdxY
 6wv97MEWwsSamFOTkjKw+D9/FRP7vWSFgXXLuEIvlkwg7TSzKFPTH4tk7fd07zTXHcG4
 D2zrOoGPZ1Ne9SXHlh9xHw5Va4J/lWzHWza1ufYIm0dYLmsGFbw943sct80kdK5sp/D4
 9Otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603381; x=1754208181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KbpMjeNAOgpQVH9iBoeuKkwL+dC1QrhKT8NKphlDlP4=;
 b=aBBGOZ/K+yv+noTmVL5omf555u+HlQ4nGygUQfXcv538Oa2/06BAZU7+PR81nXITGB
 ZeHsY/SUg1UxMEmEtujTQAdyObaBt/A+tD6OCwbpTpCQBIVioWuGu3ERSOwqGe5H8ANo
 9ZB5xThPUfd+ozxDLTRvd83EA3KF2H/KbvWP0dvaE7Hqs79I3vpJi4h8kx9+h4TXO3sx
 sMwfLks5YK5s8lMibd6ifTzW9tpRl753Xpn03lga34XQwqgKz0t59UeM+iK58qXrVbu3
 AVxUR+i7eozeqIIrsDxwWT6FZd9WmaXFR4cPsf4qFCNFsryqgS+ApX919WECN011X21g
 ibkQ==
X-Gm-Message-State: AOJu0YztTfqXyyOPdBky/lxC2Xj5oHN7KkcQADJbilDMZ1pr9YrneXiH
 dagt9QW+RdiQJUdmlpvaZN1tgtZRmtKTcsYXo+VDu6z2ASWRARCRCb0FFullNbKgjrdammHlyt6
 MsaW/
X-Gm-Gg: ASbGncsuwuAswdOkyFDHUBMBW4TeY/Mb7TAGHfBhmCy0MfB+UI8f1QSt4NiiDzfsdTE
 KyC+LdWgU3PDsglSDmEbSFj5hhZuh++6toEcZFxtGgCJQ/2Vlzwt+WGoitXUnCENsnkRSD42i3E
 UCF/H4T6lnXvPeSa1+TODpAJ0XAnUeFYJeVdG3VQBemRPNsTkMUvU9SKD3ZsuW/rfB6kxex0LHr
 vZTnMS+OCWfkDhKJIbNwKhH96qaiKz8SMsnZ/oRCrVQ04q8xdxJi19+fUx/Zc/Tml4JHHDVrKFW
 A/QroFkA2er5PlcWewS5ZuE9QvEwL2Qml4Uisxf5PZ+aJZj66ISlZ9bQwS24l8p3M3q+n09Eei6
 Y2JBjCkbkmsAwIxIHOUjaWfwvUiKJGR/iLmcLPkp4mj1cLCtxvrGUuvSEmYj+FQdSgtK+bnSC5x
 nqJyBrxkOjzQ==
X-Google-Smtp-Source: AGHT+IHy12h5qkeycTEEJLcoisd4bZvo7IHvdtEy7VEqPK40yZPem+FDlhXPWwrKV/krk2O51UMOZA==
X-Received: by 2002:a17:902:d503:b0:234:d679:72f7 with SMTP id
 d9443c01a7336-23fb30998c2mr111630205ad.23.1753603381522; 
 Sun, 27 Jul 2025 01:03:01 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe333efesm30016415ad.65.2025.07.27.01.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:03:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 03/82] target/arm: Skip permission check from
 arm_cpu_get_phys_page_attrs_debug
Date: Sat, 26 Jul 2025 22:01:35 -1000
Message-ID: <20250727080254.83840-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Do not require read permission when translating addresses
for debugging purposes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1b90e33f52..c7db93b95c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3646,7 +3646,7 @@ static hwaddr arm_cpu_get_phys_page(CPUARMState *env, vaddr addr,
         .in_mmu_idx = mmu_idx,
         .in_space = arm_mmu_idx_to_security_space(env, mmu_idx),
         .in_debug = true,
-        .in_prot_check = PAGE_READ,
+        .in_prot_check = 0,
     };
     GetPhysAddrResult res = {};
     ARMMMUFaultInfo fi = {};
-- 
2.43.0


