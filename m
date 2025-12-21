Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16872E67482
	for <qemu-arm@archiver.kernel.org>; Sun, 21 Dec 2025 18:07:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vXNpL-0002y0-I4; Sun, 21 Dec 2025 13:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vXNpH-0002xF-Qf
 for qemu-arm@nongnu.org; Sun, 21 Dec 2025 13:06:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vXNpF-0001z8-O4
 for qemu-arm@nongnu.org; Sun, 21 Dec 2025 13:06:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766340394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ccxl3nO+1AINr1Oym/UazhsSFyxGbfZIORO3WwOLSoU=;
 b=ib0UXVmfFfDgocfmnwtxBkzq4HOQL6q6KZflTUWhxmHKHMYswDtD/6BS7ZgFK0E90jc53C
 KlhZy7F+LLURA3LnbJ06SyVrc6cGaRq6Xb4R5ZXy2YKktn+re5V34mSmXkQ1O00AHDzMNJ
 Wyb+bLpLuINXLCJDgVqe2JoRqaXCFm0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-mljV0JRSOG-wAYZvOmvMdQ-1; Sun, 21 Dec 2025 13:06:33 -0500
X-MC-Unique: mljV0JRSOG-wAYZvOmvMdQ-1
X-Mimecast-MFC-AGG-ID: mljV0JRSOG-wAYZvOmvMdQ_1766340392
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-477771366cbso21158915e9.0
 for <qemu-arm@nongnu.org>; Sun, 21 Dec 2025 10:06:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766340392; x=1766945192;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ccxl3nO+1AINr1Oym/UazhsSFyxGbfZIORO3WwOLSoU=;
 b=W9Yz2vWawPZiu6uKKAQx/PIIfQGsRTbeXKETZW52AmeLj2rzKjrU1Si2H0v+/0wsfT
 5n0RJhtl78Dpl2pfFfVOPQMCeFfjUeMijt6+r577HbKSKUsL6v0znU5+ZPqxeR/EGtV9
 kgdSBe6rIN2Y7ALB7Bt6CILM9M0EO+OUxGXb5qATRKGPWQrZJydcVODrL3M3iuZrN989
 UUfZJVQZFQh7Ok3RDz9o2BWzci//q65ypYeJtpVd40LFSFb1cfgKL7BYbHY1oYkzo3gk
 /SC6S5andO/j0xjWVB4emDBeIWaaSQwaohza7giDENlmKeIIhJFILCJ7GLFCaFvvEo6M
 TwiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaSk1mOvQHF+3BaKWvONW0ZwCncfNVnE6uCqbvENJHQKUamFTRerGOBL2Xrm5ppcdHCCISJEnmxw==@nongnu.org
X-Gm-Message-State: AOJu0Yx8Gl5lhepM9priQ1BMERnUrDrg8msqYs+gawR6sb9/KeNX5pYT
 4b1X9qJtCfFknIu+E6mNJd+O93X3U5w/7IxgYqf+bo8AnTZJigt5tYiT2P6p+8F6WNj0eKMtyQb
 qBOX2MpZDQ+dVVMvzYPdtr2cClJ2NNwl7JxrzwfmRUMgCyUnmjjVUKw==
X-Gm-Gg: AY/fxX5xYJ8kUVS+YfMmYwtxGgCC3/Sc/qay0r2OGuUHfPiwUntNYTlgBJUXvxEztXJ
 yORRcWzl6w8WhcvVtarpKq/XGmhf29zi/mSz4cxfagFkAaDxHnQTxOkcwkb8JAiw1c04MJZiTr7
 vRZcoIlhEWffC1QaY1HE7Fv8KRjQrSj6D+aqvO5AdLlTtGZJyJXH+1DOzcj4eSnCY5cf1xxVkAR
 YS81aPgCVgwnekqYUz/nClU7H2cRnkI/2wnN50b5CRpzA1RYpu+aqL3QBmv8ZjqJS31AVD6FYQT
 ZY+nCiY0Z7WXTl561wYptAFkF9YBYIVzQpDv+U5gXwhV5hXyS4WfSu91iBpOSCIGFIv/9kQZg0J
 OOM/+qivWNZKMCC2+5EgbXSG+617scl3iP1EbHVYKyWH0wg==
X-Received: by 2002:a05:600c:4fc6:b0:477:333a:f71f with SMTP id
 5b1f17b1804b1-47d19576cc6mr91231925e9.17.1766340392073; 
 Sun, 21 Dec 2025 10:06:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3151ZOjBX8r2LOWDg0AcWY4rEcjKVI4JSg6xDDnfR6rxdl34V6MClbFWfxOOPfI7EZ0YkMQ==
X-Received: by 2002:a05:600c:4fc6:b0:477:333a:f71f with SMTP id
 5b1f17b1804b1-47d19576cc6mr91231695e9.17.1766340391634; 
 Sun, 21 Dec 2025 10:06:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:165:d60:2c1a:3780:4e49:dfcf?
 ([2a01:e0a:165:d60:2c1a:3780:4e49:dfcf])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3ad0c60sm84199135e9.5.2025.12.21.10.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Dec 2025 10:06:30 -0800 (PST)
Message-ID: <51e9eb2a-78d4-4ec4-84a2-aea8c45ab8d4@redhat.com>
Date: Sun, 21 Dec 2025 19:06:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 11/11] tests/functional: Add gb200 tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Patrick Williams <patrick@stwcx.xyz>
Cc: Ed Tanous <etanous@nvidia.com>, Thomas Huth <thuth@redhat.com>
References: <20250704083723.1410455-1-clg@redhat.com>
 <20250704083723.1410455-12-clg@redhat.com>
 <3d97400f-0d42-4f21-b64b-c719443ca3aa@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <3d97400f-0d42-4f21-b64b-c719443ca3aa@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GqCd-7K8RUzuX4hnkpzuf-LGUkdnwqNPTeeTAGMp4LM_1766340392
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi,

