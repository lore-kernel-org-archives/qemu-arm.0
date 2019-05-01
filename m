Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp6007257wrh;
        Wed, 1 May 2019 08:28:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwlWupttRgxzlogf2imGy8Phj1Fqx2++h4l3Waci0WrWnJzLLhO7Oq7aYbIsLE2EWsdnEd8
X-Received: by 2002:a5d:4712:: with SMTP id y18mr10637778wrq.23.1556724511021;
        Wed, 01 May 2019 08:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556724511; cv=none;
        d=google.com; s=arc-20160816;
        b=hvGMJWF4EPgdrg4SMTl4DqonhzoNZrpk8mw1+U40np8R6rOSLiaFmhD+06iTy2Z8Zo
         dQJw4OE1OuSmGu50BjmVi4HSo/hs7VBpLA/Bj8aFWXMUOPNhesxnAmb5jgKcQZBcGa62
         UA3A6/fVIbj6lmhLWh0hds62GL04r4Bp2zu2O0xs347xS+6QW2phJhgn22L80F3CWHDJ
         86X50ggVLPL+mcsgUTcFYDc1GsHz2BSvOa5MQD+ABCVIHXroWbQ4DQ7K7zJQgEggJYzm
         c0ciCCHFAkofML1wavW/IqN+e2LV6N3xUWA9zYlNnR/QHS2XXxxqTnZUhWO5lPXb1tII
         zg6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=vYVmVYy7BldxU4o4Q8j6mO0Qc0R9/TpLi5L2SjUSFR0=;
        b=oi4j5WJVeGln6rWv9TFwjFMBSWV1wxikTLu3vPSDze4FruE0uxVKevP6A5Y0wdf8qv
         5urEvyL17x/BWpfeowKS0ILY32glUNEPECCF0q+Z5bcFBpZjBWFl5V/cbwGKFTvR11sc
         KMaQAgXk3WRsmf91u/28QsZmCeCoQeTcsUbJcLWPzqtRooCEvRSRU/b7uEIounTV0c8Z
         YE+mhQqBsVyUemYfW6qxCMz/v0mvp7fsnuq4ZSBEEfGgCe9M/0BBW3wUEf1q0ahP2MNq
         aEZe/YaYm33CWUA5pE825wRTuu1Bb/RlJm3l1rWVNSVyP3WCX6v+UyAbUyabmSk1+lU9
         NPHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si3331562wmu.10.2019.05.01.08.28.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 May 2019 08:28:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:32933 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLr9q-0006Ox-5J
	for alex.bennee@linaro.org; Wed, 01 May 2019 11:28:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLr9b-0006NK-FK
	for qemu-arm@nongnu.org; Wed, 01 May 2019 11:28:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLr9Y-0002lM-B7
	for qemu-arm@nongnu.org; Wed, 01 May 2019 11:28:15 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42828)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hLr9Y-0002kn-5D
	for qemu-arm@nongnu.org; Wed, 01 May 2019 11:28:12 -0400
Received: by mail-wr1-f65.google.com with SMTP id l2so9318734wrb.9
	for <qemu-arm@nongnu.org>; Wed, 01 May 2019 08:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vYVmVYy7BldxU4o4Q8j6mO0Qc0R9/TpLi5L2SjUSFR0=;
	b=jAiLlaOcnZK4BxHpe7hIRi5TadyB4PlPYRyHOMS1q1XCfjmmeBsNy3PccKyXsOCG90
	ZrK1yjDw1erhaU7amuIW6CrKN570nzuAabDiFAHvjktkscBO1K3iIX3vnab4SMqzB0Hn
	2ywnjrABiDacHBhclvhpy4JCJiPVgXrEESPDxRffBQ5wHjbZruzv3lA60MV41VdI3UiF
	zlWeAcKDHWTUCFRu2gjfPF8sDG0k781AmbRJVVAqwoE5Aa7FVZUSPeuIJR1cPJ2YrNR7
	7j8BJriM9XceiMHBRDM4UDcAdCGQS6ce1+v2HbnuRdqoOf7i09dwyyxOZxhu6EblwP8m
	DJ7w==
