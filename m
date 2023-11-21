Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp692244ejy;
        Tue, 21 Nov 2023 10:52:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1QBrZ1iiMGfmfRRby0QTgUf8P2b5RaUbr5Re9omeJjYsfnOiuzNtKGVLXvOrzhTJaWllW
X-Received: by 2002:a05:6214:f28:b0:679:e834:3eea with SMTP id iw8-20020a0562140f2800b00679e8343eeamr5054749qvb.2.1700592764062;
        Tue, 21 Nov 2023 10:52:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700592764; cv=none;
        d=google.com; s=arc-20160816;
        b=LowChzE8ioflnztT4oaVbeqgzYTON5sp6RTZLkbr1R+L0wTVTBwRtuzZj2JZoZ0tc1
         9FzPL11huV0HG0qduS65GHPhn0iFiqcFX9HbHmOG0NYuDs3T+Rgy37kxqBou/xCzHyJZ
         DXofvWs6WTG3CodB9hN4j1VbcfflC0fYZ1v0nEq4dHBbhQMpRLHjK5oX3rif/PWNqGuJ
         t21Kr5TXLJ25qBnOiamTND77mQA/NhLDrxSCv8CbFZcsH5bL0PuV9yLZVBEFKzwkv68+
         slOh2CCglJ6oMGe/wqpvvbdWfyj59UnV26qqNc01Hih2nYCo+1zzbn08h+XNrii83Mor
         n2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=H+G+BY9ETnlElcUd6mgXcxGpvhtWSeNwcm0URAYlHaU=;
        fh=7ioxn6LWsCzgGR12WMVU/wASROmAygH/3PvRDFKIzPw=;
        b=0y9jMly3TIrGviZYYxJj6HD0/z6kuoY94PZJH7veMJTZAw2XIFVmF7bJ2EdazoSHMA
         ApZtxLSNfEiOjW6K5HtlCRgNFDzzZq6A+1Y+ihU1kiVfDQ98gqH3YkLrJgj1fzqwNVDt
         Ccmc/Gl23fTzyl2B3WS6gledgbSItD/9gwbPXzj1VxTVOUepDgUU7BMXuR3F/PM8nQvc
         8OaHG7Pfr8zghkKISqwVbMTivco1aot5ruSrMwp0k7bGZ78WsfkOuYJYHelr9go8yIQe
         o3Wu7B3MRB/w1GoV+DscKV0CdmkzdWaOP3bBKEeKqsgyOeBWWjKZ3mNoriTyvLCucA94
         Cljg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xW2toLJD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w16-20020a05620a445000b00779d0a62e5fsi10843433qkp.660.2023.11.21.10.52.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 10:52:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xW2toLJD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5VrJ-0002Ux-AB; Tue, 21 Nov 2023 13:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r5VrH-0002Qx-Jv
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 13:52:27 -0500
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r5VrE-0007m5-1G
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 13:52:26 -0500
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1eb39505ba4so3646549fac.0
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 10:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700592743; x=1701197543; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H+G+BY9ETnlElcUd6mgXcxGpvhtWSeNwcm0URAYlHaU=;
 b=xW2toLJDVMSjo0AlQmCa11dwGGAf8UA2Q7vkczg/Liy/pqnFnyJyLtzQ0SxcOZ5nKW
 8J1f6IBcIBLzJ3Azi8BRGjEJtHRwMAmdheXmQpK6WV3biLxMUyrxUCnJg87xsOE/lyLV
 5Z2aIYvUBsUrNASfS87SfmYk/cMlPZtlD+51hiDEXVLJQH96RwOpZwKgUjQOIIwdnJoJ
 47FUNdXp/fv7uD1yy1sRQXc4wBdyZiKa360TMaOHFBW58stxx9A97TQCdDFtiyrmLCV0
 axk40hZ8vIqsX0Jt0S/pw5dFJxphWDitcY+icelH+eYOMWa1sPeHMFZ7iPQjH9om5hzd
 9A0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700592743; x=1701197543;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H+G+BY9ETnlElcUd6mgXcxGpvhtWSeNwcm0URAYlHaU=;
 b=p/WMhvZ/nf6AHi/SnhDmWZ+VcV/jSX1pg/0sj1l6Jvi2poOtFxNyonp3gremZRIElY
 7jkJBPFWRSBp+A8Q7c0np84y+/M6b7Adn1jEvE+C5US3odv3a+Z3Cf81N8jGvLBpyLHb
 lvtlZQwR5MmThq+XCbRhT1WiPBidcqDTH9Wx3qkGGTP0NPqXggRVp7M+oJVt0d3iBjYD
 KiRpoCycVhqhl0db2A3NWQS0uBr5xcLLtmBl26qBk/+P9ghtS6I0U/qaweJ5YBx+ESul
 M4ASfX2SHlPdOHntx1yrBCRyeD4EmaN2yO7PDsQCAdExOBlID9dfhKIHspeqjpcsj46P
 wEXQ==
X-Gm-Message-State: AOJu0Ywd/NfepVvimVtkW2Xc81kjAcaTqXje6nGiTDwTcu3SWyReMEqk
 TkQ0+CWaZV4BejGmgJoH1KM9THETyhGRQwyw9MTNntNt
X-Received: by 2002:a05:6870:3910:b0:1f5:c751:e7b1 with SMTP id
 b16-20020a056870391000b001f5c751e7b1mr178980oap.45.1700592742799; 
 Tue, 21 Nov 2023 10:52:22 -0800 (PST)
Received: from [172.20.7.39] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a056870a3c500b001f94a466974sm689197oak.41.2023.11.21.10.52.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 10:52:22 -0800 (PST)
Message-ID: <60d64320-8fd2-4cf3-acb6-ed758c1ff465@linaro.org>
Date: Tue, 21 Nov 2023 12:52:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 04/25] memory: Simplify
 memory_region_init_rom_nomigrate() calls
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Xu <peterx@redhat.com>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-5-philmd@linaro.org>
 <958391d5-b1b5-43bf-b3d1-a6071e77b5cd@linaro.org>
In-Reply-To: <958391d5-b1b5-43bf-b3d1-a6071e77b5cd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x33.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: Y51uLhXEAkNa

On 11/21/23 12:50, Richard Henderson wrote:
> On 11/20/23 15:32, Philippe Mathieu-Daudé wrote:
>> Mechanical change using the following coccinelle script:
>>
>> @@
>> expression mr, owner, arg3, arg4, errp;
>> @@
>> -   memory_region_init_rom_nomigrate(mr, owner, arg3, arg4, &errp);
>>      if (
>> -       errp
>> +       !memory_region_init_rom_nomigrate(mr, owner, arg3, arg4, &errp)
> 
> This coccinelle script doesn't quite match...
> 
>> @@ -3628,11 +3628,8 @@ void memory_region_init_rom(MemoryRegion *mr,
>>                               Error **errp)
>>   {
>>       DeviceState *owner_dev;
>> -    Error *err = NULL;
>> -    memory_region_init_rom_nomigrate(mr, owner, name, size, &err);
> 
> ... this?

I'm sorry, it does.  "expression errp" can match "err".
It's the manual local variable removal that threw me off.


r~

