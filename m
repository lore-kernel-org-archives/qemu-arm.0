Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp865249ejo;
        Tue, 12 Dec 2023 04:35:45 -0800 (PST)
X-Received: by 2002:a17:907:8686:b0:9d3:e48f:30d3 with SMTP id qa6-20020a170907868600b009d3e48f30d3mr4179521ejc.31.1702384544975;
        Tue, 12 Dec 2023 04:35:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384544; cv=none;
        d=google.com; s=arc-20160816;
        b=pmMcDXkAJFdTNISGCXlYW8NgNB051XVklR1E5RhqvD0uAsXMAkOlQbPOU+FxC2Rqmi
         vbWGhkpDJjFlpAjIvVk9cX1NPbl+ZNRJlGUYK2zL7mnsUNyqBh5XxpkfYZ4+Tp8gQWHI
         otqyanYj7IxqKuoC3HR8fNJVQBKEKvCGnqWPdsih1FUmXX/AHLGspEkQd/Y2DixGZ+gV
         gU5raZZcDleD+PG/YR7UEuU8oXmQW0J4BrLLjV78fHOrQJMGcmHk1lBMybkBVzVpKn8H
         K7WQZAQ8+e55/12WMAtDCsRYik13Oh0PMLrj6JuDE6dS5pzygkBlxWSdoswTkqJZ1nf8
         I6og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OWfYjgvijR4Yk7OOcPMVJ3eTtKOWWmhjXW8fnIT+sQQ=;
        fh=vlFEGdij83GYetLrOUaCnR04sbYRvtckD5L7fw5192c=;
        b=V1XmWnoXDcSRU5z4m2zrUKloTNHB0YQ6ox3aklQpeIMzlcvy3Oq4AYzEDqDRMT5pPb
         8tLb3IZVjI2c86jMAmJG9hjcGppUZ/Ihd2vKzlt8UDGZumKGqduQ3pugE6hRQO5KXMKj
         0LYFTXEQduLwoY6YyHamanIlz2HhtT5pYxvBpQgVq34CjZJbI0ovgcVvvnqgeXsOWcvS
         O7gxkpr0/sPconGFeXiw/LEIaHSdBeht6Nz0vHD14mpow82PuGnpyDng9Ch59jOWbHlI
         /ecvhlGkSFYwEZ+W6bhh1bRvidB2JBqtPll+RcQsKV3XxdBHifl+Qy3S7Peb/tpqCkLu
         0SKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sbkwcbnr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id lf5-20020a170906ae4500b00a1cb189a226sor2288738ejb.18.2023.12.12.04.35.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:35:44 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sbkwcbnr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384544; x=1702989344; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWfYjgvijR4Yk7OOcPMVJ3eTtKOWWmhjXW8fnIT+sQQ=;
        b=SbkwcbnracHzAkUyMbfSN1ppoLTt0706lCBNIxJHBCxN4qvlYDmRiMCW+ZZaJf80n9
         sI6zXpdblkAcpkL6O8rLaWrASA6lZ0M4F3Z2PnN8+vwIfgzsAnCoivPNM+YGELS4Rsvz
         ug/Y78xQeagpVJgzBaOUjDTGo4LbxpGksap0VCf2L6bFYTer/eSYamzyXEXckhTehZL5
         rgoWtz8oj7qsvdfHnFRtTfHiSznZfBVzAE7l37KEk+1+KBajNLvMC70zWBlxb1mwX4Vs
         qM497yJuBQSOC/wwhxDrC9iDiBm8qUuccQikoitUkJEZXuDxd+GfKK4pbEGzMt0i0CcZ
         BBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384544; x=1702989344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OWfYjgvijR4Yk7OOcPMVJ3eTtKOWWmhjXW8fnIT+sQQ=;
        b=jiXd8ZRphzkM3G4uDAOaOs6yQY1KwQF8bYKrMuxmaKDdNKnk+lua/qXbRvLtiA98NI
         8ngoh81cMGAuodm0HDXcwh/HM25/PlgjLpaxxoRN1ys38Fw1vNCwwiOvOjrrW/HCbPqc
         AqcilW+5yiUyUyVPxRtG4gctsnVfoVtp5/AdngEWcnJaUsrmZ9wmoZq2e/VrRyWAn3Ec
         MgL9FO9Fdy+H4eOeXrhE2vy7x60PiAY6P538tV1WLEZcUeEnnhGf2rTfiY8OQj5YyslH
         TeYhVAmGeUMzZWzF4mZIKrol547/yD2C5PHCewSe2ckHNsTNlHL0WDPuBapjuZcb/3rs
         5qaQ==
X-Gm-Message-State: AOJu0YwNpxIMRB1jZyUW8wr5LYBkf/3w7pkCO5ZwNwJKiZCDMQX6lDHy
	HmUQ9CRxyBA+noxZokKZrIVnvG2W
X-Google-Smtp-Source: AGHT+IH1E3N7303frpNQQ0fjFHz7zCU463Hgb3lbpYe56T7u2mDKOAfzHYFdaUHchwFP9G5x2G56+w==
X-Received: by 2002:a17:906:fada:b0:a04:9608:3c89 with SMTP id lu26-20020a170906fada00b00a0496083c89mr3373488ejb.75.1702384544671;
        Tue, 12 Dec 2023 04:35:44 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id uv6-20020a170907cf4600b00a1e443bc037sm6276535ejc.147.2023.12.12.04.35.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 04:35:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-riscv@nongnu.org,
	Brian Cain <bcain@quicinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 14/23] exec/cpu-all: Remove unused tswapls() definitions
Date: Tue, 12 Dec 2023 13:33:50 +0100
Message-ID: <20231212123401.37493-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Ol4Jsq31jlK7

Last use of tswapls() was removed 2 years ago in commit
aee14c77f4 ("linux-user: Rewrite do_getdents, do_getdents64").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-all.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 5b5379b94c..b042d94892 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -38,11 +38,9 @@
 
 #if TARGET_LONG_SIZE == 4
 #define tswapl(s) tswap32(s)
-#define tswapls(s) tswap32s((uint32_t *)(s))
 #define bswaptls(s) bswap32s(s)
 #else
 #define tswapl(s) tswap64(s)
-#define tswapls(s) tswap64s((uint64_t *)(s))
 #define bswaptls(s) bswap64s(s)
 #endif
 
-- 
2.41.0
