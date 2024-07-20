Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1168622njc;
        Sat, 20 Jul 2024 15:11:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKQ6BxvwdX82MNKt1/LaTHFV9qtKOedHX27DI8PiK55mosZTcXa3QJNGKde+WylcBRyc936CdrXHdWUY0htiE4kKNXX3yY
X-Received: by 2002:a5d:4e41:0:b0:366:e09c:56be with SMTP id ffacd0b85a97d-36873dc24admr4430462f8f.6.1721513512628;
        Sat, 20 Jul 2024 15:11:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721513512; cv=none;
        d=google.com; s=arc-20160816;
        b=dSCy2SH5albyXY4STSvDIVVnSszgD2TpVd002ORnfSN4WO68uFjkdUlxlP/Q/qtKdf
         LLNJDK4yASHCUl/9S4tAfDuSCGXlJE2pbccYRAugfQcxBQXRnm5+LvRv5lN84zoNF0JY
         w3yXkWA2yhHHNndZOrCX4HWrKn9f52N5yDvgA378yfRNflYKHQDBIyH5cWrvl7e3a9CN
         Rs+E3VMvI/FR05wOwEf35ueKRh9d7tPRgm4fMwZsjKoVml4XkZ8M5nVb3KGOX8vOdPca
         dqp9VTXGN+RWDjeiEjRsRrrcjrp1nCzNTMsJsjeQ+9A4cwTjZNADYn5ieQZpCV+nnBzW
         MLQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=FDH9b/hMRvMUcJMBkMcovYtJEAbv1WVdTz2/dbvxC1k=;
        fh=0L2FAfwUkDo3d6mOEavVb3yVAgnqJ2sSAi+ltPRX0IE=;
        b=TtBqm4f5lCiIdjEAz6PZEvoxsMw8oR/9duKPHICOFP0+Q3Xmz9pRKg4TzROc+Md8Hp
         C1OG+vUCX868LwuSBuFuZE1oSe9wBivB4QaFJU1eP8FyPyDP3yPuffvGyNHoBNjuVTph
         6uuTa8fiE3M7m4QqsbH/q3HN8VlpXDf85iivruKBvKfqWKcPNJvst8Dac+SX7hCW9eiG
         C9QmXx27WH9ty0r3RO+r+U+J2LIQmoBuKCTtNrVnkcCHs0D5auJxAmCEPf0OIQ0TZ14e
         BvMuizAVfygIH7TgzSVyT+C5XI1yQdu7keBrrj6t7nBJ26wu9f7NF55erni9ZzZi/ir7
         YWPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=uH0D7Ecc;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427d2a11237sor1446635e9.1.2024.07.20.15.11.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 20 Jul 2024 15:11:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=uH0D7Ecc;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721513512; x=1722118312; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FDH9b/hMRvMUcJMBkMcovYtJEAbv1WVdTz2/dbvxC1k=;
        b=uH0D7Eccx66eNI65IcSN+HtujeLgpOBLyTQGujK2kIjnTFQqTZBXvx8wBnyjq3ZmsI
         lgFladIGrlZcYqyznBnaTI9Q8GXCm0QkeqHo4mBG1zMGJbcY3eXpmTDVugIOlkLFQ/tA
         U3/1oA5E6IRzxzmGpwbkcDlA1YiOGZKhQE1QETQoiqCA3pM/hFtTQBT2SURpGuorRyBG
         W7R8qqeRA/OAyHw+dGDSclAvTI/vFes4bSklMv7zmP1yhlwDfIGPBFthqoG4QHcM597v
         QkauiDCkn/K4zjziypYkA2fZCQTXsLS9d1GWiAx5twL383TgI1cPVtppu/TjU6gQLYAA
         QTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721513512; x=1722118312;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FDH9b/hMRvMUcJMBkMcovYtJEAbv1WVdTz2/dbvxC1k=;
        b=OGgEF+39l80S/vLgxM1JeQRsRr790TcBcS2tlnyO64eKO+2Fa5c/mRlQ5CT9+otGdM
         kA8rfmP/MZPE0Nyj2Q0Kuv6omWXIIj+Ou6f+fuFCMwlEVcyNe9zxF9z3JNmA7iLEDWvS
         JY52dPuGD2viHWYw+Qt9hFXQACx3aongzbHiT1gF333wGN/+n2sKXgDZACLse6RYuMnQ
         5cQ9/eZdPsUaL83gmp0KrA86Ad9Z/rvDs6mH+FG0TfqNpu7mygxHgyteneBsb3ZoQA2L
         R8X5C7DSQ1brSm9GSecupJPy42gbiowo9tejeWonQ2q43Wvq6uvHgNCvyhyM+9+A6660
         mriw==
