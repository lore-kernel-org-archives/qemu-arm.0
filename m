Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2472213njb;
        Mon, 3 Feb 2025 16:22:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV1h+uXCPg9PLFH/3wP5wvgFnKsCOae8FrE55dLOcXNpOLKDv9BUTD9ZE54zN99vkz1m63X+SGGOcUIcA==@linaro.org
X-Received: by 2002:a5d:64c4:0:b0:38a:615c:8223 with SMTP id ffacd0b85a97d-38c51931023mr20240601f8f.10.1738628569616;
        Mon, 03 Feb 2025 16:22:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738628569; cv=none;
        d=google.com; s=arc-20240605;
        b=bdAG9XIK6oANjpJgNrfUH2v140ZoyXX2aQuyfroDTXkFK8IDu1YiRExQWUD7DWt60z
         53oWbxyERhI/5cdQs3jpkxQh5syWgtnrAx9NyqXn/uz4Nux4qETi01JUUDv/d2JWL80m
         OfDqJFqtTOAhL3qEdjkq7YMUI85dBnDaPdI6wBuXzj4w/K2khv66hknuSJkgj/CTCA5I
         I4/FHTW4vsHML0y1oeEwCjNE46se7uSJ+3RQu6Ke8oYNk16Vm/ahJnvqdx2LCS49hXG5
         zfma4YdjyLoz1Y4RZm3ln+JN9M2jfg5auJ/G3KAS1Dy9TDw4UKyXGaRdZKcnkBJ41IQU
         z0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Az8EPLdbpaM4rrJ7UfHg0zKoQFfHGEeaDufKhZSFa9M=;
        fh=4bgEOIixLksD0ZIzyVwMAXT1TeaBKbIhpYvI4JSg3s4=;
        b=GbV5wjX/jncRnOI1Zwi3mILjKglSZ1VML2Y7YA2fDtQOZDVlkDGqGCUD+7mWiaeE8/
         TR/caqPc/zqqMXCyNWwh/kL3X0+WqYgKVVIEy6z9RXlbGa9tcUQIHXofsUe1KRHRV3Qg
         3TSdrJK8uc3cMK8zYMCVIGiaz0pwWT+kChZTGU+LYPXqxOmUtKsqkFjeGc4KGdxdm6a8
         vjcJf5ym0cJ/PWKpyyAOweLGSBLKcVpZYpIP1/WLmFb/yaXPjzNc1jEm9nLnKxo+B4+w
         61uIiS3AvFf36KxoindH+7+xg9KHx0qdIcvHQ8oykj3I5ckdgFTu5qFI0tQbgaByZKcv
         l+6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SIuzDXxz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c1f1aa9sor3482110f8f.8.2025.02.03.16.22.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Feb 2025 16:22:49 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SIuzDXxz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738628569; x=1739233369; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Az8EPLdbpaM4rrJ7UfHg0zKoQFfHGEeaDufKhZSFa9M=;
        b=SIuzDXxzNqxY62UoLsOQnLDS1H5ar3zugwROq4mODFWc+2MfJZcFixtJi3cJuTenRG
         mkTdsVbUX0WVa5pja1PgNZcqEt6szE+lCl8avcxX2k//u7uS6tFmY6W+Rpp7SnnyNBfa
         iVsjFsMeuNQWYAlzZwUAxu8czhg90OLSouBYkj0A/zHNoi3WEBEAAENW66L+FRAng9mh
         XUwuaJHdd2zPdWnJrrDZbmoEotQX4Xj9Jyh0Io8pX5ElZgT8+sXw8CfhE1lUr5ZSclKk
         H+/pWK/qhWpmKytV8udsSBhbBkE3L4E6PfTTUDSheNFsGOuduuOW5hHt1p8r/QbmGVyZ
         mBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738628569; x=1739233369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Az8EPLdbpaM4rrJ7UfHg0zKoQFfHGEeaDufKhZSFa9M=;
        b=QmrucYcuhLmSBkCkQuoS2rmSvR7FflkNQc54i12QB1x7HLTIfzXvMdEfi6SIDP5FiV
         0X1JHt8dTssl/I6gbQXB8k325jAgfY8itACGhWYik2kLn6T1Mkan9SuxLymaGWscTmMe
         UdPQ+6F5U0MR813ss0PEw276cPKwjICVEDCpRkRSG2hI2SUa5cX51u0VpUalgzmK36nQ
         xZ1B6LJ3kiW2nX+3HdC7Qkwbz9YVF52oy33inn2r7k/qsjY1RmFuvnOoXlDwFFha5Y0U
         20JZemyEBu5a8meFSwD3xtiaYHMm2KyMH8EREHGpmEvj3SHT3lHLXFveViXPJRiKW+eI
         NOJA==
