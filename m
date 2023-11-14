Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1874805ejc;
        Mon, 13 Nov 2023 23:58:25 -0800 (PST)
X-Received: by 2002:a05:600c:3d10:b0:402:ff8d:609b with SMTP id bh16-20020a05600c3d1000b00402ff8d609bmr6896740wmb.33.1699948705353;
        Mon, 13 Nov 2023 23:58:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699948705; cv=none;
        d=google.com; s=arc-20160816;
        b=kvDgmQU+6ugFDsB60D/wdaEGk6Q0xe6ZVj00wz3RXeiyWloKFoawNI10BeJb28q/DL
         V/RGC8zqNZ3Eve2ApV+0UIHZ3+6XLp6PswK4e10Y/3f9vVcFI+aFfaeWtojJa2NdVGVa
         +JBK8kYdpqEdwXqVko6pZ6SNwBYmXXAWSO2MaES63cOMZV5F3kyW+KPFVWc1+gqIcuw2
         jwaRQQO1+LhHeFNVu2xICpAEyXbBYGRlUlG4N216HeYtklwM0OqQjpa7w4yxu4fDAHEC
         4rX3daJFJsEUPTY+HdeQ4RQMv/MUIFYqwIVe8mGjR6K+ulHOLUyvDJa9PJklI5L94tey
         7JOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/ocmXiH4qcLkoZdQoaluE8CpB0EXbFAC8scGwpgtKsc=;
        fh=8rXE5142xSxqvhKbOviMovGfZ8HOw/C9aQF9KwL8P3o=;
        b=Vr40dH69wYgTbIx6hfp6uPdSInObEBlSPY37w3xTu0RyE3k8lxihaCFoeEwP42NB/2
         ItWmfurPc0Zh5/t0/0eG8VeExD5Z78be3Z5qv0ZuvGCWpGAPaaz1INNVXHhMdls1Fyuj
         jEr4/lMlme3EfnDdRV/ZgoJsQMtLfr/lTtAbNsMgF+R0JdXx6rQ8t2G5nxNIutKd6ZxS
         6nrO1yL0vrUPXQjZ4FM/Rz9jwl0npCra9teaC9/dG7k1fi80vySZRlY8sMP7kaLHzvCZ
         S2x3kKtRru8O1gqYpej0+Qih6liOlkAWlHwesi5HJkg42fbvrf414i30Zg9feMrdiuL3
         u8dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ouRTcoXj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j22-20020a05600c489600b00403b83c45f1sor1575280wmp.13.2023.11.13.23.58.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 23:58:25 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ouRTcoXj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699948705; x=1700553505; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ocmXiH4qcLkoZdQoaluE8CpB0EXbFAC8scGwpgtKsc=;
        b=ouRTcoXjiDgY3RxWj5gO9YN/X9ZgGmjKPbSzX7Z8tOFcZfA3acVq2DuqhJeM7mFlWg
         7pfJCAD9+CfqVUunPWiTVQUUmtzqqK3N9qMlE4XqDed1hpwr8sdJpGpVi9Nj7le/5vuT
         d6Qtsz5GurTC7xeAZQ45EfS+NayIbqvNetOLJWtnnPfbER0/JvHhfSrUeTZ9b3brV7ce
         fjCUAhyigTNZGvLB3QXBTYd4YaEcXGC1GpSxLIf2YHXVuT3H91JkV4F3L+43oLCsyQRm
         4+9452PnTx4AIzcp/89b2fPezDnluMWNe6ZRkpQhB99CyhZUAeB5jpR9R/MO/+af2lio
         fhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699948705; x=1700553505;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ocmXiH4qcLkoZdQoaluE8CpB0EXbFAC8scGwpgtKsc=;
        b=c4CEEcCfKCrebrcbQD0/6KIwqknmUxztVM7iVz2XEOAbvJ8kD2i9wG9+OcBAApVZRC
         GVn1eLXpmy1i8F/qH5mghLWxdoDwCbnEFe0bnIMJZVw3lyu6onwP6Uj1kU+y/QUrFEGT
         VkfaNYapvPc+Rs+bckUS7xRsjujZa8sV3OZH4EDDPnAi6vOpUVG+9yUblndu4nOUCaJH
         1H5TuurZXJ3MEBYcEONGp50RUQ6sM/6jdqVoFvsSGfgjC08hKshfT8WdsJrJVwTS3SLA
         BKMWvrcDmwtQVRy/wO3S1NjsDZORxahlVF6+ClJTdqKYfNi7nHKdCRZiVFZd6HrJ4h0V
         0rFA==
X-Gm-Message-State: AOJu0Yxn1SkD4mILIiy21iOvDOmauKY8MAcRJxDlfKCnCEjnUMRefPIz
	PhxljaWiL0S91NWyQE9ciNm91UX1
