Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1332326ejc;
        Fri, 13 Oct 2023 00:55:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhlTyzrJV5NTP2V87SLSRTBtjSO1dGZU5VsGTvIu/2ufHEibF8u1boKnD1XUt2hURlECJ6
X-Received: by 2002:a05:620a:2544:b0:774:220c:1547 with SMTP id s4-20020a05620a254400b00774220c1547mr31435035qko.34.1697183728290;
        Fri, 13 Oct 2023 00:55:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697183728; cv=none;
        d=google.com; s=arc-20160816;
        b=PzHeOxT2SE6FQlowJDKGSKIO2gQ4VhZFx3vpgnnO7xpqTSN4+06IjH6aP0cngSotpA
         mu/sfE+E49gAmGkJGoWsOQ54G/NyIh0TkW0b70dtWx2HaWeqQ6Me/UnowaOlpFww+gaz
         wsyD5SbnQKhJG63RWxIZKaGZWgzwNqiEnG4uGccabFmvoXgQenbisw89MahG3Q6sBtB/
         0T3yKiDXNXsC+N50n6AZaF9WNDeRjRsDEt/H2ffF75AOMdJyD/MKYTXLjokNlJZNe0/i
         iqB4kBrONVcUT4y7NBzWt7ptybHuSCZdeCiMNRmzIjoHY3nxvDI5Gq+QS9faYm11DvQU
         dyCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=25sCzaInjB8sFE1VeuGo95l9HKW+ig6yAUD4q7buGOU=;
        fh=+ZsZUTuyxoQ5ZtM1/3hdknpz4V7RB/CRpE4IdMKqcXk=;
        b=t6n++gOjVj5E79+wTR8cNw+i/tc1FFiAc20vAMY1YMe9CnYBbFgaBqBfwrbJpA8SQF
         4muy4Ngri5A5m8qIU+pHwm3HyJ4uKhDNsE0L82pYlJ2yt/9TWG8uYqi11b/sxdcLuW0a
         bK4A9kFML8iCdTigyxFZpCAwhTtFGA+sXc0ZWt+JMYbpMm2kLSzmc7/6c7rTds31XG6l
         oP65Xs5wd5XrrY02N//ZAf2Vwc7b1qD4g0OquxYsT2mZpPTEBD3kj9dP+6OhPVwJEcKY
         EDi3f2bHvqkP9PKc3Kx6aZmfjEqfV4QXvRSpEE+CnWhkWmCnBi/tWdt3HKKnIgtJRwId
         HwDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSjwDyOt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id sn3-20020a05620a948300b00773a83f4736si784404qkn.585.2023.10.13.00.55.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 00:55:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSjwDyOt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qrCxh-0000AZ-6N; Fri, 13 Oct 2023 03:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCwz-0006Fo-85
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 03:51:14 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCwl-0004uj-Jy
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 03:51:12 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31f71b25a99so1699234f8f.2
 for <qemu-devel@nongnu.org>; Fri, 13 Oct 2023 00:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183458; x=1697788258; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=25sCzaInjB8sFE1VeuGo95l9HKW+ig6yAUD4q7buGOU=;
 b=BSjwDyOtbb9EY7/hwBEdZ4ENCUq9yg/JJIqFwxu7NerjndBgy8d3gPN/Ekn2Jpulam
 OiH47qR86FUSx5/YdATqVU4wVg/VzE205DUCnFEjpNRJLaPZK/rGDLWu84DWlLgs9u/h
 mk+aSandgzW/wyC99TO3csAKE3FOSGYmMoY48yAINr9ZGn3Ne1JLF7qb1rCHsgU9WEXK
 9/lnMVH5UUu326kN9qJUEAOFm1vfHwNUEgwS58vwkuHWaerSFPqGpF0OXzVxd6dgGJoK
 Yhkify91Q+hB4z9KW3v23iLwJi5hQmTepRaPMeZXdgRYdTMYcujS+PMFpDzazUZEKXqF
 A6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183458; x=1697788258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=25sCzaInjB8sFE1VeuGo95l9HKW+ig6yAUD4q7buGOU=;
 b=GvR3bz0HZ+UyYaa9Yb2k0FuU2e92hhh+098yW+zVBvKExZPHPTAccYDTBfpvxU/w5Y
 TbzDF4qpIQVumqaz3j+AIcvCeCTO0SjdFSjLFDYiA0TM55xYYVszI9qjKuIM+KjqnVvt
 JWj4I/h3vSsseWLAvcg55JBawoFJ8gVOKlQ2ZdHxJLlENSy6YJW7cxCen07qDuz+rWgK
 bao78v1Lmpkc9Xsn3hucn4rrQkMAnJWzaBJxH3pq+JIkbF3rH8Invr8b08eH8VkL6Bot
 lwGldUjcj93Vh24cyABOqq2oYz8+0LPFFXHdGd1d7sBzNzT5wma6qqm69ba0kDjSGBfZ
 /+9A==
X-Gm-Message-State: AOJu0Yx/lJYJOI4ZD53pmJo2taBamYQ54TVwyKNGOkPu9Cks9RdGmvJH
 09UgqarhdTYl5CM0qLqPaGFwayDDwe72OW0KunY=
X-Received: by 2002:a5d:4402:0:b0:32d:8907:2b18 with SMTP id
 z2-20020a5d4402000000b0032d89072b18mr5574866wrq.66.1697183457886; 
 Fri, 13 Oct 2023 00:50:57 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:50:57 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [RFC PATCH 37/75] system/rtc.c: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:47:41 +0300
Message-Id: <bd0de407a945f53fa449b7459d28701af69bdf78.1697034504.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697034504.git.manos.pitsidianakis@linaro.org>
References: <cover.1697034504.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yyFegiE1QAbR

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 system/rtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/rtc.c b/system/rtc.c
index 4904581abe..bb406542c8 100644
--- a/system/rtc.c
+++ b/system/rtc.c
@@ -48,22 +48,22 @@ QEMUClockType rtc_clock;
 /***********************************************************/
 /* RTC reference time/date access */
 static time_t qemu_ref_timedate(QEMUClockType clock)
 {
     time_t value = qemu_clock_get_ms(clock) / 1000;
     switch (clock) {
     case QEMU_CLOCK_REALTIME:
         value -= rtc_realtime_clock_offset;
-        /* fall through */
+        fallthrough;
     case QEMU_CLOCK_VIRTUAL:
         value += rtc_ref_start_datetime;
         break;
     case QEMU_CLOCK_HOST:
         if (rtc_base_type == RTC_BASE_DATETIME) {
             value -= rtc_host_datetime_offset;
         }
         break;
     default:
         assert(0);
     }
     return value;
 }
-- 
2.39.2

