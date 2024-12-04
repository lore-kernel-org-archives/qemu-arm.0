Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp495640njb;
        Wed, 4 Dec 2024 12:39:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWBPVZ3RaKk+Cj5UqFeTl4Dpr4DNtXXyZ8DllAWzgldnt4bg8Ze4MYUr0SqusYDc4Mk9ULJiICdSG3gYQ==@linaro.org
X-Received: by 2002:a17:90b:380a:b0:2ef:30ec:14c9 with SMTP id 98e67ed59e1d1-2ef30ec1c96mr3255927a91.18.1733344783143;
        Wed, 04 Dec 2024 12:39:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733344783; cv=none;
        d=google.com; s=arc-20240605;
        b=CyLAtK5k1FzO+GqRA4fjfmFFzHbm7kNhutV0KyL3yYKwYidj7vzX6fhtL5yQF1si8+
         IFZuxxxYgdOECutZ27dQwUGJeATXfa0d4rHdpluOCpCmdLCClRH5KP6Gqm3CrVC5QXtB
         PvGtezyUvaPUYQRwY4i5ihOvVaNpMiN0P//G3DUVbdgCIl2OjE3rAv/CHJBYShKk12D+
         OyA0cRc961w657uyy3pCwVqQVrXSNAktehZ3iMVF85V2q17WU87KhDYZTYQ9sPWY8vzF
         3ggN6lw+7ciEMkhBUNf/9cphsGxAqM5hFVgza5iAMZQQTcKkkRAZuHUF0rZZafMQWTpl
         BuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bWdFX19LP1eO2d2hfCa/1XQLyxsvMQu6F75MlNcMwzA=;
        fh=MP3niUyrosk8MbZhwJKrXQXM/CahyxL1viqtG2umIG4=;
        b=eE8wqbzcINinbqAV4slBTY0eppzA6bga5J5/2byqtRPqpSpzJlNEkbbGqyg8DUqFhS
         bNMEoo48jAcWYi2T4i7uSoSAZHtHU1H/w6P6tXOaZzuGSkUrhvvGWcbYWUeIB44oWeF+
         VcMjqUbOjITSY9+3BnODss74z4zUOKDOgd65fjVUf3cmpiA72QGreuZFuof2rRVphE9D
         KVVro9jPIbdFmK0aa1oBEy0UR+nVsGBJH8S5a+du4blupRQbQVnP3vWz6W5X+KB7Wmbu
         G8V7r0ubxWirYpneOt3zBPa8OwMU8If/1+IZ8GU+hWKa5eILrp4bSZBO7XqB0aQhLnz5
         3GAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZaJ8ctQ+;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72541806091sor10659886b3a.6.2024.12.04.12.39.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Dec 2024 12:39:43 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZaJ8ctQ+;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733344783; x=1733949583; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWdFX19LP1eO2d2hfCa/1XQLyxsvMQu6F75MlNcMwzA=;
        b=ZaJ8ctQ+4N3+ypCYWuXFKhV5jrnqO8PVIn0xhO8z0z0IcwOdqEIKcpXy4Aj8L5ohGa
         iiP0sDjWQL0MGeN8f0KPVrr5XubpBJaB2Hr7XE2s0NkhwGzcJ7bq8wyTXiBkBy7Bd28l
         LWqqj0fPdIsOl6CIW60vTtsWBPXLBVP7rjVyn1UnPCsaUkRdaD6Mk1I1qQLqRKR04BcJ
         FMr/pUybSZFfoee/CxKzenvu7QLTfz0kvfD3J6cJD+vYHeqHgbvuhk6+pVGnA2IBfkKb
         dBrCI0BSecXO5ryhY0CCXD5PfC082ioUg5+zILg0bvsthkZgbNxPFmiEIkauMK4dcuZ2
         vngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733344783; x=1733949583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWdFX19LP1eO2d2hfCa/1XQLyxsvMQu6F75MlNcMwzA=;
        b=iw4EyEYI5Sf3poIziBHvKNmS31EgdtA6ssXZNAHy0jtZfl+1nmrZAyCF8UEk94RwQL
         6cicu/y3m6LWs7Ds2A5f4NhRPg7iDclB9goS/J4b60OMtR9ff8IPAJ2uyeTNAQherQjv
         vHEKgDMM5qQDaTH3txqRgR0fZgJ4N6lTRPx7J5/n2pv7LBJiA20XaBb6Fx1VaThWfBWU
         wygCo1rM6xGraCa8jP2BFoTmtaQ74qXi1z82hSVtcTBDOGYUFnWpvxfZmcWqw7A2RMq3
         9f9zaeb/p52RusLCtF6N5kMtZVPCrKpc/TjUGHA1Bn2+eCge9oOqXIxwivKDwZ9Y4yIF
         odbw==
X-Forwarded-Encrypted: i=1; AJvYcCWNGH17u7f/rPbmvRox3RDwKxieUPa4cOjhBqTC2ap0csCHU76uBxIbisL7Z/G0jjiTMMprG1mYIVOexw==@linaro.org
X-Gm-Message-State: AOJu0Yzm+s9rOVMxG60260KONM1uArE/rDiUDkX+2kOyYRVOFyGlHtKH
	Sg/fsXURh0h69AQhXhaQEFjWLGEuqyqzAGxQyftTb2v0r/DNzAw0RRn7vj6VVj/pcg==
X-Gm-Gg: ASbGncsoI6iUrCpk5f1IKRO/hm5M3WWRHrTUG8VZnhKgjdchWCftcfiJDwlHe6iWQcC
	UbfSapv3Uvt3JMD6L+HzwEoI4mc3XWyExyBNVID/0XQDVBWQm3f149XZBAvL5MOMWXBwnWfT7FE
	wSAByNm6VVq9REgrlf4fArfcRzZaJyf2/IfmMitgcKam9+Y/J+E+BPAcAiXWcD/I79X7MKr1NL9
	U2HJnmZSPg7GEFzc2psVOQ07bRb9h4NS7vhJnHv2ApRg+lFK0Y3BTO25ordhHFHy3Z19D5CoZp/
	O3KZq+i7
X-Google-Smtp-Source: AGHT+IFWf0SzDIBLAJnfH7YZv2TaEwYSHxZ2UYlOLQts8I0jREv8crOjC6RP/BVMYZBr7OE79tl4KA==
X-Received: by 2002:a17:90b:3949:b0:2ee:5bc9:75c7 with SMTP id 98e67ed59e1d1-2ef011e6a98mr10309744a91.5.1733344782750;
        Wed, 04 Dec 2024 12:39:42 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef2700cc6esm1873117a91.21.2024.12.04.12.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:39:42 -0800 (PST)
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
Subject: [PATCH v2 2/4] docs/system/arm/fby35: document execute-in-place property
Date: Wed,  4 Dec 2024 12:39:10 -0800
Message-Id: <20241204203912.3037515-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204203912.3037515-1-pierrick.bouvier@linaro.org>
References: <20241204203912.3037515-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 31tUkHTfHOkR

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/system/arm/fby35.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/system/arm/fby35.rst b/docs/system/arm/fby35.rst
index bf6da6baa2a..ed9faef363c 100644
--- a/docs/system/arm/fby35.rst
+++ b/docs/system/arm/fby35.rst
@@ -45,3 +45,6 @@ process starts.
     $ screen /dev/tty0 # In a separate TMUX pane, terminal window, etc.
     $ screen /dev/tty1
     $ (qemu) c		   # Start the boot process once screen is setup.
+
+This machine model supports emulation of the boot from the CEO flash device by
+setting option ``execute-in-place``.
-- 
2.39.5
