Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp920187ejc;
        Fri, 20 Jan 2023 00:25:50 -0800 (PST)
X-Received: by 2002:a5d:5b18:0:b0:2bd:c2ce:dd5a with SMTP id bx24-20020a5d5b18000000b002bdc2cedd5amr25331840wrb.16.1674203150409;
        Fri, 20 Jan 2023 00:25:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674203150; cv=none;
        d=google.com; s=arc-20160816;
        b=eD+vaUsVhanFVokn3DEhPZU3R3FZKWWEEkVVKIrmiaVTZ+P0OV50HgrC7/unxOojCN
         0Th2EoWb4YgaE713IiA5oLayA1GnyL0LxgcJ0oX6qAP/n5Eh9LA/KPdAesfKQwUfPbiq
         UUNvOex7I4AsDfxDeXYoAIZ6DMtnCjMmQcUaMm+xEsYoeDk17fqpk11uagk/sWi2003s
         7NP8B9Dhngj1mrliNUD8mdwCseBb654gsLtZNwk45Zja/8+gfmY77vPYnPim0xeo64tw
         1jnocQ5+cuRK4Hh9EWo6gyW+/wH5NDU2iXnL7qloxZvpEGE8BNJESMqH5UIcNEL+oQVY
         +HiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=bbjrxOsuOTcth+mLQNmzkRsGZbaHbsEXMCDtE8u0O40=;
        b=lkcmbF0R+1w+hY6cmL5JDMplVrhuCt/ON5hhL7S4QOKnh/bMcpSeYcs+oCDXDIXzuu
         jEtyMhSrZfkR+zeDro75GGzj+Lb3xZrFTInGfgHb/EoS/k/oDNIkQ604mgmjRLpgf8Q+
         WpryQnku7W/9MLFrQTnqJep8/zg70AeU2oB+TN/8yb6p8zLpqj5B66RbI1rsWZ4D5RrH
         uwXmXZofcrqSpDI2nJTkL/oW0CwQSorBIM+7SLk1UslYRKyMPnKNcwTJjE6yGl0D54pB
         9goi8nOZKjoDLHmvK5RwwY/22VtpriSXF9Op8x+9HgU3+Y9b4fmpGoOC2XqEnZVlkkyY
         e6ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DKUZR2gH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t9-20020adfba49000000b002be31f35ea3sor2936852wrg.63.2023.01.20.00.25.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jan 2023 00:25:50 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DKUZR2gH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bbjrxOsuOTcth+mLQNmzkRsGZbaHbsEXMCDtE8u0O40=;
        b=DKUZR2gHdmITvbAeydk/icVEj5PbBK4lH7+RPZZzkspAFeb8L1rUlk9Y+sm2TnkeSD
         Okok7WeQYxQig0okl92fXUdwYg7DiSttl6VuADGabxqXNXpnUe45UvsbGpO6JNcvh6mF
         S0W4MBIs/UKpg/t4GfkRh8rfzVf8g07kqacvnTdYXtuXmaOCwYmPm6rCuhs2IQAsfUgZ
         ZpPtDsf95c5NZqZvlCaDgoDj72YrCQDx7OQhSLZoxi9RsoXuLGnkE/D8gzAyMe7P2E1l
         ZnRNbloBQsp9/arjHz11nbfjC8sBPYhWicfC3biATwRYGVmL0QUnRgp7E1skjXtOtWd/
         hyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bbjrxOsuOTcth+mLQNmzkRsGZbaHbsEXMCDtE8u0O40=;
        b=4VIEv5PodgJ/LbipBJZlxZhgxgA4MgDggNA8SYAToCC0toEW8sAOVv0IVNBlZVTuK2
         csvVQHcU2My3HEAWhIog6tCjZ8i/fv5HjXCNHBKauN4tRLIacCkTlgjmBHusE1dThquM
         0yQV/FEWmyB1qB0wB90T6cA0Y1jAdPtAiHIOlNJS4y7vl/FCF88TXTE7PcUsYC2p/jAi
         r6a9Run8bshEuGHRhKjwY1xQZ3hBNeH8WSaZYSh0OXz9hWyWoB5ueXJFoGGZ5Bjiraj0
         LPDUINtHgeRTq+wwBa77vOoeu/7P+jQevrQ0wKEhqr9sZyOm/YlTUnmxu3eenHvxUF3/
         XaMA==
X-Gm-Message-State: AFqh2koNw/TW4YIBjfbiJkLgKwh66+ra73Wz5EbJ78D7pxXHhozgD/z9
	MbeE6MYT5uCocywPY/4XiPK9FVZijLmmZv0vE/4=
X-Google-Smtp-Source: AMrXdXs4mA9vXqR6zsvkHO2RXdFVrIvustTW8KiKzuHRwNF00T5Mg87BhVRHuC8ySjRrZ9xWdOcGgw==
X-Received: by 2002:a5d:5265:0:b0:2be:515f:cc2b with SMTP id l5-20020a5d5265000000b002be515fcc2bmr2498368wrc.39.1674203150139;
        Fri, 20 Jan 2023 00:25:50 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id v14-20020adff68e000000b002365730eae8sm35621553wrp.55.2023.01.20.00.25.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jan 2023 00:25:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2] gitlab-ci: Check building KVM-only aarch64 target
Date: Fri, 20 Jan 2023 09:25:48 +0100
Message-Id: <20230120082548.60144-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: J75N8yrclUZj

Add a manual new job to cross-build the aarch64 target with
only the KVM accelerator enabled (in particular, no TCG).

Re-enable running the similar job on the project Aarch64
custom runner.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Based-on: <20230118193518.26433-1-farosas@suse.de>
          target/arm: CONFIG_TCG=n part 1

Successful job:
  https://gitlab.com/philmd/qemu/-/jobs/3630178191
  Duration: 15 minutes 25 seconds

Since v1:
- mark job as manual (Alex)
- re-enable on custom runner
---
 .gitlab-ci.d/crossbuilds.yml                         | 11 +++++++++++
 .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml |  4 ----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 8dbbb8f881..2d47a5dec3 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -210,3 +210,14 @@ cross-arm64-xen-only:
     IMAGE: debian-arm64-cross
     ACCEL: xen
     EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
+
+# Similar job is run by qemu-project's custom runner by default
+cross-arm64-kvm-only:
+  extends: .cross_accel_build_job
+  needs:
+    job: arm64-debian-cross-container
+  variables:
+    QEMU_JOB_OPTIONAL: 1
+    IMAGE: debian-arm64-cross
+    ACCEL: kvm
+    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-xen --without-default-devices
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
index abeb33eaff..40ed011f29 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
@@ -115,11 +115,7 @@ ubuntu-22.04-aarch64-notcg:
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   when: manual
-   allow_failure: true
  - if: "$AARCH64_RUNNER_AVAILABLE"
-   when: manual
-   allow_failure: true
  script:
  - mkdir build
  - cd build
-- 
2.38.1
