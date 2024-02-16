Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1233713ejb;
        Fri, 16 Feb 2024 05:44:27 -0800 (PST)
X-Received: by 2002:aa7:de10:0:b0:561:f757:631c with SMTP id h16-20020aa7de10000000b00561f757631cmr4468496edv.6.1708091067497;
        Fri, 16 Feb 2024 05:44:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708091067; cv=none;
        d=google.com; s=arc-20160816;
        b=WizchJCx1UuMSZu8FqW6Qxw4Hd24eXc6SDhrX7wRj9599OxcBLZLVlxsXa6vAIUBi/
         FhfWFW0fuJnBn75iX3BdkZU/eNGbTfUieFeku0P+WLdtri3r9hzHsa4eUYVvHCpAq2G+
         tduvbBDZX9XkICLou7Eg3u+zunSJ0ErVTRGdRdDPpN+ggLL6Kd6Z7HKtJJSHYoS0cDDo
         b9D1GsS/dLMeZDXOGNmBlanl9g5Y8Oil8zWbMMVlAnnsU8jTvfFd1ISUgqTbDk9cnB/H
         N/DXgPQvxP3roshYIxgeA36dtKMhnX8O5uljoKfaGnYizObySe38JRPBbUQjqNF/8Kim
         yNVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f+Zl3vqJANsD9DOyRY06p8VIQhTm2yVMUTc1AEOdVGM=;
        fh=AeBU7gq8ZiNHvDWWkjzDkAECRcvLyzGzCRLlZ56wn08=;
        b=bmZ4H8pVz2wVgvneFWoQoUU2D2yA3KTL9XDkJlVVvPb5Tt6yzsW61E1/1Wb6CgBTob
         Uvc7yK39uwFgiJSWpOArF8fyNlO2PeYCX5e+v4Omu/H1wGbGWb1wBQufOzCl5xa1xfvJ
         hSlp5iIabBAUy0r1WdImYfTkRQ+H7hq6WbPHP8VWRK68lOGkQOFJ99hW9AO7otxE8d++
         kTEnjnDVCCXk169YZtR6pOXraGoI//Vi3oaBi5Ndxi4EshRWZKQAVPPKzg8raT52iRTf
         HKU4eeK2+8nXgDyAG/8iBw2RNoDZpX9pa4W7XuyS3J/rvXOc2m792LrYB5DuvUokTXN9
         4wIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fRRNOiTQ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id di1-20020a056402318100b00563dcd82a8csor877078edb.2.2024.02.16.05.44.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Feb 2024 05:44:27 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fRRNOiTQ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708091067; x=1708695867; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+Zl3vqJANsD9DOyRY06p8VIQhTm2yVMUTc1AEOdVGM=;
        b=fRRNOiTQa7yeZTUBD8UhKAnqSgFdA8ZePOkFgy7FdPfsatLBc/t076Knx4Ex7DDZ74
         Pm7lm9IW4e0M3qbEa1rFqfCzbTZYZVegPmaFqvl5I25QwpOhQ/wyI9n+LctwAZwr9hl6
         qtbz3TDThSxejJ24jCd9pkBjm3CjCRwCTcOXX4yEXPyWHg/WCca2QJv4aoq/BXNWpo+y
         i/gf2tP8wRU5PVvt4+wJEdYEXza4iG5/hqQXUzwU5+cwydMMZwY3su3EjAu60yPAlqAT
         6i3d2RpdA9pT/xfwWQLoPBfIp4ZgRm17WrowAFmf01TnNctbMovVSjhDJXYN+tX6DFAu
         n2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708091067; x=1708695867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+Zl3vqJANsD9DOyRY06p8VIQhTm2yVMUTc1AEOdVGM=;
        b=mBbG+sPozm78ZjmJ4lZwUUnUXLZSFyKSHwOhVDPMnVCXNJ3IP6uEDLGdhBgmmcvu12
         yUtXWkrq9vsnVvJQ7dnqDeQzz3br27/FQtfJuiuq4WTpRhWryC8p60+0sxUQz1xzDILA
         2YQrSS0itey7QeU/NuOs3BMVd82WKLPiWX+vE1cy1acUjPt4B2RhwW/m8PtnmFtePWUz
         +s0F097INnlLzOS+rdi8ZO0uQwvGjbFgWL4pPh+VY+PUuzKxO/eSL77JUgaSYk2dLUgT
         brZUDCEwZeaggXlGLzsDde37SVw1VP70qDX7QVRvZgH/rseHLS6Fr1OG01wtO0uApzNa
         zRqg==
