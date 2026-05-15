Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A12FCD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:18:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtH6-0007iO-7K; Fri, 15 May 2026 10:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtH3-0007WU-Vx
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:12:22 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtH2-0004GV-8Y
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:12:21 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-44c350a5b87so5677172f8f.3
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778854338; x=1779459138; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o4U8ZCCS2W/eS7opYuY30TphoIHkpy54aFpBL/IoRZY=;
 b=UrpgxejORcUs/HmEPuamvghNO+9Fp0342gzrkr5FbmVhKW8MKPQ+sJB+MKdOZo9Ksk
 lVwRGC6r8ztu7HBeVn/fTMqfs7ySPrRk5TdqyKPAEP7M6scguT85n/8IyKWgfIJIwHbe
 qqq+rVbU7fKHZFIaQBQdnDqOh6Ls7YYZZ0IbnOzQA1PBxwBTe0Kw15ufhxN/ZX0WG5Az
 YQOk5k/c3pinaBIw+gEo0p/erok6slqAgyfXHlXBCdWXiw2esNNS8s1EODfMq5AhjPyI
 XEDYGJA4YkPGHdJC8E4Qqwd+wUBTf+B92zbwJsIVFEczAWwu6ohHDtj7DSp3f+wEf4DX
 n4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854338; x=1779459138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=o4U8ZCCS2W/eS7opYuY30TphoIHkpy54aFpBL/IoRZY=;
 b=Gah/qUWX4DsHU1S7G95erajQLWGjkXtITBrHSq4ysYwQriZ7K05/L7IFz9ezNu0TtE
 kJHbXYSdkPzYn/g9Wrk8YVWz8m6+4kF3PL1my9mrqqEf1+CJhHUNU6/rNQaDzT0z8iiB
 zMTKpxIHnzQIcmaXdwfYQ/4snQaBTs2PVIIoVngpOA/T6/VIYu1Tj45vM8Ue7eqbXBu2
 HrbfjAKkqhRUhk/BnQn5zhAxdxDGewtgCd2v1xws/hM3YcNLWWHpsJWnRwAav9JxTysQ
 OtqyNDC4Jhx7tKJhe6ob04MPmsPAPP9JCziBv6EOZ3v+PKkm8T1lCu3DXcAdECVnoq3f
 aasA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8JdA8tAIU+OrgLoGRArHqYcNldCbs2WHf+WegCd6g5TL6R8r/rr/ay6gwrEJbEDALsMLERVC3MCg==@nongnu.org
X-Gm-Message-State: AOJu0YwdQ7xB3vcB5h3a3+yFTu+P8hzTXO06TmzDyto7ptc93mkwWyEG
 KbNHoHoV5yVlSreEa4bDRdq9JhJiHPIc/vEc5kVkKQJg7F3vGr4WaeERiyzeeUadl7w=
X-Gm-Gg: Acq92OHsJ8lCCtdeBpognjgzxCeWKgMhq+YGnJa+Gp9Gay8+zxWJZDajH91NVupXTxO
 m6+hLeQDm2GIIsW62g1nVWXnLcktGCEN2MUYWmH3sVd/5MiZ579SKKqFqDJxbDDR63iKBR+auTk
 CJPYyP/BnSXBYlBRt7mStWaDhaG183V525zkVYvw6cl8t29L4rplqLAvf0WGy1u8QFydlxWZ85v
 dn9mMASbnPcJ0W6Zgs4TUNQBOe+I6uUtf8LBROCEydPbCAdcLannWS/i9UnbQsrNIZY4tV8EUeN
 co6O0aHgCY8zTeYqa0aN6DffnnP2wGa0ovI4rd+evnche4AuSV2ycdgz5F84m4GgfidzrBwLxE9
 tnjSJhXu8qxlSlIbOuqXW6tvSURjsq+LrDdOskWVdrLAktxC9mFjlcfgvp3zkhoPAmAfM/JGsEG
 zS3twH5o6f/oAQNur9+LcoNPLV+nh+hdthr/WUr/I1+CA1nDb2aH6VSber2FatB5mLvL8QhCa+
X-Received: by 2002:a5d:5f90:0:b0:45d:3cb0:5ab1 with SMTP id
 ffacd0b85a97d-45e5c5f8424mr5697301f8f.38.1778854338158; 
 Fri, 15 May 2026 07:12:18 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ed30110sm16004845f8f.13.2026.05.15.07.12.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 May 2026 07:12:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v6 14/20] target/arm: Implement DBGDEVID* registers in max
 AArch32 CPU
Date: Fri, 15 May 2026 16:10:25 +0200
Message-ID: <20260515141032.3271-15-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515141032.3271-1-philmd@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

32-bit ARM max CPU is a 'Cortex-A57 advertising none of the AArch64
features'. Keep it as close as possible as the A57, by implementing
the debug ID registers, following the changes in aarch64_a57_initfn
added by commits 48eb3ae64b3 ("target-arm: Adjust debug ID registers
per-CPU") and 09754ca867f ("target/arm: Implement AArch32 DBGDEVID,
DBGDEVID1, DBGDEVID2").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/cpu32.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index cf643ce43b1..2e8afc28602 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -755,6 +755,9 @@ static void arm_max_initfn(Object *obj)
     SET_IDREG(isar, ID_ISAR4, 0x00011142);
     SET_IDREG(isar, ID_ISAR5, 0x00011121);
     SET_IDREG(isar, ID_ISAR6, 0);
+    cpu->isar.dbgdidr = 0x3516d000;
+    cpu->isar.dbgdevid = 0x01110f13;
+    cpu->isar.dbgdevid1 = 0x2;
     cpu->isar.reset_pmcr_el0 = 0x41013000;
     SET_IDREG(isar, CLIDR, 0x0a200023);
     /* 32KB L1 dcache */
-- 
2.53.0


