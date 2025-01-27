Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2255925njk;
        Sun, 26 Jan 2025 22:33:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzzge/bKFjjiKqbOcAOYc+OETIeB5o+qXuORe0oR3jT7j/tQBTYNTHolKRQAi7Iq7y6Vym
X-Received: by 2002:a05:690c:6d07:b0:6ef:668a:e55b with SMTP id 00721157ae682-6f6eb67d7e1mr322797477b3.15.1737959628275;
        Sun, 26 Jan 2025 22:33:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737959628; cv=none;
        d=google.com; s=arc-20240605;
        b=I4MiMGHxfw7OJsbTEYS6u7JVtvEFrdiF6KJdpPS1vneOW9Qunni96NSmSefPX24y6a
         F7djPNo8BFWCAXwf590fWn7wBg2KW7VQUJitw2xWv73b3yhLRVXxvqVGpPLVbM8FJFNO
         Zzf6A20PwPiNmkfz4nu9mckcNQF4pK79BsL0pAkLMAXXt5zctCeJPk4xbg2tjKn273rM
         C37gwOAPJzlDyn8izp3VkHvHFwE7rsvaE2TlSYPdMlkvyfL/RMDMx3dhJoE+5mXYBENs
         UK7jIqBUg5D2i//kGQLaP5JEZumCNQtmi73nOqvulIvMMFD/s5LAw9/mNiu/Y1pqt62A
         YjMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=pXn9VZ9E0zTaknGuPvVcaJ6MFsVueGXrRF+RkjaXQNg=;
        fh=iQdQateJrZPLpuv/7/ZpS0Uvz7BPDORfkX2azf/Icx0=;
        b=YuABA4DvWOpNtPOYBaSqJySywGf6V/Mf6TmJOYmZknqUYDcMHxwKcYjZREEYt/yCdX
         T74frZVzgYsSSPoT2ZqhghF+85KKcnJCsUDMWbe7s4MZWYNofk+GI3WcWoQWlxC6ZHcZ
         lQNVKwK/Ol2AxPRdtomNFQVDWuOhr+XQGJfdxsHFeWZx6qKkrHTadYhofmU920Dv+jMq
         dUNWzbTnyMztA602lkU4BkWHbrO0rHInECXIJO7pXokjF1FUsRbe5K1YEYRWpfK3mNLw
         OsUGMcTKlf65omZcSYOP3fWFNabcsLrS250NSy0YUvVInsqy9W1hgCwSTPdqqkFD2E79
         a5yQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GN3aRRwi;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 00721157ae682-6f7579e1cfcsi50702927b3.286.2025.01.26.22.33.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 22:33:48 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GN3aRRwi;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737959627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pXn9VZ9E0zTaknGuPvVcaJ6MFsVueGXrRF+RkjaXQNg=;
	b=GN3aRRwiKKXN8dy8RLuSY4PFk5+bIqsVDfVC2WZHzeSjvxJYsOvzXV9s5brVKUmNfEZIyn
	YnPuH37ol4E93kFo/KsDvQ7e1OWfKkIPlVxzmUQwPSLM4IyYLEjMQzD8KjJqB0+/BC8jjW
	kFig9pN38QUTpkbewvq28781cO8FIA4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-KpA0oRXjPNS5bq7SQ0EbZg-1; Mon, 27 Jan 2025 01:33:46 -0500
X-MC-Unique: KpA0oRXjPNS5bq7SQ0EbZg-1
X-Mimecast-MFC-AGG-ID: KpA0oRXjPNS5bq7SQ0EbZg
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43628594d34so22739595e9.2
        for <alex.bennee@linaro.org>; Sun, 26 Jan 2025 22:33:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737959625; x=1738564425;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXn9VZ9E0zTaknGuPvVcaJ6MFsVueGXrRF+RkjaXQNg=;
        b=r4gXtBZImI27gw0Cb+YmfmyERW8xNJnHUm3VyV7qut1PHvWrds7vzrc6nBugM8HvHj
         L386n85UTlf7V4KmwlPgrqPl6gZum/oAHkBewNErt3QMRBdjGUfkrcAGQ27FaNHKGDoU
         Dfgp4fVpoT6tEnWkHAkbcuOnm7EW8eISIbEJ8E77fkIpGTFHLrz0xYU3f0qIA60/P5pC
         eozHD9KPP0CHGlLewulDOiWCkZu4bmzfp1zXgdL6WQsUZEwKnntKG6FCc1CDbT8isIZI
         BurEpwPwD50BR77SZe1bXh8QHuzOJKC+SrCDtVkf7VIPDaX5dzAfl5F5mKbPqU3LtaOU
         h5Sw==
X-Gm-Message-State: AOJu0Yzr3eurnzjunrrvSaFov9C4CHN1RtrRLfH+ev7gYIqqyNbNeSdd
	JQ4SOiCdf7mylCakckusSSYqQ+kYs+YS+uOgblm/vpEmMhCl1JczjISFo7o8igCFv0y+XHAGKo3
	U493PJEBglMGQeadnX/OtBv1lZufduMxcXUP9xPibZdcYB8LSz0js46fNjL0T9WBjxwfCyRYeuJ
	PMunOo/u1qcvOCd6rm6e/qA9FR+WWK9dVbtw==
X-Gm-Gg: ASbGncuMjkPkUHVN+JLUmpoQ7NyNvoy+yPJnXoFSu9kJyn6AXnK/+43ivNCs/RxjzcX
	BaUvxTcTb3uGkdcDzjo3om5pv7XdgfuyHnzXP6IVE/gjn2E2FU/wp3MROB1Z9ikya8AWLO327ZE
	KGtWrQjAU4+yGxfD1+GGYCYrJCSNgXXoKzdjvZYhCAhZN1xgD/8My+5vyWscdenNad7bnbODnT/
	AvfQZck55pjBcai33B+VvodIj5qpnLs4Jb2I4o4orliouebwbJpD3s8BMU6j+qQne1FU3LV0n0D
	tLrM7YgwxuazsbW8ovGsGvppPjym2XIsAp1O
