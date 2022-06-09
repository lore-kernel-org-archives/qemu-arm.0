Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp593589lfb;
        Thu, 9 Jun 2022 10:37:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwioGsWZZfyhmDkX99B9qw7kkChQYQFjAO65Q9te141bgJOHpEeCqyXH5rrGnL9DTe4pwnC
X-Received: by 2002:a05:6402:3514:b0:42f:dd01:922 with SMTP id b20-20020a056402351400b0042fdd010922mr34282462edd.324.1654796228421;
        Thu, 09 Jun 2022 10:37:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654796228; cv=none;
        d=google.com; s=arc-20160816;
        b=Gl9YfnxkVrD1/7iO6zVzSN8s5wNoGNgfg1htApDOd9RbS4J9XXU7EaMNGZvKLhruGb
         bfOFEmVizxZMasSDGxS2u7OrfJ6yFVKyiSubC707KdU/tFv8lZKHXbTZ93GjSa6AP5yn
         UEqRk6Sm+6rlzNbAB07doOyeQvqZe2mhEcpRR+F5ctR1HfGFyiUtos2sfOzas3Yheqo4
         P9qvVgrddErTCbMupVWdRWJ0MfUocG3u0D9e2h64JMmDT806InFn3CwN3aTJ9y7GBtlL
         UxJxPT7wASRm+LkoyiiMD5bmLAcCEtzIwtXYLahgFU4ZU96847yOGMjMV85WxEOSpt/E
         GU+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:subject:from
         :references:cc:to:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fxKrKsQEB8G4iQGYeKuwDNZ4gycDD93QMtfokS0qGEw=;
        b=RAmCIwIwLSiuvdaBvHumroZgztkASnBYQjkFmMpZDqVl8Eae00vI+NgRcDwxCoyQxl
         eM2mG2omB2NN9wQX6/rJJwP3mLD0cLwoGLD6RgLfbCbEcEV/8ZFlpJpCXcD9+svv1fXN
         gwu1rERhekly0uF/kElk3jgv16UObUmwIuEIA3IqKRJoCsTZ41h3mHes98/zJXwGpd2x
         Y/U0/kEpG700LVRGXOxJkwn74h44iYEFDB6hjR2ul1Qn1rA9KAzWieqFdpCmacrCH6TE
         Y41BoOUkbiTqeV3nlUm4L/vR9TUE7Vnb29ayDpmDRMmkKqp3D6jvkndvO3DWqTJhxl+r
         I/fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L4fkStM8;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id w7-20020a056402268700b0042e0fad1b66si25660100edd.524.2022.06.09.10.37.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jun 2022 10:37:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L4fkStM8;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654796227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fxKrKsQEB8G4iQGYeKuwDNZ4gycDD93QMtfokS0qGEw=;
	b=L4fkStM8JoZvl4Wv/P+FSqywxwxlgeD/bV/Wb3wDQVXGA1yYEF2k87Nfv/+6RWxTGJIwAj
	we3nKtkrA47LO+bQIoAZldwx+z30N4pgOHXC2fGLs8cqcoVnHaEubowO2x0Z0d4wZWQ72G
	Hu1pxCGn1vBH4uDwZnZUHACXb8s1IxM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-R_EUES1RNs24fXjc2eIjEA-1; Thu, 09 Jun 2022 13:36:55 -0400
