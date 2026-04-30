Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0D4FF887E
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:24:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIF9t-0006iB-9U; Wed, 29 Apr 2026 20:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9n-0006Xd-7v
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:31 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9k-0006Jo-FN
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:30 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-82f69adeecbso151387b3a.2
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508487; x=1778113287; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PSIqyu6kWdNMcAAky/pBc9Ndq11vsOCHdvA3yGktP2I=;
 b=VGdJqjC/fRTTSWqKswA0FXFHVps1S5M/SHdK6SDk1iGWCFnl681tzQM+m4f/jWkRXD
 vyLTrEc1DL5Pbo7b69pCh9DefdNnH/I8ZCh8fqQefkjBKtcjJhfPNm9uxgIjJKSjL2T5
 ddnSmVrXQM7UkxMEQbyg+ult6eCVTdVIWGm5QUmpNOv8yFYwwHp6FpOEhZOvPd3dA8K5
 6HyblTRZ6PSdPbFA5jjEk8OBWBCiMUzuvs/Ew05BroaXIpjC4/fN33pzkahp/wicFSiP
 BJjc2DhMl+cDFPsGL7CgXBnkOTeXaZMXyBf6ZqRiXtDJgfVGckW33cnSHyvHN3N2uCbU
 ImPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508487; x=1778113287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PSIqyu6kWdNMcAAky/pBc9Ndq11vsOCHdvA3yGktP2I=;
 b=EEEjgf4/RniaYk5uYj2i2DrH+0K5daDiwUvVoHJ8XiSPAd8MnxVoQrRwSn037KB6UJ
 vY+CAmQLHfbv/Ren4lEBWvpKlhz//w/0T429wMkQQ7lDDVFcJ8866JrJ9HjGEyEw2mdr
 J/1JbEclOqVNbYNZ7RR0mp/eWv9Bv92QWe3YpFLJBfHfDvjcdLUtCKJfU7khUMbtRKft
 zcmeJawjtY0X/vtevynZM5fvVsCtmEHzFvoNrht9qKdzP7J+khmhiOhoh8M6IP2hQ901
 MRLdxYL9BqgVcpFqC2JWWCD4zMfCSvuYiiPbNmSlvU1LYXljnRNVzwY76qxSi4Tga2jm
 X3Vg==
X-Gm-Message-State: AOJu0YzviFP55AIylRRD75njC2GK1CnHMMfXiIK9lzvEq9sbkSvvgZcr
 uBOfCJUfXqEBUWSa+NqeWJ7FB2TriDjND5nyHCdYqTYLZ1ojczvfudC49IwPCnmypLE=
X-Gm-Gg: AeBDieul7N0oPHrK4fO76i4fRQVLSR35lz3mW/D3fOwiGGRkdXxZ7rznMOW6npJ3HuL
 q2uXH0SXf1uziHrcGUnqeqS8O2bTYt6lTsNRGo+i5ZBJz8if/qIyMFiPzH+0DZh7DzKeDf/z43t
 u9euCecVq8BmTsY8VazikmqFGHv+E+ABg6JUONvkRJ47HjMZnVg+Hap0OvkY9cBhG/eMusJma7e
 7ZZpTQ3fnCkeRiEN6saTpPpOm/uIZzjzGRh8lYlDAT1kaZxO5OJOGaWBN2Hgtyzt3vhi5aDg4lZ
 duEo8Eit07GlD0fSQXNH0P0tqVmBzZzgvyat2O/9DN3r8/YlryAtG+mw7nUOtEYfzISuLHjpZsp
 hYLPTfqF7YkDXufISyg3xS7CXVDnOLtGbaBAlJuIUY5CpjdbKdUXcji0JWwbqAfhuFwQ8XLpFk0
 f2E1vI7SkP7lYlTceFMJIjXlSxjQg58Jwyp4KdWYN6
X-Received: by 2002:a05:6a00:1885:b0:82f:2384:212a with SMTP id
 d2e1a72fcca58-834fe1bec01mr733931b3a.26.1777508487119; 
 Wed, 29 Apr 2026 17:21:27 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:21:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 16/47] target/arm: Add isar_feature_aa64_f8cvt
Date: Thu, 30 Apr 2026 10:20:15 +1000
Message-ID: <20260430002046.59739-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
 target/arm/cpu-features.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 60a16ef398..590a7f6cf7 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1555,6 +1555,11 @@ static inline bool isar_feature_aa64_sme2p1(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SMEVER) >= 2;
 }
 
+static inline bool isar_feature_aa64_f8cvt(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8CVT);
+}
+
 /*
  * Combinations of feature tests, for ease of use with TRANS_FEAT.
  */
-- 
2.43.0


