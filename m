Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801FFCD5BB1
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 11:04:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRpZ6-0002iW-ST; Tue, 26 May 2026 07:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wRpYq-0002bD-5v
 for qemu-arm@nongnu.org; Tue, 26 May 2026 07:03:00 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wRpYj-00068D-O1
 for qemu-arm@nongnu.org; Tue, 26 May 2026 07:02:58 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4903997fcb5so48531385e9.2
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 04:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779793372; x=1780398172; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e1tshj1Tdk11jGilXXYrFYvIhwcfFh7AdRq1o+pa3CI=;
 b=rP3T/2DaXxHLUhm+KlBtOX5pk1HnYGParcAwo7OGEw6F7u8uMosJZLSXjLRWoX2w4G
 z03YCp8rhWrC+O4w3Pn+2252NkTLyCIztYwj00bPwLVyCioaauiUwf77MKWjkTNouTCj
 2VzqTj/0P558GtkdHN2/KG7mqp8rBygpGl0Zxbu+gaT92UPL/RfAea6gUln3/UZ1QO8Z
 FQEKo+llJi5VnJuU1PbfYwGh/U+AQm8XznmOZd7QdH7pKRBFSvKUJc9I+uxgRrHTt5/j
 21d760GwnN0CQvFCmcfT0Nrc2ytlSsJ6aZy5UTbgXtPzsKsHyHyPVu9YJnTadTCp80pa
 1Xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779793372; x=1780398172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=e1tshj1Tdk11jGilXXYrFYvIhwcfFh7AdRq1o+pa3CI=;
 b=dLYB1f2G+rxnWXtbnCfYFT1hA8OUD18cPbmpFCAOB4qak1kXzPATgDVA/9HyCRs5i4
 wopYTzeg5MG8Z41rfaJXn2dL5BiwHRL7wGjgxgvywdBVSfyd0sm0Z0v8ctfErFkIoU62
 MUadfUFj0CpXSOhH0CnuQB4N+KrC3aDFo2dfzDoTXcsO724ZS2GRrHR7HBADwLbLpVAw
 u+f5KMgYbO4l3vOn4xcwQTWNrt4fxxlO9UdkPbJApR+kEL+LBAAUDEcMOehuErY+HEHC
 5FjHISgfPU7f7ToZaTyNce3afxd4FINJa55ah0uC3E8+nJIrtp0MxK9AnoXtZQNf4dE4
 PQXQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9vuu/e7TpEnva+CmuJ2SUOiipALn6s8H1diYC/O1ux0DU08G4SypCDRpiol+7ssEKAHMIAmgHgrA==@nongnu.org
X-Gm-Message-State: AOJu0YzprXPKP3WF5FAy+AvgyfCgqoN8wMI+9/NLed3P0DxVxW1rgSVE
 LyCkBsBNuv89Ogz74ToZiqo/GWiw9MrHv1zzeVUHlsFgSDExUCw/YyLzT/RwGKGZh9A=
X-Gm-Gg: Acq92OGh9EygMR+NNzoR/uDAIH0xs7W5GYDY8O/eIeS3ifGbiHDQMISoNOHyNjwGH0H
 IYgESOBhSho2QH8p9wnZs+5r+V7gOT26YcMUcSW2dsHtlmAwAW0ng4kwlp/EyGiAEFrEqsNxOxU
 BRFZB3h4jdktmO3ugJ298lAe4E1VnBdBw+q3zZM+MN93JU2GmjUuSnB7ecQqNawBhyXV6br9+88
 sJRHZW94eF+lchkhaNgOQx7kl1OdP5pYhkXDw1aXN2102oLE12s6lrOPwqJBSvPYxZCOf4UKBMO
 4VeAE3BxSdtY1mAeBxpdZ/CAH20kotCpipoBTjaLk/kkiHMRRs9TiYdWtnUWl6rnhlN7crCGJc8
 +rODJ8pg+XkuanQTgr+pM4ggKGxvODckiJrzsrMyoRmUK63Il4nROrpWoNcDzweoae/aRZ1UqLf
 2NTGG5bKNjllgq8yygPLgqmmW8KKKr+WTf3A==
X-Received: by 2002:a05:600c:4f52:b0:490:4f91:5519 with SMTP id
 5b1f17b1804b1-4904f91568dmr284321065e9.18.1779793371721; 
 Tue, 26 May 2026 04:02:51 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490418c4497sm106275355e9.13.2026.05.26.04.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 04:02:46 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5E0E96047F;
 Tue, 26 May 2026 12:02:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Kyle Evans <kevans@freebsd.org>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 Warner Losh <imp@bsdimp.com>
Subject: [PATCH v3 09/14] MAINTAINERS: add a section for AI agents
Date: Tue, 26 May 2026 12:02:37 +0100
Message-ID: <20260526110243.470002-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526110243.470002-1-alex.bennee@linaro.org>
References: <20260526110243.470002-1-alex.bennee@linaro.org>
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

For completeness add a section to MAINTAINERS to catch changes should
we decide to merge this.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cd5c4831e27..520f7678287 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4564,6 +4564,12 @@ M: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
 S: Maintained
 F: docs/
 
+AI agents
+M: Alex Bennée <alex.bennee@linaro.org>
+S: Maintained
+F: .agents/skills/
+F: AGENTS.md
+
 Build System
 ------------
 Meson
-- 
2.47.3


