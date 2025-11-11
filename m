Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384F4CCFA1A
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 17:27:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIs95-0000Nt-0A; Tue, 11 Nov 2025 12:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIs65-0005mP-AI
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:24:01 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIs63-0005Dq-Uv
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:24:01 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b72dc0c15abso1974566b.1
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 09:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762881838; x=1763486638; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K0ACTmVCm6Itx0zI8K5haUPy7qTi+867lgA6yGc7lBA=;
 b=MH0FfBpfV+jYQpmqAgrkefNq/tvWCKiRutM8F/6Lk3EP/yYyKBDOc9CsczLjrbO7T9
 GPsPFT2jT+ZRKpfPhEhbdfKSKmRtb11YA/Tbvx5MGdkZrE5mveDuvEdYBkOSX9uDKbap
 AAInYFGfIFYuCbcK4TeFLv1sHj6KGHRgJ6+Hy1qOJS3DN+N+0PFtTIHKJfAfuRgQ6MtJ
 21ouiU1f7bYHBEaxVUUQDkf1aqwudHNAmdnPTnphe5n/X4MBBqBbiXWM/DE1w2s4bVGo
 Pt31kXqoTHE5qkfQ1lAB1p4p8XcP3t8JT6m52gKSpsoYpTv9fXu6txGXyzDmaCXx7rsn
 69vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762881838; x=1763486638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=K0ACTmVCm6Itx0zI8K5haUPy7qTi+867lgA6yGc7lBA=;
 b=AgL/6c5sb+XDM15BDCIlK4SnBz1ESWYtanVbBZZp98gEMsxdX89ik2B55DWD9S90Fz
 gN2RwRj5RH21u98ftD+yYNOIFEe6CmP6NJvy98dvIQ/KL+fKixtCP63IBH3nNsefgZ3V
 AoXzxZy3oCF1Vt+bTQSWFSyGJMeDI38AN+ujmtMnKuIzJF5QBaRY3gPgGpHkl3hw0qW0
 SPlRJuIzmZYZ2NT4vsJ9b50GfndIW6xS4/03JFAo4TYJv/NK1TrDAWYWvdlE5l6wn4Nq
 EWHoAQ96aTyldhgbhuu4DAgK8JbweV1+/kj+ADXCc/Wt/qi6yx6zHhgIVBJReeinAsPj
 aPyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4rBKM24de2JfYXVKd2ApWcXX+KiTflq/AUuuSptnaAL67MgpaDFw/yUHAtOS7XAlpnITX9eTamA==@nongnu.org
X-Gm-Message-State: AOJu0Yw9K8wX8TBhbCBOT+0BLGfbSz7dP9rN+nRPmIxJWlYQc/JyvnUo
 /5thfbM0jzWke8qYHf7X2Q5CXLT8+4xQuLhUZFjYS0mCTyKSaHkGCc2C7OOMZXfcd5A=
X-Gm-Gg: ASbGncuq2qC0mD68cnfXfaNn8ZAWE2UVbPNd6JSRnwQa+iWdMArVldzTmvxoTv2DHyq
 hMutylkJR2KEAaOjJG+pN7LVhRAkDVYYdhBK4V7UqDseB7LZp01Z7+f2MI7FlFhmkPaSGXNIxX2
 Lsi2i1gqM9yx56J9KAyTq/Yuxzo4QZ0mdeyr2NUDETV92aFXNj3WLk7gPBMcQ+23ADHa2s+Etmk
 PXraCZdbzBDYe4c/4r9EIUU9ri9oyQnwkHNbnJAdOpf/btNezxNZWj4Vw16jRU0lArnYsbTb2Ku
 x2PZm/Zg3UBijjGvMmlr59dlgkBUSvFU9pTPvfQhQB0kd7AcmUkHomgh1s5s45cj3NRQe7i+gNZ
 GWEpT/e0akslYPxqs5MldemP9vJN9HLmvXDSLj6MJwC782/s4L1kKzA2ZyEwiba3qZQzg5ZUmR9
 yu
