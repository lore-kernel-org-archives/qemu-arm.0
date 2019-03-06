Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp6292184wrx;
        Wed, 6 Mar 2019 11:57:56 -0800 (PST)
X-Received: by 2002:a9d:7d05:: with SMTP id v5mr5810187otn.201.1551902276396;
        Wed, 06 Mar 2019 11:57:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551902276; cv=none;
        d=google.com; s=arc-20160816;
        b=hruXIp5EG98I66WF/eeoKix+XlHzQTI5J3n0v4+PLGSw0syo4FxDWKOD+NTsma9+Bm
         H/0DzFYRCMVRjXQBFHQ5xxC18hERb4Ncehgdi3VohbYIIzlpDNrPzFAY5urvhUSwYjsf
         dvO54jvPOFcXpdo41YneKPSsy4x74PexBR/NopWnpOBziExXh91F/IfsrsCvug5CTpWF
         s1GF4YfOpBUxFTbvR2cv6XEINEVbkevt+KDKXUq56ysBqUYVMul+adOaQqjfRzxCacuD
         LOI2Bij6ONDGVTzrpL63y77Ag6ZmNz+w9VI7ncX0Hrv1cFoNqySmd+JLUUiodps+brEV
         MVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yfQD0T4BwReoRuz32f69IWQYHvvPK7eTZRhLX66S9ZQ=;
        b=FRPFdRSaD6EtLT5HLpy5wL984q024tAg2pPNc87WLNrnZlOE0VoRnhDL3CqXOTRUDw
         oMcAsTeviJkFXAiXj0+5LX52dvlPJ37FtjJkC81CXKftNrMEhJt8j6JGkh6cZB7Qac89
         cAxE9EQ3BcCqrSmIwWJXMzk9W5RaquO9l+WitrWFC6I0laN+xigKvbnQ3G8xNWpYDRTp
         hsq+RpvCWwFk2YaIZydw8qtOHPCfNQchvrt3xZwIp06wegDQdIWgEeenEVJaVQxa+enT
         moI2H/XcGUhXRwt2pwamIN7G28pCp2gbqSgzFWqeToXyXgixopwJv/a9Fq33iF1wyXb4
         pl8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MmjrcHo2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d7sor1664552otl.145.2019.03.06.11.57.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 06 Mar 2019 11:57:56 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MmjrcHo2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yfQD0T4BwReoRuz32f69IWQYHvvPK7eTZRhLX66S9ZQ=;
        b=MmjrcHo2HDqPtrnsMHr87VuYoIZu1Qj9OfHo2vknxdo2YCeBXHmeqSzmYFFg79+22J
         NQ7iQqaw3MwpWuvGRC174t7BsXL+w+Os9pBy8oWc2zbHHA9lf3EHHYHK6y0fM/0FrWst
         tnxt4LTV9e1k2cWzWtz+QLmytkmZyJbf5lzVDT4s5woqR7h0iiYkHJ2wbyNC9D9mMIE5
         4a/PM4Rft1Weqz9VLMF5iXAy4R5OSktKLW2kwmhrGjFptmT4c/YECpSI71bjpc0A4JDQ
         wJ4OkL6Oc4dLJIKt1NPh7ukG5mnL2l1hgHC0eyOMjNng6I9GBhSKR/z+kI1C+QshOp25
         huDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yfQD0T4BwReoRuz32f69IWQYHvvPK7eTZRhLX66S9ZQ=;
        b=eN/J4Lp7WMZm46iDqZ4Oz3Kww2KdK4Ws9SsJGOKfRwSA+k+ea+raTKWyfwLUseyRGr
         GGj8QkBLYAOa2448Ao87aGxgtghNl00DLVgePpk0Zb/6W2va7fuMfXpnSvMHP3JiotMs
         Zs/KRxBOfxgi6ujLJ9jcYD787cIrrinCEi/WUk+vGwKCT6Sb9sJmRrZ125vRBlc2sW0y
         7djpDT8sZsqLxMGc4Ph0HCe5POyCzNzDLoU4CRX0rwoR3BC9Ica5w3CcwxC0yyJFKjJ4
         bLLcvge67wJJwB4InvoROn7XB2Lu7UqB9VkjUNvr9lRuPHyDzq3Q/kjERiB/ryDEdwVl
         myRA==
X-Gm-Message-State: APjAAAVrqIHnMeORsiaBI9mXBrroD8PQylxfcaoVG5+J4ZiOZ6DG2J45
	upCFH59MAmyf3uPMw7sfWD29sApHrdScarBjiH7wN0Vn
X-Google-Smtp-Source: APXvYqxqdMB3QysADGVvRo0EeHY4jRJDGGGM3p2pgzrjEbRvzJvjoRWvp+xNkKAUHrZbkW0xNf6UQu6X6X9+ArkriBg=
X-Received: by 2002:a9d:61c7:: with SMTP id h7mr5202192otk.363.1551902275928;
 Wed, 06 Mar 2019 11:57:55 -0800 (PST)
MIME-Version: 1.0
References: <20190304181813.8075-1-cota@braap.org> <2adf8423-458d-27c3-67bf-d4775104ad43@linaro.org>
In-Reply-To: <2adf8423-458d-27c3-67bf-d4775104ad43@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Mar 2019 19:57:44 +0000
Message-ID: <CAFEAcA_z=ky-8XPLKxXEXJxAj+M5TWv7ZNrB1B0rJ2_Jna8GUA@mail.gmail.com>
Subject: Re: [PATCH v7 00/73] per-CPU locks
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "Emilio G. Cota" <cota@braap.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Aleksandar Markovic <amarkovic@wavecomp.com>, Alistair Francis <alistair23@gmail.com>, 
	Andrzej Zaborowski <balrogg@gmail.com>, Anthony Green <green@moxielogic.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
	Christian Borntraeger <borntraeger@de.ibm.com>, Chris Wulff <crwulff@gmail.com>, 
	Cornelia Huck <cohuck@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, 
	David Hildenbrand <david@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, Fabien Chouteau <chouteau@adacore.com>, 
	Guan Xuetao <gxt@mprc.pku.edu.cn>, James Hogan <jhogan@kernel.org>, 
	Laurent Vivier <laurent@vivier.eu>, Marek Vasut <marex@denx.de>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@sifive.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	qemu-ppc <qemu-ppc@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: /qigaBUoxXQB

On Wed, 6 Mar 2019 at 19:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
> I had hoped that I would have been able to reproduce this on another host by
> forcing rr mode.  But so far no luck.

Have you tried rr's "chaos mode" switch?

thanks
-- PMM
