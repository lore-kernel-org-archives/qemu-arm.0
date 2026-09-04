Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3C3C61DD6
	for <qemu-arm@archiver.kernel.org>; Fri,  4 Sep 2026 12:48:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2TJO-0006CQ-M8; Fri, 04 Sep 2026 08:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x2TJK-0006Ap-HL
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 08:46:26 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x2TJH-0006tK-2Q
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 08:46:26 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so826565f8f.3
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2026 05:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788525981; x=1789130781; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Bfljn+s2Wnq05dseDvNEV2VlwDUR1SUHuwTQSSUXeOU=;
 b=aYtDPtRCf+fziNiGccN0+e3mLlWrf9/jV9+m5vNy8rFtwGAcrevrW+DQFTpi2X/VpL
 5lgbYBkMenKxluHx0omE/GHo+1mMSJhJHQfI0wufiCL+Bu/pxdv3nxxAcG2lFH4b6NRj
 tlsBs4NGETDWjxkhf2e0Zkzovr+v8pRcM/kncgTRPMd0FWV5ovr/rBDAYJMk81DH66GQ
 uVNUh+nwqZSa74VCJIMBJNz2N8sHpRmt0iIcGw82bCUQ7RsY4B1rzZ0mmaeYFAx9IVZk
 6J+nKuGQBJtqJ32pnCJWi7tXCCOcIXB87cLfXA1BdDpLB6W6Rxg0tymsc/9Om7ey38Lr
 cahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788525981; x=1789130781;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Bfljn+s2Wnq05dseDvNEV2VlwDUR1SUHuwTQSSUXeOU=;
 b=XZjDqTuyTPDKKZ6NMU+QYLRx4Q06HTKxCMHO87AFcAaZFfXCg+vrFe0GAZQWP6ShH4
 9CIo8WNiJWKSL7jgBFDQMsLrjWG1oJBXudNEWqmgKFfSPGBp4sAoTcWSy0F05nZzl/sw
 H4xVL5S3B3bK/atVQWgcotFCRspfNFmXP8vCYI7rRSCsSGNUnuQmkRs7gmoenCMyurmo
 ewhJIFAjoxc8xCnXx2SKkHPPdpHG7TEakznlcn1qPItBtHdAe3noQ2jzl2jji9ZMrWsS
 Fwt0Ysl65BbXJ2rIEB0Mkvy1g1z0Gr9RqP9wIoYaz5TIUpDhALCWYxKCQXZmxjKA08II
 uwXw==
X-Forwarded-Encrypted: i=1;
 AKwUvBz11TS16lV16qW+mrxd/Jp7gJzca86XIHTk36J6Yma/pwL7fV52DCCWF6vweaa5M2ZDtjtIYHS7ew==@nongnu.org
X-Gm-Message-State: AFuF++kg6Ur0KCVU/jhjY2X7BRJJOCyft4fLtKdyzojXx5KfSkiLm6NP
 1sVpYWEe1pjylshiDaQ60z2ttXw5OFcWl6uadAiHQZsX/t8Stc/oparV0tQ/67kaV1GYolYmxX3
 rTHX5CZc=
X-Gm-Gg: AYBFou2NtAgetH5+nSeLN8xatntLgPCRCnawgLNDImcdOlBH1/ssJX7FHGbGEK29MNZ
 wLXYo3pp3mhNUw1IVC8GeY1t3icPhkQs4bA0u9yL9qcNeHE/HXq5eLY8edUN+/z5mvdl5YgmDaB
 YZ+ZlbX3uNx43OslG0EqTgPeRcX++MireOvW2S/jVeNzYvbVs0dNugSwixRlj8I69OfB/3m2haU
 /B2+4eU/A/claemgOXxc7461fSPeeWdhpHRtdDnyz1lgsM6hjcLkSDmc//6uV3r4eCG4L8E1+yk
 eY2XA3aqC0P+jDvzqKJ+3LMpDhGcgQm54kl/4YQ34oFxuIZ4eN5CrHQH5huD2ZDkqfvex9EsvX7
 8nKhtyZAtAny7fMQ9v56hlHJe4c1xLW3DJhgL5Id3JLehY8p30nZoa4g9C6j2QF6DWL7dD1OUHy
 Vp4qs6QTk8doghqQ6xB9cB9SZHD1b5hJEoDI53I1+QgVJZrjeC09qAKs7QF6jXgXbzSd0dCOs=
X-Received: by 2002:a05:600c:6383:b0:49c:f4ff:e872 with SMTP id
 5b1f17b1804b1-49cf820507cmr56993755e9.5.1788525981558; 
 Fri, 04 Sep 2026 05:46:21 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf7710aa5sm68090895e9.7.2026.09.04.05.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:46:19 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 55F8B618D5;
 Fri, 04 Sep 2026 13:46:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aniket Sahu <asahu1x@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 041/105] tests/tcg/aarch64/system/gpc-test.c: remove unused
 variables
Date: Fri,  4 Sep 2026 13:44:55 +0100
Message-ID: <20260904124604.2207440-42-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260904124604.2207440-1-alex.bennee@linaro.org>
References: <20260904124604.2207440-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Aniket Sahu <asahu1x@linux.ibm.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Message-ID: <20260827221506.91574-42-pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/tests/tcg/aarch64/system/gpc-test.c b/tests/tcg/aarch64/system/gpc-test.c
index f26b23efafe..0ce0ffea277 100644
--- a/tests/tcg/aarch64/system/gpc-test.c
+++ b/tests/tcg/aarch64/system/gpc-test.c
@@ -28,7 +28,6 @@ const uint32_t gpis_per_64_bits = 16;
 
 int main(uint64_t sp)
 {
-    uint64_t out;
     uint64_t pfr0;
     uint64_t gpt_base;
     uint64_t rme_status;
@@ -38,10 +37,6 @@ int main(uint64_t sp)
     uint64_t gpt_table0_addr = (uint64_t) realms_gpt0;
     uint64_t gpt_table1_addr = (uint64_t) realms_gpt1;
 
-    /* Mask is FNG1, FNG0, and A2 */
-    const uint64_t feature_mask = (1ULL << 18 | 1ULL << 17 | 1ULL << 16);
-    const uint64_t in = feature_mask;
-
     get_sys_reg("CurrentEL", currentel_raw);
     currentel = (currentel_raw >> 2) & 0x3;
 
-- 
2.47.3


