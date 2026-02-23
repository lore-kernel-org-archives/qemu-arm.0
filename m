Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051F3EC110C
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:04:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKC-0001GJ-1X; Mon, 23 Feb 2026 12:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKA-0001BY-0S
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:22 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZK7-0008UR-5u
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:21 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso50765585e9.0
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866138; x=1772470938; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kPtDe6w1LWavMJnFSy0nCTCbHx5GgbeM6ZGU53JeD94=;
 b=U+2uh3XLm0nvZ1TNoUual6Pd0/IDHtDvLmG8SP+nnefPh6sdSm252L131i90BQWGjb
 w/qIY1rb5xv9rc5SMbwBkN3zP9FFY7L4j7nUt/jciqfnl909M/7/uU17mizoj4aXkNHV
 oY7qNm+DM638lsl7jCP/A9XG4uZcEzlZl2G0TQ3wbxMl1mZ1WdCfVT0N67kDPDJZGzJ8
 ZzohlqJ9zcDlwFIQx3Ae+rCZSMHe5Pgk83OvxeWK7vNJHdUNTB+OuhEvuB1n5Pd40Hdu
 ofWcBueVNpP8WDKJzswrJvdJY7WGNgxWmAFUpmDl550O8D14drpndWoozwR8P7VKv6w8
 LfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866138; x=1772470938;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kPtDe6w1LWavMJnFSy0nCTCbHx5GgbeM6ZGU53JeD94=;
 b=VbF2TlkwSqlZB/PBOa7D4Sr2rOh3Xn8uD/Ie+wTE+ppWPppcvItusaTekkgogQCUkZ
 XxI4VGyHfle1cIsfpFt9Afzbe7F77QsynWWrHao8T0Dlbtv9WoqWO+KTZ/Qd3GwC6EpK
 3PwsLTzgr6ulp5ucRkQplrj0bBgAzMkU1TRB2EOExXwIQ3y9Q5zcxMIScjyr4h8wp59N
 p46JjQbXKpE3oW417UYf0J/DpSSxxSFefCCs0AhaU8hTXPJCsYDnn2DR9fEWqFANJAjj
 bkgpYVNhQKf1RRH1Gcq/Hyv+5M98+eLE1oJdMGIAGHkTDjp7F7yqzcWve7KHOwGrcFG4
 vCjA==
X-Gm-Message-State: AOJu0YzytkdMZe+bHkK6YVjETF3rnrRzfO0FN5E6vVBhZjcCKZtU49W0
 sXml6/jxFYkmbxkckEedgtFFsofzv1pbj43lj4iZ8NhdkbXe39PEa2Jx8/2g9rP8mFTm3x9IHL9
 O/uv5
X-Gm-Gg: AZuq6aJIXsZKGvSxgZf6d/EvjP8V7grNu+HYeQW1FxQfHEAtO0dC6nu8tflGLDtO1f7
 BroZoRNzJoqvegyvsPS9D+9B4/vJ2tlwVfr4vVheOyBWvzBJJ/EE5J+7l6IevHcWprTQ68AzLhZ
 XhyaUVe1KAR634Rt9oQkthNsz99xy3Z4ybsnqs6MnNhQ75iocP5P/3jFLs+9jG0Mk0jTMJsj+jS
 mqXUiLvo32SfXdEK8Btx/nRuHWglcR0Mg+9FTBGLFlo2sSCmECGygPs3UQXJJKtAzGI7fgiRi26
 QMMHR7gf8uOW4yxkZQUicnS3ZWtfxyXwdIoSGZndd6NqLbzbt9BeYr3qZ7ktE3sEWbpq5ZuuzqV
 v6eFQlIn/BNmtCzf2nR4gg2nvuoiIT5oyUA4Zb8ZotgObuFgG2+O2Yzk5EVX7mLLAVBWRcvups0
 TeEhHyYt4kyCVZGUWfM4TRl4EL6dfZ86cZu8uJSdcJFuJB/sClAU8jJSYKujvY6CrRGfQHfS7j5
 yzBdtRNy80YYz5E3WEcXApywx9Ym9M=
X-Received: by 2002:a05:600c:8a0a:10b0:483:a2b0:d210 with SMTP id
 5b1f17b1804b1-483a2b0d22fmr170457205e9.7.1771866137541; 
 Mon, 23 Feb 2026 09:02:17 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/65] hw/arm/Kconfig: select ARM_GICV5 for ARM_VIRT board
Date: Mon, 23 Feb 2026 17:01:10 +0000
Message-ID: <20260223170212.441276-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

When building the Arm "virt" board, pull in the GICv5.

We haven't added support for creating or wiring up the GICv5 in that
board yet, but adding it to the Kconfig early means that the GICv5
code will be compiled and so we can have more confidence that the
individual commits building it up are correct (or at least compile).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index c66c452737..91a15040a4 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -10,6 +10,7 @@ config ARM_VIRT
     imply NVDIMM
     imply IOMMUFD
     select ARM_GIC
+    select ARM_GICV5
     select ACPI
     select ARM_SMMUV3
     select GPIO_KEY
-- 
2.43.0


