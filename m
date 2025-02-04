Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp405119njb;
        Tue, 4 Feb 2025 10:25:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWQMX8rEOK/5AFiDvg7N8baJ4l/4yuSoIi9G+Uni4OucG+qE3YAC7Wx5Ps7ES2RNaBH0glJH38XkPwhLg==@linaro.org
X-Google-Smtp-Source: AGHT+IH9Y3wKUuwkEzQ6GKZjIQjXnkJOkAijoQvZ/d/1uV+A58flzW7aGqb1qQEVht1dy7m4ReaX
X-Received: by 2002:ac5:c246:0:b0:517:e7b7:d04b with SMTP id 71dfb90a1353d-51ef988849dmr2843468e0c.5.1738693515536;
        Tue, 04 Feb 2025 10:25:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738693515; cv=none;
        d=google.com; s=arc-20240605;
        b=Vi60IgnotFl4kKQJJPSMbk3SU7TKK6U///ngp121m36nifdq+G4CNVaN+tDVaMgKLx
         PNtqTWSd3YeQXQT2RQVeVC0ZAn7vE4pwrNhy5Ga+/QO/L5/8hR/UIfsl+1UVFYC0KdGN
         30BhkiRL1Q9Y1N4J6KA0eG8EmYy7/hku/3y9EJeuAatn97gUYRiEXHHgCW0j+tzzK7Yt
         aQiOwelrrbR0An8i5uQsRHQ+67axz/9YtoZF9laEj0R5d5GxPqFYmANoNNHvOEibZRYT
         k5/ZsnQMTnID0/luLTGXkoGL9LnFOV5/Wi93IhnZ3HSwcr3G1Wc5Je3QndzFbIHcLW1U
         NW/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=PuoMbFTQ2eHa6eRLB3+BZbU6oebJ1wBzjsF+hO3gTOE=;
        fh=hpVBsT4/Ru6AorqiSOGmuWYuI7E4BAxRe2LwsgicD9o=;
        b=jv9VGYK2DpXoEZ/yCeGRZExKahNLOjRqAJthURLFDZuzn6svlzVhaHw9alRYmM6rv8
         Z8wJOnV2MsDcxkHLq20C/jvD8mIby2l8HrgkSvzl2jH4XnFa6s6JDw00pBru8sYlK8i5
         6Dnu74FMsKV0thryApXZ8EEf9MK69Dp5edSDhKfuRkRXl/Hb2nKGKc6x01sai3xTgBtP
         FIqBa2ZUE8RO9bRx6DoYShWUD0q2jhNWF5U0sFq3g/vVWPw+Ps98WLg7SSq1+KvmyJFt
         nbYT+NDBiYuRrzVOuy0cy5BtI7ljxtssN8ZZeKC9Oj9Ov4i+u5cH0z7r49eVEotZUsru
         GbsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qdr+ycaS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-866e4ba806bsi323131241.93.2025.02.04.10.25.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 10:25:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qdr+ycaS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfNbW-0003uF-DS; Tue, 04 Feb 2025 13:24:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNbT-0003sg-SL
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:24:55 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNbP-0002cG-L4
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:24:55 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38dae70f5d9so524134f8f.1
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 10:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738693490; x=1739298290; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PuoMbFTQ2eHa6eRLB3+BZbU6oebJ1wBzjsF+hO3gTOE=;
 b=Qdr+ycaSIWZmHcurO8NdCP2BiatazzRFJ8tC5IyscPOimFdkhWyvxI18Lm/N3R3Xpj
 NNULOmO/bQNEu7zxOOYuiK6XFQyfogwcHR7tcAaDg5GjaCpyW/7GZ7T5zLSBmkSo40fm
 +PAF/6OiLIetBkbzA/RDl9yu1hZgjx1THF4i5mKGgarBajrXN66j6lE0eSrGov2Z4JO0
 FtSvlYLw0+Kh1eOgq3n/ZN4raFgce1MTw4Ml9lC+9iQV7RO8/nEiuheEK1P0bm+ktjVn
 1KptgLgf7FsC3gynL0q7fD/mTgGYkpGDqzbp9wWwAsl0gjGOWu2IAzqc5+dzNRqqmdj6
 CoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738693490; x=1739298290;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PuoMbFTQ2eHa6eRLB3+BZbU6oebJ1wBzjsF+hO3gTOE=;
 b=mAPEhRlQ9gqDb/RwP0lZxzJJt4Vxf8CGDG0N3QTWSIo6BRmf96maDWLC++v6/DQGgJ
 Ba8B7J0+s7IvqTjAHAOoYccQZGNydHYyiXR0R+pgv4rVm4lfiq581codc+rI/ahonBL0
 KYywi10kabpgJgbxDlPaXWMo/wEysz416Dr2bKUYJVcEiICyuMEQFz08bW4ymLPJ2e/t
 T75Q5f5PcVprYC4qRBMBUdUYC9jDOoTCUCHBm3AKCUwgpmX4nrgXBGPy57MLWWkUZ8BT
 1HiiXsyiCh7+ZKX0rWOrRmf5wAQ5AelZzBmqJ83Ftwclf8RkjL4OVeD0GH7mdaYxziOD
 M7Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGFtARx136LXTj50Pksb7W8RnDhLv6LC1Qm4E0cH3qvqlLhbHR59mfacg/n1kSxPRkR68TsQIIOA==@nongnu.org
