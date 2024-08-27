Received: by 2002:a17:504:26c2:b0:1be9:327d:8ee3 with SMTP id j2csp104387nji;
        Tue, 27 Aug 2024 05:30:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUzDtoUOruCCUady0LlTVtyddQR3SZUH1Bx8D7inUfXMz4arXuMWAgI2J1Vjs6KXYd/2izIommdBL16cQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG6qOGvWFK87H9e3b951Wp0bVK+e2m9fz++w4Tq3fhWWaQgrrNm6Yt7gNaimU3AeJIg9FqQ
X-Received: by 2002:a05:622a:2445:b0:44f:ca27:cca7 with SMTP id d75a77b69052e-4566094d662mr34065511cf.49.1724761821853;
        Tue, 27 Aug 2024 05:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724761821; cv=none;
        d=google.com; s=arc-20160816;
        b=INFLCFgkaTvZ+kmwwOx/DMzKnQCRAr5DMXIxUThtGFoU+ziXVUgBxPjIxAFS9qJUsc
         HyazS9ofmOdiTEQUDu1IRQSP0C091LYQB1NFswiLa3YQH/ZLJEYoA1RRq01ASwmX7MM+
         hMKdUWGos4hRbNbeifdIN3aLuaTCPAU/kzb8ekwtlSjKSXkOckou993w1PHBym2GGneo
         oYpwJYd4ShjD99u7TUz1w3rK2iLsp6lpJK88XmGTTYF1L8noSkJgQs+bl8vjJatSqmF1
         ZSB0ly5oRVOEAoW28bWQBnGOmD0huodFeO0F2Z+6jo/0x0OsM44Wg4qZXFE0k1qvybrT
         WJ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=7fVIRHkINQ3k1HhCBJiV5y9uktykYpZ41V9E8toZVYo=;
        fh=xPLRPaJy+TiAiY7vTiKoMQMdVaswG/Nr+FS1dKOWPfY=;
        b=ofvz0PtMAZdgwHHJMz7GN07/bxTev5dOxyoummANfP7eJaObc18fynTurV03YW+kVd
         DQOY9pf5j6Y/bKG/z2r0sYM1+fgv1KoSQjrU/X6hV3e82QMO1O9Zo9ZwzsUUBk0tD6fp
         4DuH2G9dFP89GmHpRAt5ZFGw982VUFsaHKPL6pS9gX31fmh0g4jHR8+yD+4jl4FVGF7R
         bggTWSCp1EeXSYR4pRz0Gw0+Iey7nfXpicIViANBBPnOtkSyi0zkty1yfSqyVddFU+qv
         njSOS5cML2BYzXkR3TcxPoiZZIgxA2KYgLJVHueipvzvUkq4Vx7LtOUPfvP3SYEjJK4t
         kqOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=adwGNiGY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-454fe343abesi126641971cf.730.2024.08.27.05.30.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2024 05:30:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=adwGNiGY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sivKe-0005qD-OI; Tue, 27 Aug 2024 08:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sivKa-0005mS-Vr
 for qemu-arm@nongnu.org; Tue, 27 Aug 2024 08:29:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sivKY-0007fc-CQ
 for qemu-arm@nongnu.org; Tue, 27 Aug 2024 08:29:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724761789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7fVIRHkINQ3k1HhCBJiV5y9uktykYpZ41V9E8toZVYo=;
 b=adwGNiGYGX/INj54CD764w5LT95qpxgJT1s+FwUqtbNjWW+YfSxBxt7lSu1nwr4OUGedm3
 uhpnUXZe+t6/pwFh7mn57XIWh7v7TfD8Y/Sb2W//Dzc92AfzTchT9jILcNvb+gxmKXEj4f
 voeURphMuTTnkuJPwNI2lYXlBJEoKn4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-m8gj08WOOKiYbrSVvzuScQ-1; Tue, 27 Aug 2024 08:29:46 -0400
X-MC-Unique: m8gj08WOOKiYbrSVvzuScQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3718e1d1847so3239678f8f.1
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2024 05:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724761785; x=1725366585;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7fVIRHkINQ3k1HhCBJiV5y9uktykYpZ41V9E8toZVYo=;
 b=LNIt4+YRRsP+EAA15g8utjuLK8xRpTvl/bqMhOXxd8TkFVSKx6HWUApr3gXUtAWrhh
 +4giuGZObvoqA0C+4TYC5xAnPCJgO2RmzyNRXuFH6HQqHBu7vbo0r+tbfc2MOgZZ+taT
 TCyGx9IS9+KUMtstKPCdlowK9vJ1IVZOikuKpt1orkDFtSYRkDTjhrJVo1UZ3hfxcyFA
 tccB6omxCcx5I7ywo8Ix2wpmcEFlEksC65Jg6y/qQhdXsnOenC7kWl5KTRyYx7IFqRuI
 kcY8dJ3K0gw/TbrlrMLKMj//S5V1BvJQyHWTV07FRvsJJeCAbBCbXpsOwxLvAcLCGrwK
 DLsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSAOAKmF+3MFlWM2uQFKkGB9+VUBBXDOZOy9bBq/KdfMo+2LooNU/af5HdAvffOLaU2Wu4EiBc7Q==@nongnu.org
