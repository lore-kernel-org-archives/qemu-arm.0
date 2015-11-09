Received: by 10.182.105.169 with SMTP id gn9csp1084774obb;
        Mon, 9 Nov 2015 02:50:02 -0800 (PST)
X-Received: by 10.13.246.70 with SMTP id g67mr25717759ywf.116.1447066201813;
        Mon, 09 Nov 2015 02:50:01 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-yk0-x22b.google.com (mail-yk0-x22b.google.com. [2607:f8b0:4002:c07::22b])
        by mx.google.com with ESMTPS id q200si7138264ywg.206.2015.11.09.02.50.01
        for <alex.bennee@linaro.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2015 02:50:01 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c07::22b as permitted sender) client-ip=2607:f8b0:4002:c07::22b;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c07::22b as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro_org.20150623.gappssmtp.com
Received: by ykek133 with SMTP id k133so257537234yke.2
        for <alex.bennee@linaro.org>; Mon, 09 Nov 2015 02:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro_org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=muO5vN7mnx3Yfq7aGYHECqk20mdvly0cXKeek9wDR7A=;
        b=dq2LWyxC7c1wjgu4MfZimjv8Jb1ndATDWe3hNrqjRwc3nEhvUtgfISlKHVyqfStFH1
         PlQQIyO5ofrDrsQJrgb8DNztnw26cDD9cP79FnDq7nQdJFJuDfzv2I21ITzYb0c8UsxJ
         j3k+L/tdrZuZ53QAYtDhHi47pAbfOn1ZRMT9i9ZjfUG9heya2VktWIf/cos7dRnOYNYw
         kydvnz0zOu/rmiG6/q2OtXm8rt0h1eNFPoXh2k2fqyFgCKX58MYtT8qi8JcfUYwPsQBi
         jBw+jmLmHiU2k5eKeABTsvsabdEdroPY9qJ3Hgjyj7M7FMGuq3Vj4DmmC6Ks+mFoTrvX
         z/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=muO5vN7mnx3Yfq7aGYHECqk20mdvly0cXKeek9wDR7A=;
        b=l7lemX5FSeMWSed61vzSdz9bnFB2j+HPGa9WyzoXhrW05jpeDkSfOYYeiq+gZ2x9Zi
         LwRPkgmId2f3hwlzzObbzQuZBhEL9jrwP9r3kTSJjmK+sUyejZz7lWrrjrVHXqleVers
         7+CjkA0UrPhmmCCvIDASXJzEg0xTEpZFX1uWlkbu8L6OLXqhEb6vF8M3qn31CtdYtgP4
         QRuLnUOko9NHrusMWFuA+Q+NG49zrWnD7sC4b5H133PILVaBpau4a58bkd8+2QVmggs8
         54W/fhNnAj7x5/XY9vRYraQV0vFRni3LoumpwcQ4wekYPd2Uqxh1PSR4kTkInjHGnpMU
         nGog==
X-Gm-Message-State: ALoCoQnYt2vrA8vHIdbzuXKWZ7kczkSsM2Cqe/F8Q/TmiuvM08tz1COsKBmzRXpkkiOhUa5sc8KK
X-Received: by 10.129.17.214 with SMTP id 205mr26080885ywr.284.1447066201575;
 Mon, 09 Nov 2015 02:50:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 9 Nov 2015 02:49:42 -0800 (PST)
In-Reply-To: <56407909.2080607@redhat.com>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-4-git-send-email-peter.maydell@linaro.org> <56407909.2080607@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Nov 2015 10:49:42 +0000
Message-ID: <CAFEAcA90=U_RTmEtVOeHEmptEQwXc40RcV-kVJQ_88z8MYqwfw@mail.gmail.com>
Subject: Re: [PATCH 03/16] tlb_set_page_with_attrs: Take argument specifying
 AddressSpace to use
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	qemu-arm@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-TUID: E4LPnKX83TL/

On 9 November 2015 at 10:44, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 05/11/2015 19:15, Peter Maydell wrote:
>> Add an argument to tlb_set_page_with_attrs which allows the target CPU code
>> to tell the core code which AddressSpace to use.
>>
>> The AddressSpace is specified by the index into the array of ASes which
>> were registered with cpu_address_space_init().
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Can it be deduced from the attributes instead?  Basically, you would have
>
>    int cpu_get_asidx(MemTxAttrs attrs);
>
> in cpu.h, which is called by tlb_set_page_with_attrs.
> cpu_get_phys_page_asidx_debug could also be replaced by
> cpu_get_phys_page_attrs_debug.

For ARM it could, certainly (and as you say, if we go that
way then some of the extra passing around of asidxes collapses,
and in particular we don't need to keep them separately in the
iotlb entries). I wasn't convinced that this would be true for
all possible uses of AddressSpaces.

thanks
-- PMM
