Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913A5CCD185
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 20:21:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7Jaa-0000Tr-KQ; Fri, 10 Oct 2025 16:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7JaJ-0000PV-Qx
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 16:19:29 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7JaF-0002m9-Lg
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 16:19:26 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-78af743c232so2346072b3a.1
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 13:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760127562; x=1760732362; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8c/a/e7GGXyISQ+cP5eE5evfd22JmDwjI0oLT+QFhgY=;
 b=UVJtSVHMiVT+KHGyDQhzoXXfFKyfBPpRTtU9ejN16WZj5kF/Nvcyqj8E/XKX8aX5GY
 X/UlkbeyqcOmTMrVAyS4lNikbRPnatFXgl/tCynnUYhNN+WeOzf+6DyDLv0nYSQ6Iqv/
 SO897MyaWRFimTkVNHMqEgoWbGYH5fdQ9/YoD8oumKZl112RVE1vTPPO0V3TtYWlBOdB
 JnOhOYCEqM5R5GW7IqTnLN2SP9gJP7MKuMr0f6aKnfeusuPDi2KEbI7InU6FdqfcQAlu
 IgYDL69aQLPoD7BfMhqs32upKO4/WsBBOP/l5ljV5RAst5H5v8cTOxUY3JpoaeAfXY8l
 KSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760127562; x=1760732362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8c/a/e7GGXyISQ+cP5eE5evfd22JmDwjI0oLT+QFhgY=;
 b=WwEGRP6sHz/vX+5vETR0GuUa4/B/t3tilX2ZeTojcQHu1vXU44qTK9PV9nyyFb7RF2
 5E9PsMCbX6NDeA+jdcDDmhKV0u1pHfPm6kq1YmFQrU7CfidQ8w5chmS/200v28CGD+lF
 RpyByeWi9Xh/Bd3+CUavpKHis/H1NwR2cBvkY9L4toWh1iYrpUZntvHgT7Ot18ozJszW
 zUblOldWlrZkk9EcYi8IAj6gYlq4bYrwXbOy9ukv1iDuf/GMahKnMnHAbcE99YnPBZ59
 S2g8dJQtvkpyyEDhODIIAel7i/VZfH7Aby3fwRKmMlJ464Y6yDj3MwhAJHHQxKuFhOLq
 E4OA==
X-Gm-Message-State: AOJu0YwDmey6FYYKym8xVNlZh8L56hHZa7Fr1NhHHA/05NY3hEbn8a65
 cgP3/GRCFNkGgMhs/1OIkR16MhC0RAZiK1yRkA4cnI5PI41YqmTdlfFPw7GpUnVOK+aZ7fbKJ8r
 bo30Kktg=
X-Gm-Gg: ASbGncuP51NgGC0VV3bXV0gnT/EeTuAsXEBDafS/UBSw0IilrlNdDoXZoj8xIMKJnLo
 2ahyL4EeOR3jjzxiPARGfwwk6TvrcJ7R0H28VgZXvn0qt35sCHF4IjnKNe3jMeWKVquchPWiy0V
 j8+JaQ8E1c+4c/mMSlnED7bLgi+xaKDCLcErOOCjnkhqLIHqyHl/1cM81FPENQ2qw+68bs1oxpC
 89Epmpc4iopuIOd51s0lf2H2t+g1a8TK11kE1+2up7Ki6gB/muNufzwl/TDNIqrxPzxyVQCQrEq
 +CtAIhWwC/U4xbcdzZVh7Doqc+LSF19HUGwoSzOO6iM670JZRZ+v/GtHEnI/QHRs0MvXDcmtcxv
 W6MigAG0B53rma6U6+qS5cL+hyxaAr7dz7TFZznSjYcgBCH10iFs=
X-Google-Smtp-Source: AGHT+IGNQfr+nOt8GLVJjV4O2hH9AxJn0l4CWbu7Ze2rbIJ8yFqydBlO3Gyu+5h4nCf+U5lgeaHCWA==
X-Received: by 2002:a05:6a00:4b01:b0:77f:1550:f3c9 with SMTP id
 d2e1a72fcca58-793859f34b3mr16203532b3a.12.1760127561430; 
 Fri, 10 Oct 2025 13:19:21 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992dd7ee5bsm3764830b3a.85.2025.10.10.13.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 13:19:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 4/7] target/arm: Drop trivial assert vs attrindx
Date: Fri, 10 Oct 2025 13:19:14 -0700
Message-ID: <20251010201917.685716-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251010201917.685716-1-richard.henderson@linaro.org>
References: <20251010201917.685716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

We just extracted 3 bits; the <= 7 test is trivially true.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index d4386ede73..54c45fc9fe 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2320,7 +2320,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         /* Index into MAIR registers for cache attributes */
         attrindx = extract32(attrs, 2, 3);
         mair = env->cp15.mair_el[regime_el(mmu_idx)];
-        assert(attrindx <= 7);
         result->cacheattrs.is_s2_format = false;
         result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
 
-- 
2.43.0


