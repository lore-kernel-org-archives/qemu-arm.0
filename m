Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2089339ejf;
        Mon, 26 Feb 2024 06:29:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW9eOJmoLZVQ+kLgt602ElJwniFLQ5WnNAWnCQ14Jxe6H3P/uMhK2VzhfKzREB8u++eEieVctSpMTJlPvrLliwncwja1krH
X-Google-Smtp-Source: AGHT+IG+UncuW36r1ThXwyMCkTatX2nNEm8dxGmRU8cHePoMT0TMYb/sEv22Vt8rM9U2dvYWeao0
X-Received: by 2002:ae9:e412:0:b0:787:bb45:60e8 with SMTP id q18-20020ae9e412000000b00787bb4560e8mr11394564qkc.33.1708957790690;
        Mon, 26 Feb 2024 06:29:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708957790; cv=none;
        d=google.com; s=arc-20160816;
        b=X5dFp5zMwF0hCJkZEZ0wuBbH2w0YJzsyGn/B0DhXs1FdFrDoR8IwM5GM+D3ZEpUAv9
         6VC/S9oNWrgIU+yV2Hsh8mPrKgIsVPtM20g/I1sumcefqpb+nuBPUlhoGzUK59OMsYvE
         FhSqB0lzE+oijoWN2hoTtMN5GcFdqhSqAFJe8zrZxscPx6+QI7oS/rUZ5QL/x5vAC2qo
         mjDmfWXUDu7a3qq+ddgSvAA13PDQmUNkxXElkuQmVgg5sjaQY9DE2patPdK1sRZRKuca
         4xqdimdxK/efvrUr02JGVlpMaJtZ15FWIEERVKSPa0R6LDynwl47JHMyzUQNHsrmLCsN
         lHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=p5V6T/S23ro90/XXslrjXWQ3eNACND7aZH/oW8xf9V8=;
        fh=KOzMXlrcGP6l2GQv4QF20AjbV3Axcv4i60/H/fu8fM4=;
        b=OM2z0wH0p57T3zFHsDChL+aNR0gx4+vuENTnXEJ10QWz9APM4VDZbObTJOi6NOV85i
         xHIpwwXYUFGOOq/j1Af56ZLcBn800JGDvLmicOoScY+hq9uHMtU5qRI6NL7/Ty7y6SyV
         n6tmwD4a3GMXRdBYEaZdYDkJuOj6AQzk0quXijPQMNsj7NtcwmIzQVpbQpakCUlWR90m
         5TsUmpfXWu0R4xvjWhLgIMDqWsD1DtvkUuq6qAU3FQOFpdzWUvf/zBkK4QezXVaf0qaY
         YGqnwSYwVo0QKTxN80BmaVmwW46w5ahSnzaelo4ZLK9+NAkVXfa7dwOibp+vCj6lbQoS
         SECg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SPgkj17b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14-20020a05620a04ee00b007859e867c1asi4981005qkh.557.2024.02.26.06.29.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 06:29:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SPgkj17b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rebGY-0000kz-IT; Mon, 26 Feb 2024 08:43:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rebGX-0000kK-10
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 08:43:33 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rebGV-0005WA-Cj
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 08:43:32 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-412a7b68809so3990675e9.0
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 05:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708955010; x=1709559810; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p5V6T/S23ro90/XXslrjXWQ3eNACND7aZH/oW8xf9V8=;
 b=SPgkj17byEVLFWVdrcAexxRnGPd0NloCPN4VXMAHkwRBSvaBP+a1z7iTD+VFtNz1OR
 dkOBrGN+knH3prV/2pyY5JxEv1M005YwaVC0f+P0FK1AnZU12Mv6cMrBvWouwXvdL/MG
 nueYL3k7GkMmdHvmid5uXnQFTHrsTuaTwBXA7ANqF8HydEkd+8SiRYOeHh9OD+WC/Tdd
 PAlpmsNdtLD8Sf3fyIVY0JhDhltA3uC/MPCOWKzMEZ/SlxYYsq2UPLUiyBhc+zI9N1pY
 +L8S84P6VbaR7jSzjH5u8/SUy5vdSIsKzzKRzPScNSXRoIGZ07SUZrscTH5uCHGX2ZSb
 36Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708955010; x=1709559810;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p5V6T/S23ro90/XXslrjXWQ3eNACND7aZH/oW8xf9V8=;
 b=jG3sAkpIZudCaRyNpSw7EhHJD2au09gCCh1jx3hqsPk6VrrySqqXJyw3gKl9AFeC0P
 FXTlJ397uhKT+oV8TqW3nJBXp+sQeAQ2A3vwaMZDg+r9UDD1RNjVZE2FkmrYTZ8CaMOQ
 jB7CH6raGLeOYH0fwwopAbvLqKgbHAMegis/aSBlMZdZlb2eFwNfWkKIdmimv5YMM6c+
 /Ax3OmqyBD1VLMelCRblpsCdgTlMrSGdfX1NHqzmeycMBhm+dB0nb9M1TQMtdgejWApf
 ++c7xEWlFVexUPu63UYv2JjLw36MH6wPwDZCcYeC2j32vJx4mMXLfHIFSpIszJVz7cx5
 ypnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCJKYmXHTvrpG7XVdzuzU4l5Gzk93WP+yY/ubZxDQJ/KulP/SXfVuyLoMVaaBVtrWxn5YO4FR1oiX4ha4nxWRM4d37
