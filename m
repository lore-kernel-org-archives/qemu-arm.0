Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp329981lft;
        Wed, 29 Jun 2022 03:28:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sq/K/clRifaCjuuSQkRSoER56rXnEeZtEJsweurXwpb1vqRs2nAtmuz+oSBDIWqMeigQQc
X-Received: by 2002:a63:3e0e:0:b0:40c:9d29:9a6c with SMTP id l14-20020a633e0e000000b0040c9d299a6cmr2441126pga.396.1656498492658;
        Wed, 29 Jun 2022 03:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656498492; cv=none;
        d=google.com; s=arc-20160816;
        b=dB9dVOsWO9ghmju2Vm9FGFIu4r3oNGADhBGD/R5I9Vdbm9psviEEa5xHZwe4odWkHN
         lmQwxKSkZlh3gSiul7/i8P9A+AVvFcM7OHaxNrUx+cKZ5GxJy5Zc64Y2W3R3RzaRPMYe
         G4tv2nDU/pD43E7cOy93tnY1O1FqjgZhQk3um1Kmzs7y27LIuzUs5ZfmTKUMDKYLjkom
         HGisDpCrhsgyc7qLWF3iA3jCWR31+zKw22Lb/zwoTydN6U2ElChlUUJHBuZkkTXUAhlc
         3wNuy/EDM+zQqR5rJ2mtaRc8fy/c0xy7uBVSVo7nEVthFPWlkNHyTLvszmEc2Y2CsQ/0
         w9Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=WBDTegV1NcLsYm3iT9zew3Lk6STRKzydFuyy5K6OCz0=;
        b=FeIfmTpf7rsJL/yYP/MeMpwFCXMOsuFmRTu+eGsafBx9KgrZ20x7ZNM41nDUu9e/nh
         VcLv2FDwMqKfsIzLSci31JyC44iDIKKDmDuVHnqacctMGL7SpkkGPBSa2eiUQ8vc3j5f
         rACQTNNWolSklWNfWnf3KNHVNObYeBRyje2nByavPHZf87A4t1AzC3U8f/yc9TCIFhIh
         5QCynzt0PTQ4MQFEBr7dfL0TAsuR5/5UZZThjnu7c7gWegfSmhoEOB3ETnPjAyqYpeDC
         4/8kljvmSLT4VyIONEgSz5zpmh8iGfsUyPnYx3Lkk9bf2c6vRM7o+yYabMhuJoK2tI4r
         aDrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AVqyutdU;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id v11-20020a17090ad58b00b001eccc37c0bdsi2787676pju.172.2022.06.29.03.28.12;
        Wed, 29 Jun 2022 03:28:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AVqyutdU;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233322AbiF2K2L (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 3 others); Wed, 29 Jun 2022 06:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231404AbiF2K1l (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 29 Jun 2022 06:27:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 656D33D480
        for <kvm@vger.kernel.org>; Wed, 29 Jun 2022 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656498456;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WBDTegV1NcLsYm3iT9zew3Lk6STRKzydFuyy5K6OCz0=;
        b=AVqyutdUTO3CuMEjxd1MZbL9UQQVMhWZiawzp5UbNBDq4Rq0+HHfBUUhoeRuOcFOf4aWe5
        E2IiBvEm/Few+7ShXO31pDZYWn+rYoG0fYaVCajdikOD4kaogATWJwfMBv6biwYTfJ2qWz
        ujD5NJgvd2vI0drXTFOfLnSZAE1rGRk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-M9S7JImQNMW0I4FHJxlUIA-1; Wed, 29 Jun 2022 06:27:14 -0400
X-MC-Unique: M9S7JImQNMW0I4FHJxlUIA-1
Received: by mail-wm1-f71.google.com with SMTP id o28-20020a05600c511c00b003a04f97f27aso2944887wms.9
        for <kvm@vger.kernel.org>; Wed, 29 Jun 2022 03:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WBDTegV1NcLsYm3iT9zew3Lk6STRKzydFuyy5K6OCz0=;
        b=b+rggw6uwQKVNHciwhtV6/WJSegA0FwSIF174w25wcvtvZj9STF2UQRAsv0Ww24gpQ
         ttiMMwK/9+1ViiwWEC0/G/HMe+HQBoA0p/2ioOhVum7+xTfOb8dNnbGlnaGRyTAaAvvl
         P2bXhsh1gppRTur8dXGnBLR+J258mUclrBOG8bHOpUO7gPPSvaQMK96qlxuHiwq1Ub4b
         RBTwpP6BqhR4FlkFuHG/HBm590I/QlhFyzDbNQqk/u00W312XW9Q/pZ7j4eZmjK+MslS
         J23Z80X7tJ63jIDiCW1OvZTTyntnxKRKuSz0kcl2pnp9J4QWtLXfhmFjtnX1v9xrAkqB
         Gylw==
X-Gm-Message-State: AJIora+bYP9pQP1llcV7hNoSjgJH0rxk77Lyv5EPTnHSjZ+G9bzJxVDs
        VDElyWYHJrvxinj7epFMfeNzMi4ocO3Q7uRgux1zvmo8KYA8lF7YTEceOvQe9nk0nO7K15eMnTD
        9M0Ju30tMAPeg
X-Received: by 2002:a05:6000:1ac8:b0:21b:9239:8f28 with SMTP id i8-20020a0560001ac800b0021b92398f28mr2345397wry.517.1656498433129;
        Wed, 29 Jun 2022 03:27:13 -0700 (PDT)
X-Received: by 2002:a05:6000:1ac8:b0:21b:9239:8f28 with SMTP id i8-20020a0560001ac800b0021b92398f28mr2345379wry.517.1656498432858;
        Wed, 29 Jun 2022 03:27:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id f19-20020a05600c4e9300b003a047dccfffsm3274435wmq.42.2022.06.29.03.27.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 03:27:12 -0700 (PDT)
Message-ID: <b684d1e6-2d8f-5d08-aae0-b085a722575b@redhat.com>
Date:   Wed, 29 Jun 2022 12:27:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH RFC 0/2] arm: enable MTE for QEMU + kvm
Content-Language: en-US
To:     Cornelia Huck <cohuck@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>
Cc:     Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
        qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20220512131146.78457-1-cohuck@redhat.com>
 <4bb7b5e4-ceb4-d2d8-e03a-f7059e5158d6@redhat.com> <87a6agsg9t.fsf@redhat.com>
