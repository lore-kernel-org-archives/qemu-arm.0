Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp541004njc;
        Fri, 19 Jul 2024 08:57:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWJy5szRJjaQ8Z/5FB5wGEPY/XQ4REzvkTC7l3S1XEMyie2VibdM35RZpW5uyXPp0zVFCQL3w6PtgZRfHdBqegMZxBoWaeD
X-Received: by 2002:a17:906:408b:b0:a72:4b31:13b5 with SMTP id a640c23a62f3a-a7a0130ce00mr553636066b.54.1721404650258;
        Fri, 19 Jul 2024 08:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721404650; cv=none;
        d=google.com; s=arc-20160816;
        b=tGa0/4OA29fKgnQIOqMWd44mOtYVt/ee7ALQcxOx2PfsRzjupnpQYnKPu5SCfEqh3H
         K8oEOI/BG4hd8hTRPsYKDAdhtvsTche/mdpteszXpPYobDRp841njcok3C55h8jQ/R7y
         JgTDhsRV+iAO8CSWqnt2nscSJy9I4O00J8gd9kFvOXSMgkW5gPqmEzJ6XN1nmp3aBb7L
         hyrvexl3u1F6fGXYtSLBho3gTi+EKoeX5hAk7ikgUrim0J0nmxsflLRtXhelesz48wbW
         fEyATOPcDxllIpetfhUjba8shi3iPBHY4eaQdbt+S7ygQgabTyOXrEMvJj5kgDc0NY+m
         I7sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kHKYSk2rntYjXFgiuT67fk3WNMoT57UruY+ot61GLIE=;
        fh=j1LGUZeyNY3bjq+hJrFZr/YaISJA7wE/5wS7VvQ6zIo=;
        b=JKKPnHZ74dwJ6ZRPRbIj8whSVb5ycx6Oa7wszOmJxAojHCtQOYdu5SHTahwnVE9ulQ
         +DEKGrdYLRHD4h9IQ7seB66cp2k9fAEn0KXxXIMDnlS1TKSQjD4Y2ayKCnNgVN1WgRDk
         k9tAcIlLFKsDrN2B2AK8Sslh0r3o8Y56fBGkKRCZ7cuaRwHoAZqV8xB6KJ07RB4s9s22
         wkoF44XO6ROffok/V80xWJ/eu1EQ3ziV52g2m53p8N5JR1wiREgezqN2owwfDYHc0dRl
         sUj3xcOggIHZ0GwbyJcSL0g0Xc/BKElbQu3OGREljNHDXa+ixicqFjb+bJVBfFWX0/Pm
         +nrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B5Gbb3sl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a7a3c914bfasor21230166b.18.2024.07.19.08.57.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jul 2024 08:57:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B5Gbb3sl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721404650; x=1722009450; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHKYSk2rntYjXFgiuT67fk3WNMoT57UruY+ot61GLIE=;
        b=B5Gbb3sleUnhFp5rTlALWW/+pQzBzMQEkoQp9n9+cIImUsjagUJt0G/+btAAbB0ps2
         OfgkVY+yfoipWZ6KvB++2+IJWeJwUHyEFlLgoHY4UJDs3U03o43cjLX5muC/sf9fB/ai
         c0Yu6vOxTlmCHPZ2zJ93X5Ty82Ui3/jjBaTk/3e1b5l6k2b/YrnEltqM2fDHpR8QYW52
         bLpkzll7cTOMFhZcHTDlGBbdslkkDjMT9Wi/XGiegdxkf/WxjnJacs2iSmcONDQl3XvJ
         g9Sl83EXv5pX4KYVzumC15UPu2dCtpAbP7Pe02ZliNF5JWrFXh81oMSc3Ne4MJGnVy11
         u4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721404650; x=1722009450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHKYSk2rntYjXFgiuT67fk3WNMoT57UruY+ot61GLIE=;
        b=LaSDVG+xTyMC11RJY7Mw7EIE6JM0R+teeaRIMJbLZL1XcCK1T0Cty+rAAnpd5FfDP4
         cYnnMd6Zin0t34EzNa0eJupTKZz/mrWwBYcRECuBh8lRFN65B+Ta7NwAoU/miZn1a1bJ
         D0IQPcjOZW2VRzNFBkqQPW9LrUemRAUoYvgtNgTohhNm+f3j5DWDpICBf8dETfvhHEQR
         vEU/Pu6lIqRqBTqDO56ad7XPEumh5xPChtrcpJDSn4og/GHwQF+86gedcsbAtIeuN09Z
         NqsoseGCtYui7NK/jk7pQBs/DR3L+euUx+jkLS5qMLWtElyogbxn9jfj6I3JJUBCPl1U
         xgFw==