X-Gm-Message-State: AOJu0YydesrrL6K7jReeNGtGBWWw5fIHMaX451IQy9aywHXdwSZGWn6N
 EByJpu++VEZwqQdI5CLbaH4S+91uk50tBaeWZxXtfO9/BNA7gskkovKX7yvSzeM=
X-Received: by 2002:a05:6000:110:b0:33d:ca9:1fab with SMTP id
 o16-20020a056000011000b0033d0ca91fabmr4687694wrx.5.1708955009696; 
 Mon, 26 Feb 2024 05:43:29 -0800 (PST)
Received: from [192.168.69.100] ([176.187.223.153])
 by smtp.gmail.com with ESMTPSA id
 d3-20020adffbc3000000b0033dd2c3131fsm4573228wrs.65.2024.02.26.05.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 05:43:29 -0800 (PST)
Message-ID: <5dfafae8-c429-4d2d-9ec4-240b8d4290ca@linaro.org>
Date: Mon, 26 Feb 2024 14:43:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] hw/ide: Include 'ide_internal.h' from current path
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20240225171637.4709-1-philmd@linaro.org>
 <20240225171637.4709-4-philmd@linaro.org>
 <feffd329-59e0-0291-0dd6-76a625da190b@eik.bme.hu>
 <878r37lll6.fsf@pond.sub.org>
 <fd0fba89-cd93-4113-9f3d-2ee20f2217d9@linaro.org>
 <90219760-aad5-82b2-41aa-be563f52fdf9@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <90219760-aad5-82b2-41aa-be563f52fdf9@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: Sr3kXkTHT02W

On 26/2/24 11:50, BALATON Zoltan wrote:
> On Mon, 26 Feb 2024, Philippe Mathieu-Daudé wrote:
>> On 26/2/24 08:40, Markus Armbruster wrote:
>>> BALATON Zoltan <balaton@eik.bme.hu> writes:
>>>
>>>> On Sun, 25 Feb 2024, Philippe Mathieu-Daudé wrote:
>>>>> Rename "internal.h" as "ide_internal.h", and include
>>>>
>>>> Is there a convention about using underscore or dash in file names? 
>>>> The headers Thomas added are using - as well as ahci-allwinner.c, 
>>>> only ahci_internal.h has _ (but there are others elsewhere such as 
>>>> pci_device.h). Maybe we should be consistent at least within IDE and 
>>>> this series is now a good opportunity for renaming these headers to 
>>>> match. But it's just a small nit, thanks for picking this up.
>>>
>>> This is one of the many unnecessary inconsistencies we're inflicting on
>>> ourselves.
>>>
>>> We have more than 3600 file names containing '-', and more almost 2700
>>> containing '_'.  Bizarrely, 68 of them contain both.
>>>
>>> I strongly prefer '_' myself.
>>>
>>> Zoltan is making a local consistency argument for '-'.
>>>
>>> Let's use '-' here.
>>
>> Fine, patch updated.
> 
> And then please also rename ahci_internal.h to use '-' to be really 
> consistent.

I'm sorry but I don't have time. Maybe fill a ByteSized task?

