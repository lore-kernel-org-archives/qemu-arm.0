Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp33035lfc;
        Fri, 15 Oct 2021 05:23:53 -0700 (PDT)
X-Received: by 2002:adf:cd85:: with SMTP id q5mr4228374wrj.114.1634300633781;
        Fri, 15 Oct 2021 05:23:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634300633; cv=none;
        d=google.com; s=arc-20160816;
        b=deMNTpyAPVweUbMNYoFyCl1nDD/4LooOZW54fBFJ728b9aTBzy8ybHFXL3/qMgIZ47
         zzTFUMLg9aNjZzGCr92q6rLt/AKJ5OeUyS0U4bHIDtqP44RposNKz+09DCrigcyBAr8+
         SdXZipteUSqRpRuKxYufaG3v+xEMmwKYB5vYnWcBxZPyUBhYwKaMwX9S93iKEnQdHu1b
         IHz3T9OMuSs+8zTyRBhovt6ICm9w2W3CJwgwEcX4nRzZEYSDCdrdpUIje9AixT9HVBEJ
         e2GZUDB6IQZJgJyn46sB537HjAkKWo1cP923t8chymXLl6TChStUidF1GWh4qIWUaXUE
         OUMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=ErrKU1nNjLlW3Bw3X1PGFEvVO/njZ3tUD7zOxBLP/dY=;
        b=Gtq4BsIVg+6ZndVptRhzGK98kEyKfxGlOkTLHrqj0e4JhbuLuDkmasI/bOcuR6eD4s
         nSfzW8KDX1mGLV0IZriPjRet2a1+P03sFUaMGBCXofGzn/0TSc1tBg2kwuM0tCYD+PYi
         RXvOhJX3zFYa94Lfe/y+FMjkSAUT/PRM4n2d9DzKWzZGGJBRcq5KiqcvGcMIwKK4mFxi
         Ei+tROKWMXGjhlqqmIgjpGq3J5KSIgu9m0QVE5KksvtXEM/+LvWJfvFNYE1zg1JfLW2s
         AzfgrbM01OS4VXq0vVI3ip81d7ce0cno3hCPA5mL4UckUUF/y2nNnxdtjO80IZra0ry/
         3iTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20210112.gappssmtp.com header.s=20210112 header.b="emh6nYy/";
       spf=pass (google.com: domain of leif@nuviainc.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=leif@nuviainc.com
Return-Path: <leif@nuviainc.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m4sor7645709wmq.23.2021.10.15.05.23.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Oct 2021 05:23:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of leif@nuviainc.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20210112.gappssmtp.com header.s=20210112 header.b="emh6nYy/";
       spf=pass (google.com: domain of leif@nuviainc.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=leif@nuviainc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nuviainc-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ErrKU1nNjLlW3Bw3X1PGFEvVO/njZ3tUD7zOxBLP/dY=;
        b=emh6nYy/cqhG1ZuPAA3P2wHP1ThWhJtTjdmm1CI6sl11Z52zJVmNIYwoRsAm5b673w
         7StOOxetfON4NUwJ94DfNpBAgtXclG07wLMsxY0hygMqm2rWUe7kMqeUNgGAHsv4uBXu
         6kBzUd6QKpMRZapXkhohFCOKi+raMRyghD8yM2wn/BJ4c07i63J4+1m1loYg/FlD1GcZ
         Vgb2qzDaR4RK2aVM7JWztIojqV/jsvBEtLW+6SS2hE0e/q0GTvO39XK5qju84oeK5iYo
         Vy8CNNiHr+FX3tMYxouU9+wNaCzqtjUnEroN8O6485EiImMd8OvsXw9fydBYOBak3ffb
         8Mqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ErrKU1nNjLlW3Bw3X1PGFEvVO/njZ3tUD7zOxBLP/dY=;
        b=ll7RxcOxe1XiFYtzG6pEduuo/tkv7mN7odcTWodc6xJVGSxdLQ0zcHe6Iq/ya9xtFY
         5+E4x1345YNk5HfYQds4oFMDkzwfOi41ACgqp75i91NFyNn78Oq+cE52zMr7Dn1U42K7
         ApPA4qWyYGdofmVlseljbkfsEZ3j+kN3zEyIz1hQ9MhuCyb9CEDffZAkHTrWDgnztHJI
         Xek5/Ai7W1QEeqtZyW5bxsZRLthtOm9NhhQSBSkUQcQSIm5sPGgWV4Mj2r550nDHT+ed
         kpryeMEnkSShlfVIW98m+Yl4ImlH5swP7n5gMX9uDeJgZnzZfWRZzAgSIs61JjwWlEQP
         mbaw==
X-Gm-Message-State: AOAM53344orS4kgs9seLtVCtaXJ6Rkx1aOdduyxG1Lt8z/YiqPeqj8Ij
	8eBjeQ/JuFCxcQh6xR8vszhqB/NXkYxPbj8d
X-Google-Smtp-Source: ABdhPJwWucQ4THkJrISLOmArhpaOeDK1bu/+mRW69P89MkE0FMr/KhSjGUaA/fJz4i+ARouQ4b90UA==
X-Received: by 2002:a05:600c:414c:: with SMTP id h12mr12059894wmm.66.1634300633518;
        Fri, 15 Oct 2021 05:23:53 -0700 (PDT)
Return-Path: <leif@nuviainc.com>
Received: from leviathan (cpc92314-cmbg19-2-0-cust559.5-4.cable.virginm.net. [82.11.186.48])
        by smtp.gmail.com with ESMTPSA id n1sm10386990wmi.30.2021.10.15.05.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 05:23:53 -0700 (PDT)
Date: Fri, 15 Oct 2021 13:23:51 +0100
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger@redhat.com>, narmstrong@baylibre.com,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Message-ID: <20211015122351.vc55mwzjbevl6wjy@leviathan>
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-8-shashi.mallela@linaro.org>
 <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
 <20210902124258.mqjhx7lqqvkczf6a@leviathan>
 <CAFEAcA-KeBzOCP1CHVWPHbHzG=KbS_HJmXoYo7B2VBz=oGSd3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-KeBzOCP1CHVWPHbHzG=KbS_HJmXoYo7B2VBz=oGSd3w@mail.gmail.com>
X-TUID: n0ASMfS4aC9G

Hi Peter,

(Apologies for delay. Alex also tells me you are currently away, but
there is no strong urgency here.)

On Thu, Sep 23, 2021 at 17:00:35 +0100, Peter Maydell wrote:
> > If we assume that we don't want to further complicate this set by
> > adding the additional logic *now*, I see three options:
> > - Implement memory map versioning for sbsa-ref for this set, placing
> >   the ITS (if enabled) directly after the DIST for sbsa-ref-6.2.
> > - In this set, place the ITS frames in a different location relative
> >   to the REDIST frames than it will end up once the further logic is
> >   implemented.
> > - Drop the sbsa-ref ITS support from this set, and bring it in with
> >   the set implementing the additional logic.
> >
> > Typing that, I'm getting the feeling that if I was the maintainer,
> > the third option would be my preference...
> 
> So, we took that third option just to get the initial ITS support
> into QEMU, and it has now landed. Where do we want to go with
> the sbsa-ref support ?
> 
> There doesn't seem like there's much coding required on the QEMU
> side, it's probably about an afternoon at most to update this patch
> to match whatever we decide we need to do. But it's very unclear
> to me what it is we should be doing.
> 
> Leif, what's your plan/preferences here ?

I discussed this with Alex/Shashi.

One further complicating aspect is that the EDK2 GIC driver currently
relies on GIC addresses being known at compile-time.

> Presumably somebody also needs to do the system-software side
> of things to handle the ITS being present and the redistributor
> frames moving...

Since it *would* be useful to get this support in, I think the most
pragmatic plan would be:
- Add ITS in the location originally proposed by Shashi.
- Add information to DT:
  - Platform version (1).
  - GICD, GICR, and ITS base addresses.
- edk2: Convert GIC driver to support dynamic block addresses.
- TF-A: Parse the DT and add SIP SVC calls:
  - to retrieve it (or return not supported if not found).
  - to retrieve base addresses for GICD, GICR, and ITS.
- edk2-platforms: Query TF-A for platform version.
  If platform version >= 1, request base addresses for GICD, GICR, and
  ITS.
  - Generate IORT if ITS present.
- Update GIC frame layout to match an ARM GIC-?00. (Platform version 2)

Unrelated to the ITS question, and not requiring any intervention on
the QEMU side, we can then also transition the CPU and DRAM discovery
to SIP SVC calls, and stop sharing the DT with edk2 completely.

And some way further down the line we could do the SCP thing, which
would let us support different GIC-layouts/configurations based on
platform command line options. (Platform version 3.)
(TF-A makes SCP calls if version >= 3)
This would then require no changes to edk2-platforms.

(Numeric values described as incrementing integer rather than trying
to guess at specific qemu release numbers.)

This minimises any compatibility breakages, and I think remaining ones
are acceptable for this type of platform.

/
    Leif
