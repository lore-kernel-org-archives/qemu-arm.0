Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93B0CCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 12:13:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBuAl-0001ut-1M; Thu, 23 Oct 2025 08:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vBu8o-0008MP-Hd
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:10:09 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vBu8l-0005F3-5o
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:10:02 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-63bdfd73e6eso3767783a12.0
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 05:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761221396; x=1761826196; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e7kEo0ehhrs7dmuoByZ33JGWoarerE4gA39Srxdfv20=;
 b=IQFThk6HCimSx4mXxdh6JyhownWauvEUiqU1zFmP/sFrguz3T1Wyj72iEwrd4Oiv9O
 LLPtxFxpNGDJRowurVpuZuqIMrBTh2xxsLeYZrPVlJ8kCsJWyw5FF9Rj7arOQVAj+7JV
 O5rxYhR3USlhZ8+N0bhUR/IMUVMz1AbDS2NqAiWxMMNYkTEN2y5AhuV1Zjshuxob0zGO
 RQoILWi8yJY9G+jQ/Z0vGntm3LIi/D7zIm8e/1SqFtFWuwyGVsmCLnCvR677tAq9ULGR
 8JFlRZYe9uv6JNZHLk0kNqSKybWaJqQhp7v7NaPYu/26PiC4VCPAqKqd1v4OoIhbGt7/
 9PaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761221396; x=1761826196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e7kEo0ehhrs7dmuoByZ33JGWoarerE4gA39Srxdfv20=;
 b=voXMuwPv8UsDvA7u6M9wNhhVLq6NkkH+ZZed7XJQpgqX9vM84KYBdmikRAPJGj28cp
 +txGBhKdUa64BWe73RqabcnNdmzMnQbSIcV6lO0Z/HFhGCXujFSEVXkbPKeo3bAfxFZF
 btUxMJLQX2/Wjf9FPdY40guNTAQDK7tHQzBVwFt2akInzG8AhJ7P+X32Gw3QlQUTSlMV
 LBna0XfhqIoOBypt576ZSHd3scUkCutxGEiSLemyGDklhTdrYIVIwvxCrAKu3k9+jFuS
 9geloEgXqCj/2j4Mj1QUbBQijKqc7ihthln2erpLatr9Vg9VvDNmLCIG8I6aXtv5iuGo
 cJHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPK4K1id6XeDYjHPMB2Tqs9GLrVMvYWsuurXbHPcB9rUkwroLFLtZ/rzQFa45qKtgz/nsjnrkafA==@nongnu.org
X-Gm-Message-State: AOJu0YziYPsQt9mqffzpk6tvYtDdraMutgzVYpyCiYLIRf1i4O9Z9IvN
 uGQeR4u/ATMHUEqMuh88e7oESifFDFfQDT6cAvr53DWe/5jyK/bnSGakkK2EPvGyj54=
X-Gm-Gg: ASbGncuMZNw6Hnn9nZdxVoDCil0AEQAme/W+LInVkH90hj8WchX9niRreucn73QxqPZ
 FE1/cyVRTYv3bprZuKmq7V0NPXJyabSz1S6FTRWCdgaVqbUBjZBwJHE58nXS8HcmA42JSu4QgLu
 JUzx6I5avGVGBGFn9ZYd+cGMFCZAWKu8ueDgkvCspNXMSTk5/p79rJgQ8uLENwjLtciracWkaMa
 EDQUF8Xk2+jjJ7Ijn3rc0FwublYRsot5ASBrIH5Hoax8+IUputGmvjGFtvLzR3zcWrR/hQRoRM3
 G6qSpZZV3+1+qB3UZ4Mp/BnJumkSG0w6Mxxw3VT4Sn/ocU3lsY95sfFZqdIL8TmOn+rXNZYZpte
 ScWL+gQA6zfizXjoNpIKM9ilv+Ur3+lWZd37Kommi7A2VR8ClhNuLvhqpDPv8BmV9iQNF5fuC6v
 zPuJECTdTCFK0=
X-Google-Smtp-Source: AGHT+IEvpmRwqYVcJ2yk9kpI6I2lUqRkAZa0A2tps/HGJ0AODiU/o5oW1TZrDQT6d4myyT5ODqDlhA==
X-Received: by 2002:a17:907:6ea1:b0:b3d:d30b:39c0 with SMTP id
 a640c23a62f3a-b6d38b72161mr613298566b.21.1761221396305; 
 Thu, 23 Oct 2025 05:09:56 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e3f316cccsm1562165a12.24.2025.10.23.05.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 05:09:54 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E3F0A5F8B1;
 Thu, 23 Oct 2025 13:09:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 1/7] ci: clean-up remaining bits of armhf builds.
Date: Thu, 23 Oct 2025 13:09:47 +0100
Message-ID: <20251023120953.2905297-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251023120953.2905297-1-alex.bennee@linaro.org>
References: <20251023120953.2905297-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
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

We no longer need to support 32 bit builds and we missed this while
cleaning up.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/testing/ci-jobs.rst.inc            | 7 -------
 scripts/ci/setup/ubuntu/build-environment.yml | 6 ------
 2 files changed, 13 deletions(-)

diff --git a/docs/devel/testing/ci-jobs.rst.inc b/docs/devel/testing/ci-jobs.rst.inc
index f1c541cc25b..b92d372a0a9 100644
--- a/docs/devel/testing/ci-jobs.rst.inc
+++ b/docs/devel/testing/ci-jobs.rst.inc
@@ -168,13 +168,6 @@ If you've got access to an aarch64 host that can be used as a gitlab-CI
 runner, you can set this variable to enable the tests that require this
 kind of host. The runner should be tagged with "aarch64".
 
-AARCH32_RUNNER_AVAILABLE
-~~~~~~~~~~~~~~~~~~~~~~~~
-If you've got access to an armhf host or an arch64 host that can run
-aarch32 EL0 code to be used as a gitlab-CI runner, you can set this
-variable to enable the tests that require this kind of host. The
-runner should be tagged with "aarch32".
-
 S390X_RUNNER_AVAILABLE
 ~~~~~~~~~~~~~~~~~~~~~~
 If you've got access to an IBM Z host that can be used as a gitlab-CI
diff --git a/scripts/ci/setup/ubuntu/build-environment.yml b/scripts/ci/setup/ubuntu/build-environment.yml
index 0f8ec5fab04..1c517c74f74 100644
--- a/scripts/ci/setup/ubuntu/build-environment.yml
+++ b/scripts/ci/setup/ubuntu/build-environment.yml
@@ -19,12 +19,6 @@
           - '((ansible_version.major == 2) and (ansible_version.minor >= 8)) or (ansible_version.major >= 3)'
         msg: "Unsuitable ansible version, please use version 2.8.0 or later"
 
-    - name: Add armhf foreign architecture to aarch64 hosts
-      command: dpkg --add-architecture armhf
-      when:
-        - ansible_facts['distribution'] == 'Ubuntu'
-        - ansible_facts['architecture'] == 'aarch64'
-
     - name: Update apt cache / upgrade packages via apt
       apt:
         update_cache: yes
-- 
2.47.3


