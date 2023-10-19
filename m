Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp337072ejb;
        Thu, 19 Oct 2023 00:45:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYu3sBLiveHM1tgVYPphrmxAaALq810IuyBRCtps66g/ccr7erG/jDVsErPy+Zg8ODB6pg
X-Received: by 2002:a05:622a:1a83:b0:41c:bd6f:e77f with SMTP id s3-20020a05622a1a8300b0041cbd6fe77fmr1776362qtc.55.1697701538979;
        Thu, 19 Oct 2023 00:45:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697701538; cv=none;
        d=google.com; s=arc-20160816;
        b=yKYl72DaG7QLNTEAJvBI3KfNRT2Ro5CN5yVLio0YPi/hN78mYVxd10lcHU8ckNO+s6
         oZVnxzXB4yhQljNGjfbocPiyuEQ7NpACGlAYXa60l0MzF1++6oOcUNJP33p22IrJ2nOe
         RjDrfW2RdLohL0uUXCopAqpWlysvOhUDuuTgWJNydMykzjFSxWaT51S/Ow74os3g0mmv
         6nBnOD0ArgDKwIg4/yBGhuce5nrOL8djYD5ltJyUo69YnjaGukmgLch5Xz9G4b5eNKuL
         HDn1NxnYwSp8A/G43CEqA5G14sqyMd1etYUtUSOL+kkT3rc7vM1pKKH0fkjA7axmHHNU
         V54Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=/YPfYdad7SsXQMIQSnRAHnWJH4XbDODUlROipljkV50=;
        fh=/Gu37Vr91t9MFY1Ts9oDksSE8ZDQNteBQkb4V4psqfw=;
        b=nq9afdF4GMjn5sgOYrkNBwZbdOEog10uz/uwSp0uSymSiep7rATvm8keM2MY6QZAfa
         8HWuBDArTR94sRJPTAxUDJjMsNwNIXrYly4VsiJP/de04UvhioVsSXMn0EFJUvdMKPVl
         ES4U7BLU3j4XVb+YmQRn2BN3TvNiKw/ddbsrFnJH/t8xpyTUsKT5UDsBgvA5qka0W84Q
         bkruh6P0hKV31ipZfebGlsYPm3vxf7rrRqFf9gfEudv7bERGo2KQx0k1eZKW/IHXSQgd
         4UVUYawia7xzARRnRXScxc2byJP1Wxvlp3c03KGSG4S3sBiG7Q5CjL5Txv7b4uaa15Or
         kYyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kj8AMgm3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8-20020ac87fc8000000b004197e29e35bsi1219769qtk.128.2023.10.19.00.45.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 00:45:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kj8AMgm3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtNil-0003ai-7f; Thu, 19 Oct 2023 03:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtNiU-0003RD-QS
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:45:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtNiQ-0005u6-Gz
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:45:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697701508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/YPfYdad7SsXQMIQSnRAHnWJH4XbDODUlROipljkV50=;
 b=Kj8AMgm3aFLx5K65Xv6e2ZUkXlsadtkZrWgDIXIgJr5T4PY7HIjwOirDf9s5MDWOQmWDRu
 r8BVyY1PF0FjIRsT9jPXXMvWM3PfHHDv3F1ej+vFUZKc4TrkuIPqTkc2JLMy2aE8nAikZG
 bOLjN00kHgzg/w4MJyiSoVEmWGL34ok=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-gv2ZI293PNGnxs_r37ZGxg-1; Thu, 19 Oct 2023 03:44:51 -0400
X-MC-Unique: gv2ZI293PNGnxs_r37ZGxg-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-77892a3d8f3so257545885a.3
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 00:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697701491; x=1698306291;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/YPfYdad7SsXQMIQSnRAHnWJH4XbDODUlROipljkV50=;
 b=lyNe6CpgdCH3gx2ePoJ1IWemrIWQBNlON/8B5E4+00+LOz0wlhtyvqtHVVD1MAYy5R
 fcTrizrGnrObvSGQZBItiL7AB1yGOTaxGNpx+Y7xoz/LDuU0uo7fwP67W+vIhDqj9k6k
 wPNM9JAtT2OMSzXTNm97fNwhC7LrHlJbbmlNEh/hU5slfckhUBOgCGLL0v3a+wrU5vHy
 oMY/sQnmbIUDiKguKvhjocKf/tGfhU9EdIEg+OqDI2fR9EElb9HK05gqmKc7+nnXeZNj
 adQSfGcaU4hrChlbQrEeGqQoKgqGRh9rO01s2jd8+SWNNnFqMDxA+thw3+4R9tleNScT
 Tr1w==
X-Gm-Message-State: AOJu0YxDe9NlMIWqBASlsN5Mxwo3UfA253qHcIJgwi6v7qxVS2TaXl5f
 2Y1uaHwFcyZA9mU+C+NA1UuPfDds9p3zVtL2+hAcIJwNa2He5BF66huM4vsQBVv0MABf/iHwZWD
 Ai2/NhaWzlQvW
X-Received: by 2002:a05:620a:2591:b0:76f:17ad:3c83 with SMTP id
 x17-20020a05620a259100b0076f17ad3c83mr1581236qko.47.1697701490978; 
 Thu, 19 Oct 2023 00:44:50 -0700 (PDT)
X-Received: by 2002:a05:620a:2591:b0:76f:17ad:3c83 with SMTP id
 x17-20020a05620a259100b0076f17ad3c83mr1581219qko.47.1697701490645; 
 Thu, 19 Oct 2023 00:44:50 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-141.web.vodafone.de.
 [109.43.176.141]) by smtp.gmail.com with ESMTPSA id
 d6-20020a05620a140600b00767d8e12ce3sm573639qkj.49.2023.10.19.00.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 00:44:50 -0700 (PDT)
Message-ID: <71e30641-cfa9-43f3-89e5-95578f92cb58@redhat.com>
Date: Thu, 19 Oct 2023 09:44:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] hw/misc/allwinner-dramc: Do not use SysBus API
 to map local MMIO region
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>, Beniamino Galvani
 <b.galvani@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <20231019071611.98885-1-philmd@linaro.org>
 <20231019071611.98885-5-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231019071611.98885-5-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mDDvbRJxnXkA

On 19/10/2023 09.16, Philippe Mathieu-Daudé wrote:
> There is no point in exposing an internal MMIO region via
> SysBus and directly mapping it in the very same device.
> 
> Just map it without using the SysBus API.
> 
> Transformation done using the following coccinelle script:
> 
>    @@
>    expression sbdev;
>    expression index;
>    expression addr;
>    expression subregion;
>    @@
>    -    sysbus_init_mmio(sbdev, subregion);
>         ... when != sbdev
>    -    sysbus_mmio_map(sbdev, index, addr);
>    +    memory_region_add_subregion(get_system_memory(),
>    +                                addr, subregion);
> 
>    @@
>    expression priority;
>    @@
>    -    sysbus_init_mmio(sbdev, subregion);
>         ... when != sbdev
>    -    sysbus_mmio_map_overlap(sbdev, index, addr, priority);
>    +    memory_region_add_subregion_overlap(get_system_memory(),
>    +                                        addr,
>    +                                        subregion, priority);
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/misc/allwinner-r40-dramc.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


