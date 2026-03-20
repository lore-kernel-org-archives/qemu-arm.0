Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9866109879F
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 15:53:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3c8J-0007f1-JA; Fri, 20 Mar 2026 11:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3c85-0007YJ-3q
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 11:51:19 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3c83-0005Wl-33
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 11:51:16 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-668abc98923so1448179a12.3
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 08:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774021873; x=1774626673; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vtp616pn0VVl4bYnzt5PwIs8bsU7tc9ZvPQ6p1AmMyI=;
 b=B+kOAUQQs53AajIgcTyUamIoE7nxbEWFarGskZSgxS8I6YT7++yw4OZRSVzrsl+IEK
 eamx3q9PzfKbuqlfBUWrOXA4FWEiY7fSllYPfZMXcKoFL3Npr79WI9gZyzr7kLCb/P/T
 v0PPcBnuemnozTnSkdwfjtXqiFDYDeGvN3kET9pnkRYmFV2rXakqOcM5m16vKaPMXeHL
 vIhCOvMAoCq2jVXK6Z5za5MZCG09WfXtyjaTxMKbwJ6aHL3upl2z5om2q4JvdFbjQwTr
 6dZPNLaOc4FXvPTwKS1zuV0OQv80BloLA4gx4rxU8eyuHZx7coaqKiMk2yCGsBaMHXAy
 U7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774021873; x=1774626673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Vtp616pn0VVl4bYnzt5PwIs8bsU7tc9ZvPQ6p1AmMyI=;
 b=W6UDfxxif48BeCESF6CqHm4bmpM9xGlOXVVPb5Y9SLU6HV+kuVwKZjYPxhSqXFXEsR
 3l19LKyxOHPl+MGELtrRalbC7jCvsQcUWx+spMOpGiYQEXIFFN7D++eC9D70bmH3VAcb
 u0xDdPdUW555QKY2TgxSkpCoDdNuBRrVi4aYU9yJNaTW8vJYqEm0lrh72sIbtOqrHQl5
 IcasRLpR3tTHYC2TZBNcriSSaG1nSyweRUDKFmAYu32/RY/+/bQdB81VI3mbRWUdPicd
 r8Cwn4sFYrRMnMi2OoRB0Yxaml1hACCimaybT45P1GkJ1f4JuDP94g7Sw3EoW9KMg3BR
 ICZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3KTyiGBH1gwzAhM9bvDRXHQ4BoTyFeXDeKv6i89xRgf37i8EyhTLxk17gnnZs1eVQcP+ew4U1tw==@nongnu.org
X-Gm-Message-State: AOJu0YxHMHCgcMBTxgUWQmfeYnsPErnkL/tr8rZdDcoZnTyv+6ABsJFH
 ePqtLlaJ/9HaECoow130b+wTHE28tNlqfMSiiYT5B1Mn3ce3qZxxyWNAAVJWjV9UQAo=
X-Gm-Gg: ATEYQzzk8mNDpoZikK6WP5Fd4e8gvwYUrSyeSef8sdeL/XahVMnKexuYFl0XD/bc0Hu
 KWu+5h1ACviWjnuuEhjpdePQi+8rx2N/PFIa00ldcOoRjrCq+0XtAiJtXNrNe7AZDu1gGu6jqco
 MtH4URwO0yxXFfYLRaWg3Z782N5ETugYfZcAjjIp0m46RK5FPD097VF0lRpdpcfADQyKf6wo1AZ
 +Yy2WDMLjRNk3f8/e5OhTK/PPJm9gezwrLUpXRSwcQnSOjDS4NSSa6wvn/MgdCI+HVgf7Z4WtsC
 kfo5iikaLIgu8lBukl4GZZDDvtuRY1b8X6Qem+IJxZx3EvJ2BaUZI+ogE8Vp4QgAPiERLEd9OnZ
 Au3Emub1YyIjnQIPM4zLHEg/DhYDc7qQ0Z0alzZHfNYGI+vJasKn2JJtIeACAiLg4lVnmoBa0v0
 tEtbJGPvxQxk9kh66J9KAM+uo=
