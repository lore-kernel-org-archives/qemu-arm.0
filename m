Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp297908lft;
        Fri, 24 Jun 2022 05:57:10 -0700 (PDT)
X-Received: by 2002:a05:6902:4d:b0:664:dd89:9709 with SMTP id m13-20020a056902004d00b00664dd899709mr14686326ybh.57.1656075430322;
        Fri, 24 Jun 2022 05:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656075430; cv=none;
        d=google.com; s=arc-20160816;
        b=UqUCCQ1znPJlVlyKds2RXmVTKN47/nvgO1Uw8taQzCKMpGs+6fCZ7udRyF1/Xh1cDo
         tuIEpUpD9Y1BZcXKUqUEUKF2wKslyL5qALesK67Gi7rGfQO+UnaWemXzUF9hSDm9PjWY
         4VTkntVpyM75UrcPf1JPSiIsyBTOEfNt2WzNGhTpTCA6SNJScK9ns8yMjBKZEPqScIJx
         99Tj9YyB0SicYYVisVEf1uTeDhzBnKU63EMgFWdC8EhIZ3tTQcUwV3o+DxVcOvL6WB/f
         cxiDPx+H1SMkwS3OszFflqv3PXZv3ltq478UsMH54NwiMwdIUZwdoVSLG/jwXju9ZvMM
         C8GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YiA0YGlHhMKy/ne0Mh3r8zXDFLkjCNSQ537FSF96/24=;
        b=LMeOLv0csmedFtYDjjzovzgSZFc3br2tD5QuLIm91dffIwXv7rUgS02rlsxJc+jQlC
         WDiAvEI0Trosw1kbv/gXPu2dyq9BtsC7fTusQLjQHhw1BVoucZ7Jbk4JCtdeKT1VVOfN
         S1UzFQ/p1PWPeAeee5wtDGXgrw9vAJM3HiLQbb/dL5Ozv7BGOgyDp69jslouT4Hwr38v
         2q7R+L0gzUfN29SA438W4RN3+XnPZw+W/6KThozueDihltfmyvGCawv+tzbHpML5N+rU
         c1crX4eJbd8bOLKmNQld6KWN1I7MDHL0IfNu5zVYOsm0E7V6aUZfD1ihC6uqVGlIs55B
         5VOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LndkKm2M;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w13-20020a25b88d000000b00669a2f43a20sor1055649ybj.102.2022.06.24.05.57.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 24 Jun 2022 05:57:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LndkKm2M;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YiA0YGlHhMKy/ne0Mh3r8zXDFLkjCNSQ537FSF96/24=;
        b=LndkKm2MAWPB3fwQ4CrnfzqRxS5hZUiKSw6JB316osM2WjtfhNcO0ZXODAXlPjFbbC
         O3EswrgZMTZBSLV7VYeLgj6r3yzeSPg9Akk6r5WaK21VhfXgfkmGSxmL4Y1Qo8kD59et
         JYvckztr7r5Fa70QOXq003etN8q3ZjQ3nZ8zwymcfg8SBroqtUiPVPA9DYC24sQeMPVA
         bvMoLrP2hj8clExquFlniSO5VqvOkkQylsjqZ83FHiZB/K8TLV2GdvYApnF9XKv4Bob+
         zzQnLOt90NlCeBqNQVGsXS6GyZQyf/Pc6EnMdIYzXPWXa3CIFB8YBuxoez9sGMIDDWM5
         9mUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YiA0YGlHhMKy/ne0Mh3r8zXDFLkjCNSQ537FSF96/24=;
        b=d38jY4simFrnlJfUaIg6Ld19y6Z/gEb6ier+sow9gQjw99actP9At2liLOaPcOt8H8
         y8c9+tjELhLWG5vSwzV9H42GQBGJ0bLuqmr6yb1gq2tSUwCM2CucnW6EqI44aBkJFMtC
         YsFo49GXxcIHL71cZ9fDiozUT0ryoWTzJmYsRY5PcEjMbZKM7PrxxgKkURqE5HAx/jZI
         vbDt0+3ovd9R4Nz1sTAaZqmLcUHQW9r+1sUiQ7i3bem9SMvGyAIb/ulFFCq7/PZ1/MGP
         WKLC+iQUWvhkxSA3doNaVXwAjE9VCrwFiwDb26HfyswLcgC495Nv6whjjwJ/GPlStckM
         My4g==
X-Gm-Message-State: AJIora9I5W455V7MG28rtlwyp9c9n5hevdTzet7sLb4yneubzDbl2q+d
	KeJ+u+6kuTYbOiKzCGbRVqzJkiy7PjTyeR96WkF3uFck
X-Google-Smtp-Source: AGRyM1vnqCcyIkxaLhGzDujI38DtPZPyGcfvq+svZqcT4XL627aiXs+NBcZn7a4uOp9e+xW0HhccZsu3w16e46Zi9Gg=
X-Received: by 2002:a25:7ec2:0:b0:669:b7ad:8806 with SMTP id
 z185-20020a257ec2000000b00669b7ad8806mr4913319ybc.85.1656075429910; Fri, 24
 Jun 2022 05:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220616141950.23374-1-Jonathan.Cameron@huawei.com>
 <20220616141950.23374-2-Jonathan.Cameron@huawei.com> <CAFEAcA8U9oNDStfLpxOwodGm9MCTdLrt-WV+x_-rTGw9UpBGvA@mail.gmail.com>
 <20220624133909.00005f6e@Huawei.com>
In-Reply-To: <20220624133909.00005f6e@Huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 13:56:32 +0100
Message-ID: <CAFEAcA8GA+ZXr2eS9bVxnhZRtda17Wx0Ud8CfcA90T6yiaecew@mail.gmail.com>
Subject: Re: [PATCH v11 1/2] hw/arm/virt: Basic CXL enablement on
 pci_expander_bridge instances pxb-cxl
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, qemu-arm@nongnu.org, 
	"Michael S . Tsirkin" <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-cxl@vger.kernel.org, linuxarm@huawei.com, 
	Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
	Markus Armbruster <armbru@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Adam Manzanares <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, 
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: PUcsaFT50eBa

On Fri, 24 Jun 2022 at 13:39, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Fri, 24 Jun 2022 11:48:47 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > This seems to be missing code to advertise the new devices in the
> > device tree.
>
> Intentionally. I am not aware of any current interest
> in defining DT support CXL or supporting it in operating systems.
> Easy enough to add if anyone does the leg work to figure out the
> bindings, but that needs to come from someone who cares and
> would need to be driven by OS support and a usecase. The ACPI
> stuff here is defined as part of the main CXL spec because the
> target class of machines simply doesn't generally use DT.

I don't really want new devices in the virt board that aren't
usable in the common use case of "just pass a kernel with -kernel"...

-- PMM
