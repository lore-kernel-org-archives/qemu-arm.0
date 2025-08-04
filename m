Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B48CC87FCF
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 19:34:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj0wx-0004xS-HU; Mon, 04 Aug 2025 15:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj06W-0001B4-3l
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 14:40:13 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj06Q-00019X-40
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 14:40:10 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-76bc68cc9e4so4018728b3a.2
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 11:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754332804; x=1754937604; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l2zHTZ6BcoGUiKxWVAKTw6l3A4hCrK5GgqF5hsYKgdc=;
 b=aJfPubW9xDlrTiLUdg34kSLT30m8u6bSj7CmttNDD/rVhiq6ZHpQPCd1eC5+lECY6K
 R0oErYx8jtKiD+8kXuZo7lgUUF6zoMVDh/xpMvP7yj13Nh+NAat6JoM+KsutoN87Vy/Y
 WgXqHvcWZShj/heBij0B02nXuaIPlz4kpWl+c9DBN+bWmXvY0SXwFJhD8JZtqsdGtOKo
 xt/EjM6ONGy6EZhSPjV2lHRzgBM+1Ypfz0f7Fq5I8eivjRgB5hQc3hHoc/PoScP76q0C
 1okuWNYDVEylzn6J6K/xpwRE7HA6Oy/oZFlCDUPORtqavyAmx+qBT2EUdrmyDH2wxaGj
 kssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754332804; x=1754937604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l2zHTZ6BcoGUiKxWVAKTw6l3A4hCrK5GgqF5hsYKgdc=;
 b=thZGNnf4fV6qigO1A+RlEmyIZ7vC8URI5wABvOkCM/D0VsnAnlG9tYV5YupfD0DBKB
 arhng2aL1BNG/tspmAU69IDBI6fziYpygm3xl76W1QZQHYy9Ggmc9l9/8F9rlvWgIBtK
 MPXublxp09FnVHFdfOTvj1OPxhGh/tbAWq0xNi9LKXrVXNL9ppDjjvYSp6Z8hxBG+0JM
 Wu/BqvOWthG1ZYDDM1Y220hP6eglMyUdkIV1n05tRjQcLfb2MQg1rMGEeFspG2MQM/q4
 Q0qsAse4CY+GTx89YEITwEF/2/EMh4ra/86SA8PAa6eEMDbLJqRPw3BeR/WrXUTOOyuQ
 az8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDtmKcSOLc1nsi5w1MBZGZ7HrauFuzWXK0Yk3NTlD9gyMSxkiTDC1jZ71EGfNrKuzN3qZdTymwDw==@nongnu.org
X-Gm-Message-State: AOJu0Yzya+MNJsXDOOJ2mAbhUoxkdt4IOQRRCZuICSDs7I/ZKL31VqoT
 DC5vHQm7VxzZfYomgZsFrDu6tzRnvs90TfJLI1ZBXJda9eorufSBAHKwUHsQLfJRDfk=
X-Gm-Gg: ASbGncu1f4rcovhvdzw7fWQPhGld2yrix62oi2mefKKPtAxYFYg2GXFxv1Cgg2FEKpv
 8PLP1vkL3j4r5IhIVoSb+EewJNf7Rxnl9c49cl5e7wwsQDTOIqha/keNvgD5b9h3kHbT8YG4DKN
 5xANlDsDP6ZtwnRP9ZTASrgzosDKBlWQ6ntwnh/m/NaALB/q/SMj+HKAyJnRy+2+XK9zDXamUef
 h3bmvELs+CIk2LMNCbP50qxIOoI2iG+Z4PsNlkc90ZVeP0WDjpGrzINIMCQMELEL6nkUlSdUz2h
 ZNZCP+IPVXsb635tZNwPzNcoTd8p20H/C6/8YOZIIuO/5q1Y4y3Urdj7iDltmRq98jepUOSSyO7
 GuUDDCiZ2vzI9vwOmpA0sDw==
X-Google-Smtp-Source: AGHT+IGDIiDvwkp07Cl3q9p2tPrnYkh/KID/Apb+z9tDpROIyRYMrq93rK7+HyYmg53wUZ8dfa16Lg==
X-Received: by 2002:a05:6a00:114b:b0:75f:914e:1972 with SMTP id
 d2e1a72fcca58-76bec4b7d16mr11669416b3a.17.1754332804529; 
 Mon, 04 Aug 2025 11:40:04 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bd78875cesm9940171b3a.15.2025.08.04.11.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 11:40:04 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, philmd@linaro.org, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 08/12] semihosting/arm-compat-semi: eradicate
 sizeof(target_ulong)
Date: Mon,  4 Aug 2025 11:39:46 -0700
Message-ID: <20250804183950.3147154-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
References: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x434.google.com
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

No semantic change.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/arm-compat-semi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 5877214c47d..c03096b253d 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -786,7 +786,7 @@ void do_common_semihosting(CPUState *cs)
 
     case TARGET_SYS_ELAPSED:
         elapsed = get_clock() - clock_start;
-        if (sizeof(target_ulong) == 8) {
+        if (is_64bit_semihosting(env)) {
             if (SET_ARG(0, elapsed)) {
                 goto do_fault;
             }
-- 
2.47.2


