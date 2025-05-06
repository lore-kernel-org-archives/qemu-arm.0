Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3402237njj;
        Tue, 6 May 2025 14:09:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCViUx9mDopFWWceKMKIDXPXR7CWXPUkh67zjpvMRWSH9ILWYk/Q009arnxVdjQ13QNATLKJl6kwx0kIHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEPV4qPtsz8hrk1fCxZP2aGzDCAII55JszFdCyGWy/nkJH7cTovAINfyESFktjNJ+dSZEAl
X-Received: by 2002:a05:620a:19a7:b0:7c5:5596:8457 with SMTP id af79cd13be357-7caf74150ebmr124312885a.57.1746565795678;
        Tue, 06 May 2025 14:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746565795; cv=none;
        d=google.com; s=arc-20240605;
        b=LWJ0w7o7OQJq4kHyTYHU2DTr4h/kPxrKeSRHWXDoMidUycjmfsOpYu/ozUvTnKVWgQ
         vgjajpiWMTz1ZrKLRaJqaKRJE6O4pEp3xHvnBAM6/+oUzEWl+PEy6kUGeuyMKl0s43zD
         IhO4ei4goDrHjkGiga8wqGo8Oqyjs1nyBu6TrwOArKm/VinZ1awwG3+dDZKD4RcNDUJ2
         QBCH7O2nqV0weBn8EokIXYHl+HoKLBC//n/E04+yjfrERw6H9HxanOIh4118godzpHCR
         wKkylHeORTSJd3CWJwVRs27lpvOFagTvdRI0F6GFHYQaMpx5gQ5uwH8uQYtEO16PBO8R
         NR2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sjbg7I52z0npdmEfxhkf0Fiw9IZ+X9uZHh3o80HirmQ=;
        fh=wZXLrGwNptvfA9Ro/x37yrEfwOsBfUFQV5xeaMzOoTY=;
        b=SluGG9RAnyX+1dNquKkHiygzIV9Qd9bQZwY0ggGyVI/PXtsgre4HXiIcKXSPWC1Ql0
         h2VLD1xFAUcyxmtZtZvdCoN6zdAAbq7M4u0dNLkK0Qp//aSwqAqJYw6q75qoYqygqrBC
         bGXijOM+AGrUd4CfoPY+RUxnXMVCp2plHP2x35umywb9pv+yio5RBVuGQm6EJzza0ukY
         xGtb+eC2YP1/yLZeIoy6doRIJsmJRJyAzjymAPttz/ChBT3rtox1n2M1lpkIsBl0unvO
         TF68AtenyjiawALX8CjiPLNDYdWMAr/a5GcCHcP/1gM+n9DhVQbe7sQ1XIm9yWVa2w2R
         Sn4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uGwGRe1y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7caf75b0f74si45390085a.427.2025.05.06.14.09.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 May 2025 14:09:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uGwGRe1y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCPXp-00009e-Mu; Tue, 06 May 2025 17:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uCPXn-00008y-El
 for qemu-arm@nongnu.org; Tue, 06 May 2025 17:09:39 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uCPXl-0002Tz-FP
 for qemu-arm@nongnu.org; Tue, 06 May 2025 17:09:39 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-227b828de00so72780425ad.1
 for <qemu-arm@nongnu.org>; Tue, 06 May 2025 14:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746565775; x=1747170575; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sjbg7I52z0npdmEfxhkf0Fiw9IZ+X9uZHh3o80HirmQ=;
 b=uGwGRe1yv8W4bycYyP1pl9wxJfDrsXWBk5wgvV5qeudWNNWTnFSdarRZpkRZxQM3/f
 z7rJbk11N3U7QLns+DP2+ob/XForTZtCL3DVhU0FWuGuzrIBA3hK/HAtjrxFhJSCsqN+
 8ATL0RiDn+QoQY6qYBbpA+59ktf4/QtRDpczUMZBtyXxPBV8bIeoPsJ10su+iLIdBWCx
 4eyLgNp1mA6lj8kJQnoL5mUhzjpMnWYass1yPTQXjvyYeW8I9PdHlcp7OwAx1wQ0rZqw
 GljyKsp1OpKa57lMgh6vOb203o9vaj0WiQG02EaHmGy5Ul2IWyoHxJzxQXkMsSmpEPzz
 k0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746565775; x=1747170575;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sjbg7I52z0npdmEfxhkf0Fiw9IZ+X9uZHh3o80HirmQ=;
 b=XByMXGHK88HFcFWDUHikcCgaQwL049Xd/LEBGAI0GUYtix0mbyEAoqIBB7yvXmVXAh
 xifl6Az6Ik5eg+CpYlTEZlPi+7BHZsbWdInaZcy1BcZ0O56L6EBR+84rTKTFUUBtJc6B
 9MLk7ONeXfP8ZM3nRpOIG5Yj778kT7E3/MAkmlpAbd3P44iVqPkeoFmswJ0DjnkHHWIh
 PbLtUSZ6MRLd04/g8MG0y65dbmZ8zUU6e5m08rlE2188yE9AjepdNlPXng5AjRZjhy5W
 Iie1uZ3fvFHrcUB9OlTUUOX5RJUM3GfWuPUKn1ycs0Fuee2TaWTRlvqxmFOqzQBGERho
 WT7A==
