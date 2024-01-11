Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1495182ejs;
        Wed, 10 Jan 2024 22:02:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHunq+VG5qtU9CQObd4cSR3gCUTuPvP/lnXdXZRuKnkgY1l4s/TW8i2q/KcZl2166gsuX6A
X-Received: by 2002:a05:620a:228a:b0:783:2a2a:4ec4 with SMTP id o10-20020a05620a228a00b007832a2a4ec4mr707513qkh.111.1704952975784;
        Wed, 10 Jan 2024 22:02:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704952975; cv=none;
        d=google.com; s=arc-20160816;
        b=sUGheYAP8twtsQqpZi51JtzrS9kUSziDNQ375bKPrvgW+ke9WXAIfBDKAKIs/nzZXb
         3jLS4ALP8Q7B0oxZRBki4W7KOuHSjbGmdJx7jJbDCreijstOBC6GE3oUAyWEr2NGlSmx
         jtc9wa9cCvbyknxHKb+j9eZVRD++p3rOnXk/WP+mqHIAeQg1RnM1CleH9bWfG7Z/8xDm
         0VFp/8xLZuRxvH1MQFEMly5RLuNOfGegqnzTjhieZk3XusQyTEza83y8LOrU8W1OU+mw
         Iu3U4X19KIszcSkqwbIfaWEcMAcLQM48R4s//m7aS/M7knj1cRz09BawileYhPa8LE6D
         tCyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=svmVfxBLPI/Y3WTiwU0rrYfGXA1e8Kn/6Y7iOqANOS4=;
        fh=XcEHLRNjPBDodETUzRVCfHBTgra0zEsB73smEU0OXHs=;
        b=aUeRGLm2Yhzqw3qb9L+R/UVM/kxRfYBF9dAubK+g459fyZ5TA3DmAk6u97PNp01rdz
         VkB40quTvSVQbt4EsgY39uS9S/cBcx7M7Kmp1zNoDIbaRS1PGisaPiIyCAkwvPeQ7xhU
         O22ys0RSrecO9ecLtLoDfHxE1DPUrR19gT6F6vl1F3Ggu9ZMTI/mzCJuBMxnO7OBpnS0
         ujrEYV2rPHp1B9RTE2x78jCmdV5Tvldlzq8kMAVcs0pLpy+q6+qHU+OquQyspzIkGOGM
         CJqNv2/xC4dtiwMpGY4ja6hgAhugRUEjkFINtJGrlUEEA2BtbqKhSXzxowGfC8x8ljLc
         53/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="KgPZgku/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ou31-20020a05620a621f00b007832941b17csi319309qkn.173.2024.01.10.22.02.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jan 2024 22:02:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="KgPZgku/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rNo9K-00088h-Jz; Thu, 11 Jan 2024 01:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rNo9J-000881-T3
 for qemu-arm@nongnu.org; Thu, 11 Jan 2024 01:02:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rNo9H-00021J-Oi
 for qemu-arm@nongnu.org; Thu, 11 Jan 2024 01:02:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704952957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=svmVfxBLPI/Y3WTiwU0rrYfGXA1e8Kn/6Y7iOqANOS4=;
 b=KgPZgku/WECqpzbi5gQOIdEcncnzhV7A5wAOq6M0xOz17WE/sVH2hH/BNZKZE1gcL1xlOZ
 7j+OOgq0HyQrxpneEUR07KybChM2M6ZL8r17vsw3wgJDO2l6peL9yE3Wk/4GI/g8b31bRA
 cSlJrIjZ12eDHe936Ft09L5k/LlO+V0=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-eObt-iiHODGFu7oTKvrg0A-1; Thu, 11 Jan 2024 01:02:36 -0500
