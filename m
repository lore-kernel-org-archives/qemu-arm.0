Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1360765wru;
        Wed, 25 Jul 2018 19:39:01 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdluZa1QZUFxDzcxkKvTp0YLeUcF7IIGHWyqwcXWW0985pEno+TWZvLMKpu/afqVkRAp1m6
X-Received: by 2002:a37:a650:: with SMTP id p77-v6mr101914qke.256.1532572741804;
        Wed, 25 Jul 2018 19:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532572741; cv=none;
        d=google.com; s=arc-20160816;
        b=OSrrYfVeDtjMDt357I16lP1xLG7Ym2V6i//tU4AjoSKOkLbrWZboeNgJ9B6lpe7QAB
         xmSASH6XBLNEgj3Nhxe5xHEBZXt1uppKPYoOQPESSyRwEdz+VKxA0rxnowZXYI+Z4OJy
         Y3mQt/p8chEKqh4U55gpqad/Yek1fxQY7zIkfdgusFufcq49GWqkHY/Lvrm6HskUEXx7
         wlTvgcb+L9teVqFhpUJX0q3p4sOGnSvPeQBY+pT/BEDy535xo1xsC5Xk6crCQtPyyvXc
         5L86lviOwGvitSrFGFY8GKC1zoXB13XouPBpZvN8EITN94YTH5OiRyxzz0B+EDSz8ZhL
         FR6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=KwnVk0FZbRL5sACB19TJDzQlDaPoBQkUgoOUVam8cLY=;
        b=NVNZ11yH2DpJ/Oj7H0iEy+w4olsN+f6a0BqJSCLfoIp5F8xsgbKuqOdKIwwIBFsnZ8
         4PyqLqE9pNru8C1N73X7vb3SzM/fPI6TVwCxBk9Vxh6f5AaCDQDtIRplSkP30/vKoIsZ
         +x54eda+2h1jT0DJU0eaI2v7lRNlZSnmMV6n8aOTxPZ8X9mK0yQ67uU9tdrRk4Z5AozS
         UnE1ac2AjqdMhR529c3Szj7JvD3QztqXwD1S3YZZab8iApC9HZvlbSnQsB3hrZapDeWU
         v4pl7rl0oAI4wY9MnpvE8eButdhICTAGYw1C9zesDSVr8BeZF1Tac3kny60QoHKL5Ob7
         qbWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Mub7niAU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d62-v6si135177qkg.74.2018.07.25.19.39.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Jul 2018 19:39:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Mub7niAU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57704 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fiWBB-0006kR-BO
	for alex.bennee@linaro.org; Wed, 25 Jul 2018 22:39:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fiW9T-0005dP-K3
	for qemu-devel@nongnu.org; Wed, 25 Jul 2018 22:37:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fiW9Q-00035v-LI
	for qemu-devel@nongnu.org; Wed, 25 Jul 2018 22:37:15 -0400
Received: from mail-pl0-x22c.google.com ([2607:f8b0:400e:c01::22c]:46341)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fiW9Q-00034n-Ef; Wed, 25 Jul 2018 22:37:12 -0400
Received: by mail-pl0-x22c.google.com with SMTP id t17-v6so99584ply.13;
	Wed, 25 Jul 2018 19:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KwnVk0FZbRL5sACB19TJDzQlDaPoBQkUgoOUVam8cLY=;
	b=Mub7niAUSvR0k4nmQtWOkJUjf21QcLdwdguPVMKki8HlBi/mIznNil/i6LdVsAnQBh
	kMLYbvDKEbAbFfUYd2y6OYDE+WYbO1MzeSRSrBURSpMkyfz0f/46feGlPMu7o856/mPi
	/BIU4hqZDq4R9DRxa8JCtgyjwt2PyGMydGHV70KPTuTL3Ah0dWJtfPyQIUxq7EBZnCZ8
	QhPLHiPvxMYPnVjR0U87rvzmIWoUguGEOgrOwZbyMOZ3h+EXrti4IZqLS/qdNkvjpnOM
	A1QarnVXDQNXIgO+VJGMnxJ7mzl/cXrZsW1ei/S8+UW0mi5lWsyHQQGRCC7IRvCy+H/e
	MqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=KwnVk0FZbRL5sACB19TJDzQlDaPoBQkUgoOUVam8cLY=;
	b=Sdsk1kH5GUHAcX+571/hpsWXeHZkbnSCY/WIXtVPuKCY6YUjgLsNFBIje3SoziEZ15
	7ngsjo75Hqtlpo6SkNo7Iz6ndSby39+mVXOifsHJ6giL8qVzWdLEZrBAaYDeTtKmFLQl
	y3bHhq7/GFzvyFQQSYpP8FmUZ6//UQzL3PXdYnEw4bBSw8g0ulhHzJ2y3gOA+ogvHLs0
	7QzDO8D4UBv4Nz1GkiLap68FiOxszGAdtJpgnfrP67aUO2piYY+M9IppydDGUdlA21tx
	7QdwPwDBTGwLhACt42JM9a2AtJ2TTGFWZOOqKD02z5tIYiWLHxWix1ZE5XlHYZQpzuga
	3Yiw==
X-Gm-Message-State: AOUpUlETuG94nbF2FCmP8TOCoCYRmhQ4LpZHSu2RH6WrKz44RfeZyGk4
	NqOhrv+jyCxnCczCc4OBVj4=
X-Received: by 2002:a17:902:8a4:: with SMTP id
	33-v6mr77755pll.343.1532572631388; 
	Wed, 25 Jul 2018 19:37:11 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	u69-v6sm97273pgd.43.2018.07.25.19.37.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Jul 2018 19:37:10 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Thu, 26 Jul 2018 12:07:03 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Jul 2018 12:06:43 +0930
Message-Id: <20180726023645.13927-2-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180726023645.13927-1-joel@jms.id.au>
References: <20180726023645.13927-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::22c
Subject: [Qemu-devel] [PATCH v3 1/3] MAINTAINERS: Add NRF51 entry
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AKgKaYDrzp96

This contains the NRF51, and the machine that uses it, the BBC
micro:bit.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3:
  fix spelling of mailing list
  add stefan's reviewed-by
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c48d9271cf15..5a0d2e327d4a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -656,6 +656,14 @@ F: include/hw/*/*aspeed*
 F: hw/net/ftgmac100.c
 F: include/hw/net/ftgmac100.h
 
+NRF51
+M: Joel Stanley <joel@jms.id.au>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/arm/nrf51_soc.c
+F: hw/arm/microbit.c
+F: include/hw/arm/nrf51_soc.h
+
 CRIS Machines
 -------------
 Axis Dev88
-- 
2.17.1

