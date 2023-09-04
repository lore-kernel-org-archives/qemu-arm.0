Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1376822ejb;
        Mon, 4 Sep 2023 07:23:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUK6qk9Sp1hBkw8WVMn7flzl7i+KfTQiB5M5MeMErh1jWXXNTQWSAU39TIW+PwumF4G/gt
X-Received: by 2002:a1f:e385:0:b0:487:e8f1:a2bf with SMTP id a127-20020a1fe385000000b00487e8f1a2bfmr6978699vkh.15.1693837402991;
        Mon, 04 Sep 2023 07:23:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693837402; cv=none;
        d=google.com; s=arc-20160816;
        b=UGY995dYcpztt/63IddyrStZXs7hrYDEOwviJQktwSVYoOI3pIEdu26NbjkOzb6Gv2
         7FAuPmUJjsxtgq0Bx8RXLrdGb03wmiXhVFb9xoTGgSXs7MMuDBodmwSfnoPCAEyVH/DO
         36G2iV+LLxkTZcmil3fC75PiNT0EVDPe4ZkZhZRWSFg4us/Wob/uZH6efxPv93t8G7zK
         tXdLdp0PrkjDTfEr+p9ZQADkfcelYev7BOFCc4OLxZG0X7ZWI9OsyJY/uteVk7bSzJrC
         TZXVGxoj10c+5WyTLo4mCi0Q8nFzoRBA9IalSWHUcbBa7CkPNVtSSk3hCyRcnVgRjzvh
         uKTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lM7tAmp7WirRKEbi/4X/FhmWHX4s5l0P4f3vWHYNmlk=;
        fh=W3EgVUuhcAzjd4c33SPH5S4oJyApz1ChrU4InAB1hP0=;
        b=ficJmT/WwPaXXHxZ6Rc7RHhRK/aFuQu61DFnjqi9z5H73Ap9dGeOnrLILIhs+hE11O
         YHqnGsigUksnzT6jkvtGH/u79KVqfUl1vr6hr+XZBJnu0xKRcBjhlHfqHaO7sCg7wDIW
         lF1wC+6XAeUVfD//WS6J4jKsIUslcGT+ark227z90k7lFQOtM8nsOZjYAOD88vCe/h9g
         6zqWFHMRaQM2fWJHzHL7T0Hn2s3Q4+ZZgKc9W39Rk5SU4E2ta0FAA8q3HmxZkTa1PyDo
         zxwpCZnjAkvjDs7jTLxFQjDDa9SGVuE2wJEPudjtc+ClGEMdolMRkw+t5lr2yO9JTqb1
         4e3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="RyLvYK/A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w17-20020a0ce111000000b0065160dd5cf4si6554829qvk.359.2023.09.04.07.23.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 07:23:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="RyLvYK/A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdATx-0004y7-CH; Mon, 04 Sep 2023 10:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qdATp-0004ue-Uv
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 10:23:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qdATm-00055G-Ve
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 10:23:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693837382;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lM7tAmp7WirRKEbi/4X/FhmWHX4s5l0P4f3vWHYNmlk=;
 b=RyLvYK/AlKINTM2fJSVceuzl7DD64SmYK3I/jRU7rt+nLPGQiD04j6h7LFyg1sNNwqwyjP
 tbArWK4tWccJX6SKMrLGxHot8oN1EnpOWuJwlA1gnLLyeW+3t41jUQxrGSDSW9k/teptsj
 ZCv8/c1ioeVg3pd42HWkjjrdpV0H5sU=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-IpTWa4BRO3mbVz-KOyNFoQ-1; Mon, 04 Sep 2023 10:22:58 -0400
X-MC-Unique: IpTWa4BRO3mbVz-KOyNFoQ-1
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-3aa17bcf2bcso1741224b6e.0
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 07:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693837378; x=1694442178;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lM7tAmp7WirRKEbi/4X/FhmWHX4s5l0P4f3vWHYNmlk=;
 b=f0P0gkergnGd8VMHbH+vT0zNloZeE3U2JsaWTe3YbNcjGoHjvdrioT97YjMEVBIpub
 sN+mhztDFcIDuCmTHpyrZeBRmt4MAaQe/CyQWaim8yIXVAUL7Lvmg7ldyp5w01sAbKO6
 yKZ3N7eJ11CLFM1qgJgzJ7IWsGc/31YlZ0usPF/nw1fQCvHuQrkuMuZfO4zvd3SC64Ke
 W4ho33xNNLvOEyMx4l2rdo5WD1akLyzs+hSL1cC7Pz8E4PeGX6KxWOsb84L3VNW3LW1C
 q8GGaGNCpcdDJ2mBhtK9+vJY424WGP460TH+YwR8gUoqtk1oXnvTuxe+baocoifUfHFl
 8J6w==
X-Gm-Message-State: AOJu0YwHc+WXBZh+7ICxT3EHUmqTlDdy1jY5ooJBDHsL3bTLb2krgirB
 NPxA8K6vwc2g01cWE9h03QncfWI3+rPCZaXSpEDF49Gt0s8levqB5Nau3fTUJY7TXFDS35Fhat6
 /SnjJGqL9wqxM
X-Received: by 2002:a05:6808:1441:b0:3a4:91a:224a with SMTP id
 x1-20020a056808144100b003a4091a224amr14037498oiv.34.1693837378051; 
 Mon, 04 Sep 2023 07:22:58 -0700 (PDT)
X-Received: by 2002:a05:6808:1441:b0:3a4:91a:224a with SMTP id
 x1-20020a056808144100b003a4091a224amr14037483oiv.34.1693837377835; 
 Mon, 04 Sep 2023 07:22:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a05620a13e300b0076d9f2d4fabsm3375025qkl.15.2023.09.04.07.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 07:22:57 -0700 (PDT)
Message-ID: <508d32cb-9d3c-848b-4ed2-0ca0d8a203a8@redhat.com>
Date: Mon, 4 Sep 2023 16:22:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 01/13] memory: Let ReservedRegion use Range
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, clg@redhat.com, jean-philippe@linaro.org,
 mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com
References: <20230904080451.424731-1-eric.auger@redhat.com>
 <20230904080451.424731-2-eric.auger@redhat.com>
 <231e23c0-e5a5-be2b-ccb6-77e24c2c1f55@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <231e23c0-e5a5-be2b-ccb6-77e24c2c1f55@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: x+UXzq0bhN7f



On 9/4/23 10:12, Philippe Mathieu-Daudé wrote:
> On 4/9/23 10:03, Eric Auger wrote:
>> A reserved region is a range tagged with a type. Let's directly use
>> the Range type in the prospect to reuse some of the library helpers
>> shipped with the Range type.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>   include/exec/memory.h            | 4 ++--
>>   hw/core/qdev-properties-system.c | 9 ++++++---
>>   hw/virtio/virtio-iommu.c         | 6 +++---
>>   3 files changed, 11 insertions(+), 8 deletions(-)
>
> TIL "qemu/range.h" :)

I did as well and on top of that I learnt "TIL" :)
>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks!

Eric

