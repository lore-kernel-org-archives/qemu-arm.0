Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp4271182ejb;
        Wed, 22 Feb 2023 05:03:07 -0800 (PST)
X-Google-Smtp-Source: AK7set/PoY4zGk1YgI/X+cgJlVT1qB0pmsGq70Yhh4DrEzMxMTreRjPRiqLxXQlQxTPqQD1LpIoT
X-Received: by 2002:a05:6870:3322:b0:16e:2c61:7404 with SMTP id x34-20020a056870332200b0016e2c617404mr8593184oae.55.1677070987469;
        Wed, 22 Feb 2023 05:03:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677070987; cv=none;
        d=google.com; s=arc-20160816;
        b=QmVj4JwrSS2ido5gdjhdEyfNia+Ep9MwttRJlPcI/wDWlE9t2U4A9LKV3KUz84oBat
         ONTh+CwL/bugKEGYWUc/Ga2QjTthREUT8wqO4oBPncYpp4nLjW0aYPUiTOCh2K4aFRcH
         fL2QmBVnsdcrKz31D/3ti3Ot1CSdWrvCYHONoayXUTHsQAUtssM1RLwkUht6wHhoy2Mg
         Jlgvo/SiKehpdfAFz226VH5ZQXyRH20epzOmVrI201BKJgbAMrIvKP6OtFakpSyDpCnm
         zmnVbQUTNP5W1Az+mcxc0KxrnRKYhc5TraBMP8Sf1XWLCfrI1prEDE/5/2+2bkuaHsQy
         f2Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fk4C97kxnAA9h3Y9yfdr5Z6NRvZF1g311GHHL8mFEwU=;
        b=NYsL8SxWYwOtgRr9Bt25rvof0Mx+n6Tl1MjJkDbvAP7gjmyky9i2QznVCqyP67CXIP
         Q5PuUEt+o1jdMHOUhzo8Dg6ae8OXU1uyo+bIADgoFbd8bM1HfL6/MYO+bKkZI2JSZPOw
         E/jzckYASQa6aylXkJX2w0fRbLXVeg1iu+C1B8UatVhUvboLz0I+KiZXjNmCRxDoJgvd
         wleDSgf3dIiRQDrAWT4Aj6KbeoMeHyjeKqwAIDwAEtxhty2T2JXHRXu9K74GARrvZodv
         2A2a0w6eiPy+EH8vL3TQFcu6qMZCfuug24DIilvuA7YaXyv3oqmt5ymCUhRivy/jO7yE
         ixRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tFR6cBhr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11-20020a05620a404b00b007128d95add8si4190188qko.35.2023.02.22.05.03.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Feb 2023 05:03:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tFR6cBhr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUolY-0005lV-7L; Wed, 22 Feb 2023 08:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUolQ-0005kI-DV
 for qemu-arm@nongnu.org; Wed, 22 Feb 2023 08:02:28 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUolN-00088G-Ea
 for qemu-arm@nongnu.org; Wed, 22 Feb 2023 08:02:28 -0500
