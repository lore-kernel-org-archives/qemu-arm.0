Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1360575wru;
        Wed, 25 Jul 2018 19:38:48 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf4tZElJ2TA2dQZjCricYjH2Z+W9tLMHgadV2gYNCGsmL4lcNyA+8pvYlj+Z163RN1aCUeE
X-Received: by 2002:a0c:ac85:: with SMTP id m5-v6mr63415qvc.197.1532572728767;
        Wed, 25 Jul 2018 19:38:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532572728; cv=none;
        d=google.com; s=arc-20160816;
        b=aCFXuMBdBYiaKV4xSmA/097RXyVr1ZP7IIu9KWf0fDgN6uWJn6FMrU/yeezp6W+uxG
         L9WIjuNQpingLMnE48jkrClNC/M6tWSyJ0Vpbl3QHKKcSFvMTN4RS3zPg//clgn7l/F+
         Ua/P36nyuaAVghNiByPou5fW/g7Kmc0/Hr8jRKfOsghCHaN4XLxEAxfMEbZVdNMQrYXL
         v7FeJGl+kAspOe6oN+utCF4VYWuFlvvWNek4GfJPrpqUUGwk3s3gQaGmZ9VijbiT9Yl7
         NppCTCK3knqdrcY8L6QofyBkxdjV3HgSRv+BnJl9//XM2L6k7Z+XubRIq92Fj4w3rXST
         moHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=o6ljXcO+n1+GdHjp8EqZN0je73vqWdq5zqqjwcgT5e4=;
        b=nrCtrQ8ElSyKwfctt5xZy3PAOSzZKXL38TCduqCYwOp9zWq9f3kJ0MQUz05/b+hr36
         UDAeMbqzVyfTvkwK24PgDv6cGJk9GMDS9SDGGaP4nvoPJ5enZaTblRP3Cg5ysmOZkjiA
         TZnMXGwwK67YMWnWqzRER/nX/iuN3Vgufmuykr/+eZypu5nNma8xFBpmm9vwHLlED0Jd
         Mem0vH23l0ht1FF+Eu2smN+g2skQ4/2JLW4uUaphUVuyOD5JfGkxQpEjDK+c4AvRWfDw
         B7iUQ0gGY0UHps1tOATGN1Qm7gtsVQr0kA9BFB/RyLTyb1KC8kmtfyXFUUVx5PDgZyLM
         FMuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KZUKV2+k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u20-v6si141129qtc.86.2018.07.25.19.38.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Jul 2018 19:38:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KZUKV2+k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fiWAy-0006VE-6Q
	for alex.bennee@linaro.org; Wed, 25 Jul 2018 22:38:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fiW9L-0005bn-2R
	for qemu-devel@nongnu.org; Wed, 25 Jul 2018 22:37:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fiW9I-0002xE-3Z
	for qemu-devel@nongnu.org; Wed, 25 Jul 2018 22:37:07 -0400
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:38036)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fiW9H-0002wk-SR; Wed, 25 Jul 2018 22:37:04 -0400
Received: by mail-pl0-x243.google.com with SMTP id b1-v6so106397pls.5;
	Wed, 25 Jul 2018 19:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=o6ljXcO+n1+GdHjp8EqZN0je73vqWdq5zqqjwcgT5e4=;
	b=KZUKV2+keGffdHaB8fhs7tcu2o3mr4cTd/twFPROHlO9dLk7oonDMUWqZE4MqkgUk/
	HzmY6z4Fh+J3sx87Z3nZLqTE+x5i54qyHJAWeGpatGp8AGhHeBa8KMAH+mnqcFJNR45P
	xcRvdQrW7wIzqx4Cn0v9CAi7y56iUhOnVDgv/qiT9+WIWBBHbrmRo0CkwUIwReMkGPCK
	TuLQDK/bQi56NohHX+7YmuY2yYR1sfuQ3jbArD16ZiuhRPnMdg/8txiBL9NzVc3efLKN
	e9l9JFQ0XcI3/ZNZX2O3Z/SOHepHYfeaaPNyIeY6aYgQhxT1TI7BUaNSJtUd1G87a11z
	oiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=o6ljXcO+n1+GdHjp8EqZN0je73vqWdq5zqqjwcgT5e4=;
	b=dIRAeuWk6Vr5OUhknQWv+luNuysxyzSf2QDsSCva39eEP96mZO9cJrXUZLrG0N50ww
	xWjwi4KTa4BXnkALDHmzXIZO2CVlHiAvz6xAUobeaO+ZY6sbi14EIvsehYQ6JVUMxptB
	AxoXlFT1OjWP8NHGgOT+Amm4OqMKxTNaTYJnmKVPSp3rJnYs2zqLl61+fQuFyjs+ejGS
	KkaJuGrVbEsNIgMa5vCPH1kZ7BrsVf44yXJo3rDswqGd3H3KlW7ckFfOytpvIDlkziJ+
	sFJUKsThku5MV5Zsuc7dF0gO4P1I13kByGk3NpaI+NriIhmqjcCPqkXSttiO8R6GLa3T
	wh4Q==
X-Gm-Message-State: AOUpUlG9ktDZ5aaZeF+2N2RrdMyXo9bi4H7QZjey57iJGQYPMoNmr3fw
	a2ihL25jtCLq8lgCefcuQVQ=
X-Received: by 2002:a17:902:bb0d:: with SMTP id
	l13-v6mr114826pls.5.1532572622802; 
	Wed, 25 Jul 2018 19:37:02 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	f19-v6sm102416pfd.147.2018.07.25.19.36.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Jul 2018 19:37:02 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Thu, 26 Jul 2018 12:06:54 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Jul 2018 12:06:42 +0930
Message-Id: <20180726023645.13927-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-devel] [PATCH v3 0/3] arm: Add nRF51 SoC and micro:bit machine
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
X-TUID: IkKabWqo1SrX

v3: Rebase on Stefan's cortex-m0 series
Based-on: 20180725085944.11856-8-stefanha@redhat.com

This short series implements a minimal definition of the Nordic
Semiconductor nRF51, a Cortex-M0 ARM SoC, and the BBC micro:bit, a
machine that will use this SoC.

This work will serve as the base for our Google Summer of Code and
Outreachy interns who will work on implementing a number of features on
top of this base.

I've tested this with a microbit micropython firmware, and checked that
it starts running by looking at it with gdb.

I chose to keep the nrf51 and the microbit seperate, to not confuse the
peripherals that are on the microbit but are not part of the nrf51, and
vice versa.


Joel Stanley (3):
  MAINTAINERS: Add NRF51 entry
  arm: Add Nordic Semiconductor nRF51 SoC
  arm: Add BBC micro:bit machine

 MAINTAINERS                     |   8 +++
 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/microbit.c               |  54 +++++++++++++++
 hw/arm/nrf51_soc.c              | 119 ++++++++++++++++++++++++++++++++
 include/hw/arm/nrf51_soc.h      |  42 +++++++++++
 6 files changed, 225 insertions(+)
 create mode 100644 hw/arm/microbit.c
 create mode 100644 hw/arm/nrf51_soc.c
 create mode 100644 include/hw/arm/nrf51_soc.h

-- 
2.17.1