From:   Eric Auger <eauger@redhat.com>
In-Reply-To: <87a6agsg9t.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: L/wArzBAAohE

Hi Connie,

On 6/13/22 18:02, Cornelia Huck wrote:
> On Fri, Jun 10 2022, Eric Auger <eauger@redhat.com> wrote:
> 
>> Hi Connie,
>>
>> On 5/12/22 15:11, Cornelia Huck wrote:
>>> This series enables MTE for kvm guests, if the kernel supports it.
>>> Lightly tested while running under the simulator (the arm64/mte/
>>> kselftests pass... if you wait patiently :)
>>>
>>> A new cpu property "mte" (defaulting to on if possible) is introduced;
>>> for tcg, you still need to enable mte at the machine as well.
>> isn't the property set to off by default when kvm is enabled (because of
>> the migration blocker).
> 
> Oh, I had changed that around several times, and it seems I ended up
> being confused when I wrote this cover letter... I wonder what the best
> state would be (assuming that I don't manage to implement it soonish,
> but it seems we still would need kernel changes as by the discussion in
> that other patch series.)
Having mte=off by default along with KVM, until the migration gets
supported, looks OK to me. Does it prevent you from having it set to
another value by default with TCG (depending on the virt machine
tag_memory option)?

		tag_memory=on	tag_memory=off
KVM CPU mte=off	invalid		mte=off
KVM CPU mte=on	invalid		mte=on
TCG CPU mte=off	invalid		mte=off
TCG CPU mte=on	mte=on		invalid

default value:
KVM mte = off until migration gets supported
TCG mte = machine.tag_memory

Thanks

Eric

> 
>>
>> Eric
>>>
>>> I've hacked up some very basic qtests; not entirely sure if I'm going
>>> about it the right way.
>>>
>>> Some things to look out for:
>>> - Migration is not (yet) supported. I added a migration blocker if we
>>>   enable mte in the kvm case. AFAIK, there isn't any hardware available
>>>   yet that allows mte + kvm to be used (I think the latest Gravitons
>>>   implement mte, but no bare metal instances seem to be available), so
>>>   that should not have any impact on real world usage.
>>> - I'm not at all sure about the interaction between the virt machine 'mte'
>>>   prop and the cpu 'mte' prop. To keep things working with tcg as before,
>>>   a not-specified mte for the cpu should simply give us a guest without
>>>   mte if it wasn't specified for the machine. However, mte on the cpu
>>>   without mte on the machine should probably generate an error, but I'm not
>>>   sure how to detect that without breaking the silent downgrade to preserve
>>>   existing behaviour.
>>> - As I'm still new to arm, please don't assume that I know what I'm doing :)
>>>
>>>
>>> Cornelia Huck (2):
>>>   arm/kvm: enable MTE if available
>>>   qtests/arm: add some mte tests
>>>
>>>  target/arm/cpu.c               | 18 +++-----
>>>  target/arm/cpu.h               |  4 ++
>>>  target/arm/cpu64.c             | 78 ++++++++++++++++++++++++++++++++++
>>>  target/arm/kvm64.c             |  5 +++
>>>  target/arm/kvm_arm.h           | 12 ++++++
>>>  target/arm/monitor.c           |  1 +
>>>  tests/qtest/arm-cpu-features.c | 31 ++++++++++++++
>>>  7 files changed, 137 insertions(+), 12 deletions(-)
>>>
> 