Received: by mail-wr1-x433.google.com with SMTP id i11so1477079wrp.5
 for <qemu-arm@nongnu.org>; Wed, 22 Feb 2023 05:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fk4C97kxnAA9h3Y9yfdr5Z6NRvZF1g311GHHL8mFEwU=;
 b=tFR6cBhrC/dnh2RlJQWrtElMHE7UnosFKTMEw2ggPq57cRADbIGfNWdXg796/VVpeJ
 bWOoD6ZYmB9mP9yPO+7B2imbvAKVjVbFtkQDgofJMJ8gIIkpJcKP4bWI1IbKCKhjDUzp
 5DoEUc8nEdKbMpzTJTGBm/3hw+++QpA0PX9WLpTVoNzQ3YkvG8TQ79KicnF4d8iRcocd
 WnbDKwDDsKbTn1sXh8ORD9qLB+tlZNf6GJ659fZls5hClUZalIn4xnorfyglvNMPQPem
 0NPKEI92G1Dfg1I8Ss8DZiA7NQyyICuvZIJqipcaFhXxsqfNl8JJUxk+YuvZwVgvkenQ
 UnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fk4C97kxnAA9h3Y9yfdr5Z6NRvZF1g311GHHL8mFEwU=;
 b=Wt3SMkqRTtFTj2Sk/3McU/wvBMhRBXgrBtjUR5TTjCYEEOwB262CwFdW5A/cEX17X1
 9mxTs1TqqrST6FceE4WUkzdptUjmodJ5VV4LrV2u5Q8DerQ3lECJWYcbqRM63BFerrrl
 Aind5lPJCFXIOGz91GUfc0DGWi0f0+4Kn812BTHVCfAVjabH+aJKic+RuO30G6tuOLR8
 VBEu7ieSvLEQdpW6T3Cnf3+Do21pPy4VBJfUou3eROYFLm62iM49pGKr3gD2h3+1lNjm
 kg4WpsdEDB1S4MzgrW00hI5pHUcOIE0oOrfXYZezaoeA8Fluv4oriCYQHQUx4zRqMHTS
 aIdA==
X-Gm-Message-State: AO0yUKUYUrY6Y25rcoZR6Bg2UXGF6B5v6rquRqQCWBgPJl9ekLsTMDRY
 k25Jty+pXkgRljSizwMEGUS57w==
X-Received: by 2002:a5d:68cb:0:b0:2c7:70c:2d8c with SMTP id
 p11-20020a5d68cb000000b002c7070c2d8cmr4107057wrw.35.1677070943700; 
 Wed, 22 Feb 2023 05:02:23 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c15-20020adffb4f000000b002c55b0e6ef1sm7962417wrs.4.2023.02.22.05.02.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 05:02:23 -0800 (PST)
Message-ID: <e194dc4a-50e3-af66-67f0-774b9185ee40@linaro.org>
Date: Wed, 22 Feb 2023 14:02:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 3/5] bulk: Replace [g_]assert(0) -> g_assert_not_reached()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Rob Herring <robh@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Corey Minyard <minyard@acm.org>, Laurent Vivier <lvivier@redhat.com>
References: <20230221232520.14480-1-philmd@linaro.org>
 <20230221232520.14480-4-philmd@linaro.org>
 <484c6eed-cf57-14b3-ba38-3ed4cbad2df6@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <484c6eed-cf57-14b3-ba38-3ed4cbad2df6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: KNVqYDoGw+sQ

On 22/2/23 12:56, Thomas Huth wrote:
> On 22/02/2023 00.25, Philippe Mathieu-Daudé wrote:
>> In order to avoid warnings such commit c0a6665c3c ("target/i386:
>> Remove compilation errors when -Werror=maybe-uninitialized"),
>> replace all assert(0) and g_assert(0) by g_assert_not_reached().
>>
>> Remove any code following g_assert_not_reached().
>>
>> See previous commit for rationale.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
> ...
>> diff --git a/hw/net/i82596.c b/hw/net/i82596.c
>> index ec21e2699a..eda0f586fb 100644
>> --- a/hw/net/i82596.c
>> +++ b/hw/net/i82596.c
>> @@ -285,7 +285,7 @@ static void command_loop(I82596State *s)
>>           case CmdDump:
>>           case CmdDiagnose:
>>               printf("FIXME Command %d !!\n", cmd & 7);
>> -            assert(0);
>> +            g_assert_not_reached();
>>           }
> 
> While looking at this patch a second time, this hunk caught my eye. It 
> looks like the guest could use these commands to crash QEMU? Should this 
> be a qemu_log_mask(LOG_UNIMP,...) + graceful return instead?

I didn't want to have to worry about that, but you are right, sigh.
I'll review each case and add a preliminary patch to clean the
dangerous ones.
