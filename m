Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp436478lft;
        Fri, 24 Jun 2022 09:13:03 -0700 (PDT)
X-Received: by 2002:a5b:c52:0:b0:669:8231:cab4 with SMTP id d18-20020a5b0c52000000b006698231cab4mr16637469ybr.72.1656087183058;
        Fri, 24 Jun 2022 09:13:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656087183; cv=none;
        d=google.com; s=arc-20160816;
        b=0Ck5XL6oSy88ltsVMipCcrMyP1Nh0sRhB+y85GzXR+WonQg+PkbDb/YujY16SVPG/g
         XLNaarnT7JaL84VTdTOWVyRjAlJopJgmeDTU0GGtPOFm4Y4B3zd+thigDAqQkYOKYZ05
         u2v+X2E8GIVjJq656ratDLz9U9kVcfNNw3e7jgMd52zMdyXiXsy74JVcN5l6aF7dbmLK
         xmrJKVdPBhvcmmo34R/THoYvlbkooV00YF/SwFvQV0jWc7cDf95JG+LYtBqRX1glJirU
         W6xwisacZo+M2ebIpFRIBkfuQ2BDiZAxIJZ/bGHL1RARRNRFejjIqmVcY+XRs7cprhNo
         8oFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iC0gjzLo/+NeCxUooWDkYLGFZYMI378klxjabIannsQ=;
        b=iD1eLW0SmjEG17ajISC/mFXPJyODXmJT6Of5G8HbmUR7xHJWiRVYbzJJRNaLgEhSk9
         9Si78iF52LZbCsssdNBDymArgjm1FTYxi2CmQEaz2z31aGzU+EfxjfXFJaIdlx6fTGJi
         rqh7iRbP/ydR41TeZmStzMYVOSulxG6xOk9JHiFt5vl+RUXt1E0TYRdlL6AIdSKCdUsj
         ayuOH8xsUjwO3QXKQf3xqrs1RstOC4946yjeZtKswr6CU9Tde3/ovpMkAdZdq/2p3E4A
         nBDKvzNS/yRFs/sZ/PQNESu/SXcFOMuEjsd5EnXdeQ4CUdEUPgnx6UtohDh/urEY2zTo
         NvuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K8sEoSyB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 65-20020a810144000000b00317e0646a8csor883580ywb.134.2022.06.24.09.13.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 24 Jun 2022 09:13:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K8sEoSyB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iC0gjzLo/+NeCxUooWDkYLGFZYMI378klxjabIannsQ=;
        b=K8sEoSyBYqMDhct1wWQSdQ7WMnXZvT+3aFa9K5bLJJJzPfyK1oqKmuMAF0KxAD45t2
         O3uTzQY6YSrgmvwB1scDkKuLCydIySEOGHkxd9qqL30Wnp7c4tFftfi6ZlSzGt+rt2Bi
         RToOHE7mMRz232936in3xBirb7NNkRR44HLKKq/sYcbvYwdZisSQCsERJop5tHw/Sjxp
         ziS25MryBgzJLNJ7HyFd4DMCJGUUcdPmurmvKU61wCC7ukkgRGfki/VtzXn9UCHyrquf
         N9BJpNqBl4Ngd8jenkFlIJS1pw4vWQ7dlnJh74LYH9PTR5L9usuZXmMKqCYX/Q6ZKisP
         oM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iC0gjzLo/+NeCxUooWDkYLGFZYMI378klxjabIannsQ=;
        b=7pg8LYvt+BOluOu2pJe5e3GLayfn/LtRGh6F1zvEWtgTmgn+FwBz1TC0OIcdHJw9D3
         7Ilb5MyLlltxiXFgTbA/YnKLBtuJJDhWttR3lWu5xfsUjuJJ9eXgJNnIq4lHUHCKU60s
         6PmzR7MqhdVRL4TodVY5JoRUGl6xb27lZHfE3iDbii4z8QhNXJ/VWzd/6Pya1+5G/3/L
         nwGu6gfwWw5UKwiXIWKTDRQ+A8SDnyTc2WY9PLX4WL4nsAH0khof8Nhtu7GsxUFo4FOI
         FqXXgO3sgfqvPHH52iXvW/cTzh/9wWuET5KMl6b6YVqn68uDy6ijuOfwCp6VexOVtNxz
         WRfQ==
X-Gm-Message-State: AJIora8MkKLK3op57MHvgbJDBsLap40I9oWk8D17mjqOpmnz3IqKpFyJ
	y6jHxqnsa8wUG4PrJFMxsUTokDmYrYoxzDDGBh9NKCWg
X-Google-Smtp-Source: AGRyM1uW1xfzgnRrf8c/H6yT0nn/HC62aGIxuPAVkf5Cn0RTTHUzwThcy5suDJhylW/v8KYTIsR93ohlCnSQmFR2Z3w=
X-Received: by 2002:a81:8486:0:b0:317:a4af:4e0a with SMTP id
 u128-20020a818486000000b00317a4af4e0amr17919466ywf.455.1656087182563; Fri, 24
 Jun 2022 09:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220616141950.23374-1-Jonathan.Cameron@huawei.com> <20220616141950.23374-3-Jonathan.Cameron@huawei.com>
In-Reply-To: <20220616141950.23374-3-Jonathan.Cameron@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 17:12:25 +0100
Message-ID: <CAFEAcA_tck3fG67qO=4QiTHY2ST3jvy7-w156XkMKMv38-aN9g@mail.gmail.com>
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
X-TUID: wFJJc6ufYP5U

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
> diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
> index 2133e973f4..1015d0e7c2 100644
> --- a/tests/qtest/cxl-test.c
> +++ b/tests/qtest/cxl-test.c
> @@ -17,6 +17,11 @@
>                        "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 " \
>                        "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
>
> +#define QEMU_VIRT_2PXB_CMD "-machine virt,cxl=on "                      \
> +                      "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 "  \
> +                      "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 "  \
> +                      "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
> +

If CXL requires booting via UEFI, what does this test case do?
It doesn't seem to be passing in a BIOS image.

thanks
-- PMM
