Received: by 2002:a17:906:6a09:b0:a6f:1bf6:7fc1 with SMTP id qw9csp366451ejc;
        Wed, 12 Jun 2024 05:50:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXG2YIAqw/XoXOh2na8mKGgCBaPL4G35mTp2QjLK7xkiKfSHOtUch/2HaBNpsARJGMBf7UcueWnnX94lgpvYPW8SflBt8C9
X-Google-Smtp-Source: AGHT+IH4IEBe3d2iw9tAsU1pED8mvwwHcT8MZ+hhBZdRFq7qgPpM0q2Gb/EfhWCT95dhDpbxdVh8
X-Received: by 2002:a05:6808:3197:b0:3c6:efde:7a45 with SMTP id 5614622812f47-3d23e1035eamr1971889b6e.50.1718196631696;
        Wed, 12 Jun 2024 05:50:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718196631; cv=none;
        d=google.com; s=arc-20160816;
        b=IKUPMfnCCCuDaEuRxelW8qIRgnCLxKg/t3F4z0rvZ9zMBcXxZkeXaxeH9wcBTuron3
         phV09CUw3Ox2KV4OaYDd59XmiM0qkPnt2DhIJ6tdmfBBMQ+vMStAOH4kHt+ytDbGtNoL
         0+n4UlgONcJM4avctv34j2bXx0TmGrpl0ZboNOSMXiyMm5SvT0azbrVperK0Q7Cto1uV
         s8uSf9LSSoHSYv/2n72Qo0LOtIxvh8f68zDiLPEjrQcPfH8QRLeXTqigSv/RAyR8QncR
         CAUksFzlCF1SBcq0p47ZrF+CPZGz3/tb2lTZECesEZgQzlACfT0PeXOKPetZFbTzy0Rf
         GyJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UiekToTWPow3vHTwnb6CkZoHJAihJQce2rVWuOyp1hI=;
        fh=MeNaqO4ZDyg6yQtphd7o8kuMLTOWYrqDQ0fVesM1QDA=;
        b=IIDxEMonXGIzMLvXquZCftRxkYVhtjuhJKfR8oeqjxY0F5bzbZ5hUzTcEq+R3Y26xX
         hI4FxHABIZzRWlTor+V0NMj2iEfFBEg3G2zMcIGXmGbNuyPkoo1z/viswcQxYv3+xZgC
         IfNYMxw0ILJRwXn/d/Xqk9QIiYzrXVcdU6wdFLTDwtoNWAL+bYsn4GBNPh625+KFuuuV
         WdpRiOxNhIY9+ojrm2mzRellOmt7aFvwc4pVXxxBdjKzO77P/7+IbmN47ALzj/xjzyOR
         zzzo30kQcS5ZHGGxtdkIWg8gcKzaCMyTlceSardfaWBqwfs4nbMcd314k+rGm+4Xu87a
         AAsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vNfrZB/6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7955d85d33esi866656585a.298.2024.06.12.05.50.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2024 05:50:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vNfrZB/6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sHNQj-0007Dk-Vr; Wed, 12 Jun 2024 08:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sHNQh-0007Cr-OF
 for qemu-arm@nongnu.org; Wed, 12 Jun 2024 08:50:19 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sHNQd-0006JZ-TR
 for qemu-arm@nongnu.org; Wed, 12 Jun 2024 08:50:18 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-35f1cb7a40fso3590920f8f.0
 for <qemu-arm@nongnu.org>; Wed, 12 Jun 2024 05:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718196614; x=1718801414; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UiekToTWPow3vHTwnb6CkZoHJAihJQce2rVWuOyp1hI=;
 b=vNfrZB/6ZAfBPEGtgR6ZepUDEHNms5YtdvjKIAqb7qZgcf+bW1NZQW8XQMd2UxTmv4
 PPWsTmy8ioqEmzw+zXA+mWIQaP6lD55rOb9a6xevr5yzdjfMolJfuvst71jUGieXL/Dw
 hDJipFHZxExSwaIcWYa763uxlLIQiNxMFMeyLSs3oQLYLKo+Xs8eDOikpipX7DytsQ0z
 a7cetZdDAHzeK4tjHLABEOg60ZJTz9BTfg10im1vyXrO0yPYjf+8P1UjQMQ6zPfFwbrV
 OEnWFxF/XqHcAtW9ikLyNk92u+T/fXfvvV1Cw9/wT8emur0j6LEgLDGMdBdWNjzlwku/
 gyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718196614; x=1718801414;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UiekToTWPow3vHTwnb6CkZoHJAihJQce2rVWuOyp1hI=;
 b=EIXdL5KrcaoYqzqaU+kW+AyLBNeUKtGMtyZfvzQROIC3WVl95NoapIb1Bc+4MwTSTE
 yu/xcmItWM5x6FRbCOqVhgX/yzqBlxZSqmOso4m2Fi3I0/onWXTuZNleSYzQ6Ntu6o4f
 9JeMwVwsL1qeeYRybhkLqxsIgADsbR1KDyOb+f1nWa7BgTheYYiTI6EMttIipJRTi6cH
 PFb2b9zZor55Z8D01MYYA4jjLBDZJPOL/bsI2bP2TnVGrzI+JixA8WMIs2TzaYmyd3Hz
 vg9HRtIId9gqVKDqVsEngeBpX+7VYZBI4LUJFOTeULgfECeWPif+UnOsPkF4A59HU5m4
 TXOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1Xd/DltHKBs0o6BchNM5ukP4dTm7D41gh7bO8tslkAKg/scxwXv6Fzi1YxjLIXppewsKcpCC9h/L8MAZcHQ8cWk6I
