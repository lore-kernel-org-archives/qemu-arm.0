Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4277FFB44A6
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 04:34:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG8Ck-00081w-GV; Fri, 24 Apr 2026 00:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8CI-00072b-VY
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:31:30 -0400
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8CH-0002pC-3F
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:31:22 -0400
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-66ee7b9af94so2986169eaf.0
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 21:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777005079; x=1777609879; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q/eF6UxrydbmzCRXNoWVc07UBJDv6wjeDkTY/rB2YuA=;
 b=aZPv0wcWRKB0WCLuIIrGtjUFdMQUUyVL+Anzpa1y5ycsmj+THOSTvz+q+XertMzDnq
 K0xp7EbiyHKTqqr6LJQJrMpLIVhoKtDalP2OMIvBNsovLJPhCSXCh+9rpG2Yld4tIZFW
 iNzSdwV74PoCAV3vpmtW/epMLb8x481ua/AFF5HJctq3g/pwE+ICyPpCRqj75J7v5zRR
 TbS1IggoTx83R7/Ap140CJbVayPYpQGnEIGveRLas4tT5nP+TDRqKxasG1FrzlHcL0RA
 mHqQaiUFiZECzn8B0IVwtF/KQ3ou+JDbRuxSsdHKmv3mgXpkMtz92vlmyViLM5gEcrbq
 OTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777005079; x=1777609879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q/eF6UxrydbmzCRXNoWVc07UBJDv6wjeDkTY/rB2YuA=;
 b=gnL9MtYxSNJgbVw1ho/EBijy1nmrxtnVmK1K9VY+1BXU6I6u0zJabEXMbBz3aBPcZ1
 kGnl4ITvyExBj7+cMwHT52601TsESTdWI/44R3OLXCPM1qpNRhvDI6pkO8+itpTZTr2t
 8meM6mPImpoVrS8RIFCYO4H1da2++FG/w5MOgGN23vDW52LHXHDxbkU7B2fdmNJGTiKT
 JjMRgtRaI2WTEpu9M1Ov47sK9Aynbo5+qvURaeHL1K65lhVJznxib9pIV8f0Ti4HHqW5
 cRhyXPMoEHTlkU0yPo3daV3cNdxjc2YWAwMboJa/Kaw/gRv3cQwVyXfOk8XcL6uiIYHH
 j52Q==
X-Gm-Message-State: AOJu0YxX8AA7HZqjrSFcbHeAVJsN/O11B2D6HE0DICysTDCknmClVqBu
 0P4LJcA/5kWbCFZDAhDsGY00htaDAv9daNrxN8OWWa8gu3aF93Sm+DdhqLcwm9NTiAPaM9dBIjY
 KtF/dRWQ=
X-Gm-Gg: AeBDievEweAcAHV/2obpjtCFliIylabmWH7Bk8cXcLjj9RqtkHB2vRmF4uG02dtI7Q5
 qh2qbRlXiOH+6ksmyn02LxuLq6ko0EyATYKVcJYtjO+uZUZe1EMzfIgpsIqXQa8J2EX7PsBUawV
 MrN/GXZv+SkbT8YCD5ORmpZ4d8ak5dYEz8SFP3DPdALoEMRdkBDBNaPQW1by0/DUBzSYmVMphAM
 PBk1JaFgfQJJ1ePpQa/kEpit20JklymOpchuA8sKkfeRl8QN+IkcnWn21CXREV5tUBTkO1542mM
 S2XnZ0phgK+BYCS6PqrzFiDTnWqkFo8DSdrehdc1s+4AuyWwAqIQfyL0I2OBT5+VvkGVwbAFymy
 uKk63TbjGUeCNiWOxyIkq3geHiZPCNOScVbqv2niSuPXf1L4mfthTcvyiZbVsWTCpfKLz9JEbCT
 OR461ZIWhE4W1RtSeJI9aFpuDRdnO1RLbi+Pz11YXVJpIE5s3g1JC3HuwobYAt3Q==
X-Received: by 2002:a05:6820:2916:b0:694:9910:f77e with SMTP id
 006d021491bc7-6949910f852mr8608586eaf.4.1777005078698; 
 Thu, 23 Apr 2026 21:31:18 -0700 (PDT)
Received: from stoup.. ([172.58.183.19]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-42b9ac54ec5sm18880864fac.13.2026.04.23.21.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 21:31:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 13/40] target/arm: Trap direct acceses to FPMR
Date: Fri, 24 Apr 2026 14:29:47 +1000
Message-ID: <20260424043014.46305-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424043014.46305-1-richard.henderson@linaro.org>
References: <20260424043014.46305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ef6038e98b..d132e051ca 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2898,6 +2898,10 @@ static void handle_sys(DisasContext *s, bool isread,
     }
 
     if (!skip_fp_access_checks) {
+        if ((ri->type & ARM_CP_FPMR) && s->fpmr_el != 0) {
+            gen_exception_insn_el(s, 0, EXCP_UDEF, syndrome, s->fpmr_el);
+            return;
+        }
         if ((ri->type & ARM_CP_FPU) && !fp_access_check_only(s)) {
             return;
         } else if ((ri->type & ARM_CP_SVE) && !sve_access_check(s)) {
-- 
2.43.0


