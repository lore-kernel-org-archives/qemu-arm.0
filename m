Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp481966lfb;
        Thu, 9 Jun 2022 07:34:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWnzl8FzAqp/brdrhWS0Tmim4Vm9izS7yNprvvk8LKiYVQjgLUPqhmVPTpSJjvrwCBgmU8
X-Received: by 2002:ac8:5f0a:0:b0:304:dffc:b657 with SMTP id x10-20020ac85f0a000000b00304dffcb657mr26454076qta.448.1654785260258;
        Thu, 09 Jun 2022 07:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654785260; cv=none;
        d=google.com; s=arc-20160816;
        b=RuVXSS2wRsrlEquz254OHWlhSdEDJ9F4Xp4u02BrTtQvTILEgujwH1NsTsZ7J7kbLD
         dKtezLEZwQWT9gX0BQf6F+6Q858PXul9XhPt2kJQLML0rlBgfZAFBuNv3Qz8NXK+IKLN
         UGYXL7bM46mJQf6/RUVa/ZEqaItU/5nJat6HfAoNVZ2PCK8luA66aoaDUd1xMZTYcxGh
         bwnZtSf3MCFRWBVlv6hxsF2Wnbj3NVwESW4JNJ3UEkzCgiAthKo/N/DVvamfAunlcrhf
         gBbRb706G2otInecfdMpBsYtbS53eXuStQpNznjGpqCBS3/ZVfjRMDgK84PwQA8r9LWZ
         utXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:subject:from
         :references:cc:to:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vPW+5faa2QW+8Z/lK9Y/JDyNDJu0hl5AZwrGuRsAXbc=;
        b=GGxWPcDCTZoxqnFUjAg0ZrLLvT4cryCKC0e2BiOb89/PGJ9R4rBNxW6hhxSBHCecN+
         7OeiweoBFzf9lWCsZ3SdC/kegTG5Zi2a5oNObB9IY+hzWG+GbJhWWFGzmn6K6U03nKYT
         SanUcfsp3wLGfgbC+cuoLPIE6QQUyh3BrB9/2nh9HFSoZ4ynAxNCF4+h3LG5aiz16gdN
         WjeNZDHTOgcvcVMah/ORkPA/Hx0oEOfyWTqaVilSaQzfmqOs6bmduQYYWNHyHxs5I7q3
         XrasCJFi9+QsadZMxmTzWcxGrKjCbinz5GMvrQ+DSbbKIkUwynpViBfFkzKE5H7LXTq1
         rUIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iBVNj3IE;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id gc11-20020a056214230b00b00461f624eafcsi12915067qvb.104.2022.06.09.07.34.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jun 2022 07:34:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iBVNj3IE;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654785259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vPW+5faa2QW+8Z/lK9Y/JDyNDJu0hl5AZwrGuRsAXbc=;
	b=iBVNj3IEWoTvGjwURSzNuh7bUcdH7Yoc+weTWEHiGUrtSTU5kp85Hbk1gh5GHltdsvbLKG
	fzF1Vs4FQTwoFhFT0nyOJ8v2Fpbn+sSmxKf+V3kb4/ksGSa+n/deNNm/oHuwx0eir0d9/e
	PaITwmFL4W92U7uuLcbU9U8uSDMlJBA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-NU6tU1mbNQKLTP9T_VrJ5Q-1; Thu, 09 Jun 2022 10:34:16 -0400
X-MC-Unique: NU6tU1mbNQKLTP9T_VrJ5Q-1
Received: by mail-wr1-f71.google.com with SMTP id bw25-20020a0560001f9900b002175d64fd29so3745873wrb.9
        for <alex.bennee@linaro.org>; Thu, 09 Jun 2022 07:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=vPW+5faa2QW+8Z/lK9Y/JDyNDJu0hl5AZwrGuRsAXbc=;
        b=pXYwFZDk4Fyimv1jU9xQOezxoob9PBoik1EvyLwQ9JBmY99sw5rxkAwDeu+xmFaPd+
         9t9US8EKexe95R3HCG/zmwsDQ4azoBNWXFLtHCLUug0XilOJcbz5WaAKDpasUkfVJ7Tg
         n84jYjv3k2+ZcZjpspCY9W/yFVyYSfTmJufELrO7Eej/UOAcW/8buzn5Knw96tWBitHV
         g7mDmex/5zKY3VoXvwF80SRxxyliUBOdMkQ3+7HLltdRH0UwBFSHO3E5Bhk/Zr2pADnO
         PEk/i9/qfGdDFhWwNw7Y6uw+GLs83wq9qWhtXxcFyJ3vfFNK74YWBuw4dX0oZv7fkp7a
         kSVQ==
X-Gm-Message-State: AOAM533qY7FMDsAWaM1VZ55IX43oTC5obrDR6F5cJvlTnEJTEy0vvNIh
	30OZMODophrkN8yO5q33y0+29HcmlVQe9Q1jRNcJpVdwUdzCgZ3NUEZgCpFbaIiJiS3XO52BjVC
	kocaJwboQP/qkQpc8
