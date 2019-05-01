Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp5575668wrh;
        Tue, 30 Apr 2019 23:23:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzhtDRDbLuo8ugki057xlkkq8Flkd5MfRwsCJ//elqxOvYsCcY7PYbfQEzFTDtzEXfmSb1w
X-Received: by 2002:a1c:a945:: with SMTP id s66mr5749610wme.51.1556691802699;
        Tue, 30 Apr 2019 23:23:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556691802; cv=none;
        d=google.com; s=arc-20160816;
        b=mcquUJ3WEn6SRhg+dkirg2uiebvG/qY3RDLL+XIlwQxNLQWzskeMRcdmY4SxgjKF3s
         R7lYYNV9O9rolVs4g4ESlmIpcdBESJcTsUxFlDrRcfKocKmAfvQ4NfNVdLsTvLckOa0c
         hKwMGYa97oltKz2lDrCoNboayrLN+qKG6JRhqjDP8DyhFGdXKU0sF0X8vYa4LClT9KEr
         JIYzk99mfBeOD2qBNInBS6YQ1ra7vdabWQ8kgO5ZcgJyfoAp2u3iN+6gMqmR0o3dcdcy
         JNQJLqSrtk5K3QrM9uQoUu8dgEXwX2UbyhYAkiNdIp35UVwd9ZjcaXNUsVclX5Igfzyl
         ZMsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:from:date:references
         :in-reply-to:message-id:mime-version:user-agent:dkim-signature
         :dkim-signature;
        bh=uKda16IM9FDRMRzDgpVEPqEP9WXFgTYo5PX0l9kYPxA=;
        b=fruu51PQ0JQh8hQvDmtuM1ybA5x9paMPjUSnpuUzlXqn7iY9ub/8T+ExbAOduE3ksv
         pVvU3r8theJligAgNj3Uj6LNRLCjbAF9KGmKVNciBkYLdf8mik+4PTuisPQxjSmy5JDY
         nfgZfW6sCLIh1uFnG52WE59DHSYt2uaxNvasGpoVv1c1pphTSYfCoJ3IjUYPSVzWgDDj
         HwNwQJUTnSF6qLVif3vIvnaE5Jmd0QZrpa2IXtWNzEpKUxEsvwHfRcUr4SemG70C0rTn
         0wptBbCzEbYP+CqBN5rysquXQctdheAqasQcxzDJGi/g+kdNrlGUlsIb6/6at/mWR8dm
         YmIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=ZZIg2dUh;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=65HUKW1N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11si26556797wrv.53.2019.04.30.23.23.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 23:23:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=ZZIg2dUh;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=65HUKW1N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:37663 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLieH-0003vy-NT
	for alex.bennee@linaro.org; Wed, 01 May 2019 02:23:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1hLidy-0003qQ-6C
	for qemu-arm@nongnu.org; Wed, 01 May 2019 02:23:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1hLidv-0004rO-5E
	for qemu-arm@nongnu.org; Wed, 01 May 2019 02:23:02 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:45457)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1hLidu-0004qB-Rb; Wed, 01 May 2019 02:22:59 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6447623A3E;
	Wed,  1 May 2019 02:22:57 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
	by compute4.internal (MEProxy); Wed, 01 May 2019 02:22:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm2; bh=uKda16IM9FDRMRzDgpVEPqEP9WXFgTY
	o5PX0l9kYPxA=; b=ZZIg2dUhIPEST3WUoPDVvmveSLCIcT4Yoz7EdYyvaamrP24
	3HIsq/5Dpv8+G8OMHp1L4vJNdV/8zkz1koRoyqp+q4et1Kx4+xJwD23QMUG3SH1Y
	Gq/IWfWAfgAAxLQd8ShOaeLf/nuhxHd8ZJu2jiVL2E86avwL37lEduak7P+pFMwi
	e6F8YpxQdor4n//C3f+4cA48ShR4mnfirXhIZrxDwVPCejYLI0NwGhAsxK9r8Ulv
	zuS6pzdjhDUmSUqFa1Gs+uVJ3y5T05GiMLX2NrkYIu11baOLda61sfCUBSwh9CdX
	jyzrW71b0CvSmP8ORAHzwCU+wRm2xmMzIWD4bAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uKda16
	IM9FDRMRzDgpVEPqEP9WXFgTYo5PX0l9kYPxA=; b=65HUKW1Nv7sXfNBQMyPw1Q
	4I5WVLDThrIM3rp7g/TZ9M684WtclwsfxeCKs0e4CJhfwy4arxD0HJVl3jsK+3B9
	pC6l4P1CWfGHAocAGQ3PkB5NZcF2b6zbahNsfXe8+7uoamHNSwx/DBiRzAMuXpj8
	XRg/10XKMwwrZLyss8qgwOtHDNAhMcU63dQWGj9exmz6VyPNXembMQLaY7poY9lU
	6noGM6R2o66FKKX50ijFYE1s9q33pgn2GyZPmRcAXcqqaDaUKtpkdLyT5yN9mrHQ
	bICEXonVTQJWVWmLPyDRbbs+IMo6W0ZgBQCd6vHc4bnK7K/3QQBmcPe7M9WS4Bmg
	==
X-ME-Sender: <xms:QDvJXFtB8TDD3K8BuPkqnc7ekMg5yoSfCFnfr5hX9KfaO94YwXDrjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieeigddutdelucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
	rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
	grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
	rhfuihiivgeptd
X-ME-Proxy: <xmx:QDvJXDufU9DfWF4xsg-clHz6wE9Xb6ZnvygCzY-_U-JiLZJd_tH3Aw>
	<xmx:QDvJXKdtoaEPIaDGwNR9uuoao_iORJhy7iyXDzAg1RcmGzmxa-miXA>
	<xmx:QDvJXEawfPbg6R6BEvkzanCcKtcb4a3ZfMtlj2eNlglJwA7rQuX-_w>
	<xmx:QTvJXJRQ8fNjkdnAbCVw85BgXdKIRaeHOwWN-RowgGIteE-Fo51Btg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3B6327C199; Wed,  1 May 2019 02:22:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <895f9fb0-7969-4534-ab0d-17d461b70dea@www.fastmail.com>
In-Reply-To: <20190501061827.23080-1-joel@jms.id.au>
References: <20190501061827.23080-1-joel@jms.id.au>
Date: Wed, 01 May 2019 02:22:55 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
	"Peter Maydell" <peter.maydell@linaro.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.27
Subject: Re: [Qemu-arm] [PATCH] arm: aspeed: Set SDRAM size
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vG380HoWmVy0



On Wed, 1 May 2019, at 15:48, Joel Stanley wrote:
> We currently use Qemu's default of 128MB. As we know how much ram each
> machine ships with, make it easier on users by setting a default.
> 
> It can still be overridden with -m on the command line.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  hw/arm/aspeed.c         | 6 ++++++
>  include/hw/arm/aspeed.h | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 1c23ebd99252..3f3d4162b3c5 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -331,6 +331,8 @@ static void aspeed_machine_class_init(ObjectClass 
> *oc, void *data)
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
>  } AspeedBoardConfig;
>  
>  #define TYPE_ASPEED_MACHINE       MACHINE_TYPE_NAME("aspeed")
> -- 
> 2.20.1
> 
>
