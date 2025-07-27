Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C195FC87FCF
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:21:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwSn-0008CI-Ap; Sun, 27 Jul 2025 04:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPv-0004hr-Q3
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:39 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPs-0004wN-QZ
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:35 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-23f8df98e41so30603365ad.0
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603651; x=1754208451; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ehuTGpwHUKV7uIhBwvsB0XfGLWumhP/9m5f41YJi2Jo=;
 b=yMui89P46t3mgSC5+JXtvdSztlrmmNWsu2bHma1BhZ08rvpkR3GJVM4/5J3YPZjLor
 +YmRJ7CwUs7smRob24T28tuUIRlJBHjVK6klLexwTj1eRka0AWq2z66QT4RIqKtVpN1G
 jdudUPYwfLeSrv5dopuewb0N0UVUMThxryU5cjLgbZl1AOpycstiWPBWf24ILMHUWI2l
 tWrFhJ2NAPxJkyWv4w5x9rchNjiajERbNDQTxWxdJH2pBTVsVNZOmcWs5pEzX3YId9jr
 SslR4XUVM8HrUKqufMHm5MQb/RH+4/xfVeios+Zx8et44oH9LgItoI0s7IGMSC0lPyn7
 7Y5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603651; x=1754208451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ehuTGpwHUKV7uIhBwvsB0XfGLWumhP/9m5f41YJi2Jo=;
 b=Cd2fFpzVCFE5wwiZIasBzPoFuR5BTbBUnPUIPl72Dkj8hLZj1q3UsMdD0n5sQURT29
 +S3koo8reFOUbrNM/w6DR/zKFbnpJiz16S383oz8McNuosq+4RGJVuRU1/Zz+3hATJ33
 cwkcj0AbrnAVMYgqyfa/q2kRLYPBhVmX5uuIaMLVQrItUDLuRRNO4qF5fdAlKFtPcLTo
 rBPclc1dRrX4Bxl7MImj1wNm60WURDzRZUW1FKleWPndymm6tVgPb0quDaNz2SPvUun8
 vsFjSqcnVmTwJYnJC2DDJAbiyNubo1QFl31l3pGPqvGoKiIpz8kBJdZeLwTpA9ZltWs4
 /0EQ==
X-Gm-Message-State: AOJu0YwD5kimbo6xW1SDIO1jre/7DoebOdk4HFQ31h4UjK2WSHKjyX18
 4q6Cm+OpT+7CNFvlICjlZHwry0pJ3KT4AgGbGfabyByvlU4ohulJ70vp8gKso5J7gsc=
X-Gm-Gg: ASbGncvMRXp2Y57lVgx2CO9JOWpsf6bTkdwFiPSUFH+qy8pb2p80yK2kyOA5RxDmlQW
 j4jCVO8VSTrMI/4W/cqWEn6lHq2NC2NV5vhhEJzXiwC+vebP2rySoCY++5c6N9wvfmWuqLln4Rx
 jQm31UeOUrpJVpuqvGRIsJL0oWDcmk/5x40o4AcdKRdyigz27DBQ4Dcre7+hZuTUG4IWXt7iNot
 lDIYZGwDxTPsnOJ2YGHmoFkVAYzNi8zizjW+1xMiNF4qhXHFuB4hilwZSrrJc1SUE5RbN/RoSXN
 SL0AJg3VE1KgzChtNfxojNBq2LjVbKkOEfTYOEQ2BwOdJFku5PQQmGZpE17BIwvl2Y5gfyFonb6
 KFdZ/IJFIsnDNshzdgmi+se0HrnzcMQ9bf29kkZslQ3bgcgkvC/d5tzJo0h2nC2nEQGNvU2MChU
 rhNwuqLrQUvEiU6dDeWl4I//hQhVHTzZU=
X-Google-Smtp-Source: AGHT+IHDa3fA8mr/5q33HHHGjx0ZbAYUddd8uKH/TBEuM6O6B6H3HWJr8yzRpCDBpJWSSVbRZmlbVw==
X-Received: by 2002:a17:903:1111:b0:234:d7b2:2ac3 with SMTP id
 d9443c01a7336-23fb3029b76mr102260535ad.20.1753603651316; 
 Sun, 27 Jul 2025 01:07:31 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011d5bcbesm3908065ad.10.2025.07.27.01.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:07:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 79/82] linux-user/aarch64: Enable GCS in HWCAP
Date: Sat, 26 Jul 2025 22:02:51 -1000
Message-ID: <20250727080254.83840-80-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index d87d1a16e0..e71dcdec1b 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -877,6 +877,7 @@ abi_ulong get_elf_hwcap(void)
     GET_FEATURE_ID(aa64_dcpop, ARM_HWCAP_A64_DCPOP);
     GET_FEATURE_ID(aa64_rcpc_8_3, ARM_HWCAP_A64_LRCPC);
     GET_FEATURE_ID(aa64_rcpc_8_4, ARM_HWCAP_A64_ILRCPC);
+    GET_FEATURE_ID(aa64_gcs, ARM_HWCAP_A64_GCS);
 
     return hwcaps;
 }
-- 
2.43.0


