Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5047375wrv;
        Tue, 6 Aug 2019 03:01:22 -0700 (PDT)
X-Received: by 2002:a05:6830:1319:: with SMTP id p25mr2476640otq.224.1565085682309;
        Tue, 06 Aug 2019 03:01:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565085682; cv=none;
        d=google.com; s=arc-20160816;
        b=ns3ugOybdAlDXeN7i+E78eTw4kEhTJ6KA8TpuU7S77hzqNFU6YTM/Q6o9GYAy2WR2b
         mifYubtWEd712AKpJAqZgqBOx4rDwPnfBwVUzdewTfUtN10BtPMYnf6wRtsx8D9jZaRq
         aCD2H2vDWDXBrCc8SWfGgJM7FvBDzAvrimsWqqRKOr20IeNEPw0ApN7SqcqoQClZn6wM
         fqU32khaLC76bmdnaKbxCrpq9eejRDQ3Izlh2NPNJIljZimSsyKy1sfHDyNyY8JxACvJ
         dLJw1tX3FEzjn4Xga/bVUHhrQsuCb8tFpSRe03yZ/F+CxBpaSri/qUo56YWrYoZJxS9o
         gu9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OyCkWYd4rR9Q+Suj817p2WoAsuYr+I0FZ+hkdGRfV3c=;
        b=RpgABJwbHuzEXX9McWD7G3wttBgEjR4BYUF5soq3jFEY57EeT8uAdMeYCU/0eZD5oX
         LSlYXLGNZA1DAWJru6Ufpek8LigXIE3xWre3UI3czeq0SwmRZPmBxOGOV5MRfG70HVIZ
         WJNXmRfJnmKC+VMvPnjblkAUDta0M/kGjkneh/+sq2eztxApb+31IXvvQnD4qCzsSmA5
         Y+IVA1SngFQSqS++08iy+OYZgtFdjVaQJO60rWy2m4IndoeXwnsYh+9alFyLGtwo9HU4
         k+aQkOyjIm32J/Jl1Ar0Cyo22tD8o+uNlpCG7c8gYEY6Z0PhPtRhDUFJFePTofWyvUVk
         oQzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z4iZ23ta;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 100sor45489893otg.71.2019.08.06.03.01.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Aug 2019 03:01:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z4iZ23ta;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OyCkWYd4rR9Q+Suj817p2WoAsuYr+I0FZ+hkdGRfV3c=;
        b=Z4iZ23taEgEeTDYfZCBlLw1Ljp5ApuvHcd3EKiCGwFNd3iM9DjgXwO7BRFwiBLfTvr
         +5gapkcyKfHHUlSO4ynABfo8wBMj87/niamQ5cAh51grf8Mgik5SCbRTpXMS7dTehmbF
         gZ+XspEFhJc0AWRRt9IYnpCoCLac/zRXzoaKzhn/FH6TI0vCmfNMk4emrdZ68gV23rLa
         SXqmXHBL0SRiB5hM57/pShLm7Dq6v09hOLL0+blaUa+nrEgq5imarQwc4OkkbKDQ5Dum
         6Ki0rrSN5boa7ELWJCgfb6sMwMA6VMz/opPzONMDoJ/c9PVqSqQcssK/wOf9AdFRevMX
         FJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OyCkWYd4rR9Q+Suj817p2WoAsuYr+I0FZ+hkdGRfV3c=;
        b=HtQiQDsza9hPnkiqUD80Di+U9eXkyWK+kY6lO4JqGUzV/YxwrT687d8gOwThGAG2JN
         06ZAuM2s1AAPkC1h3dJNjinQBXKhn/6NhyLHFTyH4Yt2cJem2kso0AcCgy4D/wwjtdRG
         HoXVc65MNLcByQNAQHpV2wYL+kf/yTdjk+opyOILX29yQXs3GzElnv+DtyuV19QhabAM
         +6seOo5clW0Y96wLfHoSddJnD47s3Qt/dVFRnwQlqrxwOAgM0Qf8xtW/FE7r4g+Q770R
         Gt+/lvkhcq7xqczSyn3DKMe7yozxX9MTjw139Flj2+WQw4LZ/XWG4HY0exuVuCaaesGG
         T3Ig==
X-Gm-Message-State: APjAAAWhxSca0+VTYRRCUpNHpzzM07Rc0v7CJjSSvTJMVf0WiTVv3kcQ
	Z2PBvnik887UDJGFgMAWK1ZjNzvilX8I178IMJRv95WE
X-Google-Smtp-Source: APXvYqwjgN0OJG4Xw+aMuYsKoc4K0duH+s8ErPXEkBAxpJq5g/0E1CNjkt14ma3vF5bvCmDbki44X3pW8JTIqOQLi3s=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr2498351oti.91.1565085682005;
 Tue, 06 Aug 2019 03:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <CAFEAcA_JDfN+Njo8J0EhbtECWEW5_LcCVehbxmpY6AX3BLbOsA@mail.gmail.com> <d2b6ae73-6f48-1808-fb95-631bc12834f0@linaro.org>
In-Reply-To: <d2b6ae73-6f48-1808-fb95-631bc12834f0@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Aug 2019 11:01:11 +0100
Message-ID: <CAFEAcA91b4FpbiUnZCVbs+nPvLo_q-iKwWkx94yxpXrZDnLhcg@mail.gmail.com>
Subject: Re: [PATCH 00/67] target/arm: Convert aa32 base isa to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: mZXTbETjzKz3

On Mon, 5 Aug 2019 at 22:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/5/19 8:44 AM, Peter Maydell wrote:
> > On Fri, 26 Jul 2019 at 18:50, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> This unifies the implementation of the actual instructions
> >> for a32, t32, and t16.  In order to make this happen, we
> >> need several preliminary cleanups.  Most importantly to how
> >> we handle the architectural representation of PC.
> >
> > I'd be happy to take the preliminary-cleanups part (subject
> > to the various review comments) without waiting for the
> > rest of the series to get respun.
>
> I had an outstanding question re patch 4:
> Message-ID: <c7a3ef78-d541-aa0a-21a5-8b4f48db1fd7@linaro.org>
> https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg06520.html
>
> and another re patch 6:
> Message-ID: <09b930e2-0a92-25a3-4e26-8bea1f437039@linaro.org>
> https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg06508.html

I've followed up to 4, 6 and 7 giving some thoughts on those.
Anywhere I've still not been very specific it's because I don't
have a clear idea of the right thing, so use your own judgement :-)

thanks
-- PMM
