Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3614321njj;
        Tue, 6 May 2025 23:46:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNa7b9JMh3hptHgNx9NMHdKJShHXeQZxBeoaZT5PcpHE1XdKkw6IAITChGTPiRffAiEUKJ3aCnwpJESA==@linaro.org
X-Google-Smtp-Source: AGHT+IFTLhuWb7MF4nHOTghQSLTnTtg6MrOTmaxtaudCOU7nYLJdeQAKXUcggfAmCEeT0wVAAkNw
X-Received: by 2002:a05:6214:27e5:b0:6e4:269f:60fe with SMTP id 6a1803df08f44-6f5429e04b0mr25792336d6.10.1746600403402;
        Tue, 06 May 2025 23:46:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746600403; cv=none;
        d=google.com; s=arc-20240605;
        b=g7mjOC0i09lg9u62etIoB2z37U+++5KgECfPDDGGozPDVgb0ukPNWq/KSnrnvVwAUO
         XTKE5ES9S7wWGMPm1P+Z8Vu/Z1NDxaO4AV/b0ec3rIgqWKWPxZS4ykD1FIs5rvM60Wsl
         +fkkTDVX5sSxlkiOs2TTyzpQi4pAMKHVssSRHiliXbcjsKCmEbv4ogz7ml5vz9uB+qCu
         3jHCG5OEaAwgIEu0Uzhrqq6/7+AnuhKxi/vCdXcjCmlarE5aJjJEy4DjGYb9lA5M5cWU
         jbtnj3qeMtSAiwcgaggud38vvv56w0r1MQsPOMdlztPwNK9PlbdFraJkFeo51t0uAsvY
         +doA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=o9eAXLwGOgK0s1rX+h4QolQL2i50/ciZYh5xQc8eLFw=;
        fh=QbxOivWoe1UH6YleFl5N0R8k3nynLdGI7gyc/M43Q8o=;
        b=gxjknEmtPvu+Iq4zNbxGbDSdYNilk6O/+Qqe8C/Ko1rd8PD83ewGyToKNpMnW4DpRt
         JH9QAJ31f8njEJ1PakTJLm0gs8wamIfkpBKUzG6xBxiaQ+dq6m0zywDzJUcC0tkROHcJ
         4lEksdXQhhRgj9qQvPbN/HVPQvfAnKzsBhRUjVQvKQcGN6KCYIW9j3qatN7LZbQVXvBu
         ZpZNAibqtCkzLt5Q5h3xnxQsyldh1c5Meo7z9N7LPWrP0pC4pqjg1VH101mH6ognIZaN
         SdNT6opknxuvItuJbhh1DYvsr+CyrqnO+Opl8Sm4ieDgvrvW469mk2WvV6QvyTqWNbv2
         m0eg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ah7gnnb8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f54278c976si13146726d6.177.2025.05.06.23.46.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 May 2025 23:46:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ah7gnnb8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCYY0-0007jg-4q; Wed, 07 May 2025 02:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uCYXy-0007jP-Tu
 for qemu-arm@nongnu.org; Wed, 07 May 2025 02:46:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uCYXx-0002TH-05
 for qemu-arm@nongnu.org; Wed, 07 May 2025 02:46:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746600383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=o9eAXLwGOgK0s1rX+h4QolQL2i50/ciZYh5xQc8eLFw=;
 b=ah7gnnb8wkb8R2AyWeWWs6GJ5zALZP6MErWGSEx++lxrd2Xjgrz8LalN74ztS/dM2ndobe
 8z9jnDlgkW9yHa+qL/AFeZehXXGIivKQZrsuVKIQ8fwzzD3kuJQZIABrI4Ssu0VBIBzIgy
 dn5eqqZ4D0N1t47w+PN8w8L2x0OjX7Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169--NiUd8QKOSuJmrkc-6OEiQ-1; Wed, 07 May 2025 02:46:22 -0400
