Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2433274njc;
        Thu, 12 Jun 2025 08:40:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV5zFDRk8YGtKQOfm660ChbX3xMz6sFWJuhAWNhoWtBUYKbEF4fUE/xEIRZ5lz4tR/9aGd521sreElTuA==@linaro.org
X-Received: by 2002:a05:690c:690f:b0:70e:70de:6512 with SMTP id 00721157ae682-7114089f66cmr109873887b3.0.1749742803759;
        Thu, 12 Jun 2025 08:40:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749742803; cv=none;
        d=google.com; s=arc-20240605;
        b=HhOWDNgpXoAfxV0eZC+/QBErnbkROZJt9tjksxvLmAzpfu5grCNuj3+UUbcLtyB67g
         ak7/7s/XmH28IchpQjqK0JxhDqWa2Lb4WgK8qZfLUfM5nHNPuKbEljmdraYyKKCTtrba
         glqNjTh+737rSulYUqym2DB1WPGJ6ufJxbC66alko0YDnMrGHjivSZAdQV/gWlQt935L
         4XahAl/kXhMYkymYpn8jIkbAw0Tfdy5tSKRThZj6PIOa1Lq7FQJSPu/YVQEBQWQjh3TM
         YjmBk7IllcrAEHJLgp86jH0W6GXFwnVoHkPOZUOdbbTh4PBUQ7P2u0soTH2ChZSP4CxR
         o2uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0GCneGgfExrxwfR8Ui0kwChdEvpsbQ0IMrzfOgR23iA=;
        fh=tPktnzh5wkiKdbszhZI01DOGUeQG3H8OePpN9gpL3NE=;
        b=ecWVn88uX285JpeCqkqENOuWdJSpewTS166e7KFw2RRM5BcmVNqz7f0qZNF7Rboo/D
         z423gKYB3sI8iLoIf6glidnNsputC+QEz/Gjb8ZJHi8ZNHNaOK6DHmfTdYOW/eFsiq9Z
         kD6MJ4mFAVPSt1+NtYmqzAOnLS9Qr/WHm4/QLxtSL/vm4M0TQ2jA0HZzs0CMq6+UCTky
         s+LrZKZD1WgeA8XrEVDvBpYEhM1/UMZXgkSFVsQWvbrg3dmoJCj1I+EnkDCR4YjDVzyt
         h1u3sn2/YqJW12aF0zBNyImf8SUN7sSqh6D3chcoMwrVctT/fyv1YUYSo96fup4ZnJWz
         40IQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QmHyI2yT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-711518c52fesor12583127b3.11.2025.06.12.08.40.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Jun 2025 08:40:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QmHyI2yT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749742803; x=1750347603; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0GCneGgfExrxwfR8Ui0kwChdEvpsbQ0IMrzfOgR23iA=;
        b=QmHyI2yTf0xI9FkPHO/gaLcqzV68fMnEDvwAaveLAfqkro2XvmTG1aN9c2W7Q/xif9
         0+9c8W+XtY5RM//zEDlHOIL9krHWyqGlyKIaBnqCS+AxRofeCbnTAS0lUnoy2II0xA+C
         laDX90bT1EJZdXBjzKfDVqCZ2Bj754VMuoHDPHfXtZqVWk60noW/PPyqBynZbEIA5BkF
         cNS+mz7i4Phsc+S9ayGwnYwyc3cBiR5ye486y/UAZlRq5OwBEoRVm82kxxHoQx2otWZe
         jZSzLk6gLsasaFImFdjhSk7MSOu1B6PasiyPvCJgEOjDuCczoSe/HgTCmQZaSfH9dPln
         xzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749742803; x=1750347603;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0GCneGgfExrxwfR8Ui0kwChdEvpsbQ0IMrzfOgR23iA=;
        b=M+tKpvEbxU2lIpA/NCkMRiyZANZ0OS9rZZC+EeqpughRgOvu0Hg/s4o/oT8MRiaJm9
         SKJeK6LfI4yTGrvVZf9iAmZsTvKYJuoKXUjr0WMmV9D+TT5uiz/fCGJCq22OmXpur/pJ
         hh2C/e/PMY/8F9a9C55fgJsr3ymq0AzaxZWz3SmJai7NVOAJ9DANHrGmGlvesieKQ5O7
         B0Q3gFUc9BvWLr3jO2I1ofk84Tic/70BIxXh9/5q1hXAOsvO4RO1DZBuB419dlmKqCKH
         Rn7rlCyfrrki94uNdg9UPKKenNdTQEbHTV61BdDumeEIwDIXuXdQVH3ozlE2+POGH0oE
         8bpA==
