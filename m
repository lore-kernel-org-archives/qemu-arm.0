Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2913920njd;
        Wed, 23 Apr 2025 02:41:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCHBem1bbmtNmCiiori0DHAblduRGhlMUiYNA0NQAPCdZ0juYa4WCH+BZiE6HSNvoxP1j8sReenwffPQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHKNRVp4MuySDIqnrssXFdvlhzlq6HUKvfdnsNSytDYB5o323EbvW29oBxuJxWquHpCQ1U0
X-Received: by 2002:a05:6214:401c:b0:6e8:ede1:237 with SMTP id 6a1803df08f44-6f2c4674f16mr273576896d6.43.1745401274312;
        Wed, 23 Apr 2025 02:41:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745401274; cv=none;
        d=google.com; s=arc-20240605;
        b=PcjFbxvFOKNtWd415ZOACfN/6paRjsDerNSAsZa9Nbsmmgb+IVI3/pv9pNhJKLX178
         TWlSJUC67wtVWQ8BCPx80ye/eYWVKhrMCTKykJTWNwI8YNizqGbT+M2kth91WWkR3e7n
         vAjACBwhQG0eSf6HHYHld/iXrr4qxGLl/tffPxP+IlMqbI9lEGKhA84OEcJWz7JWtQDK
         MGx16LSlPRXj/Oda+623ud/v3rXBaH18srOeFnwTaW3kAvs+9V5VkXsIAlr7Eg1FnlPP
         5q6UgmCva8B1+UFpFmsR3a+VEkUqQ0yjz/LnWGS+z0SUbjFvb5OcfA/y0uLdSrPNg5b2
         SJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=BOtn9ma/XBXc5SypNaNRmyrr3Ioj5GUU7hRkEj2fBaA=;
        fh=Fieb8UpzDb5q71Uisax2Flq3ENga4YW9OF8Ej//erCY=;
        b=UzSj2KC4/hfvNL1cgt+WGaBfei3Q4R5xR8Dwl2j7JpcNeFwLFEXyu+dxoM7KMXlMBc
         f4d39PQvKVL8Y4uWkRv8lB9He3NWZlCyrjhS5yDNAK5iBln2u18/EPkVqBh9yfRcwQ4U
         UowPegVBDa/eESnCFfcocSybO6s4r3ST6iZVU90dvJN9f020QtbwrG76hwnog0FBkbav
         KAR5O70anYv4qLdXooX7j26I37F2+cg0l4smHTC3fA+jzaoThftPxrPWHVlGTd/KtTNL
         SUTjRDMiFluyH5E50sJtlwc5ZepOBITk8u4i3Xo3DS2JIwRvvLqHAqM9LMOHYmKNUocF
         O3OQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GhYZTwCN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f2c2c43478si125982006d6.492.2025.04.23.02.41.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Apr 2025 02:41:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GhYZTwCN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7Wb1-0003o9-4h; Wed, 23 Apr 2025 05:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1u7Wap-0003nc-P9
 for qemu-arm@nongnu.org; Wed, 23 Apr 2025 05:40:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1u7Wam-0008FV-NZ
 for qemu-arm@nongnu.org; Wed, 23 Apr 2025 05:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745401230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BOtn9ma/XBXc5SypNaNRmyrr3Ioj5GUU7hRkEj2fBaA=;
 b=GhYZTwCNTKO0HgDInI2QekiQAcA5Zm3cTQs+By2k+kHCTy59AEdi5AaWMwbtcTlDf3eete
 ZS5ya+6i4g0jaQasr7h3ByCh0tFQtarQMl4M/ut16eLJ46Q11ctht2NaPFG9ise34P5TRC
 VUICKIBJJc+0U8MXLi7G0bqgiQvWij0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-Kdqkwzj6MMqBbz7egDEoFA-1; Wed, 23 Apr 2025 05:40:29 -0400
X-MC-Unique: Kdqkwzj6MMqBbz7egDEoFA-1
X-Mimecast-MFC-AGG-ID: Kdqkwzj6MMqBbz7egDEoFA_1745401228
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43f251dc364so38389585e9.2
 for <qemu-arm@nongnu.org>; Wed, 23 Apr 2025 02:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745401228; x=1746006028;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BOtn9ma/XBXc5SypNaNRmyrr3Ioj5GUU7hRkEj2fBaA=;
 b=KGGypuPBgei8wa1kPX5sFEgv6A1F5CKUc7uSXxBYRQzxkYH7kY/7uytzT6aGPKXOpZ
 zDTUP6cIyQnV8dxmXIuIkz4Vrbl+65AMMOguUtJGhGWJHB7NL7q2B7jpFfz1zEPmemmn
 mRqqT1GXeMHlvYhYvg/2swtjBxWXBucoukEPgYbZ6ft/4QHT6S3X6AAPnCfhLG3jeMkB
 yzlteyTxjNjML4uxvhtqoLpRWN+f3vzpiLx6d8McAi616tLda/TLJx2dlVHxBph3IM6o
 Wgheqgwjvf9QfXMTq7FMc51PeuJMdfy22xYVRbRUXVz876oWzTuuUzyFod1pZD+c/s26
 fykg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAlCfZAEEJdAFwkARHHb6WxOMGeIO2wJUUKEk/IbiU+NM3I74bhiiZ7mPTgRe4/3K5DW//YiPmbQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz2L7pnCLe3JSFtBeq4OflxXjqvAWbfwYzDrmyCg+GK7P62paPG
 GSuYekMeJCRZjkDXw37z0/AxWBj/7GrE8IocrZQgGWmTBrXejlEvmN0E/wAinMZSE98BhmoxFRR
 siMhy0gox1LBhESlLygShEOsFD68prD2eQHsKesRPCBWqG9Ldlw==
