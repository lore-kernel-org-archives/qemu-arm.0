Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp8826136ejx;
        Mon, 28 Nov 2022 10:21:02 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7BpZy9+exhtm74ew+xFIsAVZZnUs+wyj2zGZ8kbk/oB60PxqQh1oySnrPDmsWAeKb/7f/I
X-Received: by 2002:a05:620a:2694:b0:6f6:b34a:5333 with SMTP id c20-20020a05620a269400b006f6b34a5333mr47063828qkp.1.1669659662503;
        Mon, 28 Nov 2022 10:21:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669659662; cv=none;
        d=google.com; s=arc-20160816;
        b=r/g9RcUk6CcosECyftdrMLpMcgO8gt7xGnJtlKStQ4zgEOFqFsXYDk5QHGEIM+SEC6
         f7tiUittRfp80EtLnEQLD+4hG+lOvHSs1ulFQpKBCo9o2SKB+7T9C4ALQrIPH18fK8+W
         HmL9N2lPS9h7IhCx/VKpT0YnICehz0hO0zFcpjBqA68w2wKtrsrCSBepgKeGfj2PHOLe
         BxMCaR9Dq/UPQljSEoD/Mny18wz93KHX41Ctzq1sU//CS1+D8q9E/KNXWHXcOXELNwsW
         uj9d/Y+000wWWiFHYzd3x6QHbTQ1QCJQgD8MHmoc71Y3AcIfSDfHH030WUXiM0gshPWK
         eHEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=7D+0bAmUR8W6CgS2+YzAy5jhFxO1PClLLKA6nZqWCy4=;
        b=IMPI9tdkIdJlUoryFzzRyB6/+qaD1ZgjwxNiD9ctxyAYxr68gcmSiV2PrYhP6PJrRP
         1DdzGBx5gpKlftEZAA1avWAKhwF51Yyc+BHYK/VfAlFYXTZ3YPXV6ltJXngdb++gtdV/
         90uSkScyeYMei2+hKxOO74AyO/awi2gZDX4xrhGWuepEclRYsuJDEKj+Wdan03ca4j7z
         i5rC6Pee8yqHbIkoKxBnX8yVLTe/ZJjSIDJ3wUUFp6Hql1lgOmnUjiGTxe95JarBNwd6
         lld0uGMzWFP2lCn2uKsWzLhq6GAPobMZmHOAGfJS214Iu0nPDNyBHKCcvQEqxckEvn/c
         XWEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bwy8ZbU+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ed3-20020ad44ea3000000b004c6f7e3828fsi3925403qvb.107.2022.11.28.10.21.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Nov 2022 10:21:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bwy8ZbU+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ozikG-0002gl-2j; Mon, 28 Nov 2022 13:20:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1ozikD-0002Yt-0u
 for qemu-arm@nongnu.org; Mon, 28 Nov 2022 13:20:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1ozik8-0006Kn-RW
 for qemu-arm@nongnu.org; Mon, 28 Nov 2022 13:20:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669659604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7D+0bAmUR8W6CgS2+YzAy5jhFxO1PClLLKA6nZqWCy4=;
 b=bwy8ZbU+S2x0aHAMsQSrpDFtQYROdINFrpy4Ry8704mYAytBuer1GWp8gDCHXwJvah3iKU
 uHqvuXoNeGUGhvzmoZdXA2lncVdKiP6f2E+2o8ix96YoMpbgdKiqv+5egN1H864HTmbwDi
 EVgjLgxdCwEc5RoTA9RkjUJhz4PyugI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-vndZk30DOzi_OsjDubb54Q-1; Mon, 28 Nov 2022 13:20:03 -0500
X-MC-Unique: vndZk30DOzi_OsjDubb54Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay40-20020a05600c1e2800b003cf8aa16377so6602444wmb.7
 for <qemu-arm@nongnu.org>; Mon, 28 Nov 2022 10:20:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7D+0bAmUR8W6CgS2+YzAy5jhFxO1PClLLKA6nZqWCy4=;
 b=pnJNA38TRmCkFz6uJtoLdjn85qoR6j6HIZNKDaPtUyWAhtL2E+OFF9+PebYy364536
 tWF6o+ag9SxtSfKHSDbdGktvPMNwkcFsC3T/RlW8j6/2EWFxG/idCXD7lbVvatrxYJP1
 sLDuit2peUX76jh75AE1Pk5oUXxQo7kJ32I+ZzpUtEJw0UQ5Ba15xu5lkrNDac0l95wV
 x6w0m77S2eIT2sWqMqOuiSX9yLKhHswJQkB+/HAIsy3ZAtALXCk+kcSNuStqlzxmnrQe
 AuermfmtjKKFF0dMBGmp5sdx5knTwbXJG1rq54qmuSINpAhhd8Ru9G3RMDSy6xh4XoEa
 Wcug==
