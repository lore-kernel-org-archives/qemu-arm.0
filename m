Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp495630njb;
        Wed, 4 Dec 2024 12:39:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVXk5/WrOiA5hBKYK8Ho/AlTb+bFz9pnsZDNTXpFtfP5i1y1qD/eBMkWMfyOofcn33FK9nJ0ZBDBJTjIw==@linaro.org
X-Received: by 2002:a05:6a21:3398:b0:1db:ee29:4f4c with SMTP id adf61e73a8af0-1e1653d086emr12047404637.23.1733344782141;
        Wed, 04 Dec 2024 12:39:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733344782; cv=none;
        d=google.com; s=arc-20240605;
        b=WD3AJ7wZJrCKVAulqWJ5rrTZ+iXRSVwVkGlWh1N61Gzg9zHLYTUacnB+ELRTV+EHye
         vl/nrF+jFACkqNONryCD4wFbqydxu34WYB2WOKy6BgAq4NgNcmSzbcz1Lgi4GM2ose1m
         qDoSCj3EUKAboA5X4j1ONckk8b0213KrZcO1Z3Pzr36aN/8TCl5wAOM0roOZtYf1bjJJ
         DCG15gC0n++/BrOiXrK3oOU/2jNNIn1odckXpQTBxi5bY5cXv5ZUe7kdfwjGFXhB2JtY
         KcBfRki/NWM4ROoCAS9wZbjrFuWqbqKt6eqQ/0xsrZ+RcMDrF8RZgOMX9+TLjH4ZRgIo
         +TKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UqKHYpUulGdIWayEODwJfBo1zUyakQeh+AqqbYk0b0Y=;
        fh=C8w/s/qhaz+GD3rxO8uqLzr4oaiplvM4NJ1npC3QPH4=;
        b=cmWLcB5L6JbnkDNho2nMBHWNvY6ikjrhbWIw/X9oSVBDuom9sdjmXnNRnPhw7bMPma
         AILBUY3O/bmwwjw1C/YOzQxT0me4IG7dTOP6rtgOlMxZzOLEJ5IBiZJw9AfKwavVsEMC
         s57vbKQMZKfh3VUpDWvxRgSx7XvGBuz9awOcn/zU+XyBffofGDkaTx82qTah2LhO1vfF
         m1D1p/7tM7lfNnFWtiSC4ceLUXkgtTFchqE6ICVl88h2F2xqC4vP3juXbg7Wx/P1w+lU
         VYZ64lJNJYNqFOXs8/MK6imPdaCYCRy6FdvU+jbdWm0U+IU5jZDt2QeaBEMwBwk2O4iA
         WaJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YD378NmX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7254185a25fsor2506067b3a.10.2024.12.04.12.39.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Dec 2024 12:39:42 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YD378NmX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733344782; x=1733949582; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqKHYpUulGdIWayEODwJfBo1zUyakQeh+AqqbYk0b0Y=;
        b=YD378NmXUUDiCEVP/lmK+PwRvRTKupr37uGUER19GTrL3tFIFMraBkTA7O6MfsO5qe
         DJ5Iqq/AR+CXhmXGPzipELJaRu9O+9tQr+CVTeZUohcnfH/31DTqJsR9NUk9CoqPE3Pl
         /3jARiBK5M0YIMO/tUuBQ/RnX8AFOgCAHAZ2ylSfDuakBu+N8ALlJlXYp0kDcFu1/t/t
         AWSFSmcUQZbnJuvUaDOuGwg9VXgS0xB3G32USZQVyliXhcJCbgg46zJlPSYuMyaz4P4N
         ZXj/svA19xow9ijb5qNf+cJaZ4SZSBf43IHPwSmmiCF6O+IFcazC6aI8n1RRifJSjWCe
         nUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733344782; x=1733949582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqKHYpUulGdIWayEODwJfBo1zUyakQeh+AqqbYk0b0Y=;
        b=P63yZhj17Q3bVGdKfvgsZeLtGrfBZ3xqzBP+aVNyKhVUM7/VLwGozu3GSiX79H9bZw
         yCPlbs3UYUqx/jiB32ghDEI0ILmsNKxr3HmecKDNTJfuPYO1nyVdA0boEmU3pXyIWt3m
         7g0jESQxCrm9uAgGd2gdmPyf0/CQ6l5X1Jhih8WGBMaKEtQjIoJjK+rYa8avtDx0PWbS
         VvYUxCMjhiCOuiXNRWYCP+AxWHwtp6gKq/VjUZJaD0uZMe4S4Mcjr/856ayHypjT9Vcb
         o09Lr30KEvlFjug//5wgwZe2POJy2w6TcsnEnqW/qc4LEMnEl3Xi2m89EBsOpytO1/7U
         QcXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9vKLBZ0xl7VSM5/CibGXANXeahiVFZbbzlU72m1CrLZBgBJdnByBXtbxzffII7XIASpV77hdLzpo3lw==@linaro.org
