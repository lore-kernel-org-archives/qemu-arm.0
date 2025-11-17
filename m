Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56CACE8D6B
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 12:06:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vKxz2-0003F3-Hs; Mon, 17 Nov 2025 07:05:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vKxyc-00039H-7j
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 07:04:58 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vKxyZ-00087x-8V
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 07:04:57 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47789cd2083so28874615e9.2
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 04:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763381092; x=1763985892; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GWtPUQ+JvZ/prmIoJ1f37Bqg2O5E6FcG1RkmlqBd/5E=;
 b=UpJuSGzAislC56d4aU3cGPJkbiH7mWVnREG3grEkPXd9+5sebAKwAgOihx16T4Wjla
 ppUjousx/oPwhK0oahuax+aeUaLvZoqUxRJFOx/AUI5mYocdlYPIgSUbn7Wu89zXeBHh
 uixH2nsk5aXFRYuCx8gkTeW+Us3qTMM/XLurqnGtJE5+cjRVp/C4ycRt4LRl/fGf1Gdm
 jKld86n6MIWyjpXWgxhlcslwZjUzp7jx/G0YrEsvF0E6TfPlw1BwgwDlNUTPfzOT8qDu
 0Vq44GUsuIgCrXjm27HF3rnfwqQ/G6l4uxRBfNdB6imuCZPE9ho13cTYjn9yTYz7Q2AS
 YF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763381092; x=1763985892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GWtPUQ+JvZ/prmIoJ1f37Bqg2O5E6FcG1RkmlqBd/5E=;
 b=c6tEf69/YG1gwfaAMR+Znuq2eS4hF4gYiGCB1FeFnYSre6AIb2s5StM5fBRDVzZxlF
 aJ827vvrlwSj5tnspormC0cZ3ag8SivMOs1dcSWzgl4zG+a1kmEQbr32EMrP+mtNQl47
 tq5R5Zx7uRSBof9hvcb2VjXQ44+xQAywNYwhAAbXfmEUb7kx4PONwGN1/mlH4nbf4keF
 wLt+I3xjWVngtczyYkf+gK6IuUH1kRPtc4hNutCNt5BukLYhdIUKB0oKQo80mmB+sXKR
 wBc/LvAXlk+Co4aKcq5crNFILK66Ped9UYq/2PwJhNWZ5WHjp2h/kC6OcRedGr9G4sUS
 XnZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEvmSHXtHwVyfx0sdwqpLbnVK9xqXIHO1w6ZYBG6Epv4nB7TNqTV94QqARFVY0o43kmioyI95mnw==@nongnu.org
X-Gm-Message-State: AOJu0Yyuw/4KPTA+co9ioFf2FSccKVKm4ZdFTDqvaJWYyzZbxaNE3ik1
 S/uhkzi4tZMftEWXeiVGNL4QPEwpNEKFb3b9eLJEnVt3r8kG76p2XxrxJnX//+XWbxk=
X-Gm-Gg: ASbGncs5B3slM8yOsqkTsesDBTTlwYhVHQPAePkZYxPU8NhdiTgLjy/iLwUJqWXwG8A
 GqWeqP+ot0ZVp3CXTf1w6PIfmGg5eYKEN1xFo7sD8aXqeHuqXw9IUtE47qdFzg12il5MXIydu5y
 GIh0rois9SxWBOp8sofQCexJZCFOA6lrDEQRHz6pAPPma3mWBejBxvcZCtZyaQOunBl4XVvLFXZ
 /UvEiSZJyta3z8pr7PI4YOU9TClpJ6Nm5yvHbDBfocSA2CRbg3PnDBno6acyrKS5Bd2Je9KjIlp
 o2TiD5ce/D5wvWAEdOv0P3lJZQQHo+kPMvv++1Vw6C3NE8MlB3WynrZ/Xu3le1VO3WJzNTcubll
 kigzoYp3AWSDSenFnyZwgRUZ5501tTB0RdxFgpDBZKV7gI+J478iq8hd8KsQzK/3z4OtMJZkR/s
 gMIqX1FD1cOQM=
X-Google-Smtp-Source: AGHT+IFCwmelVS+JD/DBlQuEeW3Kyn5qMTw18g9IFSJsT9L+Y5Lb8F8HDxSjBLpCLzq2O4hv0SUbkg==
X-Received: by 2002:a05:600c:3b19:b0:477:8a2a:1244 with SMTP id
 5b1f17b1804b1-4778fe5c5f9mr108077645e9.11.1763381092058; 
 Mon, 17 Nov 2025 04:04:52 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477988060e8sm59902035e9.5.2025.11.17.04.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 04:04:51 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id F4016609ED;
 Mon, 17 Nov 2025 11:55:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ed Maste <emaste@freebsd.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 17/18] gitlab: make the schedule rules a bit more general
Date: Mon, 17 Nov 2025 11:55:22 +0000
Message-ID: <20251117115523.3993105-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251117115523.3993105-1-alex.bennee@linaro.org>
References: <20251117115523.3993105-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-ID: <20251113102525.1255370-18-alex.bennee@linaro.org>
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


