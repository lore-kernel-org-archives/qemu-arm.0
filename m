Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2137256njd;
        Mon, 21 Apr 2025 22:30:37 -0700 (PDT)
X-Received: by 2002:a17:902:dace:b0:223:42ca:10ef with SMTP id d9443c01a7336-22c5361d5b9mr214227555ad.43.1745299837433;
        Mon, 21 Apr 2025 22:30:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745299837; cv=none;
        d=google.com; s=arc-20240605;
        b=WjTIUVV1EZvz8qHp/6Lth6xtwHuNlQnWJL25FUyaUVAesADnGGhQi0u1ZiBzKl5+TL
         G5L6KotJFQgJHsLYW7CED7QFff8PwZl7LDlSdCVLVAs+WzPal+mjQ/FUSBLhRTIqP6Tj
         BsJFjBU4w280aLppThAA6YuHvUsuyXzLO0Js+7Coxu4Qc6jDbawitFWSvEuMQNEtAvji
         /eUQFewpEuQ11Kei+/TNSLMyIIHMimKlPmT/wSdWbLvQUDL2HT7WzPB0r6mtIJeRKAo7
         75DVChmyUYhJQPvqpDzP9JZf2tBfQQJmXZUP8F+uE0CldV6PBz/hgbPY3fznXk9XLi8z
         k3aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=239sog6AsGRpOuiETXgLR1hsZQlcMmDhDGFK29CX7lo=;
        fh=po7AwjnYh8YudwNm+SFtdWdiBtVSeJwB7Ac3QFlDgIY=;
        b=LAen3uV3MJA5WL819aIJzwPYxsEqZbCJH03Q/RqkudcQyJfkbOTKHne7uGgaMmNOQE
         5qlUT29bAi47hL3/qww6Gx+Mw3KvldBc+OrS83zqEHrQjYCvkseu6NT7YbXARwNUI7XF
         YVBADsyJANfJIVxoiHyaVAoImu9tUwAh0RQ5eBBoFh/PJa4XKpRIBy1bCj+oIItYc0dc
         xZOSIOlYwExR4faps5sad9wO3iacpbLBGioLtt244D/f8xh6jmF++BvVjBwDDrbGzb5j
         FNijqEX20kWw6yGlShNq1LPtxp53YJjTZCinSpF4WUdr8R4Y2sPrKQRRFOrKoMXeVMlT
         4ytw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=BiOkZOdJ;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22c50be0e28sor53093965ad.4.2025.04.21.22.30.37
        (Google Transport Security);
        Mon, 21 Apr 2025 22:30:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=BiOkZOdJ;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745299837; x=1745904637; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=239sog6AsGRpOuiETXgLR1hsZQlcMmDhDGFK29CX7lo=;
        b=BiOkZOdJ940veWLAMmKVdtji3xtD0A5tmcNwPXwrnSlhHVklVL4K4a3Cv8zRZK4a64
         0oxyfOO1b9Ln4edREbYDSbyjAxhVYCiBxt8EzqDl4uMb5SGEe/IK+jlCE4lXLyUERcm2
         4CHc87j1L5HicLRDHv9/J1azs8Qi7VnSwJTXEjyXmMhePP8Mga3u6TtvYWENte0SKIan
         c0W+4QzTSrbt5FBLTWNNuAAbD5+tyO+HikKU5H417CwCqw/W+7bP+fWznuJSoat4GCeG
         lQ6GpL8nmU5paiwzkm3EFBJlhykLKMXkr6yE/1ppdakklo2UD6FzTNsLvjXYDOjSCjV0
         LTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745299837; x=1745904637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=239sog6AsGRpOuiETXgLR1hsZQlcMmDhDGFK29CX7lo=;
        b=UiyTO0VbJ+XJSA9F/y+qYQDcdF2DsDecZATu3s35YjClIBHdeDC5A0Qsksf+czDItk
         FPNLAjLNHBMyg91GViqU12aTR/BA/FgIn3tvm0aTTFaIQTfgBurEXdOhb/aLOg6M6GmM
         pQ8ppwVDk3OzwgH109xVgAZvsKSZlKvp4Gn1+YGjN09fEIaSRROqDGDjU11U4JXV3fV8
         YBpvh3rZJBuNvM+JLHweQbEMOPLLoRmmHIbJL3Ywvjsl4exAdSN2LLqPjGNanxYK2VI2
         r5YTO8v6LN61qaskHadtpXJ5WFVMcmFTRiFOjkBmUe5HHtx2nfgbIFj/VdElS0FW1rXS
         uNdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+2Aw7B4WQv/H4qGyLgsw6jcOKZZjp++y1dWrwd0F1DWlZspKt/M9VX64ViwpouxIxGsdueIzEl7uKRPdAFU4UAJM=@linaro.org, AJvYcCUEzNN69veIkRMrSZhXGhQeFQ7tBIMXPJOLBUv9fm1hChwLkcEXV7udRIcV/VVTTgzY5d6UwD/5@linaro.org, AJvYcCWul4TTnUbUKoAWEhhXPbq3ZZLYKllnF7ZU/FkafN3g+zuTrc3dDDMlRQPeykCm9K9j9TiWYiQ0pZo8WEcS2esZIw==@linaro.org, AJvYcCXqKWC8uHjB7QIFKOayq6n6XHf/hiTt6tZmpvRU4QoThR/ChE68jX26EZK1eUxKk3idjgyZ6bvecW913xSv@linaro.org
