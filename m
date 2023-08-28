Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp2686481ejc;
        Sun, 27 Aug 2023 17:05:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYsvn1UhN4woYEN+aM0m7GK/N4TKNLPAqhBKM4u2lirjW4t46R2rzqRE5RKmArwBxan55x
X-Received: by 2002:a0c:dc81:0:b0:63c:dde2:5a20 with SMTP id n1-20020a0cdc81000000b0063cdde25a20mr26636835qvk.0.1693181143698;
        Sun, 27 Aug 2023 17:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693181143; cv=none;
        d=google.com; s=arc-20160816;
        b=WkVAJxzAV7BGQXnqX/lS2Ac/IgHNcy6fhdiVNjWrF4Bh9LvwpGGz3CIKxBPlrYXJrZ
         xGg4ZeVytcovB8g8TSRRlS2bRXowrBekO0Dn/+qqUllIK14by2PCaKGb2QMVLRG6/oYY
         za2e+0wn5uV9htsGvSkhhJlB06jihAfYYQW3bBQataiHF2rfmZzYy++MOY0ytzWSl6Tj
         rn2U0QBIxLpBJxY7Cm+xbjAlqYm39pB6TjBbQlO3adZVhZ36Jj2Ys7N8kD0Eu+cGr0ac
         lAALVRnn9ijYFBdTaUkprxhnSlMhqpVN2wi+zCkgVlsgPsWoPRDdsLmh1Pmiv7xtvtz5
         BNHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ibbxsoxCKoBvkUXcOjeA5GRQGxS837QbGPrgrI0q1/A=;
        fh=FlL2vwXm5t7Wqdka0+/pww+HVy3xKwVN1Pa+X1z19WY=;
        b=XsNrelJsbM4QMZaaabIagNLHd25wedM3vY9LEOTGlBRNKr4/0Y/rel99njbfZ6WdAh
         Yc/DYfm4gThcV7vbF5FLWO/Ye45T4A96XKW3HvdIvCqPC0UzEhKSaB0AzeW8dyEZsCyp
         zSPRITZFWTi0hmg7EmQn5YQM+staGg2T3Q2VT+BeI0SlEISdoyOtllc8TbUN1NXO/4DF
         iosuiR/1kS9wTLuM2R/6l0FqXpZ7Cw1vZcnSzwcS8HdrZGq2EIyEq2+aYp+WDexc+CuX
         uoTjr0nAYPIpXXbcWWHTL0RS+20JWI4VyEqgAgJfe4Rrr9PD5MnUHGPuvAmlWUcXgsFE
         +rUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="g/8Tpsl5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v20-20020a0cdd94000000b0063d453959fesi2599299qvk.369.2023.08.27.17.05.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Aug 2023 17:05:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="g/8Tpsl5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qaPl3-0006Aa-RT; Sun, 27 Aug 2023 20:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qaPl0-0006AB-0b
 for qemu-arm@nongnu.org; Sun, 27 Aug 2023 20:05:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qaPku-00016L-9y
 for qemu-arm@nongnu.org; Sun, 27 Aug 2023 20:05:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693181118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ibbxsoxCKoBvkUXcOjeA5GRQGxS837QbGPrgrI0q1/A=;
 b=g/8Tpsl5o3GeWffUmOeKIZ8pvO14MIcMGkyukXsjj7u3cEXpfn5M0A2rzwORet0Mt/Fndf
 DTtuNOUWBdE4v+RkdqgutNnZ3lb2ueN5qThvfqXgHz7bIWYALwRlTgYpGdTawZwj4GXSEr
 YUYnEFXyIm54sRMiTClHPpOY0WaeAhw=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-9Oe-m1GVNBqmWyEAmZw5Jw-1; Sun, 27 Aug 2023 20:05:17 -0400
