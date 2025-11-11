Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6921CCFA18
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 17:19:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIs0R-0006lt-I0; Tue, 11 Nov 2025 12:18:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIrzu-0005dR-Bn
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:17:39 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIrzo-0003wE-7n
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:17:38 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b7277324204so3478566b.0
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 09:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762881450; x=1763486250; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OPdQm12yC36NDao0BppUosTnYIa4jpYkMli2ixai1T4=;
 b=oY2HrC3PeDa9V3WcQ5rPsrLRo8xZdcTrOCT/3SavGlI2GsbV4nCJrz+HX9JSbf7xwB
 vFyK9zG4jQmaGZbJ8SrrPCBhxE3AbdEL4LP1fu3rIUvpuzt0GYTV3Em9NCN4QDhxisRW
 XlDDxFEdQOxJdzKor5OksI5NZFjWeJt6ezPtSu3Q/Tqcm//C6VsCd5QnvD2NkwuAikiC
 gU2/sy6gaOLgsRhuRX5uePy2JdwsFuv0bcegMdmypZPUVIpb3xSx4phrrID0mbu77pV/
 0Z2njYz++3+sS9oq1nif9n45IoS/qJpMlyBEL3Q4Ht1TUvFeBzbLMMPtKiJQOET6OOxz
 B8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762881450; x=1763486250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OPdQm12yC36NDao0BppUosTnYIa4jpYkMli2ixai1T4=;
 b=n5Go6oKhWKN/b35HYZoWz/fPRo+T9nmDoYCX7prIFtVInou3uoo0PHKdOmMLkEn5Z6
 pziFK7uKleGxeRA1KjybgJjEKnw7KFXtrlENSchnk0Z6mIk8Uo0hVlcweWCXvSrairm1
 kcbb/h8ln7vlW7DJe9K9qjGQeWRf+UlfSm3ItAYuFhbLpug6Qvus4ghqdMAWWFVA8qoW
 RX/2Me++r+yrOR0i2XYZfkIEWdI1nnaa3XiR8PS5BHJDW7VCaBxC3IzoJrKjE/RLwz3/
 +qCtGFmrycAjxhOpn+7q72hlJSbDmfvnx1z76L5beaOB6MdLPRuWgp+MDw3eKiZgXSZJ
 oZ7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfGBeDwhQUFiJKzrfQ9YdM/rN3kfhEV8hVOnl2/YBXiW4Pvoi2WLsuA3+zWZaZKkNVEeU4UAWnAg==@nongnu.org
X-Gm-Message-State: AOJu0YwzkAxY7QcKcRaIY4AxqNMFEaSTEhTroPEY+bvJdqz28i/PD4BJ
 5JV6kHR2sElO0gtr0XgBAfMuuH4ycba0Q9Q/9G6RjOxSDPpVH8Aw4fIHDJ8cwt9aQek=
X-Gm-Gg: ASbGncuFWZVHn8gGssHVaq53H2On4Q3z3u8UlDEglAymkrLenqvuAbbwNd1J2ErKbvJ
 EiAXqnEdaGFpXiGxIGZrwqO7i2evdUCU93rMgzcrgF2LGwTf/HjKiXQCJV0UWdNDTJdWAXQEMnf
 JlJwbT9ToOVC4PncBjCHcCl2nNrA0vHgYnKlvtV4ePMyTywusLskdynPqHvjIV476X8wGCEnB2B
 6LKocmcOlgo6NPkR7tkiaXyjkrSdLtIU5pUAFjf9VXaWYXyg3JLhPqwmf07/K9po6jfqDV2JfSu
 pnW5kD7FyNF3t0/7YI3gXgl6it4rJ544J50XOXM8/aw3AyICF5pIp3CNi3tSPyjeRGkdMQM7UUD
 5z1jERMpJ5YWso+QKb82YWbqjt+DyS5q7Fx0CjPxtDMK+BTtAxG8/yRjfPq/SRI+nlIMMVmO4sj
 3VvYqnLep88fU=
X-Google-Smtp-Source: AGHT+IH+rK2GA7uh5HKBO1jaj3tI3CfVnhRFhz9xjXbKspzP5ImutQx+E55V77jS1UOrApsTg4GEug==
X-Received: by 2002:a17:907:5ca:b0:b4e:b7ee:deea with SMTP id
 a640c23a62f3a-b72e031ca37mr1457232266b.27.1762881450222; 
 Tue, 11 Nov 2025 09:17:30 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf97d0f3sm1467793866b.48.2025.11.11.09.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 09:17:28 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5DB95601A6;
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
Subject: [PATCH 09/16] tests: move test_netdev_ethtool to share.linaro.org
Date: Tue, 11 Nov 2025 17:17:16 +0000
Message-ID: <20251111171724.78201-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251111171724.78201-1-alex.bennee@linaro.org>
References: <20251111171724.78201-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
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
 tests/functional/x86_64/test_netdev_ethtool.py | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/tests/functional/x86_64/test_netdev_ethtool.py b/tests/functional/x86_64/test_netdev_ethtool.py
index ee1a397bd24..ac8a92512cf 100755
--- a/tests/functional/x86_64/test_netdev_ethtool.py
+++ b/tests/functional/x86_64/test_netdev_ethtool.py
@@ -16,16 +16,10 @@ class NetDevEthtool(QemuSystemTest):
     # Runs in about 17s under KVM, 19s under TCG, 25s under GCOV
     timeout = 45
 
-    # Fetch assets from the netdev-ethtool subdir of my shared test
-    # images directory on fileserver.linaro.org.
-    ASSET_BASEURL = ('https://fileserver.linaro.org/s/kE4nCFLdQcoBF9t/'
-                     'download?path=%2Fnetdev-ethtool&files=')
-    ASSET_BZIMAGE = Asset(
-        ASSET_BASEURL + "bzImage",
-        "ed62ee06ea620b1035747f3f66a5e9fc5d3096b29f75562ada888b04cd1c4baf")
-    ASSET_ROOTFS = Asset(
-        ASSET_BASEURL + "rootfs.squashfs",
-        "8f0207e3c4d40832ae73c1a927e42ca30ccb1e71f047acb6ddb161ba422934e6")
+    ASSET_BZIMAGE = Asset("https://share.linaro.org/downloadFile?id=QD37GYYAJhGOgVe",
+                          "ed62ee06ea620b1035747f3f66a5e9fc5d3096b29f75562ada888b04cd1c4baf")
+    ASSET_ROOTFS = Asset("https://share.linaro.org/downloadFile?id=YAqnr0W8fruDh3f",
+                         "8f0207e3c4d40832ae73c1a927e42ca30ccb1e71f047acb6ddb161ba422934e6")
 
     def common_test_code(self, netdev, extra_args=None):
         self.set_machine('q35')
-- 
2.47.3


