Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64926CEACEF
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 11:57:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vKxpa-0008LV-TX; Mon, 17 Nov 2025 06:55:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vKxpZ-0008Jo-Df
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 06:55:37 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vKxpT-0005hI-PZ
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 06:55:37 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4775895d69cso22732215e9.0
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 03:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763380530; x=1763985330; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Azih3R+3AAU41tCVa285s70I8vzeVrobT+k83nNHXws=;
 b=ptnzQhV3TyHmDW9DxGAih5xss4HhV/rvjeFju6N2ZiDUPRB8gPjFUcKAr9pMcPIVmv
 xxwg4QH/TNphPxM+qY+70xDM7qCZ5EA+P29zdBO4J1Y/ve9+lepAGhkJbV7/n363fj5/
 CI5njvXmSK/p8BGLlpMLad1NZgFsVxWR9f+0i/TBeijBmDSouUjxLiO3yBxAvFuCECKS
 icdIKMzJHO4Oywia2E2JPDOIKOsu2lmjUSTswiR3VxOYXMq96057hkUbTvSy3xY3GytJ
 /8JTUtcn78d//SDYDYGrikDU1mgwnb3jlY6S1Fq8QFP10OpWRNAyBKIxydLsUBZwau34
 jZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763380530; x=1763985330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Azih3R+3AAU41tCVa285s70I8vzeVrobT+k83nNHXws=;
 b=E2/YMuLnELeL2oRMpQ883okENsedG50lu1FxdIve+4NX2zNf8f7z7W+IRZLDo5OYJL
 DfE7kphGa3IRK8p3pOOP9hzWfFavsXE/H3uo2H1G5ny0g3Q6eylApP/76sh4gifpH0zH
 O1lFI+vCGNJbfCeSGd17ymvHQFyyBHizoVe93yShSlneDLGNoDg/zzcFR+Gfe52c+nhY
 sEQuJlxnbyXxnFvJrqP6yHtS/ZmJd8UcVy6GWP+V3P2HOBRKAgWQHztbu/CnAagfmPa5
 DJpO3ihWQDX+LsMp5VliRVoJYORHRNKwiXXk5IafxqcXHvV5ho5XXGfZUu2vFyp9RMce
 ja1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSG/jyvDNhGw6CuRLC0ZiNV1gF73vsuleD3RKjWTWy9bgLrjsqaahPS3/xBeQoPr3e0Dr+2ChCVA==@nongnu.org
X-Gm-Message-State: AOJu0YwDT6PBkNXOQ5xNTXcy4IoyjnWPMgvx98Pu2+8gKYm+1xJOcUE0
 JNLpGw8vhIH0nksLL7oH0X4Rnx4Yk2OqBsgq0flb8IXBPLK98efTr/lXirM/chWdtbE=
X-Gm-Gg: ASbGncuHWCFXCZo+HoHNSFHFC8JQTcxrBe3xzEGXyH72Xok9uNuI+lLSrk0CJzTpUMm
 6o92LhixXrfbUaA28z0V1dGchkMCiJQ0PfZSg6pxmOuRn8R3n/AxPNcnifB2wmhCktpkmXhaVL0
 GO7YFbmN5gvgvgEgruffXTnQQoCYtYDa+IB1OKra8oXIIsqxEb9Idgy3kOCxMnOpm3VbTnPjhPa
 MP+O8HkJjzVUG/f93UbDFSXvV5wYRZV4m+hF52ZQaFUyuP185s3/ZFctZXC8KbaZad3Wx5RAiGm
 IpVuJ85uP7AREm4d5PhIhDDo+EkLNp9Qs3BLsqxT8LBeHPAOPZxC4mkaP9NKqeoU2vagDXbBCN0
 nJ3PNT6NfDMdGmP7oeiWbMRG6E2iTpYt5ybPOGwB9/MVszEQF8Y3zNvMov5AhBJeTTKeBesIaFt
 OD
X-Google-Smtp-Source: AGHT+IFeR68tuFZWlZvHwqZGhXKmm6024Famlat4kQ5cannYdkpXoc3gBrZOeSvyT0URopF2krU+Nw==
X-Received: by 2002:a05:600c:1f87:b0:475:de68:3c30 with SMTP id
 5b1f17b1804b1-4778fe68a14mr127109415e9.16.1763380529888; 
 Mon, 17 Nov 2025 03:55:29 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4779f44a0e4sm87685405e9.15.2025.11.17.03.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 03:55:28 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id F1C395F93E;
 Mon, 17 Nov 2025 11:55:24 +0000 (GMT)
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
 qemu-stable@nongnu.org
Subject: [PATCH v3 07/18] tests: move test_virt assets to share.linaro.org
Date: Mon, 17 Nov 2025 11:55:12 +0000
Message-ID: <20251117115523.3993105-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251117115523.3993105-1-alex.bennee@linaro.org>
References: <20251117115523.3993105-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

Linaro are migrating file-hosting from the old NextCloud instance to
another sharing site. While I'm at it drop the old pauth-impdef flag
which is no longer needed.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Cc: qemu-stable@nongnu.org
Message-ID: <20251113102525.1255370-9-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/aarch64/test_virt.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/functional/aarch64/test_virt.py b/tests/functional/aarch64/test_virt.py
index 63071f9b517..f9e3ec08fad 100755
--- a/tests/functional/aarch64/test_virt.py
+++ b/tests/functional/aarch64/test_virt.py
@@ -60,8 +60,7 @@ def test_alpine_virt_tcg_gic_max(self):
 
 
     ASSET_KERNEL = Asset(
-        ('https://fileserver.linaro.org/s/'
-         'z6B2ARM7DQT3HWN/download'),
+        'https://share.linaro.org/downloadFile?id=3zGlbmXh8pXFewt',
         '12a54d4805cda6ab647cb7c7bbdb16fafb3df400e0d6f16445c1a0436100ef8d')
 
     def common_aarch64_virt(self, machine):
@@ -77,7 +76,7 @@ def common_aarch64_virt(self, machine):
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
                                'console=ttyAMA0')
-        self.vm.add_args('-cpu', 'max,pauth-impdef=on',
+        self.vm.add_args('-cpu', 'max',
                          '-machine', machine,
                          '-accel', 'tcg',
                          '-kernel', kernel_path,
-- 
2.47.3


