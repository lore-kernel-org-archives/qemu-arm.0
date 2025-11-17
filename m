Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD004CEBF61
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 15:53:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vL1Uk-0003li-Cf; Mon, 17 Nov 2025 10:50:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vL1UO-0003d1-Jn
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 10:50:07 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vL1UL-0007yM-Th
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 10:50:00 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so22612525e9.1
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 07:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763394596; x=1763999396; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s3Mhl1eDpHTpFsuGUCty3EV75+tQ4xGZkw5FrLfKLlI=;
 b=lIBuGavtXrvMauL8VL/VGWQ7Z6Vb9BGWlLGGfxO5H3AQuKl4iMTZWzsoTSle7fzlZa
 aWGhTrNaiz0PfBUZDhz9ROzOk9hnFmvoEdJw3Dyo0OLEe1s2Ko1XJVywJym51cd+HIaq
 89h+X3dnLkP3+I9+VX+mypj9pEX7dGKgh28fa/2SlWF4srexROQZ083RovoPbX1ohNLJ
 1KIsv/0qBjaMpmpHIozPg5wvVUMIrqypuIiMBSLRouBzFuyupCC/CjfhhPUvYCXa3xG3
 AjYaD4noiS4n+fPeFrh5yu50DmacsT1424dKLyF0aR1vi5+D+hJOuwlTqwETHSlWspeb
 UdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763394596; x=1763999396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=s3Mhl1eDpHTpFsuGUCty3EV75+tQ4xGZkw5FrLfKLlI=;
 b=DgP90bZdibvz9gLoT0KVXABKITPBUjQUERF3zhw7YD+tS/t90VOxAJcGjrFmexA/uz
 7qK0iqlk9VGb0Puu1Yck7I3vsjUxEEVM2hfxvJ5Mb91XU1CfyWV6u/qVJdJt1vzh7TAr
 FrKUu0QaVi1Uc/OprXrxfCDQmljBufiBPNVbU3h+vbdFIZPriDANd72NVJbBpr2GKgUQ
 c59peZvHqvtySMQlmaUb5wBE7fVNyzSNR0FS9cNdyGzsNPKKioXsradzr8xrvWwF6pYI
 M9wPEEBthJq8lql09FuYEU2KXJ8T8H1LFy9HSvSa6aWs5wrC3diKRvJbSz/xjy9vb1xQ
 TA5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE+50/l498A7G5c4zISUopoDo182GDbxB/hgZC94WW6UjbvR8/A/+4Da6KWwOdXScNA91abE2THQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzy/TMqTrsPLxC7Jc5urK8B9BRxofvWGIfh/w1UrBA9WYuzyenl
 eFnDOka86rV1BOi49rdtXkC/r7Om/ZUExIw2Wg+HFAihl+9ztG92UEomZyD0VjX5Tdw=
X-Gm-Gg: ASbGncshq+evK08sWSQGA4bwah4LWMa71hwZ8sW+COsPSLpVka0vQP89NHgjbxch9cl
 Rjtwx+VOmkXdVSY4zzPCflDXx91saPC/pgQqPrZ0BHEk4Na6p3kM4YRavJzYzSWOzn14mx03f5G
 zzHg69VzjHkIvqthfX+m3/byVZiVEjDC4q8V4yx6iUrZYOIyYaDHVs4TFHZ6BfSmrkGRnrbZffx
 pR0hhTbSDJHYtGu26tkLFjs7SmpDHQ8kUgtpRBO5aF1C5+6H/Ac/TFQiBvS/IZlfAvhgILfAGO7
 UcfE78KeD2KN3DuyY+1uSSoCNkJeig+w8SkwVWNdLbju1CCkKQIopSVnalI6eUoMzKvJGRYZnbe
 6SUu2TyLPOGMfO34DlxwJMM3OxW4gSX3+33YFGH3UYxGFEBqhg4TfK91t7m7OCS9BU+L7k4FUV6
 mZAfaYrZw6K1M=
X-Google-Smtp-Source: AGHT+IGkkZOGMQmovJxCBu1qRY0OEreZo4dJOcxB8btUgRT0eFX2f8DJM/q+Tigj+qi30IiiTrXdTA==
X-Received: by 2002:a05:600c:3b12:b0:46e:761b:e7ff with SMTP id
 5b1f17b1804b1-4778fe89ed9mr105522565e9.28.1763394596109; 
 Mon, 17 Nov 2025 07:49:56 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4779fc42f25sm96742785e9.6.2025.11.17.07.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 07:49:53 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 712185FA3D;
 Mon, 17 Nov 2025 15:49:49 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-stable@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:Virt)
Subject: [PULL 11/18] tests: move test_virt_gpu to share.linaro.org
Date: Mon, 17 Nov 2025 15:49:40 +0000
Message-ID: <20251117154948.4122164-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251117154948.4122164-1-alex.bennee@linaro.org>
References: <20251117154948.4122164-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

Linaro are migrating file-hosting from the old NextCloud instance to
another sharing site.

Cc: qemu-stable@nongnu.org
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20251117115523.3993105-12-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/tests/functional/aarch64/test_virt_gpu.py b/tests/functional/aarch64/test_virt_gpu.py
index 4e50887c3e9..c26a1f20c65 100755
--- a/tests/functional/aarch64/test_virt_gpu.py
+++ b/tests/functional/aarch64/test_virt_gpu.py
@@ -23,15 +23,11 @@
 class Aarch64VirtGPUMachine(LinuxKernelTest):
 
     ASSET_VIRT_GPU_KERNEL = Asset(
-        'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
-        'download?path=%2F&files='
-        'Image.6.12.16.aarch64',
+        'https://share.linaro.org/downloadFile?id=lL8wgnMmSXZo7Co',
         '7888c51c55d37e86bbbdeb5acea9f08c34e6b0f03c1f5b2463285f6a6f6eec8b')
 
     ASSET_VIRT_GPU_ROOTFS = Asset(
-        'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
-        'download?path=%2F&files='
-        'rootfs.aarch64.ext2.zstd',
+        'https://share.linaro.org/downloadFile?id=qOn1wbfKmS6KVHZ',
         'd45118c899420b7e673f1539a37a35480134b3e36e3a59e2cb69b1781cbb14ef')
 
     def _launch_virt_gpu(self, gpu_device):
-- 
2.47.3


