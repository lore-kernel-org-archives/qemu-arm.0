Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5748665njc;
        Fri, 22 Nov 2024 14:52:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUfzw1zdIBP95ejiHg81Zxm2vuzs+rS4/jfBdj0UoOVHk/ELE0kJTbXdC//nMLPqUyMdF3myQk5Azsq7A==@linaro.org
X-Received: by 2002:a17:902:e809:b0:210:c5ab:2420 with SMTP id d9443c01a7336-2129f21a16cmr63164725ad.5.1732315934340;
        Fri, 22 Nov 2024 14:52:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732315934; cv=none;
        d=google.com; s=arc-20240605;
        b=S2OvBZc5lycbSiRQy7goUbRax+g5ZGdAsK0aAhl0tUAW6AS/yGIboXX1qI4ZK3a2QW
         tI8YQHB9jZ13eTn6CqJId2fANoRWX5WjNDiwy2hmJMlilcMyKoRxd4TET+vI5alYRgQH
         VOFBaPN9MyHFCnWtCjQQGvI5J4EDQhOUx5y8gSpPwQqv29H19wmkZfM1J845Atvg2Sau
         5pp+iD1PI9W5Y6+TG8lnjewLzZ7wgIa1jNgUJR9PV8fKkRlmQCeFJBlRqkiYKCR6EN3+
         UmXJRkfMsl/ihVtBNsP0x9DOZFd6JrsAhIg1Fat07nRDHhvFqHK/DwnG+U60Cdoea8Rx
         g+eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=i4FdoiVujAHlSAX1GNeXZCXDPP5ciq+pm5Du23bE3KQ=;
        fh=hfvWAa/+0h6iPnV2QAjJYK6oy0sa8S2eozloGYThOUo=;
        b=izEGAhGC9HHx4j6fBjzY43e0nBdHuCgiZCctN5p25TIaPZN+W1m6Nb/cX3epje9Nmc
         r8/DEUernWm8mx19NodiCWIp6w8CG4DzdnN72PJEKPWpzPOF7mrcEOwvDNy9y6JSIz+W
         /8sopULiX3W1hPygTLyuuxAyUJob2TWcEZMP/1mnEFo4UjGPmSLieHdDBPVq65x2hHcN
         hu5sbFqNxsR7QRhayjMFuw0OhmL4kr3sgVA5JLAPT7MDXmJAKjw0oNLotRCZQ3r79JVx
         cr4ZITCp2WFEdQSIUg4nQXdPdBPED356xzE6qTTREFgeeamNMWXAeD48LHQKAh22A3Fc
         vM0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=shYtKmlu;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2129dcd254csor19231115ad.15.2024.11.22.14.52.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Nov 2024 14:52:14 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=shYtKmlu;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732315934; x=1732920734; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4FdoiVujAHlSAX1GNeXZCXDPP5ciq+pm5Du23bE3KQ=;
        b=shYtKmluBCtKEwsNM4Q7F7w1bCLC5WRkc11vlq3mLYEdJVbE9DY4TB7Cha16wOHn2I
         3kDgPr5C1I+0DaAzAlFusLCQji8Gctf/VirdcB09LQ+sjXRz6/xAGpZNaujYCWu1Nn/w
         vAP4nxMmLUOQxQi+x/Xy65D8hOqUSygQpiiCsKThM1UmazV343Z2bR9JzUjyKUF48GzZ
         OwM5DDZsv0rHKQtSbo+NuK0LeobHlKWa3AEJLiPi7IVfOd0hLyw1PXF0mM8tYbm82Z6W
         QU1qaJ8IB54kV5frWLl8V1cZR5I6boZV6AKVQgSaLuPtRXGqRRYEqw5a4UHIrL39LygE
         4oPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732315934; x=1732920734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4FdoiVujAHlSAX1GNeXZCXDPP5ciq+pm5Du23bE3KQ=;
        b=AvhaqOnJLEzvFe5zHvwYSGSZUFHyI9ftjmSMD56BpLRKhlsBdkTFKz39K5CDs5Bsm+
         hVKNMe3OFHalSbRg20jU2UXPjXTgi+YtLwaexCL5rAbHC03hICVhQbvEwVFHBHpBaP7s
         dCZaznu3ASS0fuGbt1ww2ThU7swShtOqIhNr96/aFXBzS8ExqlVTT78PtpHwhJLyQnRS
         bIomNA9IhKYUSrkNhYK6pq4WT0UEsoli2dExd65YDFVME2r6tIfRrjmnuZTnA5/i7x14
         BgRXhhyMQg0POJ+zSvYrx+F036DYm90N2weIMtfIPj3HtWxrcUp4ARL911c+rXlS83gy
         YrBg==
