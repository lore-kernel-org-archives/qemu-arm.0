Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp8826414ejx;
        Mon, 28 Nov 2022 10:21:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7E9WoUce7QCr2IMJJO5AjGAI7TjjSY5zIjc6IkQ89qCWxvPpaLhrDQceW4E6/1Y8XlTukI
X-Received: by 2002:ae9:c110:0:b0:6fc:5ded:6d35 with SMTP id z16-20020ae9c110000000b006fc5ded6d35mr13550715qki.623.1669659680747;
        Mon, 28 Nov 2022 10:21:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669659680; cv=none;
        d=google.com; s=arc-20160816;
        b=SKHoeOKfSBn0Bhc1/tnT0TtfBOAjHLNuYEAJSj7VlN2cVs3FJTAToNC8qjYVAbvmFA
         x0dGxHOkkQDCM6s8wrqn7Up0IGhSFuecnaxsFGDXPjGWwIDKUJbQbibq7VtYn/gxLsze
         J0JLcPke9AoEpFrbJ2cbn3m+/m9EG5T0lrF3BRSnyiDnj+9xbjS4E/f4EOIkO7zp40mk
         AE3j/5G807vE6+EQBH1ud68ETDfIeyz/IjenRJkVT6oFCvWt3Q6x6mVVAUp1hcf9Ky2P
         G5rhqZ/DT28x6t8IG2Wz2kD/soP2voJ62xPXPaUbT7gP/q6xpCCnYZbBadbfp1I1TCYX
         DNUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=N+kBDFcqwf3CwNM2FvQqwOPhui8/5seaaB5pstzvSdE=;
        b=YTISl+Xdh7GPltV+692Uf+MufZ5YUgSNjx/q5BNOKd3y46Z4VIpaNNRHKlPCRj60Wg
         2klW3bJM308CvLsuUGZ+0XsjerSoF3O6BzhFl876EMVUvhVJxi6f5Lb8ZECvMHaxFkss
         5lb6kwrMK1Fnx1xzG6Fadpu2JvBagDmZRYDS+m8wut0hgXWCwGA1soVdcluv60oElByE
         oAeEsM0zLDlwBcr7dloNT6T0OoaXlXcOpZP5Gf5e7MwisUrHlURqOe37SKFSs0Khk7zA
         ngr610rzJc2n/MySa5EC4mY7WfWrxEiWoeeX1EPkR/eK7Q6VQNNImtiaW4toNGeVl1DS
         lm4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BRqIWDs7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o25-20020a05620a22d900b006ce93e46f95si6829315qki.40.2022.11.28.10.21.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Nov 2022 10:21:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BRqIWDs7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozikE-0002Zm-0i; Mon, 28 Nov 2022 13:20:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1ozikB-0002Wm-Pk
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 13:20:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1ozijt-0006L6-Cl
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 13:20:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669659608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N+kBDFcqwf3CwNM2FvQqwOPhui8/5seaaB5pstzvSdE=;
 b=BRqIWDs7G4QgTi1el5bhkKbTM6d/tWQrsDC6gI3oqE0w1wy5l9M/2kJLX6eOzKTKbdaOh0
 6ZlWKR5GtMSBpMOXloqJnlcIlpTO9imqrdcNsmkr95sxc6atwAttBcyfF3WrFlxkQUmAHQ
 c1ytJoQ7ZYD6Amz2HyfOnwfIekZFxd0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-203-uojMXtM6PvCCPeZo7MIXog-1; Mon, 28 Nov 2022 13:20:06 -0500
X-MC-Unique: uojMXtM6PvCCPeZo7MIXog-1
Received: by mail-wm1-f69.google.com with SMTP id
 c10-20020a7bc84a000000b003cf81c2d3efso3954081wml.7
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 10:20:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N+kBDFcqwf3CwNM2FvQqwOPhui8/5seaaB5pstzvSdE=;
 b=bpakb1U+Eef6JbOje2nGmN3IQWqGclJMdpr/hTGGUtixLSNcP5G+zJu2h+gnHnCD4R
 wnLyw4xbHSiF+XnixMvo4A2gTcXoweHOeHdscug2XE6ztCpSgRvzN8wi+pAmmiUxkTks
 ZyI3CTMpmExtD0XudDB52ISZYXrhN9vE9qTrr9/MfAiobWSPxX8MvazzOUXeh5P8NVXc
 IOSMf7qIGFVbFLJbNOzOmvd706mN742V9weFYDnKB8LtSTPxHsGNRrwQXQwY64kc6SyR
 Ymng50vo9UNL04/n6yMrtcSffPIkli+JxVNUdyAVSvc/eG5J8EFLOlsF53VTqZ6GYVkn
 k3LQ==
X-Gm-Message-State: ANoB5plVha0PcL+JANCrWzO1s1Kh2L58pEbEMMq+VmDbFSYCeaGgK28r
 ZxI68vdTdsJj17OMMLwYXVuEuiFxB4WOY6YAhmAHPfV2X2a/EvDtrikjxYLXyEqYOrkbzAn8Js3
 kTsrgLsJ+m7LHy9U=
X-Received: by 2002:adf:d0c2:0:b0:242:a37:7abf with SMTP id
 z2-20020adfd0c2000000b002420a377abfmr9239359wrh.190.1669659604442; 
 Mon, 28 Nov 2022 10:20:04 -0800 (PST)
X-Received: by 2002:adf:d0c2:0:b0:242:a37:7abf with SMTP id
 z2-20020adfd0c2000000b002420a377abfmr9239349wrh.190.1669659604265; 
 Mon, 28 Nov 2022 10:20:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a1c5441000000b003b4cba4ef71sm19630682wmi.41.2022.11.28.10.20.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 10:20:01 -0800 (PST)
Message-ID: <e6db0f62-335b-e1af-b4f3-8993ef5f084b@redhat.com>
Date: Mon, 28 Nov 2022 19:20:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH for-8.0 1/9] hw/arm: Convert TYPE_ARM_SMMU to 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-2-peter.maydell@linaro.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20221109161444.3397405-2-peter.maydell@linaro.org>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aF6mxS5TMSqp

Hi Peter,

On 11/9/22 17:14, Peter Maydell wrote:
> Convert the TYPE_ARM_SMMU device to 3-phase reset.  The legacy method
> doesn't do anything that's invalid in the hold phase, so the
> conversion is simple and not a behaviour change.
> 
> Note that we must convert this base class before we can convert the
> TYPE_ARM_SMMUV3 subclass -- transitional support in Resettable
> handles "chain to parent class reset" when the base class is 3-phase
> and the subclass is still using legacy reset, but not the other way
> around.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/smmu-common.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index e09b9c13b74..220838525d4 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -526,9 +526,9 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
>      }
>  }
>  
> -static void smmu_base_reset(DeviceState *dev)
> +static void smmu_base_reset_hold(Object *obj)
>  {
> -    SMMUState *s = ARM_SMMU(dev);
> +    SMMUState *s = ARM_SMMU(obj);
>  
>      g_hash_table_remove_all(s->configs);
>      g_hash_table_remove_all(s->iotlb);
> @@ -543,12 +543,13 @@ static Property smmu_dev_properties[] = {
>  static void smmu_base_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
>      SMMUBaseClass *sbc = ARM_SMMU_CLASS(klass);
>  
>      device_class_set_props(dc, smmu_dev_properties);
>      device_class_set_parent_realize(dc, smmu_base_realize,
>                                      &sbc->parent_realize);
> -    dc->reset = smmu_base_reset;
> +    rc->phases.hold = smmu_base_reset_hold;
>  }
>  
>  static const TypeInfo smmu_base_info = {