X-Gm-Message-State: AOJu0YyEzkXbEGnNkjBEexXFo8DkQelpimbbZe0dTtv/5V/d47/vTOgq
 BeFtVcboWgu6Sg2YpkfeRbz+XPNYVTE7cu5svcxwtC3/MTWJ/0egIKPvWaWKTZo=
X-Gm-Gg: ASbGnctFZILZRoPnLM/5GTmmpVO8RZYSQpExopbDhbhVobos1vUMu5rOdSuP2QTPO+y
 XAeH+/3Sj7272x+eR9pcp5lM/NOCXBp3mmpbrawZ2QkdnBL12VzSLwcztt4LHOB9MnLv0GIcAep
 lpaxJnhdr9ZPfYei4EQgyA2tiQweIK0xsMvii+BkuJQBLmn8eRfEmuqSd9bDxAxUYxPDzUWWL+7
 YsU/dt/N8YBv0fLi0iKs1ZAwHETqBsnqHjNOOd/nsoQKLn4GXLbQduCPTLH2gKUdfzZws273WSB
 q3gAOBI3ylOH2PesLk84Tf8A5L/BhEOVzJAM/dRz+TDHHcRt0US/LsQos5M=
X-Received: by 2002:a05:6000:381:b0:38d:b114:4be4 with SMTP id
 ffacd0b85a97d-38db1144c2cmr1350067f8f.47.1738693489808; 
 Tue, 04 Feb 2025 10:24:49 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1016easm16503884f8f.24.2025.02.04.10.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 10:24:49 -0800 (PST)
Message-ID: <ef83d303-e891-495c-ba1d-d95129fdbf25@linaro.org>
Date: Tue, 4 Feb 2025 19:24:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] hw/boards: Rename no_sdcard -> auto_create_sdcard
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
References: <20250204180746.58357-1-philmd@linaro.org>
 <20250204180746.58357-4-philmd@linaro.org>
 <31346ebc-aa7d-45f2-b840-6dc3450983c6@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <31346ebc-aa7d-45f2-b840-6dc3450983c6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: xcX3VIZCajGA

On 4/2/25 19:19, Thomas Huth wrote:
> On 04/02/2025 19.07, Philippe Mathieu-Daudé wrote:
>> Invert the 'no_sdcard' logic, renaming it as the more explicit
>> "auto_create_sdcard". Machines are supposed to create a SD Card
>> drive when this flag is set. In many cases it doesn't make much
>> sense (as boards don't expose SD Card host controller), but this
>> is patch only aims to expose that nonsense; so no logical change
>> intended (mechanical patch using gsed).
>>
>> Most of the changes are:
>>
>>    -    mc->no_sdcard = ON_OFF_AUTO_OFF;
>>    +    mc->auto_create_sdcard = true;
>>
>> Except in
>>   . hw/core/null-machine.c
>>   . hw/arm/xilinx_zynq.c
>>   . hw/s390x/s390-virtio-ccw.c
>> where the disabled option is manually removed (since default):
> ...
>> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
>> index dc80181ea43..2d626a96b9b 100644
>> --- a/hw/arm/xilinx_zynq.c
>> +++ b/hw/arm/xilinx_zynq.c
>> @@ -463,11 +463,10 @@ static void zynq_machine_class_init(ObjectClass 
>> *oc, void *data)
>>       mc->desc = "Xilinx Zynq Platform Baseboard for Cortex-A9";
>>       mc->init = zynq_init;
>>       mc->max_cpus = ZYNQ_MAX_CPUS;
>> -    mc->no_sdcard = ON_OFF_AUTO_ON;
>>       mc->ignore_memory_transaction_failures = true;
>>       mc->valid_cpu_types = valid_cpu_types;
>>       mc->default_ram_id = "zynq.ext_ram";
>> -    mc->no_sdcard = ON_OFF_AUTO_OFF;
>> +    mc->auto_create_sdcard = true;
> 
> That's now wrong, too ... it should get removed (as you say in the patch 
> description).

Thanks, mis-rebase I presume :/
