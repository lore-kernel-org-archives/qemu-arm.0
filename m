Received: by 10.182.105.169 with SMTP id gn9csp1087763obb;
        Mon, 9 Nov 2015 02:58:25 -0800 (PST)
X-Received: by 10.13.238.132 with SMTP id x126mr21970271ywe.221.1447066705378;
        Mon, 09 Nov 2015 02:58:25 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-yk0-x22b.google.com (mail-yk0-x22b.google.com. [2607:f8b0:4002:c07::22b])
        by mx.google.com with ESMTPS id q200si7152934ywg.206.2015.11.09.02.58.25
        for <alex.bennee@linaro.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2015 02:58:25 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c07::22b as permitted sender) client-ip=2607:f8b0:4002:c07::22b;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c07::22b as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro_org.20150623.gappssmtp.com
Received: by ykba4 with SMTP id a4so257512573ykb.3
        for <alex.bennee@linaro.org>; Mon, 09 Nov 2015 02:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro_org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=M1K0NPtLjAQDz7Qx7ks/kjUZea1APD2pEkqv6Yj/jxk=;
        b=aXa4VB+NQemiXWuv6vpPgPKcPZqCh+vqRAzkeHEts4pwf+hqW4S1z9PgEoeMRXWhq0
         c+gPMZ14ETxiQpKRem82eD3QIM5FJART0wKCSf52I/i/Ug7513t0LTv3OtgJdY1M6R0+
         d/CrXD0g5CU4rzwo1r9D68OegwLmg+BTiTkyq6TyhZIiwa+hQz2ZSaWMUwU7xm2gi6b4
         9YJncMnNvZyX2mLCaLmNqDcS9KkysobwGFCRBFboQMnt7j1741yvICDDcEixzgdOvBFL
         vpVJpAGIZ+s1r49h+4j0F4006YkSaNTaf7WelNE6lP0llNLvN3N9HDAnmSWT/ZVbw6Tk
         jH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=M1K0NPtLjAQDz7Qx7ks/kjUZea1APD2pEkqv6Yj/jxk=;
        b=bSX4Qmy+WHdB5JO5YCAN1VCJ9Xscz6COoThsg1eBfmIEy3p5wjGbMilRoTXpk61VHU
         D0wCL5+E3oadwUpbCr71sD+5oJvAelBaIjqPY8oZQpgJgkQiIH7XO8sTHVTIATcQNXcZ
         nzYx7PFGv0e1CxrcPUDx2g5A/O/gYHdWRruxRFCqVdBdjsRHHztVORG4uxu3iEn5vk3j
         ysn7qqobaX6CraltKozMGTCHtT40FmmGm/ANSPWFEh52DlWNZCjOPBco/msSDwCAb3IJ
         MfmXAAbjzX0xaJJOWyrQxMicCD4c9nftAiyXSjD37bKkZ5CkOUyoEuG1WnjQgjf8XLrB
         IG5g==
X-Gm-Message-State: ALoCoQlclukzo0q4do/gXUkdpBEzVojX9SvN9rXdFdS/jXoUCZUo04ejaD3lqjqAMLTuunu/K5Nt
X-Received: by 10.129.99.9 with SMTP id x9mr22266398ywb.345.1447066705082;
 Mon, 09 Nov 2015 02:58:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 9 Nov 2015 02:58:05 -0800 (PST)
In-Reply-To: <56407AC8.9020100@redhat.com>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-10-git-send-email-peter.maydell@linaro.org> <56407AC8.9020100@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Nov 2015 10:58:05 +0000
Message-ID: <CAFEAcA9KrB0wZwQzYUmGBW2NPZWkxHFk-JUnW-XwOfbo4wbWUQ@mail.gmail.com>
Subject: Re: [PATCH 09/16] target-arm: Support multiple address spaces in page
 table walks
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	qemu-arm@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-TUID: /Pkr9v1vWDJ9

On 9 November 2015 at 10:51, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 05/11/2015 19:15, Peter Maydell wrote:
>> If we have a secure address space, use it in page table walks:
>>  * when doing the physical accesses to read descriptors,
>>    make them through the correct address space
>>  * when the final result indicates a secure access, pass the
>>    correct address space index to tlb_set_page_with_attrs()
>>
>> (The descriptor reads are the only direct physical accesses
>> made in target-arm/ for CPUs which might have TrustZone.)
>
> What is the case where you have no secure address space and you have
> TrustZone?  KVM doesn't have TrustZone, so it should never be in a
> secure regime, should it?

You mean "what is the case where is_secure but cpu->num_ases == 1" ?
That happens if you have a TrustZone CPU but the board has only
connected up one address space, because there is no difference
in the view from Secure and NonSecure. (vexpress is like this
in hardware, and most of our board models for TZ CPUS are like
that now even if the real h/w makes a distinction.)

I could have handled that by making the CPU init code always
register two ASes (using the same one twice if the board code
only passes one or using system_address_space twice if the
board code doesn't pass one at all), but that seemed a bit wasteful.

thanks
-- PMM