X-Received: by 2002:a05:600c:3d1b:b0:39b:1743:4d84 with SMTP id bh27-20020a05600c3d1b00b0039b17434d84mr3601505wmb.118.1654785255630;
        Thu, 09 Jun 2022 07:34:15 -0700 (PDT)
X-Received: by 2002:a05:600c:3d1b:b0:39b:1743:4d84 with SMTP id bh27-20020a05600c3d1b00b0039b17434d84mr3601464wmb.118.1654785255252;
        Thu, 09 Jun 2022 07:34:15 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.3] (ip-109-42-115-130.web.vodafone.de. [109.42.115.130])
        by smtp.gmail.com with ESMTPSA id h7-20020a05600c350700b0039c3b05540fsm26425084wmq.27.2022.06.09.07.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 07:34:14 -0700 (PDT)
Message-ID: <4d58f632-df78-b709-37b8-f7d86ae536f6@redhat.com>
Date: Thu, 9 Jun 2022 16:34:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To: Claudio Fontana <cfontana@suse.de>, Stefan Pejic
 <stefan.pejic@syrmia.com>, ot_dragan.mladjenovic@mediatek.com
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Matthew Fortune <matthew.fortune@mips.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 ot_stefan.pejic@mediatek.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220603164249.112459-1-thuth@redhat.com>
 <07f021e7-1346-c6b3-3bd1-ef0d0f0e2ff5@suse.de>
 <52c51ac4-5598-faf2-d5e5-638cab0dc1fd@redhat.com>
 <7ae17984-89c4-2247-57a7-fde6206e41e0@redhat.com>
 <03a1e04e-45c7-5002-6920-d04e29fd48fd@redhat.com>
 <YqG2Anwtba+MfxfH@redhat.com> <209c7aaf-bc7b-cbc2-c6d0-002bbe31258a@suse.de>
 <e29d83e6-e7bb-b370-33d0-88d22aa2eddb@suse.de>
From: Thomas Huth <thuth@redhat.com>
Subject: What to do with the nanomips disassembler (was: [PATCH] disas: Remove
 libvixl disassembler)
In-Reply-To: <e29d83e6-e7bb-b370-33d0-88d22aa2eddb@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 0z9JIR5ouIdD

On 09/06/2022 16.15, Claudio Fontana wrote:
> On 6/9/22 13:27, Claudio Fontana wrote:
>> On 6/9/22 10:57, Daniel P. Berrangé wrote:
>>> On Thu, Jun 09, 2022 at 10:47:24AM +0200, Thomas Huth wrote:
>>>> On 08/06/2022 17.51, Paolo Bonzini wrote:
>>>>> On 6/3/22 19:35, Thomas Huth wrote:
>>>>>> On 03/06/2022 19.26, Claudio Fontana wrote:
[...]
>>>>>>> maybe something we can now drop if there are no more C++ users?
>>>>>>
>>>>>> I thought about that, too, but we still have disas/nanomips.cpp left
>>>>>> and the Windows-related files in qga/vss-win32/* .
>>>>>
>>>>> That is pure C++ so it does not need the extra complication of "detect
>>>>> whether the C and C++ compiler are ABI-compatible" (typically due to
>>>>> different libasan/libtsan implementation between gcc and clang).  So
>>>>> it's really just nanoMIPS that's left.
>>>>
>>>> Ok, so the next theoretical question is: If we get rid of the nanomips.cpp
>>>> file or convert it to plain C, would we then simplify the code in configure
>>>> again (and forbid C++ for the main QEMU code), or would we rather keep the
>>>> current settings in case we want to re-introduce more C++ code again in the
>>>> future?
>>>
>>> It doesn't feel very compelling to have just 1 source file that's
>>> C++ in QEMU. I'm curious how we ended up with this nanomips.cpp
>>> file - perhaps it originated from another project that was C++
>>> based ?
>>>
>>> The code itself doesn't look like it especially needs to be using
>>> C++. There's just 1 class there and every method is associated
>>> with that class, and external entry point from the rest of QEMU
>>> is just one boring method. Feels like it could easily have been
>>> done in C.
>>>
>>> Personally I'd prefer it to be converted to C, and if we want to
>>> add any C++ in future it should be justified & debated on its
>>> merits, rather than as an artifact of any historical artifacts
>>> such as the code in configure happening to still exist.
>>
>> I'll take a look at it, maybe I can turn it to C fairly quickly.
> 
> It seems to be generated code, getting the original authors involved in the thread.

Not sure whether the original mips folks are still around ... but the folks 
from MediaTek recently expressed their interest in nanoMIPS:

 
https://lore.kernel.org/qemu-devel/20220504110403.613168-8-stefan.pejic@syrmia.com/

Maybe they could help with the nanoMIPS disassembler?

I know it's likely a lot of work, but the best solution would maybe be to 
add nanoMIPS support to capstone instead, then other projects could benefit 
from the support in this library, too...

If I googled that right, there is a LLVM implementation of nanoMIPS 
available here:

 
https://github.com/milos1397/nanomips-outliner/tree/master/llvm/lib/Target/Mips

... so maybe that could be used as input for capstone (which is based on llvm)?

  Thomas
