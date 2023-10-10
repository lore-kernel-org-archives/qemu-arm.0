Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp383636ejr;
        Tue, 10 Oct 2023 12:59:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/dGG4+fM/0Vc60RhKkOj57xUnTFZoyjIPnWFbx08hus2N1Dp9zGV333zVlzs3VmI93G45
X-Received: by 2002:a0c:e246:0:b0:658:95a9:ac21 with SMTP id x6-20020a0ce246000000b0065895a9ac21mr19437557qvl.55.1696967957405;
        Tue, 10 Oct 2023 12:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696967957; cv=none;
        d=google.com; s=arc-20160816;
        b=xicTqeRWjrrye8vb5LPjcm6/ZPxgf2tf5f3XhU7zyzbcoPqA79stEaG9rh5l4pe6SG
         u9ATa1EeCQw0a7M3orlCjO+pOwohQaZcXZpep/wKGtcf+pEmTEBeQ0uscSQ/jDw6p2mf
         zSE2+NiPuBlz7ikKW7DfQ4Wh3Ue074TwcbTjxSDcF+UKfQquxt0ik9D3f4LJ42j9EaD2
         UW0FfxNi4sVLUpAUz7Kvp+EVy6EhpdBTDS2cCGIxCTraJplNf7pzD/IrDY8euJEjXs+U
         9WLomjdWyeySoiFA2HUO4maD7Ecg2kHnwLB7P0149ehmm8SxLUkQys2ooSmYlgphS+OY
         zWXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=y/6BAh7ud0pNgKMELL0qTlq/ZnodbuBuz18Pp3vT0/U=;
        fh=8X1NYvoyFvn2kZ+FNQuUi6D2I3WFxrXGorAlGSv6/+E=;
        b=yuREpb1Afw3YS+uUY5+N/xuPBmw/7HsM2GrjiVkrq6w3vvWvp+lisY5Zj1J/aMYPC+
         2rGz9hvuE5zSI6RF32Uqz0TmL6N1abuIAM5AkjWypyWX1M8Xz6li4nCERX4bDZbJUYxe
         iqFlH9L62xq26oD65kNO9+wfUHzurYI82yWl55yGWUMplYwxJOr8xHAbD5heZ3bNlcV+
         QpBgqGckgPi6nZIbxRTciUou1c5LIj3ruy7uL/ATrurcI2K+TLo8sbPMbCjBUu3D9ZVW
         9LPT/s2jrighn8zqVV45qmopfavZSFGbWO8BYdPWjMjZ7/R3J4BOpCOcngplGMDp2imd
         mWAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OfZtnbNj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11-20020a0ce34b000000b0065b20aeaec8si8142728qvm.194.2023.10.10.12.59.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 12:59:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OfZtnbNj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqIso-0000nS-HO; Tue, 10 Oct 2023 15:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1qqIsf-0000kR-D2
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 15:59:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1qqIsc-0005pd-LB
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 15:59:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696967935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y/6BAh7ud0pNgKMELL0qTlq/ZnodbuBuz18Pp3vT0/U=;
 b=OfZtnbNjoFqhnG1NiWnhpY/5tWtJRdsYcTMGpY8BcfPnzxlpurby7WU/cWhETkwE3Zr7gR
 X96MtN4hK7aofZpHK47ks+hINFjl7/j5jlaWJh7xh1qkXr/DD6TvffzfjWwh5GQTDCxG9h
 K4hR5EJpPJCfGW30GdVCIu4dSJI7O9E=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-qzMwCf--PiWKgAjphvrmpw-1; Tue, 10 Oct 2023 15:58:54 -0400
