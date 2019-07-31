Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5814660wrv;
        Wed, 31 Jul 2019 08:48:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzXLQPLiWzRom+L8nBNvU3FZqrCyBuWnalmqq3S8uGthhndPnHEkBhR7pZ73ynijqFrlWVh
X-Received: by 2002:a17:906:684e:: with SMTP id a14mr96490800ejs.156.1564588117254;
        Wed, 31 Jul 2019 08:48:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564588117; cv=none;
        d=google.com; s=arc-20160816;
        b=apKvkqASlosIcRSC8+/M9rADsyVNhAFiHOHtu359B3YYBk9TtQf1D14D6A0qIVJYn0
         OtOEQOyLA9EFBTshcZpzU0idU1Uni4vv3fBnX5PXENqx9lVWUiX5pwHrsGWK3qu/089T
         DHlThTGST1A3BNOskvja/oYYp+0hgZo5mXkNMNMrqmZBdC4nkfOse0ZIA9WEwaJGGpTe
         s8YxvNx+gQxXGTd5FKyUskyj6yQn1+XA7YX/cslmPFVjSCuervAeYXBvtYSa6A3evFEV
         mWW8gk7HlTcgPBEQ1XFfQNaFXFBub6Q1T7sNnYtLX3EinGYJVce3SOF8SyleumUrz6tg
         /aow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=pzcNWa/SJdc37T0/PvsU8BfmBjul9DAml0FWlPMxRHc=;
        b=SbkYsmMB5zgeePAClqSwiuKyMn+K9SbWulWIn8+d0a/2mszWiQlNfYyzaIbcij9yb7
         xfmgrDJzkeWlFI4/WUuzy/NXEIbx7yPhTG68c5Mxq8XYQMt4rN00cTcnIZzIBaeznamP
         G6w6GteYxDldIU2rzukWIST++11sVWCyIocEGb4ECjTQlglOwp4Z/f51qybEiQnK1m5h
         bqs5GcqhrIMaGIfpVOTlpwfUjc82tGo6CACwWWbZ4J8p1ZbCsOAmE/p6fT5Hk2WumnLQ
         HZLqo5PE9hcrW7MYf2PCdEBcsAiCV6FXbSfpqjbmNK8qXTsIBcXI4x32HrhjzmNvF8DE
         h31Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z40si20681584edc.260.2019.07.31.08.48.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 08:48:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsqqC-0002ha-Cp
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 11:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35776)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hsqpx-0002ep-M7
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:48:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hsqpw-0007zf-0X
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:48:21 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55357)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hsqpv-0007z4-Pe
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:48:19 -0400
Received: by mail-wm1-f66.google.com with SMTP id a15so61347635wmj.5
 for <qemu-arm@nongnu.org>; Wed, 31 Jul 2019 08:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pzcNWa/SJdc37T0/PvsU8BfmBjul9DAml0FWlPMxRHc=;
 b=Glhc4wuR5eg96HR9540Ms5GDo64CmePOGrtohYEsuN2ZKvdrBnYDyHKDPXsgSPgUTJ
 dfSlEa6MN0g1tqc8cznUgvuyV1VmbYpcwRckfXXiKByvWs7SyBhK2/VZZVagCNHj0ziC
 K9FwDcfsnr1jTHzzHBQvIw43BaIXfI3qzgleTWtQwqueYBce0dlhB2zp2ShQ+kFEzXin
 qls6HTxTIvn0C/pNmhjBCoXK6siGPRthgnq5+IM75SUQiO4pIZPKDg3aluFCdGNTbZ5T
 FC9BeEWMzT8vbdO3S53YvlLCLtQMBQkIxWNTX0msy0N9vza43wWUZmJAXxr66mf1HlqX
 OkKA==
X-Gm-Message-State: APjAAAVIWjL6d5ChJ0sFol3eb8ZZb0LunCUUBRATKqvJdkFREsGeBnpj
 tjNAEuCZQ6OV2xXDIJmx3iUxdg==
X-Received: by 2002:a1c:7503:: with SMTP id o3mr109103266wmc.170.1564588098872; 
 Wed, 31 Jul 2019 08:48:18 -0700 (PDT)
Received: from [10.201.33.84] ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id v23sm60305500wmj.32.2019.07.31.08.48.16
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 08:48:18 -0700 (PDT)
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-20-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ea759e77-4514-ec00-3587-8dd3a50712bb@redhat.com>
Date: Wed, 31 Jul 2019 17:48:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190729145654.14644-20-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 19/33] hw/sd/pl181.c &
 omap_mmc.c: remove device_legacy_reset call
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 kraxel@redhat.com, edgar.iglesias@xilinx.com, hare@suse.com,
 qemu-block@nongnu.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, marcandre.lureau@redhat.com,
 david@gibson.dropbear.id.au, thuth@redhat.com, ehabkost@redhat.com,
 alistair@alistair23.me, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 clg@kaod.org, jsnow@redhat.com, rth@twiddle.net, berrange@redhat.com,
 cohuck@redhat.com, mark.burton@greensocs.com, qemu-ppc@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lLKmsMsCWC1i

On 7/29/19 4:56 PM, Damien Hedde wrote:
> Replace legacy's reset call by device_reset_warm.
> 
> The new function propagates also the reset to the sub-buses tree but this has
> no impact since SDState has no child bus.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  hw/sd/omap_mmc.c | 2 +-
>  hw/sd/pl181.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
> index 24a1edc149..3021e54b8d 100644
> --- a/hw/sd/omap_mmc.c
> +++ b/hw/sd/omap_mmc.c
> @@ -317,7 +317,7 @@ void omap_mmc_reset(struct omap_mmc_s *host)
>       * into any bus, and we must reset it manually. When omap_mmc is
>       * QOMified this must move into the QOM reset function.
>       */
> -    device_legacy_reset(DEVICE(host->card));
> +    device_reset_warm(DEVICE(host->card));
>  }
>  
>  static uint64_t omap_mmc_read(void *opaque, hwaddr offset,
> diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
> index 15b4aaa67f..a59ef7eb2a 100644
> --- a/hw/sd/pl181.c
> +++ b/hw/sd/pl181.c
> @@ -480,7 +480,7 @@ static void pl181_reset(DeviceState *d)
>      /* Since we're still using the legacy SD API the card is not plugged
>       * into any bus, and we must reset it manually.
>       */
> -    device_legacy_reset(DEVICE(s->card));
> +    device_reset_warm(DEVICE(s->card));

We need to define what is a sdcard 'warm' reset.

>  }
>  
>  static void pl181_init(Object *obj)
> 
