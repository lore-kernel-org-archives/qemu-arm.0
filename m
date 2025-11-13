Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF03CD5BC1
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Nov 2025 10:35:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJUem-0004z1-J5; Thu, 13 Nov 2025 05:34:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vJUeh-0004il-Ov
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 05:34:19 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vJUeZ-0002Eo-5q
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 05:34:16 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b3c2db014easo106075066b.0
 for <qemu-arm@nongnu.org>; Thu, 13 Nov 2025 02:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763030049; x=1763634849; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q5TZ3YZIekArO8aThmCwKiXH5EbvOU3ltQ8JmLe73dY=;
 b=QyzkdKgA/HquHQEBVLt8/dxg/ygUtPCo2fPIhBsXcw/6MpxvEL9FYFLV+k7Pxzssx0
 PaoSFJH5ZdclQQ3gqzHTSnL6iS7A8Tg7FNBmxsa/Rs4Pjr+z1AzWGHMmj1vq3D5J5vT+
 QWeOAaMxdsZQ4ESDNqRlivMbQqgiXHa9BqqaCpYEu/LwvmwN33/JBgHMo3p/Goz/aLnv
 ZsA8alpMRuAE3FXs2aJ6TdQNzAgEx+IHNRFCPFBgwDuhhJ8j8JufP3/vXJT+TM0cQiWK
 Cl1irgygxdE7aWgxFvS7Q2CTzteNGCwG/o8V047f7mW/wjrtW0m2mOp11HeeOTxC0e9W
 1+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763030049; x=1763634849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q5TZ3YZIekArO8aThmCwKiXH5EbvOU3ltQ8JmLe73dY=;
 b=K7h4ICOcorqcbJRuSUypWhj2yzHIskpeQBfidYsrouRR9zwYxI7kF1xfHttSQxcRuE
 vV3vQqDP1dZVJy0/1VpJehrlvYlnX3VSGzLhpigTkxgKQmUWGwQ38jeX/3pAq/+V7zEw
 vjKW7oHsZvZKcg6P9fZh1yuPtrq/eGhLcUqKqKLkgS7e79vFFjb+GhqzBHn1s8xf5NPp
 i2OD28b+W5n/TDicTao5xduDrwb63bo892hpkf1VaxFhGPPPrXxuDKnH/emIrRvZBBvu
 YSFI0PEw9vVsLptzwB9E0ZGnEyTFrJWx7j1GfUvsLbkQsWl3bgR6mVUr4pLs8sTyfMqs
 oYJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUokvAkwjxT+RR3DCOJEFWHJxznE4/Gd4Hw3u+QpRy3eTIYPXYyazQoxCaFdDsGi5nARIUB1+zCgg==@nongnu.org
X-Gm-Message-State: AOJu0Ywp+ZdrkgUBWWpKsEBkUMYCj3K4YheiN0H9QydBXwFGhDysLFOS
 Q4mdmvQiMsF50CZinb/8q68NVcOHaCXG9+siAFVC7MZ1FVEQdA6eh1rDeu4unacqE6Q=
X-Gm-Gg: ASbGnctlwuylaQewSCv6e9KY5a4fBwo5AIs+R4BQiWx4UQqhJl1UAGzVKe5ZxT8wKVw
 TuHSxNGDVJMCLl35GeykGHVN0remfkpmh4nuBpF5TXtbuPnJbhYJXT5ivq4GigGPPXOovXJZk2+
 iLRj5vWKapxP6M+jllsO2HPvU2Yl3zAh99X0Ns3VlF3HkkV+mbAOv7qk2ZAYaprUdvSePXMWEHO
 RmlZgZTU+fAuenL4fW1jrnwfgpv4DMzmDAngM7pPSWB6AbXlIyXZ+x6koIF7ytgtLG8C5zf5A6r
 R60ICZHsJKuxJLehZl0DRe8+HFULAS/Fzs0VubL8D9RX2Hq0xLyT0J+ReMD4DgO/bUSuPnD8Ebz
 /gUR8Ej07nmue9jlkRjxdPqacgYnCCstwo0l8Xc6bnL1Rb/qES05iSjtyvJ0omwMX40BLKzk4LF
 Xe
X-Google-Smtp-Source: AGHT+IE99KmTVBSLpPgUFbncOXLqFkxue438SLJxzi70Risef0F3opgs0ZvLBVRo4CFKS1CvXm/8cQ==
X-Received: by 2002:a17:907:8687:b0:b71:f9d5:70d5 with SMTP id
 a640c23a62f3a-b73319b06f0mr688110666b.27.1763030049019; 
 Thu, 13 Nov 2025 02:34:09 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa81172sm136616366b.15.2025.11.13.02.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 02:34:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BDA6160DE6;
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
Subject: [PATCH v2 18/18] gitlab: add a weekly container building job
Date: Thu, 13 Nov 2025 10:25:24 +0000
Message-ID: <20251113102525.1255370-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251113102525.1255370-1-alex.bennee@linaro.org>
References: <20251113102525.1255370-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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
container template to allow scheduled runs. Because we added a new
rules stanza we also need to make sure we catch the normal runs as
well.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - add staging and QEMU_CI runs
---
 .gitlab-ci.d/container-template.yml |  5 ++++
 .gitlab-ci.d/containers.yml         | 39 +++++++++++++++++++++++++++++
 tests/docker/Makefile.include       | 11 ++++++++
 3 files changed, 55 insertions(+)

diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
index 4eec72f383d..a128a46469b 100644
--- a/.gitlab-ci.d/container-template.yml
+++ b/.gitlab-ci.d/container-template.yml
@@ -19,3 +19,8 @@
     - docker push "$TAG"
   after_script:
     - docker logout
+  rules:
+    # because we want to enable this for scheduled runs we also have to replicate the normal rules
+    - if: '$CI_PIPELINE_SOURCE == "schedule"'
+    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+    - if: '$QEMU_CI && $CI_PROJECT_NAMESPACE != $QEMU_CI_UPSTREAM'
diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index db9b4d5e57f..f7d3e7205dc 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -33,3 +33,42 @@ amd64-fedora-rust-nightly-container:
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
+  rules:
+    # this only ever runes as a scheduled build
+    - if: '$CI_PIPELINE_SOURCE == "schedule"'
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


