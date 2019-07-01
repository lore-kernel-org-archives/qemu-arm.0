Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2784777wru;
        Mon, 1 Jul 2019 08:42:09 -0700 (PDT)
X-Received: by 2002:aca:c681:: with SMTP id w123mr7350184oif.32.1561995729052;
        Mon, 01 Jul 2019 08:42:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561995729; cv=none;
        d=google.com; s=arc-20160816;
        b=sMKoslNhQJ5Piz6dMlbNkqVJJk9RHbVYoVGf5GCJBp2F4Soj++pin99+8GDsvDSISh
         1Dgq+OSF5CS1hLtxIoFDo0cdazR7Eh+6X6B2ebxKq6K2bByE3ANBwgeKAIYUq0Z+kehE
         OejWHPuyOcKtLudX+TGWMB+FvM4MhwiWikNcq/4HxjlvzavYONILc3Rak5aNdiNtZ91a
         mwuB3s0MFCl7L72IdAyyESSnlPmDpL0H8oLTh8yA4SbchV55l7SMntetN0viK558xWLo
         D6K1XNzY2njAwnr7dDqY+Yf25l0A6iQVrD1ZmxczNepygjIPGFAIQO64Kgt5x4uSCKKP
         yRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NMAqTIq4T69gLVpMEjj3jVOxgFLDjZ/zQ0vNtEgbWVw=;
        b=j4pI9g6yymEjJ7lOr9oNxPemJ67wKppP+WjJjg95SH3PVCYWOVNOxtolw5QWoAjzwt
         DPd2m5sbub8Gg0H1MULXK/JWroUhvG/eDgOLW8DiLqgiCozje/iD9Bbii+m3pY5a4U9N
         Heqg+ttAPFnbK35mdckpbPs0fjA0j0IXlumEjVmS9iO5CHQxbW5QbylsZB2q+85D8MMc
         +DvtclK/A49Vxs7hp7TNKfl1u7vXlqJ5OY8z8b4CotpwfrCdSauXtV09XA2WlsyXqWHu
         GbntcBaJdkUWZ4qFtyWgy0FG2WOmuhtb3CHZ98SNZXPMyqdMw1kExv5jbpOIKwvLC23F
         fJZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rS7iR9BX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c75sor4926870oih.142.2019.07.01.08.42.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2019 08:42:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rS7iR9BX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NMAqTIq4T69gLVpMEjj3jVOxgFLDjZ/zQ0vNtEgbWVw=;
        b=rS7iR9BX+yBa+Q3mJrdoTNFqM9fnVGwWjzPnHv1IZG5ubepOCsilrL9QlWj1bRZXo/
         0U/YQfILTMQ5pbLUSJpGvAdRwzhv+KfaQ9aHTJv23tY4c20B1D2n/tCYXttJh7PL9Ul+
         oRtUHbB4UFMkZv8GpfGCwxD0a2jf1pYkAAIaF+1/Wi5xgMwOOsWROpddywlCf1R2sIBY
         eg71tADGli0Ri9AtiANf+Y/LDtN3pwaaPW9Y1vfo+ofqIQkRhOe0jYGs1wrdUa/hfs6J
         JmuFIJYWd6EPMr0zdfBc+lb/qhq+lxe8SenuIghSWBX/EdUF0o87ToeQa13foegjDXcg
         IxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NMAqTIq4T69gLVpMEjj3jVOxgFLDjZ/zQ0vNtEgbWVw=;
        b=iRPsHAP3HaYVapHpepvZOOVhM+9MzCNJlwLHdOsh8b0Xvgbez+TQ6LcsI4YUitiTiy
         j7qqlR2Uw3bzYHbjL+xRBPsBkRv4nKCCT7JNmBI9m6Gl6kRs1TaMZGel3mJlMi2gSyz2
         VisWV3g8kX/f6jYRuxfGWTRy7L8oPlb4ypQdGtuBKMurQo7ZFjtrGagjcEk01816xcXX
         ymXnD+GqWGeiiJisBar5a4Vlh7PZ7RJZZEpeix+K4NDws3HIT7Ys6UqO818QWFezd47Z
         YTtm1p43FIEHa1n/Rp8DbltHRTixPun47yuYYVnyAqDD8xj+Z4jMKMCOiytn+Jsukr9E
         jdWQ==
X-Gm-Message-State: APjAAAV72NkxxusMN26ItnfVtvjE55A0dyRCDPObBetuwH2/05lAE5l1
	pj+7OPqMBp73SlNQnPpFjkLBo/wuNJ/X/8AyKXV2Vx4lwRBuGQ==
X-Google-Smtp-Source: APXvYqwY1tjjpA5v2wLi0JJJ19cIDE24eZAUIJeXVvG9EqgZmXAEZPp2DcfVBM8W8hrdlGFAsUdnh34b0UeOZu27+Q4=
X-Received: by 2002:a05:6808:d4:: with SMTP id t20mr7354091oic.170.1561995728528;
 Mon, 01 Jul 2019 08:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190701132516.26392-1-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 16:41:57 +0100
Message-ID: <CAFEAcA93x6zkbHe1hdg0c8cbo9ErSByP+g6UvwZefxn-6346zg@mail.gmail.com>
Subject: Re: [PATCH v3 00/27] Support disabling TCG on ARM
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Yang Zhong <yang.zhong@intel.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Rob Bradford <robert.bradford@intel.com>, Samuel Ortiz <sameo@linux.intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: +++xpSqgaHID

On Mon, 1 Jul 2019 at 14:25, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> Paolo motived me to salvage this (other!) previous series fromi
> Samuel Ortiz (NEMU project).
>
> v1 cover from Samuel [1]:
>
>   This patchset allows for building and running ARM targets with TCG
>   disabled. It splits the target/arm/helper.c file into logical TCG and
>   non TCG dependent files so that one can build and run QEMU binaries wit=
h
>   or without TCG enabled.
>
>   The rationale behind this work comes from the NEMU project where we're
>   trying to only support x86 and ARM 64-bit architectures, without
>   including the TCG code base. We can only do so if we can build and run
>   ARM binaries with TCG disabled.

I have applied to target-arm.next:
 1-12
 14-17
 19-21

I had comments about 13 and 18. 22 has a conflict when I try to apply it:
I think this is just accidental because the functions it's moving are
next to changes in patch 13 so there's a minor textual conflict, so it
would be fine with a fixed-up version of patch 13.
23-27 are still RFC status so I think best left for the next release.

thanks
-- PMM
