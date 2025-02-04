Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp220870njb;
        Tue, 4 Feb 2025 05:52:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXODWVaw08I02UTMd/ww7AJUAnyAoYk3zlCniLTWoBgJrHwZXgvsaywI0E4cjN5KWrLs1pJENiN1Dh/Nw==@linaro.org
X-Received: by 2002:a05:690c:6f06:b0:6ef:820c:a752 with SMTP id 00721157ae682-6f7a83747a1mr209544537b3.20.1738677162745;
        Tue, 04 Feb 2025 05:52:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738677162; cv=none;
        d=google.com; s=arc-20240605;
        b=fl3fTk6Ef3zQ6NvaBjGBiSFXt38qvDBQVw+sy0aSDKpY/AxjJvFoz7+kGrKwh210xQ
         qMEF6/i5vbfjE0Kh0O+hOQGHloG4/gbU0PyGiEa5bHY4E0eHtVOIVOnnlC8Uoaryqhh3
         DJc8OOPCq5wt4C0l/stpCP0seJJxvUMOdFdcRR2n/nPuvyupJKC2E5/1T0wc6/Tjp0x5
         HAuyP3lh3eIlSu6r+LgFGioxHanp/5NWuE4oCz4vi17YtTQIgEkCu4eLjZzsBwPr+axU
         YMd2FRXc4SnKrG/Tyqr1TQ1qE/15I0mQNLK0zJHLqYyMmI+ZoHo2XGf5G4vmE7Y3IM3c
         x1vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AEt9zpjV/6Hv9xyAVx5tPHw0X+ZSVILNpYvtBnw7BQs=;
        fh=mRib6xpqgUSmaZzEe79jVUndv8Ybj3P/khtzvtRlZRU=;
        b=QASqvaqneoXehbbS9dCEk3Yck8TziIVlWaXYWI8wGyYJB+f8cSMPEyapwzqY4n0X+Q
         OzO/pIldSBxAANBEgeRsqH9q66BSsnG4JwKKSKNf0/OQbfPZUrvFeSiQSReM4x4akDWf
         WUovG+wCscsJADlNkE6GKyk+FFCQ+hNy8QH2yjpEbxWiqB9GUJf36/Ji0CegcM1a0F+L
         QbkfCtik2VpHVpWExZwipzRJTVG2Q5/ufEZ0tRoBFcMjph5WErjf5P0iII89BFLSWyRC
         /rKRr6XlHthPvn+RcZPy74NsqkfUV9zNPFrn25pGV6VJYKdTCoyXbAn9snIvt/9XntN5
         Qyng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dSS40aE/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f93df0410dsor35148627b3.3.2025.02.04.05.52.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 05:52:42 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dSS40aE/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738677162; x=1739281962; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEt9zpjV/6Hv9xyAVx5tPHw0X+ZSVILNpYvtBnw7BQs=;
        b=dSS40aE/4LuNOvTBzvf3xi3uf+yUg7HT8+8Qcom4NsEIjFSK+K3N4IdY81kHZTF2Oq
         R89RFiYwKde3/c5jJf+RzuADLvKADh+3I9Q0W7yEo6CxfvigPGZ8u8J6zRu3DzWQPQMG
         fzrrZ0i7fCPD0LBNUWu+IBcxbDWgral2GS9FtgOIkPU2v94NJfPCDtGn6WMU2KnUsWVb
         nasGKU/hYW+xwzJYJNk7LAipp0EGaDdDFp76xOc0010kBeYKyD5A8fFIdEwwyOcvH8mt
         7jkPTwGghMySGqknGu9OxeZnbzyvIF+siQtX/xrBs52QW0pRfZPd2Ca8KOc3V652BV5Z
         7zqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738677162; x=1739281962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AEt9zpjV/6Hv9xyAVx5tPHw0X+ZSVILNpYvtBnw7BQs=;
        b=G9kez7D1Fvp9cmIFECzJ1g8jeVoat6U+CCU9xcA3yN1qim9ezKATA7dewcR6LW97fO
         VzLMb4da9orBWw6lWtv4LswccL7wqQvqoql1gK9FBIJWbXmR9nIHOUK9H+HQEBPoVyEZ
         3cnYR+qtut3bjTtjktxayQNK5bcnL6Ca3bxx91yOM8HkN6PggmBWrwYWjkmdYqJbOSaN
         ESFzoSYmh30EEZgm09m4UbvNigfBQe9nJd8Au+YAqByvefejI0GH5NzzYVaIBrIdd4cG
         ZtX2W0lxQfvgnhmQDZ2ZYOf/yR5PJrkgKsz+yOeRW7lqAVXS3mb1pDXUCTutRZKl9eNU
         NHug==