X-Forwarded-Encrypted: i=1; AJvYcCUqoZqzGUMrcpiF8rPMeoslJc+7mR3CrGY4d7Xwr0UZdhBNvcSAWnnQmSrm0fjWYbTUrjI5wvfso1M3Fw==@linaro.org
X-Gm-Message-State: AOJu0YyfjsVWcvTzO065PsMSCOd1GdwbgspcuxLkuihwDR5ym2NZ+kIi
	MydiIau8zX1TE3AMyo81SJbuS68zi5XJVIpB9XJEW7mk05kRwuaC2Y3inqQmVA9+5w==
X-Gm-Gg: ASbGncvkOLFi+yE8H6IVrjqeqJiHDLg4kvhVwqQsMWiMIyFlrS0BB3p18ppv6/a2A6m
	Qv1aGbTW/haLsdl4t0EP4o1It8fFyJP0O2fMa24byt0MkxBHIyYDbmB3JqQ7V4fnEPAYaZFgc6P
	Rx6XLhCfbqWALuXtYBp+zcTsZUI5VgOBvEkRKQXap0YjnuI3CYYPtVB6eylwKPMMZg7weOgg/Mw
	u3dXkQlPs7g4XJfRbqufOM5Pmv2kDUBg9RxlZ15kzP3KnCM1skxg5eCC1uV5J205voXJEGQDe6S
	XXYkaom91RTds1cHhMhUuu24RWT1P/EyCCMOTL2luwIpWGpbqxNMTvoTPAQEmunMZw==
X-Google-Smtp-Source: AGHT+IGehyswMqyU/BOxxk5EPd2/kVZgXrKnQ5/w12TJ2w9ENui2JG35mk6P9Jze2hMJ186vIP0Ceg==
X-Received: by 2002:a05:6000:18af:b0:385:e30a:e0f7 with SMTP id ffacd0b85a97d-38c5195e81dmr18362724f8f.22.1738628569093;
        Mon, 03 Feb 2025 16:22:49 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf2eesm13942861f8f.85.2025.02.03.16.22.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 03 Feb 2025 16:22:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jared Mauch <jared+home@puck.nether.net>,
	Fabiano Rosas <farosas@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	devel@lists.libvirt.org
Subject: [PATCH v2 01/12] hw/arm/raspi: Access SoC parent object using  BCM283X_BASE() macro
Date: Tue,  4 Feb 2025 01:22:29 +0100
Message-ID: <20250204002240.97830-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204002240.97830-1-philmd@linaro.org>
References: <20250204002240.97830-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kWexuifQi3D6

We shouldn't access a QOM parent object directly.
Use the appropriate type-cast macro.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/raspi.c   | 2 +-
 hw/arm/raspi4b.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index a7a662f40db..508f90479e2 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -312,7 +312,7 @@ void raspi_machine_init(MachineState *machine)
 
     object_initialize_child(OBJECT(machine), "soc", soc,
                             board_soc_type(mc->board_rev));
-    raspi_base_machine_init(machine, &soc->parent_obj);
+    raspi_base_machine_init(machine, BCM283X_BASE(soc));
 }
 
 void raspi_machine_class_common_init(MachineClass *mc,
diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
index 1264e0d6eed..9b08a598f39 100644
--- a/hw/arm/raspi4b.c
+++ b/hw/arm/raspi4b.c
@@ -104,7 +104,7 @@ static void raspi4b_machine_init(MachineState *machine)
     object_initialize_child(OBJECT(machine), "soc", soc,
                             board_soc_type(mc->board_rev));
 
-    raspi_base_machine_init(machine, &soc->parent_obj);
+    raspi_base_machine_init(machine, BCM283X_BASE(soc));
 }
 
 static void raspi4b_machine_class_init(ObjectClass *oc, void *data)
-- 
2.47.1
