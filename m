Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6099996ejc;
        Tue, 28 Feb 2023 11:29:02 -0800 (PST)
X-Google-Smtp-Source: AK7set9ImEahDMTad9Y4SCnQ6yGmC3SWCgVOR3eZNMNN21xGVStp6Rx+SskZcMpVStdBYFvlsrkg
X-Received: by 2002:a05:600c:3b14:b0:3ea:d620:57a7 with SMTP id m20-20020a05600c3b1400b003ead62057a7mr3231397wms.8.1677612542754;
        Tue, 28 Feb 2023 11:29:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677612542; cv=none;
        d=google.com; s=arc-20160816;
        b=ar237VIUGiRsmvKn2ctM0ty/zmGwkuo/8uurWOazlW9umhDJvYoBxDBwk9IkNTFSPM
         pJ9b6W0itTNcqwyEkONJywmyv0wL9YWa+c8UB3J3CGkF8aJNCNTDOgnkFNXwWZEMwYKX
         IiDDmUW1qYg91YBCJfBvRI8MwITiR5lP+uZTralAxxMNyBRRPEd9XjkVaZX/QbA+m3cs
         r4/WVv92jFRQTUmtQ3pC0rXF5wlvZ3nfifQuMqSImhHIxc/MLPtiB6cOOmsTKFdDPQSQ
         uLRcywi3PtrQmZ+N2PNs1eqoppy7pFzlJ697lF8XgEj6GfYwUpWbs63E1AMxXQNeTYRQ
         PwqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=l4/87AG6FGtdZrutVSYL3Mf2MUNzW5FyqQPULdr+1qY=;
        b=z0A7GR3AzEQs7hvrXVmftlNHHO4hj/KkqGJy2H0QRWa52c8SNNuBWYcvLMnR14fNrj
         V3mxvlqpwzjiJa6zZWNOPYt5rAf6IsctM5+mUD7RIf+DqRP1x3wsBGhBadLZcz0MJG0O
         r7lIhpE9d18vG0GDuQbu2EIhMeRqDzlj3ujXAkxOFnizpXD5ci0FaWIDx4kJ6SQRzrYT
         xibm/AKdYY18fXs1qkxHTSVXyWfO6sxKOoXKirnn1UZSN8WvnU5YaWZCHjuSYpLv7PE+
         chunOyxxmSV3mCJlSsn12pVHJTy25c0/f1rmdsRvIv16PGXwnx3N8m2lnr3ivJ84beAz
         4Bng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=hpt2ksVz;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id z16-20020adff750000000b002c57b74788asi8992079wrp.523.2023.02.28.11.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 11:29:02 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=hpt2ksVz;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6135321A79;
	Tue, 28 Feb 2023 19:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677612542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l4/87AG6FGtdZrutVSYL3Mf2MUNzW5FyqQPULdr+1qY=;
	b=hpt2ksVzYkLLXEEI+b2dAwUtbpdh1RkG0HPb3QufK24dtrUQsNBN+9gV9RfSc5e7Rdwbul
	/ulCnZYO95rBdjJePjVvHT2SVTWAB84bgtBdzmppACT+ZENT7cKu9Lx9FKuET9GfNs1Gov
	57Sj7HmGqamuhGoH4ApY4a+lqAm2WtM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677612542;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l4/87AG6FGtdZrutVSYL3Mf2MUNzW5FyqQPULdr+1qY=;
	b=2QgU79mjcEqgFUw1+8r3lIjVAXcXMmc1jfRvOnfmsLVSOxkJIQfpEK6xhD5xnubx+P088J
	cHL/qVk4VagxXMAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DDC031333C;
	Tue, 28 Feb 2023 19:28:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GMwLKfpV/mNBagAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 28 Feb 2023 19:28:58 +0000
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
Subject: [PATCH RESEND v7 8/9] gitlab-ci: Check building KVM-only aarch64 target
Date: Tue, 28 Feb 2023 16:26:27 -0300
Message-Id: <20230228192628.26140-9-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230228192628.26140-1-farosas@suse.de>
References: <20230228192628.26140-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9n51YZeSJ6nU

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
index 101416080c..65678e2870 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -214,3 +214,14 @@ cross-arm64-xen-only:
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
