Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1088813njb;
        Fri, 6 Dec 2024 11:23:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV4Sddbww4erJgXIwzKCLzyMBN+Ghmywxxr7yXNUBLdKzBN8haFBopUt/BhDGlsxs5+DK+QFqcYehsDKg==@linaro.org
X-Received: by 2002:a17:903:24f:b0:206:9a3f:15e5 with SMTP id d9443c01a7336-21614d82214mr67671585ad.32.1733512984623;
        Fri, 06 Dec 2024 11:23:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733512984; cv=none;
        d=google.com; s=arc-20240605;
        b=cz89ruXFOa4QqEPbXXBMMnrjHOkYEjQeY6HZEw7mxRagwZQUhcHB2MZz4hO1RhfGgR
         y58lRAG+BAz7yRgQzZdgWNUvlXhCftXIQfnETq53L9jxFQC7fKGTMHmC5YclmaYcP1NM
         fODbXGF5i36pV/XLnW0yyrrtZIGPNw2U7E6jS/NieQdtmzAKdPZqSq7woR4CH22JY/Di
         ooWC20BHG2lJJPZXQ+KSaaYPzBuhJ9dxm0fPZiEd4J86BvEozIyEJUVbiLuu8bQJRsgD
         vEyC0lJbzmcYn+syOu0gktm+QjDlUWppAEApfZlD3iO9LAwzj2MhdC0OvVVYC0ZJqaBR
         pYWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oxns1y/BgfBe5xDZQgTR43Ph44Qsk4ANUhvirqhaS04=;
        fh=7ltOFJkmp2pSc5oRVJa3YR7fXp4SzQi2N/uRSpwsasA=;
        b=RDZGRRSDpaSg8SP0ySphYsjww0GCr4vW1iqxMmkDSmCwkEJXK3RoFA/G2YB1RnGOJA
         /lanMkMlo8aohJkcckZa3V08bpMv2oIOUTNlcxd4DXVItH/zfPNIq82CF4/qnf4r2nZc
         rbJsYsY/Bli2mNelUrBipuS0Rjb4pScy3unKE5kh0s3YeXzPbGA3ZcivjFVgnP4tuj7m
         4KpO4B2+0ARq1pzZk60pp3tTnydIB1PwEOY5Np4yhrjcgpIGvvB+T5T8NFDm2svQBbAV
         o02yxZjglfFCeyQGRU9EHYSEOKH84t/rzbT7PyuibLF+wHLWGgFQyy/mt93lwXWdPzDK
         IAXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G1JQqZue;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-216281bc2dfsor2430545ad.5.2024.12.06.11.23.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Dec 2024 11:23:04 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G1JQqZue;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733512984; x=1734117784; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxns1y/BgfBe5xDZQgTR43Ph44Qsk4ANUhvirqhaS04=;
        b=G1JQqZuevQsdlIQoBiWn+PEgNzmGePdhk2xcvgSIrP6TtiYliRKJFCIRMGBe+Juj38
         LCvY1AbIKRggqbTOcbrpOIqyXNSozvLwCXJkA12dnc0ulMG5DELJYKkyVmAmUpvEZtLM
         U9WnJpFZVVV2Ci6T0ondu3rgRTiIW3onuNciTkuk+nOFK4mK9++tM4uJCSlB4zfoa3N7
         jbKUpbwkT2i47om9gay/9TNwxKtKqbZ0J5QcY+jHp+9hcXl8GLAZtxQiLXVUHWHYnCSx
         g+Ig77d/xTAVW/EGtFH34+ToP2lWZtUnr5lUK84R5ympWUSfWmR0CyEM74BBnQ2eNUng
         GLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733512984; x=1734117784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxns1y/BgfBe5xDZQgTR43Ph44Qsk4ANUhvirqhaS04=;
        b=EOkbbJZDVBachHZHLCoudpOZMnBY+UxWsYzXEGiiWAb0Qp30YN1NzIRsp9+0uYUm6k
         /TrBqnN6g1AE4t6f3xBhZvedhFPJZjS9obJh/TqdaPG8aiTea57mYwdtbwLQG2mxMNfZ
         5C8qYoxIncSDahNtJBHZ6wP5O1LTnrQmMm3Qb6p9va9mCqMnjNIQD2BLaEQHStKtRiWF
         UY0h/kyzP3fSYYJrXB3thxWYq0e50uCfI1HbO2QfsxZZdHdLm6Q2eufRj0MLI8X0h9K8
         /OivEV3EvYqU9N8h+bwquQLnwanSypw2qXyTMuVAWXyfgjN03u6d5nzgyzho8CXEBpn3
         S6qA==
