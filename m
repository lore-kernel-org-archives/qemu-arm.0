Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587E6CCA476
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 13:47:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7DR1-0003vB-F2; Fri, 10 Oct 2025 09:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DQd-0003Mp-Lw
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 09:45:03 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DPZ-0008IE-RB
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 09:45:03 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3f2cf786abeso1872289f8f.3
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 06:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760103830; x=1760708630; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SVmBpopuxGyBeEyWAig0HXJ3MlnyOWpUsG2v3Vq569c=;
 b=gaJB9s+nCe3ffbsl8FdewdVjXtIqPMDVnOl9p6pL/4O/YhK7rCUa65hjSP4inONDj9
 Lo4FRXU/AiR7g1LN8zpUoGAL+tNPK3aVDJ9Ig14yd+m1V+58qMLHD9XnR+rgP8sZQ/p+
 OGjfeXnLe3QIB2jm13NJBqkgOcS8RRhVGZsCuWAoEK/MH3Y/iBel3TSOyejGN0nIkkB2
 rwoNnOb6+jk7957gwePfo7erz/IYnwEnrL+SGYeDwMEAZOHNF+nH5kGToFYFiUKrP11k
 lGH73AgAN6xi39gFzPyQSQD22nqxgU0oCvyx16NcKj2poBOmD2ospRZWRo4AXshfWX+n
 TUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760103830; x=1760708630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SVmBpopuxGyBeEyWAig0HXJ3MlnyOWpUsG2v3Vq569c=;
 b=rLErNdASyUOJ75sWX4qts2oZbEBxRnhvFw1uf2R8Rc992oPKkq0Fg18SPmJ3gyVWwL
 BslzNLmmj93rfBUpv2z5e1xOs1CGySI3x4OUHnjD65yN4w/Ck5Z/r+vF/KVvYqYUhWHx
 k/SghZhh2l/RjZjDsneBfkMHCEGDnKo1aa/U/jIXY2JI4bRbYGuW9ncS6OXSjkXqN6jm
 38y4XvzCJwW+5AzK0DgKVxNYtIKXRiGUL8SXqqYyZph6qUT1SoG3BGoBpKfPX+ZtjghU
 lyqhCdcRxSuYSkYvqPpmYAxkvYjDbIOfgBLxmYmAVCf1ejIoLTE2bYCMATQpS407waJF
 nT7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoLqcqxhVJvRu8iy1hyCW7Qi6EloLmLTbg0O0A7cYpEhlwdyO0i3AwRGu0wlQRkvjN/X0PzRr6RA==@nongnu.org
X-Gm-Message-State: AOJu0YxtVuEfPeLrEj3Cv7VefWrwHSPajI9CZMXzYAs2ZS+SDZ1zJEGQ
 7OejQXW7hexTXE9BdD7qUOtYFny8OvTHGpgIaAEevErEa4lmJB+IOazJmEeWE9IqBAY=
X-Gm-Gg: ASbGncuKF9kIo9J7TcSrhNEIRwYkUbajC/CXVh6aMSY/XuIIUJh6Mk9/kx3FKEVinjV
 M0ZHOJlUbqHz7mozlHPhSGl432gwttCFVzw+aLiyCyEKIFy86uOhe7Ew7XADGBg32e8y5c01DGY
 Pp7L0BenfmAgf9X9QGY2vNYcgpGp375YXA6BQXUQbUfnkdEMQKL8+AET4vbP2BP6PSBpgdPt1mC
 CnLuSnkATIPfZEmUXfhJ7Lt17qM6SKd6L/Dc7xIcckyjtF9349iXCBElYwov08BrtUmWgNt6fRI
 LZchQE9SF7qga3Xrxt6WZDEj+TtCsYpHEcAxdq7IY+oQNHpo9o0tikbvVivRowu5Wr+9E+mYL/c
 y0t3gXhe5Tn2+VnqGhYZH2yGsji+U2wFhLp/9w/TxTC6UcNDs3+5+63ry3mc7LZbVqVLnjikgk1
 DMdjCcNeKWL0rqX73fYCw=
X-Google-Smtp-Source: AGHT+IHpCh4NsTCTnU+KcZ3zDYHCjGYLR69f+unQkVBekBH2DU9Q4LQ9CuvU8MrK4gEZpOyYtcSTdg==
X-Received: by 2002:a5d:588b:0:b0:3ee:1368:a8e9 with SMTP id
 ffacd0b85a97d-4266e7befe4mr7573305f8f.17.1760103830283; 
 Fri, 10 Oct 2025 06:43:50 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce583424sm4269500f8f.21.2025.10.10.06.43.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Oct 2025 06:43:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH 15/16] target/sparc: Replace HOST_BIG_ENDIAN #ifdef with
 runtime if() check
Date: Fri, 10 Oct 2025 15:42:24 +0200
Message-ID: <20251010134226.72221-16-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010134226.72221-1-philmd@linaro.org>
References: <20251010134226.72221-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Replace compile-time #ifdef with a runtime check to ensure all code
paths are built and tested. This reduces build-time configuration
complexity and improves maintainability.

No functional change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sparc/vis_helper.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/sparc/vis_helper.c b/target/sparc/vis_helper.c
index 371f5445a1f..72926dfb7b0 100644
--- a/target/sparc/vis_helper.c
+++ b/target/sparc/vis_helper.c
@@ -462,15 +462,15 @@ uint64_t helper_bshuffle(uint64_t gsr, uint64_t src1, uint64_t src2)
     uint32_t i, mask, host;
 
     /* Set up S such that we can index across all of the bytes.  */
-#if HOST_BIG_ENDIAN
-    s.ll[0] = src1;
-    s.ll[1] = src2;
-    host = 0;
-#else
-    s.ll[1] = src1;
-    s.ll[0] = src2;
-    host = 15;
-#endif
+    if (HOST_BIG_ENDIAN) {
+        s.ll[0] = src1;
+        s.ll[1] = src2;
+        host = 0;
+    } else {
+        s.ll[1] = src1;
+        s.ll[0] = src2;
+        host = 15;
+    }
     mask = gsr >> 32;
 
     for (i = 0; i < 8; ++i) {
-- 
2.51.0


