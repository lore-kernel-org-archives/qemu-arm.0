Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp865323ejc;
        Thu, 11 Apr 2024 03:44:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXeJFiKqYjE/W2mvnKXdP0YEIzQTWhoGyyOXVHQVZeSE4iAb8MQU2sU2xLmTTc1WzfHrLx6shbcUav75tIICdbaGiZF9rIX
X-Google-Smtp-Source: AGHT+IFWmYhHZgYGHSVEvKvj4YfyOAEFnsViog7Rzr/sZhYMwj8pb2SLNbFIW+vDJSIQkz4ZDPJd
X-Received: by 2002:a05:6102:3594:b0:47a:3a6d:4d4d with SMTP id h20-20020a056102359400b0047a3a6d4d4dmr744950vsu.10.1712832289033;
        Thu, 11 Apr 2024 03:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712832289; cv=none;
        d=google.com; s=arc-20160816;
        b=zmlbquqBZg5xwmssgUx25rCEKq1i8Pv3ueEp25AU1I2UvnZR8nYEDCNeMcs5K6LHH+
         oxAhCje8+CYqHvpG0aTEjbGMEjHH0+0ucVXTyXOecPpCVjwkITS2DuI7HJFcMnej4A5J
         LQGEXzw6ptZNu2vJhERBuN7HHBdvCSfXNt5gW5dPl5BWRx3AOqc5JocpnQWbxL/6qV9r
         nbFj1WYnjJ3uSGMVHjfYAhZFgX+/OuuUkudwGbBa7toJSgYfOWnbP5pTMKehOVBmkH90
         HFOQrNhJ/EkPH6Od/y5cZYG0zM0Oa8bGxdBfzuiKF1+DrKwnSAz6HFBezQwieL175vCR
         AkBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+zSTvPGfcRjEBEVqiYMcCOTilCqnhe5Ojdjg6D66FBk=;
        fh=FCtkjB4mg2Vbc2zAqJVHEHX4+ANQ/RDZ6sgG1Z3LGmI=;
        b=M/shg1YbBkor4IYlrRSlFScO4zdPtRi4N55aCgvCSK8vquJTjuLFunf/GepKzYluT+
         4N5PE/drKIo5esyKGecDBa7bghdOQDcmVdaL6tnRZvM0AbtvmJR7ss8Jr1eosTWYtQDo
         pH8MQ1k03Y7ixm7xiv7NoCbzAWou7gfRztL7TDokalvsk6sjOxknEjp6wm1FnTefY6IR
         C2nkHHOkIC3VuLZB8d5tRpIIMEzRFC57qbbT2ahr7OWuLe62eG4rk5isu+f8oBUg3ser
         7//fdjQF9MMtWvNCgaYKUTVG+mfUEbPDI0n97Tnr3WfAuDwI/hlgyuGlPrsQUVxYALEA
         sgvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g/IYJVI4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4-20020a05622a1a0400b00434e3c0f7absi1236342qtb.364.2024.04.11.03.44.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 03:44:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g/IYJVI4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rurud-0002vB-Mb; Thu, 11 Apr 2024 06:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurub-0002rz-Pb
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:44:09 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurua-0004Il-1i
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:44:09 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-417d14b3b29so4557485e9.0
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 03:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712832246; x=1713437046; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+zSTvPGfcRjEBEVqiYMcCOTilCqnhe5Ojdjg6D66FBk=;
 b=g/IYJVI4TbLIZNWEaOtyNXFOaUJQriPR0NuDWqHXF562W7r8h4uT0kewQ7GjUp2IpN
 CmwWDW7PcUt+mtLAC7j2Q8gDGXZhqEPq1h9rIL6i2To4e/if2r6MeRhDg9RRXK35NPyi
 xRuDCX7F/YKJN/pfv+7vKnNpK2ux6Y8tuFqkicRazqn5uK28h5BdYhBZyXP6rZY3r8N5
 ZrUx3BBHF9DkkVh9Gm67H+AuPHXtQSROCq1rfLtLuiyTyCF1YUBBePMlbWBYyPfP/fza
 KTcs1+TPCi+PVEzso55hM0FKUFSgtDXAex9C9tHhKyam7HTr5DlFDMWLaPybq0enJ1tN
 51MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712832246; x=1713437046;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+zSTvPGfcRjEBEVqiYMcCOTilCqnhe5Ojdjg6D66FBk=;
 b=sYxcX1BveuWwaLw4vURBjdIwYUUV6yEJdqnCSpVb5YTR1ErzX4EAvFEpon+q1KboLs
 aUqldM8v+2w2ar3tklWhs0y9mJdPi32kO+QYOXoIyxEQmPV35Y2jJPa6Oiidwiwj4+4X
 AH5ic8TQYwhmC9F0qukjBFXd5MNqJTgJoqBIjmE6TDZuBpY45kSbcizTdGBzn9quL3XJ
 MS4Ay6DeXSYGbb1H1S2hYrNADnYoSAKCt9SYoJKzxNCmPZw5JUDmQp92RUNRzy/iZh9X
 hpDltRUD2j+QLKBjWmCcU/w3eC94OAW3Kzwe9WMl3e/4Bsv2ObHUtZa76hox6T7ZtxEv
 0Ovw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6rozv+Lj8R63thMytslq2RaS04qDPj5RGrx+Kd2UEsC04yUZJ+U5CNnwRTVd4drIjNNltz20GHOirR2aaFmN3Giwn
X-Gm-Message-State: AOJu0YwkQDKxN2EuuOqD3p3gNU7Z9fj+kBijPVl3RPyrgjpxOA4lQUmm
 ERtXyRB/zGWa/VjfF+q5/t3E1SrVXUf3I99KP2WmaJ5cXtIG/d0Mu5FbV7Ylejw=
X-Received: by 2002:a05:600c:3154:b0:416:b7c0:23bc with SMTP id
 h20-20020a05600c315400b00416b7c023bcmr4403843wmo.10.1712832246485; 
 Thu, 11 Apr 2024 03:44:06 -0700 (PDT)
Received: from localhost.localdomain
 (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a05600c450d00b004171f151a5csm1914852wmo.16.2024.04.11.03.44.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Apr 2024 03:44:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 4/9] linux-user/flatload: Replace sprintf() by snprintf()
Date: Thu, 11 Apr 2024 12:43:35 +0200
Message-ID: <20240411104340.6617-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240411104340.6617-1-philmd@linaro.org>
References: <20240411104340.6617-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: Qynv+Q7kEeXn

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience. Use snprintf() instead.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/flatload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/flatload.c b/linux-user/flatload.c
index 5b62aa0a2b..b0f04af4b6 100644
--- a/linux-user/flatload.c
+++ b/linux-user/flatload.c
@@ -692,7 +692,7 @@ static int load_flat_shared_library(int id, struct lib_info *libs)
 	char buf[16];
 
 	/* Create the file name */
-	sprintf(buf, "/lib/lib%d.so", id);
+    snprintf(buf, sizeofbuf), "/lib/lib%d.so", id);
 
 	/* Open the file up */
 	bprm.filename = buf;
-- 
2.41.0

