Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3731477wrv;
        Sun, 14 Jul 2019 23:19:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy+ZK9f+ldw66jrrvJ8iPWmkIkUQC+TjepIkYjr2iquhFguya8SHrwlJCSjryCY/qL/vJt/
X-Received: by 2002:a50:f7c1:: with SMTP id i1mr21354273edn.268.1563171581430;
        Sun, 14 Jul 2019 23:19:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563171581; cv=none;
        d=google.com; s=arc-20160816;
        b=cohHeU+SEpxP1yg1VQaoaft/ncEuyBu/vrh40fY/jdTNYtK5MQvkrWmfIWUve7MUzm
         UaFJZRTkXMa4y/HyBAMSao9p9CYzZBEjpzku+qkEDhfbI0GqDCr4xtppCaQ1Qatf03rW
         f6vK5wd0bo2tgZuXygWahunVBaODjVFnBKVkPqpRcq7AePfIRHTKa+DPCkwZnGx1zjJK
         JLuDIQMvXZYE971eXGFwZ1mV+WPuPJzFz1MIgUPpe0AufOAFPhNv3XXOieDSYLt7mmAt
         Y6TNeJKIbHnUJXoy4VPoOxoN2Si2SqX0gzvMbp4EgP9H4Kdqt0VOnSCeX/kM5TT3UKos
         IlsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=CFwjRJeYEQbmwlpBaKx41zBl6UOTVPC5mwjWf/K53/A=;
        b=t5gN1FxDMYJDiJDfDaU81q2wJwj2i/x6ktIppDX42Q/tnybFpbliRXH3xwApSQcuDL
         VKQIF5kI4+Km2PhiuXjRUBxs61TuLCt5sW/GdYzIHMlDUyhwQrXVm8FqPDGuEwu9uesn
         vImmL8fdxYcIxuEx0r8cxrLoGk5HHR+nnjQ/nQrdizRm764yAnvYw/dYqDe9zVIdtENf
         oD1mb7+7BzScZfqrPAjOm6MfVwNlV08n9+IqFX9/vX/B4oJUKaGTHWiBJMr4EilL+9K8
         wKk6yOH/ud5dh56uTfcJMm5Ic6M0BcvkyAIvnUN3t261nLANAE9ZfDXYkpCGu0BFNoG9
         QW6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MNyzur72;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m41si10167936edd.186.2019.07.14.23.19.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Jul 2019 23:19:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MNyzur72;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hmuKq-0000bj-HB
	for alex.bennee@linaro.org; Mon, 15 Jul 2019 02:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41970)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rashmica.g@gmail.com>) id 1hmuKn-0000bZ-6V
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 02:19:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rashmica.g@gmail.com>) id 1hmuKm-00022a-D0
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 02:19:37 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:44577)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rashmica.g@gmail.com>)
 id 1hmuKm-000221-4h; Mon, 15 Jul 2019 02:19:36 -0400
Received: by mail-pl1-x644.google.com with SMTP id t14so7726600plr.11;
 Sun, 14 Jul 2019 23:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CFwjRJeYEQbmwlpBaKx41zBl6UOTVPC5mwjWf/K53/A=;
 b=MNyzur721+wALYeata3oVOU4DM2DSgoLbHOSJ1dCl4t91JLAz6Ax25/uRqSo2uJoeF
 nNgoiEhwmnzmFFMtOmfKbXnvkvOhLSSLQ8wa9T01W/QjMrxXmuCOueINSYCE03K/2ww2
 Rx+Y60fiaLi3k2SSqNbRyD1FjsjxgxAYVUcdqWRT+ngqXTZmWae8tu0Y4gM1RueZilTj
 LgOGMsmspFnXUL7dfXawWM2o8IoABzJxvKZ4fM5FQhLX9cOZyYRvIzH/ysheO9oQJ/AE
 ax5pec6yJXmNALTg8Kyy/NTvaldSzveUjqFbw/R0O25pGGD0SZ79gP2FHlHVwYI52gdB
 dSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CFwjRJeYEQbmwlpBaKx41zBl6UOTVPC5mwjWf/K53/A=;
 b=Ny3Wc9lRb/avoJchh7C3wtfyyDZdxPfPz6c/cNa9/xUwAkI79l9eikU8pN8OgvWpFL
 9AwB/c7jQcgW08a0wuL8f0MjdA4E8Xud+kFWGM3CSeIaG4eljCDOacqMwgcqpqPTxfzN
 MQrlSSQt6lbi4LPM5SUaUPi3MiPu6qe1W/HhOqQrfzPXazYR24OUHY0jHW4qsJ/lXNBX
 0RCgjS4bVYNO8hDO46hDfCuNm1HKHRz1Pk8gUHeGuBxxFvnxqchbikQPc0DsZP1uBFPd
 JvqfReUylc4qBUAPXGSeBFJ7nENtt99pkDUfi3etnnM2u2i3BgUsgplJyu/AJwel3RKA
 0L0w==
X-Gm-Message-State: APjAAAWJMKAKt8dwu3/KZndCQ6uEE+ObkW6U8VoPnPanwLzxZtpuLVI4
 rg8DQ30hSREyIHtUck8ceCKBNfSz
X-Received: by 2002:a17:902:bd94:: with SMTP id
 q20mr15519408pls.307.1563171574978; 
 Sun, 14 Jul 2019 23:19:34 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 4sm20020018pfc.92.2019.07.14.23.19.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 14 Jul 2019 23:19:34 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 15 Jul 2019 16:19:23 +1000
Message-Id: <20190715061925.28030-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-arm] [PATCH 0/2] Add Aspeed GPIO controller model
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
Cc: peter.maydell@linaro.org, andrew@aj.id.au, qemu-devel@nongnu.org,
 clg@kaod.org, Rashmica Gupta <rashmica.g@gmail.com>, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z+c/5rYRE7Qp

Rebased on Peter's target-arm.next branch.

v2: Addressed Andrew's feedback, added debounce regs, renamed get/set to
read/write to minimise confusion with a 'set' of registers.

Rashmica Gupta (2):
  hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500
  aspeed: add a GPIO controller to the SoC

 hw/arm/aspeed_soc.c           |  17 +
 hw/gpio/Makefile.objs         |   1 +
 hw/gpio/aspeed_gpio.c         | 891 ++++++++++++++++++++++++++++++++++
 include/hw/arm/aspeed_soc.h   |   3 +
 include/hw/gpio/aspeed_gpio.h |  92 ++++
 5 files changed, 1004 insertions(+)
 create mode 100644 hw/gpio/aspeed_gpio.c
 create mode 100644 include/hw/gpio/aspeed_gpio.h

-- 
2.20.1

