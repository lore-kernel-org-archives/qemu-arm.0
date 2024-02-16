Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1368410ejb;
        Fri, 16 Feb 2024 09:15:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXDQzK6/T8WKFO4ngnkkp7GGYqk4dDd9hIazhR+gE1pEu2Yk7vTId9/r4NfU5+hIfq82o3s+gerlzLjrKtS8BN1I/KlXiX6
X-Google-Smtp-Source: AGHT+IEpHRvpsJP+6lDoZqiQirAgGmI+Po8sSPNb/hDaD5Zg46lu/MW59CBBWAsC2mDwH6e2ZQrb
X-Received: by 2002:ad4:5cab:0:b0:68f:3ae9:284 with SMTP id q11-20020ad45cab000000b0068f3ae90284mr1818747qvh.14.1708103712049;
        Fri, 16 Feb 2024 09:15:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708103712; cv=none;
        d=google.com; s=arc-20160816;
        b=vskUG7J8zES/i4C80DJY3/vh+RqRgLqIgHwx1OSdvUzQdfXwYQHmpi9aqN+lsTvUKi
         67wX1NChMlsCXfzW8kg85s/xuzuQRkEjnoYgvMdRGjhIJ/tyQT7UzRMqSQ5VtkK/+uWU
         z4Gh4NpvmgcLF2wkw3UtNMnf8EMw4CqerD+MclWQmWC6KxfksGxy+kHZCRC48oROU9Z4
         m+nAfOEbAvGMzSQAvC4b6kgIfzdyrP8oOwf7yXKNANou5SQJ6twpIcVWw3BRlPVO7J74
         BbXFU9nDDopKNBbME5yeKpou7VYlINdQMB+GnqPY77ySAr4dZ32NR5cDhlg3xDKFchcn
         6PvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=k6m8v1SdCSop3w31B/Y9UzWD/cFci8vMTBo+2bO6XH8=;
        fh=d8nWeoF+r/mAWsaUvSrt56EaLlktWIg/I62oH1P65Ss=;
        b=d+4iZBomb4gwosTVoBYGxqcYf37ekcmxErj8VX4BVObP9uhmMFZqfdiA6GVgKL/61V
         ldDdHPVSWAYQ7rrUSV+T2RzQFPJSXpmpE6SyAHU05u0Utj4cJDrHigvEBJ2VAzt4eVYs
         ecA9h2j6xY/hDm1tXQTsorJSmhYmLgmE6FrGtn836GDZB+qVPS5j9V+ZVABOHS7ixp6E
         3wlrwTRxKGRwOPGyemjWdPZhU+W21uBS60UJdyA1OwOoyM32KTTKO0u+n5nnmVzYTUAK
         jG723ZRA/7sC6uFchJiNR0MqZfXnaazWtJ0A9G7ITcOhlDDdhocYgv/6YKSHGTZ/o0Dg
         59dQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6-20020a0562140ac600b0068c64a838b8si186087qvi.417.2024.02.16.09.15.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 09:15:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rb1nL-0003sw-6L; Fri, 16 Feb 2024 12:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1rb1nK-0003sj-Cp; Fri, 16 Feb 2024 12:14:38 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1rb1nI-0002p5-24; Fri, 16 Feb 2024 12:14:38 -0500
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 5C6E74E602C;
 Fri, 16 Feb 2024 18:14:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id EYdyYLLXg6O4; Fri, 16 Feb 2024 18:14:28 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5FF054E601F; Fri, 16 Feb 2024 18:14:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 5AD457456B4;
 Fri, 16 Feb 2024 18:14:28 +0100 (CET)
Date: Fri, 16 Feb 2024 18:14:28 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org, 
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
 Igor Mitsyanko <i.mitsyanko@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/6] hw/arm: Inline sysbus_create_simple(PL110 / PL111)
In-Reply-To: <20240216153517.49422-2-philmd@linaro.org>
Message-ID: <bcfd3f9d-04e3-79c9-c15f-c3c8d7669bdb@eik.bme.hu>
References: <20240216153517.49422-1-philmd@linaro.org>
 <20240216153517.49422-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-368854593-1708103668=:41653"
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Y6jnwQCISPi1

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-368854593-1708103668=:41653
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 16 Feb 2024, Philippe Mathieu-Daudé wrote:
> We want to set another qdev property (a link) for the pl110
> and pl111 devices, we can not use sysbus_create_simple() which
> only passes sysbus base address and IRQs as arguments. Inline
> it so we can set the link property in the next commit.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> hw/arm/realview.c    |  5 ++++-
> hw/arm/versatilepb.c |  6 +++++-
> hw/arm/vexpress.c    | 10 ++++++++--
> 3 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
> index 9058f5b414..77300e92e5 100644
> --- a/hw/arm/realview.c
> +++ b/hw/arm/realview.c
> @@ -238,7 +238,10 @@ static void realview_init(MachineState *machine,
>     sysbus_create_simple("pl061", 0x10014000, pic[7]);
>     gpio2 = sysbus_create_simple("pl061", 0x10015000, pic[8]);
>
> -    sysbus_create_simple("pl111", 0x10020000, pic[23]);
> +    dev = qdev_new("pl111");
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x10020000);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[23]);

Not directly related to this patch but this blows up 1 line into 4 just to 
allow setting a property. Maybe just to keep some simplicity we'd rather 
need either a sysbus_realize_simple function that takes a sysbus device 
instead of the name and does not create the device itself or some way to 
pass properties to sysbus create simple (but the latter may not be easy to 
do in a generic way so not sure about that). What do you think?

Regards,
BALATON Zoltan
--3866299591-368854593-1708103668=:41653--
