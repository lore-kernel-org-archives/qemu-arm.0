Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2836705wre;
        Fri, 25 May 2018 02:35:14 -0700 (PDT)
X-Received: by 2002:aca:b4c2:: with SMTP id d185-v6mr874631oif.76.1527240914400;
        Fri, 25 May 2018 02:35:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527240914; cv=none;
        d=google.com; s=arc-20160816;
        b=E2YOv5p0kiTh8LRW6dE93TJZ0rmfkgXeoO6Px5ZgCyZiI4XBI44ujhLfE765wVmIai
         3OYSB6RgrTirLz5+l5foWfc5VGoBATq4/MZCdfGdd8gdpHEpNnPrEsSw6e61pmDeXsWg
         0fx33c3OxzrtgeHVmbSZUrbIG9Gm3v+PRZCNWh/NBKhVqBG/Yl0i0M1853jIIXsVV318
         AED/EK6jvEFQKkmwEh0IlCQk4zz5pNGF8HC4Waql+uIQZdolXqapPQumyO/l1G2i7EA6
         QV4cicrsaJzX9EcTPSUdVkwT1gdkU/Jsm3YJy9Q26PJbgnEx2gRscTJStrSKDa4+MfbV
         ZMCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=4sGa3/A0E/D93yl1H3oR80+yfaeBYD+50aq6IIxD/iw=;
        b=OsqXHkf+Cgzed+mZSgqOw5UWzrdFHz8VmAW+VMs8NeT4/nJDRynDsR9gNkhaYD7M/h
         3iM6A/2G4Qf4X2aNsQIDYaJ340nhFOni8Gi+pH6R2hlRQOkEDwmXkE/1d1gF4DOep/5q
         8mRI/ryMh4PbGVMYbRreuGrPCRSTBMU8PVL0X1tRrmObkd16VvO/D7bOwnGi/1ApCWyA
         uVEht0AtHX2qxXXVNgcVkwRE8K27lHbRkUZ2ThPRPwapB/uDP/k4w/6ERn2rmBW7ypK0
         BjS05yazzcM/0G1ua+KcRZyStmI/hMX1Het6Y2lWuw1pxeU8gYAOPNQJ/VeMzuOA3hv3
         4IvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TYC+d+r+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b202-v6sor10859636oih.242.2018.05.25.02.35.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 May 2018 02:35:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TYC+d+r+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=4sGa3/A0E/D93yl1H3oR80+yfaeBYD+50aq6IIxD/iw=;
        b=TYC+d+r++nQYqktKhet+dcmMWfgaXU2nvFgssAdUwyMElm4tpxE/EpEpcp8q6IqMcU
         4k4uG7hvSvrvG7Kipg5cL4LilwmRj4D34D9LGmoopZIUNkAlchTI/OgXAfXR3Uyueo8P
         b0TpLo/EJsuMb3GW3rpkmu5FR4tGqKWEJkykw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=4sGa3/A0E/D93yl1H3oR80+yfaeBYD+50aq6IIxD/iw=;
        b=tagYp1UynLpF5aOpw8wyMwLfDBiI5S+hQy5QGRDIJAMzunUBsrFLOPsdWy28KnEJ7G
         yVuJTBl+Xhx1QjcMnVTJDzyREC+pdIGOG8spqNpYxjMisziIoOwMR8wacpL/i8sEYtuo
         /GfQb2KAI24570BxaGps5NSe2YWho3PFHFQuUN0N/guIxlYCiWYivJr/BLjYLqOkDYcg
         mFySPWgGvLQeItnH7c7z4zY8m/6UBWqF70XDj0HA8qT92SKE4EtoUCoBea9FCDtAKZwU
         P7SH/szp+hXNfIzhQFpdZoUfWxyipE7Ap2NLXKmxirA94YzX9WvpTFfgNRMnWsoSau4i
         5oPQ==
X-Gm-Message-State: ALKqPwdtKHkhj6qtVmPlAyX/7xh1a3OTm4QSnzMPdxPNP6IqNG1nuBVs
	ylJtDr0olI7dnguaconhiGJqNORichGUb0dSAGbD7HZk
X-Google-Smtp-Source: ADUXVKJzH/DWkXH0F+fpUXZiugfYzZYZdN+LCsyKXAggHOU+rHYjba8acVF14lRWX/Je4GufmwSvWanxlk9n/G0DVls=
X-Received: by 2002:aca:4384:: with SMTP id q126-v6mr792402oia.164.1527240914043;
 Fri, 25 May 2018 02:35:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 25 May 2018 02:34:53
 -0700 (PDT)
In-Reply-To: <5f966d9b-1eb9-f447-69bc-2d93df4c6d2b@redhat.com>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-15-peter.maydell@linaro.org> <20180522030333.GB17282@xz-mi>
 <CAFEAcA-iOYhuPfvDv+iD6jBqXMXqN-jfTpSSBub1Zp1i-JcDbQ@mail.gmail.com>
 <20180522110236.GB31932@xz-mi> <CAFEAcA9b6dmpj+B=SO2YsB5sXsh=UPjkjN_U0i-uJhiDn20HHw@mail.gmail.com>
 <20180523010636.GC31932@xz-mi> <CAFEAcA840qn7Ms9hph9zzZgMbL8C7kN=cs4esGO9kxGXsgBg1A@mail.gmail.com>
 <20180524062352.GA12122@xz-mi> <CAFEAcA9SXirTw=H3wznVZDTmO1OB-LRNJAQ1MsyYm62SqvMqRQ@mail.gmail.com>
 <5f966d9b-1eb9-f447-69bc-2d93df4c6d2b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 May 2018 10:34:53 +0100
Message-ID: <CAFEAcA_emEZrZk61xyJEY=R_dAtB0yfg_3ML_zQFbS0dWC9XLw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 14/27] iommu: Add IOMMU index concept to
 IOMMU API
To: Auger Eric <eric.auger@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, "patches@linaro.org" <patches@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Alex Williamson <alex.williamson@redhat.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 2O+mo++KKqau

On 25 May 2018 at 10:27, Auger Eric <eric.auger@redhat.com> wrote:
> I fail to understand the PRIV attribute usage in SMMUv3.
> My understanding is the STRW (ie. stream world, kind of indication of
> the exception level the SID is used along) in the STE is used to
> determine the correct TTB*. Isn't PRIV checked against the page table
> attributes only?

I haven't looked too closely at the details for the SMMUv3.
But basically if you can return different results for
"transaction is priv" vs "transaction is user" then you need
separate iommu indexes, even if the only difference might
be in the permissions. (This is because an IOMMUTLBEntry
can only specify one set of r/w permissions; it can't
tell you the permissions separately for priv vs user.) If the
SMMUv3 always reports the same permissions and address regardless
of the transaction's priv attribute, then it doesn't need
to use separate indexes for them.

thanks
-- PMM
