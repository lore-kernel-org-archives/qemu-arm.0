Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4585684ejb;
        Tue, 13 Dec 2022 13:38:05 -0800 (PST)
X-Received: by 2002:a17:90a:7c4d:b0:219:e9e9:ea0 with SMTP id e13-20020a17090a7c4d00b00219e9e90ea0mr21684291pjl.3.1670967485187;
        Tue, 13 Dec 2022 13:38:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670967485; cv=none;
        d=google.com; s=arc-20160816;
        b=vPPvZ6bR3r4NjvrDabk6mQ4QmpPO+zh+Y7J59YvgkmWGXb/b4GSQe8T1Sn5LXrEC0A
         EsIPItR/dBQvJ6xOkYPo5Xzfzb7XckMZCQd4Q1Hp2SAe/lNjZ4iH2A6SoEUX2OAPdpMD
         hVrErEA8DnE54/gsO5Fqrya6jEIk//3eu0o5tRYvzTWUPRsVHkSHlnhjwpjaN+x1SjTd
         Xa+y5SAcWf9xC0Sbb3uXdFrd+rLRAoTfE/AVjtUHEAJOBO7WESzFwbSlkL8G+vuU9WlT
         ENcZAovM8/REX4cpUQ1l9L/DGdPGCRSkm0iWxYyP06DIGWUMjdAiAQi6r7awT7duM3bZ
         5/kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UhzG6Cec3m6/jKF2cXCB/FDkyZ9MOe6Qh5VreeKxtes=;
        b=TUYYHl5d9uEdo9jzXpt2cp7qJE+wRwAHGKw+ddCAP5EspWisxrO/69wiJ1Qp0yfUK9
         Uf8f8JIfIU8iS3ZLJpaR+fAsZsswA15RJGUfXubrw5QoQOKGJHxGHluZKHJkteFAKEwi
         K6yFbWDFN1q1jzAMzSUVvyQbpDEFKx73MxdTpOvbiGINPzpKZtUUzzwbjFBQBzuGRe9k
         YGhAHxfGDD6nJFThOxsOxwPPYGiwi85YmkujN6eg2wPnMYPs9sBU58ZQD2tH9RpU3vN2
         zj3q+PJ2WJkZmcgDzQKvOy3uqdKSdKM+qYDjALgq36/grsYueVnDsdCYRV+atwZfllfa
         RA5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PjnJeFKD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f2-20020a17090a288200b00202cbaba46esor14374pjd.10.2022.12.13.13.38.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 Dec 2022 13:38:05 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PjnJeFKD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UhzG6Cec3m6/jKF2cXCB/FDkyZ9MOe6Qh5VreeKxtes=;
        b=PjnJeFKDOASbiw9LB5kIsNidi/jyiekKd8iQcKlELYdAypzy2P5i9Azu/Si/KzO0du
         uVTyoGfDgj8dI6TOGmuJm3BAhu9c/8hMzRSqIwQwuvcIsMYAYIle9il6jE07zacrYpye
         Lp55HFER6FkN3CWKtxi7aTj3uQyvPXZygbbOgFDBgtBTFdStf77I1Zz0HnhjEOPrXX0G
         vTL/Mx/ZfIs/0dWwnbNk9zJaY5O9bEVwHMn/vYjZH3w/KS6f9s+/1+P8uTRiQ5fH/LN9
         dPA9TR/mDvd8/ga8AK8VHdDU/ihfeELiCNQ5+0sERM1UGFhF3NfJx5v/VgepI2mqKmMO
         Etog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhzG6Cec3m6/jKF2cXCB/FDkyZ9MOe6Qh5VreeKxtes=;
        b=YTPdlvQporoN57MDNDQxC76V2E+w1wfXd0gyIYQGwHAQ+J1AAFyYzxU482bo0vuUWB
         BAq26VxyMpWClStZOecYDWmilPYD8Kb28OHuUrVVHz2yLLfFmYJ19jh3tBHzXqnEUEeJ
         e+ahNfRoOEMxtg4LtcXXspyLNyxcnvfieIOt0sqJDsgIUJcp2TrK1SdJphQp2fB1Sixv
         pUpaxfcZDfee3t24Tgll6HHdz/hNXICHVuhyhiteHREvZw0jwDCgE0neAdEaUGqQhsWE
         j3mCqxCtJMRIexyCZybKkwQ6uGyTIwEfhKWbA3VLfcGYPFAF6r15u9fR+8a4gEvuY51e
         uBeQ==
