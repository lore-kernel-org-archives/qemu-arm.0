Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp693980wrq;
        Tue, 5 Jun 2018 02:13:33 -0700 (PDT)
X-Received: by 2002:a9d:5b3a:: with SMTP id x55-v6mr11543223oth.127.1528190013785;
        Tue, 05 Jun 2018 02:13:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528190013; cv=none;
        d=google.com; s=arc-20160816;
        b=d2k5oNo2rmG4soyWQcVLCOE4Dt0evAEIO6EGPPO17qglH6GI9N4zpd8Bo8sN/fb8SX
         KjMmve8iF46fNQg5QN415FvwfBrE7jg08vgpNnCkaNq/BododYCZhsSoamo9exGpHgf3
         +diAkEdsVu4+uZB2C+csgxIK4gr+L3h7Y9B+61MjmxhUUHp0p7dGxxw4UV6r7Zcxy4N/
         MZVziKDm1paUZwTD49kSYuBzgVtn8CJLePIpv8XOmmf4yOY7D1/B5+XQ0LosTHYd4tFc
         m7sMWSPvemVwYA/B7MHJXyBDfliXRrxoARv8O5QZCcP7wPSF/+xFOhxTV83pJCESRD3G
         93zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=nO5lgxDj5+MlcSvj8eEJ76rA/ZL+dh1JEZm+vBnSNUA=;
        b=JpGzU4/+ehTdtoBNE8SWzAxPO4KCZCdv1gfi7sTKNAh7nsfptbnvgOkaqiQINHtIUp
         QzfwbXPtIpbqst6FcU4l4qhg8/FEb0I8lvcwwaSTjPvq8GCxwQyUHJV0pCVQL8s5VmpK
         T9hf+U1ggaPIvS0DkMaU6uJiiA4pmxOCSne9k66A88hF/Q/naPEqBoiiogZEEn7+14sx
         3zAQvHzl4gggyEdZIpn/rplsIt8upHzNu4xsDIvylqaO1JVt2Kp2LBGWSrH3QhjAfSTs
         iikAUDXUIui/vVcbnAOPyRSnDsrTJrIynYrW/cEX95Emeon5H5rYXyGl69IglP16Zjaz
         /Z6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YbjDKxhL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 31-v6sor22054543otf.157.2018.06.05.02.13.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 05 Jun 2018 02:13:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YbjDKxhL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=nO5lgxDj5+MlcSvj8eEJ76rA/ZL+dh1JEZm+vBnSNUA=;
        b=YbjDKxhLwzfbPmIrTbSKc11N+tbblFrPYgAgoHf7BEwUoPfJcPN2sFbB2MHvBpLuuf
         QciDlLuC6a7508XaH+E5isiP+TIXq2y66WeJzbl5/iOwA3R/UBPKBg4AGO5XsfE9WPZB
         pnQ0WcB1G018ca5EBl7ud2RqLjjEYwRxI9i+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=nO5lgxDj5+MlcSvj8eEJ76rA/ZL+dh1JEZm+vBnSNUA=;
        b=GUWWg+4N8FrltJOVXAuUNl0kRZhN3Eh+h4Yu2EjJn0Cg6LW4YmZrBneLQugiBU6CIr
         ftjUBoe9Hxy2dy2DFCSx/SLfSGykV318Eswzy0VH8QpGbGkm3xrarU58DwUWDVGQ6baf
         KxRJDvz7DAX+s2vJ+vqT8U7Y9zY6YkHiqETsEZalI7ncxJvR38+qWL1d7NsFDyi08L+i
         kdxl+hOuQQ4NKlP97uQY1u5H8r6ICfg2SrFNM8/ws7QhPjdN8wVjCeVKvdYjvTr0jgqs
         4TYAYoGGjJlhXpZZkWXTHBDoZmY4HD/uFSIwFMS3FrBDy+Eln1DhSaL+gv0tFYMyKB/h
         KZug==
X-Gm-Message-State: APt69E3SAwiSEj31cEzZoaf4nyXoUYAkXBIvPWeYPcrIK2K6ZsWV7cWN
	M6bmO+veqgb818V+TK6oAxKuHtKofy6M5L/SOkfQNYik
X-Google-Smtp-Source: ADUXVKJqKvsZZhFSH84LYZ8NsKSL/0oLoGofPH87u19y2sSaT6iozN0ksLCS+oCNYbSR7D3SNFEVzXnWB6ReV9J13zQ=
X-Received: by 2002:a9d:3fda:: with SMTP id i26-v6mr16031673ote.126.1528190013323;
 Tue, 05 Jun 2018 02:13:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Tue, 5 Jun 2018 02:13:12 -0700 (PDT)
In-Reply-To: <20180605073937.GD9216@xz-mi>
References: <20180604152941.20374-1-peter.maydell@linaro.org> <20180605073937.GD9216@xz-mi>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jun 2018 10:13:12 +0100
Message-ID: <CAFEAcA-=WtB8bCM2Q=CATM9YBM7whRf5uK1fLhaJH_mfkip1uw@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] iommu: support txattrs, support TCG execution,
 implement TZ MPC
To: Peter Xu <peterx@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: Y1XAT7qsefqN

On 5 June 2018 at 08:39, Peter Xu <peterx@redhat.com> wrote:
> On Mon, Jun 04, 2018 at 04:29:28PM +0100, Peter Maydell wrote:
>> Hi; this is v2 of my iommu patchset, which does:
>>  * support IOMMUs that are aware of memory transaction attributes and
>>    may generate different translations for different attributes
>>  * support TCG execution out of memory which is behind an IOMMU
>>  * implement the Arm TrustZone Memory Protection Controller
>>    (which needs both the above features in the IOMMU core code)
>>  * use the MPC in the mps2-an505 board

> It seems that this series is still using the IOMMU index way.  In case
> I missed anything... Could you elaborate a bit on why this IOMMU index
> solution is preferred comparing to the way to pass in MemTxAttrs?  Or
> was there any further discussion I missed on the topic?
>
> My last post to previous series is here:
>
> https://lists.gnu.org/archive/html/qemu-devel/2018-05/msg05702.html
>
> In that, I was still confused on why we couldn't use the existing
> MemTxAttrs directly instead of the new IOMMU index (and I explained on
> why that was prefered at least to me). I didn't see replies
> afterwards.

Broadly speaking I didn't think I had any further better
explanation than I'd already given in that thread, eg here:
https://lists.gnu.org/archive/html/qemu-devel/2018-05/msg05250.html
and here:
https://lists.gnu.org/archive/html/qemu-devel/2018-05/msg05513.html

If you want to make a specific (detailed) counterproposal of a
different API, I'm happy to look at whether that works for
the use cases I care about and whether it's a nicer way to do it.

thanks
-- PMM
