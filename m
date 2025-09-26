Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335C3CAC5B5
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 00:14:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1w4p-0002Ug-DX; Thu, 25 Sep 2025 20:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v1w4b-0002Qv-2x
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 20:12:32 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v1w40-0005Ej-F2
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 20:12:28 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-b57d93ae3b0so317956a12.1
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 17:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758845501; x=1759450301; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=12OXoTcuOfeVdlm2kWXUtr2dlbq5Ty9b8Q3kksNsxiM=;
 b=LSXCfFb9Mc9RcjMnRyZn2zk0W4dHscdMRgOVVrhPW2SwahaDiUrrK0LOWg//tQE1Q3
 ZagFeKtp1G/w7dcYB2rqp6BiRSnzED2GNj2ONg5zWo0NSpi3UrE+vpiNAM+Z/VvK1IFY
 vnMeDWeAUP8awZu9QABzN+XIQxVOJmNYEZb5jGVxh/c5d9LijgJ6qWBmtODKkXI+r3hQ
 1jo76guTwYFQopo2QL0kRb7Fw8104RrQoAu08qicTMZP+elcsFGk7klU2VYUQar76qVN
 ZROWNnGOYJVvZVTxcZz1odwU7z501R04bKppnKrRc2fTkNLnhj8/m+iOoxCmiNikobJ6
 XStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758845501; x=1759450301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=12OXoTcuOfeVdlm2kWXUtr2dlbq5Ty9b8Q3kksNsxiM=;
 b=WkI0qdC0sRwWV9VRp9hoDJRD1TZtJnJQSH5Hbr82AIlt8YORaJAugh8gmucS0m6ONr
 fs7bz6wZz4uRbdwauIKNYbUlHTylThtCUDWWr+YiCfJy4DCi3R6xrnV6kjJFmvd7kgMK
 vyTaGiqW5s6tYYZy0nFysjcRT77IHVg0dmkjqBF039uvGv2mte18Tl6s5IpI5yuueQFy
 1wEXXzAQMWJoh11HWfW2X+S0Wf/YPYvK7PaNGRCNp4xR7YGTlfvgTJe0fuW0p+uKVTa2
 2JD83KMTfY+n/eTFS5K3lm9APJzxA/QFLgf984Em6AHjLoHEb8vhbVbdDwDX/Wc5M012
 O+rA==
X-Gm-Message-State: AOJu0YxPei5IfDWNRaYhg4f/GjyGq4dF7DJcWcdq9TkVQPd5ZQo1nJpW
 2oOFRK6wFlEtb4peq7IT3aqvdFWKBmBWMV7vgtVjLqXZzwcJqpR9gb+rJNB6S9ZQhTvkqtgrG7i
 wNQHb
X-Gm-Gg: ASbGncskqRhs5eNbqT6RJ8mAL5dDZh0oGWYHGkxS5YuvxDjXWtPiVAT2fNIMzVa8eAu
 WHEHMQdc6NyB8ZvhafzA6Xyd0RLXbtVTUNVulzSmQgn3ZkIs4QAimilKzyyiNzyNvVZL6q7aF+j
 n9h6OuC+1sKlghAO7yuxKoD25TSciVcG/CBFHvexI4dZbJlnV2Ghb+TjWTOBHbAjpr/WoKJuPF0
 75g7ZleGBQfxBwfKR0JmHYlrvkBKXOPLD2XwzqnES9c2pe//MWzrT5zUY0x/eSORLsC1fBDK6OZ
 lq0PycF+P6YXXNZfqTOruZoKUsCP8NjYgUinAy7TvT1lhEVB1AqyxA2U5YuLoEvqijJquSXh4pT
 p6K2Frcg9REE/LtEDWE3T4PrOrEtC
X-Google-Smtp-Source: AGHT+IF4nIUT+sqlY0OI9lbNQStI1igOHWyxYUlDk9nmSA8Fg6S9XSOSqM/cvQy3hdEFBSC5zmDCOg==
X-Received: by 2002:a17:902:ef09:b0:276:76e1:2e84 with SMTP id
 d9443c01a7336-27ed4a06b49mr54469815ad.3.1758845501607; 
 Thu, 25 Sep 2025 17:11:41 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6ac37efsm35829425ad.137.2025.09.25.17.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 17:11:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 08/10] target/arm: Fix GPT fault type for address outside PPS
Date: Thu, 25 Sep 2025 17:11:32 -0700
Message-ID: <20250926001134.295547-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926001134.295547-1-richard.henderson@linaro.org>
References: <20250926001134.295547-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

The GPT address size fault is for the table itself.  The physical
address being checked gets Granule protection fault at Level 0 (R_JFFHB).

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 36917be83e..236c3a9569 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -413,7 +413,7 @@ static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
         if (pspace == ARMSS_NonSecure) {
             return true;
         }
-        goto fault_size;
+        goto fault_fail;
     }
 
     /* GPC Priority 4: the base address of GPTBR_EL3 exceeds PPS. */
-- 
2.43.0


