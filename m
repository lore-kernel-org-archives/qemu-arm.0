Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp622387njb;
        Tue, 18 Feb 2025 03:34:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWW7x5mrLfeQDE44MmrGpEFsJUtQ7MJV7Oe4Gtyvea1a1GW1SSCN1ELwoacKcLm/EmkwRhG13QOoXauoQ==@linaro.org
X-Received: by 2002:a05:6902:2891:b0:e5b:240a:ccdb with SMTP id 3f1490d57ef6-e5dc9060149mr11050587276.20.1739878490904;
        Tue, 18 Feb 2025 03:34:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739878490; cv=none;
        d=google.com; s=arc-20240605;
        b=Bt36DRO7K13rU/KKzw8o4K/WCGRuiysbqIry+KxnsJ7g3aR7RtVNJolgZhliQBgsme
         HllFnq9Pj3HqCaO/jnA4+aTg7QyZ0fGzdJNQkV9JclPaLbHTVmqXk8pXtXGNIlxBO4bs
         vGSpm6/Gr4NlTgniU2lOB3noka0dHwLZ0in18Fw2t6hf688CJuIk9dFmS7+Pdg3vvd5Z
         ZeRJuijB0gdcaoueHDtd8Tavt7BHWU6l2yxavg8KgOc6WpiZtDTYFaASCW6XniHLUGoJ
         9K8R9AI1NE7fUvI2caAMJT/tAzZlRjshREk6hw8Pb1gkPNoii+FFcbMQHdXKdW/sNDwi
         g+JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dCxxmzLztkSmSoJ8j9LmPgMtj5EStxkwMuRxquLRua8=;
        fh=Aam10I799C4vCdUbnxExt+VG3yMiuXoYvCh8gDV2a7k=;
        b=Cg50NlSs30wBbwWHBAUuVeBUGDrP0TyRPMJkbDgbpHP1MrRS/FG1RD5BOzAa5JdALz
         jNIIca/L4NtqMyb0qyG7wWZ+UEbZ0akf0HFibx5mhbXdv8ZdMNYiX3Tpw4ycyqEGOMHa
         gANAXm4Su3jfTdTswZ+KmsQD+FqZT2vwFrEHgp4ZTOs62+I3d51axPUdHwwf4YH74Kx6
         /0cZFbDP3If4+lP5fhi/MvnHzpeYjIEk211FgNNFQEE/1a+Jg/SD6M0XCQrTd5Z6Ucn3
         5d7Sm7+IOZUDo/gw+hJh0vHiOZ1RWgdMSif9VZoo6KF6oV+HH3P+e/kUIxyOCjwiSrdZ
         zg7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p8+LM7k3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5e0070fe51sor671231276.0.2025.02.18.03.34.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Feb 2025 03:34:50 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p8+LM7k3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739878490; x=1740483290; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dCxxmzLztkSmSoJ8j9LmPgMtj5EStxkwMuRxquLRua8=;
        b=p8+LM7k33JM1O4zuOapiuVkck05cep5DTzFk1c/uCloNGenY5oyu1qO9nF+HIEPazo
         mxAfiu975jaQc/hNAzy7EHfpEGIc+SCbCteYe9//UBzbH6IKclNFGgCqYRsVK0bWQ6bN
         edYFvVw1DNM40lGrbaYr34gL6azldKPbuFtb3L9yeHYKE2xeDDS1m2jOWfOUwUC3cvPK
         eMGvhzSd7T/viW6qa/SQfptcqnAjrUaIsROeMhw9VwTbyNzzbtq50ye3I560z2xQKxHC
         PjY4mYn9S1pJpc3SIIXBNAEiaYYtz613WJwm8fxE7RS+H2TCyzLFIpjmC9vW6G1eyfMg
         EWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739878490; x=1740483290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dCxxmzLztkSmSoJ8j9LmPgMtj5EStxkwMuRxquLRua8=;
        b=eRjqYafzYj6euy47FlyEZBG6DtPxPpp/ZUVzlBs8SFAeCKmvQCrSWnhvwpaIUoV5ae
         A3AMQwqW550n2FK0VDw4t0GIftEHPZdl1tl/DNuxH38NcyS4LVswotV9+BD/UMe9yjib
         dmj7bnFHwOlI2o21Mjb5PqTm+3hwbhWw9uPNQLu9MQ33J9df/en6RXTgZfzGj2IXCQG+
         8k5INGvUKCey9wX8EVduNjYEyzB5W/L3RfOOF3nnrDYsyMaYKYrL8x2+nqPOBO3XzLpI
         0sKPNVtmvM0RIW3873DTNeeDLdYQKlUovtb8sZWkMrBY4rcKrah0Ei683YLCGPnI4JOQ
         zm5g==
