Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp220035njc;
        Fri, 13 Jun 2025 05:32:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVo7yRurCeBcAxqoYvquoXbIDJmXnHt/dFnz3b3Qn+p8q48gJtD2ZpHi6ZwU9wFsyll6nY5q4N23iVWOw==@linaro.org
X-Received: by 2002:a05:690c:39a:b0:710:f5c5:c9bf with SMTP id 00721157ae682-711636533b6mr44666027b3.15.1749817934854;
        Fri, 13 Jun 2025 05:32:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749817934; cv=none;
        d=google.com; s=arc-20240605;
        b=VwK6baHAyEFOFW2ihREYF4cF7eSH6B/a2H5OXXRPlVwniY40SMshWsgVjm4XxtzdK6
         s8MzR3CqlQH31exORUlCV8vgIv46AVx803aWe7Hseyr/mgWCkTuBO8hrhdbSNkUJ8xft
         KCiEA6k/x/fyZXmVCRJQfMd452mvYdimcKK+UplcTN7rtnTZhV1yUsDzX4qSH3QmTpP6
         lCQg0UET0HA8v23M3HDSdnIr4V+/6IecZ+dWA63HsKQcZIg+QWeHlkZ2jLyGjG6voYpK
         hzX9C2qr6CDd0Qu1QGyEsEG9fUeAV0TfK0LIR00lalSc7NURE2ws7ayHgQZXlQmb5T4c
         lpqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=07JVhg802iRo9r8/K0Jmv569qCvievwFPfErLy0AXps=;
        fh=kX+s87YGGb5vCAmoQt118tFFyMcUyFL+PTukAR+8YS8=;
        b=SOoqYKTR5o7gIp4eHBc7OHg4ecOKuvsjpQA/B20HhS2v+uSyT055ZcqmMkSOA0GCQr
         BeYH7ZvBbO76et25sGHYvydMQMeWQGcMtFYc3eBEQD+6Ma963KSggvVofHs7ylBaCFvD
         VD1Q/8JnnDYfIdEq3mrKgDybxOy2xYVcPhVh11HgH/V4nwZBWAq31L+uOn/P0YWYUhKx
         USpdYfEfpKkv/oummhTPlheGe1NOCjRvEJHFhu/QGVrqlJRqpra/rPUtt1GlUubtBSr6
         Z4rwKZDkfIfqvMBsri9+46XI7coZQUPDi2htNFnswgHDR9X2JpSvmfY+uQF7twUigDW8
         KxEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dt1EKMVn;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-711518ebef6sor25140587b3.14.2025.06.13.05.32.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Jun 2025 05:32:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dt1EKMVn;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749817934; x=1750422734; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=07JVhg802iRo9r8/K0Jmv569qCvievwFPfErLy0AXps=;
        b=Dt1EKMVnrHO0pajDtsx22/1vWFdmKTheM4vom5OQnMxAN7wOexFSU1yFTcC5tej+nK
         sm/eM2nzuzAbg1IxBhFFz7l1TF5onXNxLfkvOih1L6DjZJYSLX754gAPV/WvQtdvwBDG
         xBFi9jg2dax1Oxnrh8Fl6hbFwsydoG7qbcGr7l8/kuJxi/6qlNztRx7StwXu+IrM2tzq
         b70FEuToh1EvxnWZAsKB03HvVArz6bpNGPfy61QHLPP+MTqe205uA57C7aNntYGNUMvS
         YxT2C+EdGxBLINrPI7jLz5ILFWnMsBrf3EMUH0ZJ92yZ+3U2CRlS5X3Cwf1qNte7DMA8
         ltig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749817934; x=1750422734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07JVhg802iRo9r8/K0Jmv569qCvievwFPfErLy0AXps=;
        b=nKbjscY645hh/zVBul/jjuIYln4dT2Gj6buFzVfdwMYQA+YAA3CHJZRAwqlciOqGoa
         NrSqVsYUyLaiCe5vMpBAAg4skWJinOLpYasuyvo8KPp4Xx2r3gxOzOock4EyOV0FWt6j
         Yx/0raOBHj/ZbIchrGjjVZUmGFAqx11IkRcaeOqANT4H5rj0sjwiMGiIMwv2/SwvPQH3
         i8ZkQcIFeDXYaRnerTvV3VYl7/Bn4EIPugC7UrxtsFbhwoJev8dMxK99O0QXFsTe/qwq
         v686DCxS2vCphZvR/lk3lBycfmpGsq+2eKox77AJfhsfnLhVePztj/huA2oNTspK5Lrv
         KjLw==
