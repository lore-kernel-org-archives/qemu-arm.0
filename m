Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E43CCA0FED
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:13:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4hG-0000b8-UA; Tue, 26 Aug 2025 21:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hA-00008y-2Y
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:24 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4gw-0008To-Sn
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:22 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-76e2e88c6a6so5568076b3a.1
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756257067; x=1756861867; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9qlTssT5E1ksTdQhxmBteT9fyMAl300iOHwye3qziuI=;
 b=VhuQq34EiPlRGIkWVEgr2PZ/8owegkQ96UyA9cblLfkEc1iH38XQn7bHY4b7qNQPF+
 shi8dT9eJ7FJQTRH/hX020w7kfjOIAegBtu0tjtRRhQkBAlAoOFBaimxJirdN8rE5GHH
 6VXhSFRIWZdGbAseZuzOdXcC/Ozgv+7EP9b+3WzPIqcJnvDcSqJxtVJw9VwoSDe55m/y
 j9AYtkL2fndd1EyX1UreAugcPX6pAxi+kHfuzn0r2Jql1isjy3wpmKcTaSPlPyTiIgD7
 hQZDIj1KUP84nA7+G2BN+DN74S/rxTjI1Fssi3DEV7cCkT9SWoEoseCDl4QpEvwcCUYl
 aVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756257067; x=1756861867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9qlTssT5E1ksTdQhxmBteT9fyMAl300iOHwye3qziuI=;
 b=YaB3GXHRmuK/2iwqTViOaXd3bcxHDjvDGdQLlvJetof7EyzffhMoDQiksvPYTHr1oP
 0EnuGQ5bVJDVHwcO+GNxavAsthu7nRe3XAdctQIwKW2hx/h4Nv9SvU1AlS/Fu0sOxWRK
 dMT9GMaXTtCVjRMTNQsMTjG954AL2RjR9TIzeO/BDy4F5xhI8dGHGS46XVgIgJX703JP
 Xrpk5RsQmGm3G/Qr6e7dgsJ1Xwr7w6TOwJ2NpWujjhF8c8HYwCNp6vNOh80lQVE2O3KG
 5gNa61n9Dnp8ckR27IMqdxws3LJ5xDxYs5m+d1BpRe4y8Jl+1qnPMZ775vxaflJGmBHm
 BK4g==
X-Gm-Message-State: AOJu0YzNn8H7kG0DrQ3FslS5YY9Pc5k7GCfVsd3i/6NPwQidsSkgSJ/t
 m8VvRQOsu9t0le3U2WghtVjiqqfMRUyZ/BNhbXWsakHh26BzfCtRourjIVd/4Zxy/Hw=
X-Gm-Gg: ASbGnctBqhE2IJ/LjWguADoPwwXScJCAC36uKE3Jq3GhJ8hIjSxGPyMp35CjdSFDUpX
 +NqlcL63VVxjqBegnCy9JlfcaLZkIaTbCfsq5peKAMSFBpXpeesrlDMdQJIz6Nk3DaPuOACg0Wj
 Dx+MKa0hOpWFJOk8PN543Zhvphfje43SggJLhU4YOfFl9VQv4jOrPcOFy1oaJcGYhJupHDiW4J6
 posHzeOgg6UXH/N9ozx6uR+TvohvkUiEfKq2fXNmi/ZzFDj91ByOxpd5szMvFvJZau0BGeoH0fu
 Ny1ATAaptFRdyDNCQqCPaTiqCt2HMdPvgS4s1vcgzTbyGxlXxijnXTT0C0eIMmuOpFnvlQ4bB4N
 rwYs4Jm9JTRrWA2hsMHzTf+zlWEQ2XFfCSboSBNhFekHTomQ=
X-Google-Smtp-Source: AGHT+IFnrYSAy7hU+TyEF50uafimNdyUKUCEHPxkPg1+HZX+Dkf3VpCB3qrRkEeLSKZQIFKs06sMWw==
X-Received: by 2002:a05:6a00:22c9:b0:771:ea9d:119b with SMTP id
 d2e1a72fcca58-771ea9d161cmr8899692b3a.29.1756257066692; 
 Tue, 26 Aug 2025 18:11:06 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-771f2b2d2bfsm4348408b3a.93.2025.08.26.18.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:11:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 38/61] target/arm: Define CP_REG_SIZE_U128
Date: Wed, 27 Aug 2025 11:04:29 +1000
Message-ID: <20250827010453.4059782-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm-consts.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
index 54ae5da7ce..1b3c10c0d3 100644
--- a/target/arm/kvm-consts.h
+++ b/target/arm/kvm-consts.h
@@ -30,6 +30,7 @@
 #define CP_REG_SIZE_MASK       0x00f0000000000000ULL
 #define CP_REG_SIZE_U32        0x0020000000000000ULL
 #define CP_REG_SIZE_U64        0x0030000000000000ULL
+#define CP_REG_SIZE_U128       0x0040000000000000ULL
 #define CP_REG_ARM             0x4000000000000000ULL
 #define CP_REG_ARCH_MASK       0xff00000000000000ULL
 
@@ -37,6 +38,7 @@ MISMATCH_CHECK(CP_REG_SIZE_SHIFT, KVM_REG_SIZE_SHIFT);
 MISMATCH_CHECK(CP_REG_SIZE_MASK, KVM_REG_SIZE_MASK);
 MISMATCH_CHECK(CP_REG_SIZE_U32, KVM_REG_SIZE_U32);
 MISMATCH_CHECK(CP_REG_SIZE_U64, KVM_REG_SIZE_U64);
+MISMATCH_CHECK(CP_REG_SIZE_U128, KVM_REG_SIZE_U128);
 MISMATCH_CHECK(CP_REG_ARM, KVM_REG_ARM);
 MISMATCH_CHECK(CP_REG_ARCH_MASK, KVM_REG_ARCH_MASK);
 
-- 
2.43.0


