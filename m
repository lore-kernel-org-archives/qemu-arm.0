Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4D1CD5BBF
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Nov 2025 10:35:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJUfA-0005Hf-RJ; Thu, 13 Nov 2025 05:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vJUei-0004l3-GC
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 05:34:21 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vJUeb-0002F4-Qg
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 05:34:17 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6406f3dcc66so1086695a12.3
 for <qemu-arm@nongnu.org>; Thu, 13 Nov 2025 02:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763030049; x=1763634849; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eW3Cg6ZlZ8xyBhvunyG5qDqoZAJKrgoniT/tg7TJaLo=;
 b=VNr47sD/0qnU243vWCUvmdJmk7Uzq7LJALp12ZMSqIlVbW6QY2L89YxE4LrrX6ZUik
 olE5edMJT1Fr/PVcVjbmT4EIS8wSK1brGdVhKY+EREZRsxGzno97zcVQlV/umVIf8HJz
 BpW4E88VHurYJNB37SwxoB/Y3GnRKdhyioElirCogDJ1A+gTTG9zu7PuuSmdu2FXaa4P
 JGC9Brw7n0mt3fF4bx6YfvRQaSi879+skmG5qsxnfQnjQY5Fcyvix3raRydkhZHH2tAb
 lLkXoNOSwJPNTeJcSGObZB3R7bzJuYYUCkHgFrAlA6AeJSewTJY9ArhXT2ktL9NS0Oy0
 cW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763030050; x=1763634850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eW3Cg6ZlZ8xyBhvunyG5qDqoZAJKrgoniT/tg7TJaLo=;
 b=H1ey6r3WbcUUkhTB/Dch/OVFaiwea0ZNP9DEy+Fmw+bzBTN2Ra4MftUThPvsDVDN4i
 /A6d1JYvF46vWNghkh/IDYMIlagKq6wMMWZrNnsp2Vay+p+qNzOfh4sr5ZkXNCzoW7Hf
 Y+KRafoxI6RnW5up8hMUHlHozFK379rglobuEmJ/+Df0JwOi4RW/a2Eh5LZwG+ZGod2+
 /BtxcWRKfdJrU1o+csiDTThKgB1oqBeEwWeREXMH6RSeYRQXOBCENSccrCEVmi8pU/j2
 LGg8Sp54bmuQnLeDNSD917MOir20SaiXS1RJPcHS8d5eUgMMJ8RCgiz9S2vBTQFU5KcX
 3uPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTE2XuT3uUo0WzVT6Rej+tnwP++sFGlxbR5iavpZ2yZ+2+rydTKD3Kp6fwxlgEWZxCXmUbLbc4bA==@nongnu.org
X-Gm-Message-State: AOJu0YxRjEfHZ5hngmvlUmE7xxHG13wuHvJWHQqBW0gjVkRJF0svIclI
 uMtH/B3rnqc1j+YRgBJYZuloeAZErHNrcKFGv9istgp77/MCt7aD2xTfJKNhm59L1l8=
X-Gm-Gg: ASbGncu8bLEViVoMvz3d5ZmhF2CFJe1n4nExajFIUh2LUn+c8uA0aasUekkfuVu3B4f
 +3UdIEGmU2MHhL04NAqRTJYDxHKMC7vuzB1jk7lA6vRNUAOe4SUVeT3AGfLAbFBvB/dtqYESadU
 ZtZDuiJpThF8VROXSjj/J3dlhtUDJl/7nH0zd/WFWDyeWU/u6GO+28EXeEkNs94DrhjICYpjsyL
 bIyTco0BrB0u9yj2xr+o/KFWci7Mo7u8c0gWvJbeyhh5/NF6yYAS7a/4z6RQs9gdGYTW5JURH99
 MmC/Zd6gbpI/eBvclGjfy/ZKdg9aVwVxbwRwdZAHbpTxipbhJ5hH04CUh/UC/vqB5wSgyaTZbFG
 q6GQ9zugvXnp5Rd+z3oQ8bCAaLUzt1HBSjjTsGny87ehRUkt9tLE8IyM8fe7usimRyoexfJ+/2s
 Y1
X-Google-Smtp-Source: AGHT+IGiA501Lw9HJeuAJUAPz9VXFN5tdewSbIyqXm1nzcuoZ4l3Hdh2r3WBLNOWr91QcbpzD8vzJw==
X-Received: by 2002:a05:6402:3585:b0:641:66cc:9d91 with SMTP id
 4fb4d7f45d1cf-6431a56b3d7mr5734806a12.27.1763030049580; 
 Thu, 13 Nov 2025 02:34:09 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3d6f5bsm1178240a12.6.2025.11.13.02.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 02:34:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A257E60DDF;
 Thu, 13 Nov 2025 10:25:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 David Woodhouse <dwmw2@infradead.org>, Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 17/18] gitlab: make the schedule rules a bit more general
Date: Thu, 13 Nov 2025 10:25:23 +0000
Message-ID: <20251113102525.1255370-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251113102525.1255370-1-alex.bennee@linaro.org>
References: <20251113102525.1255370-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
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

By default no jobs should run under the schedule and then we can be
more explicit for the ones that we need to. Otherwise I trigger all my
custom runners every time I do a scheduled run.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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


