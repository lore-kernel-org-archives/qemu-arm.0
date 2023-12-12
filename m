Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1027556ejo;
        Tue, 12 Dec 2023 08:33:38 -0800 (PST)
X-Received: by 2002:a7b:ce88:0:b0:40b:5e1f:6fd6 with SMTP id q8-20020a7bce88000000b0040b5e1f6fd6mr3139832wmj.43.1702398818109;
        Tue, 12 Dec 2023 08:33:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398818; cv=none;
        d=google.com; s=arc-20160816;
        b=walNS05VwF+T+EpfG/51DfYh7yZY60r+Yahh4VClW9XDLCbFdlCpfej7hxTGs7fDTO
         BW/gqdMEfvKIV+LnPSh2EGLV5l/jl8SUM87z45hbuc0SPWxC/8NZbuM6HsQqPPbkWkFb
         umupG1YNhc3IWVcWpWd1vCQuaN88RSuoyrjdEJx23JwIDyEiiEKDXJMgg1fhxAAES5iQ
         MWGwRl4fBEtCDd1DhIJ/2GR3DHPkULi6e0XXeyqoFlcc4nMJatVyczEa+W9KnoUl3u17
         jKmCr7qOieSdu5k+c6FIicP+mdMe+QAoj74Pume/sR+ZKtZ6H2F9VzoJ2LHOnoSIJhiu
         ZJ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=StICgPk89ZsN/BIJTPTbcQmjR7zrsjp+vJLVxNH++7g=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=YkLWVJ/RDemAjWF2QvM7mHMWKRUyFRNg8wlWFpXf5217IjeVsYq4HfXYWD7uCzKCYO
         YzemMlOh32TEu/0Fdl7WqKPE+zuN0q6daWPR0xgN9mjMn/wy7pj8He4T1Jr0bsO9npcQ
         61EeU024K4xIyN1JKgiNEvSQHH2ZyuTOXwAq4DKCgKlKBSW9PRV0aDgYCK3TnKyEWSvd
         1ATk2Bx4XW7rHMXjWcUcU0qTIuc6J7ZlKAvynnjUbR5ga1fZfgiSFOhZ5aaWYANt3Emm
         gVfWiWLQ5N5CRmFe0t1YlxCnl5QqBuKZnAHPJcS8epxSg9jIXv6RQqTh3xPQtF+ucPCp
         a/Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Poi975Qu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p6-20020a05600c418600b0040b3da91cb1sor3421256wmh.4.2023.12.12.08.33.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:33:38 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Poi975Qu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398817; x=1703003617; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StICgPk89ZsN/BIJTPTbcQmjR7zrsjp+vJLVxNH++7g=;
        b=Poi975QuQzH7JZE3Z16pyio/ZCtla0y/UYqwZAO6CQCSqsKCxyeFNL/nfmZopuCfZ4
         9U9lSWF9qe91DR181JTPcsaPZrf1uBahDgivskl2vtOdfe5Gz2mabGrA4LUh/vUp3FfJ
         dOEYfeykhiskkTuEXWc4DyNQFW22FsiT9pUQWWG1C4TYU75pDxIH5AGRDX7qexOVI165
         i1T1eZUsX0tcQe624J1hg7y0BH/4kw0Xdet7VD0J7ZSej/tz59Gm3Vf6/zqF9HZoqI07
         pGoUVfzzUNbjieBc4LytDxpTOOb6JecJXgYF/+jMyONsrrS8XIpndggyXMRXR4iPhnt/
         +zPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398817; x=1703003617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StICgPk89ZsN/BIJTPTbcQmjR7zrsjp+vJLVxNH++7g=;
        b=njnLzfCTbgmZAtVlgIPMN91q4qO5k6K19Kq0qXm+FkXXr1GlkeT2SJ6LU364/Yyj12
         U3tfw1yrPG73kkMCm5UPsgMkJ5nlJqQ5KxQ4zXa+v7OOGAZwYCGbM9ITYOGh3+FAY6DD
         UcBFvTg8odUZqz7smVoSFj7Hu6hR4Pozo7HIPspi363LwdiI7artullzcUokn8bLSqCO
         a31I5EtdTcwuxxMhkVZwZWU/7ObWeay/NARY6iDkVytVrj+Cq0fOrl+prP37BqsbSXe9
         AVxoXvdv/LE+aJz93HR4tdyW+HUzUIVcIyKIgsZU1TnLQ/iJn1+fBQjqWlOULkeh9/uz
         JWvA==
X-Gm-Message-State: AOJu0YxNbgyEsknHAzzWnGzUyEQl1nAz3Dufe0ECppymB4ys4NqAK8L1
	nKsxGhIO4EwmDd5AkiVWTqnlu7Wv
X-Google-Smtp-Source: AGHT+IGNeT48Kv5OY7QRvbn24oJVr916PbbHQ2SV3jm9NH3Q/RLi/FYkalHEG/RHROS8tb+CgG07PQ==
X-Received: by 2002:a05:600c:2146:b0:40c:2b26:970f with SMTP id v6-20020a05600c214600b0040c2b26970fmr3255515wml.198.1702398817653;
        Tue, 12 Dec 2023 08:33:37 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id v13-20020a5d590d000000b003363469490asm1384996wrd.111.2023.12.12.08.33.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:33:37 -0800 (PST)
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
Subject: [PATCH 33/33] hw/cpu/arm: Remove use of qemu_get_cpu() in A7/A15 realize()
Date: Tue, 12 Dec 2023 17:29:33 +0100
Message-ID: <20231212162935.42910-34-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: u6HrIi5xLkhy

Previous commits (in particular "Create CPUs once in MPCore parent")
allowed creating the MPCore private container vCPUs within the
container. We don't need to call qemu_get_cpu(), which is unsafe in
hegerogeneous context.
Directly access the CortexMPPrivState::cpu array.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/cpu/a15mpcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index 5f28a97adb..8dccf15103 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -44,7 +44,7 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
      * appropriate GIC PPI inputs
      */
     for (i = 0; i < c->num_cores; i++) {
-        DeviceState *cpudev = DEVICE(qemu_get_cpu(i));
+        DeviceState *cpudev = DEVICE(c->cpu[i]);
         int ppibase = c->gic_spi_num - 32 + i * 32;
         int irq;
         /* Mapping from the output timer irq lines from the CPU to the
-- 
2.41.0
