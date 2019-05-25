Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4320116wrg;
        Sat, 25 May 2019 08:24:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyYRPKUNFlPM2hfm7JfHi6Et01AbVL18Tv54q5uuxFK/v3WdP8quAMThkGH8bSJbs18zaMb
X-Received: by 2002:a05:6102:208a:: with SMTP id h10mr10511538vsr.239.1558797864202;
        Sat, 25 May 2019 08:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558797864; cv=none;
        d=google.com; s=arc-20160816;
        b=BE+fnpihRMMHxkJGAM3AmVviZvD2CBNXFdMwwcWoDdihUu23o13GwRgDHTcXVD7I/Z
         IwC7YeYDpE9A5IUUEEHs0IGfvU75HAnKg1MSQCb8CSnmv9vtEp7mNRDcjVWhJRmJ0MrO
         9HE4nHCB7q/z+DEK/7UaTCkyXC0M7z9sz3lCTADRayJtrNrY788EycBv3ynnZv71Wa83
         d/aw7b4+RFshlFM0LXOb5eWsmrqgVK1ar4OKi36Mci/3mgPQEKakWYxcMF9AMVAiubTw
         oRApk5ttBe44PGZro96jR9QcJvqJHVQWhPKB6PqSQ89Lpe+7SEL/Tw5kdhAlVGjxXFdl
         0gGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ksgPWpPXvyV7PuXk87f72S+ZcVaiCTc6r06+d3A8ux0=;
        b=NHeTqc76u196UgZYmLpPCiv2/v2ZaaO6KvqF5ZqNzeC0kM03RhKwgZrcHPgx/7Lm0U
         cioMe3eOf2cTN/jD5VaMSbzIHqL4f91a7ulcbPpq2Yyv8E/r0C9LMyBT/hOcWhHgVXyI
         T+3r7bwJsewGnnsmK+DewklbeK0g/1GzGX2wQYmquZfSeOFdYOsEEhc52Ehb4GSFFhRU
         gNRmpeLFMVxlHgG1txgv/fbY/vfiiMhItb3AVhrFJaCFHuPZimXoXIjat3csHIBaiLK5
         YDK8lmmTLdZ4YpLJYlQMt5rdtkPUkL7HzmyKs7DHZBtYQGRrJvZjEbDFHlmVzh7q73PW
         CbOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20si57728vke.17.2019.05.25.08.24.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 May 2019 08:24:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:43316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hUYX1-0005KP-NV
	for alex.bennee@linaro.org; Sat, 25 May 2019 11:24:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYMy-00062S-32
	for qemu-devel@nongnu.org; Sat, 25 May 2019 11:14:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYMx-0001v3-5L
	for qemu-devel@nongnu.org; Sat, 25 May 2019 11:14:00 -0400
Received: from 12.mo6.mail-out.ovh.net ([178.32.125.228]:53222)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hUYMw-0001tb-W4
	for qemu-devel@nongnu.org; Sat, 25 May 2019 11:13:59 -0400
Received: from player698.ha.ovh.net (unknown [10.108.35.223])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id C90611CC2EB
	for <qemu-devel@nongnu.org>; Sat, 25 May 2019 17:13:56 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player698.ha.ovh.net (Postfix) with ESMTPSA id 7101D625A7C3;
	Sat, 25 May 2019 15:13:50 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 May 2019 17:12:31 +0200
Message-Id: <20190525151241.5017-10-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525151241.5017-1-clg@kaod.org>
References: <20190525151241.5017-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6607906556218608401
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddukedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.32.125.228
Subject: [Qemu-devel] [PATCH 09/19] aspeed/timer: Status register contains
 reload for stopped timer
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 57i+e2AgrwP5

From: Andrew Jeffery <andrew@aj.id.au>

From the datasheet:

  This register stores the current status of counter #N. When timer
  enable bit TMC30[N * b] is disabled, the reload register will be
  loaded into this counter. When timer bit TMC30[N * b] is set, the
  counter will start to decrement. CPU can update this register value
  when enable bit is set.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/timer/aspeed_timer.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 9ffd8e09f670..2f8522a597d3 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -187,7 +187,11 @@ static uint64_t aspeed_timer_get_value(AspeedTimer *=
t, int reg)
=20
     switch (reg) {
     case TIMER_REG_STATUS:
-        value =3D calculate_ticks(t, qemu_clock_get_ns(QEMU_CLOCK_VIRTUA=
L));
+        if (timer_enabled(t)) {
+            value =3D calculate_ticks(t, qemu_clock_get_ns(QEMU_CLOCK_VI=
RTUAL));
+        } else {
+            value =3D t->reload;
+        }
         break;
     case TIMER_REG_RELOAD:
         value =3D t->reload;
--=20
2.20.1

