Received: by 10.182.105.169 with SMTP id gn9csp1068831obb;
        Fri, 6 Nov 2015 05:35:04 -0800 (PST)
X-Received: by 10.31.134.193 with SMTP id i184mr12860449vkd.64.1446816904216;
        Fri, 06 Nov 2015 05:35:04 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22a.google.com (mail-vk0-x22a.google.com. [2607:f8b0:400c:c05::22a])
        by mx.google.com with ESMTPS id k16si178654vki.10.2015.11.06.05.35.04
        for <alex.bennee@linaro.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2015 05:35:04 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22a as permitted sender) client-ip=2607:f8b0:400c:c05::22a;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22a as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro_org.20150623.gappssmtp.com
Received: by vkfw189 with SMTP id w189so13950674vkf.2
        for <alex.bennee@linaro.org>; Fri, 06 Nov 2015 05:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro_org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=yWHcuVMOquKvFAYiajxR5QYpLc8iWHE47OvQrdZD8xA=;
        b=D3nnSuYuCvnOl/eff9T494swAYJ/kyL5gEeqtj5KoOtnWBMXucQXilpqZhGxn922Iq
         ME40aJlgkjByjuW0KpTgdXGgSyhgfPMDIyW4/z0z4EVKklEJOBAQiOEJC+fqnsWsz1Bk
         hF9Jo5nwEnI25fffzvj6xOiDXWDi2R8CefkjYsF1gb6dHIGKMgGumsdJeOokTk6+On2B
         YKuS8YPxuoQ7MRbgjnlbZFUQGyjZeF4WhzvwO9V0gPRkmoAmBVDk0sg5nWXgMO530InY
         IitgaO29rR2jIc2c1uAXXiwgXIIp4sx5hBpR/HKgydCACkY1uEOIIweYPv70Q74F86r6
         lr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=yWHcuVMOquKvFAYiajxR5QYpLc8iWHE47OvQrdZD8xA=;
        b=YUQrrrsI2N0GN95HSrgMfWS6mmB2GOgSB2QkCMC7QzKSusQiUs1i/n8TWW6Rqr1cWt
         fAEZazXPmTuD/d77Z06XsvhJxfjyZUSCIWAHlBlY0+YkycuL6eqj64cYpjA3W/SAndEh
         d3oeWzidKsZycXeA72YLJbF1v++lextZhZ8QaybTCg17dwgGOCec+Fx3wUHSjgLIAD5i
         rOm0x/N2hI7Mgx/rxbpbcM7QOkgP7dj5EqdjJ3OUSObkx3hZky7IVwBuagMv1NzVrXTx
         MK4Fwc4Q/C5z3vN6KPywx4Qp5kyJYGAiK/7oVtMfSVqZbYvaEgKM4B4osiK2eCYJyN/y
         pZ/A==
X-Gm-Message-State: ALoCoQm+0ywMSeCj6npRjFyZR2oE4qgOWdfub54u2BuXhwW0C2IXBsEL8L4Ti62DQOI3HG9xu6Xn
X-Received: by 10.31.56.198 with SMTP id f189mr9026154vka.83.1446816904000;
 Fri, 06 Nov 2015 05:35:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 6 Nov 2015 05:34:44 -0800 (PST)
In-Reply-To: <20151106132115.GB13308@toto>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-3-git-send-email-peter.maydell@linaro.org> <20151106132115.GB13308@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2015 13:34:44 +0000
Message-ID: <CAFEAcA8Oh3s9JiMAFFQb6P_C3UyS3MqxrmAz0ASm4FJnbemp7Q@mail.gmail.com>
Subject: Re: [PATCH 02/16] exec.c: Allow target CPUs to define multiple AddressSpaces
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	qemu-arm@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-TUID: VQK4lpVNwgGY

On 6 November 2015 at 13:21, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> On Thu, Nov 05, 2015 at 06:15:44PM +0000, Peter Maydell wrote:
>> Allow multiple calls to cpu_address_space_init(); each
>> call adds an entry to the cpu->ases array at the specified
>> index. It is up to the target-specific CPU code to actually use
>> these extra address spaces.
>>
>> Since this multiple AddressSpace support won't work with
>> KVM, add an assertion to avoid confusing failures.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

>> +    if (asidx >= cpu->num_ases) {
>> +        if (cpu->num_ases == 0) {
>> +            cpu->cpu_ases = g_new(CPUAddressSpace, asidx + 1);
>> +        } else {
>> +            cpu->cpu_ases = g_renew(CPUAddressSpace, cpu->cpu_ases, asidx + 1);
>
> IIUC, g_renew may move the entire cpu_ases area. The internals of
> memory_listener_register (called below) seem to put away the pointers to listeners
> so a renew+move would leave invalid pointers to listeners in memory.c wouldn't it?
>
> There are various ways of solving this, (e.g dynamic allocation of the listener,
> static allocation of the cpu_ases, invalidate all listeners and restore them after
> each as init and more). I'm sure you'll figure something out.

Oops, yes, you're right.

Maybe we should just have the target CPU say in advance what the
maximum number of AddressSpaces it will have is -- my expectation
is that this will be (a) small (b) known in advance anyway.

thanks
-- PMM