X-Received: by 2002:a17:906:cc8d:b0:b97:a422:b435 with SMTP id
 a640c23a62f3a-b982f3a5e4fmr185042066b.40.1774021873425; 
 Fri, 20 Mar 2026 08:51:13 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b983387084asm169057066b.53.2026.03.20.08.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:51:11 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6F9175F943;
 Fri, 20 Mar 2026 15:51:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Warner Losh <imp@bsdimp.com>, qemu-arm@nongnu.org,
 Thomas Huth <th.huth+qemu@posteo.eu>, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Brad Smith <brad@comstyle.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 7/8] tests/docker: Update the opensuse-leap container file
 to version 16
Date: Fri, 20 Mar 2026 15:51:06 +0000
Message-ID: <20260320155107.2143191-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320155107.2143191-1-alex.bennee@linaro.org>
References: <20260320155107.2143191-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
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

From: Thomas Huth <thuth@redhat.com>

Run "make lcitool-refresh" to update the container file to the latest
version of openSUSE.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-ID: <20260316135407.209072-4-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/opensuse-leap.docker | 35 +++++++++----------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index d693f2c6f85..66e90fa3634 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -1,13 +1,12 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all opensuse-leap-15 qemu
+#  $ lcitool dockerfile --layers all opensuse-leap-16 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM registry.opensuse.org/opensuse/leap:15.6
+FROM registry.opensuse.org/opensuse/leap:16.0
 
 RUN zypper update -y && \
-    zypper addrepo -fc https://download.opensuse.org/update/leap/15.6/backports/openSUSE:Backports:SLE-15-SP6:Update.repo && \
     zypper install -y \
            Mesa-devel \
            alsa-lib-devel \
@@ -80,13 +79,14 @@ RUN zypper update -y && \
            libudev-devel \
            liburing-devel \
            libusb-1_0-devel \
+           libxdp-devel \
            libzstd-devel \
            llvm \
            lttng-ust-devel \
            lzo-devel \
            make \
+           meson \
            mtools \
-           ncat \
            ncurses-devel \
            ninja \
            openssh \
@@ -94,11 +94,17 @@ RUN zypper update -y && \
            pcre2-devel-static \
            pipewire-devel \
            pkgconfig \
-           python311 \
-           python311-base \
-           python311-pip \
-           python311-setuptools \
-           python311-wheel \
+           python3-Pillow \
+           python3-PyYAML \
+           python3-Sphinx \
+           python3-base \
+           python3-numpy \
+           python3-opencv \
+           python3-pip \
+           python3-setuptools \
+           python3-sphinx_rtd_theme \
+           python3-tomli \
+           python3-wheel \
            rdma-core-devel \
            rust \
            rust-bindgen \
@@ -110,7 +116,7 @@ RUN zypper update -y && \
            spice-protocol-devel \
            swtpm \
            systemd-devel \
-           systemtap-sdt-devel \
+           systemtap-dtrace \
            tar \
            tesseract-ocr \
            tesseract-ocr-traineddata-english \
@@ -133,18 +139,11 @@ RUN zypper update -y && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN /usr/bin/pip3.11 install \
-                     PyYAML \
-                     meson==1.8.1 \
-                     pillow \
-                     sphinx \
-                     sphinx-rtd-theme
-
 ENV CCACHE_WRAPPERSDIR="/usr/libexec/ccache-wrappers"
 ENV LANG="en_US.UTF-8"
 ENV MAKE="/usr/bin/make"
 ENV NINJA="/usr/bin/ninja"
-ENV PYTHON="/usr/bin/python3.11"
+ENV PYTHON="/usr/bin/python3"
 # As a final step configure the user (if env is defined)
 ARG USER
 ARG UID
-- 
2.47.3


