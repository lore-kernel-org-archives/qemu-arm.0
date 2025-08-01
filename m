Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE141C87FCB
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 23:29:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhzBh-0002kS-7F; Fri, 01 Aug 2025 19:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhz8t-0007RP-SF
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 19:26:27 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhz8q-0005w5-EN
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 19:26:27 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-b271f3ae786so2207757a12.3
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 16:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754090783; x=1754695583; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4hBawASsHdbL6GWaVoVOq2WpP17YA49FN5IqJZ8zqPk=;
 b=ALNwvHgXgVyMarFOyz5LcPX4g35VGBSb017xebRer0Fm5oQi4WqmxGGMFilAaawzcj
 mYd0vj76LZv1SPIMRN28L1p5cxiIdiuvn5fAza/s2XD399UicZZ7hI22Tv7FXIGHweHa
 gJaGI+AAu9PA6kH7Mm3s02RBG76L5DMlsp/4YNVuWtgrzR5yn1gJU1ikBIxeLpl6xKb7
 n33av4mbIl25vyo+TLArFAklIHrpzA5N78tHwP9ruSYaQveWLXd2HU29OLIWPG5Bzf3N
 NmZJIOnhqbJ4idM4Tl/sOXrIdILAOefTIbxzu9g/dmJC+EQdxen+7uGYyytWTNIsxexu
 NkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754090783; x=1754695583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4hBawASsHdbL6GWaVoVOq2WpP17YA49FN5IqJZ8zqPk=;
 b=bjeAXnRcHTj9Mly1Be8Qp4z4cIIzHo5c09H6eBxW+kkw5D4rMLPBXmeQEQXuNIZVJ0
 0l/qb2dISMZnSo9iQ7mPitfe2g+x727EkbPD2w7AG7LHUd9k6RY0Pwnndob74ciafiJ7
 5ePO8Ri3w+01SJX1ZwxFwWPB7JtZnHNHlmJbY0l1ir1CcVYy5KQCWlTRB35D9yh3yJsO
 v3V1eucvhmEJf+zwYre0kBEbO2iQDrwDQRUi0LZikTHNevqPPNGrnYbZxfhGmcOE8tX2
 ltJHAC8hk0sRUzk/dQzb1E44Vqm4yLyw7era4/7QUG55iUXBrJkQqcKyJWC7TzYiTNAc
 p3NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqo0hWi3/CfctzUePevZJwM7x5Unkd7azXlwu3d0GspX3HrhvcrbU3ZSqLMlk/+6JXGTLmnXtOnw==@nongnu.org
X-Gm-Message-State: AOJu0YxbLqC0zihDaufVAKjTH0WmNp3oAvCkJwoUEsGnpn3ynq985kWB
 PhQJT/4E9vTFSZd+Jl5jiI9SCzvUqntZRpTnGt3WiZwxq0JoOVSBN4UWKbJa2rrxHg8=
X-Gm-Gg: ASbGncstmApnGu8KqNUQ3McbMTiVULfB2peXHzkogGh78Kn9HRpWQ8wD0KMpl1TOSvH
 fF9POWQVSaj4sSKQzANNCS9u97TYtB1uLZ+7dWM7xIZLaGBmI5wAj2Ny2XoEX7caNh8ICIbALCZ
 u+pu9CZaiBKvbkPR8rePayr5OdJzdBIZ7vEXULkK8nRyjNweoAgu2bh8YqXDiD/65oXakcmGJK0
 yKxksdVl3/bBBI7CTNpL8uWU4DlNxesrKhc+6qMbjVqJi2EP7+irWGN5dn5KWPCWOp1uIwvAKFX
 c52fSP3UGOcW9aPWaU92r1e5WGGavo+IbDImuENcYn12Yczq+gXr5yU/gfjQoqTwUbOAwQHMB+J
 SdlZsJSx0/eKhcR1iWmvsdw==
X-Google-Smtp-Source: AGHT+IErVAIYG+ZivK0tp9L4ZO2CAyYDXyBRtGWk5IQIXLDMyxQxQ99iYzY3K+k1a49xo9eHNhCr6A==
X-Received: by 2002:a17:90b:2d08:b0:31f:28ae:8709 with SMTP id
 98e67ed59e1d1-321161ff633mr2008864a91.8.1754090782807; 
 Fri, 01 Aug 2025 16:26:22 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3207eca6d3asm5628217a91.23.2025.08.01.16.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 16:26:22 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 07/11] semihosting/arm-compat-semi: eradicate
 sizeof(target_ulong)
Date: Fri,  1 Aug 2025 16:26:05 -0700
Message-ID: <20250801232609.2744557-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
References: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x531.google.com
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

No semantic change.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/arm-compat-semi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index e44e910696b..b56d882aa52 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -787,7 +787,7 @@ void do_common_semihosting(CPUState *cs)
 
     case TARGET_SYS_ELAPSED:
         elapsed = get_clock() - clock_start;
-        if (sizeof(target_ulong) == 8) {
+        if (is_64bit_semihosting(env)) {
             if (SET_ARG(0, elapsed)) {
                 goto do_fault;
             }
-- 
2.47.2


