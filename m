Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FD1C71130
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 21:04:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYt06-0002Q2-Uc; Mon, 07 Jul 2025 17:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsLS-0005QN-IR
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:21:51 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsLP-0004Mk-Lb
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:21:44 -0400
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-7d5d1feca18so431325085a.2
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 13:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751919702; x=1752524502; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E8kG6y+ItxO1LXp5yeGaKBJvpXGAehBrhG5yVhHPlL4=;
 b=lmc39+0/3W9iuPdyu8SAy8sFwXK1ErpbjLZD3Jt1QipQdh5EnenbBWjcBMnuGpRi5x
 GaZvs8pIIT3wQk7rAWhj56ZiolhpAHL93XSJj8T33F7SpuS+3pBiekonu8x5mbN7w8Ua
 CO8CSA/Ulu0CRCDFtikUrFEtp51yG6pRaT3ZKrZ8o229Cisai4mwo5USMdqNJt5zXTS8
 EA7zHRrZD7tz2wxA/XeYf5l2WJIKeEWF7AxW4RjLHO33lHX3EneKrT/krUlqPslOveVC
 azE5oG+6R8AfGcT0RmIZ1dbd04sRC9By3ca+sO5CjgMjzkOmXJP6WMSDqWsuuv6yYiOM
 4Ekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751919702; x=1752524502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E8kG6y+ItxO1LXp5yeGaKBJvpXGAehBrhG5yVhHPlL4=;
 b=rb7UC+50IC/jJPOjy046uMq1W4CMpKcIJBbLVg55v7TdCx4RkqgfcQkfP52Gqc0GLx
 aRl0xwiuTaQmUXdgqPsPWp/PN8S7TkKYkYBDsPuZZoeU7o6yelhuNKObusiDsJkAC7/t
 +/dyKSx7UmeYzw9rqr/ZDfZ1fN1FeO9BqUi6XlD1X4o9/QiKtnUEn4TEDhzeDmvganr/
 HMiDt5VniKB50rlhTEgrndTZxVpzwOT/mbQE7X5VwPY2J1xcjBLwFTXejsTmE16iUZ8p
 gOY2zn0CeZWq7xLhk2BhWm553aGxpcVSMkj5VxBMsEwdzcaFdVudc5eTMaE4nO5JyrOg
 QI4A==
X-Gm-Message-State: AOJu0YwbFyPT0ofqthhBEgSo/cF1iuYbz1GdGAyec3HQ1wrdNZ9R78RP
 5Gsi1EhtfFHqjjK9xep2OGff5wnW8ewhmUZ/KN8xr06VaLJc+LySQLYlL46GVvuZdGY=
X-Gm-Gg: ASbGncuIXiiJXLRrIQl1IV998Tnq+m9h1GX1+93RHn1RfpUZFF+3Wnvb3iMZZhJfiLe
 23PNKI9OorxYBLnkx8grRc4cvULv0l+coW1w0Ik5iShtsFOkavS8Mjbt+9dltHxss4L/POI3/IW
 Gv+ZkMYZXptan1qkfMCcrKguhqrEqHyv6dQURuge8Hp/8EHpMMs9swXwoyqj+c26Nv7JC+udAtC
 GQ1AfBrBf7hu8VhDCYapOZgqL6iyd26UkPZnMpaRVZkg9hV23SuVp4oG43ONFmR84Uk0IuE4RmS
 q2JgwgeqzNSN0CFuxNGbIBphCeSg48pI2qrs19fRqaWgrYKW5g9MZ4FvCdzy9ScjJQyhN3WA3R1
 coTSq2om4Hce/R5nyAqmgbTQRhfY=
X-Google-Smtp-Source: AGHT+IFNyQd5x3YqdKK1d1C4UYzuWmgR4Hknvfy1iudZWeigiKDcFl0dFqZvzGLvYHbqUBTHva+uhw==
X-Received: by 2002:a05:620a:2854:b0:7d4:4004:307a with SMTP id
 af79cd13be357-7d5df13b664mr1219334985a.29.1751919702061; 
 Mon, 07 Jul 2025 13:21:42 -0700 (PDT)
Received: from stoup.. ([172.58.142.143]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a994a78dd4sm69050351cf.51.2025.07.07.13.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 13:21:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 15/20] target/arm: Skip permission check from
 arm_cpu_get_phys_page_attrs_debug
Date: Mon,  7 Jul 2025 14:21:06 -0600
Message-ID: <20250707202111.293787-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707202111.293787-1-richard.henderson@linaro.org>
References: <20250707202111.293787-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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
index fe005622da..c1fe53965c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3641,7 +3641,7 @@ static hwaddr arm_cpu_get_phys_page(CPUARMState *env, vaddr addr,
     };
     GetPhysAddrResult res = {};
     ARMMMUFaultInfo fi = {};
-    bool ret = get_phys_addr_gpc(env, &ptw, addr, PAGE_READ, 0, &res, &fi);
+    bool ret = get_phys_addr_gpc(env, &ptw, addr, 0, 0, &res, &fi);
     *attrs = res.f.attrs;
 
     if (ret) {
-- 
2.43.0


