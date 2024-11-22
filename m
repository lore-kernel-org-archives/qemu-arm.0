Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5748677njc;
        Fri, 22 Nov 2024 14:52:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU/LEZ6JDkw1lbb4fiN7pM7qG5P70RW9j689q8VICdP9TnzLvvyF25li1cCjHRSae/UkYeW2AivD8G/EA==@linaro.org
X-Received: by 2002:a17:902:f70c:b0:212:6a14:79b1 with SMTP id d9443c01a7336-2129f217d4dmr59880715ad.9.1732315936403;
        Fri, 22 Nov 2024 14:52:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732315936; cv=none;
        d=google.com; s=arc-20240605;
        b=I42p4Hp1dRn8AW77K/XRgTDhq+JJc3yOQgr1cAkCtJE4m2r3bdH/XXnMSgbWJZ1vZF
         1g3dcLizyiR2EVZEAAT5mJjIcgYXdpfulDjUxm51hufYVgZHc1pjMkvknWo7/2X2BURU
         Z6wsqTQZ07xzSiyMQwNoKRx+W21MzyN36sc5OD3JcsU1AXB+L+3FVhD7yJ7B8AMki9Py
         5BGdF21phbt5ClvCjbOPBUesQUSxSCla7UJQ8ZXOFMT8ueaVdMTo3cROmVfIrn+sdV9b
         V1r6U0SS3cPs8A7tkCeDMhY+H4VAZ7XS5VlzSRubg1dkozUZpOGNf84Ae0zfpbAdLeZ0
         GCdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=K1ctlapp4stEVU38enX8v91wei6PmLR8G4O2Snl9LB8=;
        fh=0pFd9+UZFHSWHuOZw9dXOmEKT5yO5LdZk9yZl1E+K5w=;
        b=VFuk9bUN3ogyItHsNyMveKftIxvxVXuhPur1PQLsx/wTNOhKofe+dW6JA6mo8wtzjx
         KnSVhCC5Q+I+hws9p+eb6XaCzT4POTAYb7hJL3b7dphtpskuMT0BGEcbnPCdLZ1L1e9U
         F95v1XAMhEOE881BuTwAH05v6H0cXux7++Ac7ZHWXXek59t1umFfP6gkuYm4LFOV7vsa
         uZmZJqkwltGLPyTmEU2yfR6laW5jh25QWJW3ZwgkCufvjLwqBy39vvXbHR1IPrAsgCwH
         NFjhiHyXPoW47647Dyd1UFvlg0LOBSkBfZCUrfov/HY7Nt6/cXiJYh1JRQIHE35dflU2
         aFPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J2To5gUb;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2129dbd29fesor19374835ad.13.2024.11.22.14.52.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Nov 2024 14:52:16 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J2To5gUb;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732315936; x=1732920736; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1ctlapp4stEVU38enX8v91wei6PmLR8G4O2Snl9LB8=;
        b=J2To5gUbW2JH2eiLpmFe1Z0y91WKE4P3aTG8HxcCNSq2/UYnGJUyMwK7Y/76gcLL0x
         S8DoqJcMl+PxRSnyN8tq1Z5szlOuEqnJ+4mnaRn81vtoZKEizxqNb7wegCmlNRFtZ5Vk
         65F3ofKPT54YkuS9vS2rWK76G33ZXPDyZeIApu4bBbCDbjee4a32rssDJIV22/kneiKb
         6+Hgfyrf2Zv/TnYwe6LnDsRsnWqQPf62k1Ao2X8flqdK8hx8D8/i8vZuEFkpD3kC+XOu
         Kg2x2w6j/9hWHqU4UENZsNqcpJHnKVmchhhwQtwm8sHCnb0B54gHavF69mAMJToGvvir
         23Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732315936; x=1732920736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1ctlapp4stEVU38enX8v91wei6PmLR8G4O2Snl9LB8=;
        b=GKr+Ts4vdSxbUN8sh9wO//7uAnNhN09a2m+PgU1BvWGhdvtOJh1sZCsrCT/uiQzNUG
         0TQTk7esp4dLcpy/VAKCMWMuhuKz/3Mi51mHGUfqR3S0+qPBt6Jvt9Nb79kM5pTPX01V
         xwCVhC9BFPzyR2QJ7mksAYpvFEl+9XrwCNDzfiCvUOjkYJoFF3O2kFAx3YjiVNUcm0Tp
         E9wNEbzCyS/sOBmZw6guk1Tp5CMoxGVdtrKRN3e9GHjUOnciTZ34OfTgtmSKlpSIa4Ik
         yB3nRzFoKxKULYbCyL5mkvfdo6ffm84iOrO7e1S6Vqvhpw5gfNkGLddOcRLrRRwFqSpI
         CNcg==
