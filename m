Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB898CCFA1A
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 17:18:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIs0M-0006SM-I9; Tue, 11 Nov 2025 12:18:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIrzv-0005fr-U1
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:17:40 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIrzp-0003wz-6s
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:17:39 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-640e9f5951aso1749265a12.1
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 09:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762881451; x=1763486251; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Za+5Mks5dDo7+VKCqxjl33d6oX+mjFDqlwwucW0qEdw=;
 b=ZHIQFa0Z7ZkxAu2cvisWOzanuLPLo3kuObEDjokoouLRFrBOSMLgUguxR9DLvtcssd
 gpEbopaYuVVo49X1wkPUkJF2Et+mxF9UFR1q9LmJLqbyCm340XiMM5HPBS+kwpdnMT4d
 AxRiGQhxN9IjAJ3Ve+6vw0ayDKjWwg3BxFpVVvDoCtYpmHsj/sW3qn3v0E9wMoNLwUAU
 /g2zsVx0SV+zwnPPeRIVfB/AKzkETN2YaKfgqaxg3DWxh4YIswVZ6XPFOzH3FAdEzH7O
 PLkb6xO+57svmafJ2L0T8Y0sIhksi5p0WktlXVZMUxfgJwWh2mVh8v7uq0+890ucahJ9
 QrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762881451; x=1763486251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Za+5Mks5dDo7+VKCqxjl33d6oX+mjFDqlwwucW0qEdw=;
 b=YyfEj2mBcS5+GDvGSyEJ/rpujia7HORER895UpkJcfrMsUtfsDe64f6pGck0YDeyv3
 MZZFBdSg5y0J39hPi9kxsOSRlWNAzZKMo7rYn0DlPZwORmIsIWVxzSoU+V1A597IKHY1
 CwSPZ/2Pl7yyD0Lfw2wI0rnnbLyBpjyu2i4RD2RXE5/N+vfmBG4wu1qM+fUfisItui+N
 AnRsQ84ZlawVDrdma3ifVC9AspxEA4BppJmE6cqzI7qy4yJtCaWmnlQenVkopEZQ+BQi
 0XPt4KP4CaxMkM2X/UT49rUpkL+vRaVWHxbLlzDzz8+ZYzKJ0U3Ziroa5Y3WSx7j9pAn
 gpdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZj50/J4iykxdc8hQuxi+AeBdBzb+oMS4nZ9VgHaoMfspawDUZVJZjd+TLEx2DvfHlFNfunDHHrg==@nongnu.org
X-Gm-Message-State: AOJu0YyZElJMkSVHkQlfSpwxpUXnsGsx010NIsX88PLYTqThRvkq0OA2
 PmBf/gtax1dy0QAyn/mjkGPPCGj59G6Gi99vwTrHznSI22SAKcezzpyD65uUAEcP87E=
X-Gm-Gg: ASbGncvYhSOm9SVbKZuN1a/9sNW8HdDHVkCYy2ZKC3pSlKRTFejsg14orNIUXe3ApMw
 UnxsbwL0XPbjSyWt++sUDn9P4vxUZ/02TlH2+6FANIMZDwCMW5nU2Hovp9tVCUv8uIFabknECne
 Gzrebr/1xApazyzVZHUV5Pbl3O6XmxgFfrNFcL4byV2wkzQ2l6KgJp2+md+6unFpM1IiJB7w3lN
 FBCv/k0NG6ZDHzFiiB6WlCPPLVNZyihim/6UmzL3wTIx2/jCkpMQmWqeinUcHM034vzQCIH6Bmo
 Jjd5oO+D9I5GI8aXkJ1+VUouGC9cKxrITxlDO6jAg8dRH72I2XI4IxRFC34G1zSv7cmryl3UDMo
 TZne/qrg6YNWaMlYgKe3gR9dzApa24jLb9g6J7e1gfBFeLK2G/6zxnpwtG73g6Unh3Kc99FX28D
 p+
X-Google-Smtp-Source: AGHT+IEzV2oPWceBEQZfRjUMRF3Z1okUInmrwb60js1ltUEB6Txr+6XY2GMiVSLduNqZ35nAheRp/w==
X-Received: by 2002:a17:906:6a1d:b0:afa:1d2c:bbd1 with SMTP id
 a640c23a62f3a-b733143e47dmr5499966b.30.1762881451559; 
 Tue, 11 Nov 2025 09:17:31 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bfa2510esm1371639666b.72.2025.11.11.09.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 09:17:28 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id AB09C60DA8;
 Tue, 11 Nov 2025 17:17:25 +0000 (GMT)
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
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-stable@nongnu.org
Subject: [PATCH 12/16] tests: move test_virt_gpu to share.linaro.org
Date: Tue, 11 Nov 2025 17:17:19 +0000
Message-ID: <20251111171724.78201-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251111171724.78201-1-alex.bennee@linaro.org>
References: <20251111171724.78201-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: qemu-stable@nongnu.org
---
 tests/functional/aarch64/test_virt_gpu.py | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/tests/functional/aarch64/test_virt_gpu.py b/tests/functional/aarch64/test_virt_gpu.py
index 4e50887c3e9..89bd596b548 100755
--- a/tests/functional/aarch64/test_virt_gpu.py
+++ b/tests/functional/aarch64/test_virt_gpu.py
@@ -22,17 +22,11 @@
 
 class Aarch64VirtGPUMachine(LinuxKernelTest):
 
-    ASSET_VIRT_GPU_KERNEL = Asset(
-        'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
-        'download?path=%2F&files='
-        'Image.6.12.16.aarch64',
-        '7888c51c55d37e86bbbdeb5acea9f08c34e6b0f03c1f5b2463285f6a6f6eec8b')
-
-    ASSET_VIRT_GPU_ROOTFS = Asset(
-        'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
-        'download?path=%2F&files='
-        'rootfs.aarch64.ext2.zstd',
-        'd45118c899420b7e673f1539a37a35480134b3e36e3a59e2cb69b1781cbb14ef')
+    ASSET_VIRT_GPU_KERNEL = Asset('https://share.linaro.org/downloadFile?id=lL8wgnMmSXZo7Co',
+                                  '7888c51c55d37e86bbbdeb5acea9f08c34e6b0f03c1f5b2463285f6a6f6eec8b')
+
+    ASSET_VIRT_GPU_ROOTFS = Asset('https://share.linaro.org/downloadFile?id=qOn1wbfKmS6KVHZ',
+                                  'd45118c899420b7e673f1539a37a35480134b3e36e3a59e2cb69b1781cbb14ef')
 
     def _launch_virt_gpu(self, gpu_device):
 
-- 
2.47.3


