Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CFFCA0FED
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:24:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4ia-0002R5-RW; Tue, 26 Aug 2025 21:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hf-0001TO-Of
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:58 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hS-0000CA-OL
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:52 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-76e4fc419a9so5862797b3a.0
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756257100; x=1756861900; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l0SOJUj38Cm9fmgkJjIjX/37+2seZZfp+KIwKY3yN64=;
 b=dEYHFAovoENHh3pcnJcpmgwkKgpyv9l5L29SCIYvfe2dkpf+IhG4Y/TX099Lp6LTPZ
 Ge89DgwwBuvXG2V4N4ip7jbW33l/GNYrDwkA0iaCs01/aS1vfSUToD3RnZbzhLJ5B5r0
 wA1NaR5IDVP84et1U/6nDZv+u5pavs4IYwHa9VlHaz3lao1Qye/J77088ACJ9N9yPK/I
 O1W/yMfWRdnKavSlXf35KEWqY5hbc7x8w7Zy771BwwUv29TGSO+P4d4/9vmAlBfZvlN5
 XLUyay74JEPsgxNi/YsoioIRRaRjufdG2I/IcmTL97IXT2WEf82Jcr9EQ+HzX2JE4jxM
 3crw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756257100; x=1756861900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l0SOJUj38Cm9fmgkJjIjX/37+2seZZfp+KIwKY3yN64=;
 b=sSVZFafp18TF0hna8Zyixihru3Iykijc1O/ABHDx5kS9JDbfN7Gjq4LmjXP9yrGbPA
 DMj+iKutK9uQRaeb0ku1gWyZtsuvwImeWJNRbfmaJWvTpmLN5IfLx+vH0YxKif1dyPY3
 KTOPUwSVAP9zlOpK+N/v75gYrpHpueKIwFd9/wHkYpg327lBSRouRHf7SKU8T/CHp0CT
 qr3kjmTHde141Wp3S37EqNf5llfUe2WOLWG3lJYmeZ6iB4jQwiKRfZ2LVowL2dK6oPdJ
 /W6Taw0gNdwqlOMVKAsRsq35k9nclxka+RGXDO5OJ0xB+E3dbF4kQ1Ua/oeXzfAb+vF+
 dGTw==
X-Gm-Message-State: AOJu0YyY0u7x6E7yk0LpfmMFTdjziMXxe9cLcoescy1fdARe1hCmZrnq
 uzYRp974d0xmCDZpazS+lWsRdpqQW2TH+3HxyG76fmJGGadfBcdsl2YKQlagcVE0BIrzmX1prnQ
 wXpGKrWQ=
X-Gm-Gg: ASbGnctTXPMktos7GAY/sAYLSdKmRUDTbglvW2TRsqogy7ofHEtKuA5z8aD7FpivKjj
 m9dUv4ZAt0tGvvmiaFQr0a/viXDBIJExhr5R3uFfaFFPeHgnGYuiyiHZHXsahFvTVAdCjYVE98H
 2DV9/3N0kzHfVhzValAkjOPJinfzRN61xMxPbTipgoL9dEqx5lq/FTKF+e8DHGOD5RYWwUnxHZo
 uY9ac+rug7rT2xwUl1K4p1gVxBHWFdLC4WIGZNi9Di5INITJ9AUXxWDGA04r59urMubZzNJRncz
 nQkx+16x+4O/R9H0oE5WDPWr8Uc/ttEB/d0AhvQ66hBec2ms0Z9InV/KCzHAYyV2inpFcprt6FL
 07jrUA4FYt+mSHHxWSXLIFQdsm0v2OtZQi4nS
X-Google-Smtp-Source: AGHT+IEguu268E/bLNIFrGQE3A0kNMMNWLSwhR7II1EAMwXpC4yq+UDO8pOSB+99KDwMsnybCClzTg==
X-Received: by 2002:a05:6a00:400d:b0:770:3b56:7939 with SMTP id
 d2e1a72fcca58-7703b568016mr18884173b3a.2.1756257099742; 
 Tue, 26 Aug 2025 18:11:39 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-771f2b2d2bfsm4348408b3a.93.2025.08.26.18.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:11:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 49/61] target/arm: Add syn_aa64_sysreg128trap
Date: Wed, 27 Aug 2025 11:04:40 +1000
Message-ID: <20250827010453.4059782-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

System register access with MRRS/MSRR use a different
exception class.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/syndrome.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index c48d3b8587..c65678e820 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -45,6 +45,7 @@ enum arm_exception_class {
     EC_AA32_SVC               = 0x11,
     EC_AA32_HVC               = 0x12,
     EC_AA32_SMC               = 0x13,
+    EC_SYSTEMREGISTER128TRAP  = 0x14,
     EC_AA64_SVC               = 0x15,
     EC_AA64_HVC               = 0x16,
     EC_AA64_SMC               = 0x17,
@@ -169,6 +170,15 @@ static inline uint32_t syn_aa64_sysregtrap(int op0, int op1, int op2,
         | (crm << 1) | isread;
 }
 
+static inline uint32_t syn_aa64_sysreg128trap(int op0, int op1, int op2,
+                                              int crn, int crm, int rt,
+                                              int isread)
+{
+    return (EC_SYSTEMREGISTER128TRAP << ARM_EL_EC_SHIFT) | ARM_EL_IL
+        | (op0 << 20) | (op2 << 17) | (op1 << 14) | (crn << 10) | (rt << 5)
+        | (crm << 1) | isread;
+}
+
 static inline uint32_t syn_cp14_rt_trap(int cv, int cond, int opc1, int opc2,
                                         int crn, int crm, int rt, int isread,
                                         bool is_16bit)
-- 
2.43.0