X-MC-Unique: R_EUES1RNs24fXjc2eIjEA-1
Received: by mail-wm1-f72.google.com with SMTP id j31-20020a05600c1c1f00b0039c481c4664so4394842wms.7
        for <alex.bennee@linaro.org>; Thu, 09 Jun 2022 10:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=fxKrKsQEB8G4iQGYeKuwDNZ4gycDD93QMtfokS0qGEw=;
        b=oCQdxB6Fjc503Rf9HuHzQVMTnntxjyHbSRWBUz6EQzBGHbccpbs8gaiNFuWmk6/YuM
         zNGeqTmGrIGMwLhB4J95KftiTINPhbkAFT6DmB7vgCFg2Yw/V1AcDTRy2lCY2NvUbxOs
         9FSsVI8yQlol1KWtndGzSZo0FHVhi2TB4fJK/trzXEzgik0IE1t45UV5VFdv1kMxsor5
         0K9ebfJ9Yq+HWuUXjkOSgtDcWPB48LR2RJWstLnacO1pMf9vx/C5TP5PIULL2JMn/+I2
         GWkBsgGS+Ztic/MUR5x8WXGgscB5VtIjJuhC65ka4F/ZvaWdzv+AkC2XAqvibT7iIR3R
         GS/w==
X-Gm-Message-State: AOAM531x1w+rR8UZhQzuYJQJxHEM+hmv2zq8TWS2MmAqpYwFQdwGQCDe
	Me6MAbhKMUChFZNc4XGaRF9Y8AyJEioZz0136LQTis1mfbYhvtWdu8xdatriXS7drMBn3x1Bk8S
	j6DX002OD+rEV4ViB
X-Received: by 2002:a05:600c:4fd2:b0:39c:1586:a2e0 with SMTP id o18-20020a05600c4fd200b0039c1586a2e0mr4466405wmq.62.1654796214364;
        Thu, 09 Jun 2022 10:36:54 -0700 (PDT)
X-Received: by 2002:a05:600c:4fd2:b0:39c:1586:a2e0 with SMTP id o18-20020a05600c4fd200b0039c1586a2e0mr4466368wmq.62.1654796214049;
        Thu, 09 Jun 2022 10:36:54 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.3] (ip-109-42-115-130.web.vodafone.de. [109.42.115.130])
        by smtp.gmail.com with ESMTPSA id f18-20020a5d4dd2000000b0020fd392df33sm25269084wru.29.2022.06.09.10.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 10:36:53 -0700 (PDT)
Message-ID: <62d1fed0-4c18-0d36-3912-d762baa34462@redhat.com>
Date: Thu, 9 Jun 2022 19:36:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To: Vince Del Vecchio <Vince.DelVecchio@mediatek.com>,
 Claudio Fontana <cfontana@suse.de>, Stefan Pejic <stefan.pejic@syrmia.com>,
 Dragan Mladjenovic <OT_Dragan.Mladjenovic@mediatek.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Matthew Fortune <matthew.fortune@mips.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Pejic <OT_Stefan.Pejic@mediatek.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220603164249.112459-1-thuth@redhat.com>
 <07f021e7-1346-c6b3-3bd1-ef0d0f0e2ff5@suse.de>
 <52c51ac4-5598-faf2-d5e5-638cab0dc1fd@redhat.com>
 <7ae17984-89c4-2247-57a7-fde6206e41e0@redhat.com>
 <03a1e04e-45c7-5002-6920-d04e29fd48fd@redhat.com>
 <YqG2Anwtba+MfxfH@redhat.com> <209c7aaf-bc7b-cbc2-c6d0-002bbe31258a@suse.de>
 <e29d83e6-e7bb-b370-33d0-88d22aa2eddb@suse.de>
 <4d58f632-df78-b709-37b8-f7d86ae536f6@redhat.com>
 <TY0PR03MB679726901BD6C6BE40114A2FE2A79@TY0PR03MB6797.apcprd03.prod.outlook.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: What to do with the nanomips disassembler (was: [PATCH] disas:
 Remove libvixl disassembler)
In-Reply-To: <TY0PR03MB679726901BD6C6BE40114A2FE2A79@TY0PR03MB6797.apcprd03.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: E/z7bACXlaMO

