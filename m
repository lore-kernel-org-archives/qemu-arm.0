Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EC110ED659
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:17:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65Bh-0006OJ-TY; Fri, 27 Mar 2026 07:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bd-0006Lv-Mk
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:09 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bb-0007Zi-LY
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:09 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-439bcec8613so1481897f8f.3
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610226; x=1775215026; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MgRWJYLqD7uzJGEY2M5NKnbTbzCDI5DLqfNZPVYqGzg=;
 b=CQWade08Yl5A2Qs+lhYaVnE0Z0OTY8q00geaHqKYHTDfGJDsQ6c2JDt7ljCLHEa4P5
 3QpTDhW7+sh8g2t9dkBnn467NKp6c6VcH0oKkSqyBZeL+mcFdC2Ope62R3iDOuKpU7jD
 KTo9P3ZHsprNqzEn7pH9N2BX/IL7u837TIZFWYocodJmNBhdogXN9QGonqV7qd0cP4Y1
 W3KZggowZqwfFnIEnTRrFqJKlaJdl8U6arpGjo9dt66VQm9vIjhpNKdsd/lW9dojL0Re
 Xdvy2wwwq6chyzLrcC/vhfQ6vT8LrfPeJvqq2ff/SevdhtD0Ed2m9YAQd6By33n/Zruw
 74Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610226; x=1775215026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MgRWJYLqD7uzJGEY2M5NKnbTbzCDI5DLqfNZPVYqGzg=;
 b=Et/Oll/x/0jahAz1I/u5ezMQsfl8qMQCIjL/zsuE1EsKAKsheQm9FeXbmKU+leqwyr
 iAfdqgqBibUWNkpYCZnJu0e6LISb7ukyw8Ria5d9uQPkYDpdmC1gzbTD2HTBEVPmwquA
 GodDD43e5TPBD4iOENrJU7nJFindgiLRryC5yhfx6xJa3cJnwK7rbW7d8ox+YL/YGFjz
 JU6QqyU61jCSAYzPpFgVfDzlUtYnokKl4OQEW9WNWiSRbddZojVorYh44T7yNC9usWf6
 8GPM9UWkWyU0w/k86fsRdcqqdEZzAAsx2gM5x//+BXJAlFBOxMYaZwRuP6ALvb3EwMs2
 KdzA==
X-Gm-Message-State: AOJu0YxxIFTsjQnq2CVo9gjrlIh4ewWTKh2cYE7DKAgI+d6CSC2HNmzE
 UsZefEDRQw06+B1ME0bkemm/sTeYPT6LBQ9SqRG7xYZL8gG6PUXPZtOwWIznkSb/b7fdb+qfn/a
 KW5ZnbNY=
X-Gm-Gg: ATEYQzyCJ3ZJAOFGt6G4eGl0h/LQodq7xi5OfnTp/H+ksLhmfrBdWGdYpHz8Qt+chrT
 Ue+3dtf78legFzqj4vBjdI3hJRuqXDKiPvhR7ZhuVy2bZxvPMA84CwI+smqTQKLOHzi/lpPdPhU
 Y33tvIPdom/XydtgJPk+q5+9lwYdq3CUJKbXPS9rEBrTV6D6nrftb3cItwRAx3SEsxUOCLA9+vp
 f64Flek+XAHIkGgp+dVzJgfaEq7VAw1/7H0JQtg0mhBteyt99irbhlqYt3xB6SbY+7jqK+9fa1G
 d7Vgs4nAAXTkUgZ3mvz+ZXZVfqUgIwCQwALFyYbW4m2/z/VMYluHzZ+zBjrYdWfYMwFXUjK4H1a
 v0PIVnNN/0YRqUP0RGfNE1Nuylw3IQ8MK2FuiJvHPJcvS2YxkXLju9glIEBBgaOnKgDfUAw0jfZ
 UW0CyvjYRQOG1L40buTcad3J1BqRTxTvz9PGgz7Sx3+h9lvUD5lsPmWnet4FcbzKWyTaBgGEB5c
 y21lsCPkcVK/Bl45TcRSwYCwzk6y7Q=
X-Received: by 2002:a05:6000:40cd:b0:436:3707:2bf0 with SMTP id
 ffacd0b85a97d-43b9ea465e0mr3098628f8f.35.1774610225672; 
 Fri, 27 Mar 2026 04:17:05 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 04/65] hw/arm/Kconfig: select ARM_GICV5 for ARM_VIRT board
Date: Fri, 27 Mar 2026 11:15:59 +0000
Message-ID: <20260327111700.795099-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

When building the Arm "virt" board, pull in the GICv5.

We haven't added support for creating or wiring up the GICv5 in that
board yet, but adding it to the Kconfig early means that the GICv5
code will be compiled and so we can have more confidence that the
individual commits building it up are correct (or at least compile).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4e50fb1111..e1a6dba1e9 100644
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