X-Forwarded-Encrypted: i=1; AJvYcCWZdRw/QtLVjGdP5iZJxkVI8KgTiOx9fOtgsOVaSIzhVFERWEv7pRDW0pQLb7K+18D8jqu1Q0Pj3VbbPQ==@linaro.org
X-Gm-Message-State: AOJu0Yzx5rqTvzqwrtO/iI/mEu4dlhLeBS+GdaHJj+gRAEt5f0EeSj7Z
	ZzkDykNn0s+C6iNCS7JFY1gMCJP8arRyB6Qogq5kWmSxDteBFsC+EQqAVLuDpXk2rA==
X-Gm-Gg: ASbGncutoR2sgRPfWs7jkYwUTL1M1oVoSFP9mhfGBghLVtQjn+WD1AKksDfjGWRlNlC
	nL5Uso7KcxY6PLbTpJBoD8jRxmppVINyb6Hm7UeXttPAShaamF9N1U98eO89PsYGtEe8a1r5GO8
	sciPfQDPtOnRtna0hOgFvx4YKyCULhRFpLZZrNvRN4LjGQffDmDADbM+Viu82qxlOyHtPoQVbi4
	05nJxH3VCm4n59NNNIvf96wTcTa1QEZS7sm3iG0p9n3sGIGFgXyqOn+oGaSUUEnu6CoYZWAMfD7
	qi2PH+ak9xxGcA==
X-Google-Smtp-Source: AGHT+IFMAjPxi4stB8Hf9OqS6Sc5DQOnaCJAEKbNQseckW4x31B6Qc1nc4qz55uDEJBH4t0YDlSNvg==
X-Received: by 2002:a17:902:f549:b0:20b:80e6:bcdf with SMTP id d9443c01a7336-2129f237d5fmr54963075ad.23.1732315935989;
        Fri, 22 Nov 2024 14:52:15 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc1539fsm21450335ad.192.2024.11.22.14.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:52:15 -0800 (PST)
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
Subject: [PATCH 12/12] docs/system/arm/aspeed: add missing model supermicrox11spi-bmc
Date: Fri, 22 Nov 2024 14:50:49 -0800
Message-Id: <20241122225049.1617774-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
References: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: XHu1peTqRYGf

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/system/arm/aspeed.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 2e9ba12f7ae..d17fe7a4fc8 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -1,5 +1,5 @@
-Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``, ``bletchley-bmc``, ``fuji-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``tiogapass-bmc``, ``tacoma-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
-========================================================================================================================================================================================================================================================================================================================================================================================================
+Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``, ``bletchley-bmc``, ``fuji-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``tacoma-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
+==================================================================================================================================================================================================================================================================================================================================================================================================================================
 
 The QEMU Aspeed machines model BMCs of various OpenPOWER systems and
 Aspeed evaluation boards. They are based on different releases of the
@@ -15,7 +15,8 @@ AST2400 SoC based machines :
 
 - ``palmetto-bmc``         OpenPOWER Palmetto POWER8 BMC
 - ``quanta-q71l-bmc``      OpenBMC Quanta BMC
-- ``supermicrox11-bmc``    Supermicro X11 BMC
+- ``supermicrox11-bmc``    Supermicro X11 BMC (ARM926EJ-S)
+- ``supermicrox11spi-bmc``    Supermicro X11 SPI BMC (ARM1176)
 
 AST2500 SoC based machines :
 
-- 
2.39.5
