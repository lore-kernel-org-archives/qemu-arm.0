Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D782CD3445
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:48:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8Rw-0007Ju-P0; Thu, 07 May 2026 19:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Rh-0007CG-Vy
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:47:58 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Rg-00025e-5H
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:47:57 -0400
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-479d9b155deso520923b6e.3
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197675; x=1778802475; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VOxj2Q+DoRg1m2qRsmYYEc+CXl7kO95lm+84NlFi+CY=;
 b=hj+PIk2PWHWAS3AAxghPMS+4goMnKRfiS1/7JZYKMDrY4QbaFl73fsJwT0huq3SN/C
 Zozp8LEIOr7E63JGdC3cVdd1MENZ64d7zpsOcQMHMtSoYeoSUryhhhc6l+1sGeieSf8p
 Vj0Z0jOSqN1MJOF0C7D+ZXAoL8DYSNmJSHVxGFkihhO9yNpxsRn8OncU2b1Km+g3AEmO
 LV+x/BxkzQBXvStxZCjwRGqy31DLOQYQhRwbuCs+s1CAmw+NjN1bM1m4smtXGwgF8A/e
 BBQu4fsxEX6UIRJH4rPfZTdV4IW4fieNLTXcJXV9Jc3RH8QO7LlyJk1joghKtGzdB4vW
 vxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197675; x=1778802475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VOxj2Q+DoRg1m2qRsmYYEc+CXl7kO95lm+84NlFi+CY=;
 b=KKBo4s8gNto+8AWszo5Z3SGswEDy7vfMR0U8kerUTM51YUt2Ff0FzjpSNnG+zz/F2h
 uEbBFk06p76qDUHRDD4A1yoQIrs7cS6tsE0iKT8/jAuuQrK3z5Xn2H2syj9imc72gmI5
 WQFSkhHj5egYBvsT2ztGFVJSzkLNcoSI4uHjNnz2Xj17taqSPpiIQV0r+r/5XoLDftpn
 UIGHglIbT0gYsL82rmR2bLF3LRQJNlowl6oQOKyKA1h4bk0jWGIUBbjVehGnwo0f9NuX
 DvKEVDe5CCJ97OLniScbZ0VEtkVfXmScSUq3rjqg1t0u092AVg5SXyA4gYW8b1oONkJs
 heeA==
X-Gm-Message-State: AOJu0YwUi8I2QW5+RnwfcmkXleA3WAlriMAKXikHomXSD8VjaOPBlp6f
 IiLUltFffdndtkWp4u0SdDDtyq7zSsHUjIqcJqbxDlk2NfTErtsJr+BApMAW7MWnkfg=
X-Gm-Gg: AeBDies3Wumfq0BvIncXIEDrc+6l9PjrpL5q3YJ+dP7veN5kPH725lUAEFjoeWqmApM
 bk7ZEidl1j9fTdu1h3F7oB38PYsssrZc/cEvhUuuo4KlbUzE/ConXWg981soLP5X2YiyPK8Owfc
 50DtrT863ISwVOFZbrqETPYHccs22X+UCcihGH/9zVOHXn0WAgWoEQMBgDku1p/1D//ttMAIFSq
 K2TkvJOrcvW10CnK46r7EmeH377I6OARef349mkDEalVzsB/QZx4Ye+a+3ZXTe9n30to8RhzS1W
 YSTR0NLP0+rmCw6wK041xrbvUq+Kn1/TcrBVC/cHXRjm5mMqocHye0LRVXiwK4IVyPGnxD8Hrxz
 HuKa8dHMSgt8oNrW4XS9E5pp1dYofa6z5KcYGDrFlIFi+WklxpDiXKYrkoxvQh55vio66RxqSBO
 2sxC6vr4TidjDTsEOQtVOexO5+XP7KJn3aZ6JgyQVgUjuy/w==
X-Received: by 2002:a05:6808:e656:b0:467:2a6e:adad with SMTP id
 5614622812f47-4804220b8b9mr4568342b6e.11.1778197674667; 
 Thu, 07 May 2026 16:47:54 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4355736f517sm242730fac.12.2026.05.07.16.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:47:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 40/60] target/arm: Update ID_AA64SMFR0_EL1 fields to ARM M.b
Date: Thu,  7 May 2026 18:43:53 -0500
Message-ID: <20260507234413.643512-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
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
 target/arm/cpu-features.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 47294eb807..684d635433 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -396,17 +396,28 @@ FIELD(ID_AA64ZFR0, F16MM, 48, 4)
 FIELD(ID_AA64ZFR0, F32MM, 52, 4)
 FIELD(ID_AA64ZFR0, F64MM, 56, 4)
 
+FIELD(ID_AA64SMFR0, SMOP4, 0, 1)
+FIELD(ID_AA64SMFR0, STMOP, 16, 1)
+FIELD(ID_AA64SMFR0, SFEXPA, 23, 1)
+FIELD(ID_AA64SMFR0, AES, 24, 1)
+FIELD(ID_AA64SMFR0, SBITPERM, 25, 1)
+FIELD(ID_AA64SMFR0, SF8DP2, 28, 1)
+FIELD(ID_AA64SMFR0, SF8DP4, 29, 1)
+FIELD(ID_AA64SMFR0, SF8FMA, 30, 1)
 FIELD(ID_AA64SMFR0, F32F32, 32, 1)
 FIELD(ID_AA64SMFR0, BI32I32, 33, 1)
 FIELD(ID_AA64SMFR0, B16F32, 34, 1)
 FIELD(ID_AA64SMFR0, F16F32, 35, 1)
 FIELD(ID_AA64SMFR0, I8I32, 36, 4)
+FIELD(ID_AA64SMFR0, F8F32, 40, 1)
+FIELD(ID_AA64SMFR0, F8F16, 41, 1)
 FIELD(ID_AA64SMFR0, F16F16, 42, 1)
 FIELD(ID_AA64SMFR0, B16B16, 43, 1)
 FIELD(ID_AA64SMFR0, I16I32, 44, 4)
 FIELD(ID_AA64SMFR0, F64F64, 48, 1)
 FIELD(ID_AA64SMFR0, I16I64, 52, 4)
 FIELD(ID_AA64SMFR0, SMEVER, 56, 4)
+FIELD(ID_AA64SMFR0, LUTv2, 60, 1)
 FIELD(ID_AA64SMFR0, FA64, 63, 1)
 
 FIELD(ID_AA64FPFR0, F8E5M2, 0, 1)
-- 
2.43.0


