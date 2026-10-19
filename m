Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E49D606A320
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 18:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=chApVMyM
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIsZa-00012M-8R; Mon, 19 Oct 2026 14:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samanyu.goel16@gmail.com>)
 id 1xIpi8-0007yF-28
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 11:55:40 -0400
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <samanyu.goel16@gmail.com>)
 id 1xIpi6-0006nA-J5
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 11:55:39 -0400
Received: by mail-dl1-x122c.google.com with SMTP id
 a92af1059eb24-157fe9d771bso915063c88.0
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 08:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792425337; x=1793030137; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=oa7GGKxGIdUJiEFtMZRhwgXozwpjlUBJYDhFsQiQlKY=;
 b=chApVMyMNGv7lRMpzZs2vnyAIVCt8b1RXVVInaKvS6uFbJ4fEb4NzocEUys0Luy65U
 tvtx10B3KRHwwzxVI3tkVZB6VZAovKtNgCiVMIaT1l07YEfUSVbXQ5bK85uJ+5yh2KGv
 de+mcJZi8mNPoUIYbmLEY2jjhXEwJGXiSkeB8LHEFoaXCdkuUVrNoGsEi/yWq+2aAoRT
 d0Y5XQiyey49vMUcsq6sOIWwWWoH/oCDvD3Y/TBlpDR6Uc9iOREPxY3a1IRnLN+bCk0G
 +ymu6cwuUsoA2NdZa3GKQlQi6J2ltJ+/i3BXf6+6b/5hUVMU/s1sZ7UAH4h0qgT1v5sq
 Gv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792425337; x=1793030137;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oa7GGKxGIdUJiEFtMZRhwgXozwpjlUBJYDhFsQiQlKY=;
 b=vHwPQ39y5qqZkX77FL4oZ58EgNxTN2H17bIYSg9IItyJReBIdkdLbjLRF8DJQ6txiX
 ZkHARQvMi2YSRp68bj0ikFQKc+EoBwPfuqPkQ/WBTgHaKIxl45ciwI7ZoJMm+dKOH1cW
 lfOlgaXYzuFS1MadjqERnCUyGzcEK5l+TydmVD2qhR1feWZ/NuwoRXmqekFkp7pOe6V+
 8nOeCD5WwSv2a/4IBNRsob3TBwNBcPyrKVgxFf3Ev+p20ZH9NfmFdKhScqJnozUgMf+v
 8JTr7XH44bXx/Wa+n7AdCv5s3BVUn7jgr7/ehJyvFgXbdVJ5eUxjUfEw9lSSwlfGtg2o
 ko5A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwRo9c6i9Yjsb+jwyNdXwEXkGAJ7gyz0FDew/WFrcYnsxl9DggVxL0JRuTq2LAmeDc+wOWrkYSnyQ==@nongnu.org
X-Gm-Message-State: AFq9FYLNXHrmUOPrbQ5IG/raF0fOW6Ei7T98rLLBFMGLE05f9ufapV3/
 UehFzwKfwwuXshqjdDsD12Ww2GgvWGGRvg5IAWI3ejefMD4ckvcPSAfh
X-Gm-Gg: AYBFou2FBB3gnJG+prleD4pudMAg4NVAO9i/dqYdQoFwpqa+qOruPckLp/JAbv0y6tp
 aSodN82l0cYFiGbfjGt2imZSsxgkS0fp+H/njpYBpifAPLeaauCLTNE8dFDLOvSMfkYpRXaBKxb
 wDx4T+01bNpgxESXZAq21VSpS3MXZ+bSKAqbn2wdPIdGchBdRq3058UyqMuFBkyc79qRunT0HIe
 43C6bPfaFXweKnocEYntmzGh5OuRQwLqj8+isUmBVIh719W8Ubp+ISCbgCRbwNW2DEq44WC1iwB
 xMD5ZOKAiZ/v2QcjKA8I4julKVDdVkQ1bx1k/N6qIsk6cA9sNhe+6AJ0LQHrHBrB5WV5LFTxxrq
 6mKDLk1Z0otVK1oXgACUjT2bJW1fTjZcGSo41KNmX9uIGO4TZvDNKNz2Mr91X6wV8igA1scKbGT
 PUeGj+5GdS/QXKCjWBA5Mkp5zPCbcaFDTbQPkX2gAHNkdvnGAO9ESuSFTPQAtmCpgqrAHe8XfrE
 +EKJKEqBbAT77x1w6y/BRn7CYiXpZq0cTGlZNnWdyv/AnzxKiNfaZksFT7NExXrx2XIJM2ZzgOR
 Ljzhb2KIX4+eDLexKw==
X-Received: by 2002:a05:7022:170d:b0:143:3617:c595 with SMTP id
 a92af1059eb24-1850c223bb9mr10820485c88.1.1792425336314; 
 Mon, 19 Oct 2026 08:55:36 -0700 (PDT)
Received: from Samanyu.localdomain ([117.213.200.4])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1831c5cb39esm31283501c88.22.2026.10.19.08.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 08:55:35 -0700 (PDT)
From: Samanyu Goel <samanyu.goel16@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Samanyu Goel <samanyu.goel16@gmail.com>
Subject: [PATCH] hw/intc/exynos4210_combiner: Fix out of bounds access
Date: Mon, 19 Oct 2026 15:55:19 +0000
Message-ID: <20261019155519.1302964-1-samanyu.goel16@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122c;
 envelope-from=samanyu.goel16@gmail.com; helo=mail-dl1-x122c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 19 Oct 2026 14:58:53 -0400
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In exynos4210_combiner_write(), the bounds check used req_quad_base_n
instead of grp_quad_base_n. Because req_quad_base_n counts 4-group blocks
rather than individual groups, invalid offsets were allowed through.

For example, writing to offset 0x100 resulted in req_quad_base_n = 16,
passing the check (16 < 64). As verified in GDB, this caused
grp_quad_base_n to reach 64, leading to an out-of-bounds write at
s->group[64].

Signed-off-by: Samanyu Goel <samanyu.goel16@gmail.com>
---
 hw/intc/exynos4210_combiner.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
index dbbdee4d31..458949e8bb 100644
--- a/hw/intc/exynos4210_combiner.c
+++ b/hw/intc/exynos4210_combiner.c
@@ -184,7 +184,7 @@ static void exynos4210_combiner_write(void *opaque, hwaddr offset,
     grp_quad_base_n = req_quad_base_n << 2;
     reg_n = (offset - (req_quad_base_n << 4)) >> 2;
 
-    if (req_quad_base_n >= IIC_NGRP) {
+    if (grp_quad_base_n >= IIC_NGRP) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "exynos4210.combiner: unallowed write access at offset 0x"
                       HWADDR_FMT_plx "\n", offset);
-- 
2.53.0