X-Forwarded-Encrypted: i=1; AJvYcCXPObVLTSEkgMEvODeny458JxqZSdZHfQWNI/e5LTji4ZGzMXOOm7puka1fOmavEh2NmR4KW/24n0ugKg==@linaro.org
X-Gm-Message-State: AOJu0YwFvCeYPVHJwNsuzbzi7/e0kz93d/2nGzWnvjm4idIUysQIGase
	e2RelA3V8sKEwaZLrAwe43pnilMyNDL8a3Tj0W7jKH0d49j7LL+L6azfMMXY81elgFyBjpTRfk8
	7hQheZ2lgDoTVhHi7oXenl88LpqiMQXSIeX06E1eZ
X-Gm-Gg: ASbGncsPEB0fU7EMcU4Tb33mwzE3nUBoE3BKyiHoAWttjLI9Yq8VUVwBHQXuV3n0jzk
	eVAynC5qOqXP8JOTAELunMHIW8kaw5JJJrnLWU2RJor3rrODmSGPSPoOi4oIWJ4P6gpxcNkoGZQ
	==
X-Google-Smtp-Source: AGHT+IH/qISOe5WuHOSfMc6TYfzVK4kQWakJQ/qH3tR6yO7jfs1QIsreQJi91qafrrCYFW1kOrUKQKSZ988AQs+7HSY=
X-Received: by 2002:a05:6902:230f:b0:e5d:b2c4:7cbf with SMTP id
 3f1490d57ef6-e5dc901f488mr10347903276.7.1739878490533; Tue, 18 Feb 2025
 03:34:50 -0800 (PST)
MIME-Version: 1.0
References: <20250217163732.3718617-1-kchamart@redhat.com> <20250217163732.3718617-3-kchamart@redhat.com>
 <ff481ffd-545f-4d0c-b53a-3cf9e0f8f388@redhat.com> <Z7Qnsm02w6gao_ui@gezellig>
In-Reply-To: <Z7Qnsm02w6gao_ui@gezellig>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Feb 2025 11:34:38 +0000
X-Gm-Features: AWEUYZkKRqFZeUgKLswIbgec76XzM4VNRtISsi2zkh_MaIAen2OmGkos6ghDuwI
Message-ID: <CAFEAcA8H0P14JaAtpcwG99SYkqAdhoNzyQBuO++YjJjM1rUbPw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] docs/cpu-features: Update "PAuth" (Pointer
 Authentication) details
To: Kashyap Chamarthy <kchamart@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>, qemu-devel@nongnu.org, 
	Ninad Palsule <ninad@linux.ibm.com>, sebott@redhat.com, maz@kernel.org, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Alistair Francis <alistair@alistair23.me>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Tyrone Ting <kfting@nuvoton.com>, 
	Hao Wu <wuhaotsh@google.com>, Zhenzhong Duan <zhenzhong.duan@intel.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
	Joel Stanley <joel@jms.id.au>, Jamin Lin <jamin_lin@aspeedtech.com>, Yi Liu <yi.l.liu@intel.com>, 
	qemu-arm@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: fzEsW33p9yJo

On Tue, 18 Feb 2025 at 11:29, Kashyap Chamarthy <kchamart@redhat.com> wrote:
>
> (Cc: Richard Henderson; context: "SME" and "RME" feature discussion
> below.)
>
> On Mon, Feb 17, 2025 at 06:43:01PM +0100, Eric Auger wrote:
> > The resulting header layout seems weird to me.
> > Initially we had at top level (assuming ===):
> >
> > KVM vCPU Features
> > TCG vCPU Features
> > SVE CPU Properties
> > SME CPU Properties
> > RME CPU Properties
> >
> > and now
> >
> > TCG vCPU Features has somehow disappeared giving the impression that
> > there are none.

> > Maybe we shall
> > - rename KVM vCPU Features -> KVM only vCPU Features
> > - Add a TCG only vCPU features including both SME and RME ones
> > - introduce a top level KVM and TCG vCPU features with below:
> > PAUTH, SVE, detailing potential different semantic for both KVM and TCG mode
>
> Yeah, it can be done.  Would you be okay if I do it as a follow-up?  As
> this a re-work of the entire doc with several features.

I think personally I would favour not having the split of
"KVM only", "TCG only", etc sections. Instead document
all of the properties in the same format, and have each
property say whether it is TCG-specific, KVM-specific, etc.

Some of these properties may at some point in the future
change, after all -- SME is currently TCG only but may get
support in KVM and HVF in future; "aarch64" is currently
KVM only but we might some day support it in TCG.

thanks
-- PMM