X-Forwarded-Encrypted: i=1; AJvYcCXzqyAYiHzUJUe6Z4hEMvqpCeO3lAIlJHw8FiJIXAiFbQe4sWQHFxGP4cg4gZjoeIpiL3bQAtCCDyalLg==@linaro.org
X-Gm-Message-State: AOJu0Yxc4oK+AJSjokduAHp2DjQLmCrzD8IglS15bj92nl4WBTvf2p7Y
	EBwPUs4hZXO9Cp3Ykxkzrk0HkL+h1TlPOj4yN1aLea+Tgw7iT0uJV7vE/zCIdPAgLA==
X-Gm-Gg: ASbGnctRwi/30D7gjukuGw3vS7HbUVH3q4sd5qK80xZp/W93FlzH5O6YORjqgqvvz6M
	nUONGlicbEJUU+5Irokw0bBdD4ZCKYcUcL33fisBrLBAVk2dlC83uTkZgV3xqCqTKGeNOTVsrrq
	VAms7cYyL1994LKhHsOhHPrSwqfm/raj37SjZH8Neh8jCwjfKn5CixXKOa8XpWt+77HSSujy3lp
	GmvUbosbiWyyLoxXXxm6RWaH0GjI9CZjsqGzIwfQsN+QrKuuZHEgYa+kRoJ3+nYhGGMiulR2WO7
	DaiYNzcBqbVYDg==
X-Google-Smtp-Source: AGHT+IEZ8vMtT4tlL3dFmKWQwg3pjx2Zl1LDPdzC/p8HBAJfYTdyVtOHfOls9IUa/lvOLkWEA+/cuw==
X-Received: by 2002:a17:902:f711:b0:20c:dbff:b9d8 with SMTP id d9443c01a7336-2129f28a632mr67148785ad.37.1732315933879;
        Fri, 22 Nov 2024 14:52:13 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc1539fsm21450335ad.192.2024.11.22.14.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:52:13 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	alex.bennee@linaro.org,
	Steven Lee <steven_lee@aspeedtech.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Troy Lee <leetroy@gmail.com>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 10/12] docs/system/arm/xlnx-versal-virt: document ospi-flash property
Date: Fri, 22 Nov 2024 14:50:47 -0800
Message-Id: <20241122225049.1617774-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
References: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: NwbddjMw+ek9

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/system/arm/xlnx-versal-virt.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/system/arm/xlnx-versal-virt.rst b/docs/system/arm/xlnx-versal-virt.rst
index 0bafc76469d..c5f35f28e4f 100644
--- a/docs/system/arm/xlnx-versal-virt.rst
+++ b/docs/system/arm/xlnx-versal-virt.rst
@@ -178,6 +178,9 @@ Run the following at the U-Boot prompt:
   fdt set /chosen/dom0 reg <0x00000000 0x40000000 0x0 0x03100000>
   booti 30000000 - 20000000
 
+It's possible to change the OSPI flash model emulated by using the machine model
+option ``ospi-flash``.
+
 BBRAM File Backend
 """"""""""""""""""
 BBRAM can have an optional file backend, which must be a seekable
-- 
2.39.5
