Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBFFC61DD6
	for <qemu-arm@archiver.kernel.org>; Wed,  2 Sep 2026 05:51:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1drx-0002TH-AK; Wed, 02 Sep 2026 01:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1x1drt-0002QZ-Ur
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 01:50:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1x1drs-0001Kh-2n
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 01:50:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788328238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5V3VTwlHkDJgpuVX0x3VwKDkCg354JodP2TSVjJ1Kog=;
 b=ZGQYqbHjXCHVyCRFIqZnIrTQLVFlrrTHptQTARtXXOhS2cD1CwfnX3PEeRtEtnbu4LbYsR
 FxZV5Zk61Ewr9tB41J0U6YUXFK8jGUzdSAxAOoSEjJZ5wNRkpI124ProzLrVc+MDuIuYsN
 Q66OvQrAkmYWLFx4zlYZNCe+BVOUBNA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-CyW54b7kNOugwSRySpL9Zw-1; Wed, 02 Sept 2026 01:50:36 -0400
X-MC-Unique: CyW54b7kNOugwSRySpL9Zw-1
X-Mimecast-MFC-AGG-ID: CyW54b7kNOugwSRySpL9Zw_1788328236
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-49cd83ca361so6676635e9.1
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 22:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788328235; x=1788933035;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt
 :content-language:references:cc:to:subject:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=5V3VTwlHkDJgpuVX0x3VwKDkCg354JodP2TSVjJ1Kog=;
 b=IdUCckiT3w1Xy2NsvDhF+xFuWBOuGVaYRygLjC/5T/ZZY0pT9JlHOSCMedUDnLprrL
 NCkEIYZcMbBvEMd91cahCy2ZXeFjrbybzYWSYNikhLWpKVa1y311P6aBQXUcTe5Q1Y+6
 ZU97E2gasI8YfhH0lK+bGtPI8u+w/rg+UsZjjfXtD22GozJ7m1fjfoufg/Xu6z3PqGxO
 XXSYDLeZ2tf0xteF+0jnhq7gbvD7hlO+31xTvk0JHhmwyMKHhjqJ8ub5EUnxsa4CZxYe
 7GCS3atIf2joflFC5+a7ef7Kkr1ZRm6s6P6PGzWE3KWVs8sMAsRPijLQOqG55tFw9v0/
 7SFw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp3aUac0AOeBVqORIDrFA7w7Le4oH03W0UjgkgjPaX9QrEju04TOiLmSIlILYUPSaedbuGI85rQ6g==@nongnu.org
X-Gm-Message-State: AFuF++lLLkCzpytvY+2GWxtYmeNdfSrbOI2NDoQTPUSCxwdGsO4wOtCF
 MYlcSSi7VCVs8IBU1JX/WUw8Ax8Bd80GMzpnYjtXtlyYM1VkDhEilxnWZK6o6hzMUnIeo5pXntF
 rtsIlFa1t0Z5qjspov92yCIspdvyUDFpkttyrgozomPc7SLE23XeQESc7jKFVcQ==
X-Gm-Gg: AR+sD13XfqBhE0iZRuO1drTBmjIh9+0ynCe2jhQTVH5Q5tZ4307bi0bq4gNpQLH9YJi
 BPBFCSXchCu7stItIU3oR9frpDaYKRFC3JKyH2aFFLGzd6P8x3rH3vlik+OW5LsadvorNrpBFZ6
 HS7t6YmDQ+VGSANbhvy8afIh4caq6Adbs5DEW/7d4NdzcoXk+OHxkG56TpW3uFMObMQmA4I7G+Z
 ayhPu23A8RYxgWxMSVwcEem+swhW6WbQ4TOKhB2FtcPBgcDpYRly2ja4Bd5Xf46gMrLeF02rlA4
 PZvbrVklTz2hkCMp1chIAq10X8TO2GfR39kH2DR0FDshxi8ShfwEC1MPyYjw6KlZxch6h/ceo6l
 oP0JKGzM9y02MXyjW8vK87/RqT37/dA0OBOMXkSY=
X-Received: by 2002:a05:600c:6388:b0:49b:916f:1471 with SMTP id
 5b1f17b1804b1-49ce55effa0mr36566595e9.3.1788328235480; 
 Tue, 01 Sep 2026 22:50:35 -0700 (PDT)