X-Google-Smtp-Source: AGHT+IHOgTKvV05M8SeaSy+OisZ/2MMINvTFVzOX/apXVwVgnzFRJuQ+iIbLbW+MgAOPOtkk/8FUFg==
X-Received: by 2002:a17:907:3fa9:b0:b6d:5262:a615 with SMTP id
 a640c23a62f3a-b72e045bbe3mr1021878866b.41.1762881838431; 
 Tue, 11 Nov 2025 09:23:58 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf9bc83asm1368958266b.51.2025.11.11.09.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 09:23:57 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 1D62A60DE6;
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
Subject: [PATCH 16/16] gitlab: add a weekly container building job
Date: Tue, 11 Nov 2025 17:17:23 +0000
Message-ID: <20251111171724.78201-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251111171724.78201-1-alex.bennee@linaro.org>
References: <20251111171724.78201-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
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

This will hopefully catch containers that break because of upstream
changes as well as keep the container cache fresh.

As we have all the container jobs as dependants we tweaks the
container template to allow scheduled runs.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-template.yml |  4 ++++
 .gitlab-ci.d/containers.yml         | 36 +++++++++++++++++++++++++++++
 tests/docker/Makefile.include       | 11 +++++++++
 3 files changed, 51 insertions(+)

diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
index 4eec72f383d..5385d1b5685 100644
--- a/.gitlab-ci.d/container-template.yml
+++ b/.gitlab-ci.d/container-template.yml
@@ -19,3 +19,7 @@
     - docker push "$TAG"
   after_script:
     - docker logout
+  rules:
+    # Allow for inclusion in schedules
+    - if: '$CI_PIPELINE_SOURCE == "schedule"'
+      when: on_success
diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index db9b4d5e57f..9bf6d39b264 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -33,3 +33,39 @@ amd64-fedora-rust-nightly-container:
   variables:
     NAME: fedora-rust-nightly
   allow_failure: true
+
+# this scheduled job will trigger all the containers to build
+weekly-container-builds:
+  extends: .container_job_template
+  allow_failure: true
+  needs:
+    # core
+    - amd64-centos9-container
+    - amd64-fedora-container
+    # cross
+    - amd64-debian-cross-container
+    - amd64-debian-user-cross-container
+    - amd64-debian-legacy-cross-container
+    - arm64-debian-cross-container
+    - armhf-debian-cross-container
+    - hexagon-cross-container
+    - loongarch-debian-cross-container
+    - i686-debian-cross-container
+    - mips64el-debian-cross-container
+    - ppc64el-debian-cross-container
+    - riscv64-debian-cross-container
+    - s390x-debian-cross-container
+    - tricore-debian-cross-container
+    - xtensa-debian-cross-container
+    - win64-fedora-cross-container
+    - wasm-emsdk-cross-container
+    # containers
+    - amd64-alpine-container
+    - amd64-debian-container
+    - amd64-ubuntu2204-container
+    - amd64-opensuse-leap-container
+    - python-container
+    - amd64-fedora-rust-nightly-container
+  script:
+    - apk -U add make bash skopeo
+    - make docker-verify V=1 DOCKER_DEFAULT_REGISTRY=$CI_REGISTRY_IMAGE
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 3959d8a028a..38467cca610 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -49,6 +49,15 @@ docker-image-%: $(DOCKER_FILES_DIR)/%.docker
 		-t qemu/$* - < $< $(if $V,,> /dev/null),\
 		"BUILD", $*)
 
+# General rule for inspecting registry images.
+docker-verify-%: $(DOCKER_FILES_DIR)/%.docker
+	  $(call quiet-command,			\
+		skopeo inspect 			\
+			--format '{{.Created}}' \
+			docker://$(DOCKER_REGISTRY)/qemu/$*	\
+		$(if $V,,> /dev/null),\
+		"VERIFY", $*)
+
 # Special rule for debootstraped binfmt linux-user images
 docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debian-bootstrap.docker
 	$(if $(EXECUTABLE),,\
@@ -236,6 +245,8 @@ docker-run: docker-qemu-src
 
 docker-image: ${DOCKER_IMAGES:%=docker-image-%}
 
+docker-verify: ${DOCKER_IMAGES:%=docker-verify-%}
+
 docker-clean:
 	$(call quiet-command, $(DOCKER_SCRIPT) clean)
 
-- 
2.47.3