X-Gm-Message-State: ANoB5pkYBFtpzwgMgzFMUZd2BSi4Li/2s+fQkbdWP5i9XZY5uSaORsTy
	4Y85nL2X3TpaIGHqPZ/XrxrLJT2JmLg+p4vX5JzEmDR+
X-Google-Smtp-Source: AMrXdXtr2rfLDYOy9vdxqlH0+QiwA+v+PSjDCFYdWjIAbBkpVi/IN2b3N7aKAtZ2hGQ6/mgqegiYmIqdr9GAGPtG6eI=
X-Received: by 2002:a17:90a:ff13:b0:219:9874:c7d3 with SMTP id
 ce19-20020a17090aff1300b002199874c7d3mr16570pjb.221.1670967484740; Tue, 13
 Dec 2022 13:38:04 -0800 (PST)
MIME-Version: 1.0
References: <20221213125218.39868-1-philmd@linaro.org> <20221213125218.39868-2-philmd@linaro.org>
 <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org> <d73fe725-565e-7fcb-e7d3-846189459545@linaro.org>
 <a1f4b5a6-0a8a-5a04-8ab6-f3f08b9d36aa@linaro.org> <CAFEAcA_F3Z+UPW-wHs8xedYX3TiV8CRQAom0DhefKLFH_Ejgog@mail.gmail.com>
 <b46e4c40-257f-8a89-85b8-8c2806f395be@linaro.org> <10186d7a-2df0-2fcf-8eef-8e34bcc2d8cc@kaod.org>
 <CAFEAcA8WF6GXaPt6+=KbaLSP5w+r1dps6fcc21+Um3VFAPDp5A@mail.gmail.com> <e3ce4608-c516-568b-df37-8446fbe6735b@eik.bme.hu>
In-Reply-To: <e3ce4608-c516-568b-df37-8446fbe6735b@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Dec 2022 21:37:53 +0000
Message-ID: <CAFEAcA_NR4XW5DNL4nq7vnH4XRH5UWbhQCxuLyKqYk6_FCBrAA@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by const_le32()
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Richard Henderson <richard.henderson@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Alistair Francis <alistair@alistair23.me>, David Gibson <david@gibson.dropbear.id.au>, 
	Jason Wang <jasowang@redhat.com>, Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: lVh4TCIYwr9A

On Tue, 13 Dec 2022 at 18:11, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> I can't remember the details but I think I've had no tswap in sam460ex
> first but that did not work and had to add it but I've probably looked at
> other examples and did not really understand why this was needed. I tested
> on x86_64 so not matching host. The board firmware has some reference to
> this magic value in:
>
> qemu/roms/u-boot-sam460ex/arch/powerpc/lib/bootm.c::boot_jump_linux()
>
> I don't know what it does with it but I think kernel expects it in big
> endian and what we put there should match what U-Boor does (if this is
> actually used on sam460ex which I'm not sure about).

Thanks. That u-boot code uses the same value for EPAPR_MAGIC
as we do (0x45504150), and it puts it in r6 (by doing a function
call), and being native code the register will get that exact
value, not a byte-swapped version.

So to match that we should delete the tswap32() that we
currently have in our hw/ppc/sam460ex.c code.

My guess is that (as with the virtex kernel in our test suite)
the Debian/Ubuntu kernel you tested with worked because it
doesn't actually check the value of the magic number, it only
cares that it gets the FDT address in r3. The giveaway that
the tswap32() is wrong is that we're only swapping one of the
4 things we pass to the guest code in registers -- either
we should need to swap all of them, or none (unless our
magic number value was pre-byteswapped, which it isn't).

-- PMM