X-Forwarded-Encrypted: i=1; AJvYcCUsqhftzSzAK6HPnpcKZMHB9d844ZtV0Ui50L3bq4BaI3K0yrwLhkJ8HwVEnT86hGhceXeVUhuoWP1pW4MrENKxwIs9CJ6a
X-Gm-Message-State: AOJu0YzX2WKoKQqXLraVAm9gPuxFaTBx2SgNXHeQa8Ii59DKxe5Hq9tG
	T7oU3klbKFOaZ8MyCQYG5PfFYb6SPW3aQfDCkc1+hbkCubfb5yhDHTqLgNmWWfJRFEivv5oHwaX
	QzxVxgGUGlNP4spZb2oIWatrdz2LkUgjFKIFfHVTO
X-Google-Smtp-Source: AGHT+IGteFRfnddU5H8E9FQixzUwemfNrueJflRVOGZ4o2OtmI+AUY0qpTKBPEwBryjfnAnCiiqtQbgnUL6w3tLcd3E=
X-Received: by 2002:a05:6402:524b:b0:5a2:838a:15fa with SMTP id
 4fb4d7f45d1cf-5a2838a16d6mr2596281a12.15.1721404649620; Fri, 19 Jul 2024
 08:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240715084519.1189624-1-smostafa@google.com> <20240717150931.GA3988597@myrica>
 <1e7e750b-61bd-4822-8742-124bdf66a7c4@redhat.com> <5684927d-d890-42be-841c-ece681502503@xen.org>
 <a0ee8ba3-174f-4d00-807f-31584cba42d4@xen.org>
In-Reply-To: <a0ee8ba3-174f-4d00-807f-31584cba42d4@xen.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jul 2024 16:57:18 +0100
Message-ID: <CAFEAcA8T3Yrj_R-B2oUW_Uu3u5HZs4RY1P+A7zF+8xWJnmtpQA@mail.gmail.com>
Subject: Re: [PATCH v5 00/18] SMMUv3 nested translation support
To: Julien Grall <julien@xen.org>
Cc: eric.auger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	alex.bennee@linaro.org, maz@kernel.org, nicolinc@nvidia.com, 
	richard.henderson@linaro.org, marcin.juszkiewicz@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: +3E0yggoCjED

On Fri, 19 Jul 2024 at 16:36, Julien Grall <julien@xen.org> wrote:
>
> Hi,
>
> On 18/07/2024 10:43, Julien Grall wrote:
> > Hi Eric,
> >
> > On 17/07/2024 18:43, Eric Auger wrote:
> >> Hi Peter, Richard,
> >>
> >> On 7/17/24 17:09, Jean-Philippe Brucker wrote:
> >>> On Mon, Jul 15, 2024 at 08:45:00AM +0000, Mostafa Saleh wrote:
> >>>> Currently, QEMU supports emulating either stage-1 or stage-2 SMMUs
> >>>> but not nested instances.
> >>>> This patch series adds support for nested translation in SMMUv3,
> >>>> this is controlled by property =E2=80=9Carm-smmuv3.stage=3Dnested=E2=
=80=9D, and
> >>>> advertised to guests as (IDR0.S1P =3D=3D 1 && IDR0.S2P =3D=3D 2)
> >>> For the whole series (3-9, 11, 12, 15, 16, 18):
> >>>
> >>> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> >>>
> >>> (and I think patch 16 is missing Eric's R-b)
> >>
> >> Jean-Philippe and I have followed up the progress of this series,
> >> Mostafa took into account all our comments and all the patches were
> >> reviewed. It seems to be in a pretty decent state so if you don't have
> >> any objection, please consider pulling it for 9.1.
> >>
> >> On my end I did some testing in non nesting mode with virtio-net/vhost
> >> and I have not noticed any regression.
> >> Would be nice if someone could send his T-b for the nested part though
> >> (Julien?).
> >
> > I haven't yet tried the latest version. I will do that in the next
> > couple of days.
> I see this is already merged. If this still matters:
>
> Tested-by: Julien Grall <jgrall@amazon.com>

We can't retrospectively add the tag, but the testing itself
is still important -- thanks for doing it.

Q: is there any reason not to:
 (a) change the default to "nested" rather than "1"
 (b) make the virt board (for new virt machine versions) use
     "nested"?

AIUI "nested" should be a superset of "stage-1 only", the guest
can just ignore stage-2 if it doesn't care about it. Or is
there a performance hit from having stage-2 around even if the
guest doesn't enable it?

thanks
-- PMM
