Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2854447wre;
        Fri, 25 May 2018 03:00:03 -0700 (PDT)
X-Received: by 2002:a9d:444a:: with SMTP id f10-v6mr1034229otj.400.1527242403359;
        Fri, 25 May 2018 03:00:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527242403; cv=none;
        d=google.com; s=arc-20160816;
        b=WK1to6bxPV0t9JL4egQL9zWXY/M3XRuc/7igQL2wJS4vvHIs2sUvaS1yaBzQ8WgrBM
         fEtcMPuI4fM4LfT+mtpC6j/jkt5+E1QRDgB6hfIA48GKT6If1240dwXn4g6abdfXHXah
         pzWO4CbluEZl/9ocRmL5RAsYfvegSt81eMhtGx7hPorvjIf05LJxyvA9V9LXE9Dw19Fc
         nWxm1pL+aZ1rPby1+78vFl5O0oR8DYEB8jXaoA1ISCb3qPQZR7d5P6U6PL+UAhvoN7ZP
         Lg4RgrO3OL1dTRj0QzIFx3j6kPUaifX1swc3ikgc1IcRV2wyxo4VKQGS371XEoUHDsbH
         VDVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=T8IJBd8shR7/jZijEWMECchmF5fh/7p1Ukhkk2XGGPI=;
        b=Ax+QIVGTsWCPDRSlBpXrM4Nk6xuMuOrgcRTJtbSQexA+DZeb1pQ7PFQvGrDY2PKIgD
         0UqHl7kdnDupj/7IokciGInqkIw9uyvgS7MEFUSpMTjL7RPVZNlRNjvtvWpognTZe8nS
         ikYyd7PWHjJ6jueZWxH/hRHJ/3B59PZ+dJY0afHDa+VMj8i5juYjKYthkDDr+wKEGEth
         yVe3aOGjoFcuNRr3uIhLXckt8bUDEp3FvXWAOKUgF7Xz9aFRlxnDMvrJuGmlQrvrxk8g
         g+kXKsL+/0MkGUJGIt8xDp2cme26ujBQCRiVXXiqKxlb1cDEH4tCFtDHpkz8SceiiHbp
         Epzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IqQWwPcD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f24-v6sor11111249ote.221.2018.05.25.03.00.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 May 2018 03:00:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IqQWwPcD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=T8IJBd8shR7/jZijEWMECchmF5fh/7p1Ukhkk2XGGPI=;
        b=IqQWwPcDyZtEc6UrYc5VhopVEy97qtd/sBSnR8+n8ypRydKLjd8oVGIN+OsJUI/Itg
         kpYOwJY7fPvNTlJnFxt2AnOKLMS7QBGHJ9AWU/7hlbbbXnCHa/V2k3T5SkNZnIyWZbR7
         M7TmNJCYdkAAQb4DGeUOaR10BJM3PblbeiXFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=T8IJBd8shR7/jZijEWMECchmF5fh/7p1Ukhkk2XGGPI=;
        b=W6IA9gbXyWThIl6N93F5v/tQp6Znk3R3Ekq2KYcUvWEE10uRz4PTJweRkFBRG86kKu
         o6Fl1xNsYIhBG43dvauxwj7cW1GA0RibD6KXJW0MgksuSxxTZtCf0atqdlR19Zn5FZLf
         U9DXcRYO/8uSthTNBNmFue7Ka8hsaDzWtNNm5H9mIGNLlFSdbcdzlgAX7tGMRgzlcQL6
         VPBS9Vkitmh6ZreWdUcA+522ZIyawnROED34o/Lxa6WGmC3prSCI35wM4huCysGp5BXZ
         2qEHaweVaKNBDgOsBIKRPYfWAMtnOp5Qm7IByQ3CfmLz1UBeNgSBTZrr4qrYO1QYDFlf
         WAgA==
X-Gm-Message-State: ALKqPwdGu8+bS1Ty8+pOPU4/kMlB+Q51tDX9pQLCR90jcpUL832iWF1A
	BIeTCJJE60ih0OqCIdWhRuNg98AzKoPb9tm+ahByiguc
X-Google-Smtp-Source: ADUXVKLvLr3qaIJfWHNRyRvvwDUyCRNZ8Yu4TEBQYTgOFmiZXuvzaP/XXnRm3fDJJyEHA0pEzqdakQZLhQ4K78YEaYk=
X-Received: by 2002:a9d:255b:: with SMTP id j27-v6mr1146893otd.316.1527242402972;
 Fri, 25 May 2018 03:00:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 25 May 2018 02:59:42
 -0700 (PDT)
In-Reply-To: <e253665e-18db-49c7-afca-8284e975b80f@redhat.com>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-18-peter.maydell@linaro.org> <8736yivgw3.fsf@linaro.org>
 <f568933d-2d8c-da22-c588-3ca4d3140538@redhat.com> <CAFEAcA--wyed8qg=4P-DG9QyZe1eACWh+68g99Gowx71CFAh_w@mail.gmail.com>
 <e253665e-18db-49c7-afca-8284e975b80f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 May 2018 10:59:42 +0100
Message-ID: <CAFEAcA-b7Son5FMwQkkjZvjpWs3UrVgQtcRPxhTLzuM-PpPq1w@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 17/27] exec.c: Handle IOMMUs in address_space_translate_for_iotlb()
To: Auger Eric <eric.auger@redhat.com>
Cc: "patches@linaro.org" <patches@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-TUID: ZvNQkYXAxON0

On 25 May 2018 at 10:50, Auger Eric <eric.auger@redhat.com> wrote:
> On 05/25/2018 10:52 AM, Peter Maydell wrote:
>> Once we've flushed the TLB it is empty and will have no cached
>> information from the IOMMU. So there's no point in flushing the
>> TLB again (which is expensive) until the next time a transaction
>> goes through the IOMMU and we're caching something from it.
> Ak OK. there is no finer granularity for TLB flush?

Yes, there is -- you can flush by (input) address; but I
opted to do a global flush, because it doesn't require
complicated tracking of which parts of the IOMMU's address
range we care about, and in general I expect IOMMU config
changes to be fairly rare:

+        /* Rather than trying to register interest in the specific part
+         * of the iommu's address space that we've accessed and then
+         * expand it later as subsequent accesses touch more of it, we
+         * just register interest in the whole thing, on the assumption
+         * that iommu reconfiguration will be rare.
+         */

We can always come back and revisit that if there turns
out to be a performance problem here in practice.

>> We need to know all the permissions (because we'll cache the result
>> in the TCG TLB and later use them for future read and write accesses),
>> so we pass IOMMU_NONE.
>>
>> My understanding from previous discussion is that the only
>> reason to pass in some other access flag value is if you
>> only care about one of read or write and want to allow the
>> IOMMU to stop walking the page table early as soon as it decides
>> it doesn't have permissions.
>
> agreed. So you need to fetch the whole set of table permissions to
> update the TLB. By the way where is the TLB updated?

tlb_set_page_with_attrs() calls address_space_translate_for_iotlb(),
which looks up what's at that address, including doing IOMMU
translations. Then tlb_set_page_with_attrs() fills in the TLB
data structure with the results.

thanks
-- PMM
