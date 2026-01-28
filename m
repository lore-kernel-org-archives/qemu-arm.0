Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F973D25926
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Jan 2026 10:59:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vl3G4-00024w-Kz; Wed, 28 Jan 2026 05:58:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vl3G3-00023z-1S
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 05:58:47 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vl3G1-00029O-8F
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 05:58:46 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48049955f7fso57922275e9.0
 for <qemu-arm@nongnu.org>; Wed, 28 Jan 2026 02:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769597921; x=1770202721; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=agrbkcnFuSQU928f+MQUS5x78zjmJt+bu4nxcabObN0=;
 b=C7fXruNUMbY1qyiOVDaXCx0PCUA0+32+eqV8ECDKwPXNX/6RYohJi941g79lqTXQz7
 eyNlpl9H5jt+j88ZpHWwv8+zDOX6dqrqCkrNP3F1IAsrwr47P9c9tzsvyqIOnVuhA0f7
 vLWMow/ndLN1SC0LtXGa2gO6wl79N//NLUPJqJT+mP6yZeDF2LfnOrAYrNF4gBsj9Nvf
 fMwOyLfUZ5/ISFGrP7ax7WvXi1murtAENYD2hONjB5eD8C5A82YfcafPQu7nkWXQHin8
 aC+E5Z61i3SPBMQAZhlwGA39RYShZqRBp2HMG+nVtTAO59fnxD5bAd3HMMRUurshL2IE
 ACeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769597921; x=1770202721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=agrbkcnFuSQU928f+MQUS5x78zjmJt+bu4nxcabObN0=;
 b=O7G3ENdzXjSfbQidTKzyoNO3YUCKn1N6d894/U6ULwHbU7y23uASBux9ZGxxzX2L/y
 n53GGU8sX5WKlhcVXUScnfQB5nZ8JGIaxBslXnyIUcjsvDuWEptrPICYj0PwA1nkF33b
 8MD9SrQ7xPhewZlnHsxPZEekffyp2CWgSQ4a+jxy8yX8SAfP5PNmaHGDN5YCi9FYf8Zc
 T0YpmzVyryzoSCsXRoAHE5jIeHkk6sbT8laM9goJVT/lJ0WwK1QvoSGOZ3fl0uHpKOzq
 KczHJ1h+M1ApovIgY3fZyB1GNP7glqaA4s9wreU2eaAXq1BWZpOaejMSczt+EXgGzzY5
 OPQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXby6I5MiWwJW2i31LQwurWYmGMQzfz+Xl8AYzyGXfDqZRHRHEAnN0tj40lucb64SQ7LPAc5qjGUQ==@nongnu.org
X-Gm-Message-State: AOJu0YyrgMiwhi4ddrnPls+xxPfo5BMha97DSeKdcBLwOR8LmrrVjO+8
 FsgRUoE4DELznZ8KJS7NHKWCxYhoPZ9d2VAGx8dehuab6aMROYKLJZLVOBhgtC6Vnng=
X-Gm-Gg: AZuq6aKz+s8L2BXsXwwrQDHEQj3cxKyqqwu52To+0XAOwitIznYb04EKh0jA2RTpmVO
 7uSwqjrdZA3+Wjo5vY/WdwjesikHmcEFZsu0mf1BnK0j9Yf/PHXcswRMyGJsLKDAUQEIMOFVG2O
 TEDHDzd98HuO0u5FSK4CVMwPP1C8LFDi566wfYhE3DRtdSWriu1wF7qnvR8gUOhadVyLHyPckQ6
 SHn5LQG+oESga+nqPRRYZfZvQB9j2uaAth8uZMsaDWSHx4/3lQVhGDAwszPaSzt8jCZIQQ3QC4x
 0ddLs5d1oZrQNQslqLpopn1eu0fRWASPmla0xHOgR+3BxR/eWVOfFsu1j63hD/YF/yRSuD6k0kf
 IEXdn/3qailqi6Ed5n2FwERmL352Prdh5Hn/WOXvG5I3+BnhCEZyXxx0KCfeBUn3evEue6vlMxW
 i8nzR5BuGY+7lFwphnnsClbQ==
X-Received: by 2002:a05:600c:4592:b0:477:df7:b020 with SMTP id
 5b1f17b1804b1-48069c48936mr53908845e9.18.1769597921305; 
 Wed, 28 Jan 2026 02:58:41 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e490esm6044140f8f.9.2026.01.28.02.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 02:58:40 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8839D5F895;
 Wed, 28 Jan 2026 10:58:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 1/2] tests/docker: rename wasm cross container
Date: Wed, 28 Jan 2026 10:58:38 +0000
Message-ID: <20260128105839.3487840-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260128105839.3487840-1-alex.bennee@linaro.org>
References: <20260128105839.3487840-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

Now we are 64 bit only there is no need to keep the generic name. This
also fixes a check failure in the weekly container build which was
checking containers based on the expansion of DOCKER_IMAGES which is
based of the dockerfile names.

Remove the DOCKERFILE bits that were added to handle multiple
containers from the same dockerfile.

Fixes: 4203ea0247f (gitlab-ci: Add build tests for wasm64)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20260127092745.2978371-1-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - also revert the DOCKERFILE bits that are no longer needed.
---
 .gitlab-ci.d/container-cross.yml                              | 1 -
 .gitlab-ci.d/container-template.yml                           | 4 +---
 .../{emsdk-wasm-cross.docker => emsdk-wasm64-cross.docker}    | 0
 3 files changed, 1 insertion(+), 4 deletions(-)
 rename tests/docker/dockerfiles/{emsdk-wasm-cross.docker => emsdk-wasm64-cross.docker} (100%)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index d7ae57fb1f5..2a0cea6ce1a 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -78,4 +78,3 @@ wasm64-emsdk-cross-container:
   extends: .container_job_template
   variables:
     NAME: emsdk-wasm64-cross
-    DOCKERFILE: emsdk-wasm-cross
diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
index 6eaa2f804df..8c7311cca57 100644
--- a/.gitlab-ci.d/container-template.yml
+++ b/.gitlab-ci.d/container-template.yml
@@ -10,14 +10,12 @@
     - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
     - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
     - until docker info; do sleep 1; done
-    - export DOCKERFILE_NAME=${DOCKERFILE:-$NAME}
   script:
     - echo "TAG:$TAG"
     - echo "COMMON_TAG:$COMMON_TAG"
     - docker build --tag "$TAG" --cache-from "$TAG" --cache-from "$COMMON_TAG"
       --build-arg BUILDKIT_INLINE_CACHE=1
-      $BUILD_ARGS
-      -f "tests/docker/dockerfiles/$DOCKERFILE_NAME.docker" "."
+      -f "tests/docker/dockerfiles/$NAME.docker" "."
     - docker push "$TAG"
   after_script:
     - docker logout
diff --git a/tests/docker/dockerfiles/emsdk-wasm-cross.docker b/tests/docker/dockerfiles/emsdk-wasm64-cross.docker
similarity index 100%
rename from tests/docker/dockerfiles/emsdk-wasm-cross.docker
rename to tests/docker/dockerfiles/emsdk-wasm64-cross.docker
-- 
2.47.3


