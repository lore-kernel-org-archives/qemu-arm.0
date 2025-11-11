Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDCBCCFA1A
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 17:24:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIs5I-00049n-DS; Tue, 11 Nov 2025 12:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIrzz-0005qG-Da
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:17:43 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIrzs-0003zN-GU
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:17:43 -0500
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b72db05e50fso2861166b.0
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 09:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762881455; x=1763486255; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yI27wb1aUUkGfFKDo1R+cdjzeV7iIOw5tmI18BXtQ0k=;
 b=I+uZAuQlfSR3FNMlobsh9SRWJVY5oi/mQ0J02uIDofIWCZJOT52IwjwCk7eVf/zMvX
 gQC3snT/EVxIXrdxTDlCUQj67iMYczfJt/LOcpptAPqDO1Ar+5KslF76PlSb9rMfeEap
 3qMDLkjVMKmp37u+K8m+uaTd1J3sZQ36fmj+MF0HLOymGk+hEO31+s/vfNV22b7Rl6lF
 +C7bcvLBAsQ3wufckwC/e9b6sJOSML7jR6Qx67hhy6s8+WC/foOsXyfxdCVsOxhoih0s
 SKx8fKAmn9GwC+iABcVZo0ocSzJf6x9aCkmv7djbhoCUM+/BarzxS6eRTocDT4hY7ZcR
 yaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762881455; x=1763486255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yI27wb1aUUkGfFKDo1R+cdjzeV7iIOw5tmI18BXtQ0k=;
 b=rOulf4dvvOu6f0XB/uXE4DgHtHCta33GXpScEyiN+ZKbSDs1uLdJk+2zfWNT9Gji+f
 p7S+q0QtX4URR1V5L+7WJRU2SgQWVvASIZ1v2LesARF16JuGiqp0Iuak5HKCaV9N4IDy
 +TZlAhIHp/dnOUB70ugXHN02/vMmz04a2Ua4ulpjG1YgBkcnW5MUBxv070xVSEc5L1eF
 m0Lh9ijNMCp56qPT5iWhkKOXErbujfhDKcU4rBnX6GonPmh2Pg1bYq48a/iZPHIRKuvC
 diec4+jcbMi1rOJEndAr+/b/vi/T481yCQAwUIm6RQsGmhKfyELsF8G6VzJSb6EN4aGW
 minA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv3sJCzPQWgGS7HPn6MPxPsNvFgxdI8mGtP0B+ConumATHHu70tLob9X8OZwSjbNSvIuZjUTvuyw==@nongnu.org
X-Gm-Message-State: AOJu0YwO9EDOGr7TwfByiwSxhlCFqL+fzkmeYs3+HHDVg0pJSwgmGZit
 3bih1qL2POOKStKDHNAYCbm15qG5+gh1CfHaB+PHRu3MS4AiD6yB0RedWwEapAq7ONs=
X-Gm-Gg: ASbGncvJZsVsbQrSJVOyGXB1HhBI2P6yAZfqUwHT1asWBG8tRNX1EMIKpqTMcfaCpnM
 304FLU1eiyouWsRPgLH/blTZqkaiNDWJNpHzWLhJMk5CVywYvNB/EzaW3Qy1bHsuh7GHJNrrtls
 /FPo/Z/bpE8EXpm4O8lRrzOiB188eyp1abAlrFC/C+v6fd0VSwX/tUC40GEa6hhtxhp78W/ZaOf
 nuLjp6rgO11xwqpHmltgZHWqULzv1G5mo1es00vBlx9zasCFInKQ8tLWFgm80/kfMoOQY0IyoNa
 WVILnlq+Wm+i85KTTh0SZTzJHThHZEVwbJYknZQk4vRcs0WCWCITFlSKJuxWSibRH/xPXjGkzQ/
 JukHG64lypvJPh4fL6ryl48O4EtNnR97t+B3ZqMGRoSiQYZBybPQj0rwh5RjXPkZlpDMGExf2VG
 LUoB0MIwbfAqM=
X-Google-Smtp-Source: AGHT+IG/+UEQt86WeTcys8cnAAGS4HN3Orf/mcmG58648FhhTez3IazMKrPtRt6TcP8qySgw5Y2pOw==
X-Received: by 2002:a17:906:794e:b0:b5c:835d:8d2a with SMTP id
 a640c23a62f3a-b72e03147bdmr1380929066b.15.1762881454863; 
 Tue, 11 Nov 2025 09:17:34 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72de4f920bsm1102235266b.67.2025.11.11.09.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 09:17:33 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 03E9960DDF;
 Tue, 11 Nov 2025 17:17:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Ed Maste <emaste@freebsd.org>, Paul Durrant <paul@xen.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Thomas Huth <thuth@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Gustavo Romero <gustavo.romero@linaro.org>
Subject: [PATCH 15/16] gitlab: make the schedule rules a bit more general
Date: Tue, 11 Nov 2025 17:17:22 +0000
Message-ID: <20251111171724.78201-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251111171724.78201-1-alex.bennee@linaro.org>
References: <20251111171724.78201-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
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

By default no jobs should run under the schedule and then we can be
more explicit for the ones that we need to. Otherwise I trigger all my
custom runners every time I do a scheduled run.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/base.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
index 60a24a9d14d..921c5620008 100644
--- a/.gitlab-ci.d/base.yml
+++ b/.gitlab-ci.d/base.yml
@@ -45,8 +45,8 @@ variables:
     - if: '$CI_PROJECT_NAMESPACE == $QEMU_CI_UPSTREAM && $CI_COMMIT_TAG'
       when: never
 
-    # Scheduled runs on mainline don't get pipelines except for the special Coverity job
-    - if: '$CI_PROJECT_NAMESPACE == $QEMU_CI_UPSTREAM && $CI_PIPELINE_SOURCE == "schedule"'
+    # Scheduled jobs should explicitly enable the run in their job rules
+    - if: '$CI_PIPELINE_SOURCE == "schedule"'
       when: never
 
     # Cirrus jobs can't run unless the creds / target repo are set
-- 
2.47.3


