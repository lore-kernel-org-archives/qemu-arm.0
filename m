Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1587CCD18E
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 20:19:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8lJA-00024H-Oy; Tue, 14 Oct 2025 16:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJ4-00021d-Vd
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:07:38 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lIs-0005K6-AE
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:07:38 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-b555ab7fabaso5286089a12.0
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 13:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760472442; x=1761077242; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z1lTFXn6uKuCiyCV0s/y9SEm5jCxZH9j54VQidGTnOE=;
 b=clv/snpUmw92lG6VX1H7vED5jSjGT1uZGgfRAY/ch9YYcu/sKydyvLFl/+O6BQ770+
 RYUQJFzBA5EDcn38k5Yf0I+jFBDKY7u9ml4LbKJZINeEoq8e6LqMlX76bYctrxG+7iCs
 LVDA1C311n14osUblOs66EqgF5dCsrMSstEjpnvx12KyXbs8MFso6YxLeZ4avdxSehMS
 Azxv7cc+nKwt/0uJaFazGnwJY2d5t5n2wFFlOhSuMVBAs+UQLfK510jNlrv7aO60fmzy
 xsEm2uPHoqK1Xjgz0weqqHgc7I5UnvC+BH36BZsdJqGuXb4Ove1szSClYOcH2DVnS0Rh
 6NKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760472442; x=1761077242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z1lTFXn6uKuCiyCV0s/y9SEm5jCxZH9j54VQidGTnOE=;
 b=J0b16jOidigzc9V8WMZruBiLJEYhwl47TLAu4Frda9uC+b0IXGjOv6eOiKFFZsvJxn
 JSQtaerkn11D2PpPS2nWROOCvVjm8gEFZLUdu93JrrN/AxIXBeEuK5qtgQy4cESOYn92
 e4NtKoNUywBHbGLdX5OFWRjuQeq69eyBRFWqnXr9Rd0CvWzN9amjMvqBol7i+aQMBJWj
 y+JWFSQUXkFEG7TpPydvgyi14z9cqf3Dmv8UsSJH2ndl0Gje1uKpJuLknWBQ2+143dHx
 TvAfDb23LuoAC9ryB+/TDlw1ivi6ptWu6flyAcLBLzWbYyfgFrCD0AOmKBq5OdCpqW9b
 wd1w==
X-Gm-Message-State: AOJu0YwkZkZlX1aZU5FxuzWbou3nSABEowGotVA38Pe6e5TRrjckJ9gr
 AIYKgUYC4ZclyibA6of1930je5M2cC07l7a/MJRu4D512H0uh27LA20bQaKDzjcUp4QN7GmrO3G
 gmEmNiyw=
X-Gm-Gg: ASbGncsSEMkc4EDwDmHlkRtFiMrRprrn0u26HjYxi3+bjp8+uqrXYGpRxVF1IHyv6MM
 GrgsqPAbD2OHbG/V2XnRlcfVAeoDxrss/rOs4i4M7QEs1n5thE+R+JTUfsC3N+cDu4XowJ/Ikxj
 HuITQyhJNh9BNtm17Jyyyq0i8JIyBEQxJnFszmtd96IlneiJC/qEPMYNmW0TWnGfjW598my7g+3
 vHx6eFBDTaqntRGTvVndxsNKQiO98AUd0PIrckBO6J0Inp9/OsBkN6I+3KSBGOL41zyDyj0ka1J
 G+IIcV1RzHN6Izo3anWmD/Rst2Kb0kdzXf7vGAkAbVba9Tv3vV6JzJbMh8BVh/HPz3u/Ou6iX8r
 65dSAPW3GBLpoHvXQQ/qDCZTv7rkzYY2aTlfk9/dv4BLxj7bDQzuZjXOup2EEPQ==
X-Google-Smtp-Source: AGHT+IHAu5TFFyFx1nMwVkb1PXZIOMOpGle0COxxdWE7E6K1YFCbxJa3M8xJ8WIMzN2izlLCMsfW8g==
X-Received: by 2002:a17:903:19c5:b0:27e:f07c:8413 with SMTP id
 d9443c01a7336-29027356911mr278840405ad.9.1760472442010; 
 Tue, 14 Oct 2025 13:07:22 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f93ea2sm172100975ad.126.2025.10.14.13.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 13:07:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 04/37] target/arm: Asserts for ARM_CP_128BIT in
 define_one_arm_cp_reg
Date: Tue, 14 Oct 2025 13:06:45 -0700
Message-ID: <20251014200718.422022-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014200718.422022-1-richard.henderson@linaro.org>
References: <20251014200718.422022-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

128-bit registers are aarch64 only; disallow non-zero reset values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8c0b8889db..3b06704963 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7805,6 +7805,22 @@ void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *r)
     assert(r->state == ARM_CP_STATE_AA32 || !(r->type & ARM_CP_64BIT));
     /* AArch32 64-bit registers have only CRm and Opc1 fields. */
     assert(!(r->type & ARM_CP_64BIT) || !(r->opc2 || r->crn));
+    if (r->type & ARM_CP_128BIT) {
+        /*
+         * Only AArch64 regs are 128-bit.  There is usually an AArch32 64-bit
+         * register aliasing the low half, which must be defined separately due
+         * to encoding conflicts above.
+         */
+        assert(r->state == ARM_CP_STATE_AA64);
+        /*
+         * All 128-bit regs are UNKNOWN at reset, so there's no need
+         * for either resetvalue or resetfn.  For those EL2 registers
+         * that become CONST RES0 for EL3 with EL2 disabled, we allow
+         * ARM_CP_CONST, but only with value 0.
+         */
+        assert(r->resetvalue == 0);
+        assert(r->resetfn == NULL);
+    }
     /* op0 only exists in the AArch64 encodings */
     assert(r->state != ARM_CP_STATE_AA32 || r->opc0 == 0);
 
-- 
2.43.0


