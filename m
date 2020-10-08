Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1528015lfq;
        Thu, 8 Oct 2020 10:13:39 -0700 (PDT)
X-Received: by 2002:a9d:6d95:: with SMTP id x21mr6070463otp.339.1602177219705;
        Thu, 08 Oct 2020 10:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602177219; cv=none;
        d=google.com; s=arc-20160816;
        b=tqeJ6mrB2W9Cpd9w6bqpW9Hyuodo+YJxKJbcJI0MDF5joYV6hjznKxzALcLilbJGeO
         ZWH5UZEX6YJPMnw7lRGEAjM0vDuMVh3/ISXK7yVtWBFdFksjNMK3SMw4HkGLqGWTTzfI
         qQsWNmYeJTK55yHEb3ezx3kpRjBRmoax5TvPnmAikZnpcbQmrMnMeg9ccH2Cx//efkKs
         sult3gfPREslMFgA0eCTyaOg1J+WPRht3cL9xeLnDZYvvulSzNy9I/i59uYshsg18Hh6
         81fU/rmva53OHaizS1RWqQknuRo4mD8pZPZyvLUM9Ty0RVHGHAs9vaL2XGt/uAMVnlly
         DejQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=z7dfDSuvx/c2gFB94Jskoi+PPftvQcHJk13W3TDs7HA=;
        b=k/8uMsi8Tl7Khre1vnpde+LfCTHqot+SFaNhY2klxmaVgX3yZMyOb3PNKVtCv0bZXQ
         fiIqykQZ1/SmAcTMqh2pd8lPZYjkZhWqedyo+2p4Nw12Ebrxx9C/bK10+ztFf3yTsG45
         I3B5UaAtm2cO8pT9WgBlaVFXRIAAhv2yGvMoU6r14zh47Ct24oE3GCzC1bwU5kEHMECu
         1aLxJfSuaXs4DSGkPrg4/x60m+0pTWGd6LFTzvT6Lrg/MfczJrwAUG3pIy4bhOsroN7u
         wM3KUEaXz8QiXsuEQ9/NSB5FZEJTxtDRJbdvGm3gFVi3PeyiKoAXrKt5tBXpmlnIPU6e
         9NWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fLsPK3OI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p18sor2712481oop.18.2020.10.08.10.13.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Oct 2020 10:13:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fLsPK3OI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z7dfDSuvx/c2gFB94Jskoi+PPftvQcHJk13W3TDs7HA=;
        b=fLsPK3OILvGhk7im1x2o5bdc8tXDQvH1bCEqV3l4EW7XPkhEKogzgt3D4i0ZZ5HSZN
         mwUIlcxOJyHTR+K9lkvLCcXLQd+tUypReqGwqTnD77p6x6WWi40UVztondK8BT8HVWwo
         +3/WBBgeYrUBe8ULWbrFBvalmSgfK+AcioxvCmtLPS67j8jceTLHmhhcGKKhVopJnKII
         Mk8fgwzLeG2La445MjLIVOlYFN4rk5Po2TsVmN844/yQra5/VThi+EXNeLTQnLKc1nIm
         XHd3NGsdLvFbq95eZ0OI6Goo5N35dBtviUeDPPGiyjl9nHg6jDknGQxcQH1v5/bmnCAa
         W8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z7dfDSuvx/c2gFB94Jskoi+PPftvQcHJk13W3TDs7HA=;
        b=EgRaC3nhdyd/LvdcfD0FJ7YvStHcy03DVLzFNqqKeiw/bcG1Eilq9r3Tyr3L/z3mo4
         69xqhbFdzhj+aHRj32Xb6Y7pJfb6lXihOtkgmvdp7vzT5hM5nFVRQM3G0IWbTPYrByts
         3nMQjqHidRj579l5JVQoHCuNb08UtgjoktKvaREu3bOE/7kQy1LChPRvKWFwtP1B9Xa4
         mfPcgqEiSe9zxWYktT39tOAmaQwf2BOmT89GUCxdi6fjbRiCyvwpRZdbYOJHdJFIqyp5
         PqdCCLijd4DOSMR4PLbivpAIdStKSHwzFn1i5uV51eDoaWjRH4PeyNncnyC/QhWw5gTH
         0ICQ==
X-Gm-Message-State: AOAM530sYIwNmTaKB7Lq7X4dgum1xzy0YAag0n3AylUuFDrETTKc7Vga
	BdA8TnROJT9lyKwMg8dbmu+lXhLz
X-Google-Smtp-Source: ABdhPJy1tMoisx+o78loeTz29fHJMnNH/XiQ9NxsSEWMCBqtVGD6pi+8cib8HUDgbmAjH+EEI8Pj9g==
X-Received: by 2002:a4a:3b91:: with SMTP id s139mr6121043oos.34.1602177219165;
        Thu, 08 Oct 2020 10:13:39 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx. [189.204.159.168])
        by smtp.gmail.com with ESMTPSA id j1sm5136690oii.5.2020.10.08.10.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2020 10:13:38 -0700 (PDT)
Subject: Re: [PATCH v10 7/8] linux-user/elfload: Parse NT_GNU_PROPERTY_TYPE_0
 notes
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
References: <20201002215955.254866-1-richard.henderson@linaro.org>
 <20201002215955.254866-8-richard.henderson@linaro.org>
 <CAFEAcA8jBAKe_tWAKzAXq4LFO5vk1H8AZN+s+3oWsLfoRugQdQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8ac9575b-4a2b-aa8a-3279-8ead52402d59@linaro.org>
Date: Thu, 8 Oct 2020 12:13:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8jBAKe_tWAKzAXq4LFO5vk1H8AZN+s+3oWsLfoRugQdQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 0JMoFOFaE51s

On 10/8/20 9:02 AM, Peter Maydell wrote:
>> +            if (note[0] != 4 ||                       /* namesz */
>> +                note[1] < 12 ||                       /* descsz */
>> +                note[2] != NT_GNU_PROPERTY_TYPE_0 ||  /* type */
>> +                note[3] != gnu0_magic) {              /* name */
> 
> note[2] and note[3] are both basically magic numbers, AIUI.
> Why do we have a #define for one but we assemble the other
> with a const_le32() expression ?

Because one is defined as a number, and the other is defined as a string.  And
why *that* is, I don't know.  Silliness, perhaps.

> The spec for the .note.gnu.property section (which AIUI is
> https://raw.githubusercontent.com/wiki/hjl-tools/linux-abi/linux-abi-draft.pdf
> ) says that the n_desc (words 4 and up) is an array of program
> properties. There doesn't seem to be any guarantee that there
> is only one entry or that the FEATURE_1_AND entry is the first
> in the list. Don't we need to iterate through the array to find
> matches? This seems to be how the kernel does it:
>  https://elixir.bootlin.com/linux/latest/source/fs/binfmt_elf.c#L786

Hmm.  I missed that change since the first time I looked at the in-flight patch
set.

> (Is it worth adding the infrastructure to parse notes generically
> the way the kernel has? I dunno if we think it's likely we'll
> want to do this for more note types and/or other architectures
> in future, so it might just be pointless complexity.)

I dunno about that either.  I'm not really sure what "generically" would look
like without another exemplar.  I'll look at what else
arch_parse_elf_property() is being used for.


r~
