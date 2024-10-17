Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp307146njb;
        Thu, 17 Oct 2024 09:33:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTQZJgJEgoRSMfUuQncHIPg9PrUAGbGT6oOINY9z1JXXjKG94KPp9PWjlWOtVFJQ9ImAFU/IRZKaTNYg==@linaro.org
X-Google-Smtp-Source: AGHT+IFF8BokPgk7JsKosEk7NzlciINIXDUtAFBzQyBLRyXJcGEjsxzojvCCh2cbP4ggJsBUNyr1
X-Received: by 2002:a05:622a:1b93:b0:457:c435:a5c2 with SMTP id d75a77b69052e-4604bc492c0mr287504561cf.58.1729182788551;
        Thu, 17 Oct 2024 09:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729182788; cv=none;
        d=google.com; s=arc-20240605;
        b=Rt/mXrltY6Ffv4u/J75Qb8WalDrAStZh+XMGSa5ew6GjKA2fAgEancPyOfYJg7mxIB
         aAq+tu3hfjGuzHGaZCIu2ZIyALaeDpjHknkz/typpaA4xH+9zVdv79D7Xd/cmWDrb9g6
         FRJw71vyth4uE1cm2ldUZ4X3ECoGFs7praQofJkymhctp9HJGPRGBFmSxkldORqgUogF
         qnK8otsoiLQ2gVTPsVpzdB+M8tPNRKzhz1dc2gySjXJLT5kD/3gWp+OC2gcKv/4DbT6I
         gkuBltXWHKZn7ZdK3tJci+C2FpDsTaHu/ZeCL9nR+LaHINyHoIuFQISJth1jhwwPr19i
         cFDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=HsByr2/F9yb8R61V/RxanFmNShqqfc0i/+wi/KtFNd0=;
        fh=ao9vbWTHK92cbRTFkPKKVc2eXeczL0Z/ivWNNGhyUW8=;
        b=FraDCRqB0+YhawT5A+qMmrqDYsuUuDn5rTC6Rp0/v594hO2zCZm7I3DKtEN/qUr8hU
         0YmIkgrTw6m4DE59JHSskWZmK/rILouKzXEw+RyShyd09qkawhPVztS05JnYb+CCMfoh
         jJShIKLyc+yUL4PhQePeGrbkLyZVcnWj8nxQbX1aCIdEt+pwzSIYFgNtYQ14UwWbShCD
         lOSvI0FLS86mCeTuVr1me8tujYOIGzKt7MmHqv2dwyXrSOUJq9JtSTijhf4ECkTli9UY
         ml5fa42TLBOxeus9CEtxkzKYV/njkNzVY83s7KFxuTJjHTfSIpnAG9aBBwej69uKyXcM
         5Fdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AHDrErLv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4609e2e14f8si21117741cf.193.2024.10.17.09.33.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 09:33:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AHDrErLv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1TQn-00009Q-BO; Thu, 17 Oct 2024 12:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1TQl-00008y-4j
 for qemu-arm@nongnu.org; Thu, 17 Oct 2024 12:32:55 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1TQg-0001pj-Pp
 for qemu-arm@nongnu.org; Thu, 17 Oct 2024 12:32:54 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4315df7b43fso6432675e9.0
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2024 09:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729182769; x=1729787569; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HsByr2/F9yb8R61V/RxanFmNShqqfc0i/+wi/KtFNd0=;
 b=AHDrErLvai/XZPaIXPua77LCAck8v6y7ffqL3vuOC1k6Ox1WOECi0lbXHZUGB12dmO
 1HOxdIG/JEyO/9lSfo//9UA2DXowuQhMkVBVjEm7vYTpIzSJItglSR14DUatEAIuwNAH
 I8XXcTON7qx4AMkqvYU+kdlnTMZbo5aeI68cYOAjLxSOzYnH2hgyc2F/7NbfTXDHcAJt
 bSsrqoqG8rw9gep6wdqtqnkKM2i6V3RZv50EoWh9SYwiDPa4I1spTy4j3R4irl4aJto/
 IyU5jHTcc4777pNJgPr9vjpAsYougWULp1S7w1AoZFiEGJbAEE7FXUUt/Ex8hvLlyWk+
 29RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729182769; x=1729787569;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HsByr2/F9yb8R61V/RxanFmNShqqfc0i/+wi/KtFNd0=;
 b=oKGuLGOgnHfWA2hV0G7yXxCkgqXI0hFj0E1Q1oiBKKWMgIuvJXhQ+4HnDHYC23bKkU
 shLuH4NFeQMmWQVcJ8p/J8Y8Y2x6dy7YeIw62laCie7dk5J3lR8C2ziyznMZ/JlRk5Xc
 MqAwiu+BN+socIaGCOkh1LST68RjVq5QlNACkmvQOfHfJx5rCsHNxWgMa1L8QqU80WsZ
 HlldWUuaudnA+PiBdoaXaOe7S2Pr0eca19PFg0sLcri2TfxiiHOTmjVZ/HB3MbHsbmCu
 qZl6ig+aXDZ6mjQj9yRZlqYpDfHtafFAMkVUviXSSBscQPxRo0rGOvcV2cN7ND6lTzHs
 Dljg==
X-Gm-Message-State: AOJu0YyPHxBDdFDkL44DGfnMjSnpvzpbC+PCCw3EC4bg9ksfYbQzr7l/
 sckQAsRMdrbFiuFLYHGjwT5PYv24zgYJ95I20ct+0v85NzxkGg3Uv7IvJuPqbJZBVxxt29tZUjC
 /
X-Received: by 2002:a05:600c:4e10:b0:428:f0c2:ef4a with SMTP id
 5b1f17b1804b1-4314a2cc3a3mr69365415e9.13.1729182769128; 
 Thu, 17 Oct 2024 09:32:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316067dc56sm545165e9.3.2024.10.17.09.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 09:32:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 0/2] arm: Add collie and sx functional tests
Date: Thu, 17 Oct 2024 17:32:45 +0100
Message-Id: <20241017163247.711244-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rX0Hlei4rBgf

This patchset adds new functional tests for the collie and sx1
boards, which are the only remaining ones that survived the
culling of the OMAP/PXA2xx/strongarm machines.

For these tests I'm indebted to Guenter Roeck, who has kindly
built and made available the kernel images, rootfs, etc and
documented the commands needed to boot them. All I've done
here is wrap those up into test cases in our testcase
framework by cribbing from some of our existing test code.

Based-on: 20241017162755.710698-1-peter.maydell@linaro.org
("hw/sd/omap_mmc: Don't use sd_cmd_type_t")
 -- the sd card test for the sx1 board will not pass without
    that bugfix

thanks
-- PMM

Peter Maydell (2):
  tests/functional: Add a functional test for the collie board
  tests/functional: Add a functional test for the sx1 board

 MAINTAINERS                         |  1 +
 tests/functional/meson.build        |  3 ++
 tests/functional/test_arm_collie.py | 31 +++++++++++++
 tests/functional/test_arm_sx1.py    | 72 +++++++++++++++++++++++++++++
 4 files changed, 107 insertions(+)
 create mode 100755 tests/functional/test_arm_collie.py
 create mode 100755 tests/functional/test_arm_sx1.py

-- 
2.34.1

