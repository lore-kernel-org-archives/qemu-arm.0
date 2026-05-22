Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8C3CD5BB8
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:09:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQY2G-00083x-LF; Fri, 22 May 2026 18:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY1A-0006VF-KF
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:06:56 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY16-0002VQ-16
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:06:55 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2ba4efedbeaso58244825ad.1
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487610; x=1780092410; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rRjCP159VJEQd1TORVL1d7Ygw8lPSNjMk9XPV1UN+aM=;
 b=SeE24r0s/toZGOSsZQQIVFELRE4vaW7ehf46E+jWnhvi1ykBIYIbPpPhlM9jmBU4hP
 MZFMlscO7/O0xbWE88jzwKQdBsw2APXlBeAi4rG18E8A8mBsXFRvulINWw24O3CeQN/O
 NkXwD+ozdTvBDJq8QMzEovH8DGaMKPsUI7lGtRotGr2ZaqLV0Pr4hbe0UTMBuJLARpQT
 NERUSP02/Rwa/5Aik8YEBcCvGOdQYdnrASWBM2GQYvWcBebdMCPqCXMnDXuhsraXa3Zw
 /5NNSaXNZpxTKimbO7C2pgJEnEV83enhPc/d6wDZez2yRABpa9lxyNRsGxRntuUc+YOP
 9T/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487610; x=1780092410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rRjCP159VJEQd1TORVL1d7Ygw8lPSNjMk9XPV1UN+aM=;
 b=mQM379MCZcUov0C441SZ67pSxWIK1cOWtLIS452Q04O2ouYydJzPm6I+yrJoX9DEyw
 qxCPxr4u2I4+ynvauYqhi20LX/hM+w9iB+7xFBWPkULJT4fTMo5Rc0rHt1GjUh+q2y4X
 IFq2r/+KO9AOyJbdvvxyH2IGNJGjNnZVv2mPj7CkZxSHMX/xgr1T2Q15joW987tgEAHO
 tSGZ/GVLJlgHHdOop0N1It0Y8QpcjI+B4UbRjCREyuoaP+80x8FqISsD2FNrm75uTj4Y
 AIRL8njbqjfrrtZgKcF/KrRrVU38xnY3e7+Mx7AwRuTR/oJb5LxL/toZz4gmVE3OhlpW
 vyiQ==
X-Gm-Message-State: AOJu0YzkuApAn3HLDh4LGCW7U8O+OgsvFQ24+IHyBjzi/goCPjkNuBLq
 2edUeSRCLTQKt/HA8QbM+nDIkk5ZHB6VFIZibStLdxyGsQ2XZ9rCILUD7H1Gq2xZeTM=
X-Gm-Gg: Acq92OEBBxhxwvP8thYoslvchU5uPQjH06F0KCEDn1OPRjyhb/XY5TbAOl1tG/EatiD
 /zwByMTGes0qwzHM0Iy25uuP+fpkdQ2pcs4YUUHgOa8cggJ+X20kUCtruHwY5g7oEVVUoSd/41+
 UUvZPnVf/epY2cFNs8sOzQwDVP90YXZAEskyIfZtMKMLkacj038/Yzx8ZeqM/uQq9Nj1I1r7ODx
 0BBxEPLA425NZFkzg531Qet7GRreCxnh8LbK+DkSYk3ntdXeg6yek3r3g6I5zBKAMXrcPsdr5HP
 eC8UuFD+st6Z7tp0lnRzNFfxBYmKxxgu0de3yWxeGAi3tsXpLWgxHfWbTK4B5ElAFnxjMEDZNHv
 0PoDfeAt959T7PEUuCCbn8xocjnvJptQmKrocbwV4OLPV1llxehEFA53sAh2iN4xMffgdrt5qyL
 HC9R5vjHj1M6/7IbxNswzlL7Vg9pFO9K2hVUB10xE=
X-Received: by 2002:a17:902:ebd2:b0:2bd:de3c:a021 with SMTP id
 d9443c01a7336-2beb06f9a8emr49791775ad.38.1779487610374; 
 Fri, 22 May 2026 15:06:50 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb56b7920sm27835745ad.21.2026.05.22.15.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:06:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v7 44/64] target/arm: Update ID_AA64SMFR0_EL1 fields to ARM M.b
Date: Fri, 22 May 2026 15:02:46 -0700
Message-ID: <20260522220306.235200-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
index 6d5994450f..811f2a7291 100644
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


