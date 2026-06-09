Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8B6CD8CA8
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 19:29:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX286-00035F-LT; Tue, 09 Jun 2026 15:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX225-0003fJ-IN
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:50 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX21u-00046S-Po
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:35 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2bf18c30bb2so43051315ad.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 12:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781032889; x=1781637689; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JX7+OeeD2FN1dxWerp/I3Ll3/ZlzCTLqZCteUU7Y4Pk=;
 b=VwcAId3Pi+Vltg0h0eG2hDFd3mrG0SjkhwOHlpFYSTm65o/MehJu0oODJwCkRrXhIi
 BFeW8nMa9YLCTuVeOovFYixkhZJLrR7FYnqU8mLsfL1I0IlpIpSSyviyvmK55fMkVIk6
 kzpoDHRGknDKf00iGh4gp+vuvGNOFAX04orIW5x5/7iWwsGr04XHtdgu3c2/+f9S1Grf
 C/hpxlVCvhAOVeHw55w3c/LBSOwevM0t3x//yGKL2ldIJyUVDAR3HISBR/pEIzECfi3E
 /ttpPPQhaz1EuUhqqKIJ/5SguTLWMLKIaiLrUeIXeOVFa/Bzqv0uIz+Q6IuQhpvqg7xE
 lGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781032889; x=1781637689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JX7+OeeD2FN1dxWerp/I3Ll3/ZlzCTLqZCteUU7Y4Pk=;
 b=Z4/LqttNDacznpdwKn/xsKkXRZm0vRxKzTNLk800mWEbBiLctGfdpuK5nZrv3OlVYF
 yxp7JeWi2RiTwrZLhoA2NWBhdZAUxjrSCXsMpMIIjxanF6i/EkFPR5maYkFuker6DiAk
 6opGKdWkH6fC7PFxw9+kUlpsPs26NFNbuh1+ySL9JD+BcdOVrS7TC7Ego4NeComs1AEF
 9YE/q5H5LSL7hHXjyM3f4B+pMA9bnT35/EY0KkK2fDOc2Bj633SDmqlZP8zAq/GJdKGY
 yXFK63GAbsjMsVOBIEOosjQ2imQNz4DwQBO6MjyIdael+HpXGXjacAxRepuaz8KynUKT
 b6qg==
X-Gm-Message-State: AOJu0YwWG4ikaD9d5HufxOfVCdSp8Be44OnqIKpi/Su90BWr+/swAdYc
 CqOdL3cpCmcePAr9ysNQkO7r4IXezDAIxJD+6tF1tYhbR0hy/bGPIpAmSsENVuQ3vzM=
X-Gm-Gg: Acq92OFlVbcpxI4aeHzgAMlgDz7er7l2Q2F0bTuYEfaajwVhU8cX4YhjJOB96EZX/KT
 tUe2X+in8Ev+gHA8BcMm1+2NvnlDsf2h/RRkHq2R7ZTxG0n2rivmp/dWxx1tr0T5XVm22HezvnI
 pNdOq6kllRKG7JCLts//dGv+Ez3hMBRoHqlDIufgoQCB4NIIkwWCNJhAypr0+U2wOzhsVFpPXno
 mNZLPiWAAoOecntot7RCdg697vjUI6sCYjXwmvo75A+fqJ4YFOLY2mdvV+6vR+odAeaKs4uxbCK
 OGgWo0+PwzSQpocW7Dm71xQY9Lc9MPCztbpimPASfKCA5Nqp0EUAKA0P5hASle4kS4e5dQQi+bo
 p6MUpGICe+gwXcCweTrrZDZCbXmjnQbQZrqzTHEFflEKoe8CIU26tUfBEZIqouMo1GruBqXY/yk
 glAZ36AbyurDuVzWwigDtCNmdbASMHk5SfNr7QTog=
X-Received: by 2002:a17:903:27cd:b0:2bf:2243:d4e9 with SMTP id
 d9443c01a7336-2c1e8233854mr160870875ad.13.1781032889453; 
 Tue, 09 Jun 2026 12:21:29 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164f88473sm240806095ad.25.2026.06.09.12.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 12:21:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v10 25/45] target/arm: Update ID_AA64SMFR0_EL1 fields to ARM
 M.b
Date: Tue,  9 Jun 2026 12:20:49 -0700
Message-ID: <20260609192110.752384-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609192110.752384-1-richard.henderson@linaro.org>
References: <20260609192110.752384-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
 target/arm/cpu-features.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index b220ed3437..3a754f8d61 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -397,17 +397,28 @@ FIELD(ID_AA64ZFR0, F16MM, 48, 4)
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


