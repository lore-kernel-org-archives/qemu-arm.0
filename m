Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1024729ejo;
        Tue, 12 Dec 2023 08:30:17 -0800 (PST)
X-Received: by 2002:a17:906:7954:b0:a18:896c:9dd with SMTP id l20-20020a170906795400b00a18896c09ddmr3880534ejo.41.1702398617693;
        Tue, 12 Dec 2023 08:30:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398617; cv=none;
        d=google.com; s=arc-20160816;
        b=mPRWAgzUDhBMiGpaUVVLyr+S6wTIygiSGug+rb9OBt0IA3RN+Kg9XjAZDsDrTo9Qme
         rGPdrjnLLRlwQhIoLUS5cjU5uuJP/+foFkSzBIV+BDkPAt9Mky7I7ZapilxedOeKCf2z
         UkY8sjTbpVvH7FjIPYcFy3aBOeCk3ktIsMwMpNma/xk/eT90+QxRr7xalvxAHrU7de5W
         Uh8hkqXWbcvjI0PMQnGjDWxBrooNjuAKUPhn2j7bFkcqbwXTpdlYLwRAMvNYdLKMJf6L
         bgEpVAjpTlvNKX+7TXTNclv+vjOGTZAL93/ikIxsbSTjCWFoKGQQ0Dmsbxzg8fv+AMnd
         DOww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0yI/BdK3JpWxvgTmRXK4JG4UZmdLauV/5I5Y5kpQEdc=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=ipHGBvt/hvnNioKYYZn7gHQNPw7+7XFUgdmA1Ln2cv9AMzOe1foc770vdbWvUy8DeJ
         dtHgVPFp9x8lshlhD+TaGBfZ11/yGRe53oJ2U/GID4jsvGb1Z8UGqoLhRAcwPoYLnZqA
         kAYQwx0XZgPffFWvwTsla/sJF5gWvif0q1EfyP5n1dpAQqYCBSR8wklLZsCuVP/LEerr
         h4pWDaC/Y0QtyyNPL+zzVP/QtaZzcevZhYgwg4DiS4LpygUYtO9VTOqhflzrBBs17HI1
         2QYzw0pGDkKxFoq08sKlWUu0EH/lt39xGPrWysRvacHMv1a92EtdQFU6d/SQXbhewlAp
         l3TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HE6J+Y/Y";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id qs1-20020a170906458100b00a1db99b780fsor2250289ejc.6.2023.12.12.08.30.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:30:17 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HE6J+Y/Y";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398617; x=1703003417; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yI/BdK3JpWxvgTmRXK4JG4UZmdLauV/5I5Y5kpQEdc=;
        b=HE6J+Y/YYvud+YYNrtOwdEDQO/RWwPpUsncy4vichWTbp3SBVZXHfJ4BlVQZ1kuIMo
         U8k48fK5+QWJWgRTw1dreuGQvkz7efQmzWnsumWuywRqEMiX37E0jXPGc5oMqYBxY6Kg
         uJZ/FAGOXVOiUa/1Xp2HkwSTfsgpRVXmW73sgBTER9OTW3pLdEB5Sz9cIYDx9C6mqEmQ
         YX/8K+DXZ+0glmlk+0ecNYwjtAz8QEG/QmGbAfqSAALzTCFTuqUsCgvDIMc2uqHasQeW
         /pE9Lpc28ooWAW1B2uRvvi61+IgEjotxj2TeHyGxBP0cjMbEhyA07wSwTmJfNcY/h5mN
         Wuww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398617; x=1703003417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0yI/BdK3JpWxvgTmRXK4JG4UZmdLauV/5I5Y5kpQEdc=;
        b=FXqVkQfOO+Vz86aL5fg4zP+AUJ2WhQWPM4nF+I9uIpX7z9z4ptvEG1sbnPoM9WwenQ
         4Gk9toMYtUAA+oJ3CdTN+DaA2tr14U/VoqnupVkoE2LNAFd0ARqHbomYlOjYeBWPrulQ
         8s2s3LWcRcNDvD+z/dwZHf1DyyIqrU7BPQvgZCjcw2jAD3KbHuCsT+Ww0cEC+AMNh7rA
         AmafO+p5XS84b8YGSfoDCIG0Sr6kSh+HtYoNpTEl1lI89ifBLA5Dh30iKZ21smZu29HD
         +BeUNL8fd6l62bwT3MtxI2IMYj8TwOfatHU2Q2vCeRV5P/tJ8fYpbPStnD6qihxRXtWS
         wcQg==
X-Gm-Message-State: AOJu0Yz3de/KJ+LRuJZ5z4ceeWK4BVPuSebcIINFRcWInZlA57JZgUVl
	kzATM4IaVYfJj4kroPxEFp72DhpQ
X-Google-Smtp-Source: AGHT+IGocN7maPYKtAczqs3qDPil+solm+ZjQNUyQDb7ys0Tbt4YnQ6fpdspbxcOG6FTxMKseOq12Q==
X-Received: by 2002:a17:906:14d:b0:a1c:837c:e4a0 with SMTP id 13-20020a170906014d00b00a1c837ce4a0mr3925715ejh.29.1702398617418;
        Tue, 12 Dec 2023 08:30:17 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id ts7-20020a170907c5c700b00a1dd58874b8sm6477080ejc.119.2023.12.12.08.30.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:30:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Anton Johansson <anjo@rev.ng>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 05/33] hw/cpu: Remove dead Kconfig
Date: Tue, 12 Dec 2023 17:29:05 +0100
Message-ID: <20231212162935.42910-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vtU62TTLxQxt

ARM MPCore Kconfig are defined in hw/arm/Kconfig.
hw/cpu/Kconfig is never used, remove it.

Fixes: 82f5181777 ("kconfig: introduce kconfig files")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/cpu/Kconfig | 8 --------
 1 file changed, 8 deletions(-)
 delete mode 100644 hw/cpu/Kconfig

diff --git a/hw/cpu/Kconfig b/hw/cpu/Kconfig
deleted file mode 100644
index 1767d028ac..0000000000
--- a/hw/cpu/Kconfig
+++ /dev/null
@@ -1,8 +0,0 @@
-config ARM11MPCORE
-    bool
-
-config A9MPCORE
-    bool
-
-config A15MPCORE
-    bool
-- 
2.41.0