X-Gm-Message-State: ANoB5plTVWm9Yjrpx39lgO1RFJ6a3RxVFGf35xkSvVU6YGVi3Z5KXBxm
 r7rPQiJIPcpg65PhF8/Iywnlo3SaWuxBllBWc8VGEJ9eM31Q0nFcr69lq54X4n37xoky/cqnIfJ
 DdZht/NRqsouN
X-Received: by 2002:a1c:4b12:0:b0:3cf:90de:7724 with SMTP id
 y18-20020a1c4b12000000b003cf90de7724mr42136511wma.18.1669659601918; 
 Mon, 28 Nov 2022 10:20:01 -0800 (PST)
X-Received: by 2002:a1c:4b12:0:b0:3cf:90de:7724 with SMTP id
 y18-20020a1c4b12000000b003cf90de7724mr42136492wma.18.1669659601616; 
 Mon, 28 Nov 2022 10:20:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a05600c445100b003c64c186206sm16973538wmn.16.2022.11.28.10.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 10:20:00 -0800 (PST)
Message-ID: <b10ccdc2-e8cc-b7b0-69b8-c8b721abb4d1@redhat.com>
Date: Mon, 28 Nov 2022 19:19:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH for-8.0 2/9] hw/arm: Convert TYPE_ARM_SMMUV3 to 3-phase
 reset
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-3-peter.maydell@linaro.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20221109161444.3397405-3-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: KzsQ4wvcDL5h

Hi Peter,

On 11/9/22 17:14, Peter Maydell wrote:
> Convert the TYPE_ARM_SMMUV3 device to 3-phase reset.  The legacy
> reset method doesn't do anything that's invalid in the hold phase, so
> the conversion only requires changing it to a hold phase method, and
> using the 3-phase versions of the "save the parent reset method and
> chain to it" code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  include/hw/arm/smmuv3.h |  2 +-
>  hw/arm/smmuv3.c         | 12 ++++++++----
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index c641e60735e..f1921fdf9e7 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -77,7 +77,7 @@ struct SMMUv3Class {
>      /*< public >*/
>  
>      DeviceRealize parent_realize;
> -    DeviceReset   parent_reset;
> +    ResettablePhases parent_phases;
>  };
>  
>  #define TYPE_ARM_SMMUV3   "arm-smmuv3"
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index daa80e9c7b6..955b89c8d59 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1431,12 +1431,14 @@ static void smmu_init_irq(SMMUv3State *s, SysBusDevice *dev)
>      }
>  }
>  
> -static void smmu_reset(DeviceState *dev)
> +static void smmu_reset_hold(Object *obj)
>  {
> -    SMMUv3State *s = ARM_SMMUV3(dev);
> +    SMMUv3State *s = ARM_SMMUV3(obj);
>      SMMUv3Class *c = ARM_SMMUV3_GET_CLASS(s);
>  
> -    c->parent_reset(dev);
> +    if (c->parent_phases.hold) {
> +        c->parent_phases.hold(obj);
> +    }
>  
>      smmuv3_init_regs(s);
>  }
> @@ -1520,10 +1522,12 @@ static void smmuv3_instance_init(Object *obj)
>  static void smmuv3_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
>      SMMUv3Class *c = ARM_SMMUV3_CLASS(klass);
>  
>      dc->vmsd = &vmstate_smmuv3;
> -    device_class_set_parent_reset(dc, smmu_reset, &c->parent_reset);
> +    resettable_class_set_parent_phases(rc, NULL, smmu_reset_hold, NULL,
> +                                       &c->parent_phases);
>      c->parent_realize = dc->realize;
>      dc->realize = smmu_realize;
>  }

