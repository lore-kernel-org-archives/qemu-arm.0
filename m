Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp8594829lfb;
        Fri, 31 Dec 2021 04:09:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxrDSUqWE3gFE5pdgC4NiyRnrjz3Wuarlr6zcbhQG91FS++ACfEagbyqI275KbrbYKkZgL
X-Received: by 2002:a5b:590:: with SMTP id l16mr40423710ybp.629.1640952555950;
        Fri, 31 Dec 2021 04:09:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640952555; cv=none;
        d=google.com; s=arc-20160816;
        b=Ihm3nzMOy6dsMVnJ63szVzUkM3ZDPLEyvh25RIYyqnOOd+nqQVOeS6xSxlErslb50M
         nSqlnKWDLUJKbwJFkK2hsHINS4CKf3Y8fLSKDrwM0oxZ2D0x0jl0vqfIRva5fIrbWCc6
         NJiKgBGJoCc5h/DdNsKcqqpVIEoCRaX4B+F9Er6YkLgIFfQrlaTjothYZHHFkImiCVMu
         jlOkA/C+9H6rjtrUOrnVPuEWOhgRdEE04Sp4nOXquiaH9OPGeenw86DYMpY4wjYXVZHo
         zgj2PhlDetK6VVqTBuZhxLTPnns9jcKJ7TLYpTPHOeNrhqX1/uj5q8NLPSk0Ql1bh/Ap
         d+xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=+aJ47HVXaSVKt87WZ5WXHh6cq654mrguEUGg2++50zQ=;
        b=gh/tSS8C577VJwQF3TA3L7fN2Pg3fo2wmmI/CGs3HSsr7Y+joMqdS1ptSk67ZekC9M
         3F8/JnrqKdCe3JNudAxY1bHFjgCUou1S306+A6MfxTPmCXxhCDEP8kXHXMmSgKOE94Fi
         xcyCniGhxqFz2gebjcLcLMUSdNSuoGpZWe3UUnpQO6svsWMXBJkBcJUzzB7VpPwx9iar
         Gy0GWJgIQVmn4tZHVsbMy9skQIbAvhZzxB6QbAiVJyuCIakutF3GUvmCPJT6N5hSnjIT
         BiJMrOIj5jaYB4qvEI4rpe/wq4tdMnJJnckDzuj2lzVLfTMZ+gg4Hje6edCLYETUkDht
         TgWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bIFnJDEP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s184si14906564ybc.255.2021.12.31.04.09.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Dec 2021 04:09:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bIFnJDEP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n3Gih-0000hD-Bf
	for alex.bennee@linaro.org; Fri, 31 Dec 2021 07:09:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3Gew-00065q-Hd
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:05:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3Get-0002C4-DG
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:05:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640952317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+aJ47HVXaSVKt87WZ5WXHh6cq654mrguEUGg2++50zQ=;
 b=bIFnJDEPxOF0pt9fjgJ7d+btPC1lIwrdlxTvcT3HuaN5Ov1aqhUVjtf3tP32tlKHPlPOer
 Z9YVJ0Er8KqzhCQyhOMAj5Ut42OfRtWcSa/tuUdHhIrFVzVK6ejQU8gBuWSdcbtwnifU7/
 4c6JA8TuSAAm3nH4QxjzELfMWFZzcpQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-eh1Y_y8NNPKqX5EcLsULaw-1; Fri, 31 Dec 2021 07:05:16 -0500
X-MC-Unique: eh1Y_y8NNPKqX5EcLsULaw-1
Received: by mail-wr1-f72.google.com with SMTP id
 x20-20020adfbb54000000b001a0d044e20fso7539548wrg.11
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+aJ47HVXaSVKt87WZ5WXHh6cq654mrguEUGg2++50zQ=;
 b=2OgSfXFedggVOCgucJA0GrlrGY1lmYNE8c3ZZhHFx9qR+JMqNnYNG0zzA8mmmgwkzD
 2C/CvSzlOhYHNuqBDetXlkG/bH74keV/7Nu9jCDCk8GvSSpStMOl2359dJvjlW+okwNt
 sdQfVIJNOwhvoltSJ9k4eRx/ZxRogei1Ezxei8BHrKNcfRlAB3GsEj2vOsJqp5T58iXT
 MQ5dAD1uqo05mGnGOA+F6kJtW4I29hfG4RoKf4OvKoxV8kqX+5H9aRtQYXSETaW/+plt
 oqvuloym2tvzWYUGglIA4SBG0lvIbxN4V/RTuomY2DFgj5WvoYjrQ91U6HzQ7pXyxdhi
 3NNg==
X-Gm-Message-State: AOAM532vMt3W+z6GeC8m9M2N6L8htcPhnTxh+mhQ/M10uHwNAaSNYls4
 aWBfBRPluRAT4fNPleBdAp7JvFoW7L50/+36NHKmKa/PeZumrnfn5QKIz1KbjsVjPS+TZd+9c09
 l4Lw8Kx4qMOD+nv4=
X-Received: by 2002:a05:600c:3d8f:: with SMTP id
 bi15mr23109298wmb.172.1640952315520; 
 Fri, 31 Dec 2021 04:05:15 -0800 (PST)
X-Received: by 2002:a05:600c:3d8f:: with SMTP id
 bi15mr23109272wmb.172.1640952315332; 
 Fri, 31 Dec 2021 04:05:15 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id r1sm30525501wrz.30.2021.12.31.04.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 04:05:14 -0800 (PST)
Message-ID: <42848f9f-556a-19ea-e7bb-cc66ea75c617@redhat.com>
Date: Fri, 31 Dec 2021 13:05:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 00/14] ARM virt: Introduce CPU clusters topology support
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20211228092221.21068-1-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211228092221.21068-1-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qc3Rs6uXpLyU

On 12/28/21 10:22, Yanan Wang wrote:
> Hi,
> 
> This series introduces the new CPU clusters topology parameter
> and enable the support for it on ARM virt machines.

> Yanan Wang (14):
>   qemu-options: Improve readability of SMP related Docs
>   hw/core/machine: Introduce CPU cluster topology support
>   hw/core/machine: Wrap target specific parameters together
>   tests/unit/test-smp-parse: Add testcases for CPU clusters
>   tests/unit/test-smp-parse: No need to explicitly zero MachineClass
>     members
>   tests/unit/test-smp-parse: Keep default MIN/MAX CPUs in
>     machine_base_class_init
>   MAINTAINERS: Self-recommended as reviewer of "Machine core"

Patches 1, 2, 4-7 queued, thanks.