X-Gm-Message-State: AOJu0YxK2zQCQKNHuafMpkYyUippiDe4o5DmnQR2nQkPRG9qlUiwAzrO
	vB4BRCAJ3c3b04IcfomiOf9Qs0B+1stkItkVQB/F+8ztPfgW2/HYECmD+9cBPl9ctxdI3ClEvGw
	1+R4RKNAhEnH3IQ8iy4kGMp1w+9Y1OdqKL0fybRsMeGaTZlqhBEJ2ww==
X-Google-Smtp-Source: AGHT+IEEuqvHGYXJ80mHqDSfLfNRZi6KIYSbK8sKRTQ/+LGiS6Cp5T8zuike/pOHphQ6Ltbl6zXC81MnPpOVbz0Vtgk=
X-Received: by 2002:a05:6402:38c:b0:561:f4bc:606 with SMTP id
 o12-20020a056402038c00b00561f4bc0606mr4538154edv.0.1708091067149; Fri, 16 Feb
 2024 05:44:27 -0800 (PST)
MIME-Version: 1.0
References: <BL1PR01MB7795E154CD5AE6ADA60C0D53A87C2@BL1PR01MB7795.prod.exchangelabs.com>
 <87mss04oyi.fsf@draig.linaro.org>
In-Reply-To: <87mss04oyi.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Feb 2024 13:44:15 +0000
Message-ID: <CAFEAcA9nMPs7WdXzmwM-m0VSte9nmvtJFVWAUKmqZr4YYZPVtw@mail.gmail.com>
Subject: Re: QEMU 8.2.0 aarch64 sve ldff1b returning 1 byte when 16 are expected
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Mark Charney OS <mark.charney@os.amperecomputing.com>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
	Aaron Lindsay OS <aaron@os.amperecomputing.com>, 
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ugtQ/0USDomp

On Fri, 16 Feb 2024 at 11:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Mark Charney OS <mark.charney@os.amperecomputing.com> writes:
> > Talking to Alex Bennee, he pointed out:
> >
> >> I'm wondering if this is a result of the fix in 6d03226b422
> >> (plugins: force slow path when plugins instrument memory ops). This
> >> will always force the slow path which is where we instrument the
> >> operation.

Yes, this sounds like it. The implementation of the SVE first-fault
instructions is that we probe the TLB to see if the address for bytes
beyond the first load is backed by host memory. If it's actually backed
by MMIO then we will not load from that. A comment in sve_ldnfff1_r()
explains why:

     * Per the MemSingleNF pseudocode, a no-fault load from Device memory
     * must not actually hit the bus -- it returns (UNKNOWN, FAULT) instead=
.
     *
     * Unfortuately we do not have access to the memory attributes from the
     * PTE to tell Device memory from Normal memory.  So we make a mostly
     * correct check, and indicate (UNKNOWN, FAULT) for any MMIO.
     * This gives the right answer for the common cases of "Normal memory,
     * backed by host RAM" and "Device memory, backed by MMIO".
     * The architecture allows us to suppress an NF load and return
     * (UNKNOWN, FAULT) for any reason, so our behaviour for the corner
     * case of "Normal memory, backed by MMIO" is permitted.  The case we
     * get wrong is "Device memory, backed by host RAM", for which we
     * should return (UNKNOWN, FAULT) for but do not.

Unfortunately because the plugin memory-access handling forces the
slow-path it is TLB_MMIO here, and so it ends up in the "normal memory,
backed by MMIO" corner case, where we do the architecturally-permitted
but perhaps unexpected thing of only loading one byte.

thanks
-- PMM