X-MC-Unique: -NiUd8QKOSuJmrkc-6OEiQ-1
X-Mimecast-MFC-AGG-ID: -NiUd8QKOSuJmrkc-6OEiQ_1746600381
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43d4d15058dso45805715e9.0
 for <qemu-arm@nongnu.org>; Tue, 06 May 2025 23:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746600381; x=1747205181;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o9eAXLwGOgK0s1rX+h4QolQL2i50/ciZYh5xQc8eLFw=;
 b=WnOVLDqufnSHyZl83VCY8zIL4B52r2JL+70xnLyx4yOqibqaA7/8mDgs0drldr1uZC
 jQi5LZF65mqzVtsL/WX3KV9nJM4NLskpHwglwKOnZKsGDnqgwWrJ7Jvahf3B7BzDs+LT
 NdJFAi+1SAmWXM9dOhsdYVY6DpFSopaGAs2GckfWIyaG0FCVcAS92P9venn/4kxsFY3D
 4uIdJr+U4k84QQOIQ3+vb49rt1XuC78RyPOZie10Fuq3YhvL/O3+/lEYkG72nwm3VBPA
 zbCGZRuACN++bb0GTEB4/yMotSNvMnQBvYkpWOPrlkVFBzFsX3+z2hIVFLwPV26MPJyq
 XkUg==
X-Gm-Message-State: AOJu0YzhjoA0lL2b1arIjGEBd8Mwl/uVXjVt4LZb6t0gY1UJCrBBG7Sc
 07FviumyIUPMLDWI3byMvAIOSWep6UB2l7gRWJNfAZeUcxPv2RDZgdcd9XPiaNxupzhtEqEqXmD
 tBZ6asj+wBny6yvAlC4o7YGdfpuvllXvX+p1zw6R2Pelm52L3T1Cjg5ZFyw==
X-Gm-Gg: ASbGncuuYgxSgY0jkVRPzFvWFArPHrEzpjQfm4wCJfXiTxHWUQmOPnSZiqPh6nB76QV
 WOJHhdWLb8D+tjsJQhfXugZ53G9lVyXjCJdmQyhtmQ6oHZLdyMHein0PxJznqMv3YIDYPsDv49i
 /t7xFnRPyqHhtliPHDa47k4zlCsWE7ddWk7hjSVZ5TXpjgI3m0d6LmuVLU3fTC5gjlB8QUN6QRk
 D8GvUWa2B2WtLr3dCpkYhVdth6udkZ+t2LH78SbV1jLI9Bb7O0VfFFIEDHXG38jtQ2bNV+6Kc1R
 k1ea0SFUd8erwGLxBWoZVuS622hWi/Sw+Yw4mLYpjGGznWJTaA==
X-Received: by 2002:a05:600c:4e48:b0:43c:fdbe:43be with SMTP id
 5b1f17b1804b1-441d44d7c33mr13703855e9.27.1746600380738; 
 Tue, 06 May 2025 23:46:20 -0700 (PDT)
X-Received: by 2002:a05:600c:4e48:b0:43c:fdbe:43be with SMTP id
 5b1f17b1804b1-441d44d7c33mr13703605e9.27.1746600380202; 
 Tue, 06 May 2025 23:46:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae0b9fsm15597765f8f.4.2025.05.06.23.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 23:46:19 -0700 (PDT)
Message-ID: <01740f0b-5869-4099-9ed8-0f5764b48a05@redhat.com>
Date: Wed, 7 May 2025 08:46:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 22/23] tests/function/aspeed: Add functional test for
 ast2700fc
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Steven Lee <steven_lee@aspeedtech.com>
References: <20250505090635.778785-1-clg@redhat.com>
 <20250505090635.778785-23-clg@redhat.com>
 <CAFEAcA8wmqAtcgfPvyMY8nujTWNCSC0DYO64aA5up-sTWCr_jA@mail.gmail.com>
 <312fe25c-4331-4346-ae04-722e82b511e2@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <312fe25c-4331-4346-ae04-722e82b511e2@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -gFTrTF0PkLL74Ss-mABMvHO_S9wqVvzesoHbr6jnMw_1746600381
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: gD5SPxXouDxn

