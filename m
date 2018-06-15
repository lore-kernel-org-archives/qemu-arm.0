Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1024696wrq;
        Fri, 15 Jun 2018 09:07:32 -0700 (PDT)
X-Received: by 2002:a9d:2dc9:: with SMTP id g67-v6mr1328817otb.212.1529078851894;
        Fri, 15 Jun 2018 09:07:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529078851; cv=none;
        d=google.com; s=arc-20160816;
        b=dH73sqXc1QAVa8BuP+x2oKlaSIAW3W//SmYcixsltXfhykxfdL4n5DsdJG8TFFJ+Ek
         qIIApsbikJe3Th4fx/hAmPPkVM/sEMr1wDxA9VpCYL76xDTML66jYfyoww39u9E4oxrs
         tvvaeXoeeqtW+kFf4gLv2yQ/JPA6sRkNZ+Q/2d3TMX9s73YWrlL45YrF7AsVJMe6n+u5
         N5u2xDBjmd60dPbbzTaugKci5oTR557x+XsGdRgXCfDfw/qTZ/lARdCJbD7F3rsPrie+
         a/fWm5DTZfnd/C64FcsM8zhORLRN18hPJ8NFjXyDl85Wfj0K262fcyd8+fSzYajG1bta
         XBkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=5tOcwpj8eQuSkNVCV/azRRf4u/femrHDUYA6qOwxCi8=;
        b=1ApPMpW7mDBEmr1gPuMTf6rcV8ZIYFTEvhFHcim8g4PyEFK+aCG2q/DLKE0lgSQL9a
         V9+4D0grfHbgw3hq3iX98M41e2RB/NZ7MR/acxN9YjqkmsPGPNHw+8SgfHAI1scjFc5N
         nxUdDMXKtn96H9NHuHTV87L719v1VdnDXPDNndfu/3qa1Tws8BPOuZYGB6qrPC2sMTYB
         PSL7n48dESHKQWlFF8DjdWotTwC6eSbJHOj6bfI/vGwjD0UpaJ09/uOim1PzKL6+gtnY
         wkeLMPEoIwAEugHapnthSi4QHKAzahrmvza3RS8V9zfCeIJfUo8A2OqTp0SKFIRnZyMU
         LDoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tm0q7trN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z7-v6sor3318975otk.275.2018.06.15.09.07.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Jun 2018 09:07:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tm0q7trN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=5tOcwpj8eQuSkNVCV/azRRf4u/femrHDUYA6qOwxCi8=;
        b=Tm0q7trNk99fecaxwnhcxNT5H1SpUCayy+tlZYBDbcB1Djq7ff1cG9+xbvT4iU3lSc
         OEsqhxV8cAdHACL63fsp84q6MCe7izY7bFkfZBUrsbYbarzH3RVmL7HpMm9YB1j86WWm
         ppFzLTINeX/1dP3FyRoYXhN1NLr83hMxYbqIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=5tOcwpj8eQuSkNVCV/azRRf4u/femrHDUYA6qOwxCi8=;
        b=I6X4Fyl7T6XYb3IzowK6kLLO/7BxQAX02qEWhxgJT+UzfFDIXYv8WE+p7GM82rAGtu
         ZBKj57k2bJtMbJhZGwNqdtnwIjbkXWObFAyFWPGbKlWjeDBjR2K6bOUcOtfK93X09PX5
         nAUum72CVWGv4lOKnNeBnEM2PwbmoHT+cuUYFEv4u/iEuQh+vmfORJRGrgEiP24zW/Yt
         iXI6F4tbGRnxKsbsWQENlON+kkqa0FE5eqirZOLn6JfL5Uq9ImrKkbsgjc3HKrCmNPZV
         MDWfUMBcN6aDouVVT9ITWt+pseywyEAIv/5CBXWBQ6SywCpglJR8CTd9YC7hpdgtD3je
         ktJw==
X-Gm-Message-State: APt69E0rATWIWbaOZZ+chGzWj7fhw7bof8da9zKWOpac7lHK39VumoyY
	Ir9WrvkT15PTsRK+Qywu8nQMujnpWBqYpGpLXWA1CR/sBW4=
X-Google-Smtp-Source: ADUXVKLaaOjbIXKFTkyRm8IwSWDLgw0LLm3akFH3jYX1zl6akUBrWfZve+Z5wlFfrizV7EU2K760wlIsvvuU/11TcOo=
X-Received: by 2002:a9d:1a0b:: with SMTP id a11-v6mr1286710ote.205.1529078851451;
 Fri, 15 Jun 2018 09:07:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 09:07:11
 -0700 (PDT)
In-Reply-To: <64ff124d-fe34-75eb-e9e6-7c419827ee3c@redhat.com>
References: <20180604152941.20374-1-peter.maydell@linaro.org>
 <20180604152941.20374-9-peter.maydell@linaro.org> <64ff124d-fe34-75eb-e9e6-7c419827ee3c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jun 2018 17:07:11 +0100
Message-ID: <CAFEAcA8ioVZuB61XWQKKRyGAJxn1gge4fjbrQuK21-drh6y81Q@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 08/13] hw/misc/tz_mpc.c: Honour the
 BLK_LUT settings in translate
To: Auger Eric <eric.auger@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Peter Xu <peterx@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-TUID: XEeQjZqVXtwi

On 15 June 2018 at 08:31, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
>
> On 06/04/2018 05:29 PM, Peter Maydell wrote:
>> The final part of the Memory Protection Controller we need to
>> implement is actually using the BLK_LUT data programmed by the
>> guest to determine whether to block the transaction or not.
>>
>> Since this means we now change transaction mappings when
>> the guest writes to BLK_LUT, we must also call the IOMMU
>> notifiers at that point.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

>> +        if (newlut & (1 << i)) {
> Add a comment saying the block is configured as non-secure?

Sure.

>> +            entry.target_as = &s->blocked_io_as;
>> +        } else {
>> +            entry.target_as = &s->downstream_as;
> so this disallows any secure access to non secure blocks. I have a
> reduced knowledge of TZ but I would have thought that a secure access
> would have sufficient priviledge to access NS memory?

The spec is not as clear as it could be on this point, but...

>> @@ -362,9 +407,10 @@ static IOMMUTLBEntry tz_mpc_translate(IOMMUMemoryRegion *iommu,
>>      /* Look at the per-block configuration for this address, and
>>       * return a TLB entry directing the transaction at either
>>       * downstream_as or blocked_io_as, as appropriate.
>> -     * For the moment, always permit accesses.
>> +     * If the LUT cfg_ns bit is 1, only non-secure transactions
>> +     * may pass. If the bit is 0, only secure transactions may pass.
>>       */

...as this comment says, the MPC doesn't permit wrong-secure-state
transactions either way. (This is the same behaviour as for the
Peripheral Protection Controller, whose spec is clearer.)

thanks
-- PMM
