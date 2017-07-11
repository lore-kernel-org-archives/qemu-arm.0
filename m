Received: by 10.25.44.15 with SMTP id s15csp4648774lfs;
        Tue, 11 Jul 2017 03:49:34 -0700 (PDT)
X-Received: by 10.28.220.212 with SMTP id t203mr2112634wmg.13.1499770174252;
        Tue, 11 Jul 2017 03:49:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499770174; cv=none;
        d=google.com; s=arc-20160816;
        b=JpgKvCm4CVXBd753qBFtJvZHm0Z0I/ALvkECw0OjH53W89+3KT5m03JZ8gnpFx1sqK
         e4F2DTreo57GsKUzLAFNpLVmu6GaoXTPgPgWLFPXUQDtiwMUHdeJe7vJnZhu6Fa+Kbgs
         E5hJCVmT3+t6JOXUvFIL9aiO0UVCM2lQISa8gX2pG7C90lsuiN4rqhX3Hffd3EGKIOF3
         ziWror553qv/cMYtyZCq4oyFHzfDuzHu18ErP6T/iW4+SPkY4bnbJq00lEGXks+NiwpG
         npRUkSV82CmbM2o0U7Paws6mF53zMAfv9rPVXdI9HoEdTKdBvLOnPbOGQyRNP7Ru6021
         k8PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=HzKYQ8cTPcrFUDQWI/1VHfLmF+UUeYrTUlHBAk2cEQQ=;
        b=IYJrKP/GtCEVyCQcaFNvuHa0ReBKs+8a9DZZWI/ABA7txO0YcMBYWaurxjVkk/gVlu
         j5CSH0xAjZHIeDgIJxmv8c18c8ZezB+B9upqQ2eYAxkYJHc+vuNrcwOskl9yTgA1sKRG
         EpeWEu9QlQ4UAdvXTV9BDmiq9h8PMoZimcRrberfuDdfIW72bVHRzT4kVXuOs6+FcePI
         LJcq/+ttCZ2u5NRD5LTqJ74Bfi5ZAwv3xssEXw0tj9fWjFDbx0HDkOY9Q0fp8+gwPU8k
         pCDAXfMcAGgZN492fXv8XarSEUCFZ8LLFrtS5NEkrPKKpIIIX14xoCzQWPcjhP4SHJXz
         Xu0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=U91r6qfX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::229 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x229.google.com (mail-wr0-x229.google.com. [2a00:1450:400c:c0c::229])
        by mx.google.com with ESMTPS id o128si1409546wmd.102.2017.07.11.03.49.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jul 2017 03:49:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::229 as permitted sender) client-ip=2a00:1450:400c:c0c::229;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=U91r6qfX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::229 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x229.google.com with SMTP id c11so177844465wrc.3
        for <alex.bennee@linaro.org>; Tue, 11 Jul 2017 03:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=HzKYQ8cTPcrFUDQWI/1VHfLmF+UUeYrTUlHBAk2cEQQ=;
        b=U91r6qfXoewULZPTxosWbDDKfNVQQbIs/ZR8a9JJaE14QfbTacvkVdGMLIlrnKmxD7
         e0o60ShbBbxRNWV8TQOYkSiYRy9DBxoyBfSothfDekth8w8rEZ2UJpGpA7rX0pYjBgvi
         N3lvNgljAMrIL58hxbhUzA2n2ekKyL1GcM2NQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=HzKYQ8cTPcrFUDQWI/1VHfLmF+UUeYrTUlHBAk2cEQQ=;
        b=uBO1ki2tp8LJFo2pAZUP7LSS4MYhonrlB721dFvyaLjaDVYh/DhVntFUWOFnHAGW2O
         Nb+CNfxWF18Xk0XvG9DJjbGjdVYNCCbFATpt1PpO5Dtz3Poc0bNyuy51xUoSDY4n5A1O
         4/flsUNdBVNOpdeLH/NfMPUbod0mp4OZSWs0VHlaNROY92zLWgFtmHbRr+5h/VmbDR5u
         ZgdeH7i8fDOkVT5qAQkBKuwl+qU9bNYSfMQF9TXeDv+xa7/1WDZh1zoK3m5Ll+S8tmrI
         buyHLjIOqRGqJynClssEK3ksR/BBH0nlV+3luujzZcQTZIsNFPDIlYIYBiKz5R5gi64D
         u9og==
X-Gm-Message-State: AIVw113sqZzuqv8HoLOK+kEJodH9DImXuRBeHrXGs09ZVxH6s4wb6h35
	UIWqy5HAG80h+Ccrt8BX8b3L7KZr3beKrgE=
X-Received: by 10.28.129.205 with SMTP id c196mr2136287wmd.120.1499770173822;
 Tue, 11 Jul 2017 03:49:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Tue, 11 Jul 2017 03:49:13 -0700 (PDT)
In-Reply-To: <20170711103859.GC25504@toto>
References: <1498830302-19274-1-git-send-email-edgar.iglesias@gmail.com>
 <1498830302-19274-3-git-send-email-edgar.iglesias@gmail.com>
 <CAFEAcA-dssYnbZjuWTjBta1aK3iL3pyRKh5Qs4hFh=bPONgnTA@mail.gmail.com>
 <20170711100334.GA25504@toto> <CAFEAcA_XTrkAN1ATpp6DLZqGh4aL1gECzQGyubJmoGjtw_pPbA@mail.gmail.com>
 <20170711103859.GC25504@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jul 2017 11:49:13 +0100
Message-ID: <CAFEAcA-qqu7TzPQfMniErU-dSzpnXz7ni2sr7VF-RqHi7U+Uwg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] target-arm: Extend PAR format determination
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: l+YErqGpa2V+

On 11 July 2017 at 11:38, Edgar E. Iglesias <edgar.iglesias@xilinx.com> wrote:
> Another way could also be to have get_phys_addr() fill in generic
> fields in the FaultInfo struct and then have a faultinfo_to_fsr
> mapping function to populate FSR/PAR. Do you see any issues with that?

Yes, that's probably better. It's how the pseudocode in the ARM ARM
deals with the problem: there's a FaultRecord structure which is
populated by AArch32.CreateFaultRecord() and AArch64.CreateFaultRecord(),
and then it isn't actually turned into an FSR or ESR_ELx format
value until needed (eg in AArch64.FaultSyndrome which calls EncodeLDFSC
to get the long-form fault code bits, or similar functions on the AArch32
side which end up calling EncodeSDFSC() for short-form code bits).

thanks
-- PMM