X-Gm-Message-State: AOJu0YyToN+m4Tb1qEpLfUKGsekk3pQa6uE/qfW3uVvqK2cmVTI2K0aD
	DhpRlXaOtRT60Ff9LDBK9NrVGpjhY/T58xPZuFcBCqy0vhOk322o
X-Gm-Gg: ASbGnctgef8Z6rBYpm7xEMCFyZkA7HsksWO24aZK1jbGxivP/cB0IfiooU7B3/rJKz6
	cSsAiLYW0WNnj5bCrcn1WsNbYxR75F4h4k3/czUhdm2QMZv0kNV41LeiX2R0w27LxyivKEdtGwY
	4/a67CkmQxXWrPtYXhvwUkNUvmgM8+seLnyzTr45h4qsQvTyYw8cT6q1b5JVe3efGPa6Iyt5xK/
	FVW1YjQpirvY1fZkvi1gaDSYJSnlaF4Xd3nm177ULwPyMyD+VByCLVzb1kQ1LsSCKWx27JdxXRc
	fU41CWha5nqC8IDXJn9BuL/kwVysdLp+tF/J8MOuYS4pY9PrfVjBb40mg9x3/pLDzPSUWw==
X-Google-Smtp-Source: AGHT+IGGRtHx5fim4xGmJq6v8vkziresfB5+BAuQyo6/891rk0skJGXxaEivPZeVzgS3/6wX99cASQ==
X-Received: by 2002:a17:903:22c9:b0:220:ff3f:6cc0 with SMTP id d9443c01a7336-22c536080bemr230986565ad.38.1745299836831;
        Mon, 21 Apr 2025 22:30:36 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:e142:4a4f:1ebb:3ca4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4483sm75692085ad.118.2025.04.21.22.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 22:30:36 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v2 20/20] gitlab: Enable CI for wasm build
Date: Tue, 22 Apr 2025 14:27:24 +0900
Message-Id: <a9ae4d0fbcde4d837e55c07715a169bcde495895.1745295397.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745295397.git.ktokunaga.mail@gmail.com>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tzru3W7WpXEq

Add GitLab CI job that builds QEMU using emscripten. The build runs in the
container defined in tests/docker/dockerfiles/emsdk-wasm32-cross.docker.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 .gitlab-ci.d/buildtest-template.yml | 27 +++++++++++++++++++++++++++
 .gitlab-ci.d/buildtest.yml          |  9 +++++++++
 .gitlab-ci.d/container-cross.yml    |  5 +++++
 3 files changed, 41 insertions(+)

V2:
- Split the Dockerfile addition from the previous 18th patch into a separate
  commit.

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 39da7698b0..67167d68a5 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -126,3 +126,30 @@
     - du -chs ${CI_PROJECT_DIR}/*-cache
   variables:
     QEMU_JOB_AVOCADO: 1
+
+.wasm_build_job_template:
+  extends: .base_job_template
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:$QEMU_CI_CONTAINER_TAG
+  before_script:
+    - source scripts/ci/gitlab-ci-section
+    - section_start setup "Pre-script setup"
+    - JOBS=$(expr $(nproc) + 1)
+    - section_end setup
+  script:
+    - du -sh .git
+    - mkdir build
+    - cd build
+    - section_start configure "Running configure"
+    - emconfigure ../configure --disable-docs
+          ${TARGETS:+--target-list="$TARGETS"}
+          $CONFIGURE_ARGS ||
+      { cat config.log meson-logs/meson-log.txt && exit 1; }
+    - if test -n "$LD_JOBS";
+      then
+        pyvenv/bin/meson configure . -Dbackend_max_links="$LD_JOBS" ;
+      fi || exit 1;
+    - section_end configure
+    - section_start build "Building QEMU"
+    - emmake make -j"$JOBS"
+    - section_end build
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 00f4bfcd9f..0f92d5313a 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -801,3 +801,12 @@ coverity:
       when: never
     # Always manual on forks even if $QEMU_CI == "2"
     - when: manual
+
+build-wasm:
+  extends: .wasm_build_job_template
+  timeout: 2h
+  needs:
+    job: wasm-emsdk-cross-container
+  variables:
+    IMAGE: emsdk-wasm32-cross
+    CONFIGURE_ARGS: --static --disable-tools --enable-debug --enable-tcg-interpreter
diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 34c0e729ad..3ea4971950 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -94,3 +94,8 @@ win64-fedora-cross-container:
   extends: .container_job_template
   variables:
     NAME: fedora-win64-cross
+
+wasm-emsdk-cross-container:
+  extends: .container_job_template
+  variables:
+    NAME: emsdk-wasm32-cross
-- 
2.25.1
