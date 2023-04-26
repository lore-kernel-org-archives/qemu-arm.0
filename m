Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp593826ejm;
        Wed, 26 Apr 2023 11:01:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ62ht7MGN7vHQg/UVEMQWr9wOWcSwf+9LiE5nyqVmBb/zIRi4HWfMqpKXv6SsG3UNj6Bdd6
X-Received: by 2002:a7b:c014:0:b0:3f2:5999:4f47 with SMTP id c20-20020a7bc014000000b003f259994f47mr4613549wmb.14.1682532067121;
        Wed, 26 Apr 2023 11:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682532067; cv=none;
        d=google.com; s=arc-20160816;
        b=aVy/LyS8+MeC53cPu4hFn1UkAVQ2J9rQlu0aDxkGtV3zrNlaK1M+7CK/aNkSHf7+u0
         2/a3GMe7/sHJOUYT8waNZMq30uEIDfmURbvo35jkIT5aWTS/b1qzNo51otB5M6CmKJjJ
         NAdvl4DEWWxZlWL2wOynmHKImI7cl8wF3Jfp0ONNQnZUNa49ZYxn5NpnWt4NiHp2+W3Z
         QiEAa4HzYhh4s5UEb5y3mAX3ZvWMPUFA3OrVBtTThhHOXuxdfuz1UC/VJi93KIFvAYmI
         cazctwN/tS5Mg2dn2S36SXwCqK4zFxEX0tv1VhHAJFe73WhjVE2qQg6NkwGSsTizNPWL
         MxCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=B1JluXnhU+IJTKAYTzwpUpON0WI8nWSAD0Pn+krBRkk=;
        b=ZUPW82drb7yv3Hs/aq+fHys4lK1r7B82VZzNCDzWzdktdl2R/VfIpd4LBHpeXhtRwQ
         SHHywPHKclzMhFC10d05bsW9tbnCR1PE/MDV/iOf8cGxzikUbg7HIT5zhmKkby9ZGBBN
         Ttqd5n6HY0ObgVh0nOVNbOSKs0oZGXnqQEadD1OScnmhhopLPgORVsShUZ87rIndYlFL
         ZoEudN9kgoOiwjZHkQindyY2yWCE29B9UCOU/Xhcyyo5G71JPTEwzdKOUqX9IVJnlvUz
         U8uBhkaMEgG3vddWvuk6ps7TNYbh8K4xkHqFBinSg622+CNQdE53lYvzbUEYjzNc2jmM
         U5qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=wJWYMxon;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id k19-20020a05600c0b5300b003f193c24df3si8176701wmr.152.2023.04.26.11.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 11:01:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=wJWYMxon;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C37D721A1D;
	Wed, 26 Apr 2023 18:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682532066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B1JluXnhU+IJTKAYTzwpUpON0WI8nWSAD0Pn+krBRkk=;
	b=wJWYMxonEPyM1iS4GzvdMXv/CI4g/IPgKnRbKwsfa9ETaE4yv7Y0ki+FWAMVEZqeix1XH5
	w6fCPmqU4TCjbFzYBJ0WNtUI4zTCLWdhReHPYmOR/o7lFF14Eo9bvc0nR1nWPhRmEmeFYq
	6AcYViBjPpKi5/B6LhTRBB0m9l0MbbI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682532066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B1JluXnhU+IJTKAYTzwpUpON0WI8nWSAD0Pn+krBRkk=;
	b=hobUyFbputlbJZUTnxPe9gaKB37uGah086ypsqqrMeVLZKQc+twBu2D9hc9v/BJQLI9YVa
	tYzFpPc8jZGIpHAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4154D138F0;
	Wed, 26 Apr 2023 18:01:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wILTAt9mSWSoVQAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 26 Apr 2023 18:01:03 +0000
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
Subject: [PATCH v11 13/13] gitlab-ci: Check building KVM-only aarch64 target
Date: Wed, 26 Apr 2023 15:00:13 -0300
Message-Id: <20230426180013.14814-14-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230426180013.14814-1-farosas@suse.de>
References: <20230426180013.14814-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cMb0nW03j6YU

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
index 61b8ac86ee..da787ea9bf 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -196,3 +196,14 @@ cross-arm64-xen-only:
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
