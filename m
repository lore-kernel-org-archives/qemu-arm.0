Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7A7C5AC80
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Aug 2026 17:28:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ws1sM-0001Yv-QI; Thu, 06 Aug 2026 13:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws1sJ-0001Wc-Nc
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:27:23 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws1sF-0000e4-CB
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:27:21 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-8487214ad2bso3842652b3a.1
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 10:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786037237; x=1786642037; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=x0GHCx+PLEdVxrjRrYZVoHQH2Ai3ea4uOXYSZWccrLI=;
 b=FQ0vFrXm4VuMohgYNP9Uk4RX60JMo7koEWgDIigQ7aE1gjr+aP+WFhtjKBRfJenD4Y
 LuSNo1Ersok1xAZWTpB/F2MrNCjSOn4EesrznjVZMCL0Q0eqnROxCkxVFhaMsD++cl41
 EhwI6DEWDasPlBsgVMMAvqja70rIG544RApz7QjRa6WCAd+kj2ohdrK0SY3azLcWTSAN
 4eN+5NRZz1ynXCl5jdWaSxs/yYdyDoF2o76SKxhdpsP1msTb05nPtjYIj05pU5cZEhQz
 8SgapOPB5WsMiw9K2/USSCyC/D/JF8URtSlxz+vn030VShhm+j5OMEUQ1dOJWevqjJGW
 i5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786037237; x=1786642037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=x0GHCx+PLEdVxrjRrYZVoHQH2Ai3ea4uOXYSZWccrLI=;
 b=aIjSn2GAenUIKSVEdejyvujgqnEqRIXidLyB6Gtw6EHkKZ2MqERJh9wUUUNoNnn5pM
 d4vxqvK1UTBdqx8iNMpB2Nc6UwYYSwuwZgx3lGmrO49+nT6t7FYbgCsqeqJiyG6gIk1e
 y+4b+b+O8kowUiUuEUEBE2O0zNRkz7Houpm7O+yMARBWCpmFDAKvoJGFYd2L2seKE3rN
 KARYySu+n3deT8ujF36UBZmV3Rh7gGn0WISGhTv+rAgJxqme7V0zilxQVWOsJ5EQYFL9
 9Zso4mKreiztDrUN94qOxrWlMSD0Fy4NzMfMpgBWsPzp2i+vQKQIFD49HEKOFyLSsopG
 HKJg==
X-Gm-Message-State: AOJu0YzYoVHcUrOcPdDDwNtacn1lhN4SbDtibyP332csdJ143WcPXQU9
 PavaN04rPdY0nQAzLei0ADBQR30wIZnw8+l4KbFAPVZ2t6GWIycGWZtyv1r76bppc3c=
X-Gm-Gg: AR+sD12qtpMlBjeBvCAi2ktzAbtB6SgLjDoOQ34nP+hHOXWDCKQ8DBF5YKbkZQu0FX4
 7Ubwv48QtRSo63EhHTVsVgCBmKg7khzsTl5XLdH/UAV8VzCLTgCyRN4TlcHbyR9HdgKz9w2uLSK
 Vg2rQ4/ygEIXf0Nds91xQivQznJvzJFE4EB0d4RKGEiSd9ChFWm4qfuncjbD76iJH8QWNCIHdCY
 vsPowF5j5v9PRQaZ5HoX1qowv7PHUOejnIPU+E6JEcbfGd3XhIapP20+3Fu5QWr4EiARgCRKkkf
 QSh7r9Z3EycftbwJniqj7+n11qj0gX0SjJlepH0YZQRpNmt5fjjAAwP3UHkLXiRcGgTeu1li+iW
 CCLMLoawOL4C6jHvTMmlyo9bbzZWs8SlP153kde/9ZVHvtoCXXXXYas7s/M0uKA4vQgkJPRdUPg
 Mn7G2hIiGgsIWLkWxJJbQAYSzh8yAeXToDTnZ51aPGRFVdU0ESAdNr/QNfo4cng5Kx1lpNiAg/d
 uLjf9wIEQEFqSKdKWJs
X-Received: by 2002:a05:6a00:2e10:b0:843:49f0:f5a0 with SMTP id
 d2e1a72fcca58-84f2e0ed3famr16816416b3a.32.1786037237211; 
 Thu, 06 Aug 2026 10:27:17 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84f45389e68sm1803272b3a.4.2026.08.06.10.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 10:27:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 6/6] target/arm: Enable FEAT_FGWTE3 for -cpu max
Date: Thu,  6 Aug 2026 10:27:09 -0700
Message-ID: <20260806172709.333300-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806172709.333300-1-richard.henderson@linaro.org>
References: <20260806172709.333300-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 9cd2200823..4b9d01420a 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1462,6 +1462,7 @@ void aarch64_max_v9_tcg_initfn(Object *obj)
 
     t = GET_IDREG(isar, ID_AA64MMFR4);
     t = FIELD_DP64(t, ID_AA64MMFR4, ASID2, 1);    /* v9.4: FEAT_ASID2 */
+    t = FIELD_DP64(t, ID_AA64MMFR4, FGWTE3, 1);   /* v9.4: FEAT_FGWTE3 */
     SET_IDREG(isar, ID_AA64MMFR4, t);
 
     t = GET_IDREG(isar, ID_AA64ZFR0);
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 3400de6b76..392db5ccf9 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -78,6 +78,7 @@ the following architecture extensions:
 - FEAT_FAMINMAX (Floating-point maximum and minimum absolute value instructions)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FGT (Fine-Grained Traps)
+- FEAT_FGWTE3 (Fine-Grained Write Trap EL3)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
 - FEAT_FP (Floating Point extensions)
 - FEAT_FP16 (Half-precision floating-point data processing)
-- 
2.43.0


