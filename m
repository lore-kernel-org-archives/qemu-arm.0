Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp1226107wri;
        Thu, 7 Nov 2019 08:59:36 -0800 (PST)
X-Received: by 2002:aca:de88:: with SMTP id v130mr4480080oig.108.1573145975895;
        Thu, 07 Nov 2019 08:59:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573145975; cv=none;
        d=google.com; s=arc-20160816;
        b=IR6F1xy/RcwG54/biRL7EKV3IYyGnzH2JUOuIkScJmCjyotxkD6dHGp/k8FKB9xzmV
         QREG9cGyoqwU0lwFGLaBcTbbK10ARI7SHPSaaB+n6c8yozGqamk69k9zR5N17FQS1SxJ
         a5hQFZb5eU+SMfGgoxTN3l9EpPztOpq4N4nqiQ5uqboDem2+2kqieTXpYuBSbOsDl7y0
         T/2VzmJ6oJKUdhvVA0bFa0AM2PPlRlimsFmiRIZEGLlw/a0ArqkglsCIFXM82YP6SMtn
         WVfw5VezOLD3vgmb1didipfsA+QVxJcn12Wa4m9XsSMzJ8CZK3lJg4k0TsvwpBpHxJz4
         jjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YlTR4TdSPoOesve9OqxIozhrIPiBsAGxdnkBKhvgtrY=;
        b=mLNaFD5u97S4/GrsAwZQT/PRMuo/ouOokDmAiVSwCx0X+NTwQfGvp3UH2ldJwS7S6w
         l5w/lKz6Fxt90o1+R8MTgoet8jxHdsOMST8kjye1URqq51t1B6XONfr/0PxHGoR793+x
         141FPmfNQQ2UHjgjK4r0y72um3rumQ0cd8cPFymR4bi9RAjuWcb3MyptbEvphJsk7RQC
         dztE+YfkXIuktBcK9qw4ngQ88SaLEA4r7GGCNctKuPyATLnNZpx9a7/uqwAYcHfix82f
         k4FmPK8WTBzlEl9hy/uSVkwNU5mNFtErTkVOt8iUWgM7GBsB67xxJ/KHPsX117AqtmfK
         ohjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K8vPGoB2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 30sor2043867otj.91.2019.11.07.08.59.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 07 Nov 2019 08:59:35 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K8vPGoB2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YlTR4TdSPoOesve9OqxIozhrIPiBsAGxdnkBKhvgtrY=;
        b=K8vPGoB2VlBbIC2Tg4G3Pq/99ABraVY9h3aszfV2Io0MevfPb75Y9z8NJ0SuBXJCFa
         N3j3JyHon1wpDu7kHaLkUKm7MT3vWYasF+HbGqXFchpjsBEZj43tWtb/GOGbGOYB77V+
         uM3x1ylHoWZbcQYTs74j95rSWb88jAMerxnGaXxtdZGUhcvdL1KXV+fAtLjGyv9AXmsv
         DLolkTjPpJS1QiBhVZ3n3LhFTkt3DQ00nXehLzNy+F274JV9beZxGjQvIUXKZI+oikjs
         lne9ssA89GWUFnn9CqCSVVPUx7QQVIAg1hnEnv8jH6AoADKXRaqaNtfoDEkSbSdTZ5/v
         91yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YlTR4TdSPoOesve9OqxIozhrIPiBsAGxdnkBKhvgtrY=;
        b=auaM7zmjdvDylUsB6zpPZgfcLl7oGgs2qz4A8Q7CeLPg/tJi+RwLK45yffxtqaoxNd
         zPyGMEP4V2XrZkSkBqM53aXbZU6CBPgaUR7d4JrFhI2ylpMvzl48LtTtjo8FIzXRuPDA
         A6Tb2R5s3eNF14wPLgXdk5VbXGr5SXwL/BV4lbr7imDHR+2bY87t2HJvQsy6/yJnAwBO
         NnHz56RG2uDdBAHvnKDKnwm0T/OTSkl0lJ9INb9J96N8faDcPo2LfsqGzpSTQPja1/Um
         VlHhmyxuSJlUExPHWBl2tkijc6w5qNF3qbiqBLEHjghcpEenPL0x8Kjz/HT0Us3BElTm
         AD6Q==
X-Gm-Message-State: APjAAAU/wo+feiyBmLTn2DSJ2CHeyAFmiOaqJHiqODXODPz313BdKY3I
	Rt2Z8bkDZhsULbit2jqOtLI7AvXWl5Q1kC2yDhIH83ybAWZKlA==
X-Google-Smtp-Source: APXvYqzIxmerSzgEKKe21KM237lxkZgTuMYSklK0IoD9d58+pfjE4DhN4pZiFE/zWcCTMexUHKANrqbFVaJBt80ZPqM=
X-Received: by 2002:a9d:6357:: with SMTP id y23mr1878477otk.91.1573145975246;
 Thu, 07 Nov 2019 08:59:35 -0800 (PST)
MIME-Version: 1.0
References: <20191105234100.22052-1-beata.michalska@linaro.org>
 <20191105234100.22052-3-beata.michalska@linaro.org> <5c75bd31-213f-88a4-2eee-0046f99f65fe@linaro.org>
 <CADSWDztHetgmbUOp4WyRAkR0daAG6kkwhUTcyKWiCTWHQ1XB=w@mail.gmail.com> <87lfsrhbf2.fsf@linaro.org>
In-Reply-To: <87lfsrhbf2.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Nov 2019 16:59:24 +0000
Message-ID: <CAFEAcA_CTNu0Zzc-carvJaFbqtDm4bftN0QCB6dksKPECMv-+w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] Memory: Enable writeback for given memory region
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Beata Michalska <beata.michalska@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Juan Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	Eric Auger <eric.auger@redhat.com>, 
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: NYCZxxfslvhH

On Thu, 7 Nov 2019 at 16:57, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Beata Michalska <beata.michalska@linaro.org> writes:
>
> > On Wed, 6 Nov 2019 at 12:20, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >> qemu_log_mask w/ GUEST_ERROR?  How do we expect the length to overflow=
?
> >
> > In theory it shouldn't, at least with current usage.
> > I guess the probe_access will make sure of that.
> > This was more of a precaution to enable catching potential/future misus=
es
> > aka debugging purpose. I can get rid of that it that's playing too
> > safe.
>
> If the internal code might get it wrong and that would be a bug then the
> g_assert(), if the values are ultimately from the guest then log with
> GUEST_ERROR as Richard suggests.

...or consider asserting at this level and making the target
specific calling code sanitize and do the GUEST_ERROR logging
(it can do a better job of it because it knows what the
target-specific operation that the guest just got wrong was).

thanks
-- PMM