X-Gm-Message-State: AOJu0Yw6Ph7y+0ImDKg4pnOn8ecwXNyjyoBdOnlTkSLkDdTZBgnrKZfO
	p6sbO9XmxOTQ4q+5t5AC0VWbqtJ+f0Vl+70QkPZ9V+eDAN5h1JYmQy85B6XX/SBWdw==
X-Gm-Gg: ASbGncvvMPb7ilHkrNoqHG4ZkSsgkZy1rB0L6ooiBu4HvH4OGdwHODllCEQv+iN06M5
	K/2fLZfguz31vfH92N+g7pcrFOe7lWorJBRSYoGib2IIFW8Ai9Plu2ldGVajWdN8AnGtA+kB65/
	qxYXLKyV8LnMZRX0FsFsbP+YBJecAVUnRrRvqw1xIdSiTs2lCSEQoczl1wfaSlMTSHEy4vt/qR8
	QqJ1HWhqCZP77j1s5DqH3hJe2axWXPhlMGXJdI3H21Ckx9abIndZ71b51XZBGLWewC9xeI3TW2S
	6mbcqwV8
X-Google-Smtp-Source: AGHT+IEkMuELipHiPHIGPhzFUGJmfM2ncNF71WR2OThrpwcbDONKmux6JG3ZGIZxFG59jaEUyVbyRA==
X-Received: by 2002:a17:90b:52c6:b0:2ea:696d:732f with SMTP id 98e67ed59e1d1-2ef0124eeccmr10621728a91.29.1733344781729;
        Wed, 04 Dec 2024 12:39:41 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef2700cc6esm1873117a91.21.2024.12.04.12.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:39:41 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	qemu-arm@nongnu.org,
	Troy Lee <leetroy@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	alex.bennee@linaro.org,
	Alistair Francis <alistair@alistair23.me>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 1/4] docs/system/arm/orangepi: update links
Date: Wed,  4 Dec 2024 12:39:09 -0800
Message-Id: <20241204203912.3037515-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204203912.3037515-1-pierrick.bouvier@linaro.org>
References: <20241204203912.3037515-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: L0FCT+ruFFJK

www.orangepi.org does not support https, it's expected to stick to http.

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/system/arm/orangepi.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst
index 9afa54213b0..db87e81fec4 100644
--- a/docs/system/arm/orangepi.rst
+++ b/docs/system/arm/orangepi.rst
@@ -119,7 +119,7 @@ Orange Pi PC images
 Note that the mainline kernel does not have a root filesystem. You may provide it
 with an official Orange Pi PC image from the official website:
 
-  http://www.orangepi.org/downloadresources/
+  http://www.orangepi.org/html/serviceAndSupport/index.html
 
 Another possibility is to run an Armbian image for Orange Pi PC which
 can be downloaded from:
@@ -213,7 +213,7 @@ including the Orange Pi PC. NetBSD 9.0 is known to work best for the Orange Pi P
 board and provides a fully working system with serial console, networking and storage.
 For the Orange Pi PC machine, get the 'evbarm-earmv7hf' based image from:
 
-  https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.0/evbarm-earmv7hf/binary/gzimg/armv7.img.gz
+  https://archive.netbsd.org/pub/NetBSD-archive/NetBSD-9.0/evbarm-earmv7hf/binary/gzimg/armv7.img.gz
 
 The image requires manually installing U-Boot in the image. Build U-Boot with
 the orangepi_pc_defconfig configuration as described in the previous section.
-- 
2.39.5
