Received: by 10.25.0.147 with SMTP id 141csp773773lfa;
        Fri, 24 Feb 2017 09:00:31 -0800 (PST)
X-Received: by 10.223.135.215 with SMTP id c23mr2374350wrc.135.1487955631892;
        Fri, 24 Feb 2017 09:00:31 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x233.google.com (mail-wr0-x233.google.com. [2a00:1450:400c:c0c::233])
        by mx.google.com with ESMTPS id y190si3133577wmy.7.2017.02.24.09.00.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Feb 2017 09:00:31 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::233 as permitted sender) client-ip=2a00:1450:400c:c0c::233;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::233 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x233.google.com with SMTP id 89so16964402wrr.3
        for <alex.bennee@linaro.org>; Fri, 24 Feb 2017 09:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=102zUqTMig0oGsRYLRuOuhV21rLk5LRT/t7cXTveOS8=;
        b=eGg3A3UaN7AIPaCfRJNbnj4SRW7NETjR14yhqRB9i9Y9AJ6V3tjXIwVC4JphBRDtyd
         nwyQbUaRPlqhtsiVXBr4R7E14wLBVKi3UiBr8OQ0BIi/yYRdyLOY8HZIirED3TBKJDQ5
         y2tucn9XiA8vaVD6mTCoutL/SAtCzZV2G4Mak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=102zUqTMig0oGsRYLRuOuhV21rLk5LRT/t7cXTveOS8=;
        b=FuN8xmEj+yTLtpb/VC58KfKM52LhTqZ61jJ9ncexo8pxIznPAVeRQCC5arkmuoJSuV
         qgDYvBVsrrVQ2psW7XUeL1W5lwGLZzHJRI60WRq0Wj7O+XuJ/e5PVFBIA3GJkXykLkWI
         xOs0OrhZVJdyO3SNpIiEgZh60+wBTb8uTch8bmVnVQZk9/+Jezv7WlwCSgoW9rG8ke7J
         q6Z4VD0hRGk2XnlDvstfuVF1Yq+p4HQKDsEpDf/+j7aMPn9ZxzYoEdpRPKkdh2M5ncGX
         h8MaKhntFJ9alM62q7HWgfFUvMyy1B/nk6ikjFNW1sd9IULnEvcU4eaN68qUzghBDtqf
         sPhw==
X-Gm-Message-State: AMke39kkBLy/um9FL3/4FpISs8/yh+8m0CmK5iP0RcNFIhkN0k1bZqEZRvz98pbbwwquQ16qvTUJr8TptX1Oahs0c0M=
X-Received: by 10.223.169.76 with SMTP id u70mr3350305wrc.187.1487955631271;
 Fri, 24 Feb 2017 09:00:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 24 Feb 2017 09:00:10 -0800 (PST)
In-Reply-To: <87r32nleue.fsf@linaro.org>
References: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org>
 <CAFEAcA-MMw0_ombzTD+kQYpeNKywtcKY2UczcpR-hFDwGZhZJw@mail.gmail.com>
 <87wpcflmmb.fsf@linaro.org> <CAFEAcA-OhSMFKgRYsCWUrb6OBxxrWokkkpJyioveEur-p4-g2A@mail.gmail.com>
 <87shn3lkj3.fsf@linaro.org> <CAFEAcA-e5s6Tru_Kfba9hQHL827r2N5jyBvbpwbro7fHX2m1KA@mail.gmail.com>
 <87r32nleue.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2017 17:00:10 +0000
Message-ID: <CAFEAcA_nwfvS-WnZW1WuqGT7cv8Mm16o8CwM2N=XB1MWePkqbA@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v2 00/13] Rewrite NVIC to not depend on the GIC
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 1jbJHeYAm0+6

On 24 February 2017 at 16:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On 24 February 2017 at 14:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>> Could be. I use arm-linux-gnueabihf-gcc to build. If you use
>> PRIx32 does it build OK?
>
> Well the problem is the non-eabi compilers don't have PRIx32 defined for
> you. You have to specify yourself.

Oh, right. Or we could just cast these things to unsigned int ;-)

Other than the tests being a bit ropy, are you happy with the
patches proper?

thanks
-- PMM
