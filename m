Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112ABCA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 16:26:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNtm-0008Cy-VV; Sat, 30 Aug 2025 11:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usELa-0005q3-IH
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:41:55 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usELZ-00044g-1Z
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:41:54 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-3280264a6e8so685276a91.3
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532511; x=1757137311; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iwhk1HGVIv53xO1tUgspGYJaTSrp9MM6iDeDwh0Ulxk=;
 b=AyQXkTAl6OXTW0QOwlV/XAotH1QOusAY1cx2LSdCCZ3EzQcxqJR7ww1+jLNXzf24MO
 UOweL+iC7ID86FqvMeSJ90keB60K2XIj0e844ZIvMKgT6XjMx5jJnBJ8ldL8m/WXFghQ
 IVAxTYAAT1FeP9892vHMqvVswlMweJLJjWvm0WNSBzW0IaAuFytb4yXtQ1HSTTFpblj4
 FMaPw/jFo/ohyDqriAnBfUOo9htcZClUY7zPa2XBZ4I3Rlk8S3xrdgnDRVk4DQ0d9cKI
 Iaf5onB3h48slKGtkKxeSGWKke4B3Pwv7NJFUvc7bdMKD3nKu0WPPzku28JX8Uws+U0f
 dufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532511; x=1757137311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iwhk1HGVIv53xO1tUgspGYJaTSrp9MM6iDeDwh0Ulxk=;
 b=ZrdKndA+y5eTHQxJ6chGJjNaBfZe+T4YTXYA/cc2ITnVnuq7LFxK5tkKjmKfdsTJpa
 NBeGF3q438Rcge1R/+/hiU2c+S0wNK3MzY+FEIhGKzsmQ6gZZ/jyVD/E4BTlt1KPHwju
 nU+CSrbYqvaYxn/HLZaVRlfan9p6AsHcSbWb1w7uYJrL3ztmdvEzUfJacSesh93IQAP5
 r3GvL4Y/nw04CGeO9J449nbiGrSYtIwsMiAXLGFhsFAXV8L+spOAlyBHPz+L7pdyYyL1
 8dc2KXHZG+tGf3yBVIr1UJmvsJ5GsB4IBUqkYtWdB2YuemZEZkkkTdLmzxXWkZtiJqrP
 d8+Q==
X-Gm-Message-State: AOJu0YyKWAbbXy1ETE8g6AsZTQKjJMU5/GL2bB9Z+xIMkJDh5tLURJrO
 MgkNpyk0sk2sE8HYPP5SUyW9zt6jMZvb5Uu4zVPthZvaaunuAM//y409TFK74PkkHMw=
X-Gm-Gg: ASbGncucbWWLANfWkpxeFQz/Mj3Kg2mlKnapJwQT6Gi6Et8XdjRktgk8XPz2KqGJ65z
 ZkGuU4M6Jhucl9y4sxE8bHRqinahB1uEiSWsCBOiDq6tkSy4D2x0xeAaWdOWd9eI0aT2F8dpdRk
 YZwyNemFnIm4jzMiKWHtjQM6J/BgAqWQH8l9zhWUSKIMw7GagV/LC63f0ghPWPQjFtK0E1OVw5q
 XwFgi78cE9Et46rZOMcZvQSbQpyVyrHRZGlFO3d25ZnFe1P1mZyE57Sj5GqNEs/aGOR4ZLstpTf
 BmnKk293m82vCixTUBaXVWeiH6cX5qtrurqrLaJTb0S5RIskMpT55DMkdNEPU4wlexrE24m/9hg
 4Oj8coFllGIj38+PJeCIRAet0aLiHSIemyiS4IKRMf5Agi8o0WUI4mmtvttCgs+WlcGvJbiY=
X-Google-Smtp-Source: AGHT+IEZ+RJB4/2vLFUV6OggUWyyd9VqDey0ACNrvjRIeKm1Hd+dpw/QQzkDKYMxJxvc+vIEmtfjBQ==
X-Received: by 2002:a17:90b:4b8d:b0:327:c9d5:257e with SMTP id
 98e67ed59e1d1-3281543c7a0mr1756181a91.16.1756532511576; 
 Fri, 29 Aug 2025 22:41:51 -0700 (PDT)
Received: from stoup.. (122-150-204-48.dyn.ip.vocus.au. [122.150.204.48])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4d96829a66sm2435905a12.6.2025.08.29.22.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:41:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 06/84] target/arm: Skip permission check from
 arm_cpu_get_phys_page_attrs_debug
Date: Sat, 30 Aug 2025 15:40:10 +1000
Message-ID: <20250830054128.448363-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Do not require read permission when translating addresses
for debugging purposes.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index d37c0ce0f1..5d85610de2 100644
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


