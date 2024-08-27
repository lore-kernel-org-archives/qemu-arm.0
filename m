Received: by 2002:a17:504:26c2:b0:1be9:327d:8ee3 with SMTP id j2csp53067nji;
        Tue, 27 Aug 2024 02:21:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUedWL9a4ONOS7zCk49MBD55VmxhPOJQquwkzCSwcX+Grt3b2cEGI58ryt0EJ/oaUm57cNIQrFMUo6mQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGl2aE8noySRwf/Vhr6Stlt/MBEnC5YIOorqaS68yX0p0zP3T/CQRDHVq1L7e1Z1VkXIjBQ
X-Received: by 2002:a05:6902:1747:b0:e11:83ac:a024 with SMTP id 3f1490d57ef6-e1a2a98f7demr2072142276.39.1724750517328;
        Tue, 27 Aug 2024 02:21:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724750517; cv=none;
        d=google.com; s=arc-20160816;
        b=ee03RUL9tgR8wBDtstVifyIyUJd5wm2Out9gv6NQmJ9HBpMwLDCGZahpFIBSar0cKw
         0/XpKIiP9K6YUTFVfRClN5QmHWumqqq50V1ZCddkijabc047dlNtldZ3fkJk7RSBrwBj
         JOgIH+ec7bgQRL4pR1PGY1M0H4XCSNobwHln7mvoD4cpCCafLP7lC1d8Jpx8LgK2WR2g
         QGqbdnLs2Yr95DFJXSye3WkkS85YMT+8VExeI4j7GqFB7f4YZiyOxUUOUDCkv26H5KiE
         EQJKlwAXE88U3H91vg3GgjFtf5N7hsVyoEq28sb9lyq1XnPYL0RdPUboBl7lZhStgpa0
         NSAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OXN8mHBDtwIEaJNeTegVPbNznzAEmH+ycUuUvBNkqso=;
        fh=NTcLZYWj0LSuyL1HLLS8L3OYhmRylV7t340FQuG/8iM=;
        b=f9+0YaTl9cAgYIU8zObqojaQ1GY5aouGHGHXw1JzA4ZSTOMoTrSIhYTgsmXiEJMz9C
         fQ7dLtC1LpDLlUw/LhzY8QdIHRL3/Ut8tmL43A3/OsEQJ0Rr783ePjqS7SBi5eEGDiqj
         XvlNHnSUcFYuvfRed6f3qbLIRQditBw1edUb5YNTQTk5eLjIsDrymftWFZiqBaYK29qr
         +00uUJG7bgTlGO9MO9NaI9YTcEAqFtwotc52RDX6/7i0N8gXLyVfhvdukE50p+ZS61E5
         lJIeTx7rs4uwDSzVr/9KrVFR57b2IDTsNmGXJ4BcFk8ErNSEgmCF3us5FYgmTysL7E3V
         Z6Rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EpMKrvvg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c162dd796fsi130473726d6.364.2024.08.27.02.21.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2024 02:21:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EpMKrvvg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sisO7-0001TX-N9; Tue, 27 Aug 2024 05:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sisO6-0001SW-Ol
 for qemu-arm@nongnu.org; Tue, 27 Aug 2024 05:21:18 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sisO4-0005Dy-RM
 for qemu-arm@nongnu.org; Tue, 27 Aug 2024 05:21:18 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a868831216cso592605466b.3
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2024 02:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724750475; x=1725355275; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OXN8mHBDtwIEaJNeTegVPbNznzAEmH+ycUuUvBNkqso=;
 b=EpMKrvvgzquLfdEJXECLIaHkmx+GcZ4pAUiQ1gjrnDvj3ktactQ6pyCYtjvFwWPmzb
 5XfNgiFi4qLOOV5yk5p4GPMb1lFcCHZX2+5y6XwdQ9CAgL+pZJULG9fTvKu4xAcmfN7i
 ywDsqRQDIhJzef+49xC+poCGRKNYvh+uk73aNlMHL1Y0LSON2FNWBfHYnXW06bzO/V/u
 zSmWjO01upQgvmI1PfJ5J89QdCWGbGXJG/bNzi3zMWSHYrpgQ2YR1xh78INKGyQAyFo9
 8T5+OebL6/Hvk6woekLru/fXt+D+bjP/x09RIYenVrNBVoxTnVP2jpR83Gu0nXG7LA4+
 7shQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724750475; x=1725355275;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OXN8mHBDtwIEaJNeTegVPbNznzAEmH+ycUuUvBNkqso=;
 b=g5jpzYLV1E8+Bv/GAt7TJGz2//Sta2VPqL+EkWByGX5M4n+5rLz2R3+xCgNeebqmAn
 ISSfDUQUDTWlKNKucZEIAngAVPQ4WvCMVU8mXvHxuWlZlIF6+as4217aIAloKkbV07uq
 GSKGxKg1+emYZlR8sf77MjsWsiQACfmmKO05sEIWI4Hmu+nMQTaferRyWqdYzIdajuFC
 UKMXwJWz0yfiYiMx5O7dcdluWoX6QMp/9ZX+Ql42AfY7DWVTZGVlJwQQOh8xSUbEdWcJ
 iVuZoSnVkLuSCdUdVezFMo3FB0nJg+30A2dzBGOosOkUmV847dcBeFc3zw8r8IO9RoIn
 j9xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4L1bIt6rs1mdtRv7G/upfvxrkFnSic6w7t9NHYYfi9OcFqI3ruqiiMj6Hps4q30Udo8I/17UIjA==@nongnu.org
