Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1258650ejs;
        Wed, 10 Jan 2024 11:53:55 -0800 (PST)
X-Received: by 2002:a05:600c:3b1a:b0:40e:4398:264a with SMTP id m26-20020a05600c3b1a00b0040e4398264amr896615wms.23.1704916435096;
        Wed, 10 Jan 2024 11:53:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704916435; cv=none;
        d=google.com; s=arc-20160816;
        b=foaSiNUQzsoxFF6O1STl3k6QWNeAo80HWac2rAD8SdzgqqtSJXqEc/h8QpgrlhNyLV
         XF00WssJC+m20jsC5B6yTbTeF5u6RDQZybsp5V/iO0rv1fzr69ErN1MRFe0N6MmGUrtK
         2oAYq+aMGcTw+9mLPo5/YEPLq3kKYFF0FG77T0d9+1ynNVradmLGEbJp9P+BfH/btaFw
         9VT7VuxoV83MXkKEsupD6dWFJRCMGzEv69tJEYxjNASHC9rECC+aA3LWGOMVMwBcgE1K
         XevJIYQg5qQAYVehVaa6AG8wlYKD2QOK4sh4CYTuMO/1eNwDYH3IoXkhWJelX+nuFfvP
         i+pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=znfL4d0kUd7PQLWgd/IbU4xVCADxWCmjPBLUUJRZlJU=;
        fh=0Bn9ysFO5uhdOoEvdDNDnkwY7yFMuDt2XLw3k0zcWt8=;
        b=BLgTDb11mMwbprw9fp9g6HmpIJuwe+YGPCMrINY5CKS7+IDR14qyssHZMyfhPcZPgP
         ax8BnVpm7gGpiZGjhyhEbSLw9BnFU9z2IJr7JHXiNKvrEby3S2iHLVBGQb/rOfVuPid8
         8vhEedOtub7yiZfgjrR01+id3EWjyeOFnIUuLL0eCbZ6FIwDUc738P4lzs5VoDuuBGC1
         6rC51u3hzC6tDhwG9euFf19kjMH7uq4fE/HwCp3lheaoPdvZYTeHXF04rsKZlFYna9Qz
         mnJMsPO4/Rbxjbk0lRPmNoyvxbTp+irGtV+8wwTsRgzWEoWC2kiwEBDRCFwlfpwR7bft
         LI2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ohEKyEL4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u14-20020a7bcb0e000000b0040e47d792ccsor525836wmj.7.2024.01.10.11.53.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jan 2024 11:53:55 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ohEKyEL4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704916434; x=1705521234; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znfL4d0kUd7PQLWgd/IbU4xVCADxWCmjPBLUUJRZlJU=;
        b=ohEKyEL4uSKJyEBIkaG8ULYj34qHoRmA0g8RGD4aLjfgom9+z6/8L9l833ZYFBpcL3
         mGjKLoFY03ZiY6qezDIb+mqFLvQeunZptw80d+OgCOIyXAFjXGzLSuVDzMk5uOnLnUjA
         /B9r8E8Me1DezsPOZfbvUpxv8J8Wf5855irMT5b9Yx7ChAdOEjWwG76HrGrMIEx4AyPS
         YDuIKFoFKcNVTrAeOzsZGfGCV6Zf7bmOqSTNfzejQJdDIt6c6JbmNvuolc2PNHw2DWUt
         ATKEiJ9jy4I+5neRH+hw8VxFMLVZN5v5By35rXvrf5RbNNjphP6TUtIM8bxtsPm+OZS7
         3/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704916434; x=1705521234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=znfL4d0kUd7PQLWgd/IbU4xVCADxWCmjPBLUUJRZlJU=;
        b=GGo6T6uWPu3aoSZ9wcZnoGaL9vDl04MmjUCxmLnZjGQ4C+25G39SEGXebFCjL542TW
         gmRjJ3e8DA+X/vhqhdixdlI5Ok6q6+u1cKsFNbnA+z5ntCNgCJE7Fzay6P76yqspNyN+
         BUhnaTs76veksZk+2KtoVMvDfkQNGMRO3mENkBH2yP3KBY30zki2vmW4lcYIwDWSDLvC
         JB4KMsD7wsqKmi/8lfDRVBRKdaCAUuFu28MPbTPGcsz/FcImxDleyDcwrVsloKJp8kWI
         VUIcHRIzuyxCw47OAjQ2UWvL72zISDtQ4CGzr3zhMSQUGhHvtP4o7iQRt8JUJzl2IiQO
         ZiVQ==
X-Gm-Message-State: AOJu0Ywmd1js+L68jMSOz/c8zIfOWtx2Q3HB30v/CoVoM6Z1WgD6BV/x
	v4K/aKD/2scGeh6YQAB5UaUrPEIMcPA2FR/gEvkxdrvKNz0/zA==
X-Google-Smtp-Source: AGHT+IEwhsl63YMeMHDE72bK7yDwI/VR1JUfr9Ys0DT8f1XK7IAeXYfMYjPWX4eyCLA2pAjZhuLKiA==
X-Received: by 2002:a1c:770b:0:b0:40e:4a5d:67df with SMTP id t11-20020a1c770b000000b0040e4a5d67dfmr856723wmi.4.1704916434808;
        Wed, 10 Jan 2024 11:53:54 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr. [176.184.43.236])
        by smtp.gmail.com with ESMTPSA id s15-20020a5d424f000000b0033743c2d17dsm5594643wrr.28.2024.01.10.11.53.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 10 Jan 2024 11:53:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-arm@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 03/14] hw/arm/armv7m: Move code setting 'start-powered-off' property around
Date: Wed, 10 Jan 2024 20:53:17 +0100
Message-ID: <20240110195329.3995-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240110195329.3995-1-philmd@linaro.org>
References: <20240110195329.3995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +yRb+JQW990t

Reorganize a bit by first setting properties which are not
dependent of CPU features (and can not fail).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/armv7m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 8900730e53..b752049add 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -308,6 +308,7 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
 
     object_property_set_link(OBJECT(s->cpu), "memory", OBJECT(&s->container),
                              &error_abort);
+    qdev_prop_set_bit(cpudev, "start-powered-off", s->start_powered_off);
     if (object_property_find(OBJECT(s->cpu), "idau")) {
         object_property_set_link(OBJECT(s->cpu), "idau", s->idau,
                                  &error_abort);
@@ -334,7 +335,6 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
             return;
         }
     }
-    qdev_prop_set_bit(DEVICE(s->cpu), "start-powered-off", s->start_powered_off);
 
     /*
      * Real M-profile hardware can be configured with a different number of
-- 
2.41.0
