Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp129019ejb;
        Fri, 17 Feb 2023 12:15:35 -0800 (PST)
X-Google-Smtp-Source: AK7set9qmBM/yU7ahZ39rkUuhEkleABcDL4wlAjITk3TD6l+wwvSK2Ie9fPteEISRNg66MO/ACx+
X-Received: by 2002:adf:e4c5:0:b0:2c5:843e:7c4 with SMTP id v5-20020adfe4c5000000b002c5843e07c4mr6040868wrm.33.1676664934893;
        Fri, 17 Feb 2023 12:15:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676664934; cv=none;
        d=google.com; s=arc-20160816;
        b=esb67o87QHCk1h8q7KkPfjuRV8WdW9j8fcqcWC1jeejUjy8w4qtETjf8WO/cOYwumx
         BSlHBIPOYIgjRRZWw82rzbEWq9cKDkNbZtdwQKyIPbpp/Fpae/0QCM4FDi+Y//RS1Fdr
         M+sOLfoGjxPwpT6rC2URHVb08gFuU9MdTG1iMXW7LGWcIrGY29AA2LVBaCy2FN7TgoMB
         QHguil7+yo1A0IS9riVCn3sBRGvwxY/d1kPK9Yzaq4zJe36s+AwsyjZ2AS/sPOlWY1AU
         Pulg7TVyUODwiYaKui2XJ3sQ3tmTYafahgTLCGt3JteXTzb9D21DkStdCyFHZ5gHyQDd
         muVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=cVx99/M6Pp/qfxaNig6cBB81qvBwVS7AO0drF/iWRns=;
        b=isG0mjG91vUcXTsbXb1hCPQlRQA6nZ6ue5nVSpdOiD46/R5ZwZWmIloNBbrdo6E+xe
         ypRIqn0OAVwrU88TBLYjCu181YP8g7dJk4TD538Z4U/u6MqLvgI6s8XipfqtcshXZRqA
         aJgweZyx5P7LjUaUTPcZ5VWBz2jlODA2euJUJXrGV7SM24V8tSlzQ3UPODTzECaIp5pz
         gfeFSHoN/nHITIFLVs9Wl5TnGwmHTbZKwDV/z/jk6ZcLIXFxuzloTeclSTzQxDUUl6V7
         IPQRz3eK1DUCVZm7S3RmuQQGJVBNlp8Nhb/VKw0Sv/sYN2zRZqKhXcdGaDiuVjdecw4d
         VxpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=SXxmiihZ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=IaNCMTsB;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id z16-20020adfdf90000000b002c552f43445si5220552wrl.369.2023.02.17.12.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:15:34 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=SXxmiihZ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=IaNCMTsB;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7F8E334657;
	Fri, 17 Feb 2023 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676664934; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVx99/M6Pp/qfxaNig6cBB81qvBwVS7AO0drF/iWRns=;
	b=SXxmiihZzhJTmC+smHpEC76qJiAqYy7U/uPUqdw9vlWVRyd+MMMpJZH545nA6mQcHGyB95
	N8pFHnzjaRnERWTy32baFIywBKKDNBhLlUO6hV8UUKEEzGpNYgKT3ugHb5FsP0hYfkNwFv
	1+MOoOtC/0RObiaVj6TKL6T9g9DkLVs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676664934;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVx99/M6Pp/qfxaNig6cBB81qvBwVS7AO0drF/iWRns=;
	b=IaNCMTsBCynRUQ6dYgFxqLDyTbCeCXJb9MQylhZSOGZuyGGxKwnq247LIxKviHEQW7gMSM
	NQLrGI3SRThskKCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E9C54138E3;
	Fri, 17 Feb 2023 20:15:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id gGcALGLg72MwIAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:15:30 +0000
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
Subject: [PATCH v6 28/29] gitlab-ci: Check building KVM-only aarch64 target
Date: Fri, 17 Feb 2023 17:11:49 -0300
Message-Id: <20230217201150.22032-29-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wKHIhnEoe0iz

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