X-Received: by 2002:a5d:64a1:0:b0:38a:39ad:3e2f with SMTP id ffacd0b85a97d-38bf565573dmr33514028f8f.2.1737959625188;
        Sun, 26 Jan 2025 22:33:45 -0800 (PST)
X-Received: by 2002:a5d:64a1:0:b0:38a:39ad:3e2f with SMTP id ffacd0b85a97d-38bf565573dmr33514000f8f.2.1737959624711;
        Sun, 26 Jan 2025 22:33:44 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-48-134.web.vodafone.de. [109.42.48.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d7bfsm10147190f8f.35.2025.01.26.22.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 22:33:44 -0800 (PST)
Message-ID: <88b154a1-452e-4f5c-a6f0-9b0f148f6b80@redhat.com>
Date: Mon, 27 Jan 2025 07:33:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional: Add a test for the arm microbit machine
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Joel Stanley
 <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20250124101709.1591761-1-thuth@redhat.com>
 <8734h8joui.fsf@draig.linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <8734h8joui.fsf@draig.linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CWq9evthLYNJNQeK4a8m6SX_KXV1AHFtaT0oih2W-1Y_1737959625
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: contEst6K3bp

On 24/01/2025 14.58, Alex Bennée wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> We don't have any functional tests for this machine yet, thus let's
>> add a test with a MicroPython binary that is available online
> 
> We do have a basic system test:
> 
>    test-armv6m-undef: test-armv6m-undef.S
>            $(CC) -mcpu=cortex-m0 -mfloat-abi=soft \
>                    -Wl,--build-id=none -x assembler-with-cpp \
>                    $< -o $@ -nostdlib -static \
>                    -T $(ARM_SRC)/$@.ld
> 
>    run-test-armv6m-undef: QEMU_OPTS=-semihosting-config enable=on,target=native,chardev=output -M microbit -kernel
> 
>    ARM_TESTS+=test-armv6m-undef
> 
> But I guess this exercised more of the machine as micropython actually
> comes up.
> 
>> (thanks to Joel Stanley for providing it, see:
>>   https://www.mail-archive.com/qemu-devel@nongnu.org/msg606064.html ).
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   MAINTAINERS                           |  1 +
>>   tests/functional/meson.build          |  1 +
>>   tests/functional/test_arm_microbit.py | 31 +++++++++++++++++++++++++++
>>   3 files changed, 33 insertions(+)
>>   create mode 100755 tests/functional/test_arm_microbit.py
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 1d9b3a0011..7b4d84bf5f 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1157,6 +1157,7 @@ F: hw/*/microbit*.c
>>   F: include/hw/*/nrf51*.h
>>   F: include/hw/*/microbit*.h
>>   F: tests/qtest/microbit-test.c
>> +F: tests/functional/test_arm_microbit.py
>>   F: docs/system/arm/nrf.rst
>>   
>>   ARM PL011 Rust device
>> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
>> index bcfbb70b65..a301c38806 100644
>> --- a/tests/functional/meson.build
>> +++ b/tests/functional/meson.build
>> @@ -105,6 +105,7 @@ tests_arm_system_thorough = [
>>     'arm_cubieboard',
>>     'arm_emcraft_sf2',
>>     'arm_integratorcp',
>> +  'arm_microbit',
>>     'arm_orangepi',
>>     'arm_quanta_gsj',
>>     'arm_raspi2',
>> diff --git a/tests/functional/test_arm_microbit.py b/tests/functional/test_arm_microbit.py
>> new file mode 100755
>> index 0000000000..68ea4e73d6
>> --- /dev/null
>> +++ b/tests/functional/test_arm_microbit.py
>> @@ -0,0 +1,31 @@
>> +#!/usr/bin/env python3
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +#
>> +# Copyright 2025, The QEMU Project Developers.
>> +#
>> +# A functional test that runs MicroPython on the arm microbit machine.
>> +
>> +from qemu_test import QemuSystemTest, Asset, exec_command_and_wait_for_pattern
>> +from qemu_test import wait_for_console_pattern
>> +
>> +
>> +class MicrobitMachine(QemuSystemTest):
>> +
>> +    ASSET_MICRO = Asset('https://ozlabs.org/~joel/microbit-micropython.hex',
>> +        '021641f93dfb11767d4978dbb3ca7f475d1b13c69e7f4aec3382f212636bffd6')
>> +
>> +    def test_arm_microbit(self):
>> +        self.set_machine('microbit')
>> +
>> +        micropython = self.ASSET_MICRO.fetch()
>> +        self.vm.set_console()
>> +        self.vm.add_args('-device', f'loader,file={micropython}')
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, 'Type "help()" for more information.')
>> +        exec_command_and_wait_for_pattern(self, 'import machine as mch', '>>>')
>> +        exec_command_and_wait_for_pattern(self, 'mch.reset()', 'MicroPython')
>> +        wait_for_console_pattern(self, '>>>')
> 
> We could do more if we wanted - all the microbit specific stuff lives in
> the microbit module:
> 
>    https://microbit-micropython.readthedocs.io/en/latest/microbit_micropython_api.html

Is there anything that can be done beside just "run a python command and see 
that it did not crash"? E.g. is it possible to set a different temperature 
via QOM/QAPI or simulate button presses?

> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Thanks!

   Thomas
