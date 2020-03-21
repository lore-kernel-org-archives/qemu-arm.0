Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2058069lfe;
        Sat, 21 Mar 2020 04:59:23 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsS9suX9ozHxiGRTosIpnvjnxe2oq5B+VrIzdyQNJuX2MCjKM/zMEbDMibtF+YhcU1dRcmt
X-Received: by 2002:a37:b902:: with SMTP id j2mr12757078qkf.247.1584791963780;
        Sat, 21 Mar 2020 04:59:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584791963; cv=none;
        d=google.com; s=arc-20160816;
        b=aEhK60+uPou6uGH8L62kgRkuyK4AaA1uNGubI7g6ezkQ0Gdl8zFlISxcyky21U86Xd
         Yd49mOvUhQ7KI8+EidymUufA10nKVqszpMwXQVWeaecok3Vvs5/Q7dfRCeXFnTRu2DeV
         l5meImZuFZ5nyDDyMwjGJS/wtmLaYj+MJ89Tf6qO+sQeJbJSgsJB3fXJo67PC5SXWIfP
         xHa6pnbh8qQkouaF0dcKDjY8qxi69MTsD8dsjg93ah7aJkDcOjHwSUiQuYVLnv9JJLdZ
         HI8hMAXOBmjv1LIyyaTkTkWbbEp+Pc5cb3raVdvq9ecIdNjxNtANcmN1Qe7ySsLTosWI
         +b6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject;
        bh=UqQdgAcP5rxszFtcM/U67Tqi4JPU0Z4JlhH+vlRI2to=;
        b=axafD8tuZWPj3G4gU3PWkmyw93B6MYpMaez/hfc0AzB8nZtY45uSOoiUKAD9XIJVA2
         AxGcZ40ZKuXKHB8CBOJmFmRu+9MrjHKc9InVIXGcnrU0GO0QlDT7i1KukZEcsLz8+O3E
         wZEJVHn6uvNLR59t1J7VKWhG3NKzo1Kgp5c9vMkWouBVMR1reOXtMBoeoxYuFAnhouhb
         BrVUV0xQGph9WIgFeFH5RaTl+s9C2jFwKoBJwDiXtqeUTVzfJrIv87KKG/W2avc5ioRy
         jcqsuQ2RpFx94qGAuvmJvI3U7f0FoGe5jzeyXoTLiqGXWDhxr0QxSMgT0ySQzlAvUIqm
         cTZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m35si5438406qtm.329.2020.03.21.04.59.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 04:59:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFcmh-0003Cb-7C
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 07:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37332)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jFcmT-00037q-Ha
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 07:59:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jFcmS-0003c0-Gu
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 07:59:09 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:40429)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jFcmM-0003YL-9v; Sat, 21 Mar 2020 07:59:02 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MKKpV-1iyvtr0ohT-00LldD; Sat, 21 Mar 2020 12:58:28 +0100
Subject: Re: [PATCH-for-5.0 01/11] block: Remove dead assignment
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200321114615.5360-1-philmd@redhat.com>
 <20200321114615.5360-2-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <d58a82c0-7f6c-531e-bd95-9cb6fd830f17@vivier.eu>
Date: Sat, 21 Mar 2020 12:58:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200321114615.5360-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+uiKX6QWpN7iF84l+9CL8e26hii59L7usbLnsrwtVBT/STY3DwH
 ZJwHGtWVSQcXhGJB+RqTVItxdV4xQAGGKhm9AQP1g63odNEsbxkY0Zrl07+Rn2bWvqDIFMH
 piy0rkYUHLpjHvfYVgUuB6Ozo35b+PMpdH+IeCrGUijxXOvsnvgU3xm8dTLZRba1QsfFfDc
 By829q2ZDSZti8M/70v3A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:j69Mj2O4ou4=:y5DNDMV3ZRcjFCCc+NfPYf
 fL6x06NqAtzlq6V/pCRjy0qYTm/pY4Afp2D48jgv4WniQnu1sZ67OHgPjVRsSoDvqMix2aU76
 5Wfso9ezYLsg//wPhOVOhvQjVQZ++Q8JsI1UHRQj4lOtl7UHycWlR4jvOl3+g3jzzUP+tcdKJ
 mvb8ZtqgiGFj+vm7cYjZh4qw6JpLC6hxXb/LFFPCR67WVKoWV5QjKyjBA9bKgiFQnJds1fOd9
 3leIgsxBHThNKr/ZPe5qKACVxasme1oweW2vM7KOIx++JnjPurbXUtZS8jenADeJaHEn8DEzF
 cW7G6TCLvOFasUS8aLdX5XJp3gWTS8cOEi3Haxlfm3wX4natoidX6XnGlyVoED5tQYsdtiQqo
 iTWRieWnDU/XTelaxVJGwrLyzXCwMS+rEyq2f4mUBdU1nBAn/8M03lb5CRS0KxNvdLA0qlXlU
 raZTtQrTJlgRvtkZbjn7GEx3KIaSW4jMyEuQVfXiltjIoSUNAJLb9RJ07GW1PTixK4mVW6nDr
 Y5OtJBIAHyVA1XaWokzTJlGlByhqLOc7wS7VXNSGFRn9Pfr3s2zkiQaGuVFJ7GUdwSLsrhCKC
 /3oOjV7dnzv29lnDnFf9gQx8ZoEi68oiq0KvcTmiLmzNYacGI8AXbw4konXmd9BozT5HAuCZE
 nH/DU6N2rRL7vZ+HZMriRIq5tXPkZ+I8qLp6ld7lXuhqjQTMN1tQot3n6urDvQ0peAxFr9yIB
 aHPJtgnEhkKzbEWnMxy7LnrU10N03lvL1Et/Oevm1FX11L7jaAkZCzuCJw8vppseq7Jt6Ziko
 1RzviFVZDWMUOj2Jn6jf3vQxFs+3HtDRRRNMIFB0LJv3YMsKA3E4s0dA0gjVnEe+6i+DBKz
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Max Reitz <mreitz@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vRfA9YOJh9QS

Le 21/03/2020 à 12:46, Philippe Mathieu-Daudé a écrit :
> Fix warning reported by Clang static code analyzer:
> 
>   block.c:3167:5: warning: Value stored to 'ret' is never read
>       ret = bdrv_fill_options(&options, filename, &flags, &local_err);
>       ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  block.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block.c b/block.c
> index a2542c977b..908c109a8c 100644
> --- a/block.c
> +++ b/block.c
> @@ -3164,7 +3164,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
>                                      parent->open_flags, parent->options);
>      }
>  
> -    ret = bdrv_fill_options(&options, filename, &flags, &local_err);
> +    bdrv_fill_options(&options, filename, &flags, &local_err);
>      if (local_err) {
>          goto fail;
>      }
> 

I would be sruprised if coverity doesn't warn about an unused return value.

Thanks,
Laurent