X-MC-Unique: qzMwCf--PiWKgAjphvrmpw-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-41977b9970dso71751491cf.3
 for <qemu-arm@nongnu.org>; Tue, 10 Oct 2023 12:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696967933; x=1697572733;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y/6BAh7ud0pNgKMELL0qTlq/ZnodbuBuz18Pp3vT0/U=;
 b=fJ6xFM5IepwEhbN/aEsscfO1htzRwv3FzAsmZAbOh6TfQwZNtfPAeMK2b/UMTIQZjy
 lHJoOhhZkn4dz7Larq00QiuxnxAU+LuV/NEEGfEUjqkIUrNSmbQxhddK8eIJkdYR9iuh
 nY89HxhXjjbjcC5Bo8MyRMuQh4J0zlCf58I391+JXroTdtQdxxOw02aRkXMjgJXZl9Iy
 Qe03QjLb1AR6/7vHn8J9e7GfRy05aOQofYWhQiReeEh+BLsp/sdMQXo9S4CT+06/9obC
 Vgj4dcDTCy82ys5t61Kpwaj6aOX4RdwIuCbiOD7gdizzc61gHQX+cOZ9W9GT61U0nYYU
 6CiQ==
X-Gm-Message-State: AOJu0YywkERuvuVdjCrlW7dyrR7+ILVJ6OcOaP7PumN7SJwLjsW7FUNt
 hruS6wI0B2cZGVhFSkx/7Kpz59gHvwZRlo3RKWy5hzzg+uYl3529lfVqboeLo/MwFYNkd9o3r9D
 JlLBZRs4k9gzI
X-Received: by 2002:ac8:7dcc:0:b0:417:d865:8295 with SMTP id
 c12-20020ac87dcc000000b00417d8658295mr21983296qte.66.1696967933634; 
 Tue, 10 Oct 2023 12:58:53 -0700 (PDT)
X-Received: by 2002:ac8:7dcc:0:b0:417:d865:8295 with SMTP id
 c12-20020ac87dcc000000b00417d8658295mr21983282qte.66.1696967933316; 
 Tue, 10 Oct 2023 12:58:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 l17-20020ac81491000000b004181d77e08fsm4742366qtj.85.2023.10.10.12.58.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 12:58:52 -0700 (PDT)
Message-ID: <6c98452a-f46e-2f93-aae7-b060ed4f400b@redhat.com>
Date: Tue, 10 Oct 2023 21:58:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3] misc/pca9552: Fix for pca9552 not getting reset
To: Glenn Miles <milesg@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, clg@kaod.org, andrew@codeconstruct.com.au,
 joel@jms.id.au
References: <20231010195209.264757-1-milesg@linux.vnet.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clegoate@redhat.com>
In-Reply-To: <20231010195209.264757-1-milesg@linux.vnet.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clegoate@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.339, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: c5LmAMJgAFik

On 10/10/23 21:52, Glenn Miles wrote:
> Testing of the pca9552 device on the powernv platform
> showed that the reset method was not being called when
> an instance of the device was realized.  This was causing
> the INPUT0/INPUT1 POR values to be incorrect.
> 
> Fixed by overriding the parent pca955x_realize method with a
> new pca9552_realize method which first calls
> the parent pca955x_realize method followed by the
> pca9552_reset function.
> 
> Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>
> ---

It is good practice to include a changelog after '---'


>   hw/misc/pca9552.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
> index fff19e369a..4e183cc554 100644
> --- a/hw/misc/pca9552.c
> +++ b/hw/misc/pca9552.c
> @@ -384,6 +384,12 @@ static void pca955x_realize(DeviceState *dev, Error **errp)
>       qdev_init_gpio_out(dev, s->gpio, k->pin_count);
>   }
>   
> +static void pca9552_realize(DeviceState *dev, Error **errp)
> +{
> +    pca955x_realize(dev, errp);
> +    pca9552_reset(dev);
> +}


I don't see any change from v2.

Thanks,

C.

> +
>   static Property pca955x_properties[] = {
>       DEFINE_PROP_STRING("description", PCA955xState, description),
>       DEFINE_PROP_END_OF_LIST(),
> @@ -417,6 +423,7 @@ static void pca9552_class_init(ObjectClass *oc, void *data)
>       PCA955xClass *pc = PCA955X_CLASS(oc);
>   
>       dc->reset = pca9552_reset;
> +    dc->realize = pca9552_realize;
>       dc->vmsd = &pca9552_vmstate;
>       pc->max_reg = PCA9552_LS3;
>       pc->pin_count = 16;

