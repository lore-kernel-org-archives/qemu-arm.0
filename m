Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1219081wme;
        Tue, 22 May 2018 01:41:05 -0700 (PDT)
X-Received: by 2002:a9d:2b37:: with SMTP id o52-v6mr14518735otb.60.1526978465262;
        Tue, 22 May 2018 01:41:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526978465; cv=none;
        d=google.com; s=arc-20160816;
        b=kRBBtAhWp6isvXTXLn9QUx+9d5a6ykUvsyESZwsukWzFNbAFBigW5ID4yhfJ669660
         iZFUddTXuc0bcpu1tCPjuBvtw2LtOVWvMgNg21B/BtV5mKII+Rl+PmDR6kO8222j5UY6
         hakuKc421APUqwV0eCWlIP5HELC3ti7DqAXXyQY+s3SFHhjMeT1l1yMIqHiUB8zX/4t/
         66rderp38oiPEtZ3WzqM+rk6G//mV2u6E5CMd2IfUpP3ynLtARKf0D0iB+IZE4e/Fg11
         EHrP7KhZZpXTGF94voOJK3s5I/qrF+z3GB+Apslf5CIW+rxJt1PDaMbA9giiiYQ7Cegv
         qzrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=ziFr6Qd8Ow3XQV0ADS4LVPLX6Wf8jcmiM6D1SD0gTKE=;
        b=f40ItmTk6WTMPVgxoccsKTpbxjgAqfy93cpvgaDdMLnar0nJ58pAhh3ZaEng40SaCv
         zABNzNSIJESXCJ8vfpS67UoSjkI7pGHv3K8RLbude3jMAF0eXFNt4SDoiDlWxJ6UM/Hm
         QvJXgN5NVJe468Mj+pBWQK9GhFzuW4IBLmzIfJ2S1qmjwfPcg1+slbUiWAIaE1lP/XqZ
         jO8m2Y+sGi9VKB0m1lr093ZIj/jzgOacsvv5H1R9pk9W9Ct6XLFY/1RVGdhXYHjDDjw4
         tB3dklgtC4WmRfy57E5Ff5xgX1YvltBHKx5lZId7+1QQM6LXfyocRV5NHs61TEMxdV5f
         12Qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MlqB2LAc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y199-v6sor7772599oie.299.2018.05.22.01.41.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 May 2018 01:41:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MlqB2LAc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ziFr6Qd8Ow3XQV0ADS4LVPLX6Wf8jcmiM6D1SD0gTKE=;
        b=MlqB2LAcXmNJBC60v7JjK4YI3ghLGWfBxkb/YgKSGVj+2KIQiJF/2lNkSoDiB70lZ/
         BmVNDM7FOCr4ke4MZ/EJEv0n7vfaJZ8cZKOxxOxOSuipMjrfmxJipJ9PNNOu6/klchIf
         ZIDLodfFg/Hm1s24a+WK9yTJbPaPNxt887HrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=ziFr6Qd8Ow3XQV0ADS4LVPLX6Wf8jcmiM6D1SD0gTKE=;
        b=rJ44KXwh5F/13NiB7nx7U56QXvpvcNvD8tgbThQD0icjCblgTralMTgLK8YbJ3Ewro
         AN0IOJuUb/XRNF9G7QmMivxFfOjqkyMrQn543rHGB5i0ll/lAJmu0mut/JTaVIQP9C5E
         2b15cSQVTPmLbpitu8S3E3wHtlkPwMUyH9YVy93VzRzdjgwQXu5fLdoE4/pXDyMfWfmT
         lo6dZl3ULepE0dU5fYwNDQ2KxOUMLjL5yvXWbEdel+dkPHGojy3CFi7pH8DttT6L/I5O
         SeFWWASQ28bNbp/obRP2msGRzI/PzouXczr9bn5di3vGxEx5eWJcuVJ3ZVNxx1vjuQUe
         JaCA==
X-Gm-Message-State: ALKqPwfSNSwgJMvq3FLf3R0G5lJNp7AUm/4Ctvaahb+mu15ktwDw/rZu
	1g7+m4h9cea9bObq6kPRlf1M0zynOGN8mbToBjCP67iy
X-Google-Smtp-Source: AB8JxZpKrdWGnjJ3TfTxa4GxMA/GmyFcEcWjhbwiKEJjSaV1/Md2y5J7xYreQr99A+N+g1K21lthvR1WbCbh3l0Llho=
X-Received: by 2002:aca:f141:: with SMTP id p62-v6mr14001677oih.80.1526978464886;
 Tue, 22 May 2018 01:41:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 22 May 2018 01:40:44
 -0700 (PDT)
In-Reply-To: <20180522030333.GB17282@xz-mi>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-15-peter.maydell@linaro.org> <20180522030333.GB17282@xz-mi>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 May 2018 09:40:44 +0100
Message-ID: <CAFEAcA-iOYhuPfvDv+iD6jBqXMXqN-jfTpSSBub1Zp1i-JcDbQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 14/27] iommu: Add IOMMU index concept to
 IOMMU API
To: Peter Xu <peterx@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 4GP7n5GDeP2X

On 22 May 2018 at 04:03, Peter Xu <peterx@redhat.com> wrote:
> On Mon, May 21, 2018 at 03:03:49PM +0100, Peter Maydell wrote:
>> If an IOMMU supports mappings that care about the memory
>> transaction attributes, then it no longer has a unique
>> address -> output mapping, but more than one. We can
>> represent these using an IOMMU index, analogous to TCG's
>> mmu indexes.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  include/exec/memory.h | 52 +++++++++++++++++++++++++++++++++++++++++++
>>  memory.c              | 23 +++++++++++++++++++
>>  2 files changed, 75 insertions(+)
>>
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index 309fdfb89b..f6226fb263 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -206,6 +206,20 @@ enum IOMMUMemoryRegionAttr {
>>   * to report whenever mappings are changed, by calling
>>   * memory_region_notify_iommu() (or, if necessary, by calling
>>   * memory_region_notify_one() for each registered notifier).
>> + *
>> + * Conceptually an IOMMU provides a mapping from input address
>> + * to an output TLB entry. If the IOMMU is aware of memory transaction
>> + * attributes and the output TLB entry depends on the transaction
>> + * attributes, we represent this using IOMMU indexes. Each index
>
> Hi, Peter,
>
> In what case will an IOMMU translation depend on translation
> attributes?  It seems to me that we should always pass in the
> translation attributes into the translate() function.  The translate()
> function can omit that parameter if the specific IOMMU does not need
> that information, but still I am confused about why we need to index
> IOMMU by translation attributes.

The MPC implementation at the tail end of the patchset is
one example -- it needs to look at attrs.secure, because
"translation for secure access to address X" differs from
that for address Y". The Arm SMMUv3 is the same when it supports
TrustZone (the implementation in-tree does not), and it can also
give different permissions for transactions with attrs.user = 0 vs 1.

The reason for not just passing in the transaction attributes to
translate is that
(a) the iommu index abstraction makes the notifier setup simpler:
rather than having to have some indication in the API of which
of the transaction attributes are important and which the notifier
cares about, we can just use indexs
(b) it means that it's harder to write an iommu with the bug that
it looks at parts of the transaction attributes that it didn't
claim were important in the notifier API

> The num_indexes() definition is missing, and I saw that in the next
> patch.  We'll possibly want to move it here.

Huh. I ran into that and thought I'd fixed it in my local tree -- I must have
failed to actually move the change to the right patch. Sorry about that.

thanks
-- PMM
