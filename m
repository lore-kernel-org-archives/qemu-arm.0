Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp281496ejc;
        Wed, 12 Apr 2023 05:19:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350YIbsdZ+Hfj2OREOihAwGmB4GuCe5W/7cn4p7cGj46LRIKi6bZSdBE8Az+/1CUatUfEp6Cb
X-Received: by 2002:a1c:f716:0:b0:3ef:4138:9eef with SMTP id v22-20020a1cf716000000b003ef41389eefmr13078940wmh.36.1681301958478;
        Wed, 12 Apr 2023 05:19:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681301958; cv=none;
        d=google.com; s=arc-20160816;
        b=FbhTczNbm30OyKojHZzWV1KIXVCaZ080Oo+kfRfN1p4y5oKgpYLhHDfhJB+PjHrfR0
         tRhmOjvDOp5o04UgQfYEYW2+HQlERmq8Uc+nYjnPdpSIQuj837jFr2H94woD2DKgOuct
         NcJtexRP+K+9oAYIYiS63JitAU8SAGfNtQqc9MdLStgInB343/a6Xb3P/fs+MfPQEEq+
         fna+3gL2Nre4ZPbIfBX3Udek5cTkpSIjxSKrzqd7Rf6HaY+h5f4i4b6bpAY/vaCanRyT
         fKmuztKjpRTRU/7w3+J5ZpXY/bZrilm2TzHDFbaTHp6NTo8H3xaxBj1dDv8RpKC1sxZc
         U/pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=B1JluXnhU+IJTKAYTzwpUpON0WI8nWSAD0Pn+krBRkk=;
        b=DsGZzfJ6gBUvPutEnEj2gitQMQKzUVhF5dgeBSbb6SFTgxZt01yKmDGELSYyqeLSR2
         bMrRry3wgwjYYhWO8vnbfZlI3stUyKdEVKBsteK0Ok7pDOqC/xNE+Jeya8S9BhNW1IIh
         t7KIjX5qO/qE2aeLjJMDncvdpoZSXisjPKbEK7HgdiBfsP4esSWOcbxtlXrHuZG/N+ir
         x2nsQxU8wUdC1Si451tjj6syElznCFWE23wGykPWa4S6XwnkCJ+ns04a0zeCLyf4GpjG
         2gny7W56MUDW4qRAsqnX1HOXnb0juxtAlFP2gowlDdQr9idaNjAFvANEufmDrolEzVZf
         HlzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=c+9qcS0d;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id w13-20020a05600018cd00b002d6f7a90367si10856958wrq.598.2023.04.12.05.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 05:19:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=c+9qcS0d;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 29A442197E;
	Wed, 12 Apr 2023 12:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681301958; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B1JluXnhU+IJTKAYTzwpUpON0WI8nWSAD0Pn+krBRkk=;
	b=c+9qcS0dK0W/ah8VIFZal/yNQtEUyUG+VQly2hRV1Gs43DdXDZjS4ZFGFJVpvwosGOlC/l
	U7VxX1KjrBBoBoSTCa571hCxFY1VsDRa7A5XzyON0gqiLb89GT1OD4TWPY3NmrGUbIoKsZ
	pyKczBWVt4CA4SJsMpt8sGN+H7yT184=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681301958;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B1JluXnhU+IJTKAYTzwpUpON0WI8nWSAD0Pn+krBRkk=;
	b=BYTxjZXqZ4Ijc9HXlFkt+QM+RSN67qcKoN1/cAzEcuJlkzLv+w14XEWHlCT4rJuM1ajthy
	rusUebronMnnVFCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 654D6132C7;
	Wed, 12 Apr 2023 12:19:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sHHJCsKhNmSMUgAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 12 Apr 2023 12:19:14 +0000
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
Subject: [PATCH v10 11/11] gitlab-ci: Check building KVM-only aarch64 target
Date: Wed, 12 Apr 2023 09:18:29 -0300
Message-Id: <20230412121829.14452-12-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230412121829.14452-1-farosas@suse.de>
References: <20230412121829.14452-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2+BPcMyd0pq9

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
