Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp846580njb;
        Fri, 18 Oct 2024 07:15:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUdTO1zFOKzhNdKDE3pxQHVC6f1DZWF8i2Vp4PqgNPywZ27Gvayt/kWKDAzRwbO2uUIc7ekD6sSU5N1nQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF/gRP0x9SZlPO/5OSJ7iyOdl7Jrr1kKQuEr78LeEVC2+xrNm7PgGNK7eCfbVPu35JpOnp/
X-Received: by 2002:a05:620a:448a:b0:7ac:bb36:5667 with SMTP id af79cd13be357-7b157bf1a72mr318306785a.59.1729260931681;
        Fri, 18 Oct 2024 07:15:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729260931; cv=none;
        d=google.com; s=arc-20240605;
        b=cVajKFlqVQ9y2WLTFZjSAHysGmTUHXhZfSGdRpuDUK4KofrH2GB19h4IIxBjtc0rMj
         QxjjF9LiaqoOwBGpurUBOAdC8SnogLQpG6S4sfFrSN7l8637ONrBjadDx0jnLH5KEvqw
         w+oblGp1UVZnZ7Z9eMX0KJWTVkMuSmwkIJJU2Yc30UbQ9XPKCsZnx/TM9T2OziPPIDtV
         EfIGkXP5JvVsCsIOwtHzQt2jkBlaF0uCWpV46sKOj5VlPFIqyTmXuUYHVn/Pj8yzJ40h
         viyFm9ve1hityJNSuVaorIYgDqnTi27PIj2u3bF061fbfYMhSDRh63w71Qwzu5GapraP
         OJZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=g2lDYVfRW2UdAzAzqSSVMXHFzpJAZtFQKbpf5EclSHE=;
        fh=JROX7yrvKMYU9BbmMyfGDG7C+H2YgCvn4aRmWAEICOc=;
        b=gvhHHrfbGtgZEAB5fB+wFr5hCE6Gw+k7I5b4gee4Rgi1YcPdsLWvBDsZ7peGWWcA/l
         jaCZw0beFqblazZQn4ULcReZyLY3+YG+ZBihfqGqg4hpF5KGfBWqdaeGV2VTgbOWtDi/
         9WkTT+6msUVd4yPIfWGewDtzOV9oBMxgyVxico8CeHu/UgBpHHUig/E1dg+3aeve6TQs
         UVPBSxFwnJqPo5yKYj1S1Si3Cnz0A4H2mmxcwAmIG5hSkyPQPaU5KiY16VjzJuQ+GeYA
         ZqyC1uWsoH6Ew6G+lCA76lPq/mfbZHNYzt1OfGS7OGVrEF+laBJvqAgLQ4n4Mwl4mCru
         URQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BJ3ynSVi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b156fd8773si189066985a.283.2024.10.18.07.15.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2024 07:15:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BJ3ynSVi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1nja-0000xo-2M; Fri, 18 Oct 2024 10:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1njW-0000up-It
 for qemu-arm@nongnu.org; Fri, 18 Oct 2024 10:13:38 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1njU-0006wi-Me
 for qemu-arm@nongnu.org; Fri, 18 Oct 2024 10:13:38 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-37d473c4bb6so1925872f8f.3
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2024 07:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729260815; x=1729865615; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g2lDYVfRW2UdAzAzqSSVMXHFzpJAZtFQKbpf5EclSHE=;
 b=BJ3ynSViRwHs9nEmcdKADyhvByDQZfKy9hLulIBrH0qD0YEtqbc4C4x5rdqapD1ihh
 a8iqVSJ0LFB37cMB3C87Dw6GIJIv0WziaPvhB/AF8pkOKYb3CkSP3DnjUZ9Cv9Y25Jqx
 uXjtPVhk0man+mz8Df70W2U5ZiZteM7OWzdCwG8wS4fZ4eOU57MsGUJY6B/QhvXKM+G8
 OL77HmYTLDcX8HoqOUJFokpgifcHqOCALuscBiZeyoxvhtlbVXcuuqyTHdJDRFrvYUKz
 F+9MRqjU55+krJaYtkHJqy7DpRi/wu1fuD9hu1WSB3MP2jy9+8ykSws4Nnr8v6pVDBhl
 5QRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729260815; x=1729865615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g2lDYVfRW2UdAzAzqSSVMXHFzpJAZtFQKbpf5EclSHE=;
 b=Ehfu7Z3kNqMW03KKxAorG2EIFo0dhuFlllD/7jnQBJSvSnBJ0dmtPBtIXzIE+0l/e5
 CVkGLrzDspNQdYtVY7ZDphewdjVdHz39bnE6gUsIxeG/e7RQLn85hNK77YsMS+GtXr3l
 zMCxTRfiN9b+f4cReNhbwdYGxu3XW5NOdL4bUKhUTP6wUlTKqgm99SvQGVYC0aZ2S3un
 DOz+HOik74aYnqyulk+dO2mzmnGX9YArkGeaXEi4MQ3j3i7qHKCnmHSIeqvtAbaDY0xu
 WG/XdClE+Q8xr7aRHvVlnwChJ9QwjryFerrTvT6AeOif5ECS/dNAe2PbZHAIPBCO0rHx
 eMXA==
X-Gm-Message-State: AOJu0YxWyVuwLpCMSNjXJSGkt1OAP4QjI5LhHYMlqOZ4rD0bqs3Q8oOY
 drlSNUZKmEyc83NNmZo0iqGqz2aav4kK73HUepVIG3/DkyNLnkjm5xLE3dFK6zd6zaMeVDtUP9w
 I
X-Received: by 2002:adf:eac8:0:b0:37d:397a:5a05 with SMTP id
 ffacd0b85a97d-37eb485ed73mr2364472f8f.54.1729260814993; 
 Fri, 18 Oct 2024 07:13:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ecf0ecd89sm2040086f8f.78.2024.10.18.07.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 07:13:34 -0700 (PDT)
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
Subject: [PATCH 1/7] docs/system/arm/stm32: List olimex-stm32-h405 in document
 title
Date: Fri, 18 Oct 2024 15:13:26 +0100
Message-Id: <20241018141332.942844-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018141332.942844-1-peter.maydell@linaro.org>
References: <20241018141332.942844-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: c7+W3fxwXNAU

List the olimex-stm32-h405 board in the document title, so that the
board name appears in the table of contents in system/target-arm.rst.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/stm32.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/stm32.rst b/docs/system/arm/stm32.rst
index ca7a55841b4..511e3eb9ac1 100644
--- a/docs/system/arm/stm32.rst
+++ b/docs/system/arm/stm32.rst
@@ -1,5 +1,5 @@
-STMicroelectronics STM32 boards (``netduino2``, ``netduinoplus2``, ``stm32vldiscovery``)
-========================================================================================
+STMicroelectronics STM32 boards (``netduino2``, ``netduinoplus2``, ``olimex-stm32-h405``, ``stm32vldiscovery``)
+===============================================================================================================
 
 The `STM32`_ chips are a family of 32-bit ARM-based microcontroller by
 STMicroelectronics.
-- 
2.34.1

