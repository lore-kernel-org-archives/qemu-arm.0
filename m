Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5080423lfp;
        Tue, 4 Feb 2020 00:54:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqxsrrofp8H5OBk0F9vIf9xwJcfsk0GdYdcRh6dg9XEAbsqAJyi70qHKdgla/HokZp2bojEK
X-Received: by 2002:ac8:4b7c:: with SMTP id g28mr27477562qts.180.1580806446112;
        Tue, 04 Feb 2020 00:54:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580806446; cv=none;
        d=google.com; s=arc-20160816;
        b=EXjI3NUOI3GHxHXgQWN9jPFPW+xWoP0Otv69WT0wBn62/CSZ3XmdvWqz6kR+ImuwZO
         +Od9hbC0QqBGBhouPdbIt043WjVcyHdhQtNDpPNRb3AB/PzbKxsWgVMAa0xU6IDbv2ti
         gMa0q7GhbMe/OlgSo1epcUZ6SlIQrzMEXTE3HJA+I3//XAvgevyjP2oEvSDu/LjjlGJ5
         kRYq+ziniteh0re3BCOZmsaxQLwicFsXsZSSPyS4tvwQ6L5NLdP/42PD12qVOHdD1voQ
         u6sPS0BZabHe5qarLSzr9g9XZ4kv5IuJaxTXp9EEqZlo6nBqV/InUEgp+PHTMsGjcuqP
         qO4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=OcIYiAZ3an/JlSSX7GsMFojgPdDRZ+5K+AUlVF0Eb28=;
        b=QJEwqwpYXxPhbJe8GhiEVXTVYeLQsV2zsHqg8JtxqJz7cq8dDmAm2ys7x8M2ipligN
         4lCoheI/Mcnubf5tEAEa1G/TMxMq3ndlZsiISE24EJiyl8HscHdNqL+2Dsl2BSxNiRuC
         RaP9EouKXRXOexB03u8A3H74di4Uhw5/46/2vldWyAUIOj+y4A8BYnd5R74cNydcG9Wr
         g16rln8RZYTDZDpD4i3BOFqRByP7XUsP9KCsmLjIHjPSZHGo5HEbfsJjsLHK2EeJTKTK
         clGsih+4UDut1Hrt6ugCdTaNPU7Fhdsiz0wCjAgg7BK5a5fveKg3E9v6N0kEZuxJGbIE
         9smw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16si317446qta.188.2020.02.04.00.54.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2020 00:54:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyty9-0007Sv-CE
	for alex.bennee@linaro.org; Tue, 04 Feb 2020 03:54:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36363)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iytxx-0007IA-Jl
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 03:53:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iytxw-00024q-FA
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 03:53:53 -0500
Received: from 2.mo3.mail-out.ovh.net ([46.105.75.36]:39113)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iytxw-00022g-9p
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 03:53:52 -0500
Received: from player718.ha.ovh.net (unknown [10.108.54.59])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id EF7E624061A
 for <qemu-arm@nongnu.org>; Tue,  4 Feb 2020 09:53:49 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player718.ha.ovh.net (Postfix) with ESMTPSA id D3E9AEDFDA9A;
 Tue,  4 Feb 2020 08:53:38 +0000 (UTC)
Subject: Re: [PATCH 2/3] m25p80: Improve command handling for Jedec and
 unsupported commands
To: Guenter Roeck <linux@roeck-us.net>,
 Alistair Francis <alistair@alistair23.me>
References: <20200203180904.2727-1-linux@roeck-us.net>
 <20200203180904.2727-2-linux@roeck-us.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <accf297f-0c54-7475-8817-c1014999a57d@kaod.org>
Date: Tue, 4 Feb 2020 09:53:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200203180904.2727-2-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 3538984882239867872
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrgeekgdduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejudekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.75.36
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4P31QdMVKByF

On 2/3/20 7:09 PM, Guenter Roeck wrote:
> Always report 6 bytes of JEDEC data. Fill remaining data with 0.
> 
> For unsupported commands, keep sending a value of 0 until the chip
> is deselected.
> 
> Both changes avoid attempts to decode random commands. Up to now this
> happened if the reported Jedec data was shorter than 6 bytes but the
> host read 6 bytes, and with all unsupported commands.

Do you have a concrete example for that ? machine and flash model.

> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/block/m25p80.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 63e050d7d3..aca75edcc1 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -1040,8 +1040,11 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>          for (i = 0; i < s->pi->id_len; i++) {
>              s->data[i] = s->pi->id[i];
>          }
> +        for (; i < SPI_NOR_MAX_ID_LEN; i++) {
> +            s->data[i] = 0;
> +        }

It seems that data should be reseted in m25p80_cs() also.

>  
> -        s->len = s->pi->id_len;
> +        s->len = SPI_NOR_MAX_ID_LEN;
>          s->pos = 0;
>          s->state = STATE_READING_DATA;
>          break;
> @@ -1158,6 +1161,11 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>          s->quad_enable = false;
>          break;
>      default:
> +        s->pos = 0;
> +        s->len = 1;
> +        s->state = STATE_READING_DATA;
> +        s->data_read_loop = true;
> +        s->data[0] = 0;
>          qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", value);
>          break;
>      }
> 

