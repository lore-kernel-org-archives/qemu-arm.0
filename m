Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4697774ejc;
        Mon, 6 Mar 2023 06:18:29 -0800 (PST)
X-Google-Smtp-Source: AK7set/q/iAJLWSXh2sc0J9GF6zz19sxSf163mFHH/uGnjfvH8ihK4KOle0Q2Bvrifd40VM+DSfM
X-Received: by 2002:a17:906:2b99:b0:8b1:fc59:a22b with SMTP id m25-20020a1709062b9900b008b1fc59a22bmr10890460ejg.34.1678112309220;
        Mon, 06 Mar 2023 06:18:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678112309; cv=none;
        d=google.com; s=arc-20160816;
        b=t8fCWRGSz6w6B63Kh/lh+S/k4NFSv0yeiy3s1Doo9fOPLtqzEdoT0IUI8QyFl6RPP0
         PQ8ioLLEk2BvOkAKf6/XufhzcjZFccLKhUMk6LiQR5d3qXOuu1EQwpoDIK2iKIhfRv8L
         IY/OML27cEpJNdItXgBvQMecOxbSL4nnb0XqObtkVs8Xjrwz5LVQ73WCGW7Bp79xwoTB
         X/VGNsChU/u++UN7royt2iM3ewYWk0iGGFFNfroqiax8zOOzp5+J42cqGZIN7G1Bqx8b
         In8JavUIbv9hhWXJ/3y0gKPFI9a13ZLKDSreVgCYe4XRSsTSDh8wtbEjGRYOX0ZLoFNV
         NS5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Mbkz7IRHAR6Gk1TwwjGuAsPHXnfma+ZrprMAvR7H3bE=;
        b=mGmbcDjxO/BfIPe9yROebPuoLYP3I+drSAvW5DzL6265r76LTSDkjzKLVHAWaKuLHJ
         bEGwzrqZdIFet5bhnkwMwucvTE/02PNO7eF7tFDksAta5RMoWGXyyfGy8rFZSBO9nm+L
         nihSubeOPUzBJH+FHzhKzy6KVhsajrByHX0msV5xwjgTmKrcxGwmk+2bGpQKvC/cbW6A
         yacX/IWcXHJdhFync/5T0lks2IhtPl/fZex/F1pFbfmy+f2s6BEnoMUAxOC6hlcMup4L
         niJZeiCg86xb+nDQcFlPbub80MygQSSqc2Cyv9iEYGacTqqPYZT5pVEnMdPwph82RbZF
         CAMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="cUvCgz/1";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id p11-20020a1709066a8b00b008c9434c4b8asi450666ejr.234.2023.03.06.06.18.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 06:18:29 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="cUvCgz/1";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678112308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mbkz7IRHAR6Gk1TwwjGuAsPHXnfma+ZrprMAvR7H3bE=;
	b=cUvCgz/1TOpzETe9v9/qhb1vtRanSRVtiwRKMOx5m3cAMGtnbIs0Wfcz5QpzV+VCSL5zUk
	nMfb+zDYgRppITaBxRUeNQUwc9v8/ZJis+j7cuCXNklMqvRzMjHtL1b1L5N3APpS6CZST2
	lNcuoeeB75NnrLoQs59Wrwr/UGvvr1U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-jHYfxT3ZN1Su9YiVeACoSA-1; Mon, 06 Mar 2023 09:18:27 -0500
X-MC-Unique: jHYfxT3ZN1Su9YiVeACoSA-1
Received: by mail-wm1-f70.google.com with SMTP id j6-20020a05600c1c0600b003eaf882cb85so3790123wms.9
        for <alex.bennee@linaro.org>; Mon, 06 Mar 2023 06:18:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678112306;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mbkz7IRHAR6Gk1TwwjGuAsPHXnfma+ZrprMAvR7H3bE=;
        b=sH9QrxLjyTvY9IaFNGAVFeYO620ioV8rdbcu0fg4u7e58u5D5LY/v0LHs8mpb0ba0+
         CxkL9G+gZ/CWGgSviVFomS79WNZktzmGoMNJVGfmWe884Hd2RPk78llPkUUsSrwl9q37
         E8un7OcpyZ0P/cf3ImGuvD5ybHppLMCi+/OliVks9dfWe8iQFYsDZLEpPiUmkee14unE
         OCzCaqcBq7ZcC4/ZNg4s21f1KUel21xkAM20OhBXFxC+2+hIL09iNCQhnpftFUYZeEXg
         BmSmsUo4L2wYr231Lb8nZLry6i/LrHqZULmxtyDZCNhi9rUp082ABBhvdQGy+jzrw2pG
         Yf3g==
