Received: by 10.223.172.38 with SMTP id v35csp1914823wrc;
        Fri, 8 Sep 2017 10:37:23 -0700 (PDT)
X-Received: by 10.200.50.125 with SMTP id y58mr4850014qta.266.1504892243394;
        Fri, 08 Sep 2017 10:37:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504892243; cv=none;
        d=google.com; s=arc-20160816;
        b=DPUjl+inB2vJOhaqoZN7WTcVyBETyLqKCAsXl4hZCWXVZMJrmf94lk8tIICaTfQnaU
         1/yMNJpir9xd3fgfjFpXTFO0Ak6ZHNa0+57Tlfwav3v1Fj+WU3Fphz8M7tw5f4NKMRxC
         QCcrwi+3Hk49bisz30501AIeZiPgwjhwBkI4fp9qEkbGmvIAaq6bwiZ37pmK0DMDCgmv
         PTdHK51vuwb3LtNRJokUoLBJBQHA2QpswD9xyVsgvg5Zsk6xWENVeXF56B3IHvUDLRn4
         I70dL3B78wk/bOM1g8JYAg34FOnkgrO+av9VJFakrqG7sQMKbm5C0Q5MAzcGgUNojJP2
         zq5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:in-reply-to:message-id:date
         :to:from:dkim-signature:arc-authentication-results;
        bh=LRIaSkvaXbzyMAf1ZND0sDj2yZgVGO5P6LXlLNt7Eno=;
        b=P7uqi/AuldA6MlfqOiCtBFIJEYZLQRh7pS3cqLftstildDgzg64Fgf3gPzPiOIDLz6
         j5Rj3v/Tur/PuycDYmhrGlvtuH5auwZHUiRcN1NeNh4w2xBMsKdufsaVk0IV6C6LO+DK
         GD7t6AepQ28wwdSuiUzGhtHKF0WUwm5cQ1o8GvuSzFETtOmNOQcg78vFXj+xIMJHiEDc
         Ubp3CsCs87vVQAdc5AxEyxxJqv9NC7SC375AXgFZ80XDOGAOITQzsjIMgmZtWQtnmggT
         VKFQY6rJdXgZmOCZYWdRBnNySZBhd86tYNRTFXONwQOxPsyDdL5WT1QcyLcdjcB9xJ73
         0+ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fjpk7971;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z46si2682338qtz.116.2017.09.08.10.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Sep 2017 10:37:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fjpk7971;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dqNDV-0006du-5D
	for alex.bennee@linaro.org; Fri, 08 Sep 2017 13:37:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNDA-0006N2-VO
	for qemu-arm@nongnu.org; Fri, 08 Sep 2017 13:37:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNDA-0006s7-9f
	for qemu-arm@nongnu.org; Fri, 08 Sep 2017 13:37:01 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:33268)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqND3-0006oL-LG; Fri, 08 Sep 2017 13:36:53 -0400
Received: by mail-qt0-x244.google.com with SMTP id h15so1959578qta.0;
	Fri, 08 Sep 2017 10:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:mime-version
	:content-transfer-encoding;
	bh=LRIaSkvaXbzyMAf1ZND0sDj2yZgVGO5P6LXlLNt7Eno=;
	b=fjpk7971Drh7VKUzlL8onXJ+4toQv/qQyxMqGL4zrCEGnTAQNxbR3+UrQnDPOupm0J
	2qnzc1cIoxhSP2xcjcSOMZMtPHz8VnT/tYLxuwWoYUIFYjQo1+8TPyL36RJ1Ko414emJ
	GhARIo9JAXd7DM/803wt4lnp992Hfe1deRztM4641/P4nQDfnVhlg3MJoVmIPEjr2b9n
	eI7FHOezroQhPLYqmNQGTkdq+ukLzKhBFlAgXjvVX9Q1sJ0m/KoGJpwic8aPUtadNUkQ
	EO1uOmY4Kd5VLoJm47KIG20wU63kP3wmAnmgmbW7EbJYw4g2pVcrlSwGUg5idZNHYlmy
	ws/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:mime-version:content-transfer-encoding;
	bh=LRIaSkvaXbzyMAf1ZND0sDj2yZgVGO5P6LXlLNt7Eno=;
	b=UjhQPCqGiT9+M1oMxryMJ/7rVJ+tBsJQmJpm8ZROj+VfozJA7TtgIQelyu2CfJZVaU
	4/+KMeuJ2KGaps6gGapDCvPjsf/89w94exY+ZT2kSWuQf+Akkv++nko6ew9MxYt2vWv8
	F/xq+4j/HI31Xxh/ayaPG8/PrITH3UUqeJEfkeCoSgaPnRiD9jmXLum8s3JheECg+i0/
	0W7iuvZ9zeEhmEXO+gbyVkOonktLnIz7BL50B1j28IdIpfszCqFt3jwxqr+I4cQ6tgVL
	BJI+1RAs60Zq7r7okQArW5FoYY4ndb1xX9fF9/T846WwCtPFg3bZ5BrSu6DXzgGQmNEq
	9mTA==
X-Gm-Message-State: AHPjjUiC3tw2enWMaD0dNQT9C8D34BDKVZl0+JeXSPPLY3K+ga0Ong3B
	cBZLHywZHXt2ty6eEZtKMw==
X-Google-Smtp-Source: AOwi7QAfTv1W2ATon+IJRfJ6J7wSefGPHgSwMX4OeGYX4sYibKguz9MgT1WLfDChZP0bKUTVwPcW0w==
X-Received: by 10.200.18.67 with SMTP id g3mr4901786qtj.2.1504892212853;
	Fri, 08 Sep 2017 10:36:52 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id f4sm1605859qtg.35.2017.09.08.10.36.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 10:36:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Date: Fri,  8 Sep 2017 14:36:19 -0300
Message-Id: <20170908173632.6711-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908173146.6446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-arm] [PATCH v3 02/15] MAINTAINERS: add missing STM32 entry
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: td1nNyQWCi+o

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alistair Francis <alistair@alistair23.me>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 35c8c9c752..fb93e4b554 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -552,6 +552,7 @@ F: hw/char/stm32f2xx_usart.c
 F: hw/timer/stm32f2xx_timer.c
 F: hw/adc/*
 F: hw/ssi/stm32f2xx_spi.c
+F: include/hw/*/stm32*.h
 
 Netduino 2
 M: Alistair Francis <alistair@alistair23.me>
-- 
2.14.1

