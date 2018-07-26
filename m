Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp326031wru;
        Thu, 26 Jul 2018 05:43:36 -0700 (PDT)
X-Received: by 2002:aca:ad86:: with SMTP id w128-v6mr1962062oie.112.1532609016434;
        Thu, 26 Jul 2018 05:43:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532609016; cv=none;
        d=google.com; s=arc-20160816;
        b=G63ZMb88eqTmCcWa4ZjFoKwxvzMRgrJ4fHAeoqT+aoBCcuAfDyvHfJlIRpKns6TQ3I
         myKKvATAMnKQrVxNOxcDgdL46bVQVRwcXUke/6OkMAOwfpyKcSrNVUqzkv20OqQXkJ8R
         yYiOPnnxbspuxjNHA3AkWa8o1IYo7ChJYBb4HemN7+cwV61N4+JVmAWpe3op+2CTQRMI
         3x0bemksMNOKUgI/kOVi4sHrcS8Xv92fP9r39zuVuynJpoqQQL2QFkCW9okiPQF1PdOx
         rY6SlZWNB2SoyL1M0YMfBJ7Mevx06E5sBMJhEZ3lVi0ZDNUDd4noLRqNDTTTe733gRvP
         50EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=wNJDpsjzZ79cKnG0N9U7ye7GgFneAt6OBQhdAe5VDlA=;
        b=DtTWivPIWogGppTD71SwKPAlvqS3014eA+Olau+F/ViL7ZN32At8QTHQ+a2XL8a8vg
         o25AeJL+jsvwQr/ZDeUA8Hu5Lf87y38eLWVkQvZZnlsaHXMZe0smXoXU5XXCPsPcYI92
         0rFPLJJJq5B81UhNjRy1dA8pT/H/5BB6Wov7QozifXOXcfOqwpdm0/kZUcjWU0VmRJn0
         xkqqaB951LgCEXpgU7blkzlHxXSF+Nfdq10W8kvDveUPcUOtnWfYNfaCzQnCYpD6llJ+
         TGG8cw+1DfwcI2RZMCt/CrKY20rugnE8NX5WSH3fFi5Kl35X+KvYGVzjy1dRrFv50Sxo
         jVmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LNx9wQPA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 9-v6sor697704oid.23.2018.07.26.05.43.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Jul 2018 05:43:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LNx9wQPA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=wNJDpsjzZ79cKnG0N9U7ye7GgFneAt6OBQhdAe5VDlA=;
        b=LNx9wQPA3zI4kBCHEcI+yeFVOtv9oNlnGCj4oejtOQP64YgFKgz1s/yDKDNMJLaRTK
         Lvh1DqUATYlntaLJ1fPLk4YInS9YiYf23BDH2P9wgOsbdYCjJoHaji19ZjikiZa53KbA
         3SEON21z+zQ7RedADaJjhgNf83dUBJcLMuuZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=wNJDpsjzZ79cKnG0N9U7ye7GgFneAt6OBQhdAe5VDlA=;
        b=j5g2YezLj8suuK6TYlEDyqVKtdiPcQx4V14wdNXjeqoDbZoHP28hJMKz9fiuNTxUH1
         4LXAs8dynRnQRSBxTQcMV1tYGNrkEV/bEOcIjSx/ql+iVfg+3EHoULJsVEqdF1DO5eay
         WzX0mXLYt49QeXBvQR3O0K06az6vWkg/Y2lPUvYDbO7vl6jS3oN48RIeqWYC3JNIuzuy
         8PNqCwPhz0qSOQrmCT0UV4wDT+HJ3WpsqIVMdbou8UkOu7onyN5ge1ObbM6Qv36sjx4S
         pFECEw4f5N+d85gTa4DK8HTe7AfTLqrwZk2UEHoYFkZypNtGYhRygjWKsMI1utQVWzfP
         wjOw==
X-Gm-Message-State: AOUpUlF0CT+zfSUP0PzurdVHLzdGBwjtzjcxIlMuLAzhP9EQjD8/thJx
	zrQ4Jh9IWG7xpEFVDHcGu77qxBK39JJOJKmXxl0dD4+b83xnLw==
X-Google-Smtp-Source: AAOMgpc6WiJAjZPbqjZEQCI6bKkOkXUEZspnwntMeo7iArTjDSPmiqDX1zcavbBrGHrxAlxmh9+3LbnZP+v8nK82znM=
X-Received: by 2002:aca:f5d1:: with SMTP id t200-v6mr1848982oih.12.1532609015946;
 Thu, 26 Jul 2018 05:43:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 05:43:15
 -0700 (PDT)
In-Reply-To: <20180726123509.qyadwbz4skwashcj@kamzik.brq.redhat.com>
References: <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <CAHmQWvCKkzim+-Z4Y69fWg6igZ7V6gaWhjKJZ0m0G0dhbwOFyw@mail.gmail.com>
 <20180725112621.imdzdkntpmh3n5og@kamzik.brq.redhat.com> <CAHmQWvCfHFSU7RGKG5t6=m7ZSWZjf3TeqOo3cX2KT-GSiN3mPw@mail.gmail.com>
 <20180726102855.x6ffdoqjpejpyae7@kamzik.brq.redhat.com> <CAKv+Gu-ffZRNmACH6YieNsg=AHxJxYoXHsBGf6C=nOvFfTu7Sg@mail.gmail.com>
 <20180726111109.w24jk6ehklimige7@kamzik.brq.redhat.com> <CAKv+Gu80KfwZft4t1HtOXPuijuPLV80K9iW+BsTgs7WcnosMXA@mail.gmail.com>
 <20180726114158.am7kgc3jekxg55i5@kamzik.brq.redhat.com> <CAFEAcA8YH4p__zT1o0s3vNZOsyWZn3XPLgkNeT+jSJpmjvFTUw@mail.gmail.com>
 <20180726123509.qyadwbz4skwashcj@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Jul 2018 13:43:15 +0100
Message-ID: <CAFEAcA-Zv5xV2VwMCfGXUv8oT+gC_dgn8Q3M1v3FBjry7TbXVA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Andrew Jones <drjones@redhat.com>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: oJ0a/mUboELm

On 26 July 2018 at 13:35, Andrew Jones <drjones@redhat.com> wrote:
> On Thu, Jul 26, 2018 at 01:10:34PM +0100, Peter Maydell wrote:
>> On 26 July 2018 at 12:41, Andrew Jones <drjones@redhat.com> wrote:
>> > The patch guards the generation. It'll only modify DT and ACPI for the
>> > new machine type. But, while modifying the DT makes sense, as that
>> > generated DT will get consumed
>>
>> ...will it? Why would we want the firmware to read the
>> QEMU-generated DT? Real hardware doesn't work that way.
>>
>
> Good point. If the plan for this reference software is to always
> prepare its own DTB and ACPI tables, then this patch shouldn't
> touch the DT generation either. Of course a lot of the device
> and fdt node creation is intertwined in mach-virt, so it's going
> to create a DTB anyway.

I haven't yet looked at this patch so I might change my mind
once I've had time to look at the code, but my initial
thought is to prefer it to be in its own file rather than
trying to share code with the virt board. There's a lot
of stuff 'virt' needs that this doesn't (DT generation,
ACPI generation, switches to disable virtualization or
trustzone support, options to select GICv2, etc etc).

Q: is this new board model intended to be able to work
under KVM, or is that out of scope? (You wouldn't be able
to run guest EL3 firmware under KVM, certainly.)

thanks
-- PMM
