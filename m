Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC91CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:09:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cD7-0001AE-7B; Wed, 08 Oct 2025 18:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cD4-00016W-Cv
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:35 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCV-0007Pa-FF
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:34 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-782a77b5ec7so259032b3a.1
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960795; x=1760565595; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TEx/hrefNIXj4jtd/TlO4/MQQCdcfyzeDKOCLqegICo=;
 b=JTKwqwI5+W4eT6nHHfY+8Lyb9mv6+QydhnK+n1OKuFkGQFEvf9tFBUl1kkciMfFQ5k
 3aKq4Qn3+/7AgDe3WpMF9rqveNNDBp1J9Vxt0/ZKG+ParYxG/KI8LZlW4548aCbkfxpG
 QgX2gIL4Gi9CQRHarPAEkSze3D/e/SgZnkc0UG/LUh3OqtFx9QFBNW3Ket3SYVteYI/M
 ZtPAwXQYrEzHaVEyZ7uN/++w5ZqBoaoE4exGqGyFvoHnWMgQ/xNprZODtVWifITonMk7
 FgmKfnZ8KlIZ2FJjsMgDVatjn1/iEYSbKCvyCbHIiE6t5pu3cvuUG27G5UXNbeJjkHiZ
 qWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960795; x=1760565595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TEx/hrefNIXj4jtd/TlO4/MQQCdcfyzeDKOCLqegICo=;
 b=IcZjpCtCNNmQc3CooAN7kquvLnPFlrGB3zzL74Sn2juDTO/IAi8eZ1hBc2MnRZoYVS
 R9IzoFpzWEIAbp8dC9KhqZdAQD5BxsQLQwnFk7l4MKsiORt14n4vLfXkbrcO/VRtlpMT
 zSIK0h4RB5KwC76du8kDpjV4ez8SNtL1+3h2dLZzWnJrhCIvWLVEj9lxOyi5oSj/o3MA
 BD2NFu06T3ST1yZp0AtC+vt8GEGhQpvxFLiHipfz1pu9K05RqwQft2slglPdZIW1rfkT
 0j9TS9Ay9YfkEWC+oBuNSdwbucLufJPqFO1IBTnqcPhmhkMrp9JAfGyu7zyhn2u0Rnkl
 1i/g==
X-Gm-Message-State: AOJu0Yy8tJIY4DrYLKwvyD2Dhxsw2HM+g+JPj5aMN3fcvJopM4mhV0RX
 NM1Gb/BNfrOMhQfA4BaEpCB5oBymUHXap+ICO3QXD/2OaIGykY1QC+ozTedTnuPuLyNvbMEQKPZ
 65f+UCco=
X-Gm-Gg: ASbGncuwHU0Bp8yG5t78Emhn5k3KD3kYuyydGeNO1fkkMRJOrybd34jzP/rdLnBNywo
 RY8ruK86uFZHlLBmCaQ5CzWPMl/EI85pzX4C3ttiOadpIOiiXno1s7jErE+4HzmLMV/253EqiHL
 Ng3n1mwaT4rOnjpqPBt7ffJV0H1xC5yjw+MwhJJU0ZfmMzCbt6Fwb5yvuIIQoeUiKi7h5+TMVCh
 3g4VltCbYjLp068on3UJHk8XPnbroN5s30hxLHuRheJZhmi0IohGwZXY9dCVUGRVTtgu4S65ucA
 I2Jh7HHt6oJTA+BJ9wBnqEWiLxZk1KqD5AFL7YCXrC7OBgnP0bo0NQ5we+bfKAYWWMvTykDDJL0
 4ItXvT2HYefKGtpdbldK5AYj482UHn0ykdJaY6FNJCU1oxgzgV+NXPEch
X-Google-Smtp-Source: AGHT+IGxAYr7EXhoVxc33ZrksSl/Em/ypRuYiR8x3fnF+qWRSgdjD+LZ9glAjjXmy6ENOW6UvZt8Uw==
X-Received: by 2002:a05:6a00:4fcf:b0:781:1916:c5fb with SMTP id
 d2e1a72fcca58-79385ddc921mr6387565b3a.14.1759960795162; 
 Wed, 08 Oct 2025 14:59:55 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-794e1fc9db6sm740724b3a.66.2025.10.08.14.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:59:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 62/73] target/arm: Enable FEAT_GCS with -cpu max
Date: Wed,  8 Oct 2025 14:56:02 -0700
Message-ID: <20251008215613.300150-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
index f024db1d29..cc42dfdf56 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1280,6 +1280,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR1, SME, 2);       /* FEAT_SME2 */
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_3 */
     t = FIELD_DP64(t, ID_AA64PFR1, NMI, 1);       /* FEAT_NMI */
+    t = FIELD_DP64(t, ID_AA64PFR1, GCS, 1);       /* FEAT_GCS */
     SET_IDREG(isar, ID_AA64PFR1, t);
 
     t = GET_IDREG(isar, ID_AA64MMFR0);
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 68d9a4e734..4496178c48 100644
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


