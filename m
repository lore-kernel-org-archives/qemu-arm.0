Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp565831ejd;
        Tue, 16 Apr 2024 11:47:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUlV6e2birl1OPcV0Wg8WeStYDzTSQQTvCjEruXysXtx+2mUgwCzFi/g7bAeICtN6JqgDP/gqZvPR4hytKUwBcTLow58wEc
X-Google-Smtp-Source: AGHT+IFcGNHHjJY+3DWe2hWTmnFHJTmR3HLHf0vfO84LbJqEGsfP/ymhT/wZ8qXQBJoDBOv64WuE
X-Received: by 2002:ad4:4b64:0:b0:6a0:404c:6250 with SMTP id m4-20020ad44b64000000b006a0404c6250mr1325683qvx.61.1713293271486;
        Tue, 16 Apr 2024 11:47:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713293271; cv=none;
        d=google.com; s=arc-20160816;
        b=VjrBjS3q7eKqjYpV1G+OYVwXA3zh8OPfovLpRsBhw35YapYEcO+Wujx3R78xjCUmJ1
         iUnHtX1j402xe3NYvoAw17eF8dwcewitcwfO4k6TIKyXLRywW/kF8hXHsmJmsxYmT/aT
         v3fxcnd3jyF2kTPwfRgg7HxY1hf3vXIhLN7jWk2upZdeY8NzkOeu1P11PB5ZqJyotgLl
         vV7Wgy1Fa/JuFrI0kTS3BI8ywiTnW/X6f0ncFO4mGgxOY4XXpmLcDYGlG4icoDYurtKe
         mcp5JWKgtqJmwc9Hj7MeKrCCN3SnHhDkOo0Ap24PSn/TQvA3/Ics4o8ylC4I+FNN11gC
         yxlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Spf4Zi1bBqXxf2Gm6GK4HE1fTrLcNzSmKtfAQewlYLg=;
        fh=QDZ5YkBW6RYC7h8fy6JfwMSdERpjG16RTV1iRIy6iZQ=;
        b=kHXBwYlrmcGmHERhsaO+MozSag1D8whotbQUCbAyg6BY/FFvviBev6cLaaf7af2vvw
         NUOrkOdu5bTbz9zXarM+dRL8JqupdntwwJKC/SEMx3cASKBS3ULthwXB1GKEv+HJ5Mif
         fKXF05QXgz7ICszYHhR5oy25ZR8waSsD5RW1JciJ1Glzrjmy5DrUo1QJK14esna2HmH8
         6nHvt4cCVdJ7xJ2DHUjlgmgAySH9d5mQKrAWKXy0uQ7jMKWuA8V6n8jVFQVM9hg34Jbo
         e59SZFh7azxwyslk/O04VpBpX5AuDwOM6Lken8jRQPp0QmGSAwBk51EaDYLyk1UswNL7
         aaUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dd7N3ZE3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9-20020ad452c9000000b0069b4144f0absi13200230qvs.119.2024.04.16.11.47.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2024 11:47:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dd7N3ZE3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rwnqG-0003ax-Nu; Tue, 16 Apr 2024 14:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwnqC-0003Yz-7c
 for qemu-arm@nongnu.org; Tue, 16 Apr 2024 14:47:36 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwnq8-00031Q-JO
 for qemu-arm@nongnu.org; Tue, 16 Apr 2024 14:47:35 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4189a6a71dcso5421075e9.2
 for <qemu-arm@nongnu.org>; Tue, 16 Apr 2024 11:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713293251; x=1713898051; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Spf4Zi1bBqXxf2Gm6GK4HE1fTrLcNzSmKtfAQewlYLg=;
 b=dd7N3ZE3hFx58vqNiJMX/fOLvm2IfdKY1DRm/XekDtR9wYR17mHLetsYE5fY8fbvgH
 4z3WayQ5xC7tYYVuZkzQGA+H2x4S4UvROCxQgSjNIGBxECTeLmQrJXGpI7yFy/Th9Cyx
 uL4lRau6fR9K4N5Ry0JGc9IGvdkIHn9i9olEnkZ1i4TchNx0mlqWb4z9Fux/Ri+zm0Bh
 8NV1AmSdZuSTjr2K6j/ZlreoLEiFdiDHb4mv2YtmwdSFx0AYB35xffBQNkL5uixyWxfc
 LZ2DdeIgznowhAKSCxqBa2fZHsOUezLl8hU2STOnyUcF3tXOvhxIirlaQwnsWfaOtDUp
 1i9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713293251; x=1713898051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Spf4Zi1bBqXxf2Gm6GK4HE1fTrLcNzSmKtfAQewlYLg=;
 b=AbMIKWfT3Q2NVLTfnQS2IhnfHWakVWKjSw5z0iJLiDjXQQk2oYKetB3bRdNjySJYWo
 KKag0pIOv+rjOixd2Em1TcogJCazCFBD/YJ3TFjDvwVcVNrxH6N3D5GiCghbcmWXntaQ
 L8ZarboKGZw/rw+DuX6dYpU9B9PL5ApqqZB9ebELOBW/rF5lARtt5/5jIihbKc7QmoiW
 R7jSYyMOZEMoyT6KRocqWxjorWkIiaJ6tIwEC0AJ+fCV6iYoothCdmrcAnloNLJEqJdQ
 sLn5okxq/XSMKTcP+D8CsXSM4HNDfyJtZYM4lEvWKSbxMYloh2deQBvVhNNZgnk8aFN0
 R7Ig==
X-Gm-Message-State: AOJu0YxU9Ihv7xu4zL8oSFZPL6Hbst1Sb0ysA76Seu5Ax+ir1fTjyOL5
 J+jT+FFhqOgDRAbz7BsxN9OLz1eHxNXW0kP1HbP8YidrOiUC8YjnTlcwibiyHH0=
X-Received: by 2002:a05:600c:3491:b0:418:2323:e87 with SMTP id
 a17-20020a05600c349100b0041823230e87mr7283079wmq.25.1713293250787; 
 Tue, 16 Apr 2024 11:47:30 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.61])
 by smtp.gmail.com with ESMTPSA id
 e29-20020adfa45d000000b00348b46a134bsm2810947wra.1.2024.04.16.11.47.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 16 Apr 2024 11:47:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/4] hw/i2c: Fix checkpatch block comment warnings
Date: Tue, 16 Apr 2024 20:47:18 +0200
Message-ID: <20240416184722.28334-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240416184722.28334-1-philmd@linaro.org>
References: <20240416184722.28334-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ffzqQErqWC1h

We are going to modify these lines, fix their style
in order to avoid checkpatch.pl warnings:

  WARNING: Block comments use a leading /* on a separate line
  WARNING: Block comments use * on subsequent lines
  WARNING: Block comments use a trailing */ on a separate line

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i2c/i2c.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 2a3abacd1b..c18a69e4b6 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -4,10 +4,12 @@
 #include "hw/qdev-core.h"
 #include "qom/object.h"
 
-/* The QEMU I2C implementation only supports simple transfers that complete
-   immediately.  It does not support slave devices that need to be able to
-   defer their response (eg. CPU slave interfaces where the data is supplied
-   by the device driver in response to an interrupt).  */
+/*
+ * The QEMU I2C implementation only supports simple transfers that complete
+ * immediately.  It does not support slave devices that need to be able to
+ * defer their response (eg. CPU slave interfaces where the data is supplied
+ * by the device driver in response to an interrupt).
+ */
 
 enum i2c_event {
     I2C_START_RECV,
-- 
2.41.0