On 09/06/2022 18.31, Vince Del Vecchio wrote:
> On Thu, Jun 9, 2022 at 10:34AM, Thomas Huth wrote:
>> On 09/06/2022 16.15, Claudio Fontana wrote:
>>> On 6/9/22 13:27, Claudio Fontana wrote:
>>>> On 6/9/22 10:57, Daniel P. Berrangé wrote:
>>>>> On Thu, Jun 09, 2022 at 10:47:24AM +0200, Thomas Huth wrote:
>>>>>> On 08/06/2022 17.51, Paolo Bonzini wrote:
>>>>>>> On 6/3/22 19:35, Thomas Huth wrote:
>>>>>>>> On 03/06/2022 19.26, Claudio Fontana wrote:
>> [...]
>>>>>>>>> maybe something we can now drop if there are no more C++ users?
>>>>>>>>
>>>>>>>> I thought about that, too, but we still have disas/nanomips.cpp
>>>>>>>> left and the Windows-related files in qga/vss-win32/* .
>>>>>>>
>>>>>>> That is pure C++ so it does not need the extra complication of
>>>>>>> "detect whether the C and C++ compiler are ABI-compatible"
>>>>>>> (typically due to different libasan/libtsan implementation between
>>>>>>> gcc and clang).  So it's really just nanoMIPS that's left.
>>>>>>
>>>>>> Ok, so the next theoretical question is: If we get rid of the
>>>>>> nanomips.cpp file or convert it to plain C, would we then simplify
>>>>>> the code in configure again (and forbid C++ for the main QEMU
>>>>>> code), or would we rather keep the current settings in case we want
>>>>>> to re-introduce more C++ code again in the future?
>>>>>>
>>>>> It doesn't feel very compelling to have just 1 source file that's
>>>>> C++ in QEMU. I'm curious how we ended up with this nanomips.cpp
>>>>> file - perhaps it originated from another project that was C++ based
>>>>> ?
>>>>>
>>>>> The code itself doesn't look like it especially needs to be using
>>>>> C++. There's just 1 class there and every method is associated
>>>>> with that class, and external entry point from the rest of QEMU is
>>>>> just one boring method. Feels like it could easily have been done in
>>>>> C.
>>>>>
>>>>> Personally I'd prefer it to be converted to C, and if we want to add
>>>>> any C++ in future it should be justified & debated on its merits,
>>>>> rather than as an artifact of any historical artifacts such as the
>>>>> code in configure happening to still exist.
>>>>
>>>> I'll take a look at it, maybe I can turn it to C fairly quickly.
>>>
>>> It seems to be generated code, getting the original authors involved in the thread.
>>
>> Not sure whether the original mips folks are still around ... but the folks from MediaTek recently expressed their interest in nanoMIPS:
>>
>>   
>> https://lore.kernel.org/qemu-devel/20220504110403.613168-8-stefan.pejic@syrmia.com/
>>
>> Maybe they could help with the nanoMIPS disassembler?
>>
>> I know it's likely a lot of work, but the best solution would maybe be to add nanoMIPS support to capstone instead, then other projects could benefit from the support in this library, too...
>>
>> If I googled that right, there is a LLVM implementation of nanoMIPS available here:
>>
>>   
>> https://github.com/milos1397/nanomips-outliner/tree/master/llvm/lib/Target/Mips
>>
>> ... so maybe that could be used as input for capstone (which is based on llvm)?
>>
>>   Thomas
> 
> Yes, we are working on an LLVM port for nanoMIPS.  It's functionally complete and pretty usable, although we're still tuning performance.  The more official location is https://github.com/MediaTek-Labs/llvm-project.
> 
> However, for now we're still using the binutils assembler; there's no encoding information in the current LLVM description.  We have tentative plans to work on encoding and integrated-as later this year.  Correct me if I'm wrong, but I would assume that, before that's available, it's not feasible to use capstone?

I'm also not very familiar with the way capstone translated the information 
from LLVM into its disassembler source files, but I guess you're right - 
this likely cannot work yet.

> Regardless, I think we can look at converting the existing disassembler from C++ to C.  That would address the current concern, right?

Right - if it's not too much of a hassle that would be great!

  Thomas