X-Gm-Message-State: AOJu0Yxug1tL/aRWPlIVzlD1waOqVKbdPm0yvgYvuQ1qXkLpuDVktpY3
 NwAHjFyBda7S6ukpOAqjBvbUr4fN5THBK1NePXARHg5laeGd9Qsi2Jh3iooOM9rZotu5QJxkMvZ
 E
X-Received: by 2002:a17:906:bc24:b0:a7d:a080:bb7 with SMTP id
 a640c23a62f3a-a86a52c3981mr904945466b.36.1724750474834; 
 Tue, 27 Aug 2024 02:21:14 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.206.45])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e5878597sm85727066b.175.2024.08.27.02.21.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 02:21:14 -0700 (PDT)
Message-ID: <aeb7bd72-095f-43cf-8216-18c341310915@linaro.org>
Date: Tue, 27 Aug 2024 11:21:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] tests/functional: Add a class containing Linux kernel
 helpers
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>, qemu-arm@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20240826221058.75126-1-philmd@linaro.org>
 <20240826221058.75126-2-philmd@linaro.org>
 <e66847a0-7390-42d9-a51d-190e0734d25e@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <e66847a0-7390-42d9-a51d-190e0734d25e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: RKbBJEg5P4Ki

Hi Thomas,

On 27/8/24 07:34, Thomas Huth wrote:
> On 27/08/2024 00.10, Philippe Mathieu-Daudé wrote:
>> Use the 'linux_kernel' namespace to provide common helpers
>> to functional tests booting a Linux kernel.
>>
>> Suggested-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/functional/qemu_test/linux_kernel.py | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>   create mode 100644 tests/functional/qemu_test/linux_kernel.py
>>
>> diff --git a/tests/functional/qemu_test/linux_kernel.py 
>> b/tests/functional/qemu_test/linux_kernel.py
>> new file mode 100644
>> index 0000000000..917beb7fb6
>> --- /dev/null
>> +++ b/tests/functional/qemu_test/linux_kernel.py
>> @@ -0,0 +1,19 @@
>> +# Linux kernel functional test helpers
>> +#
>> +# Copyright (c) 2024 Linaro Ltd.
>> +#
>> +# Author:
>> +#  Philippe Mathieu-Daudé <philmd@linaro.org>
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +from . import wait_for_console_pattern
>> +
>> +KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
>> +
>> +KERNEL_PANIC_MESSAGE = 'Kernel panic - not syncing'
>> +
>> +def linux_kernel_wait_for_pattern(test, success_message):
>> +    wait_for_console_pattern(test,
>> +                             success_message=success_message,
>> +                             failure_message=KERNEL_PANIC_MESSAGE)
> 
> I'd prefer to have the whole LinuxKernelTest class here (without the 
> BootLinuxConsole class of course), that way the modifications that we 
> have to do to the converted tests are definitely smaller when we don't 
> have to change the "wait_for_console_pattern" lines everywhere. And it's 
> also nicer if the variables are properly wrapped in a class.

I'm a bit confused by your comment. I exposed my view on LinuxKernelTest
methods (which I don't see specific to this class) here:
https://lore.kernel.org/qemu-devel/9910ebc8-b7c4-4505-a987-3a5e308fb3d1@linaro.org/

Could your request be implemented on top on this patch, as we go (as it
is already helpful in its current state)? Otherwise I'll ask you to
share a snippet of what you mean, or even better to post a v2 :)

Regards,

Phil.