X-MC-Unique: eObt-iiHODGFu7oTKvrg0A-1
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-6d289e2b084so5374125b3a.2
 for <qemu-arm@nongnu.org>; Wed, 10 Jan 2024 22:02:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704952955; x=1705557755;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=svmVfxBLPI/Y3WTiwU0rrYfGXA1e8Kn/6Y7iOqANOS4=;
 b=euacoWrhHWRCnCP6de12EAAL9k8rhbVN2ZWt7yWRp690S5glWqzq0gQ0Gq2E3GA9/M
 GszBuT/NqycxuA3WbPQV9hhXG2BSPk+nTi10WkdAnXemrxe+8rZbVPeOm8tA9hc3NFH2
 79Box9nYHK4cyineU6GiGDjvKgdYxN6orVwa2HmA1vkuHZ4HgRTUTb6wTLX61O3/mvr/
 maeWBoXJBxB1jylEg/4OmR4jZTvBIGXInjPmmiL8xllEE3yQG/mGBY64eYzIKRHVQQ/q
 9Na+W0HcNraGB6oqawxgLpEt8bWSCS/hzUAQ/JVTsdXGAD9TlYUNEs5LYM6dq7+HGOUd
 GyLQ==
X-Gm-Message-State: AOJu0YwjqCiRWbS77qT3ewZb3ClCaM0Yto8/OjuyWdwY0zwpa+cDn/xr
 YR/e5BI4PraIYxFlR6iP4XLSiAjGCdOUiVWSmsgaLT4o6PH0iy5GpIBC905FJl8eExwMojoHXnr
 Dn+wZbI3VDlogDEypwI/U
X-Received: by 2002:a05:6a00:4087:b0:6d4:511d:e0a1 with SMTP id
 bw7-20020a056a00408700b006d4511de0a1mr954582pfb.21.1704952955033; 
 Wed, 10 Jan 2024 22:02:35 -0800 (PST)
X-Received: by 2002:a05:6a00:4087:b0:6d4:511d:e0a1 with SMTP id
 bw7-20020a056a00408700b006d4511de0a1mr954562pfb.21.1704952954762; 
 Wed, 10 Jan 2024 22:02:34 -0800 (PST)
Received: from [10.72.112.34] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a056a00195100b006d9bf71461asm317590pfk.86.2024.01.10.22.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 22:02:34 -0800 (PST)
Message-ID: <d05eada5-7839-47df-984b-0d7956c0b3ee@redhat.com>
Date: Thu, 11 Jan 2024 16:02:29 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 29/71] hw/arm/virt: Check CPU type in
 machine_run_board_init()
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
 <20240105154307.21385-30-philmd@linaro.org>
 <CAFEAcA8P+kDHv_crqDmrbzzJHDpy1fe4T_tXsu8+nWggmjymgQ@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <CAFEAcA8P+kDHv_crqDmrbzzJHDpy1fe4T_tXsu8+nWggmjymgQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.774,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: /kF9XW/aER4x

Hi Peter,

On 1/10/24 00:33, Peter Maydell wrote:
> On Fri, 5 Jan 2024 at 15:46, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> From: Gavin Shan <gshan@redhat.com>
>>
>> Set mc->valid_cpu_types so that the user specified CPU type can be
>> validated in machine_run_board_init(). We needn't to do the check
>> by ourselves.
> 
> Hi; after this change if you try to use the 'virt' board from
> qemu-system-arm with an invalid CPU type you get an odd
> error message full of "(null)"s:
> 
> $ ./build/x86/qemu-system-arm -machine virt -cpu cortex-a9
> qemu-system-arm: Invalid CPU model: cortex-a9
> The valid models are: cortex-a7, cortex-a15, (null), (null), (null),
> (null), (null), (null), (null), (null), (null), (null), (null), max
> 
> This seems to be because we print a "(null)" for every 64-bit
> only CPU in the list, instead of either ignoring them or not
> compiling them into the list in the first place.
> 
> https://gitlab.com/qemu-project/qemu/-/issues/2084
> 

Yes, it's because all 64-bits CPUs aren't available to 'qemu-system-arm'.
I've sent a fix for it. Please take a look when getting a chance.

https://lists.nongnu.org/archive/html/qemu-arm/2024-01/msg00531.html

Thanks,
Gavin

