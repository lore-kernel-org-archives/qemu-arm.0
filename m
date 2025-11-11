Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37CACCFA18
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 17:23:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIs57-0003P6-QI; Tue, 11 Nov 2025 12:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIrzx-0005oI-PL
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:17:42 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIrzq-0003y4-Mt
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:17:41 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b6d402422c2so881949766b.2
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 09:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762881453; x=1763486253; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=isiSnvhJheR3tndZoafatyQawN2Nwud/FinpWf6dJ+8=;
 b=y0kFwpUyqlrkOuYSoPY7Ls0MQEze8SB/8VdSz4r0I2Dt/CTBEfAB8Me2AjgGiyn4Mm
 L87+n8ABFaz5WQS9NcDYideCSZUsuvedmWqfpdOx0H23HkaKeHZbflvTpE15TB9oLp+w
 j5fElrOF9BCh4C8ApVPRqHM3UAXc5nmWGuj1d/p94bFx6wI9u+hwbz7zsddXCfVTr8iq
 PJPMNsrjan8U83x/h5U5CgyYVMeFLRpOG5l82n9SvgT044FVzBaq1H44qTTUWXLwxyzv
 KGm9pKcmF7ccFl+mgeXW7XTWezSQ52on98Vs39OTbIzmC+vYH+7P16mbMnPi3p6V4+mt
 KvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762881453; x=1763486253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=isiSnvhJheR3tndZoafatyQawN2Nwud/FinpWf6dJ+8=;
 b=UewIUxnwYXNAjX/PfFIrhUvk/Lu7u0gGMyNzMAeTW19ecE8ElEIy+jHDA/iMBH+ocs
 pcuGKVmmxntQu71A1Y55Cia9pF3wU5n4ovNr1Kd8+iODDT892BkeJGgTm/Bo29GwB7Ec
 wqODMFYUQgDZWsW80nJpL9ZM2Rdc6D3hIsmBMHI8JKxAdBoYvA3AnkWeXClpvvNpfybS
 VWyPCdmnbUZ245kijji391sgjEsgIjoBXuGSLdRN1Ix+oEfdQztVlsZ/Cbzv+OErPO55
 6qTxCM+CczxM8uJJKvTgTjwe0O8pN0uBBwZSoKAdDGIcF7K6M7xLE/54l3KQ9+/8PnPb
 GCEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWvb7614FrzjOfgwyu/6oMg7/pEXkMKTyHEJPzMhDXmbDmAsT2dNOpX0djTKcHoi5vP0VZBPqFrw==@nongnu.org
X-Gm-Message-State: AOJu0YyDHzcD794HSEDFxJhC0pZMaopURFrPz/bwboUtErLuzks9p6Rn
 oVTm8SUbcKJI6oTsMo5rtMzX/hoTKIRS0WEVAVU+7B+9WJYAaj0Lc/VQIyknyWAcyTg=
X-Gm-Gg: ASbGncvWGXOuiWUo2ByF3ioJ4XJXCWCJzI86zWUmnj2LN7k9+uunC90BGGJOtzepLW2
 Rk9zw7sjp67HJSiRPN6cZ3/o4nQpuv7r/N4ViZ/xVjAIqzEEd8VMFQmz+jVmU+HE+v7A7j0H8iD
 PiYlh8dExHYgNrbtCmSRrf0tklbXre5wr2VydR5NJPsiK2t0k0oMquu2YHVx+Xt/2cUpDh5po2o
 5GSsDQQI66RSV7W4/xDR0lRqI3fA8T4FCsCDSDbviGsFeM/GWXkpwmvE1iJuY4yjVLg2uhha/AE
 Su9741/g9JbjzzbYVRyDwSkLP3rPeO0q7HsgnEi+vpjcdiqy+12E17Ys/a92o99F26omOFowHve
 0+6L/tkgNbe11pCJE5K3hEn7QMmeBdfFrhBjzDbgm/+3mmQNlDM3UTzPPtfcikK11WcUYvy0mY8
 lC7LYkEBo3Pfk=
X-Google-Smtp-Source: AGHT+IGnxqaazuqopfjBF2D2bxQy7inIkMJjWQtlK4Zk1+ctTwGetZeDZydQBswHM+F6dfF9UIkOVw==
X-Received: by 2002:a17:907:7e8f:b0:b3f:cc6d:e0a8 with SMTP id
 a640c23a62f3a-b72e02d3b42mr1422888466b.17.1762881453143; 
 Tue, 11 Nov 2025 09:17:33 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf97d3c0sm1437124666b.36.2025.11.11.09.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 09:17:28 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 74C82607D3;
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
Subject: [PATCH 10/16] tests: move test_kvm_xen to share.linaro.org
Date: Tue, 11 Nov 2025 17:17:17 +0000
Message-ID: <20251111171724.78201-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251111171724.78201-1-alex.bennee@linaro.org>
References: <20251111171724.78201-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
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
another sharing site.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: qemu-stable@nongnu.org
---
 tests/functional/x86_64/test_kvm_xen.py | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/tests/functional/x86_64/test_kvm_xen.py b/tests/functional/x86_64/test_kvm_xen.py
index a5d445023c9..424d4b20010 100755
--- a/tests/functional/x86_64/test_kvm_xen.py
+++ b/tests/functional/x86_64/test_kvm_xen.py
@@ -23,18 +23,11 @@ class KVMXenGuest(QemuSystemTest):
     kernel_path = None
     kernel_params = None
 
-    # Fetch assets from the kvm-xen-guest subdir of my shared test
-    # images directory on fileserver.linaro.org where you can find
-    # build instructions for how they where assembled.
-    ASSET_KERNEL = Asset(
-        ('https://fileserver.linaro.org/s/kE4nCFLdQcoBF9t/download?'
-         'path=%2Fkvm-xen-guest&files=bzImage'),
-        'ec0ad7bb8c33c5982baee0a75505fe7dbf29d3ff5d44258204d6307c6fe0132a')
-
-    ASSET_ROOTFS = Asset(
-        ('https://fileserver.linaro.org/s/kE4nCFLdQcoBF9t/download?'
-         'path=%2Fkvm-xen-guest&files=rootfs.ext4'),
-        'b11045d649006c649c184e93339aaa41a8fe20a1a86620af70323252eb29e40b')
+    ASSET_KERNEL = Asset('https://share.linaro.org/downloadFile?id=UG0V8dzzHrrHb9X',
+                         'ec0ad7bb8c33c5982baee0a75505fe7dbf29d3ff5d44258204d6307c6fe0132a')
+
+    ASSET_ROOTFS = Asset('https://share.linaro.org/downloadFile?id=VwLRKDXKFl6oKti',
+                         'b11045d649006c649c184e93339aaa41a8fe20a1a86620af70323252eb29e40b')
 
     def common_vm_setup(self):
         # We also catch lack of KVM_XEN support if we fail to launch
-- 
2.47.3