+ Patrick

On 12/21/25 15:56, Philippe Mathieu-Daudé wrote:
> Hi Ed, Cédric,
> 
> On 4/7/25 10:37, Cédric Le Goater wrote:
>> From: Ed Tanous <etanous@nvidia.com>
>>
>> To support the newly added gb200 machine, add appropriate tests and
>> extend do_test_arm_aspeed_openbmc() to support the hostname of this
>> new system: "gb200nvl-obmc".
>>
>> Signed-off-by: Ed Tanous <etanous@nvidia.com>
>> Reviewed-by: Cédric Le Goater <clg@redhat.com>
>> Link: https://lore.kernel.org/qemu-devel/20250703144249.3348879-5-etanous@nvidia.com
>> [ clg: Adjust commit log to document do_test_arm_aspeed_openbmc() change ]
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   tests/functional/aspeed.py                    |  9 +++++--
>>   tests/functional/meson.build                  |  2 ++
>>   .../test_arm_aspeed_gb200nvl_bmc.py           | 26 +++++++++++++++++++
>>   3 files changed, 35 insertions(+), 2 deletions(-)
>>   create mode 100644 tests/functional/test_arm_aspeed_gb200nvl_bmc.py
>>
>> diff --git a/tests/functional/aspeed.py b/tests/functional/aspeed.py
>> index 7a40d5dda736..b131703c5283 100644
>> --- a/tests/functional/aspeed.py
>> +++ b/tests/functional/aspeed.py
>> @@ -8,8 +8,13 @@
>>   class AspeedTest(LinuxKernelTest):
>>       def do_test_arm_aspeed_openbmc(self, machine, image, uboot='2019.04',
>> -                                   cpu_id='0x0', soc='AST2500 rev A1'):
>> -        hostname = machine.removesuffix('-bmc')
>> +                                   cpu_id='0x0', soc='AST2500 rev A1',
>> +                                   image_hostname=None):
>> +        # Allow for the image hostname to not end in "-bmc"
>> +        if image_hostname is not None:
>> +            hostname = image_hostname
>> +        else:
>> +            hostname = machine.removesuffix('-bmc')
>>           self.set_machine(machine)
>>           self.vm.set_console()
>> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
>> index fb87b957aa6c..050c9000b95c 100644
>> --- a/tests/functional/meson.build
>> +++ b/tests/functional/meson.build
>> @@ -33,6 +33,7 @@ test_timeouts = {
>>     'arm_aspeed_ast2600' : 1200,
>>     'arm_aspeed_bletchley' : 480,
>>     'arm_aspeed_catalina' : 480,
>> +  'arm_aspeed_gb200nvl_bmc' : 480,
>>     'arm_aspeed_rainier' : 480,
>>     'arm_bpim2u' : 500,
>>     'arm_collie' : 180,
>> @@ -129,6 +130,7 @@ tests_arm_system_thorough = [
>>     'arm_aspeed_ast2600',
>>     'arm_aspeed_bletchley',
>>     'arm_aspeed_catalina',
>> +  'arm_aspeed_gb200nvl_bmc',
>>     'arm_aspeed_rainier',
>>     'arm_bpim2u',
>>     'arm_canona1100',
>> diff --git a/tests/functional/test_arm_aspeed_gb200nvl_bmc.py b/tests/functional/test_arm_aspeed_gb200nvl_bmc.py
>> new file mode 100644
>> index 000000000000..8e8e3f05c1b2
>> --- /dev/null
>> +++ b/tests/functional/test_arm_aspeed_gb200nvl_bmc.py
>> @@ -0,0 +1,26 @@
>> +#!/usr/bin/env python3
>> +#
>> +# Functional test that boots the ASPEED machines
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +from qemu_test import Asset
>> +from aspeed import AspeedTest
>> +
>> +
>> +class GB200Machine(AspeedTest):
>> +
>> +    ASSET_GB200_FLASH = Asset(
>> +        'https://github.com/legoater/qemu-aspeed-boot/raw/refs/heads/master/images/gb200nvl-obmc/obmc-phosphor-image-gb200nvl-obmc-20250702182348.static.mtd.xz',
> 
> This test is failing for me:
> 
> 2025-12-21 11:10:40,608 - qemu-test - INFO - Downloading https://github.com/legoater/qemu-aspeed-boot/raw/refs/heads/master/images/gb200nvl-obmc/obmc-phosphor-image-gb200nvl-obmc-20250702182348.static.mtd.xz to /builds/philmd/qemu/functional-cache/download/b84819317cb3dc762895ad507705978ef000bfc77c50c33a63bdd37921db0dbc...
> 2025-12-21 11:10:40,798 - qemu-test - ERROR - Unable to download https://github.com/legoater/qemu-aspeed-boot/raw/refs/heads/master/images/gb200nvl-obmc/obmc-phosphor-image-gb200nvl-obmc-20250702182348.static.mtd.xz: HTTP error 404
> urllib.error.HTTPError: HTTP Error 404: Not Found
> qemu_test.asset.AssetError: https://github.com/legoater/qemu-aspeed-boot/raw/refs/heads/master/images/gb200nvl-obmc/obmc-phosphor-image-gb200nvl-obmc-20250702182348.static.mtd.xz: Unable to download: HTTP error 404
> make: *** [Makefile:170: run-ninja] Error 1
> 

I believe this due to :

   https://github.com/legoater/qemu-aspeed-boot/commit/52451b2472eeb40aa97e131aeea327e9d4a8a78a

To fix, I can 'revert' the change above or we can fix QEMU.

Thanks,

C.


