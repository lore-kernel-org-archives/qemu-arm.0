Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp616831njc;
        Fri, 19 Jul 2024 11:10:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2zyXOUxlKa5ze9jQctw1Q27z3whwjuFhhdL7d0ftESRjoymPrVZOTD4d0zgARzT8GkhEI/sqnnAz4Ph/+/Z2H56TPjzSK
X-Received: by 2002:adf:f6c8:0:b0:367:95e8:3aef with SMTP id ffacd0b85a97d-3683175bbfcmr5639626f8f.42.1721412657649;
        Fri, 19 Jul 2024 11:10:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721412657; cv=none;
        d=google.com; s=arc-20160816;
        b=kDjuAMyhe8I9xi1BRNKJ2sS/5HZ2vOKIdVf+ES0Cxo44FTuZK91Ig62tGNHiK0XqOb
         2MDEOoRu4Zl0qL4AhZeR+135ka1ovyk/wI0vvhu6VqIcMz9hZZTpZ3vtDYxp4/tvUBxV
         +BkJ4xs23hLdO1s706H4TiqFbzYSEO4eiZkdknS64mSL60KQkykJ5z3hBJGlRSn4LY/a
         gY7dZXJ1EolEDeL2dRoWjww571374aD5JrDyXsdhVtnJ24es9h9aQIGNrb0K707J0kMP
         QhnsskUwHOZsaP1bStVKuIC0PhgYr3jq5aGuM2z68ewq+17dTbsBkejZCNsR97cULMX5
         JWVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=q1/EHJXKlUMSicfL7BY9ywX9D2Y7SpR4mdCel9zTlhc=;
        fh=jL5ldNLEz/zD2QTGDPQ8wDF/k71PgoV44dd8NPlwQsI=;
        b=izVjgzn21mqpIhx95UBIIPRlCf/C0tM9cgkqL17KXbGg0eUA2doiPnRRom7SxFxr0r
         zPnfeeuLlfd0G6fGjAVr7QbOYlce9xoUg3ncuAJrkWnjn3+gtdXs+ULI9IQNSzjmUZuz
         1JKG7NYyNfU4mQEnaCLlT3h2tZ81UJ245NYFK/F1I2UnchjRu5ioTdeGQkDwmpTJMcpH
         OUyIs0t8WaYsZ7Uxb9AqDZG1wpaMp/agKkImzPuS6xhOeMsbO0sCrtouLGp0v+f77Htb
         T+lwZCmlaNPsSbsuhgjqZFOV7mFYiiRJSiv8h1DqAHYkHseJd8JrU2o3RpfUcSOfxcI6
         08gg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ne3zRQph;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3687886316fsor604020f8f.7.2024.07.19.11.10.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jul 2024 11:10:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ne3zRQph;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721412657; x=1722017457; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1/EHJXKlUMSicfL7BY9ywX9D2Y7SpR4mdCel9zTlhc=;
        b=Ne3zRQph/VswUxJWbDYI3aS6UzbomgaHGJL5uzR1A8MBmRJxrk30bJ9zq2AmEKynUv
         c3GbFp5xALDaKiUyDzdPKZHGLQN6kunvf0JHj/z/iRjwQMeahSpJxkjGhQSWofnZj9+y
         thdAN0lXA7XOEIqksbODMnskoNlBuKQ++YTDEyQSqVwhAGSj+UYZZyAx0duaBggYjsT2
         wmQ6Md88Ll+3oygpv0MJLzFBC3uaMVrRmxz7bqSLJrOJiIlvMUaisPjVx+A3Y+nFo9yM
         cLsj9vIHxNEmQ85YDwO9hoa/3shMkt82bhlYp6vjCDc/oRRgpp9MhjRWPP5qYNjbfYAD
         xasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721412657; x=1722017457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1/EHJXKlUMSicfL7BY9ywX9D2Y7SpR4mdCel9zTlhc=;
        b=MyhsFIEco1zGBRjna/LaTekwq0b4YchjYnHJu+gsZ9yZ1X5ulV0zSKAQVcDrDAASph
         iIZTZJiw3yNNuj+m4ihPL/sVo0kmcp0R/MOuuDwz7Mc1P2I2vas2B9IPJC5jLogId161
         gABXGNLq4EqYGZjMQ859oPaVcMWH6LwLyyYHmEyjVt+kt5nLCg+n9vueks4eu2viQ1Ms
         0n/OKMtnMxy6NwU2aELoG6ap+C+zgxABKfRnkhky+ommiwtDyoQC0yYFRsmv6JBrCjgW
         1Gyq8viH/jX3tNXeXIE0Xvjg9gettu+jL9WDlBKToU7c4yJ4u8Fc99E8ino3U/KgcZuz
         cYlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNxSiz+VgQ+K+3qVeZ8vQK8MYULvMaxjq8v0vwVgYlhqJZucY9onBXsBBD1iDLxz7UxlFHXAh8+HUt1UyhRZf9J6Aa1jyT
X-Gm-Message-State: AOJu0YwJKYfW6fG7snFQqdsBioi5DiS8z+LNaEOhgxHOttMHbj6+Dtm/
	DNIn4wd/qQBj6Kp2kj9wJxzhz9Ds4V+hR/PbuvQhkUgHk5172SZamwi9DKlsfSyyMg==
X-Google-Smtp-Source: AGHT+IHU/u6YJi7xFP2CXTlMYwlMrPXaJ2sZ+VYd7hMLWoS0b2ILTUd8zWUwWmYXUVLaC3BIp/l84w==
X-Received: by 2002:adf:fa03:0:b0:367:8876:68e6 with SMTP id ffacd0b85a97d-3683175b8aamr6577658f8f.48.1721412657188;
        Fri, 19 Jul 2024 11:10:57 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (52.170.88.92.rev.sfr.net. [92.88.170.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36878684801sm2258633f8f.11.2024.07.19.11.10.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jul 2024 11:10:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Tong Ho <tong.ho@amd.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 02/16] hw/char/pl011: Remove unused 'readbuff' field
Date: Fri, 19 Jul 2024 20:10:27 +0200
Message-ID: <20240719181041.49545-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240719181041.49545-1-philmd@linaro.org>
References: <20240719181041.49545-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NoeOGofiUXb1

Since its introduction in commit cdbdb648b7 ("ARM Versatile
Platform Baseboard emulation.") PL011State::readbuff as never
been used. Remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/char/pl011.h | 1 -
 hw/char/pl011.c         | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index d853802132..4fcaf3d7d3 100644
--- a/include/hw/char/pl011.h
+++ b/include/hw/char/pl011.h
@@ -32,7 +32,6 @@ struct PL011State {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
-    uint32_t readbuff;
     uint32_t flags;
     uint32_t lcr;
     uint32_t rsr;
diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index f8078aa216..260f5fc0bc 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -549,7 +549,7 @@ static const VMStateDescription vmstate_pl011 = {
     .minimum_version_id = 2,
     .post_load = pl011_post_load,
     .fields = (const VMStateField[]) {
-        VMSTATE_UINT32(readbuff, PL011State),
+        VMSTATE_UNUSED(sizeof(uint32_t)),
         VMSTATE_UINT32(flags, PL011State),
         VMSTATE_UINT32(lcr, PL011State),
         VMSTATE_UINT32(rsr, PL011State),
-- 
2.41.0
