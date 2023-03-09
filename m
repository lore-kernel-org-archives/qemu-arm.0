Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1122129ejc;
        Thu, 9 Mar 2023 12:15:04 -0800 (PST)
X-Google-Smtp-Source: AK7set8vquG7qKzI7xq0rZjYiDZv1ZF3Z+up2FGbsfdnp8hhpkcYYyVIktZR8CTYB4584b4X3G/o
X-Received: by 2002:adf:e585:0:b0:2c7:1e52:c5a8 with SMTP id l5-20020adfe585000000b002c71e52c5a8mr15059606wrm.21.1678392904822;
        Thu, 09 Mar 2023 12:15:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678392904; cv=none;
        d=google.com; s=arc-20160816;
        b=H975kJPS7TC+aNjQdgy4gmtTuXJQfrMi/FuSqfkSk4tpsK9mlxQNoxJhF0K6nzns21
         K1rWJUzAdcfwpbdVITF/jyFA3mHBXqmoNKvkHSPZKKm8k6xX/pUBaX1aSXidSvogl6mS
         do6Ms1T+QUqPVMp7ajWKPP8dtbZw+bah48R9G9IhSoQAXhcu5DFSYQYr0XrBrg4PmuhT
         9xwdUUsD5qgsqBvqyldtGgji4FgsKjMJ+956NGYUCmWlvDgnkb5fxDnsPSFx0VJzyrWq
         PF18drCVcldI8LL9tfvY/hm1nLHW16Ov7K54fA7MuyzCVIeA4A4vDPXke6s3F51y8tVM
         vm+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=pd1uJcndQGza7Xg1Y9+g3ei6t64IYMU8H5WwIFGir7I=;
        b=MuzWUg+IxsJgm2BMfJ5SYANaGnr+kkDkSC15uR/Nt7KCXWdL22aWSivZdQCxTtGYlD
         ucqXUprZzd5CkvmRKEzeR6voYAdAKhLWqdiO5EL3HG2jw2B3I5vUhUddh2UQJKNF4h0/
         CbfWnufTNgSIqqLj04h8oMq05XehWglo4w+F7d4BHa7tR8eY3eNIfcqPIVbajIBjoXSs
         ee3un8obLhWyNjydaXoOSddLmZ2TZ60shKiM8e751juh1az8+1FYclwmZqz1KBqdQ6Jl
         fTFBRr6RW44Z41lUfC/uA6yjZeNnX0kIrCqnP2rzZ1dKSpoubN4wOIkwWbFO/1Mfquyl
         Hz/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=zcfEL7XT;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=8oFd2f4g;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id j6-20020adfea46000000b002c6e81a7e5csi330070wrn.208.2023.03.09.12.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 12:15:04 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=zcfEL7XT;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=8oFd2f4g;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7281A223D1;
	Thu,  9 Mar 2023 20:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678392904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pd1uJcndQGza7Xg1Y9+g3ei6t64IYMU8H5WwIFGir7I=;
	b=zcfEL7XTq71kvC7c/FaJGhCoazFqPhoJjx9E7gHBX42q+wqN7sW4rQMq56IMGdSlcMSN0I
	sLYMtotF05K21DXWBF8TX6S0x9YVBkqmAsvrJdxz7Fsz/Jc1p7ZeyHAQ+9j0oA+z8lobFj
	R10m4Fyi2yuXRRSZQOBTMne7Vd7GiZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678392904;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pd1uJcndQGza7Xg1Y9+g3ei6t64IYMU8H5WwIFGir7I=;
	b=8oFd2f4g/SirWk3ZKnCD1142V3Y4u4L0U37UKu9eIEH0pffFfyYkboJgAf+hY/HJHY5Bs2
	z9IiojeVUk5qnEDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E1C5A1391B;
	Thu,  9 Mar 2023 20:15:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id MJIOKkQ+CmTUZwAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 09 Mar 2023 20:15:00 +0000
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
Subject: [PATCH v8 07/11] gitlab-ci: Check building KVM-only aarch64 target
Date: Thu,  9 Mar 2023 17:14:30 -0300
Message-Id: <20230309201434.10831-8-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230309201434.10831-1-farosas@suse.de>
References: <20230309201434.10831-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RtTBuVGfu4wm

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
index d3a31a2112..e73efdf719 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -220,3 +220,14 @@ cross-arm64-xen-only:
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
index 13e14a0f87..c61be46b82 100644
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
