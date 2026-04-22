Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88396F9EDC5
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 12:54:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFX4o-00062m-F0; Wed, 22 Apr 2026 08:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4i-0005ys-JT
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:53:04 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4g-0005U8-19
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:53:04 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4896c22fcbaso28287545e9.0
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 05:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776862380; x=1777467180; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EAtQqYAVHVvhu80r9xI/PSbLS4M6sLMvc1JPbP3qMzs=;
 b=OJEzjJK0nuK82qlMmGRpA4OlWGyh+T7K+WoRlW2a+ZB4s9NLWvXzbTPzby2ltG3dwZ
 fHu/j/7i05Ae84wCz6qDIDbfLyAvn8q3tkzWHYmtySl6zoiFk+j/6jXBGtwh/sefleFb
 s3yk4QTPR9JnjYgdkFU+DuxDEOwNT84jTs47i+2i4+ytBDMTyye6f9Np4ZckWFxJlvVN
 1vpLvSrW+FAZyvoZJeU6OIyJ+qHhihC+7YI5wq2z2Vo1QC33ST2e+/TBrXlcUrXyStHg
 A1uRm25nhS65TUMwZ5E1254H7rtJI1wRzChCuxv/SfABs2NertYTqMP4Ib5I6sNpb0AN
 rdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776862380; x=1777467180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EAtQqYAVHVvhu80r9xI/PSbLS4M6sLMvc1JPbP3qMzs=;
 b=gICW+Z2EW2BFd/pBC1mX9g57thvUOcrwcDuSSzwEJ/NcM24KhRhYkAkg+JG5KO8Z+K
 xW68iBbD6LeAEIvRsH9FglEAF8IXTLM3k80wo3ok+psD21GJhwDA/6yn39e9rDRWcZrl
 A8av0SWwXBp2YaavpaoPLrqVCh7pvo2DjN0IHR+s5MnUGoTI6JMwecGZbsukcm7G6Yl/
 9vKN3qchRheh9ryZM4cnoXIIGRnVzuBQyvCyH9lVzvdHdJCtQFIl89Uwm4/TKyvuAyLl
 t2FkhALj9oRqYxRafKKoIuJuF1YSFIZ40xnbaimd0lVuu0nzxiZMisQmU9V1Ye4lBqgq
 Ezuw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/KIcZTUDa/tUQdmK33Mgr+/af9SPPzgfHr/51aTW95Iajcv/StA+vpiBhUdRG4gDvXYXRa5SWdYQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzcd2LBSzbVxznllY7y3vR45O8P5R4Jo9e9AaswBXQnkUiS8rei
 TmLg/ltbU9UbJs8Vwl07x5vnPYcbhAinJTw+KMRT7OGQX7jCVtHLnUx5rfcUC9fmjOk=
X-Gm-Gg: AeBDievORbSbM7Akt4KfaF0DppM+fRpkrRq/UMfjuuW/CmSdP37O/FjJnTz5zeg7PQU
 6zWkYCfoCtasnTC4BWIJHfOGxIXN3X875hmr1kbWJbABfyB65qzBVpFEReMPB+Ew79i3nQC5g6+
 YIcrpluPez+RC9Q0YP664sPMDwnR0OlL/5ZravwYAHPYjcAoU3xYD9O8CF3QzLy+W8v1QXeKFJa
 xLqp/81vf7SPpstxY7on9jV9OuSycRaqQ029kkEHVOmF1W03aDqDkcrHah8qUY02MiY02ZfAhDO
 q+rkej5nPWvroWpGGWl+TOgcsvBfwoO4Ev0QGSzSpbS7I4PnjW81GTbzBxog5qXuIf4D7E0IOKk
 dhtOSquLKL1ntHX3aEYYCjRdji4M2BVSNKUngFxNgbQHjQOwxFHnLF2URH3xEKJe7/BgmYh3oMB
 xNqVa/2LqcJ7cdVOonGwv/Hh+jNsfrWiKF7Q==
X-Received: by 2002:a05:600c:19c8:b0:48a:554d:b9a2 with SMTP id
 5b1f17b1804b1-48a554dba51mr117525785e9.6.1776862379611; 
 Wed, 22 Apr 2026 05:52:59 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a5aa3ae83sm83315365e9.12.2026.04.22.05.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 05:52:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7F987608C6;
 Wed, 22 Apr 2026 13:52:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 07/32] target/arm: migrate BTI trap syndromes to
 registerfields
Date: Wed, 22 Apr 2026 13:52:24 +0100
Message-ID: <20260422125250.1303100-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422125250.1303100-1-alex.bennee@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index fd8639d4f07..52a6745cb23 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -426,9 +426,18 @@ static inline uint32_t syn_pactrap(void)
     return res;
 }
 
+/*
+ * ISS encoding for an exception from a Branch Target Identification
+ * instruction.
+ */
+FIELD(BTI_ISS, BTYPE, 0, 2)
+
 static inline uint32_t syn_btitrap(int btype)
 {
-    return (EC_BTITRAP << ARM_EL_EC_SHIFT) | ARM_EL_IL | btype;
+    uint32_t res = syn_set_ec(0, EC_BTITRAP);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+    res = FIELD_DP32(res, BTI_ISS, BTYPE, btype);
+    return res;
 }
 
 static inline uint32_t syn_bxjtrap(int cv, int cond, int rm)
-- 
2.47.3