X-Forwarded-Encrypted: i=1; AJvYcCW7oVerEjTgs9lz+90RoAgZhHF2bBrCpK2MYPraZG/pZOF/dyb3vElOA4blULo9169+Xpy++GdVFxRXMA==@linaro.org
X-Gm-Message-State: AOJu0YxL7lHD1HPoQgZq/OJ0OyOKEqvYWnLyMN6SDWhiaFtqjqZOcNso
	//T5yKE/qyDTnSM6N9YE6REoQnTScsc8NdtOiGxcl+5WFc07VH9Awdo7+d4zPo70qh75DzV3Z+P
	KNWwbcEk9mb1peeQtZ8G9pSADg6jMGV82cx7bc/4j
X-Gm-Gg: ASbGnctTNLR636YLf3kHWd7O/ureSqZM/GeRCkbwDZd5oMM2ep8imGlaZORbeEzk/tZ
	3VNJDzi2j/KfUJHKZwkH2fa55D1XNSo4tXCujadzxAIqnFwMENyGyQVcT/nLFmKUok03vKQsbnQ
	==
X-Google-Smtp-Source: AGHT+IHQXPYJSIMuCmFGo7dQDddUknGPE21E1gfS0v88FTV3Fov4MWB07GEI8UjqwiRW0KOX1aXVeSNLQVrHLMRhugU=
X-Received: by 2002:a05:6902:144c:b0:e57:4b14:6fdb with SMTP id
 3f1490d57ef6-e58a4baaa4fmr19228443276.34.1738677162289; Tue, 04 Feb 2025
 05:52:42 -0800 (PST)
MIME-Version: 1.0
References: <20250204002240.97830-1-philmd@linaro.org> <20250204002240.97830-12-philmd@linaro.org>
 <CAFEAcA-3JJ1tZAXsik5hAonuSO9sCqDF1xqPQVhAeN-XwAAhDw@mail.gmail.com>
 <e32a54f2-ef46-4964-89d4-a8969b6d1b05@linaro.org> <Z6HklNsu0Mzgh7bC@redhat.com>
 <CAFEAcA9m8g=K-0RU31kswbNSKWnUqA78KxNkcXEAqR=BhWc9bA@mail.gmail.com> <8616891b-9747-4388-99dc-d6e53e090001@linaro.org>
In-Reply-To: <8616891b-9747-4388-99dc-d6e53e090001@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 13:52:30 +0000
X-Gm-Features: AWEUYZn_3CWAUkZUH3JDPbb5GNmT6y-tdyOl6D97qpiklq3Pf2FHRLFyCyi0i6s
Message-ID: <CAFEAcA9weFzHW+kL8W0GD26A+QTWpC7Baf9-=Oc3t2yw77=RCA@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] hw/arm/raspi: Deprecate old raspiX machine names
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, 
	Laurent Vivier <lvivier@redhat.com>, Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>, 
	Jared Mauch <jared+home@puck.nether.net>, Fabiano Rosas <farosas@suse.de>, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	devel@lists.libvirt.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: nccZDweQg0ek

On Tue, 4 Feb 2025 at 13:40, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 4/2/25 12:13, Peter Maydell wrote:
> > On Tue, 4 Feb 2025 at 09:57, Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
> >> IMHO we can have distinct machines for each model, but
> >> *NOT* have further machines for each RAM size within a
> >> model.
> >
> > Yes, this was what I was intending to suggest. Apologies
> > if I was confusing with what I said the previous time round.
>
> OK, let's see if we understand each other correctly as developer,
> before explaining to users, taking the 4B model as example.
>
> The 4B come in 4 physical variants, depending on the amount of
> DRAM: 1G, 2G, 4G and 8G.
>
> We can not allocate 2G on 32-bit hosts, so to have a reproducible
> guest behavior on 32/64-bit hosts, it makes sense to takes the
> model with 1G of DRAM as default for the 'raspi4b' machine.

At the moment we create the 1GB version on 32-bit hosts and
the 2GB version on 64-bit hosts. I dunno that that's ideal,
but I think it's probably best not to change that at this point.

> If an user specify -m 2G ... 8G, we can adapt the 'board_rev'
> register to expose the corresponding amount of ram. Now, how /
> where to tell the users 1/ the default is 1G, and 2/ they can use
> 2/4/8G?

In the documentation: docs/system/arm/raspi.rst .

-- PMM
