Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp547725ejb;
        Mon, 13 Feb 2023 12:33:18 -0800 (PST)
X-Google-Smtp-Source: AK7set9Htbx5ARchYyB4HLKpSAjmYyWQSjIy9KowM79T8n7t8FC/fI0LuxCnVerWI/gt8BaL+Hru
X-Received: by 2002:a5d:58c2:0:b0:2c5:4fb2:7c72 with SMTP id o2-20020a5d58c2000000b002c54fb27c72mr6672377wrf.26.1676320398743;
        Mon, 13 Feb 2023 12:33:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676320398; cv=none;
        d=google.com; s=arc-20160816;
        b=B33poX+sjsWSiQ1+38oBthYEss9ZuiIqio6neTUccyNcacwgAlUvRbYn8MNxXXwgMY
         8V24KQOHC8Qk90rwPhQq17THXcaUUeXhUeoxPlGsGip0zeLYtLJttJf8OqLYTzJ2mfww
         GkS0AhOVacqQG4uApSBXfy9tFvQyOxOqWMDnxiu3mWIG1WbukFSdEuVOlbsnZVPZ5+E1
         3MMDMWR1QcSkNdNmORQs2WWOMZVD1Lnb3EbJ+V3vMaRd8QBvDzAm0Mnjn/+fxkF+9Rhi
         ubJ5u5U2zJ98s41gngVcvSDoXBLQmojkYT7h5dLmjks1pb5wX+wxgMB4jTM5k/IOqCTX
         HaNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=cVx99/M6Pp/qfxaNig6cBB81qvBwVS7AO0drF/iWRns=;
        b=qicC+YARGncygd+ixhlpybn3X3zAgC493FYNaewy35Qv/EZ3XYZ3xwFPGeXFiuLn48
         0Z4+4a7eNF9Ci43RsLVpv4NWhSNM6vMBh2Y9pGq/ql2FrqnuwuEj97/lvqV0sH6PDipu
         0LzXfE1YlvzBs3lKHAEfaf5MnSBKDmIgCmvqUUvAC6/lQLksBB42xin1E54FQzVFEOVy
         xJuDQiyLVVWEd11wlDgXIb0TVhEa1UDB/qGK0kANHQoiPBVXCBy+zl2nVobEc5maAFDS
         ayMnvKvpATQZM1Yr2EWagzW7Ls2QgYDgVNISSSAJMHZNiIqB/3fsf74xgmH5WM2YxhRy
         9axg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="TUO8p//F";
       dkim=neutral (no key) header.i=@suse.de header.b=0bOg2h9f;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id l9-20020a5d6749000000b002c3f9b91d6bsi10415156wrw.619.2023.02.13.12.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:33:18 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="TUO8p//F";
       dkim=neutral (no key) header.i=@suse.de header.b=0bOg2h9f;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5B81F2021C;
	Mon, 13 Feb 2023 20:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676320398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVx99/M6Pp/qfxaNig6cBB81qvBwVS7AO0drF/iWRns=;
	b=TUO8p//FxjTYAzST8ZqhadGS6TfE1RaW030RBCQkfJKnd9fGKr53F1lmNAX9jZ1mfLDiiB
	1KgDoCtkH9XPdKKU2JbdXyiKzbkg2BycARPUFGrMv1MVbNJhjot1sots0t3AdG3wgnftr4
	vbhRKkqjFPiRYOIKtrdLLPC4DT4DwcY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676320398;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVx99/M6Pp/qfxaNig6cBB81qvBwVS7AO0drF/iWRns=;
	b=0bOg2h9fx/GvVPV6K72QTKL7hYeHAs84B95Ic9OBOcSVGeVsMGxl7qE+Bp/vshZ2MrACos
	yC15CL5L7ZAkjHAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9C50D1391B;
	Mon, 13 Feb 2023 20:33:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id AKhOGIqe6mOVMwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:33:14 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Cornelia Huck <cohuck@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH RESEND v5 28/28] gitlab-ci: Check building KVM-only aarch64 target
Date: Mon, 13 Feb 2023 17:29:27 -0300
Message-Id: <20230213202927.28992-29-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KHuUoiTu2sQk

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Add a manual new job to cross-build the aarch64 target with
only the KVM accelerator enabled (in particular, no TCG).

Re-enable running the similar job on the project Aarch64
custom runner.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml                         | 11 +++++++++++
 .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml |  4 ----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 74d6259b90..80269a3656 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -212,3 +212,14 @@ cross-arm64-xen-only:
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
index 8ba85be440..770e596242 100644
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
2.35.3