X-Gm-Gg: ASbGnctv204aVLZiZ1YqxpZRgSLrXhA7X1C2e/RLs8jPUKtBVk2/y14t5TLCLUrvgzx
 hQboKKxF2nysep+7ZrI9nrTr/FIYugAbuO7h5MUINNppgeSgpUJ7hDKdHK2z2ITPOAxLqZ79Fda
 qisphfI0rVjtZcuJXgYOIDcrOnVzD0XVBdQFFgfsA84gSEnTAImGRqOb9WViDnDK5SkQFQjJLLW
 I0PirHamPvC2wP6bFcE0SwnOx+XIRkG0BemXLc8wnPGiIm+Nh2GUE9mCkYY+H1jq2gVsRGQsaff
 L8f6Ggv0A6DT6qHlSJ+jBuIxVxoFWPyGBa/a
X-Received: by 2002:a05:6000:4201:b0:391:456b:6ab7 with SMTP id
 ffacd0b85a97d-39efba5db9bmr14159862f8f.34.1745401227798; 
 Wed, 23 Apr 2025 02:40:27 -0700 (PDT)
X-Received: by 2002:a05:6000:4201:b0:391:456b:6ab7 with SMTP id
 ffacd0b85a97d-39efba5db9bmr14159839f8f.34.1745401227401; 
 Wed, 23 Apr 2025 02:40:27 -0700 (PDT)
Received: from [10.33.192.219] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4a498csm17901051f8f.85.2025.04.23.02.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 02:40:27 -0700 (PDT)
Message-ID: <2c725cbc-6ba0-4e07-8863-acacbb45e121@redhat.com>
Date: Wed, 23 Apr 2025 11:40:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0? v2] tests/functional: Add test for imx8mp-evk
 board with USDHC coverage
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
References: <20250409202630.19667-1-shentey@gmail.com>
 <aa47d49a-b81a-46cf-811a-2045e453f4bf@redhat.com>
 <6621A6A6-83F8-476C-973C-FE3D1918E061@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <6621A6A6-83F8-476C-973C-FE3D1918E061@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5lvkitasI6Glo5CCNfolAIaU2g4LmT-wZ4BZNPUpPX8_1745401228
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: t6yMiULc/vQZ

On 23/04/2025 11.31, Bernhard Beschow wrote:
> 
> 
> Am 10. April 2025 06:05:35 UTC schrieb Thomas Huth <thuth@redhat.com>:
>> On 09/04/2025 22.26, Bernhard Beschow wrote:
>>> Introduce a functional test which boots Debian 12 on the imx8mp-evk board. Since
>>> the root filesystem resides on an SD card, the test also verifies the basic
>>> operation of the USDHC.
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>
>>> --
>>> v2:
>>> * Make test file executable (Thomas)
>>> * Omit fetch() (Thomas)
>>> * Omit "-accel tcg" (Thomas)
>>> * Add "snapshot=on" to make potential future tests independent
>>>
>>> Supersedes: 20250405214900.7114-1-shentey@gmail.com
>>> ---
>>>    MAINTAINERS                                 |  1 +
>>>    tests/functional/meson.build                |  1 +
>>>    tests/functional/test_aarch64_imx8mp_evk.py | 66 +++++++++++++++++++++
>>>    3 files changed, 68 insertions(+)
>>>    create mode 100755 tests/functional/test_aarch64_imx8mp_evk.py
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index d54b5578f8..4ceffa89dc 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -833,6 +833,7 @@ F: include/hw/arm/fsl-imx8mp.h
>>>    F: include/hw/misc/imx8mp_*.h
>>>    F: include/hw/pci-host/fsl_imx8m_phy.h
>>>    F: docs/system/arm/imx8mp-evk.rst
>>> +F: tests/functional/test_aarch64_imx8mp_evk.py
>>>    F: tests/qtest/rs5c372-test.c
>>>      MPS2 / MPS3
>>> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
>>> index 0f8be30fe2..aaaf3472f1 100644
>>> --- a/tests/functional/meson.build
>>> +++ b/tests/functional/meson.build
>>> @@ -75,6 +75,7 @@ tests_aarch64_system_quick = [
>>>      tests_aarch64_system_thorough = [
>>>      'aarch64_aspeed',
>>> +  'aarch64_imx8mp_evk',
>>>      'aarch64_raspi3',
>>>      'aarch64_raspi4',
>>>      'aarch64_replay',
>>> diff --git a/tests/functional/test_aarch64_imx8mp_evk.py b/tests/functional/test_aarch64_imx8mp_evk.py
>>> new file mode 100755
>>> index 0000000000..62fee74044
>>> --- /dev/null
>>> +++ b/tests/functional/test_aarch64_imx8mp_evk.py
>>> @@ -0,0 +1,66 @@
>>> +#!/usr/bin/env python3
>>> +#
>>> +# Functional test that boots a Linux kernel and checks the console
>>> +#
>>> +# SPDX-License-Identifier: GPL-2.0-or-later
>>> +
>>> +from qemu_test import LinuxKernelTest, Asset
>>> +
>>
>> In case you respin (due to other reasons), please add a second empty line before the "class" statement (that's the style that we use in the other tests, too).
>>
>> Anyway:
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> Ping (not for 10.0)

Peter, should this go through your arm tree, or shall I pick it up with 
other functional test patches for my next PR?

  Thomas

