Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp1017207qvs;
        Wed, 7 Jul 2021 10:36:18 -0700 (PDT)
X-Received: by 2002:aa7:c0ca:: with SMTP id j10mr28749666edp.203.1625679377972;
        Wed, 07 Jul 2021 10:36:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625679377; cv=none;
        d=google.com; s=arc-20160816;
        b=SqSOXSNxYurnX5f21Rs3oyBjuIzB4d9e/ZyUAJO/icuyG6/zr+szCZT813GyVHwBYB
         uAoyDSlvSienvrsRkH2gVrJvJBbh5oo4J5ZXYH3mwmwizikf/0LTco1QsF8FM/YEQvZJ
         th9izX7xDNi0gtl45WgmQO+eizS/+RQFjme/d5xlFHTzVndzKn51bTuYYumqz//faJ3w
         hq3k8iWDsyX4uPbkDxD9QzG4XQXaS7CnH+e2JQYfzNCls4IXzymJziewOz2KwQJ3/Xon
         Umj4lsSRfeB8CJ71dCtgOjnK8deI/QQXbyGErZnIQL3oNweWdaoUDJmugs2L4OTHAIvK
         dGbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=r7P/FFIcUHJB4s1sNv7gmmIsROEFzzS3GrKbUQ6P96E=;
        b=meogRTcszTeGmx+rSTvFFPPNIKKsS3Hws3agTpA26P7MGZ57NnnFvwoWtxPwSw22Cw
         fyd2BhAv32Tt1hrIx1Szs2VwjWxKjm1osRlasZbszuZIvH+CgQP6LQxjIoVe1uGmA8/W
         qgn9RR9vK5vIS0n2+MsDzV3quHIuGvGSYni5B6sjQcV8c/53hR90eYof5b1NUXJLX/n/
         Rf1nwF7hxDxWwFEnjRURW/p6pQnKqSCKHG1PN5id4twiigb4f5VK/qsosdhmNeMTYyza
         upAEtymneqF8+LQBB9Jhf5elRv8xfRmXRf0iPUgfHgM0lXHJHLJ9DS2tS+tU3m41eAuR
         xOtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kod0fnAh;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gb22sor2268842ejc.70.2021.07.07.10.36.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 Jul 2021 10:36:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kod0fnAh;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r7P/FFIcUHJB4s1sNv7gmmIsROEFzzS3GrKbUQ6P96E=;
        b=kod0fnAhXqgnpQ6fiUhbEheJmwfZHtQdGiq36YPThfgRH3kh7NDDGEquGiKxGDhJIc
         +ItXZ4N2ssfWlV3+R//fdGpu+1QGnMQXnRQjuRl8xKlh38Zh1DVIgxVInraR3Ehy5d7m
         T+85ZIB8i8CrnQ8yOhmk6n8h4fQydwGDlnneWcBOGf5buZ4zNO7w0S5InlyZVJMfmnZy
         oWlq+0W3AqMfBJOODVsei6nLUnLPkjixZSohCsXu7zlg9ChIW+OeQQnK457mLenO+kpJ
         Ca7qDROg8KCxm5iyDgCj/v9nzrMnlyUxBLqRXVO/UVswAp3X/RDVyNyBKUR6GE1RNejY
         f/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r7P/FFIcUHJB4s1sNv7gmmIsROEFzzS3GrKbUQ6P96E=;
        b=OqGbegAxcMsQFrNYC9dwffQkNnsFcRPB8J08CL8BVy/KaPMHpjDAEcwEP2b7/iGBS0
         1vVwIWVPUw5StlmEZbzgrA/VrBfeNI2sLw5BNXloS+6aan0NODJks0hLV6x4DRkreF/2
         P0smYleWdfhNtZAlTMhF6X0nPPComkdFsUXnPvRkwspZCcyYIWvjb3XPxRLSJZCDFvwp
         nGOX6/fqOriXoPZzvV0hsPKNjDfp7FVLwDTiFUiWRZNug2BhApcvbO1aSy42eh88NB9W
         pxm77Aea8/6YiB9/D74AcEkDHggwr327VohkQ8+xc21IYC/s0g+MgcoXijO1lGc+otN5
         CnBw==
X-Gm-Message-State: AOAM532gFR45Fesgfw6ey8QkCo4j2C4uQ0o74ICT4K7Rk+RY79HsRhHE
	gM/W8PakcteKDNOQHBNMVW4X5wC5a5F0cNRVbWvsBOur
X-Google-Smtp-Source: ABdhPJzVFFVdcgx7BgZw5xiEjCIkE+uszQczpKnqQzFAGcPHs5CZ7CAtiYd2MRgDU1AAejGm0cVALnJnmX0n2VfSW60=
X-Received: by 2002:a17:906:a108:: with SMTP id t8mr25184480ejy.407.1625679377668;
 Wed, 07 Jul 2021 10:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210706234932.356913-1-richard.henderson@linaro.org> <20210706234932.356913-14-richard.henderson@linaro.org>
In-Reply-To: <20210706234932.356913-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Jul 2021 18:35:39 +0100
Message-ID: <CAFEAcA8-p4BUKT3jSGx8bXH0v-=KkU5-BPESw0dAXxus_cPkzA@mail.gmail.com>
Subject: Re: [PATCH v2 13/36] linux-user/arm: Drop v1 signal frames
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: YKWVBdW1qTY7

On Wed, 7 Jul 2021 at 00:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Version 2 signal frames are used from 2.6.12.
> Since cbc14e6f286, we have set UNAME_MINIMUM_RELEASE to 2.6.32,
> which means that version 1 signal frames are never used.

This isn't strictly true -- the user can manually set the
uname release to something earlier than 2.6.12 and if they
do we will (currently) honour it. But I don't think anybody's
actually doing that...

-- PMM
