Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp577521wro;
        Thu, 14 Mar 2019 01:43:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy9qwobYPot5a4qvJ6zMD5JFLHiAm77bV/H01y78xhiKHI0ehZVWZOOW6qgjo9YrCQ+/Fi0
X-Received: by 2002:a25:83ca:: with SMTP id v10mr21952714ybm.467.1552553013830;
        Thu, 14 Mar 2019 01:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552553013; cv=none;
        d=google.com; s=arc-20160816;
        b=IuYnWfHDFYSkyl1eR69CHN4qjf51FhNz0mNpc1lE9/3rDOM73EsXHPbWTZc+u1vpKX
         mVpvjuK/lgjLhQ1MuWzW0i5IX6kma2Cob6O32IVS2y3hfKuqKOG4ETQAVbJ1pccc1CAN
         wxEfgCUv1vCAHVpoijiYrqhNhKb1BB8PmSSLIg51jD8WWT1toWoyFxjXyEIJt/fzHHF+
         GJhGpBSue1iui6Cpja9YHc7ue1qLzNYxrP2yMw2Iqt9u6WiCWDT7CWqYVQxt9Gy41w8v
         +28meLC/hEc2nnXMCLkuTEASU/meTvgI2f+MZiF+0+ijy8v5QscCIy6vKDerQo1/x71/
         aclA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ksgPWpPXvyV7PuXk87f72S+ZcVaiCTc6r06+d3A8ux0=;
        b=Ahz8ulF5amJSMihl8P5mVvcRbiXxU8XGnbblKrgGP01SVyyVDDK6oC7vd7TlMkXipi
         7VD3oZual0wwI5E5cnerLdAz7vaLSZ/4HZthqpI80DyHboiEPyBXIt0TJOctAKHIFB4r
         F54N/Ydvk9gGI4cIH4YNFMrxbnCJvJdD8o/RP3L1/rYte9uOGGHBN5X7u17wWJZ0GuMg
         U5QJi+RNVT7bK+l6i4rQ5E/vxPjTaHEb/AfrsGDBp9JyFpCysQgQUWxJCbLr+LDXdQO7
         Sjl/Y0cVMW21n+faWB+Chuyg5OOg4STnIJB0E52PWXC7Vgo2qG/4SO7bIkw51ffMcEEE
         xzww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si8880564ybj.353.2019.03.14.01.43.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 01:43:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:59099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4Lxd-0008N7-6f
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 04:43:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1h4LxL-0008LS-WE
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 04:43:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1h4LxL-0002aY-6m
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 04:43:15 -0400
Received: from 5.mo69.mail-out.ovh.net ([46.105.43.105]:51220)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1h4LxK-0002X8-UR
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 04:43:15 -0400
Received: from player762.ha.ovh.net (unknown [10.109.146.106])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 16162455C6
	for <qemu-arm@nongnu.org>; Thu, 14 Mar 2019 09:43:11 +0100 (CET)
Received: from kaod.org (lfbn-1-2226-17.w90-76.abo.wanadoo.fr [90.76.48.17])
	(Authenticated sender: clg@kaod.org)
	by player762.ha.ovh.net (Postfix) with ESMTPSA id 4166C3AA2E1C;
	Thu, 14 Mar 2019 08:43:03 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Mar 2019 09:42:32 +0100
Message-Id: <20190314084235.9887-3-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190314084235.9887-1-clg@kaod.org>
References: <20190314084235.9887-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1449877606907022097
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedutddrhedugdduvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.43.105
Subject: [Qemu-arm] [PATCH 2/5] aspeed/timer: Status register contains
 reload for stopped timer
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L7K4LHsNgmdo

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