On 5/6/25 23:09, Pierrick Bouvier wrote:
> On 5/6/25 7:22 AM, Peter Maydell wrote:
>> On Mon, 5 May 2025 at 10:12, Cédric Le Goater <clg@redhat.com> wrote:
>>>
>>> From: Steven Lee <steven_lee@aspeedtech.com>
>>>
>>> Introduce a new test suite for ast2700fc machine.
>>> Rename the original test_aarch64_aspeed.py to
>>> test_aarch64_aspeed_ast2700.py.
>>>
>>> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
>>> Change-Id: I3855f55c9f6e5cca1270c179445f549f8d81f36c
>>> Reviewed-by: Cédric Le Goater <clg@redhat.com>
>>> Link: https://lore.kernel.org/qemu-devel/20250505030618.3612042-1-steven_lee@aspeedtech.com
>>> [ clg: Added new tests in meson.build ]
>>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>>
>> Hi; this new test seems to trigger an error in a clang-sanitizer
>> build; would you mind having a look?
>>
>>   Output: qemu-system-aarch64: warning: hub port hub0port0 has no peer
>> qemu-system-aarch64: warning: hub 0 with no nics
>> qemu-system-aarch64: warning: netdev hub0port0 has no peer
>> qemu-system-aarch64: warning: nic ftgmac100.0 has no peer
>> qemu-system-aarch64: warning: nic ftgmac100.1 has no peer
>> qemu-system-aarch64: warning: nic ftgmac100.2 has no peer
>> qemu-system-aarch64: warning: requested NIC (#net038, model
>> unspecified) was not created (not supported by this machine?)
>> ../../system/memory.c:2798:27: runtime error: null pointer passed as
>> argument 2, which is declared to never be null
>> /usr/include/stdlib.h:962:6: note: nonnull attribute specified here
>>      #0 0x617e4121b113 in flatview_lookup
>> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/memory.c:2798:12
>>      #1 0x617e4121b113 in memory_region_find_rcu
>> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/memory.c:2833:10
>>      #2 0x617e4121a5a9 in memory_region_find
>> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/memory.c:2860:11
>>      #3 0x617e411c21ea in rom_check_and_register_reset
>> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../hw/core/loader.c:1317:19
>>      #4 0x617e411d5ec7 in qdev_machine_creation_done
>> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../hw/core/machine.c:1756:9
>>      #5 0x617e403d4877 in qemu_machine_creation_done
>> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/vl.c:2782:5
>>      #6 0x617e403d4877 in qmp_x_exit_preconfig
>> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/vl.c:2810:10
>>      #7 0x617e403d9a3c in qemu_init
>> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/vl.c:3844:9
>>      #8 0x617e41301126 in main
>> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/main.c:71:5
>>      #9 0x7faf8202a1c9 in __libc_start_call_main
>> csu/../sysdeps/nptl/libc_start_call_main.h:58:16
>>      #10 0x7faf8202a28a in __libc_start_main csu/../csu/libc-start.c:360:3
>>      #11 0x617e3f920654 in _start
>> (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/qemu-system-aarch64+0x161d654)
>> (BuildId: f3f8c2ca821e695937a615bee293c4a5a336a6bd)
>>
>> SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior
>> ../../system/memory.c:2798:27
>>
> 
> Ran into this as well.
> It would be nice to run sanitizers build in the upstream CI, so it's fixed before hitting master...

yes. The fby35 has the same problem, so we overlooked something related to
RAM initialization a while ago.

The fby35 machine has no public FW images and no test. That's probably why.

Thanks,

C.

