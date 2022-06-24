Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp218362lft;
        Fri, 24 Jun 2022 03:42:32 -0700 (PDT)
X-Received: by 2002:a25:bfc8:0:b0:664:a5a8:d518 with SMTP id q8-20020a25bfc8000000b00664a5a8d518mr14627692ybm.625.1656067352581;
        Fri, 24 Jun 2022 03:42:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656067352; cv=none;
        d=google.com; s=arc-20160816;
        b=faFyObBpxm5eW7Br40PxLB8rzvOGKBSPZjrLt3k5k50thte1wgrI4D7tCQnDRonIZI
         m6zNvUF+BGMJnR7h4rMxZfTZXilmssG4N4/xjDE2+8j0WbS6DDMaTeOTSoSYi2yXmHsp
         k7XEIdqZvdl0gzcqRXFaFaDV9OfWYd2NLYhAwyAfyubwRcmsV/X5s+7uDcpqavOgy/cB
         4v8JwABkzl9wMxDiC/+zHtKS5e085eJcGMUcsIx6JhfwFoD4vrUNxb36FwYLeKth1uuy
         tuFQIHdUT5PtTQS2dk9V518GHbVAKa6z1+ur3R6dqIWLnDu886YwEN4HUL7Nd+Zva4Ef
         pIGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t+Byo1b4X9Vbz/m7CyDm8kInKMKO0y+GBykwADZ8WmE=;
        b=I80ypNBsj9SSqODtU3CHexGHhTLMNNu/craWJZk3VEUjXbD7/w8XLupBrbK+3f2RGL
         6CFUH+f5WFI+DuZUCdC4tMCV66qY2WSqVP0FtzuoRLUyAlb9CUnKFdV9mMvBuSZJZKWC
         3gsvkbPnkyYocoKQK9rKWVLtdYWT/V4IB5r82fz/3FlCkC9YIEAAN0Tdj07K6ifBaNB6
         rqjxhFHptesSzXCxQbHKicNbrhBN3ErNnUw23nsh2VoKmW5FS6Byg1pROiRIihA7F1C1
         yVJFH/rv5rmiM5GHXQlTdDdZFH7hpmW4XO7l1DghBEWjPxRXWJa2P0EkiayhMTi0Ob+r
         p+LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQ0l6TXs;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 76-20020a81174f000000b0030c62e336bcsor618648ywx.123.2022.06.24.03.42.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 24 Jun 2022 03:42:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQ0l6TXs;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t+Byo1b4X9Vbz/m7CyDm8kInKMKO0y+GBykwADZ8WmE=;
        b=TQ0l6TXsTnX4C3Z8K73saa/OV9zdzb7o1WStXBQDX6AadaryI4yw7JjhkrRJzqPNn6
         mtTSkllyAcQej8hsdq+9lvQUDDX/0W3HzZv9haS+SqlE+J9aDUVx7r3EB5VxtfvdGmxo
         ff9suaD1bYTOTTolUJg8suBUxodExgv0+BHwRuz6r+hJjIX0CZI/hHAN6PVN4EZYr3fr
         W8nkqODphPaiYsarIRIxS5w0asNpt0T2JzMws4Zzb56ayJzDrR8ASK2fKfNclbi9Nddy
         xuCKyve1c3NVQZs8mSDXx8HfzosVTzDzDWAiJlKqQWoRgN/EqGITmgPLijtXZeDNDW/F
         8A4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t+Byo1b4X9Vbz/m7CyDm8kInKMKO0y+GBykwADZ8WmE=;
        b=oX0/x78nrJJQcfJ28boCAFdkDVSjea1BzEIGuNVY51msCPc4/wNX7JRuD+7qCNrqAR
         /yCwHLP1Y1476sNEoVOQFutXpP6pYNTjpTWzJuBkTaxc88aPyhy1ytroS+VzvSFEx8jw
         5YogPO0R2qsI1smMy6Df+W0bIP+N+MEwK7I+kLg9BNNJCbasWJE4i4Zgvxiq2tIj90sM
         lZ85tvGlAbKbC6ZvfB2PevZdmqKH6X6nMQRcGp2oR4hKFEGUSAU7IhcQPHAw49BAY6hz
         gD/FsXDeg6n7yzwCGOHO2wIlItrYV0wYDAv8LP4tS4X53fxLmUduxKdyfmeAlDnN3aNU
         ibwg==
X-Gm-Message-State: AJIora/zSi8lMLu8FU2EHozKHxZmtuEkVU1jjchMx74iyQEIOyHih3c8
	IITxQdq9Z2hqLott/nmulrcmQroFP4MiR5nvQIskxCZE
X-Google-Smtp-Source: AGRyM1sq+/2VjBMF5dFg09mCn+s1Qdjq3iIBMrleMMhwNzQyYBgetjTSfEuoJKDinF7P8RioYadghPn+2sUqZUWqvaE=
X-Received: by 2002:a0d:ca0f:0:b0:317:a2cc:aa2 with SMTP id
 m15-20020a0dca0f000000b00317a2cc0aa2mr16667139ywd.347.1656067352203; Fri, 24
 Jun 2022 03:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220616141950.23374-1-Jonathan.Cameron@huawei.com> <20220616141950.23374-3-Jonathan.Cameron@huawei.com>
In-Reply-To: <20220616141950.23374-3-Jonathan.Cameron@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 11:41:54 +0100
Message-ID: <CAFEAcA-rmDrMcq-s4X68dSSWwhwHcY=5m=20wFZSJ1qKm7gfjA@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] qtest/cxl: Add aarch64 virt test for CXL
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, qemu-arm@nongnu.org, 
	"Michael S . Tsirkin" <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-cxl@vger.kernel.org, linuxarm@huawei.com, 
	Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
	Markus Armbruster <armbru@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Adam Manzanares <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, 
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: KILmQSmx7Ha/

On Thu, 16 Jun 2022 at 15:20, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> Add a single complex case for aarch64 virt machine.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  tests/qtest/cxl-test.c  | 48 +++++++++++++++++++++++++++++++++--------
>  tests/qtest/meson.build |  1 +
>  2 files changed, 40 insertions(+), 9 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
