Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp129080ejb;
        Wed, 7 Dec 2022 23:48:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6+lBAQrOtdFs9u1NyHOfimoYhzX+hp6gvEohQdO8VYnX88yuNpENNlL/WT/es5vGkkF8HM
X-Received: by 2002:ad4:55cd:0:b0:4c7:57af:c44 with SMTP id bt13-20020ad455cd000000b004c757af0c44mr17629280qvb.98.1670485723637;
        Wed, 07 Dec 2022 23:48:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670485723; cv=none;
        d=google.com; s=arc-20160816;
        b=zUFYdEdDVBBLMgGlyMLsLVI+bWjAJ6NmAit0XIHIojBhdXMqDP1Ha5Hi6Dl20ft8uk
         2Md3T+q3sGRVzWVATXGY8OtejOCxzAC57ahSRzFTVm95wexHGWGuuqvxD51y1h6Q6aoM
         3hmVV3JO16aJeSgLgx8xAkVWxHAg3dOx8NJQp4b23Z3nQTauclqteANbs7ECxJFjRmFs
         ua4Gu0ewm/+BxiPwOW1SfCqF3NkkmrUgfM465jpM3VwkmtBbOxW5GyMipgewA1JxqdEB
         4Ti/jYuBwiDW9msxwvyEqbv6GXRHDxibBDf26vzBvZZ80zP8OcNWs2gQVzFdmGqEQX8A
         wgUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=w735L7rG/1OHFXxc8VQz9XUEVB9DpDTD+RfPH0Wrz7I=;
        b=IwUla1jxlHkRWquSrdSRt3iAXPXSw5RfBD7C9EQnwyCtbR+Px5EG9Y1GulhT6TEsgj
         YbUWhfIxC6PKQfcXUR/iJIGgCUM9Dnb7+YH6vgsabSC5O89uZ/xibs+2e5oh2OJNbpWx
         luEWBsd9Ixh5yZQ1WJbpmISjR0FqO8XJcVskU1rYwjkI+SAhP+enAp6B93TxsQ/44YKq
         tig3muzicmlHZJKRc8/vkHe1ktcMJR9atQZeAnIzaabav6bA4mYHFnbf2pIC78sZuGMb
         EXmlk7xcoHP3Jnzf4dAgLgh+jCOFQzcDCOO5w9BRNydHZYP+i8sy7WTl0mVOMB+f158n
         bZ2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cjv5LmT6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14-20020a05620a124e00b006fec356aa37si4327042qkl.508.2022.12.07.23.48.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Dec 2022 23:48:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cjv5LmT6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p3Bdq-0003yF-Gi; Thu, 08 Dec 2022 02:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p3Bdh-0003wt-Tg
 for qemu-arm@nongnu.org; Thu, 08 Dec 2022 02:48:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p3Bdg-0000ao-0w
 for qemu-arm@nongnu.org; Thu, 08 Dec 2022 02:48:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670485694;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w735L7rG/1OHFXxc8VQz9XUEVB9DpDTD+RfPH0Wrz7I=;
 b=Cjv5LmT6kfVRV3CFE+1e06kEduWF/fl7FDLSFIrTwz8HinHrRfzB3fE4HHiCeS2lWOZ4Gt
 wCNrklzOBKyHWHg38VwECb85oCCUknFrMqy3Sb0iBGwYjtNlKvLi7DTnY91Gq8KaMFk0PO
 FPOGhRi6ltgY791qvgM3HcM1t7ENMP8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-93-6356QEwwM1WwICgyNuOGvg-1; Thu, 08 Dec 2022 02:48:13 -0500