X-Google-Smtp-Source: AGHT+IGLnHPxByJUZlv0OHbrwkWB8vQY4zl1JbOsJeysfx3/2KJYr3iDxrCmrQRuOG07AKPgS0e+TQ==
X-Received: by 2002:a05:600c:1c21:b0:407:612b:91fb with SMTP id j33-20020a05600c1c2100b00407612b91fbmr6720884wms.30.1699948704783;
        Mon, 13 Nov 2023 23:58:24 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id r18-20020a05600c35d200b0040a487758dcsm10551547wmq.6.2023.11.13.23.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 23:58:24 -0800 (PST)
Message-ID: <b7646614-8f5c-4ea6-9ea8-ff81f4a492c9@linaro.org>
Date: Tue, 14 Nov 2023 08:58:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 04/10] hw/xen: Factor xen_arch_align_ioreq_data()
 out of handle_ioreq()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <f791a822-f6f5-44fa-904b-f67d3f193763@email.android.com>
 <7a66c289-19e1-4690-8c6e-31a9f6344b6f@linaro.org>
 <e892e4eee469b1d1406dcd0844af48d1aaff23ae.camel@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <e892e4eee469b1d1406dcd0844af48d1aaff23ae.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: scUGwaUTPMcH

On 13/11/23 18:11, David Woodhouse wrote:
> On Mon, 2023-11-13 at 17:09 +0100, Philippe Mathieu-Daudé wrote:
>> On 13/11/23 16:58, Woodhouse, David wrote:
>>> On 13 Nov 2023 10:22, Philippe Mathieu-Daudé <philmd@linaro.org>
>>> wrote:
>>>
>>>      Per commit f17068c1c7 ("xen-hvm: reorganize xen-hvm and move
>>> common
>>>      function to xen-hvm-common"), handle_ioreq() is expected to be
>>>      target-agnostic. However it uses 'target_ulong', which is a
>>> target
>>>      specific definition.
>>>
>>>      In order to compile this file once for all targets, factor the
>>>      target-specific code out of handle_ioreq() as a per-target
>>> handler
>>>      called xen_arch_align_ioreq_data().
>>>
>>>      Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>      ---
>>>      Should we have a 'unsigned qemu_target_long_bits();' helper
>>>      such qemu_target_page_foo() API and target_words_bigendian()?
>>>
>>>
>>> It can be more fun than that though. What about
>>> qemu_target_alignof_uint64() for example, which differs between
>>> i386 and
>>> x86_64 and causes even structs with *explicitly* sized fields to
>>> differ
>>> because of padding.
>>>
>>> I'd *love* to see this series as a step towards my fantasy of being
>>> able
>>> to support Xen under TCG. After all, without that what's the point
>>> in
>>> being target-agnostic?
>>
>> Another win is we are building all these files once instead of one
>> for
>> each i386/x86_64/aarch64 targets, so we save CI time and Amazon
>> trees.
>>
>>> However, I am mildly concerned that some of these files are
>>> accidentally
>>> using the host ELF ABI, perhaps with explicit management of 32-bit
>>> compatibility, and the target-agnosticity is purely an illusion?
>>>
>>> See the "protocol" handling and the three ABIs for the ring in
>>> xen-block, for example.
>>
>> If so I'd expect build failures or violent runtime assertions.
> 
> Heh, mostly the guest just crashes in the cases I've seen so far.
> 
> See commit a1c1082908d ("hw/xen: use correct default protocol for xen-
> block on x86").
> 
>> Reviewing quickly hw/block/dataplane/xen-block.c, this code doesn't
>> seem target specific at all IMHO. Otherwise I'd really expect it to
>> fail compiling. But I don't know much about Xen, so I'll let block &
>> xen experts to have a look.
> 
> Where it checks dataplane->protocol and does different things for
> BLKIF_PROTOCOL_NATIVE/BLKIF_PROTOCOL_X86_32/BLKIF_PROTOCOL_X86_64, the
> *structures* it uses are intended to be using the correct ABI. I think
> the structs for BLKIF_PROTOCOL_NATIVE may actually be *different*
> according to the target, in theory?

OK I see what you mean, blkif_back_rings_t union in hw/block/xen_blkif.h

These structures shouldn't differ between targets, this is the point of
an ABI :) And if they were, they wouldn't compile as target agnostic.

> I don't know that they are *correct* right now, if the host is
> different from the target. But that's just a bug (that only matters if
> we ever want to support Xen-compatible guests using TCG).
> 
>>> Can we be explicit about what's expected to work here and what's
>>> not in scope?
>>
>> What do you mean? Everything is expected to work like without this
>> series applied :)
> 
> I think that if we ever do support Xen-compatible guests using TCG,
> we'll have to fix that bug and use the right target-specific
> structures... and then perhaps we'll want the affected files to
> actually become target-specfic again?
> 
> I think this series makes it look like target-agnostic support *should*
> work... but it doesn't really?

For testing we have:

aarch64: tests/avocado/boot_xen.py
x86_64: tests/avocado/kvm_xen_guest.py

No combination with i386 is tested,
Xen within aarch64 KVM is not tested (not sure it works).
