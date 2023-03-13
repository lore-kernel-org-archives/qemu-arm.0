Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp379270ejb;
        Mon, 13 Mar 2023 08:11:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set+cq+XxK30oFnijeBfDUu2iRcUmklaj8zC9WMSq+ORe8mubMBz9nnDTQ2KNjSuHUBAOeBbZ
X-Received: by 2002:adf:e5c9:0:b0:2ce:a299:a1ea with SMTP id a9-20020adfe5c9000000b002cea299a1eamr5899468wrn.24.1678720301571;
        Mon, 13 Mar 2023 08:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678720301; cv=none;
        d=google.com; s=arc-20160816;
        b=r8vdfQ4CelX1EA5P7DU4/lTYHHNUSm0Rvc3oKu2o5WvyxVH1wWDkxawkLp9BwnidgZ
         9mbJy4ROmD0DFzgqSUvYbebj9aDcJZm6Qc0xU8xzHYD0VPUmrODL9q7YDURBfBYZsF27
         OgehtjVfZIDHmXh/6mDF3m0C/iXnhMHuZQA6FCvkbXTM0exltcFyt5T6YaD0RonemFvv
         Ifpeu6gwkolfM9SoVP6eADKaRX87/ajVXoDvdTvxLyysrzqXpNu9LDSG4evlsg0EZgK4
         oIgJXM3b84UI4AVtvZAKjA5TFfz485Gv1SOBVPsi8Hm/nrx9Vkr2aZ1DhlRDDeEGsN94
         5WMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=B1JluXnhU+IJTKAYTzwpUpON0WI8nWSAD0Pn+krBRkk=;
        b=sGeNB1uIjuCHJoJCiqtaoHRpqHCgEGlc6hyduzQLluWQd2ELbX1YkZ845eAQTsPTAK
         65lHEm55T9axH0k++lE2uY0bIY12GQbk/CqVWL8dAtlyGvRnP9kx6QCVIbp8QYKDd9XN
         dNKF5PuggABT2wZ6y0hwYtvoCvU7JvbXwgH1Do/UNxBYrpSksZ+hUiF9cxPNXNSHYouI
         jUwlv43PzLWQjiOn/e/lJnqIW1NtAp3WYoB0nWzkgk5UcJKTE/Ey5ZpCtP5oLoK9yall
         9nPG+X3dIo8iAvBPPnbirHz18YLqX7PAUDgneywqUJhpFx3iFcTR8cXePJ8wMDphPAY0
         LTWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=LRzMY5+T;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id q7-20020a056000136700b002c7040f049esi7320951wrz.1015.2023.03.13.08.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 08:11:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=LRzMY5+T;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3EE6022ADB;
	Mon, 13 Mar 2023 15:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678720301; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B1JluXnhU+IJTKAYTzwpUpON0WI8nWSAD0Pn+krBRkk=;
	b=LRzMY5+TsrkhFYpmzGgxC1jUohaXZZE/fLEIHF8Efl4DC1xjm5ls9dMGdcfqtbIBvWvDK5
	iPLMdOVqhh22/CkukauWFYg0L6JG082c/86S6kx4oAovWwo0ErLBqMzXo90A0FNR8tUKUU
	/ClY0rV70C4LtRgxm/Edldtr1foE6P8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678720301;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B1JluXnhU+IJTKAYTzwpUpON0WI8nWSAD0Pn+krBRkk=;
	b=La9o1KNKpkGZUUDY4hBePlBxOS/MK3yUOKge6/onrHOfyet9oS0DFAYVmphjGMeweNYFwb
	ocbMZk6f/YToimCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ADF9F13582;
	Mon, 13 Mar 2023 15:11:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KDGdHSk9D2R1YwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Mar 2023 15:11:37 +0000
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
Subject: [PATCH v9 10/10] gitlab-ci: Check building KVM-only aarch64 target
Date: Mon, 13 Mar 2023 12:10:58 -0300
Message-Id: <20230313151058.19645-11-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230313151058.19645-1-farosas@suse.de>
References: <20230313151058.19645-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +OWc9tLdNUpB

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
