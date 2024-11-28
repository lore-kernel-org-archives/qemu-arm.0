Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1357775njb;
        Thu, 28 Nov 2024 00:42:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXJ0ey+S8r95i7qBTzxDdyHWi37EQ3dxkk3CNI56jbCJbpnJr9MPZIn246xKbWUrly7/V3+FfAIHdU2fg==@linaro.org
X-Google-Smtp-Source: AGHT+IG2eoCq3OaKZsBZbOeFpDc/f3qyC30n255+3jPiLLIcooekZbOsHf8pYuJdXLtMkgKRpt61
X-Received: by 2002:a05:6102:32ce:b0:4ae:4abd:4685 with SMTP id ada2fe7eead31-4af44a04cdamr6538024137.20.1732783343539;
        Thu, 28 Nov 2024 00:42:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732783343; cv=none;
        d=google.com; s=arc-20240605;
        b=T3v9UbRc1hlmAHgqtvwja/pBdmsiT+SUMzKtof2YbNLeLt2uaW9j9Ap79b8Vm7UN3Z
         u5Z9NryXX5fK5JG7qwEDTxhbzDy0K8T9ODVMqE9rcd5hltk7IicpSFREJ1o1xDW+Dhcz
         DfT8MyzNpW1UOw65rNfA2MbuWSLLG1yf/z1X7eVnCj/dW60BJBZBJjlvQDuNXkJ4QL0o
         KbfUJMJLXZpI7h/kya+nQD93Cmk9Pqm0XnRFNbGkmXNRQbXNpRcDoEOb36bgXaUYVKXt
         rnvTnIIyqG8S2kFLYO0klaBUH03sD5pQdi4EQGLeEU5QBP1zcjYxbAUZ9y9EJF1sXMeJ
         /mpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=UQPZv9JMprD+qOBBg6yonw8J/WmWGRfK0eeqFtoI9do=;
        fh=LfQWQnWjjGXXsPUrizSgAsrOMINBgRVAh7QHpsCFSsw=;
        b=f8THCCzBGRJ7PsXyitlJOpj2GpZlH4QKaygoFiv5jqBdnT3Kq/FtDuYXeu1lCmYKXT
         EYFVrtxQ+VmjS5Tf6f56QyASK31uFyhtMu40MH6k772hT+wb9jDUxIPyRB1NaZF5Qrhp
         tSFs0A5JHpdweK6yF47YnnPNc/dBhD17Jbf5K1/hWpnisuLhLAIPOjdugPoTFosM36Tx
         +03f3tx8Reu9XjFAlOIbKePc0rrV44GX1Cqgykmr5lTZ3lipdRwvgOyg2HKukYgYuzZW
         QgBbAjCMa2jzu6HAx1Mr92Utgp9mXppGjYsn94WiEuylB4LRpFTcMkiuKEOriF9tBGEh
         xjeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L8OWnj0q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c4256a66si12002421cf.505.2024.11.28.00.42.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Nov 2024 00:42:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L8OWnj0q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tGa6E-0002SW-Gm; Thu, 28 Nov 2024 03:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tGa67-0002S0-74
 for qemu-arm@nongnu.org; Thu, 28 Nov 2024 03:42:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tGa63-00018u-64
 for qemu-arm@nongnu.org; Thu, 28 Nov 2024 03:42:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732783317;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UQPZv9JMprD+qOBBg6yonw8J/WmWGRfK0eeqFtoI9do=;
 b=L8OWnj0qHz22m6oLC9asMBEHhpDeaFTikcvzfa002VGUAuQHUri7elmgPDMuUSUKlvDMNl
 Wo+QIv9Pw73+BXVzVWVLmpG/9Pa9CxZlZHf+19ZQH6DKyT1aUVjkCbXkgCfVopXROLoKBC
 3XEH8qho4sD3EaYcM2Zi3rilZiuHhzA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-fa7iTVKnO5OsjETOJuFUmg-1; Thu, 28 Nov 2024 03:41:53 -0500
X-MC-Unique: fa7iTVKnO5OsjETOJuFUmg-1
X-Mimecast-MFC-AGG-ID: fa7iTVKnO5OsjETOJuFUmg
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-434a0d30c06so8530465e9.1
 for <qemu-arm@nongnu.org>; Thu, 28 Nov 2024 00:41:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732783312; x=1733388112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UQPZv9JMprD+qOBBg6yonw8J/WmWGRfK0eeqFtoI9do=;
 b=X+1oGB6ziHV2Vq6yVShxcT4h80bVVusg0oyYBQGwv34MI4HyuwLwYuerv+fWaxH7K+
 VXVMintNJk/Pzep7ALd4z3l7AHGETpoayC9Ry53uzTL5DCI4nloX1h1NOX7YHb355sEt
 tfPesRANrgNsY+cFwOgBEJ6Y+iAshBjxQrZOY/eNomqKZ++44dBgBLKgvzHozD62bHlq
 xrRmF8PzNc0ODzMNymVjbPgkChEQjRKYU03VXPTEJz8d4t6tAiJYLucyIlzMQf2sZ8Hp
 4wnL4XAqjRhuJH+77XY0lOJXmunRDYDMMlhKSDzm8ZvNU9JRpAcSsVfqD+X1l0Hvtd/X
 yEHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv9cBseqIKgONyE0AmOJy1o0sgr0yak5qcGHFvV/M1jdPgRb+5LQ//Dan3Cfvd0h0PyssVuB+XTg==@nongnu.org