X-Forwarded-Encrypted: i=1; AJvYcCXCUWEF2edWSYJII8eNR6M1UtNQGVC/h32ymmHzfbVla7lugkg6BOYZD1/qL/mmzT61bneNyCiuuqMoh67rOZnL421QkKAi
X-Gm-Message-State: AOJu0YztLrABzuQ+WQKq0wH1rCNR7kxZB3fjKp3BJ0njlz7A7hlsh4MA
	V31UkRdPeqWGedFv/irK+tOIcmNKHBK2dGOc22RRZ0Y4++meL9tWSgAnAl9bMg==
X-Google-Smtp-Source: AGHT+IFzrZC0RbZzhipr9RyQZLh69/YXpKDOqNrWXbGdRhb9dEzhJG87B3tL4aEpSQKGpCN6Iy+84A==
X-Received: by 2002:a05:600c:1d0a:b0:421:7caf:eb69 with SMTP id 5b1f17b1804b1-427dbb48583mr1086455e9.4.1721513511668;
        Sat, 20 Jul 2024 15:11:51 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (180.232.140.34.bc.googleusercontent.com. [34.140.232.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36878695a52sm4670208f8f.64.2024.07.20.15.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jul 2024 15:11:51 -0700 (PDT)
Date: Sat, 20 Jul 2024 22:11:47 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Julien Grall <julien@xen.org>, eric.auger@redhat.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.bennee@linaro.org,
	maz@kernel.org, nicolinc@nvidia.com, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v5 00/18] SMMUv3 nested translation support
Message-ID: <Zpw2I2ATUqDt19qv@google.com>
References: <20240715084519.1189624-1-smostafa@google.com>
 <20240717150931.GA3988597@myrica>
 <1e7e750b-61bd-4822-8742-124bdf66a7c4@redhat.com>
 <5684927d-d890-42be-841c-ece681502503@xen.org>
 <a0ee8ba3-174f-4d00-807f-31584cba42d4@xen.org>
 <CAFEAcA8T3Yrj_R-B2oUW_Uu3u5HZs4RY1P+A7zF+8xWJnmtpQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA8T3Yrj_R-B2oUW_Uu3u5HZs4RY1P+A7zF+8xWJnmtpQA@mail.gmail.com>
X-TUID: B5co7gertM0l

Hi Peter,

On Fri, Jul 19, 2024 at 04:57:18PM +0100, Peter Maydell wrote:
> On Fri, 19 Jul 2024 at 16:36, Julien Grall <julien@xen.org> wrote:
> >
> > Hi,
> >
> > On 18/07/2024 10:43, Julien Grall wrote:
> > > Hi Eric,
> > >
> > > On 17/07/2024 18:43, Eric Auger wrote:
> > >> Hi Peter, Richard,
> > >>
> > >> On 7/17/24 17:09, Jean-Philippe Brucker wrote:
> > >>> On Mon, Jul 15, 2024 at 08:45:00AM +0000, Mostafa Saleh wrote:
> > >>>> Currently, QEMU supports emulating either stage-1 or stage-2 SMMUs
> > >>>> but not nested instances.
> > >>>> This patch series adds support for nested translation in SMMUv3,
> > >>>> this is controlled by property “arm-smmuv3.stage=nested”, and
> > >>>> advertised to guests as (IDR0.S1P == 1 && IDR0.S2P == 2)
> > >>> For the whole series (3-9, 11, 12, 15, 16, 18):
> > >>>
> > >>> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > >>>
> > >>> (and I think patch 16 is missing Eric's R-b)
> > >>
> > >> Jean-Philippe and I have followed up the progress of this series,
> > >> Mostafa took into account all our comments and all the patches were
> > >> reviewed. It seems to be in a pretty decent state so if you don't have
> > >> any objection, please consider pulling it for 9.1.
> > >>
> > >> On my end I did some testing in non nesting mode with virtio-net/vhost
> > >> and I have not noticed any regression.
> > >> Would be nice if someone could send his T-b for the nested part though
> > >> (Julien?).
> > >
> > > I haven't yet tried the latest version. I will do that in the next
> > > couple of days.
> > I see this is already merged. If this still matters:
> >
> > Tested-by: Julien Grall <jgrall@amazon.com>
> 
> We can't retrospectively add the tag, but the testing itself
> is still important -- thanks for doing it.
> 
> Q: is there any reason not to:
>  (a) change the default to "nested" rather than "1"
>  (b) make the virt board (for new virt machine versions) use
>      "nested"?
> 
> AIUI "nested" should be a superset of "stage-1 only", the guest
> can just ignore stage-2 if it doesn't care about it. Or is
> there a performance hit from having stage-2 around even if the
> guest doesn't enable it?

I didn’t do benchmarks, but from the code, I don’t think there
would be a difference from using stage-1 only or nested stages
with stage-1 config.
I didn’t make “nested” the default stage or used it for the virt
board, as I was worried about compatibility issues (I think that
breaks backward migration), but otherwise I don’t see issues.

But if I understand correctly, setting that for virt board 9.1
(virt_machine_9_1_options) would be fine?

Thanks,
Mostafa

> 
> thanks
> -- PMM