X-MC-Unique: 6356QEwwM1WwICgyNuOGvg-1
Received: by mail-qv1-f70.google.com with SMTP id
 w1-20020a056214012100b004c6ecf32001so693249qvs.8
 for <qemu-arm@nongnu.org>; Wed, 07 Dec 2022 23:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w735L7rG/1OHFXxc8VQz9XUEVB9DpDTD+RfPH0Wrz7I=;
 b=Wx5qraBole/AozZUkc9DuX8Nn6L/vKY0ulD4EyVias9+f+DiD/BhuMaM8yVfitlRHC
 ahttSXz+alfVNqC1NQ0OGUuTGbPtaf3bPzAeYlu2OV4pWiZQExFpAumc7afAmFpSwRqy
 /AwAqV1AKYO/k1y6ML9d0/8YIveks3XCrSe6VjpWOFU5Y6yQnjaASUDUr22oz47KErnh
 hCBAqG9ILL90y6xxCifFHe1TT9eV4y8uvNekts6AiHk39p5XLFs1b2pwIBRKnHr8fu2I
 7XwEwV+pXeg83++9JbACTa+pVBozCP5fvAc4Jz/Tkkl0NwgMIob/OYFoDNo4qVJeT3jx
 nxew==
X-Gm-Message-State: ANoB5plclhSQ7E1lFAEuHU2UjRPj95E7sybXs7Vunh3O2smTX2UuQbL2
 SWrKcb1p3/T+weaSr5PgtRg+UKczt3pQNlDthGg3Oqsa+/HbTg202ncOAI12qj/NOwjlS/oEe/v
 063ttkReH9oI3
X-Received: by 2002:a37:a94a:0:b0:6fe:b1f7:38c9 with SMTP id
 s71-20020a37a94a000000b006feb1f738c9mr13677175qke.250.1670485693197; 
 Wed, 07 Dec 2022 23:48:13 -0800 (PST)
X-Received: by 2002:a37:a94a:0:b0:6fe:b1f7:38c9 with SMTP id
 s71-20020a37a94a000000b006feb1f738c9mr13677169qke.250.1670485692975; 
 Wed, 07 Dec 2022 23:48:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ay9-20020a05620a178900b006faa88ba2b5sm18515674qkb.7.2022.12.07.23.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 23:48:12 -0800 (PST)
Message-ID: <a281b12b-d905-4c96-72ce-6e22e41d0cfb@redhat.com>
Date: Thu, 8 Dec 2022 08:48:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH for 8.0 0/2] virtio-iommu: Fix Replay
To: Peter Xu <peterx@redhat.com>
Cc: eric.auger.pro@gmail.com, mst@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, jean-philippe@linaro.org, bharat.bhushan@nxp.com,
 alex.williamson@redhat.com
References: <20221207133646.635760-1-eric.auger@redhat.com>
 <Y5EmmjKBBnjSlvd+@x1n>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y5EmmjKBBnjSlvd+@x1n>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.262, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HEGD/EY/CRWL

Hi Peter,

On 12/8/22 00:49, Peter Xu wrote:
> Hi, Eric,
>
> On Wed, Dec 07, 2022 at 02:36:44PM +0100, Eric Auger wrote:
>> When assigning VFIO devices protected by a virtio-iommu we need to replay
>> the mappings when adding a new IOMMU MR and when attaching a device to
>> a domain. While we do a "remap" we currently fail to first unmap the
>> existing IOVA mapping and just map the new one. With some device/group
>> topology this can lead to errors in VFIO when trying to DMA_MAP IOVA
>> ranges onto existing ones.
> I'm not sure whether virtio-iommu+vfio will suffer from DMA races like when
> we were working on the vt-d replay for vfio.  The issue is whether DMA can
> happen right after UNMAP but before MAP of the same page if the page was
> always mapped.

I don't think it can race because a mutex is hold while doing the
virtio_iommu_replay(), and each time a virtio cmd is handled (attach,
map, unmap), see virtio_iommu_handle_command.
So I think it is safe.

Thanks

Eric
>
> The vt-d resolved it by using iova_tree so in a replay vt-d knows the page
> didn't change, so it avoids unmap+map.  It only notifies newly unmapped or
> newly mapped.
>
> Thanks,
>