X-Gm-Message-State: AOJu0Yw5MLmt0upF5z1Z+UZ+GX4ztm6Ql3Iz5nfE4sqiTJLhxnMD+rMQ
 /AwGDWfeKJnlH2IHoe94o7r73yyy4cyCVNKYl/TcaIWl42smyYIwRv2BRb4SnsM=
X-Received: by 2002:a5d:5185:0:b0:35f:caa:1ebc with SMTP id
 ffacd0b85a97d-35fdf79bcd7mr1488952f8f.7.1718196614071; 
 Wed, 12 Jun 2024 05:50:14 -0700 (PDT)
Received: from [192.168.69.100] (ram94-h02-176-184-0-172.dsl.sta.abo.bbox.fr.
 [176.184.0.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42285317d46sm20622325e9.1.2024.06.12.05.50.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 05:50:13 -0700 (PDT)
Message-ID: <8d7e111b-4f74-4a67-b01b-2af5ce009a06@linaro.org>
Date: Wed, 12 Jun 2024 14:50:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hw/arm/virt: Avoid unexpected warning from Linux guest
 on host with Fujitsu CPUs
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Zhenyu Zhang <zhenyzha@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, robin.murphy@arm.com, Jonathan.Cameron@huawei.com,
 gshan@redhat.com, eauger@redhat.com, sebott@redhat.com, cohuck@redhat.com,
 ddutile@redhat.com, shahuang@redhat.com, qemu-riscv <qemu-riscv@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Song Gao <gaosong@loongson.cn>
References: <20240612020506.307793-1-zhenyzha@redhat.com>
 <69649622-e52c-4d24-809b-3d8a97786a69@linaro.org>
 <CAFEAcA9wEjONgLfTObNYwJbwn5Gs1BDJiDivc9PEwmfOeZW6ww@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9wEjONgLfTObNYwJbwn5Gs1BDJiDivc9PEwmfOeZW6ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: z4lLCkOZL35R

On 12/6/24 14:48, Peter Maydell wrote:
> On Wed, 12 Jun 2024 at 13:33, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Hi Zhenyu,
>>
>> On 12/6/24 04:05, Zhenyu Zhang wrote:
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 3c93c0c0a6..3cefac6d43 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -271,6 +271,17 @@ static void create_fdt(VirtMachineState *vms)
>>>        qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
>>>        qemu_fdt_setprop_string(fdt, "/", "model", "linux,dummy-virt");
>>>
>>> +    /*
>>> +     * For QEMU, all DMA is coherent. Advertising this in the root node
>>> +     * has two benefits:
>>> +     *
>>> +     * - It avoids potential bugs where we forget to mark a DMA
>>> +     *   capable device as being dma-coherent
>>> +     * - It avoids spurious warnings from the Linux kernel about
>>> +     *   devices which can't do DMA at all
>>> +     */
>>> +    qemu_fdt_setprop(fdt, "/", "dma-coherent", NULL, 0);
>>
>> OK, but why restrict that to the Aarch64 virt machine?
>> Shouldn't advertise this generically in create_device_tree()?
>> Or otherwise at least in the other virt machines?
> 
> create_device_tree() creates an empty device tree, not one
> with stuff in it. It seems reasonable to me for this property
> on the root to be set in the same place we set other properties
> of the root node.

OK. Still the question about other virt machines remains
unanswered :)

