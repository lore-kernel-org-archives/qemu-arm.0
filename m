Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp1223585lfi;
        Fri, 2 Jul 2021 03:41:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAUpVxCXB75sOXChTEtVJ5I9yImCCBqz7DZIje8YXrpNnTPjxh0injyId/70BDYQ/kyUXM
X-Received: by 2002:a67:8c4a:: with SMTP id o71mr5339092vsd.46.1625222506650;
        Fri, 02 Jul 2021 03:41:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625222506; cv=none;
        d=google.com; s=arc-20160816;
        b=BcMnsq/0JgLzV1E2BhkldFFgGVEZRwHzkzcDgo/Fh3ZG7OQd/BVPiFanZbnMPl3NVH
         wtVnF82mE0aHMBk9o/oQc/+37KROU+2j7BAOc5gJ6pVN4aVqvVs5unFY3xnff+SNQf+u
         XBjdmWD1tbp7J9gpQKLZy9XfORXANyJkJ++yJtzf6f0zFp3AY14zmg6GksUwvfHY9XLt
         K+JB0hcarAsui5N1n707jrOEPKaLGGignJxVzHAB/v3nThKXpTASFg6XQui7x8F3bsTc
         Qg8CH30wqGShU/+XuwvCBYkcvnYY9jWw8fPl+wkYZtmjy3ArXCkSvg8X+L6Mhf37/oIp
         nchQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pPs0EK8qhWJ7QET2DXUmT74qvqEztx/Rozsf7xNVhPY=;
        b=ccNKh+bkWZIAx0ohXuT0YFzF522t5YPSBLiHUfemzhCmQCuFCJPfWLaJ+2OaKZYPho
         i1zDE8dmvHcO2Xh24o1JSRetg2q3Nx7xexEq9Ry9GPfnqpVwpmxBMz7w2l7QR7zlSGnx
         YeDThmJc6cFIeCdXAInUUptWVtB6XHXwVLKZr1ZEM8/1g61bWXkrK+4VijBPT1Xvvegv
         irKLWicN9X1/Ti2zVRjz6VPhyDW/AbZ8lY/BxI2VD8Hbbv0HE/ENekZvrlsjpOlF9ala
         giZoiCq8aumudYdBJ+cbi19ViEr/m8UKn3cSpU1KUy9yG/SnotPkW8SIRV+aWThvbIVq
         4dGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QNlW6bmC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h27si3058446vsh.203.2021.07.02.03.41.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jul 2021 03:41:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QNlW6bmC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lzGcD-00079j-VY
	for alex.bennee@linaro.org; Fri, 02 Jul 2021 06:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGb4-0004n4-OP
 for qemu-arm@nongnu.org; Fri, 02 Jul 2021 06:40:34 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGaz-0006g0-Ll
 for qemu-arm@nongnu.org; Fri, 02 Jul 2021 06:40:34 -0400
Received: by mail-wr1-x42d.google.com with SMTP id j2so11865662wrs.12
 for <qemu-arm@nongnu.org>; Fri, 02 Jul 2021 03:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pPs0EK8qhWJ7QET2DXUmT74qvqEztx/Rozsf7xNVhPY=;
 b=QNlW6bmCpuhuwYHEHYgR1XD/1wxGj7e2zKRXVYVQvq/Tw1eT0zN19yZWenyKq1A7dn
 wmK6AZH0YcB3tY7f4CUmpODZKr/zbtIDcwtNKJAPmeE8DdpW6ZdAKIqcjpApOSoqsiRP
 9bWJwBQVndRip0ZzzOND27xel0KAUB/TtlzejfF+d29L55Z2ukfrtzYn5bv0XNWYhnsj
 +4WDKUszqdBBga8FlqPg+RcHGdmGJz+s6Yu8d4RuJZJcLM+0Forg6AdcT7SxyxLKosm2
 5HgtJZqbzBGG/AaRDgTIaNa1AJY/zUgmL802b2etKs6+WbHlMwWbKMEdZIhakJaTCVQo
 satw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pPs0EK8qhWJ7QET2DXUmT74qvqEztx/Rozsf7xNVhPY=;
 b=i00FcSauYUVV7JDqfHW7B5mw8xiBMe6We40ldn4imbdkoxG6STibnRCjUhyTqWLEeN
 rTyXrrXN/QVaV0weKoj+2Cbz5rBvZ2MygxYXIUI9T7AYHIpjYvmqZQAdNlfmDd9symGl
 415FYsLyEk+dwru/H4yWxeSEAYk09Po855V+SgmPCnc02UQVVzp8dw6oqRuz04RRCEWl
 DHJ7Aznq/clp2PXamWgGIrcHxaN6TnQyhEHdDGHbtPwnFVdpFY1QtDLhKoTzIxMnKn8f
 9Itqo0vnK7Ty007wP7X1/p/Y3wQzMt31JU2QxFIuJPG2x3LLYZBmjTEoRWk+kB1bxKIN
 q46w==
X-Gm-Message-State: AOAM530V/mH/1JQbnYUHlesFkWiF4Ol/5OeRWlMZeYkF/OR+Vce/eqa1
 dKNousF9p57gcj22ciRNHWjGOuxZdvcu01lR
X-Received: by 2002:a5d:52c1:: with SMTP id r1mr1441628wrv.294.1625222428373; 
 Fri, 02 Jul 2021 03:40:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm2745810wrs.52.2021.07.02.03.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:40:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/11] hw/gpio/pl061: Document a shortcoming in our
 implementation
Date: Fri,  2 Jul 2021 11:40:17 +0100
Message-Id: <20210702104018.19881-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702104018.19881-1-peter.maydell@linaro.org>
References: <20210702104018.19881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dg3uCl7UNtev

The Luminary PL061s in the Stellaris LM3S9695 don't all have the same
reset value for GPIOPUR.  We can get away with not letting the board
configure the PUR reset value because we don't actually wire anything
up to the lines which should reset to pull-up.  Add a comment noting
this omission.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not worth actually fixing, but I wanted a note since I spotted this
while I was reading the datasheet anyway.
---
 hw/gpio/pl061.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 8d12b2d6b97..2cb3a231b43 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -455,6 +455,15 @@ static void pl061_enter_reset(Object *obj, ResetType type)
     trace_pl061_reset(DEVICE(s)->canonical_path);
 
     /* reset values from PL061 TRM, Stellaris LM3S5P31 & LM3S8962 Data Sheet */
+
+    /*
+     * FIXME: For the LM3S6965, not all of the PL061 instances have the
+     * same reset values for GPIOPUR, GPIOAFSEL and GPIODEN, so in theory
+     * we should allow the board to configure these via properties.
+     * In practice, we don't wire anything up to the affected GPIO lines
+     * (PB7, PC0, PC1, PC2, PC3 -- they're used for JTAG), so we can
+     * get away with this inaccuracy.
+     */
     s->data = 0;
     s->old_in_data = 0;
     s->dir = 0;
-- 
2.20.1