X-Gm-Message-State: AOJu0YzHRlnivhCzrrwSEt6rDD5kB4fBlQ/Fgugf4X39eDwCe3LdbYIC
 V0dqoE2mqg4FtGNMAuVjabf1CKL+OpjsxlUZnBUfq7qMR7z/5JmwgxDaP/mgNak=
X-Gm-Gg: ASbGncuqt3/WmhgD5GWfsrnCIK3/Y8lXvougUakKxTMhyo10efWdaWRrv2R4oLsUeO1
 cHjSxaVO69xen4c1LYgI1CT1cZpX5UH/PSeBRDtzP1vFdbI2flf2JhiTkcVOTklbZQ3r/7I4sym
 wHDKB+nPSW60dLP+0PZU7szqVg8rJBlr3A91hIC+uygmZVHB5uIoATPigQhjhc9PGjol0iFBSrt
 NNcIcivv2gdFpDVZyToZMY/oP8m1FxBqPOBLULKEFaBvXoyB509sxL1BhsdLCgameHwvQS22Bd2
 arhseo4v9cnPpZ69bTTuq3xQBOfflY/JkzA9aW43F4FCGfUeciNMaA==
X-Received: by 2002:a17:902:e888:b0:224:1eaa:5de1 with SMTP id
 d9443c01a7336-22e5ea3afe6mr8654455ad.18.1746565775449; 
 Tue, 06 May 2025 14:09:35 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e150eb01dsm79039715ad.17.2025.05.06.14.09.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 14:09:34 -0700 (PDT)
Message-ID: <312fe25c-4331-4346-ae04-722e82b511e2@linaro.org>
Date: Tue, 6 May 2025 14:09:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 22/23] tests/function/aspeed: Add functional test for
 ast2700fc
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Steven Lee <steven_lee@aspeedtech.com>
References: <20250505090635.778785-1-clg@redhat.com>
 <20250505090635.778785-23-clg@redhat.com>
 <CAFEAcA8wmqAtcgfPvyMY8nujTWNCSC0DYO64aA5up-sTWCr_jA@mail.gmail.com>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA8wmqAtcgfPvyMY8nujTWNCSC0DYO64aA5up-sTWCr_jA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: NHyGepLkaK0C

On 5/6/25 7:22 AM, Peter Maydell wrote:
> On Mon, 5 May 2025 at 10:12, Cédric Le Goater <clg@redhat.com> wrote:
>>
>> From: Steven Lee <steven_lee@aspeedtech.com>
>>
>> Introduce a new test suite for ast2700fc machine.
>> Rename the original test_aarch64_aspeed.py to
>> test_aarch64_aspeed_ast2700.py.
>>
>> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
>> Change-Id: I3855f55c9f6e5cca1270c179445f549f8d81f36c
>> Reviewed-by: Cédric Le Goater <clg@redhat.com>
>> Link: https://lore.kernel.org/qemu-devel/20250505030618.3612042-1-steven_lee@aspeedtech.com
>> [ clg: Added new tests in meson.build ]
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> 
> Hi; this new test seems to trigger an error in a clang-sanitizer
> build; would you mind having a look?
> 
>   Output: qemu-system-aarch64: warning: hub port hub0port0 has no peer
> qemu-system-aarch64: warning: hub 0 with no nics
> qemu-system-aarch64: warning: netdev hub0port0 has no peer
> qemu-system-aarch64: warning: nic ftgmac100.0 has no peer
> qemu-system-aarch64: warning: nic ftgmac100.1 has no peer
> qemu-system-aarch64: warning: nic ftgmac100.2 has no peer
> qemu-system-aarch64: warning: requested NIC (#net038, model
> unspecified) was not created (not supported by this machine?)
> ../../system/memory.c:2798:27: runtime error: null pointer passed as
> argument 2, which is declared to never be null
> /usr/include/stdlib.h:962:6: note: nonnull attribute specified here
>      #0 0x617e4121b113 in flatview_lookup
> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/memory.c:2798:12
>      #1 0x617e4121b113 in memory_region_find_rcu
> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/memory.c:2833:10
>      #2 0x617e4121a5a9 in memory_region_find
> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/memory.c:2860:11
>      #3 0x617e411c21ea in rom_check_and_register_reset
> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../hw/core/loader.c:1317:19
>      #4 0x617e411d5ec7 in qdev_machine_creation_done
> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../hw/core/machine.c:1756:9
>      #5 0x617e403d4877 in qemu_machine_creation_done
> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/vl.c:2782:5
>      #6 0x617e403d4877 in qmp_x_exit_preconfig
> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/vl.c:2810:10
>      #7 0x617e403d9a3c in qemu_init
> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/vl.c:3844:9
>      #8 0x617e41301126 in main
> /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/../../system/main.c:71:5
>      #9 0x7faf8202a1c9 in __libc_start_call_main
> csu/../sysdeps/nptl/libc_start_call_main.h:58:16
>      #10 0x7faf8202a28a in __libc_start_main csu/../csu/libc-start.c:360:3
>      #11 0x617e3f920654 in _start
> (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/qemu-system-aarch64+0x161d654)
> (BuildId: f3f8c2ca821e695937a615bee293c4a5a336a6bd)
> 
> SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior
> ../../system/memory.c:2798:27
>

Ran into this as well.
It would be nice to run sanitizers build in the upstream CI, so it's 
fixed before hitting master...

> 
> thanks
> -- PMM
> 

