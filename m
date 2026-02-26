Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00865FD8FF4
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Feb 2026 18:55:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvgUK-0008GF-LB; Thu, 26 Feb 2026 13:53:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vvgU3-0008C3-8h
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 13:53:11 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vvgTz-0003WY-Pb
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 13:53:10 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b936505e7a0so104802266b.1
 for <qemu-arm@nongnu.org>; Thu, 26 Feb 2026 10:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772131986; x=1772736786; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jlX56k1c6mmvWbzJgq1CjfW4SEALo5lTPBBeHcqvL7w=;
 b=lmYMhj+dIr+OxfkfwFAneMf4gIkjkeMRf79QVCz+ewRXUX3Qmt6qpC/ze02SpKDl/A
 2TTnSXeTgylsWOoedY0A78sAx2iNAgoDIKBMjqiflL4CofPgjcuj1Zbn+rWX0QK9T9T6
 grdcYFOOx9X4zC+QFQvIKDwWXUKCzb0Hil/E6oIAeRG8fBJbyVnIZtOCFHCVqpM0H6U0
 xj1eBvVPHDHgUYhKijXVpKdjO80KsfMi4bJRyqN3UJPWCgf6/NbJX9JADQ2FmvYwksl1
 p89Xc9iWyxujsJSsp1H8jwr4aTAzHIuLw6ZoL3bqqmBlojqkVhOptXr/jbO+KtTtuv8B
 YMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772131986; x=1772736786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jlX56k1c6mmvWbzJgq1CjfW4SEALo5lTPBBeHcqvL7w=;
 b=upbk9XhkMuIfT+v96EIp6dh++FM26J70+CJL6fSz4fxZ1ZM8g8Qdt3T33qDX47yY+5
 eIWOrx3lvL77G1/Ydm0BfJfpF2sIyX6Z40qWftfzkBZBl0E7fh+BpvcyqKYtFBlz9/7W
 xxPA32FBzXKOTVqsgDU24GiCsam7ykhJFgcmh7G/mCgwXO62EmnTwcKBLU/DcVruz6KU
 MWILDZ7Dj5m4exv1QP+6bEoh9V0rLYoUCQb9ZbD4TFMnLQjHHeyEJpMByEDkqwSppKQG
 49ZBhmtWWKk0ngli03Ogtpzyc3aHTpGyQmBp7mpZhOFr054Cn0ER7VnxVtuxdQkWX7hQ
 96Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRixJXi89jxr629jvHCgMiufGglAa/CFHDSfmhkuXSvEegh45dTeoL/IPCRYH8xk7MtYaZ5Nr4Dg==@nongnu.org
X-Gm-Message-State: AOJu0YyUO/qeYOOve10I+Hhg5Q2x9W2fZpyZA/pgMwTL9Ljvfrjh/bHT
 y/E5IktZR8AbfC9S96I2LrcCipNZj18nnWJtXb2WhIdiWQ2fR4hBUlju1ThqXXj9AvI=
X-Gm-Gg: ATEYQzxw65n266YG01Pmg5Q6sHVe7mn4fWgBcDkY3JsXg1eHamdHlRnoNsOwlt/IPpj
 ZVs5ymL6CE5WR5G8ztEqTvHcHeT/CEEN9qMuoHzRbguVa+xeDCdeyVs9/HqoY58pOIFMnQSduWi
 G1b3j3WV8JYzAh+sdvlB5ze2Xhl9q0ceXw7ie34kcWSZ65wt+ojpf12POdINm2v/thn75fMxzWa
 B2cTil1+YY8Hfh05OmTtNq+tcY8y9xFLNiWaHyRmvCp341mI32c4CgpjOW44YNaMRJhuWKT7Q9Q
 nErrl3HeG9P8PG2AXvD/7oGX8pG0JWAJg7kzB1GGImpHil/y3a6aw8SOFZ6wEfrrPAITMFG3jPZ
 bIHpyhz91+TKzn7SQNp7DqtRh0DyDmz+9cp0k8/OxqtODPDGWx1NROvhjAaUOMWyBcTYwuIHVJ8
 Zg5pfgwv+9UijVPYO4o5gSQUI=
X-Received: by 2002:a17:907:1b1f:b0:b8f:c0c1:2504 with SMTP id
 a640c23a62f3a-b9356ee40b5mr255038766b.4.1772131986184; 
 Thu, 26 Feb 2026 10:53:06 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65fac06e48asm749782a12.29.2026.02.26.10.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 10:53:04 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B53BC5F8C1;
 Thu, 26 Feb 2026 18:53:03 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Brad Smith <brad@comstyle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 3/7] tests/vm: bump OpenBSD to the current 7.8 release
Date: Thu, 26 Feb 2026 18:52:58 +0000
Message-ID: <20260226185303.1920021-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226185303.1920021-1-alex.bennee@linaro.org>
References: <20260226185303.1920021-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20260213154859.1551283-3-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/openbsd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 5222041b855..d1289d78d24 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
     name = "openbsd"
     arch = "x86_64"
 
-    link = "https://cdn.openbsd.org/pub/OpenBSD/7.7/amd64/install77.iso"
-    csum = "da0106e39463f015524dca806f407c37a9bdd17e6dfffe533b06a2dd2edd8a27"
+    link = "https://cdn.openbsd.org/pub/OpenBSD/7.8/amd64/install78.iso"
+    csum = "a228d0a1ef558b4d9ec84c698f0d3ffd13cd38c64149487cba0f1ad873be07b2"
     size = "20G"
     pkgs = [
         # tools
-- 
2.47.3


