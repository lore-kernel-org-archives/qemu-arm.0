Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082FFCAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 17:11:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v40Lu-0008C5-K2; Wed, 01 Oct 2025 13:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v40Lr-00088j-Hn
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:10:51 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v40L9-00035v-9b
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 13:10:50 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e61ebddd6so548355e9.0
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 10:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759338595; x=1759943395; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jDAIolH1CN/Y6WT6kqlnDeutBCmAlNA8EpHKknjt6uI=;
 b=LYupmypSHLiza+GG+THTk5DLBJKxOIN21vCM6+BEAdt2StsxppczFR5cIaUUR2wu3O
 wJG9A16JqF0mgI7yvqujM8V7X/bx31+pCqUlFYvHyKvS4eaXi1K2KFamF9AOCm3LBdhi
 8BmEjNH7GT6i1b3PXDZAf8KogbawYQpCfGzUAGZP8EgaZyHugb2xpzjxHalWNx6l7rLa
 Nj58znqqpyeeoJL4ahsuaAv5b5SmcZlC4EhiEosbsw9Qcs2eJNmcfg5lSpyUEQS6o9wV
 ayns5MppQ1UpBuCyd4DstULoIhGRlaZQrwKi8Sww0hN8XmrCrSSFYC15Bn6j2XmGuw0d
 kiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759338595; x=1759943395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jDAIolH1CN/Y6WT6kqlnDeutBCmAlNA8EpHKknjt6uI=;
 b=mEG4eEes7LXJzMRcJ0zoLGuPfsTZEo8QibIUXosjiZTw0hF/1qB/j60VwdLsMkBOYT
 loej8PTSE/equG02ZfUUD0Yc7xNnqfnlCCuYKMZYH/5HaAuvd2ia68PcEPmZxPu15aaB
 aFAigNglzc8Ob2fIT0o0JmFCUXooMXQSPnBf8JmPhWw27Wk0QdzNK8IGnSA5oikG2i9j
 j2XgxS3iND+zzyAL47I/vjH5HF7pM2tl0+hrYvHFcSTm2Z7d9ry/vTF/uK7h/AF0Knv8
 jMLQJMOl32Qdn73tc5RchoXVAiS46YsCCh4IkCQD4Yvwo4xQnk+EEKFL0iA/N+/GLWRM
 cMZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF6CuLljI7WiqcKiIbPSO5qMr5NH70Cni5JxdATKyuUSTSkasRVyAoBqES3FaBnBH5ZncD/TW4fA==@nongnu.org
X-Gm-Message-State: AOJu0YyOieETgvzGNDrbUAadn70t7B6EkR+v8H9k8MR+tqkckW9bKlLK
 5Iq/J8l5Tp0UCIOI6Cr9lEWnt/KTfPY97Ov9J5Lckz7WpAFoHd8aYJAqmDDhLFzllNI=
X-Gm-Gg: ASbGnctcdHDlEaOCc4d/bxzMvUS3wVtCZnn+Sd/RHiEk70YgcSiUpRIchP7K9I3od0C
 QqM20xopuMbYmt2J63UtfPIPDlqHMC+1E+mRhvSxuT/Sf+479TNIZ/mQooCrH9QybNdhrfXmrUH
 yOmqy9S06RQZljFpJyn2r0kEr74Aw6s6oKDJWVpI2+jP0JcUGffqs23VolB6XNcjidLomCqRaDj
 jwhImgzAbN1vwzfjlg6151FDUdfbc/CrrjSl6Z1WB7E6sk/jH74M5lhw2FJPXeSSnjnAvi5tzrb
 iMj5Va86KdzDo9qwKpMZIOj+8hFcSfZuq20U5XIA8HlcapOs4nyfhM1dqL7286A8JuItO0lA9J0
 wtKjNZaU4F1deP0Tf9k5SYQoncr5r2rFBOdqKvBZ7TU+po0c=
X-Google-Smtp-Source: AGHT+IE2yMbVUdeVjG9xHIDpWlmwMDHl3WqquBZp1+5BZnsWhRLDo5HuLoDJPVXS6YPHs3K9MOI7LQ==
X-Received: by 2002:a05:600c:45d0:b0:45b:88d6:8ddb with SMTP id
 5b1f17b1804b1-46e612e6d66mr35995985e9.37.1759338595485; 
 Wed, 01 Oct 2025 10:09:55 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e5c45be65sm39420765e9.5.2025.10.01.10.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 10:09:52 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2AB855F85F;
 Wed, 01 Oct 2025 18:09:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 7/7] scripts/ci: use recommended registration command
Date: Wed,  1 Oct 2025 18:09:47 +0100
Message-ID: <20251001170947.2769296-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251001170947.2769296-1-alex.bennee@linaro.org>
References: <20251001170947.2769296-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

The registration-token method is being deprecated:

  https://docs.gitlab.com/ci/runners/new_creation_workflow/

As a result we can drop a bunch of the descriptive stuff as that is
entered on the web UI. We don't need a secondary runner if we just
create one with both aarch64 and aarch32 tags.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/ci/setup/gitlab-runner.yml | 12 ++----------
 scripts/ci/setup/vars.yml.template |  5 +++--
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
index 7350f6cff4a..7025935487a 100644
--- a/scripts/ci/setup/gitlab-runner.yml
+++ b/scripts/ci/setup/gitlab-runner.yml
@@ -16,7 +16,7 @@
   tasks:
     - debug:
         msg: 'Checking for a valid GitLab registration token'
-      failed_when: "gitlab_runner_registration_token == 'PLEASE_PROVIDE_A_VALID_TOKEN'"
+      failed_when: "gitlab_runner_authentication_token == 'PLEASE_PROVIDE_A_VALID_TOKEN'"
 
     - name: Create a group for the gitlab-runner service
       group:
@@ -95,15 +95,7 @@
 
     # Register Runners
     - name: Register the gitlab-runner
-      command: "/usr/bin/gitlab-runner register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list {{ ansible_facts[\"architecture\"] }},{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
-
-    # The secondary runner will still run under the single gitlab-runner service
-    - name: Register secondary gitlab-runner
-      command: "/usr/bin/gitlab-runner register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list aarch32,{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
-      when:
-        - ansible_facts['distribution'] == 'Ubuntu'
-        - ansible_facts['architecture'] == 'aarch64'
-        - ansible_facts['distribution_version'] == '24.04'
+      command: "/usr/bin/gitlab-runner register --non-interactive --url {{ gitlab_runner_server_url }} --token {{ gitlab_runner_authentication_token }} --executor shell"
 
     - name: Install the gitlab-runner service using its own functionality
       command: "/usr/bin/gitlab-runner install --user gitlab-runner --working-directory /home/gitlab-runner"
diff --git a/scripts/ci/setup/vars.yml.template b/scripts/ci/setup/vars.yml.template
index 4b355fb80fd..e9ddc05f3b0 100644
--- a/scripts/ci/setup/vars.yml.template
+++ b/scripts/ci/setup/vars.yml.template
@@ -6,5 +6,6 @@ ansible_to_gitlab_arch:
   x86_64: amd64
   aarch64: arm64
   s390x: s390x
-# A unique token made available by GitLab to your project for registering runners
-gitlab_runner_registration_token: PLEASE_PROVIDE_A_VALID_TOKEN
+# A unique token made obtained from GitLab for each runner
+# see: https://gitlab.com/PROJECT/REPO/-/runners/new
+gitlab_runner_authentication_token: PLEASE_PROVIDE_A_VALID_TOKEN
-- 
2.47.3


