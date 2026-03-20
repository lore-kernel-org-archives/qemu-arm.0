Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869601098783
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 13:17:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3Zi6-00067u-7J; Fri, 20 Mar 2026 09:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3Zhv-0005yh-5P
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:16:08 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3Zhr-0000MH-AR
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:16:05 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b976536806cso303970266b.0
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 06:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774012561; x=1774617361; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D07oMhuWTwLxwANSJgDlzLINm06uozRFFDE1WuQsKhw=;
 b=qOB2SWVn6vWqI+boKVaeQyrdKCRoCMZ4rFIDGZ9MvPIBOljcVDwdOG0/KTNpPTb5lp
 g1SYTne0xMfy7zUKWZP0U7DU34adANindCIQVXFxVd0dXcT6aDWv0pHOdHuyruzkmPsG
 jY3gXWYzgQqLiklrl+1FwYU3yiikR7OhyNCYJh3DAxty+3E1dVuYUEuLkpzpUrD3tjcr
 Rwjk+NeRNCkhXu175OEPiwDB/zK0GVwSyQ6qoLKnLLwEu13fTb30TqZ9NRI5SrRmvi1q
 Cy76fuc4f9oRBFhWGsgGgrGR3H8H104nz3iuw90mOunnGsaZw9JgcVUcP59Sg2akGdP6
 L3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774012561; x=1774617361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=D07oMhuWTwLxwANSJgDlzLINm06uozRFFDE1WuQsKhw=;
 b=bsHNolgjdTiH9w6LRjRmmNEuzhw6Lrt+eh/2CHBxe4f+NXVMUGH3f5IwH/m/HF5C9d
 RtGV5rvWAeLnZVpaEO2A+3tH0wW7uG9MGJ8ZAosGzXEXngh0fJgbcVsXY3hnOVW66pkI
 e6zMNI5WJB2pSX0fIXJ9lV55Hv+lawpXHl9Xf9O4yCRn+/2U7wc58ONinxn2GnI01YA+
 d+cLfKW2F8FDdys6pzzle+B0XCUYK0U0LmCECwsgtAajazW1SXr/OWNTncC7Gy//nxrH
 d9SxwNFH9F4BnsgBpvr6FPlBVtBWxroiEY9Rv1wUZPjqY2NqnC9S5hPB36YOBxVKZ8gt
 IjdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6pR50JHcW38oL6SwqcdNJelp23riKSWb2BDNsQ+fvsyBpQ3rKG9PZA+NjI5nBtGSRPRp9oBJX4w==@nongnu.org
X-Gm-Message-State: AOJu0YxSDnirqD5xM1l+ZF8Juh9jehSv9N7zKP9J2XNa0of2Ihgd0NE9
 YXBKvWj/FbBJorrmOafd6I67Buo2fsr4MrfLzfbuLmGDjgGBd/zDlAo+OwtfN/XyY4M=
X-Gm-Gg: ATEYQzwH7emAb/4y5xpJn5p5tthBShJ732gDMyaph58RmJhi0mfp15wxm8rKTXHQMfi
 KY4Lg1MUWDq9xLoK67V4o+X4EV1AiLnveCZU+pjnzATur0LhK7CynwJj7swcCNzwog5l7B2BqqN
 CRNnq5xBDwgval8ekTJrPcAoMqpibGbLtpLgU0aBgW+vA2AuJn1DWKzu7gtxrBksNvGQjeSp6VX
 7flFUqiE0HD8bAn3NBC8nQNTQtFFcNoyVtasLZ3a7MivNt1y4FPOplkQbPwiBKCGXnnFaPguaYU
 vGhXgO1QN3vaLzP1QFea2fUbOrLI+8FSVP6kouB/nvhznV5WJJmGMTSO9I4yu3uxE3ywcP2ojgP
 AItcPSb5frH7rtjarEyCkaIn2US+icqXReRGLxBAUFQXICx7W2dhcDVdr+KVwX6pcdyNgkkcPYx
 r7zM1NFOpMSrmZtjwSbflFS6E=
X-Received: by 2002:a17:906:2092:b0:b97:c5dd:c661 with SMTP id
 a640c23a62f3a-b982f3d6e2bmr150366366b.45.1774012560679; 
 Fri, 20 Mar 2026 06:16:00 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8dc51sm157048166b.22.2026.03.20.06.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:15:58 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 76EFE5FA14;
 Fri, 20 Mar 2026 13:06:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 22/35] target/arm: remove old syndrome defines
Date: Fri, 20 Mar 2026 13:05:53 +0000
Message-ID: <20260320130607.2071996-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320130607.2071996-1-alex.bennee@linaro.org>
References: <20260320130607.2071996-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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

Now everything is defined with registerfields we can drop the old
defines.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 4fbc35ce7b0..1887467b719 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -106,16 +106,6 @@ typedef enum {
     GCS_IT_GCSPOPX = 9,
 } GCSInstructionType;
 
-#define ARM_EL_EC_LENGTH 6
-#define ARM_EL_EC_SHIFT 26
-#define ARM_EL_IL_SHIFT 25
-#define ARM_EL_ISV_SHIFT 24
-#define ARM_EL_IL (1 << ARM_EL_IL_SHIFT)
-#define ARM_EL_ISV (1 << ARM_EL_ISV_SHIFT)
-
-/* In the Data Abort syndrome */
-#define ARM_EL_VNCR (1 << 13)
-
 static inline uint32_t syn_get_ec(uint32_t syn)
 {
     return FIELD_EX32(syn, SYNDROME, EC);
-- 
2.47.3


