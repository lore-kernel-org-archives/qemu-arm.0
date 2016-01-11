Received: by 10.25.134.130 with SMTP id i124csp2018147lfd;
        Mon, 11 Jan 2016 07:05:15 -0800 (PST)
X-Received: by 10.31.3.169 with SMTP id f41mr1420081vki.114.1452524715688;
        Mon, 11 Jan 2016 07:05:15 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22b.google.com (mail-vk0-x22b.google.com. [2607:f8b0:400c:c05::22b])
        by mx.google.com with ESMTPS id g207si98320706vkg.12.2016.01.11.07.05.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2016 07:05:15 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22b as permitted sender) client-ip=2607:f8b0:400c:c05::22b;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22b as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x22b.google.com with SMTP id i129so87382351vkb.0
        for <alex.bennee@linaro.org>; Mon, 11 Jan 2016 07:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=TsYiQbE79sqUWzWbzxsQMk9yUOotdb13I4UomqwrpPI=;
        b=E/aP2tKDKlWFC2NnLoqtvmox5Z+0PtqM7vQ4oAWMxReqaeC7MEhySstzIE9648U74p
         2N2BjiT0EB5WQ/PmpbDmRiHZCKyv2TQhOtEACNFni4bV30+mf5nB6k9mLtq9CSvpaqAk
         M3Fg6R0TO0dSfJBcfoHtSHtXykCNzd8QhfnyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=TsYiQbE79sqUWzWbzxsQMk9yUOotdb13I4UomqwrpPI=;
        b=ABf8FG57AqQu4kZdbbirUL0xtHzit0fUjqrEYrX0NLoqTV5PVC0h+TDAGTunjILd4A
         3hD0HvznsOenbzYPcvKE3bEaW9YRq3UVUnhRNvgr/1M2WQq/zKt7CwArM4/6NtzOCHME
         28BCtWKmTH5MxOCN+gDP+Cz4UjOexyP9+TQGU4tjsNaBh61SGi2JiwzFp6eGAM3ClBuG
         lXQUuB8KcJ6mn7wzemXUbfH7QeyWjZ3xGdpi6kTAJyz4sq/fnFdzWpna8XijVTZNWheN
         FyFD7M0vfXQlzR8KAprMX19GE6IAh+EdhyAPXJVx10Z3E+HB8SKbjJqCBN+frncooBxx
         f8vA==
X-Gm-Message-State: ALoCoQnMpl9x8vFCBf34jq7S0ndgEEfe7MN7C7W23Pxuy88xZxhrgwLVs+7VpqQ/MJNFk5lRp+HdYUn9dv99cypqJxVJJVYGycmTsEvH2YF8utT3Cuu60fI=
X-Received: by 10.31.194.21 with SMTP id s21mr88452989vkf.92.1452524715334;
 Mon, 11 Jan 2016 07:05:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 11 Jan 2016 07:04:55 -0800 (PST)
In-Reply-To: <5693C34E.1040204@redhat.com>
References: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
 <1447682723-3977-10-git-send-email-peter.maydell@linaro.org>
 <5693B259.2030106@redhat.com> <CAFEAcA_L-QiV5Wbf6SVVnbKU06TC=VZUL-9SBGkOomqvb8QvOA@mail.gmail.com>
 <5693C34E.1040204@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jan 2016 15:04:55 +0000
Message-ID: <CAFEAcA_k5crLRk6w_HwPc+JOjhYWcCGVrgF3aYLwPROMbQBG5w@mail.gmail.com>
Subject: Re: [PATCH v2 09/19] exec.c: Use cpu_get_phys_page_attrs_debug
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Patch Tracking <patches@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8
X-TUID: xnkAsZc7Qcev

On 11 January 2016 at 14:59, Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 11/01/2016 15:18, Peter Maydell wrote:
>> That's what the call to cpu_get_phys_page_attrs_debug() does:
>> it fills in the MemTxAttrs :secure and :user fields, and then
>> cpu_asidx_from_attrs() uses the returned attributes to pick
>> the right address space. (cpu_get_phys_page_attrs_debug()
>> only fills in attribute fields it knows about, which is why
>> we pass it an empty attrs struct to start with.)
>
> Oops, that's not clear from the documentation in patch 4. But if that
> was the case, shouldn't cpu_get_phys_page_attrs_debug leave *attrs
> completely alone when using the fallback?
>
> I think it's clearer if you pass uninitialized MemTxAttrs to
> cpu_get_phys_page_attrs_debug, assuming you can do it.  I can see why
> the current semantics make sense for helper.c's get_phys_addr, but I
> think they are confusing for the topmost function call.

Yes, I think you're right (and the doc comment I wrote for
cpu_get_phys_page_attrs_debug agrees ;-)).

thanks
-- PMM