X-MC-Unique: 9Oe-m1GVNBqmWyEAmZw5Jw-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-58ee4df08fbso40532627b3.3
 for <qemu-arm@nongnu.org>; Sun, 27 Aug 2023 17:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693181116; x=1693785916;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ibbxsoxCKoBvkUXcOjeA5GRQGxS837QbGPrgrI0q1/A=;
 b=MQg3f1RQvX5YNfY+IAG8z+MPKH/Q9HZ57B7fHli67po5JzGB+HuD/YgXFT0jx33Gqe
 C8XP7iTolc5MkcKYM85EaSxiEutY+o7OykxldwEdDUQiMHP5ScI/JhaMNcol3FhBVBQF
 CIRsjZklDc+kkShDlDROPrLshtuOwgCPBhcUU9tgtdZ3B9dvPIEr539g2YsWtH/LINRX
 YudlU6ykPhscvLTfJK5y1b81Vkg2ioM7jFhiIXRVg65AtFPkfrI+5yww0SWFEQzNx8LQ
 q/4FMHuJIG65O3wcgaD4oFfGbe2JA2EqRkbZJ42x+0HsMYi9jRudgDpMfE5rw9pY+98s
 ZUGw==
X-Gm-Message-State: AOJu0YwB05sQIlQA6Am78173weadK2vFFYaoO3VlENh2GXc3alk8sUOP
 CY5ZAK50v0oj5v1tjNG6t40O9ybrTFxnOM9XqYERPd9IgIVUXBNttum5Ua3DXeqCi+JdZp5LkNs
 mf0Zs1VMBOZc8
X-Received: by 2002:a5b:c4d:0:b0:c6c:e4f4:2fb1 with SMTP id
 d13-20020a5b0c4d000000b00c6ce4f42fb1mr23159085ybr.3.1693181116680; 
 Sun, 27 Aug 2023 17:05:16 -0700 (PDT)
X-Received: by 2002:a5b:c4d:0:b0:c6c:e4f4:2fb1 with SMTP id
 d13-20020a5b0c4d000000b00c6ce4f42fb1mr23159074ybr.3.1693181116446; 
 Sun, 27 Aug 2023 17:05:16 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a63b14a000000b00566095dac12sm5920524pgp.19.2023.08.27.17.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Aug 2023 17:05:15 -0700 (PDT)
Message-ID: <4bd99ea8-46de-f66f-8e9e-aa981b26dc43@redhat.com>
Date: Mon, 28 Aug 2023 10:05:10 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] arm/kvm: Enable support for
 KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, ricarkol@google.com, kvm@vger.kernel.org,
 jonathan.cameron@huawei.com, linuxarm@huawei.com
References: <20230815092709.1290-1-shameerali.kolothum.thodi@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230815092709.1290-1-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.414, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: hX9OjV9zBrXG


Hi Shameer,

On 8/15/23 19:27, Shameer Kolothum wrote:
> Now that we have Eager Page Split support added for ARM in the kernel,
> enable it in Qemu. This adds,
>   -eager-split-size to -accel sub-options to set the eager page split chunk size.
>   -enable KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE.
> 
> The chunk size specifies how many pages to break at a time, using a
> single allocation. Bigger the chunk size, more pages need to be
> allocated ahead of time.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
> RFC v1: https://lore.kernel.org/qemu-devel/20230725150002.621-1-shameerali.kolothum.thodi@huawei.com/
>    -Updated qemu-options.hx with description
>    -Addressed review comments from Peter and Gavin(Thanks).
> ---
>   include/sysemu/kvm_int.h |  1 +
>   qemu-options.hx          | 14 +++++++++
>   target/arm/kvm.c         | 62 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 77 insertions(+)
> 

[...]

>   
> +static void kvm_arch_get_eager_split_size(Object *obj, Visitor *v,
> +                                          const char *name, void *opaque,
> +                                          Error **errp)
> +{
> +    KVMState *s = KVM_STATE(obj);
> +    uint64_t value = s->kvm_eager_split_size;
> +
> +    visit_type_size(v, name, &value, errp);
> +}
> +
> +static void kvm_arch_set_eager_split_size(Object *obj, Visitor *v,
> +                                          const char *name, void *opaque,
> +                                          Error **errp)
> +{
> +    KVMState *s = KVM_STATE(obj);
> +    uint64_t value;
> +
> +    if (s->fd != -1) {
> +        error_setg(errp, "Cannot set properties after the accelerator has been initialized");
> +        return;
> +    }
> +

Errors spotted by './scripts/checkpatch.pl', as below:

ERROR: line over 90 characters
#139: FILE: target/arm/kvm.c:1112:
+        error_setg(errp, "Cannot set properties after the accelerator has been initialized");

Thanks,
Gavin

