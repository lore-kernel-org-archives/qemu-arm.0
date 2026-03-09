Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940E1FCA168
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 17:50:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzeja-0000py-C4; Mon, 09 Mar 2026 13:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vzeis-0000bG-Ts
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 13:49:06 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vzein-0002pK-D5
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 13:48:54 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4852f8ac7e9so28745895e9.1
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 10:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773078526; x=1773683326; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cX6U5804XBxhUOM0jVAkZj5LN38FPZyQexevD1dDtcI=;
 b=xQ3DFVDG9VQNW2PmhAFbkHAk5YV/UwqD9iZCIKD/xeoSOmR63GjUOZ2TqiZRKjawCC
 vBCta5qrBOsZw1kJGLSBVU3Sn/aSHkxAtc4tWC1c96D1xr5mMva9uJKAAy59IiB6RoAd
 NBnISDlWOcyrpA0dBcRLSOUB1D9YC4ndRYpWkg+nTfNLYupzwLAlfF11Y/zZE8KZn2NW
 rdMEKm4EE1kXTZlENeTxRbT85knswV+Ac8+Ao/ZkQz5nlVcFu51+EJDArlv8wVKulXDe
 ubcy99dJq9IbLl3OjI0/IJ7B3FHBdvp9ypxWmGll+lQydLXAs5jr7YoumXhCLLBbDQGB
 AD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773078526; x=1773683326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cX6U5804XBxhUOM0jVAkZj5LN38FPZyQexevD1dDtcI=;
 b=CEqwrZfNS6Z/R6Xr2AhuMB51aV/bSB8oT77g6tzJoeGVFWs8wzQ0WDpMqEByLwBtuI
 HpUDpRBDSV+sEF8srOyMF9ZXeRDI9xuPnkFq2wixJrVjjoSDiW1/uuhfEnYrpqD1oREa
 +cEfzvp4kmWdyVsmpJMn5LZQ7+H6uATdBudumFcj3l/Bno8D8NlqQ0LMDlVIXPKUeb+T
 dWTs60FRl45/ZQ6t3B1dYCqKKu5Du+wQO1bzMZWSxlc4lLV5OdWIr1PYbCTjy015Afhc
 ESLIyAUGIz7OFlAZoJ9TxAzTLTGJI/5IuMqgSSHVLwV64xzZLH4ByHYUloZFarQfKl23
 SNgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJMk7Uk5qO26s39I8dsWwwoqpg5Min8HWHE2vI0MrE6VPZmvuDY3rcRNLxXENKAEhgrnttyUSU5A==@nongnu.org
X-Gm-Message-State: AOJu0Ywuj2SswyK78G3Fpx1SfuqZ3YK4qL7em9cDW9ZhTgdDxEAILxaR
 nlpp5Rs87JQhlTPXw5zLBqageVNWTnLLxtFQasbfELBHlgAf1vu1e9G9tvqQubpdUEQ=
X-Gm-Gg: ATEYQzzlZu3FrANBRpMkZ0xwE4foFBmCFlWjPGdFOv4IScbNAdVZOuw/eYclE59tS1Q
 PxuvuHj0ASuEoq9BXfVX7mZKJH3B4NiCu1wt4pWbYJMwSFUWrUe+Esfg9CvB8B+45XcO5PuQxNs
 IDy7d3ySi64PPclpi/10WK32ugmKAFMGUFxXpV4OkuWIxrutUXgGj/FjXRBCpnwz1+3wExASWEz
 tRLCgfVjhw4BN0u42W3e9PHZfEgwNBq8prTV2RZIp6nz2W+MJbhRmLoKGUadhwYKz/kP1WP2CoK
 +VXhUCcQRvhseg4PqXtt7Xh02xIUT1jxo5XKLyX0dazXkbhVtWa6yq7vsYJN4sggX+1xv1D8szn
 nho5YzSmvS8Il0vCObDxi/QHM/lzkFbt4parHUO6sGp8qcH4nU77MxT5czpCz3HW0zF1cRDzhgQ
 ohLrfwASWfbr+Qp5o1+FsHX1w=
X-Received: by 2002:a05:600c:64cf:b0:485:35a4:939f with SMTP id
 5b1f17b1804b1-48535a4a174mr104580995e9.28.1773078525750; 
 Mon, 09 Mar 2026 10:48:45 -0700 (PDT)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485237f354esm94164175e9.5.2026.03.09.10.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 10:48:43 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B64065F894;
 Mon, 09 Mar 2026 17:48:41 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 1/5] tests/docker: add gdb-multiarch to all-test-cross
Date: Mon,  9 Mar 2026 17:48:37 +0000
Message-ID: <20260309174841.4184117-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309174841.4184117-1-alex.bennee@linaro.org>
References: <20260309174841.4184117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

This allows the gdb integration tests to be run as well.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/debian-all-test-cross.docker | 1 +
 tests/lcitool/refresh                                 | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
index b73776d95b5..287770a995a 100644
--- a/tests/docker/dockerfiles/debian-all-test-cross.docker
+++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
@@ -59,6 +59,7 @@ RUN DEBIAN_FRONTEND=noninteractive eatmydata \
   apt install -y --no-install-recommends \
   clang\
   dpkg-dev\
+  gdb-multiarch\
   libclang-rt-dev
 ENV AVAILABLE_COMPILERS gcc-aarch64-linux-gnu \
   libc6-dev-arm64-cross \
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 3e4b026035b..259e6ea0729 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -167,6 +167,7 @@ debian_all_test_cross_compilers = [
     "  apt install -y --no-install-recommends \\\n",
     "  clang\\\n",
     "  dpkg-dev\\\n",
+    "  gdb-multiarch\\\n",
     "  libclang-rt-dev\n",
     "ENV AVAILABLE_COMPILERS gcc-aarch64-linux-gnu \\\n",
     "  libc6-dev-arm64-cross \\\n",
-- 
2.47.3