X-Forwarded-Encrypted: i=1; AJvYcCX5fskT5YpDI0p46u/JxBZ7lc3Jy5rBnpnNjr/cz9uMj3XWH1cT2th2qKjlHdznwzniVXvx5KiwAAJPFQ==@linaro.org
X-Gm-Message-State: AOJu0Yw5ga4xW7dfvZFxCqi17BKo5rmeeBbg3UPktFxNmBF29Na8av/l
	EgoJ48vVtgE2B8AJBSJZX2vQlfZQF6VebsQa1O2hQF70K7nwx0xucl8mq//YQ2Wmruog69IRJl0
	QqLHWZGGuEJA9io2lrpJsR2zFGQXSFG0lnsCFS6yIi/js
X-Gm-Gg: ASbGncsBda+4xDzcE+tmszDHQq6U8FF8fhRsTf1ryFNFnJAayLw097VBPZUQMmBUrzR
	iNj0cvkhs4O/2VlSeTn1XPdug3HOOS6PRguyohc1q9+ti/XA88iawtHTfwBc1oSg15hfKvVNKPt
	6A+3oPnC7T5mrAT2mox3NwQs4sri4YentCcvJAJgpKq90OK1Ao+adWoxw=
X-Google-Smtp-Source: AGHT+IHBHeJeONG3H7FZDZ2gzpluKSyc9U5d3tSDDj9TAvFgb1FASvHR12UGnIXjylLAo97HcqblKFJamwURpnJdu+I=
X-Received: by 2002:a05:690c:3584:b0:70c:a57c:94ba with SMTP id
 00721157ae682-71140ab7fe8mr120867917b3.17.1749742803370; Thu, 12 Jun 2025
 08:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250515153907.151174-1-cohuck@redhat.com> <20250515153907.151174-3-cohuck@redhat.com>
 <CAFEAcA8y_wwZPoqkyPrNscRNTEwiOQm5Or9C=aiSNMGcZmq8CQ@mail.gmail.com> <87cyb99doe.fsf@redhat.com>
In-Reply-To: <87cyb99doe.fsf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jun 2025 16:39:51 +0100
X-Gm-Features: AX0GCFsSzIs_NzMxA8HzPGOMVkRaS0W_5TAvxGj8ZsUFrqoq2Opm_C-WeWiw9RI
Message-ID: <CAFEAcA9P9W3jVzX6T6X3CW0zVwDbxdo1aeiG4ogGzpnHmQ8xgQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/14] arm/cpu: Store aa64isar0/aa64zfr0 into the
 idregs arrays
To: Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev, richard.henderson@linaro.org, 
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev, 
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, 
	berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com, 
	agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org, 
	pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: G/iXWhypXTm3

On Thu, 12 Jun 2025 at 16:34, Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Thu, Jun 12 2025, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > On Thu, 15 May 2025 at 16:39, Cornelia Huck <cohuck@redhat.com> wrote:
> >>
> >> From: Eric Auger <eric.auger@redhat.com>
> >>
> >> Also add kvm accessors for storing host features into idregs.
> >>
> >> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> >
> >
> >>      if (!cpu->has_neon && !cpu->has_vfp) {
> >> -        uint64_t t;
> >> +        unit64_t t;
> >
> > This doesn't compile :-)

> Hum... weird that my compile didn't hit it.

Patch 3 changes it back to uint64_t, so unless you do a
test build after each patch you won't see it.

-- PMM
