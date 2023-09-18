Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp2803466ejb;
        Mon, 18 Sep 2023 03:17:56 -0700 (PDT)
X-Received: by 2002:a1c:791a:0:b0:402:f501:447c with SMTP id l26-20020a1c791a000000b00402f501447cmr7624556wme.0.1695032276142;
        Mon, 18 Sep 2023 03:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695032276; cv=none;
        d=google.com; s=arc-20160816;
        b=votnBwMmHOaGiSrRPvjetvrQ5rkBWH2KexkHL9O9AmFchn8RLcewSvLWTriYbDRU1t
         9ApCSp4hONm8ii4bAqklJKIyQYaWvarBum5Lc7bAtvap+bRA+pZhuFMhjkIg1fuWO35U
         H7zqL0L+1JN4qfucHVqnPb+6b/fVaZakTEPq3WP8SrIDn25qojyjfxzDX0I4b+rCYJZ/
         W0y5BP8mX5jmJxc1MZFAjzfxdno49GZvAPpgwgwwzOqJ2rLQDQPY6dEHLubWSdP3OQ2I
         GyeztLo3B7fpZ4XBhbwEFr+uTJ53V9x85ENxEs4uwSuqsnJaIjUB3ZS3pbjaITb+tkE7
         jD9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8I52HFJ7JIIVf6/kc1x9A3KkqjzDotpu4ox1BgoUxm4=;
        fh=9n/Cm2KnMX6Qk7SoVbKt4LcEa/gSBuZo6NwnCSpbrp4=;
        b=TdUTUAEdMS7qa8DZVbFFg0/Auhu/J8ZyVzUK4+2SA3IxS3oMUL1ycym9kpGGYF+kHP
         gilyot3BFfix7umYX8KpS5KFEB/gwhhAN36pz+BelhZ9lzr9/VZyqiJwdicw3dJ/9ldg
         0wAtmo0ipP1ulFbIMnM9wBRN3unGdK1LhW7zI4rE38fuNCL8NHl0uOPYK3oYhKB65A37
         asoY7HX5DcL58E2KWOGdK/Atu7E1CS4f4QqfYBS6kFndJRah0FZJKzSciGHllQB/Pf/o
         xR9R+IXJYJSXkJ3kXeupOaQNeT9TxjYYc3BG+n68lSP67yRbQNVKbDNSsLUy3DTK0KPj
         DnPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JyAiMdhY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gw8-20020a05600c850800b004050cd59172sor432077wmb.10.2023.09.18.03.17.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 03:17:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JyAiMdhY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695032276; x=1695637076; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8I52HFJ7JIIVf6/kc1x9A3KkqjzDotpu4ox1BgoUxm4=;
        b=JyAiMdhYEP1zQAFajKt87hvHmDVNJIH4krmYBqf9rnPoOd4woyWAfRS4tDZ/TLfTJJ
         HMIBiRXipa5egqNB4tpDekn9CMFJN3L86kUJoicSMrdb7sYhNshD5A+rDhdSFP8xEP39
         eDXJUHW1R6eFW9Jb2wGygUrIoJFFhxaC98XGxrXVJdclls5qiTQbV3NsOUHmlhgZgUeY
         QVXWBg7vrVSxSZDEnl/Pj9oL0RwCTt2ECopinWm4R2TfdRP3r5ia1PiQ14V+iDbKouoH
         x8AHi9A5GNUyEfHxhOYs95vs13d9+Dhe317/rhEat8bPJbSLnPsprZS5OKY91lyCCCPt
         pz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695032276; x=1695637076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8I52HFJ7JIIVf6/kc1x9A3KkqjzDotpu4ox1BgoUxm4=;
        b=fZOv/BymLbAtqCaIJTIXcw9espv9P115tV/vkoKUl9kVIJYMoXcIh6EX7LlleCOLTX
         zGSZ82QOumpDevmMijejn/CRbqQE5PMUrsGwK3/vedKNxg52iQLH3G8dwJiReguhnzlP
         g+ZciSpjdqYFLYgBn+bTkNhmR/ZaNg4WaTpM7VqdHpRL2jZtqNC+hA6SB4B67xTXybN0
         QWNIi0ZzJb3ztgqahXRDAz288yXDd4F0Ds785HWRBkDv/4P1xUK0N++/cVKoUxkXm8bw
         o9tzBQVHLsQERwe6CpKZbXr3+PEx1hRxtUZvB9KCg8dgJel73QNJXQRIk5ienGYF2FG5
         eK4w==
X-Gm-Message-State: AOJu0YzfqVhrWVE2ixza7oK4ePa8G39hxB8053xHTlzSLioZP3kDcYMG
	sLt6a+/bgvEE3koReuDfGbCVCtnO
X-Google-Smtp-Source: AGHT+IH7/y3yF55C3oZAeNYtJqB5yvAg/wEoCbqXe27X2kIcnR9KuYdj/L9rALct7aG27VOWyC58xg==
X-Received: by 2002:a05:600c:2901:b0:401:906b:7e9d with SMTP id i1-20020a05600c290100b00401906b7e9dmr7999543wmd.18.1695032275800;
        Mon, 18 Sep 2023 03:17:55 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (5.red-88-29-175.dynamicip.rima-tde.net. [88.29.175.5])
        by smtp.gmail.com with ESMTPSA id c4-20020a05600c0ac400b004030c778396sm14945294wmr.4.2023.09.18.03.17.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 03:17:55 -0700 (PDT)
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
Subject: [PATCH 2/2] qdev: Ensure devices are fully realized when calling DeviceReset handler
Date: Mon, 18 Sep 2023 12:17:36 +0200
Message-ID: <20230918101736.23905-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918101736.23905-1-philmd@linaro.org>
References: <20230918101736.23905-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XQ+vi49eSNl1

We shouldn't call a DeviceReset() handler on unrealized device.
In order to enforce that, add an assertion.

CPU devices are a bit particular because we manually reset them
in various places, so corner case them out for now.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/qdev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 43d863b0c5..c51b4c98de 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -252,6 +252,8 @@ void qdev_set_legacy_instance_id(DeviceState *dev, int alias_id,
 
 void device_cold_reset(DeviceState *dev)
 {
+    /* TODO: Also cover CPUs once we removed manual calls to cpu_reset() */
+    assert(object_dynamic_cast(OBJECT(dev), TYPE_CPU) || dev->realized);
     resettable_reset(OBJECT(dev), RESET_TYPE_COLD);
 }
 
@@ -280,6 +282,7 @@ static void device_reset_child_foreach(Object *obj, ResettableChildCallback cb,
 bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp)
 {
     assert(!dev->realized && !dev->parent_bus);
+    assert(!device_is_in_reset(dev));
 
     if (bus) {
         if (!qdev_set_parent_bus(dev, bus, errp)) {
-- 
2.41.0
