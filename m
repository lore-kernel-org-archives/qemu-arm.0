Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8E4CCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 12:15:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBuAn-0001v8-50; Thu, 23 Oct 2025 08:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vBu8q-0008Mb-Eb
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:10:12 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vBu8m-0005FY-Dx
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:10:03 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b3e234fcd4bso136373366b.3
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 05:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761221398; x=1761826198; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XBaCUU+RDMe8Fm+rMDPlvgrTnuTfYc8fUoPcpfBGUms=;
 b=UtqJa0PLmtEhnfQ99vG9YQtbUXM2SfLpyeALj9q+0oHi5fRmPMxgDXErDiE3SwgQtv
 TeWKC4JCD7AsSuiWLhrbbXoPCfcIeyr6XMUgKJuZxOBE2RruxQJDDNZCqwVGHKiQBDOu
 Q8kh1dMTDSkikLRaZXWBy2C51O5yAozLzXKfTBxOumkPZh19TMvUWslc5P+I/VlKqxV8
 bC8xXYoE6yKDhhTr6nbUfHpJWg9iMBCm28jkHftu0BKd28UMOfVJhzliRsKJ4oLvKfgG
 t1Sqnt+Q9NXc1gV3TAlkJPT4Tdzmdve5ilFLkhLYi+cQnIXMe9WGVmubwOZVdrVF8QIv
 9zQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761221398; x=1761826198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XBaCUU+RDMe8Fm+rMDPlvgrTnuTfYc8fUoPcpfBGUms=;
 b=AxgeAXymyu6XvcPYfPRUVjaaHzYJpNB3M+ncXaowEERyUTHrU9uL271A+R+nx/OTg+
 /BmswhSw8G6xaoKuXYdQhtiYinrgh6PyL8MCo5RGjAzqGkORA7asDY5kaZ9ffUL2hGMK
 PfvlGSrXCUywB5Jg7T4WeSdX3TRcs4qsOj1aIxi3fXH2X2pW+0AVJDpRnjmabXXb8yxY
 1GoIBWEMhAITJQhDAiiQejlN5ERi9Iy5XxwOvJHWaw4MH7mJb6bTNyDtgPICdcr27MDB
 OKAsoVMqpZeAKe5X9eN51px6Nm0e6Lp3Zy7JxBoo/KBnMssdYO8MaXDU7DSirBu3j93A
 i6XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+wxryLcsmuS+ZTbFZ5LXzBJGuYEEckXJdRebzlyqJHv5wnSlAOqfp5fEvmuJtdN60HnClO3SRfw==@nongnu.org
X-Gm-Message-State: AOJu0YzjbUWZqQON07PoBtlFklyZ56Y8b2jQbrxXBSggfbcT3TTo7cRv
 hVp7Emyxchvy9ahrsLt/ccWQjiL1eOZ2jk6oda6Qszwhs2fS40AAjRDuoBfEVeANZDg=
X-Gm-Gg: ASbGncvVC8NR+6Jrnc+WWk2c67y6fE8rcCic1MFTWaRSFoFKjzPXaPfKJ1KPRQ0Zb00
 5c80zz3Ap53jCO1EppLkTFvGUUkQMN68jANcQA/QFfnDWRGXGxFN89anF1lxZGk756SYcG2SKR3
 6FQtHOY/vHlVD033Y+0ahB9gCMPiN/o3L6+n8nJwQq8gMce+yjdbV8Hnheb26L9YAlHCp9rViYu
 s5i3hBHqNJZUnpwsUXDKto+T1gC60fHccTdAHpwxZHJe5+lqf4s933mEHzIFHMkULe9Fz2NcHYT
 OXz9v7r40q101g4TSmsSbj/TpPGOzdnP/0tz+hQ1bnhqPJMNmfkZrY7GAewYoId0uV9aaF8j8UM
 8M/F7fz7AffEtGMiXZXoj+FIYDrQ+HY83RRXbMokWB2Z0egai4JfG5uui2JQFgXL+Vf+sgalfhq
 6fOoCe5FJjsxQ=
X-Google-Smtp-Source: AGHT+IGju5177LAkS68mvAkBSeCwg5nW62OKrjzAIPURr+m5J+/u2+zvZQ8AH+6oX+MgL6wrbHY2VA==
X-Received: by 2002:a17:907:a07:b0:b49:3ee4:d4a6 with SMTP id
 a640c23a62f3a-b6471f3bde9mr397420666b.18.1761221398575; 
 Thu, 23 Oct 2025 05:09:58 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d514172besm199025966b.46.2025.10.23.05.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 05:09:54 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 19A3960F0D;
 Thu, 23 Oct 2025 13:09:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 3/7] scripts/ci: move build-environment.yaml up a level
Date: Thu, 23 Oct 2025 13:09:49 +0100
Message-ID: <20251023120953.2905297-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251023120953.2905297-1-alex.bennee@linaro.org>
References: <20251023120953.2905297-1-alex.bennee@linaro.org>
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

We can share the setup of the build environment with multiple
operating systems as we just need to check the YAML for each env is
present in the directory structure.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .../ci/setup/{ubuntu => }/build-environment.yml  | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)
 rename scripts/ci/setup/{ubuntu => }/build-environment.yml (81%)

diff --git a/scripts/ci/setup/ubuntu/build-environment.yml b/scripts/ci/setup/build-environment.yml
similarity index 81%
rename from scripts/ci/setup/ubuntu/build-environment.yml
rename to scripts/ci/setup/build-environment.yml
index 1c517c74f74..66bde188755 100644
--- a/scripts/ci/setup/ubuntu/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -27,18 +27,24 @@
         - ansible_facts['distribution'] == 'Ubuntu'
 
     # the package lists are updated by "make lcitool-refresh"
-    - name: Include package lists based on OS and architecture
-      include_vars:
-        file: "ubuntu-2404-{{ ansible_facts['architecture'] }}.yaml"
+    - name: Define package list file path
+      set_fact:
+        package_file: "ubuntu/ubuntu-2404-{{ ansible_facts['architecture'] }}.yaml"
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
         - ansible_facts['distribution_version'] == '24.04'
 
+    - name: Include package lists based on OS and architecture
+      include_vars:
+        file: "{{ package_file }}"
+      when:
+        - package_file is exists
+
     - name: Install packages for QEMU on Ubuntu 24.04
       package:
         name: "{{ packages }}"
       when:
-        - ansible_facts['distribution'] == 'Ubuntu'
-        - ansible_facts['distribution_version'] == '24.04'
+        - package_file is exists
+        - packages is defined
 
 
-- 
2.47.3


