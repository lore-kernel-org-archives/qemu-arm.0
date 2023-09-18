Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp2803368ejb;
        Mon, 18 Sep 2023 03:17:41 -0700 (PDT)
X-Received: by 2002:a05:6512:3113:b0:500:86b4:5282 with SMTP id n19-20020a056512311300b0050086b45282mr6835790lfb.34.1695032260998;
        Mon, 18 Sep 2023 03:17:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695032260; cv=none;
        d=google.com; s=arc-20160816;
        b=PMk9MfuaM9aT3gr8U0Vky4mlLviGu8kjQyGHulWmpyiPYhFSEWyKRPmB3iH5mDcgih
         1VQrf1/njI+JoNvgU/db0BLwCc3JR+1whaPcce8iTWTsa5GQRew5C8kGVKsnQPzpd7Br
         CfIBaCcXx4/68u0cPUBXmJWCMVmbqdvZeSHgDZMtDKLva21ZEtpeJkqKdVaGBljTovuF
         UDTQndyykcj6W+P/ipH/mpAXaNRd9M7Hl4cvgOGk4HpkzBYgqPIrUumBWdvkrYlVSAuK
         8NR3SYeQoyJgPW2UALWbBkUlB22oV+Vj9sKv0qgaHCaxdPx/vyUFGG/OoTKiQTVVD30/
         KgBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=OeLfLl3LjSe+flyYRXHJoPyc020uZocilUJMKnQncFo=;
        fh=9n/Cm2KnMX6Qk7SoVbKt4LcEa/gSBuZo6NwnCSpbrp4=;
        b=YpX6fAX59igRU86V/b8hjs5PvYGF5qcx9TUJsjsgculUFynqMStSmwxk5DQcx5rNzP
         5FT3oaxjL/B4SyLHONBkmQFjBrYd57j339HELshP+hReICfmFaBJ8VE0IvvMZ84YXYPt
         o3GYNVW/tRWZCp7oFzlS6bLGGLWfCxxEhcyX5tZyK5aS1deI/8ns7j2iCn03h5VKmoPT
         +WsjOwOCmREqcXQ4TVQmYSV6OftXRyObJheH6WgaNokrojtBi6RwdN50SBoKpKkqE8yh
         w41bqRAGNO2zp54Ais62SyH1NeVrcrAmjJ9P87ND03HTQAd32u91sgcKyj++B1cmM0VY
         L6nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r1+ARmZW;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x7-20020a1c7c07000000b003fee7034286sor3331229wmc.4.2023.09.18.03.17.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 03:17:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r1+ARmZW;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695032260; x=1695637060; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OeLfLl3LjSe+flyYRXHJoPyc020uZocilUJMKnQncFo=;
        b=r1+ARmZWBk9CtvD/ozWm6VaZAY4P5KaLGXZCpM1sPNcfp4Gj2sJrI3iwPEX069cAH6
         wjNOhY72VqDAFOR15Dp75Uj5bYcNvR6Y/KW6iPM7mc19ZxHCDBp3E2BAttF9e6PCPTLq
         1nuX4JKbEB/zJlvRrDQe0dMWApRuJ8btBK/6wAqMCdjlJd1IcCIT4R92+HdjzbkOAOzw
         xi3ZgqagkkO1RlND5P8fBDzWLpi2U6Ft5Io8T35HcDO/qQBhZi8GLS0XImI62/lrQPh/
         kYd5uNSvsUIcWVVJIhQc5ytKzToyEWz7TKmmVqfsWcaeCfhWcUxaQWXwZoHcEdpj/RpA
         JUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695032260; x=1695637060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeLfLl3LjSe+flyYRXHJoPyc020uZocilUJMKnQncFo=;
        b=lMJ+p4lqB+3BgHvaK4jNkm2YXMubd4zRti9vEPlnIu2C9CkAm5mR0JprxxSDOJT5mt
         xpW0/yKMiNXEYW7DjM8Xz42mBAVQsX2bnNmKOZQ+2O9FuqaweDLs9L3pQu/hhNCg9I4Q
         QxOD973op14HOdhOWzUQyfG8creqhnclEsa7xEK4Wcm7gusJD6gi53gHiDQLjOYevZ5H
         hgTySPN4cud7RPFa4S7po1RMSePrsEwUDdpc1LTwQB8yHTaocAYaltxa1fLbHTCHcq6h
         +k78VLTyWSgA2jLVMEwzsS6g58AfUPpyn8OClEHecOppxUZ+Iu3vD7qp03pElZ/EZ7bX
         /6+w==
X-Gm-Message-State: AOJu0Yy9G8yxmGKZx3EJCCqU6FBRKU6JQFWdEw4ILCID+g6NVcVmx8BP
	IH5Gph3C5VuFvYe963lRTKU/ugNE
X-Google-Smtp-Source: AGHT+IGSfBDs6j3tcZ4qajKD3qps7Ks4L8/CdtFxIGHeMqsgIaLpNZuM6XwokMcGIrinRdTBIBL70Q==
X-Received: by 2002:a7b:c84e:0:b0:401:7d3b:ccaf with SMTP id c14-20020a7bc84e000000b004017d3bccafmr6649664wml.4.1695032260467;
        Mon, 18 Sep 2023 03:17:40 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (5.red-88-29-175.dynamicip.rima-tde.net. [88.29.175.5])
        by smtp.gmail.com with ESMTPSA id y19-20020a05600c20d300b003feeb082a9fsm11960178wmm.3.2023.09.18.03.17.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 03:17:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alistair Francis <alistair@alistair23.me>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anton Johansson <anjo@rev.ng>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Bernhard Beschow <shentey@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alessandro Di Federico <ale@rev.ng>,
	qemu-arm@nongnu.org,
	Luc Michel <luc@lmichel.fr>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] qdev: Ensure devices are fully realized when calling DeviceReset handler
Date: Mon, 18 Sep 2023 12:17:34 +0200
Message-ID: <20230918101736.23905-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: B+qR0fTBd4Pt

In the process of clarifying QOM/QDev design, we want to enforce
the QDev state machine, in particular RESET can only happens *after*
REALIZE.

Besides CPUs (which are still particular), the only case I noticed
is in a non-QDev type (OMAP MMC) accessing a QDev one (SD/MMC card).

The first patch first handle the OMAP MMC case doing minor surgery
(passing a 'realized' state to omap_mmc_reset(), the function doing
reset out of normal QDev RESET tree propagation).

The second patch add an assertion in QDev core code, in order to
avoid further devices being added out of (QDev) order.

Please review,

Phil.

Philippe Mathieu-Daudé (2):
  hw/sd/omap_mmc: Do not reset SDCard until being fully realized
  qdev: Ensure devices are fully realized when calling DeviceReset
    handler

 include/hw/arm/omap.h |  2 +-
 hw/arm/omap1.c        |  2 +-
 hw/arm/omap2.c        |  2 +-
 hw/core/qdev.c        |  3 +++
 hw/sd/omap_mmc.c      | 21 ++++++++++++---------
 5 files changed, 18 insertions(+), 12 deletions(-)

-- 
2.41.0