X-Forwarded-Encrypted: i=1; AJvYcCXKST/88y/LixWMyuCjeBlCvGHg2litjCMn35gNoGsP8YTGHg1QDxXJuko0DLtSQ91eMkXJlvsWppKaLQ==@linaro.org
X-Gm-Message-State: AOJu0Yx061yN4Doru3dosBc/9uXuYC94UexHdVxGPSejX9YoL9PtRKeo
	CBCQ3mpPOIVWYm7ypjE9DOK+6MQZlP+TU5i3mx2qBysMxucgeBZ7I1lMC6SlGcmhz1EQ2sYkNXw
	Eu7sE17E8oLuueRi7/93i3NCGhwQC9wwenPcL0Lk5jOWC
X-Gm-Gg: ASbGncv70YLCoMWMQAuelRxir0HWvVFwErJkXnCubLrlfOrBNjqlDcWiIlbZBwL3uuf
	PZ6JnMnYSSLXccK1+VFdL8841DUHl+3Bwfvu3b5POA+qZYwN8Ni5Ylv+AHbNvYiCa1ZTBcrjzNj
	2vcMhiF6xCWtbbxhYw2MC8Q6ZU4T4QCZi4g/V/qXdWlNv4
X-Google-Smtp-Source: AGHT+IFAh/pRObNEqsEHzHc9PX7qF1sWhz9Pj9Np6nag1q6YhuyL+Lq3qJpFmsYoU3w5VHRtSeualJtj+JZoQa8/Ww8=
X-Received: by 2002:a05:690c:f96:b0:70e:142d:9c52 with SMTP id
 00721157ae682-7116372329emr42840937b3.22.1749817934334; Fri, 13 Jun 2025
 05:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250612134338.1871023-1-Jonathan.Cameron@huawei.com> <20250612134338.1871023-5-Jonathan.Cameron@huawei.com>
In-Reply-To: <20250612134338.1871023-5-Jonathan.Cameron@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jun 2025 13:32:03 +0100
X-Gm-Features: AX0GCFtY0-n-3gf_nsaxJ4DbwNp3JIuQBsYWobX7KaEQ6RzpFw0oR2DA4cIwVXQ
Message-ID: <CAFEAcA8xVQUnReg-3jYENLmOMG_PeJ-ACLQa0dRoLBzxQ+9Svg@mail.gmail.com>
Subject: Re: [PATCH v15 4/4] qtest/cxl: Add aarch64 virt test for CXL
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Fan Ni <fan.ni@samsung.com>, mst@redhat.com, 
	Zhijian Li <lizhijian@fujitsu.com>, Itaru Kitayama <itaru.kitayama@linux.dev>, linuxarm@huawei.com, 
	linux-cxl@vger.kernel.org, qemu-arm@nongnu.org, 
	Yuquan Wang <wangyuquan1236@phytium.com.cn>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Alireza Sanaee <alireza.sanaee@huawei.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: Hyd4KO6/UgI5

On Thu, 12 Jun 2025 at 14:45, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> Add a single complex case for aarch64 virt machine.
> Given existing much more comprehensive tests for x86 cover the
> common functionality, a single test should be enough to verify
> that the aarch64 part continue to work.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> ---
> v15: Dropped tags due to changes in patches 2 and 3.
> ---
>  tests/qtest/cxl-test.c  | 59 ++++++++++++++++++++++++++++++++---------
>  tests/qtest/meson.build |  1 +
>  2 files changed, 47 insertions(+), 13 deletions(-)
>
> diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
> index a600331843..c7189d6222 100644
> --- a/tests/qtest/cxl-test.c
> +++ b/tests/qtest/cxl-test.c
> @@ -19,6 +19,12 @@
>      "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 " \
>      "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
>
> +#define QEMU_VIRT_2PXB_CMD \
> +    "-machine virt,cxl=on -cpu max " \
> +    "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 " \
> +    "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 " \
> +    "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
> +
>  #define QEMU_RP \
>      "-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 "
>
> @@ -197,25 +203,52 @@ static void cxl_2pxb_4rp_4t3d(void)
>      qtest_end();
>      rmdir(tmpfs);
>  }
> +
> +static void cxl_virt_2pxb_4rp_4t3d(void)
> +{
> +    g_autoptr(GString) cmdline = g_string_new(NULL);
> +    char template[] = "/tmp/cxl-test-XXXXXX";
> +    const char *tmpfs;
> +
> +    tmpfs = mkdtemp(template);

We prefer g_mkdtemp() or g_dir_make_temp() over raw mkdtemp(),
I think. Other tests in this file use g_dir_make_tmp().

Also you aren't checking whether it failed.

> +
> +    g_string_printf(cmdline, QEMU_VIRT_2PXB_CMD QEMU_4RP QEMU_4T3D,
> +                    tmpfs, tmpfs, tmpfs, tmpfs, tmpfs, tmpfs,
> +                    tmpfs, tmpfs);
> +
> +    qtest_start(cmdline->str);

We never change the GString and only use its C representation,
so I think it's simpler to use
  g_autofree char *cmdline = NULL;
  ...
  cmdline = g_strdup_printf(...);

But I see all the other tests in this file are written this
way, so I'm ok with staying consistent to that here.

-- PMM
