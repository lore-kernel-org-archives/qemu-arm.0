Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2EAD65C49
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 14:07:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVsBJ-0001a7-6T; Wed, 17 Dec 2025 09:07:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vVsBH-0001ZO-Ig
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:07:07 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vVsBE-0007XU-Ir
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:07:07 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-477a1c28778so63657115e9.3
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 06:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765980421; x=1766585221; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RqJbF03pzWIfxDeKZ726tkMdZpAFN0A9E6eDady4CMc=;
 b=YG6Xuh7mnzd4m8p2sW56SkRUe1LtMvHomPTO8xUS6BioUJDJb/TF6TpXYIkQEXam5b
 qRJ+sc1MBqPBJu+BrFcDZSqshdy2eF2GI2Hq3WdZfiuqnZl0Vu1WVHymh+6o0DWo07+N
 FyjQ7l/0zPZnmTU3z1reCoCVAcuakafpnjr168BEWa0OexnWd6ZdfQLlq0bH9P2GMAPI
 26X1Cww4V+CuIdx/C93VmR0jrO52lgaABHAJ/Yofj0JExML06PHmD+C5tbWiFtjX2Sm3
 ZIrNVVHKUDIJ8YDenA1evlKCptJfL6A0zADVXdZDc5hfj8a3yeuD+9k3l1CljuhzttEG
 dvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765980421; x=1766585221;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RqJbF03pzWIfxDeKZ726tkMdZpAFN0A9E6eDady4CMc=;
 b=Xf/sT0DWK1xUNXKIzvZvvR2MhJEpuwM77RHs5Z6up7EsfQJczp3VhMJOtudI+kXijU
 Zg82LAbKdoqsbhe9O+xDyDi8LMulmZxqwnZlVl1+vj3LaHtKG5QdWG5/6abQeACFSRIj
 8jRqCFLhD0aoni3eZSQ0nqNyrOnN8+cScmYYvwUOlYJBEqTZNtbo+f11Z7LZg77jZnMn
 mUfRz999hl4CKU/+AXqEsnu1wwSO97c/FEWxO7vgRnsqZ2ziNHX5uIygjIkdc8hghW9C
 vmDLvCuE0vwDYHyMjKPVdKHsMeKvK7i1Eb7TJoi+Hx8gy3gKUKQBmFe1io2axJRmwHfN
 N22A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOl/mu1wCbCSnWXA8nF4i4J/mCrzyzl1JQRIymUBk+jUdwY1H1aoxFMugfJr01JucLeZOdhOd3VQ==@nongnu.org
X-Gm-Message-State: AOJu0YyJBTVvlyFp8/fVujLwtWrIEqNegU7+GYdLPSSye/nVp9XladPW
 YcUKYJ5+botF4ncNMEC+UNl2P+q673/pQEx4zWSd2Vw6Xwu+h1fHXjKBpdYuJrmv+0c=
X-Gm-Gg: AY/fxX79Gyya8yx22jx3Aaex9Ppkd1WS1RIW9MGQQcO0LrOkEBGkZI6aErEznaqOyki
 iGB7H8vvCa9drKDcIN6+srjM8cOAmrbuqpZFiC4akJukXbhroFj3d3yjKLJKIuas2+HvQb4AXXo
 qAxR8OVQX/4EtnjlPDk4szHXdP8fES1CTc3fpCYFqm+bgJq0qX3VsTEytfGCV0suhohj+0M/xhp
 b0JLT/1dm+ElQ0KpOUObgppSLglEodZuS8jwQSUR3q331IowEcQfYOYZTWPu2GOmZqI90q0Kzfp
 n8EIvEfMdm/TYKtWsFPncymIEdOnlrEoYVlx8kX+rOzp9ZGbQoUnoPBnHMzvlDlJKZNzJ/VwIK+
 T76B3uBSJj4dlzdhmNygeH6ZaLcUGBm/wP7/Wa/bB6Eu+lsrDjjCd9382GLeog36F3TgLjGhjOJ
 JySeNv204nDK1FrxmKliJ87eKSKlIj95mAN9evDbCnoBSkW/UmgRtiK/SHpuyD
X-Google-Smtp-Source: AGHT+IESdHtjJyxKf2Ol08LO4MNbLIp6u4KXLxytMkRgVgGwn3FIJ+6h5KCfo5XIStIzOYP+/npHMA==
X-Received: by 2002:a05:600c:1550:b0:477:6e02:54a5 with SMTP id
 5b1f17b1804b1-47bd9c7d6e1mr47408945e9.18.1765980421053; 
 Wed, 17 Dec 2025 06:07:01 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bdc2221e3sm37900445e9.10.2025.12.17.06.06.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 17 Dec 2025 06:06:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 devel@lists.libvirt.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] hw/arm: Deprecate legacy VirtIO devices on big-endian guests
Date: Wed, 17 Dec 2025 15:06:57 +0100
Message-ID: <20251217140658.89715-1-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

We couldn't find a way (guest OS with VirtIO drivers) to test
a legacy VirtIO device on a ARM vCPU running in big-endian.

Deprecate for the v11.0 release, giving 1 year to users who
really care to contribute functional tests.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/about/deprecated.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index ac31a2bce42..3a69facb0f1 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -515,6 +515,17 @@ It was implemented as a no-op instruction in TCG up to QEMU 9.0, but
 only with ``-cpu max`` (which does not guarantee migration compatibility
 across versions).
 
+VirtIO devices
+''''''''''''''
+
+Legacy VirtIO devices on Big-Endian ARM architecture (since 11.0)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+There are no functional tests for legacy virtio devices used by ARM
+machines running in big-endian order, which makes harder to maintain
+the code path while the code base evolve.
+
+
 Backwards compatibility
 -----------------------
 
-- 
2.52.0