X-Gm-Message-State: AOJu0YzEaNWX3Mx9tNg64nJ1KWyUd9BY+zur5/Q/JBsqKhdq7Dyt1y5j
 Da/gyQcMD1HEE/YH7b5vofbLXc40rzrJsM5XrzkQVeMpkgcEne0tvk1QFz2oNbIpElxhQePPhFv
 digS3I5zZYR8/siJV2VnIQFLMNnulK0gInG4keqbgmNnw4BbWOg==
X-Gm-Gg: ASbGnctfLczN/GkyZK0XwlvhcjKHkjZzqYLyurmMOPC0UKCJJOBCAet5ONtPaOGHruv
 tSpipQVj4cN6nNAJkvDSxEmPypFiTktDTBKuTDc3SsbizvUS8esnY2cqDJNBPtn5Yb6DMW2zl0V
 jsoGvtouQn2Md8pAwl9lKDb4uBw/UzpfdgBgvh4Fsie47/3TBpCoASsHsCqTUZn2H9o2Fs5TCrQ
 Y2BJ6PTNOVRgqfYOwnI/O9G/q1JxbFLxEzIYx16+A3INDgZidrFNSEmTBBsGoimRVYMHw8gdk09
 rwgGqKFamkk0+0zoyQN4Mg==
X-Received: by 2002:a05:600c:4b17:b0:42c:b697:a62c with SMTP id
 5b1f17b1804b1-434afb9453emr18526725e9.5.1732783312249; 
 Thu, 28 Nov 2024 00:41:52 -0800 (PST)
X-Received: by 2002:a05:600c:4b17:b0:42c:b697:a62c with SMTP id
 5b1f17b1804b1-434afb9453emr18526495e9.5.1732783311931; 
 Thu, 28 Nov 2024 00:41:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa7d29fbsm45695395e9.29.2024.11.28.00.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 00:41:51 -0800 (PST)
Message-ID: <f97bcbc0-cda8-4a5c-90e6-c3648617b934@redhat.com>
Date: Thu, 28 Nov 2024 09:41:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] hw/arm/smmuv3: Add initial support for SMMUv3
 Nested device
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Donald Dutile <ddutile@redhat.com>,
 Nicolin Chen <nicolinc@nvidia.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <20241108125242.60136-3-shameerali.kolothum.thodi@huawei.com>
 <00e8a5d6-c926-44bb-8d11-dab4ddc4820d@redhat.com>
 <ZzTqXCFKV9s++C2N@Asurada-Nvidia>
 <cfe8864c-f830-4b39-b4d5-f219f5a42eea@redhat.com>
 <d8fbaa677771425dac985438b4b1db59@huawei.com>
 <20241127160031.GA1253388@nvidia.com>
 <bd4c4665-148c-427b-8717-457c584fb233@redhat.com>
 <CABQgh9ErT6BmvbrUr_aNiLFws2Kx-=NzGJJCo+vV7AV_U6Pk9g@mail.gmail.com>
 <05470fe6-4336-455a-8b30-e05fb273aa25@redhat.com>
 <3fa6f093ff9a4749bcd25d0dfa60b1d7@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <3fa6f093ff9a4749bcd25d0dfa60b1d7@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XeVJ6gZqsYetR60nJ4MfOdVGGzO5VXy9kqKI_pwbp0U_1732783312
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.931,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: t3XvaiEmirOf

Hi Shameer,

On 11/28/24 09:28, Shameerali Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Thursday, November 28, 2024 8:07 AM
>> To: Zhangfei Gao <zhangfei.gao@linaro.org>
>> Cc: Jason Gunthorpe <jgg@nvidia.com>; Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; Donald Dutile
>> <ddutile@redhat.com>; Nicolin Chen <nicolinc@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org; peter.maydell@linaro.org;
>> Linuxarm <linuxarm@huawei.com>; Wangzhou (B)
>> <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
>> Jonathan Cameron <jonathan.cameron@huawei.com>
>> Subject: Re: [RFC PATCH 2/5] hw/arm/smmuv3: Add initial support for
>> SMMUv3 Nested device
>>
>>
>>
>> On 11/28/24 04:25, Zhangfei Gao wrote:
>>> Hi, Eric
>>>
>>> On Thu, 28 Nov 2024 at 00:06, Eric Auger <eric.auger@redhat.com> wrote:
>>>
>>>>> Yeah, there is no live migration support yet in the SMMU qmeu driver,
>>>>> AFAIK?
>>>> the non accelerated SMMU QEMU device does support migration.
>>> Could you clarify more about this?
>>> The migration is not supported if using viommu (SMMU QEMU device),
>> isn't it?
>> No this is not correct. Current QEMU SMMU device *does* support
>> migration (see VMStateDescription) as well as qemu virtio-iommu device.
>> so for instance if you run a guest with smmuv3 and protected virtio-pci
>> devices this is supposed to be migratable. If it does not work this is
>> bug and this should be fixed ;-)
> I think if I am right Zhangfei was testing with vfio-pci device assigned on his vSVA
> branch. But migration with vfio device is currently explicitly blocked if vIOMMU is
> present. 
definitively I was talking about migration vSMMU/VFIO which is not upstream.
>
> I think Joao is working on it here[1].
>
> But we may require additional support when we have vSVA to handle any
> in-flight page fault handling gracefully.
>
> Thanks,
> Shameer
> 1. https://lore.kernel.org/all/20230622214845.3980-1-joao.m.martins@oracle.com/
Thanks

Eric
>
>
>

