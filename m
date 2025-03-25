Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2397162njc;
        Mon, 24 Mar 2025 21:59:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXaieQJD80EZtqmX6ZemCOdlQz1cU3oUe7uC5pynRpOTKbyGE2hGZ18Dp+tUt3rx1Y3EaWMkOuXQv+EZg==@linaro.org
X-Received: by 2002:a05:6a21:490:b0:1f5:769a:a4c0 with SMTP id adf61e73a8af0-1fe42f80d36mr25259123637.22.1742878786843;
        Mon, 24 Mar 2025 21:59:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878786; cv=none;
        d=google.com; s=arc-20240605;
        b=a/Xtze+vAOt5/x9eUcf95fnlFumfo7s9zd1XhBNKeVs8hYmMv/i/73CWK0WKg8wJ4p
         UtHOv9HAiJaSZWL8a3exB6yCksvw8dc7Mii5Q7RNWA2aNL8X9jmTaNmUEp6bHqo9ePpJ
         LBH2HcIyEQHvT553zoSX2QPo2MrNmRS6njXr70od0ygl26wbiy9GPLfv5pieKbaiVCwK
         S0iPDP0ipcqhZh0KSFby+/c8PYMT0bxAg9MZzAW9CiAvgZP8m9kHhbs0UxW79ZbUuNlx
         zRjsbAsd3JU7LNHWx2R59xGqby64RV85JQVveDyeb5TN0zvQ5sidpx7ep6Zps4vZh7lK
         FV8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oMLogjQnjMTWhIeJ1ZbndYnRq86dbBuVmVnxwVyz8FM=;
        fh=29tHDm0breUru1Cku8DseR1oeCzhdZwO/6WsxUi6JTg=;
        b=hxsCA12rM+LfwVFcSRHqChJ6KnclGDT4UUiVrz8+YABfSzs3N0LEZT3G8x6VWAsuKm
         uvTEPXZsk+j+9KwRukndF8SWzP5Tj5nW8CHdW8HaMONXf1hd0o44YTKGK2L8iUDd2RBO
         gbYMwrHTd0i02ZAywDaKk66xemat5ZLIIdfqokrBjw189n/Qt0mme4sHAzjBA+8xtR+e
         IaPwvdJTWWbLvK4B99JDde1ghj0RcttrmOShdPlUKik4g21ow48tA/632aWDAkDdgO2I
         DQB0s96aiOsx/unfLAOo3/IcbBVbwcbcVd/IOhroQ0gKXx/hwSYr/3oxSdWiiFf0uGsN
         3s6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GJyWhsj4;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af8a2aa5696sor5058535a12.7.2025.03.24.21.59.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GJyWhsj4;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878786; x=1743483586; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMLogjQnjMTWhIeJ1ZbndYnRq86dbBuVmVnxwVyz8FM=;
        b=GJyWhsj49NmzUrT1wdJdiL37VhyrtuODz7hue2Nw4SMRCYWtSUAbQ+9rnUBEy6VcX+
         q6UYDOTjeiYzsy8Oycj/dwL2QHHV7cv3W6zVbz6PD7q4zSznYhCrIzLTHBzAMeE+N+zc
         y0B7l59Mf7p7ncqWprXPUJSAH6Wp8GlolHE2HZeLCDcoa0ZikZAQUy5JBsSQEPPFF38r
         v4f67xqA3NSHeDzPVZYxltUrbq4HexWqo7SZBEBKQw0U7MoqavFeGkGohn4bASZAmu1q
         HBQFa568dsmgukryDRSehs1P2zDLNrumlzoQyC7TpbPGVN/tWp8fnPfXP54gEjNkE7LW
         MaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878786; x=1743483586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oMLogjQnjMTWhIeJ1ZbndYnRq86dbBuVmVnxwVyz8FM=;
        b=vB7JPvIIc1vlqWQhubn9md+RbpqqX/M7OhYvm08xL3jjPu5bfIuQ0566BNSqIlPJZ5
         vSqiOWLHcLLJQ++mqVJhxA3wL351NXJNDIgrd8oq4yRGlflqwcx19nclTY8m8DiePVQ5
         2zSQfjCjgjFdPie460Tt1FzbeaC8kpimQHfR7jupGljAIE8UzT1MzI7umEBTGLuc3sRa
         vnSfUGXdeoU69vNibTgdSi/DAKZPPnexTAEKNV2AtJTbobL98E2Qima5vKtSrkG/aDFt
         QnOJgNup0BOoxrT1ySPBCht3vhT+nsz/6xhkUvNj+/gM6xR5NZvqR+fQ6R81+fzJqLKA
         f/rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLhlwqjIIkJsl4EUfBR6CljaYagO2KnaqStavbzbxQ+RO+DGR09G0zalXJ1Q/Rt7S2UNcOGV3Tv17Eyg==@linaro.org
X-Gm-Message-State: AOJu0YzYzZNBGmLOLGwAL1b6rI0zxU+wYq8PeKBDkZIUalQptiwkgKx2
	my8Enlq3U4YUZM0ogoTwbKyK4p7zFdz8lb8C2sGY7iKJ/3a3uulfN3sb4dFSwmNEVg==
X-Gm-Gg: ASbGncv9Ts8EfoefSAx+6a92g6Py9CxT6Y0Sb8RgSfvYfH5HaVhU9CmndKbmA4o6Csf
	BlOSwheaxcGJnRDn07HjBHGDPPEu+zEb0sP6SVJ7RSqiz/ec/7oCoRs9LUoORjZ/XopfX7zU4jY
	eLlmZPuPAxzuJysfHhXyjns2MpFUT9Kfy4XwP6IQWKFKPE0n8lOtOlvMOZ5nEXT2+q6qC1KiRqu
	tGLc/piZC0BqhhAyjlSB3SkNEpikB4R8ZaWOboZ+I18+z1FohOo2gGmqJuLo1ti4p/OlUv6uDNy
	g4XtnTg12+LfpQ/ngrU0BLy78Xe8YDH0SIPu/kIj40Bz
X-Google-Smtp-Source: AGHT+IG977/lluj6yGR5rtQmZPGYD//iaXHpiRPYTxrl/P6YCxp2pH/gKGqlEoMf8j4GBUIV0AflTA==
X-Received: by 2002:a17:90b:2647:b0:2fe:8902:9ecd with SMTP id 98e67ed59e1d1-3030fe7223bmr23232830a91.1.1742878786330;
        Mon, 24 Mar 2025 21:59:46 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:45 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 26/29] hw/arm/digic_boards: prepare compilation unit to be common
Date: Mon, 24 Mar 2025 21:59:11 -0700
Message-Id: <20250325045915.994760-27-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ZTJDoJtbA5F+

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/digic_boards.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index 2492fafeb85..466b8b84c0e 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -80,7 +80,7 @@ static void digic4_board_init(MachineState *machine, DigicBoard *board)
 static void digic_load_rom(DigicState *s, hwaddr addr,
                            hwaddr max_size, const char *filename)
 {
-    target_long rom_size;
+    ssize_t rom_size;
 
     if (qtest_enabled()) {
         /* qtest runs no code so don't attempt a ROM load which
-- 
2.39.5
