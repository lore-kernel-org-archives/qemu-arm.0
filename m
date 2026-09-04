Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36849C79F87
	for <qemu-arm@archiver.kernel.org>; Fri,  4 Sep 2026 12:46:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2TJN-0006Bz-AS; Fri, 04 Sep 2026 08:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x2TJJ-00069P-5C
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 08:46:25 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x2TJE-0006rB-Ue
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 08:46:24 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-4843e9c5960so976918f8f.0
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2026 05:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788525979; x=1789130779; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=g5//nCM3pmvphFdrXdMpuw8XsMrA3mZsffpPB3jrr14=;
 b=H+4gA4W9QErtVPR1BZuVe8G4qm4gv8nDf6B0wu+dXBGQl2vaWWZ7fyBC3O7b7qqKL4
 mMEDkRQYxBE5qYNztJxvWYXzcChNpnYeT1T62/KDTAhHLHdd4aDTzuw6UPe37911dqaO
 tUmAajDMWrnUAlDZtevi794bS/yb6UCxt2mL5kgFKGdsfdi+Umce+aC/n2kdxxh26Bfc
 USwAAgM9BaZC1LbKmFqHro6ns4KRmgL+h5N1xqxTcjGrV7tPtlONeEKRhdDrc/gCpYze
 mzAi6htYTBNhhg0g6rlXKYx9Zsi5K9Dk7p2ac+I8/aIgfplSfaKA1pqCQ99SblY1Tplh
 V8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788525979; x=1789130779;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=g5//nCM3pmvphFdrXdMpuw8XsMrA3mZsffpPB3jrr14=;
 b=LEPuRSUXnqWZryOAFd2gjrV6wEiNlEIYq3gReJG0c5TQctKpc+wiyE4Y6gHR/LB5Yi
 wYDq1rwMvbOJfN4PZRa0lvpLYSXk+RdO/MYThhsjwp7R3lrkTw7jIMZEHK/fZzSmuJi+
 qrNIydaGbymjS4uRxXOwaw+Y6sVTeBDeIJyYgszj1ZBlQWsxf1pFNbkrD6Spzwn8wKhX
 BhK4NE4h3hOBPp8nLI/oj2kS5h/VaZ45/Ji8+BgvT7OoOr0PCfB631PTWz5dmWJZX0VN
 CqiquLdsq9SHPxSMlM1doPAJolaQtQQCMi6zNFhgBwJ2rr8mKEVlQcc3W3Ibjwr9KyBo
 bGhw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwAz5DD154bTejYhsKGTZ7eFh2RMMgVFabHeKjxkHg9XbvQctuCDjwdcFaik1Xwsn313m59iONsOQ==@nongnu.org
X-Gm-Message-State: AFuF++muW2U2JapoWbuomJhiZAgzOlCRgCseiQwVe5j8wgKNfsvLd0Ys
 qCqpWGCiD075dzssf6sLXugrdUPbCHpuqDhyfVXss0IXEtivIQZNNQEcpGHD0YCx4AE=
X-Gm-Gg: AYBFou0v6O7trJ02y2Srb1yCTOTA2L9pqykTlO+t/Wtz77p9Y7H8BCRXr8HcsRf4CK8
 QFJQSBZgaP4qd73sthO/+psLenQYEfr9MwPERHaZnIei7i69f/Tar/aLkx0xyCUOOI5vC0tdcOL
 I7bsgLWTs2aZzuTydDU6dHBc+GhZcN1vuURbyYbvL2ZBLHr7awMPpPwY9hotLBA/And33qmZKBb
 qImeqaczn8hEQrsbUELC8rDz1teMDbijpHT/4hE/KifTtKiQXOaFbpefgBEf+KVnEbu9XTZxZk6
 zAOPjO5s3DWT12R70T4dPpP9PCVoYRB8Bye5cyTOqFnQDYDO9Ppngj30N1e+WSx2jL0bYw/fcTf
 Ecylt6z8g9n663iDW1V85LtWRr2c4kP/UvHU7cVdc5mtJGtvMZP5nwPujiqj3nNBLPL83fcmM08
 4s5kW9GcsS6rNz+VRUE+ZfIBpO7z4dgYawG7BwepGZl2Szfg6cV6Elb4YLI2iY
X-Received: by 2002:a05:6000:46c7:b0:485:847f:fd97 with SMTP id
 ffacd0b85a97d-485870914ccmr6111641f8f.4.1788525978818; 
 Fri, 04 Sep 2026 05:46:18 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858ac2b4cdsm4587385f8f.16.2026.09.04.05.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:46:18 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 262EE618C3;
 Fri, 04 Sep 2026 13:46:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Aniket Sahu <asahu1x@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 039/105] tests/tcg/arm/fcvt.c: use raw opcode for FPRCVT
Date: Fri,  4 Sep 2026 13:44:53 +0100
Message-ID: <20260904124604.2207440-40-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260904124604.2207440-1-alex.bennee@linaro.org>
References: <20260904124604.2207440-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

fcvtzs d0,s31 requires fprcvt support in compiler, which is only
available from gcc-16. Since our debian-all-test-cross container has
gcc-aarch64-14, this test will never run in CI.

Replace the concerned instruction with raw opcode, obtained from:
$ echo "fcvtzs d0, s31" | llvm-mc-22 -triple=aarch64 -mattr=fprcvt --show-encoding
fcvtzs  d0, s31 // encoding: [0xe0,0x03,0x36,0x9e]

Tested-by: Aniket Sahu <asahu1x@linux.ibm.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-ID: <20260827221506.91574-40-pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/tests/tcg/arm/fcvt.c b/tests/tcg/arm/fcvt.c
index 7c0cc4367e7..8c81ba8a1bc 100644
--- a/tests/tcg/arm/fcvt.c
+++ b/tests/tcg/arm/fcvt.c
@@ -173,9 +173,11 @@ static void convert_single_to_integer(void)
         output = input;
 #else
 #ifdef FPRCVT
-        asm("fcvtzs d0, %s1\r\n"
+        asm("fmov s31, %s1\n\t"
+            /* "fcvtzs d0, s31\n\t" */
+            ".byte 0xe0,0x03,0x36,0x9e\n\t"
             "fmov %0, d0" :
-            "=r" (output) : "w" (input));
+            "=r" (output) : "w" (input) : "s31", "d0");
 #else
         asm("fcvtzs %0, %s1" : "=r" (output) : "w" (input));
 #endif
-- 
2.47.3


