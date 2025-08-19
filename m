Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E6FCA0EEB
	for <qemu-arm@archiver.kernel.org>; Tue, 19 Aug 2025 14:57:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uoNlr-00075Z-Py; Tue, 19 Aug 2025 10:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uoNlq-00074A-1i
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 10:57:06 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uoNln-00026p-Ov
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 10:57:05 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b9d41c1149so4013041f8f.0
 for <qemu-arm@nongnu.org>; Tue, 19 Aug 2025 07:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755615421; x=1756220221; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nTU6s1lLYHTXTSeG/Jwij9zqsCWcsjK+a5Jdl9ABAQk=;
 b=xfPygPqlPoF2F6Sxmgk+AbvPKUFrFOp9UMYqSyEhi5hPcPOlbHnb2f+sTM2N5Z/KHM
 5Z0jePiGvX46NVP2P7RAH1tXh+xSV6BlUkLyz6JJY/M0Gm29JXYSKRPQ8+C3A7mVXelx
 sPbI5Kd1On7ObZLjMzc4Ymj/9G8pdmbC8vYCm1cDRD/HoJuc144yB3Ceqn0/UYTsUVQM
 EqbkicBMXq6jhjemkBIxqI0AQ3MNS+mAKjXvzWkU0qEqC03DSWPjvij/Iq+RaFk0B2la
 iR21w8HP+qsqS3SAnYJsbndre/EvvzHYWEPHGCnqmUdpHP3wI8axSuwo3BlVgoKRSAjZ
 QP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755615421; x=1756220221;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nTU6s1lLYHTXTSeG/Jwij9zqsCWcsjK+a5Jdl9ABAQk=;
 b=JxZDgH/R3reTQvLbLsCy1R9CYm4Zc32HtB2uY5NI3KwAUTWGOSKo3yrg3SG86ga6Yh
 zc3skBuL5EqGInKV9BnIT907Gdg8JgilbQd3ENp0O7hp3Bt+H6E0jN9NuNsyDaS+wBqL
 7rC+VlUf2PR4uzYSo+aNnMIFeQUwUGlkrSrKys73LLfPIVGWPpq6PBR8U6Z0/1rP2t+V
 nonVaufqjGt0pNUe6kr54DX4NqlhXK8D6Gepx7tKAhgUq1sJARE2cL7mjEvIdgOf87Br
 lEhm6KLmzo7gXnS73P9RjpwMDyfkTGYSG9jG4YmUsV8Q+PmgVtGqkbcPgFswB0qJ5yaY
 l5Jg==
X-Gm-Message-State: AOJu0YxlJU+sNDOANnrhsCycenewlsF1wrBEGKDmDkzwFLlxLrdls/wb
 ucZkwOBRp9eoRKkMOMIusqXppPRTCTXgAwur1kxcv4ph3OZHD0BLtARXKYWCQCdDU+jFSMy/L8K
 BQt/W
X-Gm-Gg: ASbGncsiZjmPb/owGLHU5oa8jmUrPKqyZuBvuibPRgtXj3R+qiJzCpPIreYA/HhKBXf
 QraXtfBvDdk2uY4F+q8bX/kNMExLdm6ibpdTS5nj3JnIbzSvpU2THdVZ6k41EHOr/dm64WnTExJ
 z1Q2JE9qqvVJCKb23vlONXSjp/F15eQORf6HmFTZMbEktFdnF+h+60MzeLhbcUAVDucYhuOaeXy
 i/w1SXS1KcvDUUcqjjVXAzIUaP3vecsCunO2saoBsVUMujT2B8dD4HxNLKPciiMNDFHexXO9teC
 vhfd98ACJ9IZKKeWQvOV2tchS3yAJ+EoNspYPtoEKjHqJw5/ZqKwKxjWPoOXBGXKugOnQ4FoKo9
 xO7fZaVbu1Wm9ttmjvyQxdojwem7h
X-Google-Smtp-Source: AGHT+IEXol+Zs2XeBVw4Vbx57c7TZHWHCm74fwf/0QuniICw6LwTtSWWHbv95PXKReaV2TOT1Qd+Ww==
X-Received: by 2002:a05:6000:288b:b0:3b8:fb9d:248a with SMTP id
 ffacd0b85a97d-3c0e2e724e3mr2364242f8f.24.1755615421511; 
 Tue, 19 Aug 2025 07:57:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a24e5562csm161864175e9.20.2025.08.19.07.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 07:57:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] target/arm: Correct condition of aa64_atomics feature function
Date: Tue, 19 Aug 2025 15:56:58 +0100
Message-ID: <20250819145659.2165160-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

The ARMv8.1-Atomics feature (renamed FEAT_LSE in more modern versions
of the Arm ARM) has always ben indicated by ID_AA64ISAR0.ATOMIC being
0b0010 or greater; 0b0001 is a reserved unused value.

We were incorrectly checking for != 0; this had no harmful effects
because all the CPUs set their value for this field to either 0
(for not having the feature) or 2 (if they do have it), but it's
better to match what the architecture specifies here.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I think it makes more sense to fix the condition first and rename
the feature second, though there's not much difference in it.
I'm happy to fix up the trivial conflict in target-arm.next.

 target/arm/cpu-features.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 5876162428a..a4d00a001d3 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -408,7 +408,7 @@ static inline bool isar_feature_aa64_crc32(const ARMISARegisters *id)
 
 static inline bool isar_feature_aa64_atomics(const ARMISARegisters *id)
 {
-    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, ATOMIC) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, ATOMIC) >= 2;
 }
 
 static inline bool isar_feature_aa64_rdm(const ARMISARegisters *id)
-- 
2.43.0


