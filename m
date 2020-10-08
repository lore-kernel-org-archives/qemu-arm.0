Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1481228lfq;
        Thu, 8 Oct 2020 09:13:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgIL7LtUmM35NojWM0sLAes0bDzwRZiNjQlPJQC5/WgxVE/8kHjVCAeVpg63g4u/rUa5gi
X-Received: by 2002:a25:854f:: with SMTP id f15mr4395186ybn.134.1602173620947;
        Thu, 08 Oct 2020 09:13:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602173620; cv=none;
        d=google.com; s=arc-20160816;
        b=D6AHY9ZW30H3dE1xX85F/oZSTknb9J0ua3UEPRkE5K3YAH906U2s78Y8kaA+BkLdYq
         GlMu7ZRPqe0H4dIpypjq4RwI/pAJuYyKk7Igrm4NCKrCqpcblMftjBt8VfyuMi07xelz
         3O1YESTJUatL0agfI8f6hAoZpblLwq8QYA1Ir3T7Sa1ivb5wuPO4Czp/gNOIulgRAymm
         et0xX0nbKv5DFONfNKiunoAW78EC6REvWX12xs9zYfp+aKOdf8+gkO5ezWTsVWbB3nEJ
         gC0i9vNwtQncqfklB5VK8B/JodC1YzDJ0N51W35Hi/U8mcmkxsugNIBznbxC7Ho4kajC
         tj9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=b3ZZavo/vuLkL4sZ0uS03XFXv/WyDWw/BLCmoV+Kxig=;
        b=XSDv9BSZ8W+pFZ1s+n13TObt72t724h4D6sNUUllxKcpqxYUdtXoHeA5OfeZXadKp3
         NtxY1xK5uf3BlaUTzT9cgxi+AmD/25+v/XUIH/7TkiOdPjjBlaeejMm7BCr2P/CemsWh
         GgIXggmEYXfpYol4k85w/fDjry0R51U0YXXisSdxETDuTtogDqM2sSkgOR9aWOADOFjx
         9DtIbXyTwq653ebja2OJ2pd0VGKFqE4/zBCVGKW7QSaJNGvFE2pij7lWNPSqV49fdHcr
         QE62erGNZqWErbNu0p9Kgls03P98L54lGI7BG+VFHDzTKAA+CxVo5ch8lPuHHSZ6WtKc
         qq9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QCEVCmfm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8si897554ybl.159.2020.10.08.09.13.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 09:13:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QCEVCmfm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQYY0-0005v0-9o
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 12:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kQYXs-0005rx-1T
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 12:13:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kQYXp-0006HG-8W
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 12:13:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602173607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=b3ZZavo/vuLkL4sZ0uS03XFXv/WyDWw/BLCmoV+Kxig=;
 b=QCEVCmfm6xIMOjNLluq5+MnlwrF1w9wQUer30UEOetbZsPaVg/p1K4dQG7Br+IX8wLdHi2
 cOa9pooOVKpWosOIpI2h14vWwxB1dRubFtd1buWLineexB1UKEx9aWe3gV+nR+Hj3wn82H
 Dyz1J447I8qn1laX6yXpLpjCvt3yniM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-nujCvxZrPeCuYIez47HyRQ-1; Thu, 08 Oct 2020 12:13:25 -0400
X-MC-Unique: nujCvxZrPeCuYIez47HyRQ-1
Received: by mail-wm1-f71.google.com with SMTP id u207so3234109wmu.4
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2020 09:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=b3ZZavo/vuLkL4sZ0uS03XFXv/WyDWw/BLCmoV+Kxig=;
 b=tGMCUeBNadqjERVW74zd0g2nanPZELLLdNXBvXJ6qvsFoOMKhgSBvpV/DExrhOuw1s
 +v8XY3E0KX+2Y3Q8q8zFgdtq5XKvMOvUtf3VIpMnj6o7Wkvglw3foy6kwqGirrFhJil2
 Y0Dn04Z20VZ9wy8aWDUSSWGTsiaweMtE8tFHC6MUkkER9HMSMFPdY2iv1Xe+MnmB9RaE
 oA2zf/NujoMwCKtnpaF6QNwzQ7HYnzcqeuMx9GWksyCgqBNK/ZqlCb3+JCk1etkDuYXh
 UfiqOi28YN8A5t87Q8pqB5gThT/cfttPEG6g3uxWaFXQMnNGhPAyEgPWeOCyNAtL9Q7o
 n48A==
X-Gm-Message-State: AOAM531fqsZttbXM62jhYf+ir4YvLevjL4Gx5XIHgyZlGz/r7S3l02Ue
 GJU7ILdgoWOCCX0JcUtS7CzEKX8zbPyTZjOfcR6LWGZz3mykWjcLqE2U2Y9XH2RfRDTjDER7iXh
 0pfW7HbXFZyiP
X-Received: by 2002:adf:f7ca:: with SMTP id a10mr10075021wrq.321.1602173604804; 
 Thu, 08 Oct 2020 09:13:24 -0700 (PDT)
X-Received: by 2002:adf:f7ca:: with SMTP id a10mr10074989wrq.321.1602173604481; 
 Thu, 08 Oct 2020 09:13:24 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id z191sm7601842wme.40.2020.10.08.09.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2020 09:13:23 -0700 (PDT)
Subject: Re: [PATCH v2] hw/arm: Restrict APEI tables generation to the 'virt'
 machine
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201001162207.1566127-1-philmd@redhat.com>
 <CAFEAcA-EH3=Bg4zdu5=Y2MKOYA4Rdpzj+QCU=48yKHQdB5FXcw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <05f7c812-b3cf-7b73-37b2-7164b5ceb527@redhat.com>
Date: Thu, 8 Oct 2020 18:13:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-EH3=Bg4zdu5=Y2MKOYA4Rdpzj+QCU=48yKHQdB5FXcw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 02:56:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.214, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Dongjiu Geng <gengdongjiu@huawei.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm <qemu-arm@nongnu.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: snFg9ef3kmiu

On 10/8/20 12:50 PM, Peter Maydell wrote:
> On Thu, 1 Oct 2020 at 17:22, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> While APEI is a generic ACPI feature (usable by X86 and ARM64), only
>> the 'virt' machine uses it, by enabling the RAS Virtualization. See
>> commit 2afa8c8519: "hw/arm/virt: Introduce a RAS machine option").
>>
>> Restrict the APEI tables generation code to the single user: the virt
>> machine. If another machine wants to use it, it simply has to 'select
>> ACPI_APEI' in its Kconfig.
>>
>> Fixes: aa16508f1d ("ACPI: Build related register address fields via hardware error fw_cfg blob")
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> Reviewed-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> v2: Reworded
>>
>> Cc: Laszlo Ersek <lersek@redhat.com>
>> Cc: Xiang Zheng <zhengxiang9@huawei.com>
>> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> ---
>>  default-configs/arm-softmmu.mak | 1 -
>>  hw/arm/Kconfig                  | 1 +
>>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> I assume this needs a respin now Paolo's reworking of
> default-configs/ has gone into master.

Ah indeed. The diff is simply:

-default-configs/arm-softmmu.mak
+default-configs/devices/arm-softmmu.mak

I'll send a v3, thanks for updating me.

> 
> thanks
> -- PMM
> 

