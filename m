Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D661CCAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 09:38:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0czh-0002U9-9K; Mon, 22 Sep 2025 05:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0cz7-0001xu-UM
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 05:37:26 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0cz0-0000cA-Ui
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 05:37:25 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-46b7bf21fceso13542275e9.3
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 02:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758533833; x=1759138633; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tABHb0SIUKkh6uzz0t7I0iXZ4IfcRn4F5NgGsBOTZrw=;
 b=Khl+jliPAIywrHBFL75d+hjNd6bWBdoDKxzkPYuizrb/jOPBhdiSSkW8NoPfbYDjIs
 CkfRdZkbGAEj2nJD6Dy/TP9tqFXfO36kUDWjm7j2sO4WDoNWhq2gMENGw/i0XL+t/RIT
 ER9HKiTH8mw/wTiMdYMQR95a+pVxbontKvNdhe3kv1DPARgs1ku0hE2EkQX0qsxv+JDk
 lOblMQ7ssKYgzNL6hEyXLGlRsaRMuMYMl4bP8CC1izsli7XqTJZsi0WG0vSc+dT3c2Ow
 Fyt6rlrggwXSmeC1dTgnv+BLus7SOxaffy+dC2MK0c0PXYxINDhVQefhksjVWkTN4R/M
 edPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758533833; x=1759138633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tABHb0SIUKkh6uzz0t7I0iXZ4IfcRn4F5NgGsBOTZrw=;
 b=APTDCJiOrIz8+kPkyaGlpF6Sf/8GnAjS2IquNwhkFSw8lk7bJnTLQOTtmRdLPIkr4a
 aOztdFAuX/mmquJIu46x3GQg8qkjtZ3h8Tql3XXZH60qQNRAHjR+qy33Qk2LuhH/9IOc
 q+Qi9P4Lt9kP6yA+TJT9ywgUaQOyGiyBDocipIl3LW7GP7fhJKADs4l6JVrxkj/2klm8
 fpOH6Rr1Dx3s9ZuWlqxOiRS1B9lqw5R1lcesLaqEm5lkh1K4PLvoBktf8AFMIg3WHrtx
 ZUurc3isqueFe0Cuf1SJc52g+pmXVpwXgM2kUFMwPT24s4bN83WW8Tr4UQpYGdXw4B6R
 Uhbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh9wNbOd1pVfFBbgyvfg49HYBVNI2T28fkBFQKkuF4m2IbGhuXu9v51UsD+B1/lP416Fx1ROQg7w==@nongnu.org
X-Gm-Message-State: AOJu0YzyQyDBswAL+zAN2wUtvvbgUDThJuBKFR2+Y9RPsAlUMPhX1oyD
 VgfAdrjF1upcY+qXpOqNmrp3w/cPEn3OnqT9t6Yhlfid/8IkOsLQr+th+1gDlun1crk=
X-Gm-Gg: ASbGncvyA2iLagmUzhr2l0PBe7DoarYz+BB2yG2m43F3OsYcEm/QG+gCgS6ZNUr+2SF
 RGI7h/kvae2EhuIm7Ph/9o/mYvY7ZIygHmTDczTfE15U0v3Fhv9+cvl6TajsK/jKOsXnwWzCFGd
 h5PVvOtDwfZjNGiynUOTUtGqihzRikAtddutdXGoUXgg4OLaGkUT1mxCCqYN0s6mqOrScZd315W
 myjs+FU0jdgxbisLDDvvpwXgAibdi05lHsAC9jDHR2wSeYIQJWLgU78i8e+X7aLf7ILv3vWzdsq
 bvG9ITa6fMcGALSvLrAbSMCrHZswZBslMbF2adjt+K+VjYBsf62Ak7iwGXZFMfakYEJZ9I+r/fv
 yPEvJOO7TCeIOQXk5mXHxoYU=
X-Google-Smtp-Source: AGHT+IGKYLCqTBbnTaHG0WoqROvB3mb3XtAIclhYxe32fQ7dUvSfxGOnGECyX9UUbZkMBeFeQmxJtQ==
X-Received: by 2002:a05:600c:1c0a:b0:45c:8e6d:a45f with SMTP id
 5b1f17b1804b1-467ee3057e3mr113776025e9.5.1758533833241; 
 Mon, 22 Sep 2025 02:37:13 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613d14d212sm259930315e9.12.2025.09.22.02.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:37:12 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 987D25F8B9;
 Mon, 22 Sep 2025 10:37:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 01/25] docs/devel: fix typo in code-provenance.rst
Date: Mon, 22 Sep 2025 10:36:46 +0100
Message-ID: <20250922093711.2768983-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922093711.2768983-1-alex.bennee@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/code-provenance.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/code-provenance.rst b/docs/devel/code-provenance.rst
index b5aae2e2532..af5d7349e12 100644
--- a/docs/devel/code-provenance.rst
+++ b/docs/devel/code-provenance.rst
@@ -331,7 +331,7 @@ ChatGPT, Anthropic's Claude, and Meta's Code Llama, and code/content
 generation agents which are built on top of such tools.
 
 This policy may evolve as AI tools mature and the legal situation is
-clarifed. In the meanwhile, requests for exceptions to this policy will be
+clarified. In the meanwhile, requests for exceptions to this policy will be
 evaluated by the QEMU project on a case by case basis. To be granted an
 exception, a contributor will need to demonstrate clarity of the license and
 copyright status for the tool's output in relation to its training model and
-- 
2.47.3