X-Gm-Message-State: AOJu0YyEhn7Z1S5/MiLwXHwQ5sOx9w/nc2mLynMnQwgsTAMqdVSHKBo1
 7vGPlpaZWgFgVh+ZwwTaHND+hiIuT8JocXYgJk1lmKwO0WSmQw9TDFBzQKp4hmWkvAtG2zyT8ns
 dKFr57hfNhvUThIZ1jAt+Zsfe0YMAoCCi651om/3XhxFGMckG4g==
X-Received: by 2002:adf:e3c1:0:b0:367:4d9d:56a1 with SMTP id
 ffacd0b85a97d-373118c86c7mr10715375f8f.45.1724761784949; 
 Tue, 27 Aug 2024 05:29:44 -0700 (PDT)
X-Received: by 2002:adf:e3c1:0:b0:367:4d9d:56a1 with SMTP id
 ffacd0b85a97d-373118c86c7mr10715338f8f.45.1724761784431; 
 Tue, 27 Aug 2024 05:29:44 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-179-35.web.vodafone.de.
 [109.43.179.35]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730810ff83sm12956572f8f.17.2024.08.27.05.29.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 05:29:44 -0700 (PDT)
Message-ID: <9cb7e060-85ab-49c4-a8dd-6149847c3f89@redhat.com>
Date: Tue, 27 Aug 2024 14:29:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] tests/functional: Add a class containing Linux kernel
 helpers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>, qemu-arm@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20240826221058.75126-1-philmd@linaro.org>
 <20240826221058.75126-2-philmd@linaro.org>
 <e66847a0-7390-42d9-a51d-190e0734d25e@redhat.com>
 <aeb7bd72-095f-43cf-8216-18c341310915@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <aeb7bd72-095f-43cf-8216-18c341310915@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: tKXLOvAaUPXK

On 27/08/2024 11.21, Philippe Mathieu-Daudé wrote:
> Hi Thomas,
> 
> On 27/8/24 07:34, Thomas Huth wrote:
>> On 27/08/2024 00.10, Philippe Mathieu-Daudé wrote:
>>> Use the 'linux_kernel' namespace to provide common helpers
>>> to functional tests booting a Linux kernel.
>>>
>>> Suggested-by: Thomas Huth <thuth@redhat.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   tests/functional/qemu_test/linux_kernel.py | 19 +++++++++++++++++++
>>>   1 file changed, 19 insertions(+)
>>>   create mode 100644 tests/functional/qemu_test/linux_kernel.py
>>>
>>> diff --git a/tests/functional/qemu_test/linux_kernel.py 
>>> b/tests/functional/qemu_test/linux_kernel.py
>>> new file mode 100644
>>> index 0000000000..917beb7fb6
>>> --- /dev/null
>>> +++ b/tests/functional/qemu_test/linux_kernel.py
>>> @@ -0,0 +1,19 @@
>>> +# Linux kernel functional test helpers
>>> +#
>>> +# Copyright (c) 2024 Linaro Ltd.
>>> +#
>>> +# Author:
>>> +#  Philippe Mathieu-Daudé <philmd@linaro.org>
>>> +#
>>> +# SPDX-License-Identifier: GPL-2.0-or-later
>>> +
>>> +from . import wait_for_console_pattern
>>> +
>>> +KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
>>> +
>>> +KERNEL_PANIC_MESSAGE = 'Kernel panic - not syncing'
>>> +
>>> +def linux_kernel_wait_for_pattern(test, success_message):
>>> +    wait_for_console_pattern(test,
>>> +                             success_message=success_message,
>>> +                             failure_message=KERNEL_PANIC_MESSAGE)
>>
>> I'd prefer to have the whole LinuxKernelTest class here (without the 
>> BootLinuxConsole class of course), that way the modifications that we have 
>> to do to the converted tests are definitely smaller when we don't have to 
>> change the "wait_for_console_pattern" lines everywhere. And it's also 
>> nicer if the variables are properly wrapped in a class.
> 
> I'm a bit confused by your comment. I exposed my view on LinuxKernelTest
> methods (which I don't see specific to this class) here:
> https://lore.kernel.org/qemu-devel/9910ebc8-b7c4-4505-a987-3a5e308fb3d1@linaro.org/
> 
> Could your request be implemented on top on this patch, as we go (as it
> is already helpful in its current state)? Otherwise I'll ask you to
> share a snippet of what you mean, or even better to post a v2 :)

I'll post a mini patch series (converting the Q800 test) in reply to your 
mail to show what I had in mind...

  Thomas

