Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp710209ejc;
        Thu, 23 Feb 2023 05:11:53 -0800 (PST)
X-Google-Smtp-Source: AK7set+uN+WUXAnDDulH9DU6vrhuckN+t6Ropbd24Bq4tfERPpqYmyTplq2eyJ+eVIoK8BIgXiWW
X-Received: by 2002:a05:600c:80f:b0:3e1:97d:6134 with SMTP id k15-20020a05600c080f00b003e1097d6134mr8521371wmp.37.1677157913422;
        Thu, 23 Feb 2023 05:11:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677157913; cv=none;
        d=google.com; s=arc-20160816;
        b=cMAj2NmgWxF5VQ9a5e0OZW8u9/pJWSBRfpKtC8hvjZEb3StFCJKuPCsdOHS30+KVpS
         xlvUxHY1cwxRbSRk+HwSb3p0u6T9uOBbFW+nlgLRpy6U4USymIkwtHBYkeL1k3M1EdHy
         P2AxOJgSc6UQOHMLTv//cV/l8DAhAl2Uz5tGqZwvI+Jq6z3h+9OTOUv+OAgAiBhtQtMG
         rvOpltCG6ZElVKRQXYOAJCAf2/90wyTCbjLfqlgWwUc6Q+/crjKQkBTbp8TwCs8pbY4G
         jPicQS2JByYC0lX5K+abpNxNoGRd2TYAdHzFOeqARFF/W+8ICPkNumHoJerIV4tj3f5D
         1gtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=cVx99/M6Pp/qfxaNig6cBB81qvBwVS7AO0drF/iWRns=;
        b=prhfQvyJdAYWfPZo2G7LHWkRYA12AX7hLixSRSrnhe0lGOR/TmtLESGQLoaLjNkN1q
         gib54WfSB3lUJcGLnIOWGhz5CGvWoS8h5JY/HnKWxO7UFuDx9EaUw1XgOIDwPq/wXDBJ
         tL+LkN9vNaJ1Z5Vm5OsFOPaLcmsCbB5IO4c59nmSad9qe+smtdExndym8TEXPezVoSDB
         8iPaEtJrTBnVtu76nvvfa9Y7YATjU8gUnF2bb3y2e1fVPAILZHXgpr92aQzTRsXUJanO
         HC7gOuBbVTpnoIpoo7wShfKdg6VaKn84ZZ8JPGn1uSDlieapNGKt2N8Y069QSXBdrYv1
         epkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="msUel05/";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id x7-20020adfec07000000b002c552c3c9a7si7117066wrn.1000.2023.02.23.05.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 05:11:53 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="msUel05/";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 103E2218A9;
	Thu, 23 Feb 2023 13:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677157913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVx99/M6Pp/qfxaNig6cBB81qvBwVS7AO0drF/iWRns=;
	b=msUel05/8A9E+/tg7MX9qD5KTIAQAozTtyLTMZOH/S5sZ0mDuU336ixTeXaNvzGjog2Jw5
	5iawJ969YmqEpHG75xkiEXX5aZsBtw5I5t/ENg83qzER25Ila/ppZv2M7zLQb8sLy6Rvk/
	99OzI7kht+xJAGD+2hE8529MPqmMG9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677157913;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVx99/M6Pp/qfxaNig6cBB81qvBwVS7AO0drF/iWRns=;
	b=OEry/gOT0ZiubkQWXJdEUuEWWZN42NiASwB2AniTaNkfqoKK/0+dGzFnEg1HV1hFDURtC2
	xI6A45JLb9PDb2DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 85DB0139B5;
	Thu, 23 Feb 2023 13:11:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UNqZExVm92MLawAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 23 Feb 2023 13:11:49 +0000
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
Subject: [PATCH v7 19/20] gitlab-ci: Check building KVM-only aarch64 target
Date: Thu, 23 Feb 2023 10:08:40 -0300
Message-Id: <20230223130841.25916-20-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230223130841.25916-1-farosas@suse.de>
References: <20230223130841.25916-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: SqW6KjPrKigx

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