X-Gm-Message-State: AO0yUKWKmnTkw7w2Hy+4KuJyKtXzL64NSXGQNojyOfPAljyYzOF5xrUk
	UlzP21sX7y0J2hv4R4pRBvoMarcllFfYkB9FGuVdRAq9N7RMYUW6hZ1VYYPtet7/OA+Wdc0UzdJ
	9n429POW2+a7A2qRG
X-Received: by 2002:a05:600c:198e:b0:3eb:36fa:b78d with SMTP id t14-20020a05600c198e00b003eb36fab78dmr9109233wmq.23.1678112305982;
        Mon, 06 Mar 2023 06:18:25 -0800 (PST)
X-Received: by 2002:a05:600c:198e:b0:3eb:36fa:b78d with SMTP id t14-20020a05600c198e00b003eb36fab78dmr9109217wmq.23.1678112305735;
        Mon, 06 Mar 2023 06:18:25 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-177-59.web.vodafone.de. [109.43.177.59])
        by smtp.gmail.com with ESMTPSA id g40-20020a05600c4ca800b003eb3933ef10sm10076844wmp.46.2023.03.06.06.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 06:18:25 -0800 (PST)
Message-ID: <7f1501ba-f875-b227-8d7e-f43e69b2ab8d@redhat.com>
Date: Mon, 6 Mar 2023 15:18:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 2/5] docs/about/deprecated: Deprecate the
 qemu-system-i386 binary
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-3-thuth@redhat.com> <ZAWx5eBskd1cItDx@redhat.com>
 <a97c8b6d-8e58-82b5-d73f-72a7061fb5d4@redhat.com>
 <ZAXzUIs6wODe7/hf@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZAXzUIs6wODe7/hf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 2lFQpSFHwGes

On 06/03/2023 15.06, Daniel P. Berrangé wrote:
> On Mon, Mar 06, 2023 at 02:48:16PM +0100, Thomas Huth wrote:
>> On 06/03/2023 10.27, Daniel P. Berrangé wrote:
>>> On Mon, Mar 06, 2023 at 09:46:55AM +0100, Thomas Huth wrote:
>>>> [...] If a 32-bit CPU guest
>>>> +environment should be enforced, you can switch off the "long mode" CPU
>>>> +flag, e.g. with ``-cpu max,lm=off``.
>>>
>>> I had the idea to check this today and this is not quite sufficient,
>> [...]
>>> A further difference is that qemy-system-i686 does not appear to enable
>>> the 'syscall' flag, but I've not figured out where that difference is
>>> coming from in the code.
>>
>> I think I just spotted this by accident in target/i386/cpu.c
>> around line 637:
>>
>> #ifdef TARGET_X86_64
>> #define TCG_EXT2_X86_64_FEATURES (CPUID_EXT2_SYSCALL | CPUID_EXT2_LM)
>> #else
>> #define TCG_EXT2_X86_64_FEATURES 0
>> #endif
> 
> Hmm, so right now the difference between qemu-system-i386 and
> qemu-system-x86_64 is based on compile time conditionals. So we
> have the burden of building everything twice and also a burden
> of testing everything twice.
> 
> If we eliminate qemu-system-i386 we get rid of our own burden,
> but users/mgmt apps need to adapt to force qemu-system-x86_64
> to present a 32-bit system.
> 
> What about if we had qemu-system-i386 be a hardlink to
> qemu-system-x86_64, and then changed behaviour based off the
> executed binary name ?

We could also simply provide a shell script that runs:

  qemu-system-x86_64 -cpu qemu32 $*

... that'd sounds like the simplest solution to me.

  Thomas