X-Gm-Message-State: APjAAAWJY7qzPGnoMNO9Pm4pzcimO4jy8dlZwfu3Gu+fvXPKlQdk0oIK
	Gr7Pc7gHvXKYSjSpd73ggxmmkA==
X-Received: by 2002:adf:a318:: with SMTP id c24mr2879129wrb.138.1556724490988; 
	Wed, 01 May 2019 08:28:10 -0700 (PDT)
Received: from [192.168.1.37] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193])
	by smtp.gmail.com with ESMTPSA id f6sm2011856wmh.13.2019.05.01.08.28.09
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 08:28:10 -0700 (PDT)
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20190501061827.23080-1-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <2f92e14a-28f7-3c03-8fb8-ca2a0c407cc0@redhat.com>
Date: Wed, 1 May 2019 17:28:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501061827.23080-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] arm: aspeed: Set SDRAM size
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VIcVZP3W0kKw

On 5/1/19 8:18 AM, Joel Stanley wrote:
> We currently use Qemu's default of 128MB. As we know how much ram each
> machine ships with, make it easier on users by setting a default.
> 
> It can still be overridden with -m on the command line.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/arm/aspeed.c         | 6 ++++++
>  include/hw/arm/aspeed.h | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 1c23ebd99252..3f3d4162b3c5 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -331,6 +331,8 @@ static void aspeed_machine_class_init(ObjectClass *oc, void *data)
>      mc->no_floppy = 1;
>      mc->no_cdrom = 1;
>      mc->no_parallel = 1;
> +    if (board->ram)
> +        mc->default_ram_size = board->ram;
>      amc->board = board;
>  }
>  
> @@ -352,6 +354,7 @@ static const AspeedBoardConfig aspeed_boards[] = {
>          .spi_model = "mx25l25635e",
>          .num_cs    = 1,
>          .i2c_init  = palmetto_bmc_i2c_init,
> +        .ram       = 256 << 20,
>      }, {
>          .name      = MACHINE_TYPE_NAME("ast2500-evb"),
>          .desc      = "Aspeed AST2500 EVB (ARM1176)",
> @@ -361,6 +364,7 @@ static const AspeedBoardConfig aspeed_boards[] = {
>          .spi_model = "mx25l25635e",
>          .num_cs    = 1,
>          .i2c_init  = ast2500_evb_i2c_init,
> +        .ram       = 512 << 20,
>      }, {
>          .name      = MACHINE_TYPE_NAME("romulus-bmc"),
>          .desc      = "OpenPOWER Romulus BMC (ARM1176)",
> @@ -370,6 +374,7 @@ static const AspeedBoardConfig aspeed_boards[] = {
>          .spi_model = "mx66l1g45g",
>          .num_cs    = 2,
>          .i2c_init  = romulus_bmc_i2c_init,
> +        .ram       = 512 << 20,
>      }, {
>          .name      = MACHINE_TYPE_NAME("witherspoon-bmc"),
>          .desc      = "OpenPOWER Witherspoon BMC (ARM1176)",
> @@ -379,6 +384,7 @@ static const AspeedBoardConfig aspeed_boards[] = {
>          .spi_model = "mx66l1g45g",
>          .num_cs    = 2,
>          .i2c_init  = witherspoon_bmc_i2c_init,
> +        .ram       = 512 << 20,
>      },
>  };
>  
> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
> index 325c091d09e4..02073a6b4d61 100644
> --- a/include/hw/arm/aspeed.h
> +++ b/include/hw/arm/aspeed.h
> @@ -22,6 +22,7 @@ typedef struct AspeedBoardConfig {
>      const char *spi_model;
>      uint32_t num_cs;
>      void (*i2c_init)(AspeedBoardState *bmc);
> +    uint32_t ram;

default_ram_size is of type 'const ram_addr_t', can you use the same
type here?

>  } AspeedBoardConfig;
>  
>  #define TYPE_ASPEED_MACHINE       MACHINE_TYPE_NAME("aspeed")
> 

Using macros from "qemu/units.h" as suggested by Richard:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
