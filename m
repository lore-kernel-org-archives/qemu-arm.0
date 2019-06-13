Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6961500wrg;
        Thu, 13 Jun 2019 08:50:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz4VYGRLQvYSgeuN3Yh1KeHzEWY5V0AyK7IPTR0W+0dY0lgSi1SDV0WT8PjJdleFq0cujKZ
X-Received: by 2002:a0c:adef:: with SMTP id x44mr4302419qvc.153.1560441005869;
        Thu, 13 Jun 2019 08:50:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560441005; cv=none;
        d=google.com; s=arc-20160816;
        b=dY9o0onO4m5vqO1g7OKiQk2lOuQjuXc81Uge+4hI5Iv6K9ErmVSDCDZacUdYUucImJ
         ZhqyNZzHizJAj5t8KAvTMijAhdx88pFqdKwhHhU5Frna3f670ww85CXdwHBEsTSu6J8b
         9BDKn8wmFgPS1ZsiUHa3m4r6ksOITU4GYRMxCDIou03cyIyYA6FdUVBhk747Fe7azaaI
         yyar9BKnSRxOfk9zhXUGWNzdILiOv52pLMt9JtQHIn4hCe5JrFOKvYYXlUbKmGuSOD+6
         rIrKXbi1ovETm5PvWPT9j3vCOWTB81HYv0uMqy+55Hv1Yy1uSrHC4md9mtZlq7ETI97d
         s88Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=l0K5KEQjVJUDYQD89OQeAZZUAdVtmWYufBhAs8yf588=;
        b=BNu5kVP36NtUgTBqQqeV6Pcb3D+Tzf22NdDGqxwbVzjynJ5NZG54SO50riRKK//38D
         zG7AV9P0lLq5it770lYyLTDjklA4ivBRCESVe+h41uPSyTCR0n9FfD6AlVCiPDHivpfW
         58QjZ6qnEc/pRrfQrSpyL47cdXJJCy7xjTb2RyFganhOpnFwLwzf70O1CBViRHybG4VM
         VqqR4ZBfslpbQBYThFPXQxsg2u/b1PuYF9tLur76RjZzRIkr2/iPl6wkNrJi62pdKMsA
         22DHBDCAbDHwilCPHuuTIfHUfuH7UtpjEOCWUEkmA1V6j7NlKykiaOC5Ul0H9gSoU8Qy
         PjzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f188si124691qke.127.2019.06.13.08.50.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 08:50:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41090 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbRzJ-0002oz-8I
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 11:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41238)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hbQml-000875-MN
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 10:33:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hbQmk-0007gk-0b
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 10:33:03 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37762)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hbQmj-0007d2-Pl
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 10:33:01 -0400
Received: by mail-wr1-f68.google.com with SMTP id v14so21035660wrr.4
 for <qemu-arm@nongnu.org>; Thu, 13 Jun 2019 07:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l0K5KEQjVJUDYQD89OQeAZZUAdVtmWYufBhAs8yf588=;
 b=FdA78EO8/OPg3ChdXwtzteZWmheQU8nQVo4P/8BewPyf7JkVkDURMrGVKspG13OCCA
 83uzEiNVO5w6y8b0O+8229GBHb2LGQRcv4zlcAZg1JHWxyVcmeK0fKWaKVF1Hi38tKkC
 9jAN8hFJ0mvKNPrEC5++GCBnF7iS1a4IknBcHcVu1wCTdueGYf5sWhM57LZU0CXihinX
 EiMaGpSc+NTjLNMtcOjqLhzJUGNUbS59MdHGyuJGR4aKX7uit9OUzinwG9WO8CkEV6iP
 cL2WPhLhwdI5q2MwvVE/HjCS0lqgOX07emZn1/EPo3Z3tXP5c2ga4OlCrbqtbYrB9O5U
 JHrQ==
X-Gm-Message-State: APjAAAV9Ie4dVYP+YxfVfC9hFlo4TGXMJJxhpzT6n2DkGxMd+OuHG4OK
 KFQ5s1V7BNf8TDMW6Qjg83exwg==
X-Received: by 2002:adf:ec0f:: with SMTP id x15mr60432910wrn.165.1560436380083; 
 Thu, 13 Jun 2019 07:33:00 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id d17sm4358853wrx.9.2019.06.13.07.32.59
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 07:32:59 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20190525151241.5017-1-clg@kaod.org>
 <20190525151241.5017-14-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <777b7a86-ce5e-d218-5848-c8f4b37a0bf4@redhat.com>
Date: Thu, 13 Jun 2019 16:32:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190525151241.5017-14-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 13/19] aspeed/smc: add a
 'sdram_base' propertie
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KgbxQMgiQAVc

On 5/25/19 5:12 PM, Cédric Le Goater wrote:
> The DRAM address of a DMA transaction depends on the DRAM base address
> of the SoC. Inform the SMC controller model of this value.

I'd reorder this one previous patch #16 "aspeed/smc: add support for
DMAs" where you start to use sdram_base.

Regardless,
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  include/hw/ssi/aspeed_smc.h | 3 +++
>  hw/arm/aspeed_soc.c         | 6 ++++++
>  hw/ssi/aspeed_smc.c         | 1 +
>  3 files changed, 10 insertions(+)
> 
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index 3b1e7fce6c86..591279ba1f43 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -97,6 +97,9 @@ typedef struct AspeedSMCState {
>      uint8_t r_timings;
>      uint8_t conf_enable_w0;
>  
> +    /* for DMA support */
> +    uint64_t sdram_base;
> +
>      AspeedSMCFlash *flashes;
>  
>      uint8_t snoop_index;
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 8cfe9e9515ed..65fbac896c85 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -326,6 +326,12 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>                         aspeed_soc_get_irq(s, ASPEED_I2C));
>  
>      /* FMC, The number of CS is set at the board level */
> +    object_property_set_int(OBJECT(&s->fmc), sc->info->memmap[ASPEED_SDRAM],
> +                            "sdram-base", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_bool(OBJECT(&s->fmc), true, "realized", &err);
>      if (err) {
>          error_propagate(errp, err);
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index f1e66870d71f..4ff12f7b27fc 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -912,6 +912,7 @@ static const VMStateDescription vmstate_aspeed_smc = {
>  
>  static Property aspeed_smc_properties[] = {
>      DEFINE_PROP_UINT32("num-cs", AspeedSMCState, num_cs, 1),
> +    DEFINE_PROP_UINT64("sdram-base", AspeedSMCState, sdram_base, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> 
