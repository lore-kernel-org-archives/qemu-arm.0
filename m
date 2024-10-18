Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp845582njb;
        Fri, 18 Oct 2024 07:14:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCQ7Zl8a9Ih9zMAxhADFtFfomrIYUekMRJSaTZ8KKWvBjUl5R99T3Pk/f05Aq9sil3bRml8BWCGprLYw==@linaro.org
X-Google-Smtp-Source: AGHT+IFjMUBeYHnwlzB34x4V4pFfjl96K8DCMBBE/Su4ANCw9ImUGVCADmn6dOCMKjKplLWxqP0m
X-Received: by 2002:a05:6214:4685:b0:6cb:ced4:eafd with SMTP id 6a1803df08f44-6cde15ec4a9mr33942966d6.35.1729260852977;
        Fri, 18 Oct 2024 07:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729260852; cv=none;
        d=google.com; s=arc-20240605;
        b=UWjD5VX+PTy30EKVVAZuRxJ0bplPYDtd2+vplCnWszpbgbZqtqjEDB+Gpqz/IO8nVZ
         +NVizM3ax+i8Ik21mdiyOMOJj2Ci7rmv0mOTxSCtba/TcJcSXqPMFzrlqRl/38IIS5eJ
         EJBsJSlt1nFShBZu1IABy0+HD6UrPnn1CBcxZdgUwhGBj9itZVK6UQioZHt+fMlzwDYW
         zht9kaPJFYhF9DmN1kVlzC9HRUn0zxdUdpHWVLMbwOZCJysh/a8ALqKvfebausLswwPZ
         Phi7Zm9/ZtCacs7O96LLb919hcydPJgMpisQrhrbjTN/whUyEoZ8cuBp6YwmA/rAgM3Z
         sgkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=603GFU4/OLS3KRoV1w+4LwOlh2l5ru3HKLAtyoHGj6k=;
        fh=JROX7yrvKMYU9BbmMyfGDG7C+H2YgCvn4aRmWAEICOc=;
        b=TKgzOBIpckiQsMrvwC/Uv95rj11zI3GiOCwF3jhSKj0dzhuKdWinNHQ8KZbBa4njby
         USIwZT9jOPUp9oAi32qS3b8Swz91j0tqlD0X2DjDMaeAR/bJqYn/2yWdzIX7ZDHjZqm7
         GSP47NcEcXrkWZrvMXITxTh5A7h3N1jXm86LvoARsYgYa2inLVktfMyzcbC/tMc8I2qB
         DokF1eKj9KRhhGEZ7uJ8QJhSrB6X566dHdHUo6moMJK9NhY3KUi2zPVAMeMB42iTfBRk
         pys/svKr7gFq7nbAXS0Qwe3FbnocIJjpx+bqrljQJGJ86QJ5IZugTtzn3kudhTf/cTuR
         vFwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Asmy1HSg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cde13adabasi17700406d6.549.2024.10.18.07.14.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2024 07:14:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Asmy1HSg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1njd-00010i-2E; Fri, 18 Oct 2024 10:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1nja-0000y7-Lw
 for qemu-arm@nongnu.org; Fri, 18 Oct 2024 10:13:42 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1njZ-0006yg-6I
 for qemu-arm@nongnu.org; Fri, 18 Oct 2024 10:13:42 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-37d4ac91d97so2132865f8f.2
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2024 07:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729260819; x=1729865619; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=603GFU4/OLS3KRoV1w+4LwOlh2l5ru3HKLAtyoHGj6k=;
 b=Asmy1HSgZpIDNtG+gGhN5eCXTIqb5U+weqY5E5vVuLgXVdEYNfGw/Ii4O80FcdQ3Es
 cmtf/CsXuAygz0Nbf2qfI+AhRPZWLCiEpRqhqlv2PPiJTYevqGKb+HIFP46HMKyhRDiR
 oic3ko+Dz4fmueXKQeiOb4OM35ipwE4HpEloXFzB0eU834fJO8QCL7ARxJfYpH05DWnR
 26AoKPcUIuI88BC+ZWjN3D3QAsb6Fr0YRibQ3h2zp0Ivw5G70E0oLB0n2Y9Gs/Di4CNE
 8fdpVyH4kF91uKrynw2mi1B3vzyYG97qje/Qy5V9Dv5+NYyXdFZ6UcotIx2DBksQJ+3v
 upCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729260819; x=1729865619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=603GFU4/OLS3KRoV1w+4LwOlh2l5ru3HKLAtyoHGj6k=;
 b=XymcjUdLGIK3EbJvBfalp+ZCJweiPY4Z565Df1ZwTbtew2Fi8pdKR+WU7+hvteGjsA
 MIcZ6E7ZTCbPhgaTGkeBHvibj705R0H52BsCkjq7Hg6rL0RVaz/Lj+b2Uht4jSiXHKAx
 Ce9KtfRN3GF9tNtMxp3dwM3SpRFS0o1xE2JmW1pnL6BKHy25JxGmnbyJ58FMY1cykM2w
 WkJfpa8STjkkGZqVB6z3lMDfmLhi1/4qbMaY1fQDG+0ByWuF3C080ErJZklcWuKLiyNu
 XnSB0cFK+HydfC373xpFpe7MpGVLcHwhZJWJdAc71nYaClWXKykghTc4t25V68icPmQK
 rTgA==
X-Gm-Message-State: AOJu0Yx0IBRJ0BI11KQsm1h7hbLwcrrGMF3Gwztd28g8EfpCyDCmeex5
 FqJMfMklprvmkL3p64L7q892Y4ucrfQ8YeoOu9A9LsIi7hetCwis5dbEZxMz5Lm1b7v1fJUdBZv
 I
X-Received: by 2002:adf:f7d1:0:b0:37d:4cd6:e8e with SMTP id
 ffacd0b85a97d-37eb4768f72mr2865236f8f.48.1729260819032; 
 Fri, 18 Oct 2024 07:13:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ecf0ecd89sm2040086f8f.78.2024.10.18.07.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 07:13:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH 7/7] docs/system/target-arm.rst: Remove "many boards are
 undocumented" note
Date: Fri, 18 Oct 2024 15:13:32 +0100
Message-Id: <20241018141332.942844-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018141332.942844-1-peter.maydell@linaro.org>
References: <20241018141332.942844-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: hM66+D2QGJ1n

We now have at least placeholder documentation for every Arm board,
so we can remove the apologetic note that says that there are
undocumented ones which you can only find out about via the
``--machine help`` option.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/target-arm.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 1f806cf4a46..9aaa9c414c9 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -63,10 +63,6 @@ large amounts of RAM. It also supports 64-bit CPUs.
 Board-specific documentation
 ============================
 
-Unfortunately many of the Arm boards QEMU supports are currently
-undocumented; you can get a complete list by running
-``qemu-system-aarch64 --machine help``.
-
 ..
    This table of contents should be kept sorted alphabetically
    by the title text of each file, which isn't the same ordering
-- 
2.34.1