X-Forwarded-Encrypted: i=1; AJvYcCWfkWBGweZH/d08tSfglHoE1+U9O7oQEJo5LNboCjUiewLpDPDl3zs2lddjO+xHEmfVnfN26s718hhneQ==@linaro.org
X-Gm-Message-State: AOJu0Yyntpydy9AvFpHuXnDnXchoAjrhQ2yfU+XJytuhR/qHfw1Pb5uP
	gN5cIAihahFgZhN3iAFNTZPLdrLcw8YI1CDuO3fD5P6BUpDVWsyWOE6a6ibyXwYWmg==
X-Gm-Gg: ASbGncvy1Ve5anKSpAj15mlqQSptuhr8NIoGI8ZdzlVAk2P6V918qbDD7cN6zRDyP4e
	L/CCpByM8cyBCPbZSAz0zrqGjRppGdsijbr6R/nxfHLeOviiNON2UvVNoByW7s+G1hD2fNnPQhm
	4YzDSLCu+8TyVSHQkLEz07lWB68RlHik/DTO1kKtmpD0E9LTmi2yFBCs7krdFo0DyA40Z7bSa0l
	WcE1Ht3R0HDsBUqYS1G4URwnSJhC/cqH0rnHF7x2kXCsDOqEhZdvqA4KNg/B6IoSmCkN4z/DZ/d
	K36YPfkQ
X-Google-Smtp-Source: AGHT+IHJJleob/BsE5gI3Z60RdIXKdHyBEatFui1XI7rrGuhPou8p8Q+uVqGP1BSTB4j3o+NzzINZA==
X-Received: by 2002:a17:903:8cc:b0:216:2259:a4bd with SMTP id d9443c01a7336-2162259a5cbmr30092825ad.52.1733512984240;
        Fri, 06 Dec 2024 11:23:04 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2161e5a6f23sm11720395ad.266.2024.12.06.11.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 11:23:03 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Troy Lee <leetroy@gmail.com>,
	qemu-arm@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v3 2/4] docs/system/arm/fby35: document execute-in-place property
Date: Fri,  6 Dec 2024 11:22:52 -0800
Message-Id: <20241206192254.3889131-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241206192254.3889131-1-pierrick.bouvier@linaro.org>
References: <20241206192254.3889131-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ryW9L942L9Xj

Reviewed-by: Cédric Le Goater <clg@redhat.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/system/arm/fby35.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/system/arm/fby35.rst b/docs/system/arm/fby35.rst
index bf6da6baa2a..e19274e75c8 100644
--- a/docs/system/arm/fby35.rst
+++ b/docs/system/arm/fby35.rst
@@ -45,3 +45,8 @@ process starts.
     $ screen /dev/tty0 # In a separate TMUX pane, terminal window, etc.
     $ screen /dev/tty1
     $ (qemu) c		   # Start the boot process once screen is setup.
+
+This machine model supports emulation of the boot from the CE0 flash device by
+setting option ``execute-in-place``. When using this option, the CPU fetches
+instructions to execute by reading CE0 and not from a preloaded ROM
+initialized at machine init time. As a result, execution will be slower.
-- 
2.39.5
