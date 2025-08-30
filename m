Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926B3CA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 16:09:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNvr-0007SY-Vd; Sat, 30 Aug 2025 11:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usELo-0005te-1E
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:42:09 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usELm-000479-1M
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:42:07 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-7722bcb989aso1213232b3a.1
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532524; x=1757137324; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LrpEbuupTDGPoF+9xpEpdSwm7VuWd0B4c9SgIZ+YWys=;
 b=LJRF4KyU9n/MawfX1isa1ADVuocxTE02V60mF2mJ++wZ8/IGHenWrbpENBxiRBSt2/
 VPPkktd65boWsvwqxKNDGVeAwBh4oocR2W3sV6apmf9mI4lGvvydoNfZIeNvzMWxmUgJ
 soiv9KmQWDdVL6aoy+bCW86RfGC6cmwBS7CIVV4Nft/X7UULZzu1TwMkoUDtVo9NWOzb
 ttD+oKflGXs6EtUbAiEGIzgMTrzW0KNLR4g8GBqeqpeZYroQ/BTsuvT+g499YM0pDGyB
 0/MWv+OXmv0F6IeR+89AOHEEYLqvGNEv12vsvsgUGjvDUrgy5alKcXEsLkFDjxU5rovC
 Ghrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532524; x=1757137324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LrpEbuupTDGPoF+9xpEpdSwm7VuWd0B4c9SgIZ+YWys=;
 b=uMug9CyB/fYSG8zpzMn/95Ih6m0zKyfuJZErnc45s7PGcq0LAUrpH5QfZdu8e2F6e5
 rSo89ijdYJ+jdc3+3bwXSLa2I7YwxFswACTAL+rvMLDQF5fh1zobn66r7wEqME+JB41Q
 uX3N6mGxRK/RH5AhpAJtToCzLACaZwi5SbB2PHglakjdKWCx8JD4olz5182Sm1TzxV/Z
 Y8zDl13DlVnB1BGnxyWJiEneZeruw5yCv899fSh++rHlWF2PqRf+U44U05vOOczx8bPW
 VCsZKfDhUAHn7dNmPPyk7iKvTzGB4BYPic6QykZg0WUpa+HG/BvtJzvisj4edYpebyRb
 Zv0A==
X-Gm-Message-State: AOJu0YzlazaVrtNLK0HWCu4dbAMMQOWOwlaWucSfgdmd7FY1/jinnihM
 mMC3jDmWE1rC86zhaPhFXYVM8Sn2eWTGmaszGRuK+hDUMgN8gPDWiM8ttcxOB4W+oRM=
X-Gm-Gg: ASbGncsNGMKlsej2m4d+tZS9hmjhOQvZ9E25aC8p91RJUMAYYbJuWACfJxwLd58uMb2
 o71/HdHfHYZku2b7hxor0Aq4477HtyCh48lsLBFk9P/Eg+15JsD83CL51E6gSQ1ecDL2DaBheQX
 VdosX2YI8uDYlO9AM7FsyROMLG3HZoTlWGfJ30xnSLZkMXu1+qC+ac3RSxrjtUArqqnzWw2XRRe
 qbpI98uUhcA0xsUyt+V2bK7swqzFUARW88x7d947txhZENYs9W0ELFaJy4tM+xTue8y31tgGJib
 1cJ9Sl/BJqpNM903gb0ace5pjJsCarjRLksLtXVCpMEZC93U9XYhk1pj4aP5Ut3nw+b0dd5+pfG
 CSTOfeI20gGodQRll72pmOcLSEchKd75nFKmT/ab51JakwimcZNKrF4FdWbaH8Lg8tY1l9L4=
X-Google-Smtp-Source: AGHT+IHpdXZmyMUkWaTfqEEtPerDgTDkW0FSrovCVlJ4lrOJoYSNB+/7ShR3lje9DJpc0axVBM0cTw==
X-Received: by 2002:a05:6a20:6a25:b0:240:1327:ab3e with SMTP id
 adf61e73a8af0-243d6dcec6dmr1381147637.9.1756532524151; 
 Fri, 29 Aug 2025 22:42:04 -0700 (PDT)
Received: from stoup.. (122-150-204-48.dyn.ip.vocus.au. [122.150.204.48])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4d96829a66sm2435905a12.6.2025.08.29.22.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:42:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 11/84] target/arm: Remove outdated comment for ZCR_EL12
Date: Sat, 30 Aug 2025 15:40:15 +1000
Message-ID: <20250830054128.448363-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

The comment about not being included in the summary table
has been out of date for quite a while.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5a219703ae..11e1c52b70 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4563,11 +4563,6 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
         { K(3, 0, 14, 1, 0), K(3, 4, 14, 1, 0), K(3, 5, 14, 1, 0),
           "CNTKCTL", "CNTHCTL_EL2", "CNTKCTL_EL12" },
 
-        /*
-         * Note that redirection of ZCR is mentioned in the description
-         * of ZCR_EL2, and aliasing in the description of ZCR_EL1, but
-         * not in the summary table.
-         */
         { K(3, 0,  1, 2, 0), K(3, 4,  1, 2, 0), K(3, 5, 1, 2, 0),
           "ZCR_EL1", "ZCR_EL2", "ZCR_EL12", isar_feature_aa64_sve },
         { K(3, 0,  1, 2, 6), K(3, 4,  1, 2, 6), K(3, 5, 1, 2, 6),
-- 
2.43.0


