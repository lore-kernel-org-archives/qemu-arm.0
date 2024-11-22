Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5748618njc;
        Fri, 22 Nov 2024 14:52:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUU9XW0hDBi0wqm2FF9I4k0mkX09TnSs91GqjsYWDr9Y9WOE0IBvM39y74W0YJraB9nqKrq89iIM4LRMA==@linaro.org
X-Received: by 2002:a17:902:ce87:b0:20c:9936:f0ab with SMTP id d9443c01a7336-2129fd7044fmr55294775ad.47.1732315930179;
        Fri, 22 Nov 2024 14:52:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732315930; cv=none;
        d=google.com; s=arc-20240605;
        b=RjN3c/JHbaCBI82kVElWBVrJypIwLUFtpajYXq+Lrg7V6wcLi7p3d+IfkxnMEFw0Ao
         MgNoslDdC4WPt7qK2+ZoDO1NCJQfj2gl73mdtHy7j1snuj7I9QsjOULWSmOAdb1enbcl
         HK++mfj6hkPpr+s59HhcXydLrieM7bfBP1gJSxyKgYDzp6BNNdJ+fMKcQ3Cw/QS1xR9+
         eQab1MRfVd8Ar/qEHvHZsN+Kdw31Yrm1Ukg53oHeWlppBfksDCstUU6tcje+U6yV1ChA
         h4nKcL11yXSI8a9iGmSofM//MZsDgp5p+pdY0erdM2PJiCydB0EPMMAcfCHtDoAQ0ou+
         CUKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rsX5kj893cpBfdd4jZXYOKhLAvMEb0p0E578a2RbpHA=;
        fh=FZSlYXHEtAQzA9cZhJ3nKcZoOiGVH/vz5qBWEevIhvQ=;
        b=Xpo322L4GptzefDuH1DQzIBr07GfXqxHTTFrdIy+J5twtvwHsjGQUQhqUtUqZ2TCNj
         iFO/KiuUqMhgbqaoa0UdzCFlokxvlo8nGmUAAkwhPNLXV1yHyTiYgMxSXTMpt5NSwakH
         iI9DJ8Sf9ZyJBjXVkFTmpAqx9tCqA3p8sVx18YmpDXVFR7pAxie6NM8uz81iKU09lG1W
         uBhg13oOfbKCUHm5OeBnRosT5rRk6oJKHYTTxGK2FjT/d+tI4eJDm7b9gIoJZcw7xR9O
         Kq9DPZDDUU+qOHuxVBrt+yJ4OCB6rpA/vzastn4mo89f1j9wNxoZbL8X8AxpCgSCj0+S
         RwcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SLbTqdyh;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2129dc3a3a8sor24060855ad.10.2024.11.22.14.52.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Nov 2024 14:52:10 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SLbTqdyh;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732315930; x=1732920730; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsX5kj893cpBfdd4jZXYOKhLAvMEb0p0E578a2RbpHA=;
        b=SLbTqdyhPOjSqeOtGZBldCs2/EJld2RYAmC1hD3B8bQgPHDecbySzp4lk4hQvt21Nb
         T+W74mnLlHcAJFyMvnwJkwgesoHgmT6miHX+4zSCWALIzlJXQ85l0ewhDf4vBNQl+7N1
         wgj/ewriOrdI9ogRv7pVyJuW3f2lMVeLu++VIqvBOFkUIlAGsRnhtzTpb/eeTgjUlC+Z
         5X7M0prSK4XvcB2pFKgOK3PxGbi1oQqINY1KNUH8/zSkmEifaql2e+7R6Y++0ctnIwos
         dtarySm+eqodGktjzdQ0pDoDfRxfTU9eJe9eZxJlEL7C4ZhhqUku/lGZtdlp2jD/r34t
         Fqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732315930; x=1732920730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsX5kj893cpBfdd4jZXYOKhLAvMEb0p0E578a2RbpHA=;
        b=nf9V3KdUoqrnewqECqgPG00EuBAzdhR9kdwk/leRxT6RyrJmSa6FxvbZV5Xaw2IKqq
         ZgPYqcOjB2L0B9VKSu9soh9aWK0RKoQRKPNTwIHKvgCAYM228/t0dki7zqSNn0Gws58P
         zA3yEn/lWTKbE9DK4JxZ7/K9FT9y9yq7M7Fj+01HXFhbszHH3ejYjYePe9piYvryxmrw
         3BX03ZOUL0NwiCGumar7R1qXBR1ChC8cMGfR4WMh+RWw/3lGxn3h2lXvutAx9xH2owCb
         J82f26S4SYVe/h+amK/ocWdAngTihqZsotfChZZpGr3Kzkk06kZtNB5jfXMi4k7grkfH
         5T5w==
X-Forwarded-Encrypted: i=1; AJvYcCWwnzEA8VOJk/YmpdHpTtKQh1MzNVrv/HYLrbebVB2Zxf8YwyC+SWXx295HP5kh72Eotjz1ID2MaK572Q==@linaro.org
X-Gm-Message-State: AOJu0YwFCUMtiYseFjQqnXERl4+LC2AAFRxPY7PqIYnOLVXPcuJSzOxO
	HI1YMW7z69z6Stvwro5FD70kBD0TT97XfeYdwfgM2BMhresxHBdqpUhc9P/nHmPH7g==
X-Gm-Gg: ASbGnctpakIZLC7TgY61gCCwuKH5Ya6/LgPtaX+KeFcBmk9H3GgtjPy0/PGIHIXyrm3
	OYLJKqe3pZGiPf2F4vY7VkvkdYhY5o17z8axpVEp3YoqKA7074AHLCjgA0+qm9S2zHLf6CYzDfk
	I+0ckyi7VN4Jo2HQutG/YXQyIiDBvoWi5PuYJ8TjX7IRkcC+NWNEeWSJ0tY0OYJ4zMoIE7N3F3+
	XmTMCwR0vZOItxoepXIuRpgje4q7WPEs3I+xIRjr1B+5yBgaWinGgdZQ0xtHIgTbFiyR+fnpKGf
	LcMQm4H/E5VsXg==
X-Google-Smtp-Source: AGHT+IG/tmVLKYc9cq6ROZfv5TFa26YTZp7M3WOFjIEMBi9PTwoXnkjQMYEHBfuP1N3sLCldzJwfsQ==
X-Received: by 2002:a17:902:ecc9:b0:20b:38fe:60d7 with SMTP id d9443c01a7336-2129fd0f6b8mr69302235ad.22.1732315929808;
        Fri, 22 Nov 2024 14:52:09 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc1539fsm21450335ad.192.2024.11.22.14.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:52:09 -0800 (PST)
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
Subject: [PATCH 06/12] docs/system/arm/: add FEAT_DoubleLock
Date: Fri, 22 Nov 2024 14:50:43 -0800
Message-Id: <20241122225049.1617774-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
References: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ++IQ8uCoj+69

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 47f5123a31d..38534dcdd32 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -37,6 +37,7 @@ the following architecture extensions:
 - FEAT_CSV3 (Cache speculation variant 3)
 - FEAT_DGH (Data gathering hint)
 - FEAT_DIT (Data Independent Timing instructions)
+- FEAT_DoubleLock (Double Lock)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_DPB2 (DC CVADP instruction)
 - FEAT_Debugv8p1 (Debug with VHE)
-- 
2.39.5
