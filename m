Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp236555ocb;
        Tue, 4 Oct 2022 07:54:28 -0700 (PDT)
X-Received: by 2002:a05:6402:5288:b0:457:22e5:8022 with SMTP id en8-20020a056402528800b0045722e58022mr23730354edb.244.1664895267906;
        Tue, 04 Oct 2022 07:54:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664895267; cv=none;
        d=google.com; s=arc-20160816;
        b=YHp6xd/mSXCjDoMGT73mpe52NmXuubBuahvMctmrmPnR7c0tvKOE0dq0ZFDVPj2wEa
         k8IwzV/pYrDnBCUFYFT79sw2CFjwRfvX/AqHqjDSzJVes5YjEiqKcf8CCUyZyG6ubshT
         bBnBvV2EmGHoZIImpYuEy+wpY7jKXiWrzxe5VBFKhb3NchBbAsBFMc9lnsWGyd8Vb0rk
         ueBEVotYnX9WZvVPh5vDruL+eBt/o0biuK1Bkomc5U7Ga/4zsBPLwlA/rugUGTg2/sU9
         ogdfmUhfd2Vqz809dmiX0AGV8bImp1I88TLsIP8VgK9LKn8aahcUtb6sYSCZfSA3HdCw
         OyhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PvRw1uEKzW+hccL8Bu2I88yXvjma7BxLIhKaP0JnCP8=;
        b=pWxKySjZ9tpI90jAg2cJ4Pz6k7UbqT+7WkFhlCv8nKSH1X+1GM0R2A0dv2TPxJgdek
         W/s61+c/KtcsP+P8VPeZEAD1XwZshD8I/f0kK3bi6rTs7XyDk5eqqXbGIDXERpZ/jOkc
         WvtIWxldpnP6aKJa76TsFYLVucNc/UIwYonaKxHN7ijef46OE09z+4n3LqmujtjGajdT
         XBu8MY11TH0qyvifjrXR82ASd0xVJCgq1mcjgIP5zImzcOUBkYKU3Boqb5Us0TiDff3k
         A7Wap3/pGFIwVrkPp5N+KIRnDMbs/hR6CSeEzDonAtAa6tIFhifH78Pyo9qG5XHt214O
         xOhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NnjGX3Hc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l22-20020a056402231600b00458814c6d53sor5780120eda.19.2022.10.04.07.54.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Oct 2022 07:54:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NnjGX3Hc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=PvRw1uEKzW+hccL8Bu2I88yXvjma7BxLIhKaP0JnCP8=;
        b=NnjGX3HcUiU7eqtxQqtmaqUEdcSd/hsXFwd1LF6ca3j4MsIL7TEoWE0ydoBUQvZfjD
         LaJNmwN3YuwUikam2REeCyZUlUQTmH54P/v3OrkzJ2YuZ+s9xO0ApB0oCUttT/PajgqU
         AfpqxiTNiwHd4i1Oed9DHNGFovVUFRVZPiqiMM47OhmD3RTkQ7qv8Jucea3xR5f3PjiY
         F4cyG+rBPbznaIhAdD0l8PqG01FbgXdex8++VLkmiPeiRJwCNm0HU2FMoqpfyXxpuKW+
         B0yH2alDTFUT1rGJgxXZv8p3tqLbC+MC1JOUfSa7fPCtNRpuj/u/heYpo3mFlLy+yAfw
         E3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PvRw1uEKzW+hccL8Bu2I88yXvjma7BxLIhKaP0JnCP8=;
        b=16G3W62Moqk/uNOnlcPePVuhFXl/luu6lh48eIp1AwHhEfoXWPCguk9cKrCVv8X9HO
         qs4UE0Cwk8ntrmcmt9sx3AeiHy+yE4VjB11KVWBkjNB7BbrUhFqHfkbZj9huUBErrElB
         8a3C8AWvPs4QypRvdyqpKUAlMAChY1Qnpq+TzE0e+eVm/AwdTvb6a95MCVBNnUqZE96u
         d61Y+czOXRLXp7XrWhzgXipkl+aMd4WHCZThc6kUbBbFTm3uOP2aB38/+CoQ3BQzeegB
         eQUVcwFnJVM7cMuesW4hdUO5//+xMHOYNnTXmP3HtzNHYiH0TqcnXDOapvtXKnfGCbEH
         dw7Q==
X-Gm-Message-State: ACrzQf3y3/zEVbN4NN+kSd11WFf665ju4eyJwcv5xc7sVh4ckYodmpRo
	C9BhlkbGAd6Ax2GFySqIkPC7goUEH/NIvs+JNTCX4l+m655OnQ==
X-Google-Smtp-Source: AMsMyM75lPZIh47sNXjC86mYolyWNSeZNpLjvnJLodseFvFyarrBsQfMSp+GGW7+DQpw/61EPSj49I0n/OStLg3fUrU=
X-Received: by 2002:a05:6402:847:b0:453:943b:bf4 with SMTP id
 b7-20020a056402084700b00453943b0bf4mr24084352edz.301.1664895267612; Tue, 04
 Oct 2022 07:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-2-alex.bennee@linaro.org> <769e0e8a-7787-b02b-9e26-87eca955666b@linaro.org>
 <CAFEAcA-0zoNS0nWrYu6hM1=8tG4i4GkjHLL2v4OMmJv5GaDAMg@mail.gmail.com> <87r0znlnmm.fsf@linaro.org>
In-Reply-To: <87r0znlnmm.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Oct 2022 15:54:16 +0100
Message-ID: <CAFEAcA8Ft_YAC2TRCSErUJxY8_kZOQdF7Qa6oM6VF2RpAeHrBA@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] hw: encode accessing CPU index in MemTxAttrs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>, 
	Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: OpX6uAJ0VQe2

On Tue, 4 Oct 2022 at 14:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > The MSC is in the address map like most other stuff, and thus there is
> > no restriction on whether it can be accessed by other things than CPUs
> > (DMAing to it would be silly but is perfectly possible).
> >
> > The intent of the code is "pass this transaction through, but force
> > it to be Secure/NonSecure regardless of what it was before". That
> > should not involve a change of the requester type.
>
> Should we assert (or warn) when the requester_type is unspecified?

Not in the design of MemTxAttrs that's currently in git, no:
in that design it's perfectly fine for something generating
memory transactions to use MEMTXATTRS_UNSPECIFIED (which defaults
to meaning a bunch of things including "not secure").

thanks
-- PMM
