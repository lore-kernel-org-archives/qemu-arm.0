Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF21CAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 19:08:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lhr-0008RD-Nb; Mon, 22 Sep 2025 14:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lg5-0005De-Na
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:23 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfQ-00051T-Oo
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:21 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-b553412a19bso1444584a12.1
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567217; x=1759172017; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DxayGpcvk1WgEIrwtrnI87HtMykvmuTE7R78plec4rY=;
 b=LwHbNeeabulAN7CMWS11hWC5UFJGybtvI7ZZzXFg3bYUT1RzDWeYknGhq2MH6zQBK6
 tPUGs6c22+dvJNSPT3Cv6H4ZEEj77FE/zRCUyWsMmmfVhKTuvr+V3j1jdvF5KXGkZ9X5
 gJDy6q8tdufEmWmvA9akdgYumC1jx2592XFddkmP6kBoslDcCYX9v2QVSnvQY/ukB81o
 n9xbfQyoG/zWDsc6pFrHsIi4yulNdRO3ktxtDoLbStbyiAz9SykWsymurTYMf4KxEE3p
 GTpN+KoM5PqtAGe5XO74fek44PnQcwqNEVunI8TXv0T+QhT8EdQwgAGaEYvOaG0qrDuq
 eC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567217; x=1759172017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DxayGpcvk1WgEIrwtrnI87HtMykvmuTE7R78plec4rY=;
 b=hx2R0hJbIFBWt1E0K0T4fY4dP2Vl3kYJudAo8L/DImhaDDZSJUwRknWfq93ai9Jcme
 WxF+iwj0fi2j6IvAY3TWsCM/+z3xPc/0v5jDV4ncaQW8pDtsaDAUGwsfrqoWsICxoo+b
 HKFeJF4VgM17JGG31P3wndYiP2jL2OSOfmV/zGmP+HI3zZWlYSr4H2vkVC5PaQA7S2Q5
 QWY34goFvOIIzurA7pW12OC2hArEq5szSy/ILgR6ha7ibG7yLKX9jGVLqAUzdPlEQGf4
 zHahng6Cn6iLmtR21SnHX1UjPO1smqi85ieHoSx6zDXEekYzLzM+PV6ooJNpd6qca90F
 E/KQ==
X-Gm-Message-State: AOJu0YyhcPvlIVX8Aw+fc7JX0XA6BQ6J+W6c/h07T07owxFxgGL2shYO
 mHJc9a2he4PwHSN+OpmZ8G+R7TnQF/GTKPo6mkBguxUosNTe1/hUyVVuwleIbFsioqY=
X-Gm-Gg: ASbGncu9+364EHUdjasfefzIwcgYQky1TQ6xKJiqWe9s6DfRY/EdPDbSiva5Le1OjnO
 ImjKHRbsqYxarLRu/C7k/6ivDL7J1Bw4sVZhS8R8joNQbV3ITgEjUPtBQSXjXH4wQuE3JADhUkg
 LcRcTyDNOtb77nzfwbCEOvj0zdoClnREhHvy2+9T/VHuKQiyV/DhsRp66a4m/qr4cdFTQh1u+R2
 Qic4xbY2gpmHkxWNQL50haFW5z8CFgNr1F0MMegEmw/wGUs1xDdJDp+0PG33C5q6/nW8GTN9lVr
 fA2shWz3hkgoU6qt+kKGe72tMwzGWCd+mPHh0r/NFg1mAQMMz+PCmyT/QXO4FBEpNzsprk6g7Nb
 DVJUs0b82eza0p5Wft8bABBt6kQ82fQCKivwddJU=
X-Google-Smtp-Source: AGHT+IEm9BhY6XZh+EPo6/ymXEwgd3OZCdbT8xKrbgcmfPWJRCaeBcQuysGOQpYSyQtzzxvxkZYe/Q==
X-Received: by 2002:a17:902:be12:b0:267:87be:505e with SMTP id
 d9443c01a7336-269ba45a54dmr131390525ad.23.1758567216739; 
 Mon, 22 Sep 2025 11:53:36 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 65/76] target/arm: Enable FEAT_GCS with -cpu max
Date: Mon, 22 Sep 2025 11:49:13 -0700
Message-ID: <20250922184924.2754205-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

Tested-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 76193826ce..8ebb0a91db 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1206,6 +1206,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR1, SME, 2);       /* FEAT_SME2 */
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_3 */
     t = FIELD_DP64(t, ID_AA64PFR1, NMI, 1);       /* FEAT_NMI */
+    t = FIELD_DP64(t, ID_AA64PFR1, GCS, 1);       /* FEAT_GCS */
     SET_IDREG(isar, ID_AA64PFR1, t);
 
     t = GET_IDREG(isar, ID_AA64MMFR0);
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 4b07af9eac..21c187a464 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -73,6 +73,7 @@ the following architecture extensions:
 - FEAT_FRINTTS (Floating-point to integer instructions)
 - FEAT_FlagM (Flag manipulation instructions v2)
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
+- FEAT_GCS (Guarded Control Stack Extension)
 - FEAT_GTG (Guest translation granule size)
 - FEAT_HAFDBS (Hardware management of the access flag and dirty bit state)
 - FEAT_HBC (Hinted conditional branches)
-- 
2.43.0