X-Received: by 2002:a05:600c:6388:b0:49b:916f:1471 with SMTP id
 5b1f17b1804b1-49ce55effa0mr36566055e9.3.1788328234988; 
 Tue, 01 Sep 2026 22:50:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:2cd2:7ace:8238:f7f4?
 ([2a01:e0a:280:24f0:2cd2:7ace:8238:f7f4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce10153sm130954715e9.4.2026.09.01.22.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 22:50:34 -0700 (PDT)
Message-ID: <1d08459d-9feb-435b-9c93-62da53c15f91@redhat.com>
Date: Wed, 2 Sep 2026 07:50:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Subject: Re: [PATCH v2 15/25] hw/arm: fuji: use the real TMP75 and LM75B
 temperature sensors
To: Emmanuel Blot <emmanuel.blot@free.fr>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Emmanuel Blot <eblot@meta.com>
References: <20260731-sanmiguel-bmc-locator-v2-0-1266926ba769@free.fr>
 <20260731-sanmiguel-bmc-locator-v2-15-1266926ba769@free.fr>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20260731-sanmiguel-bmc-locator-v2-15-1266926ba769@free.fr>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GeaSsn2LhP6fewpowdbPV6o0o9h374tE4qGGxTbUGpM_1788328236
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/31/26 12:45, Emmanuel Blot wrote:
> The Fuji BMC instantiates many ti,tmp75 sensors and several NXP LM75B
> sensors; the original board code approximated both with a plain TMP105
> via local TYPE_TMP75 and TYPE_LM75 aliases (the latter mislabelling the
> LM75B parts as LM75).
> 
> Now that hw/sensor/tmp105.h provides proper TMP75 and LM75B models, drop
> the local aliases (and their guards) and instantiate the accurate
> devices.
> 
> Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
> ---
>   hw/arm/aspeed_ast2600_fuji.c | 22 +++++++---------------
>   1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast2600_fuji.c b/hw/arm/aspeed_ast2600_fuji.c
> index 6dc3535f0c..fe0c294e14 100644
> --- a/hw/arm/aspeed_ast2600_fuji.c
> +++ b/hw/arm/aspeed_ast2600_fuji.c
> @@ -15,14 +15,6 @@
>   #include "hw/sensor/tmp105.h"
>   #include "hw/nvram/eeprom_at24c.h"
>   
> -/*
> - * Guard the aliases against the TYPE_TMP75 that hw/sensor/tmp105.h now defines;
> - * TYPE_LM75 is guarded too for consistency (no LM75 model exists yet).
> - */
> -#undef TYPE_LM75
> -#define TYPE_LM75 TYPE_TMP105
> -#undef TYPE_TMP75
> -#define TYPE_TMP75 TYPE_TMP105
>   #define TYPE_TMP422 "tmp422"
>   
>   /* Fuji hardware value */
> @@ -63,8 +55,8 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
>           get_pca9548_channels(i2c[40 + i], 0x76, &i2c[80 + i * 8]);
>       }
>   
> -    i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
> -    i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4d);
> +    i2c_slave_create_simple(i2c[17], TYPE_LM75B, 0x4c);
> +    i2c_slave_create_simple(i2c[17], TYPE_LM75B, 0x4d);
>   
>       /*
>        * EEPROM 24c64 size is 64Kbits or 8 Kbytes
> @@ -74,15 +66,15 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
>       at24c_eeprom_init(i2c[20], 0x50, 256);
>       at24c_eeprom_init(i2c[22], 0x52, 256);
>   
> -    i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x48);
> -    i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x49);
> -    i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x4a);
> +    i2c_slave_create_simple(i2c[3], TYPE_LM75B, 0x48);
> +    i2c_slave_create_simple(i2c[3], TYPE_LM75B, 0x49);
> +    i2c_slave_create_simple(i2c[3], TYPE_LM75B, 0x4a);
>       i2c_slave_create_simple(i2c[3], TYPE_TMP422, 0x4c);
>   
>       at24c_eeprom_init(i2c[8], 0x51, 8 * KiB);
> -    i2c_slave_create_simple(i2c[8], TYPE_LM75, 0x4a);
> +    i2c_slave_create_simple(i2c[8], TYPE_LM75B, 0x4a);
>   
> -    i2c_slave_create_simple(i2c[50], TYPE_LM75, 0x4c);
> +    i2c_slave_create_simple(i2c[50], TYPE_LM75B, 0x4c);
>       at24c_eeprom_init(i2c[50], 0x52, 8 * KiB);
>       i2c_slave_create_simple(i2c[51], TYPE_TMP75, 0x48);
>       i2c_slave_create_simple(i2c[52], TYPE_TMP75, 0x49);
> 

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


