Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp454228lfk;
        Thu, 21 Apr 2022 08:52:06 -0700 (PDT)
X-Received: by 2002:a05:6902:727:b0:644:b342:d306 with SMTP id l7-20020a056902072700b00644b342d306mr340131ybt.592.1650556326702;
        Thu, 21 Apr 2022 08:52:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650556326; cv=none;
        d=google.com; s=arc-20160816;
        b=XCJQZBbAfP1MqQkdA2umyhU80fuewQ47oTRd04ryMZz96KHZ915gGANDMgz4lW9Teb
         9LxL88txXRaWLHDfeZaPuFsiavpfhPpJ33+jd1nv20FnQIb3MhXvdbgHAbPINPFwdxd3
         pJ6t6CjOBHTHPXXks/aqGcWaUs4yu1ieGe967wfw9Eo+EkDu3Z3L6qIOpexYfYmu9S1Q
         adXFgAZchiIVY4svRjn7MrFaKDSlUz5yDXiR7TalpnSWPk75/X9pxMbTp5b2TycxuMum
         fac4HvF5YBmalSj2lFqS1L/6pHpR/6BMfxS7rox+fpulGH4DisvyJBCONqn2dz67Q8iF
         +Y0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b1mXaliziQ4QK5PQFEfodQC8x08R4WWLdmuklnWImV0=;
        b=S79j1EKt/GyPxL9cnBiTq9AwVDG4kmHRrVVmHU28ZkNlekGxUocONzMBMa9clA4Sx7
         vjS3Xy4Ii4aDeCQGkfewFaaAgV0R+m/epof9f7MyHnRDEzMElv843WIAmbsz4/mNQJPY
         n0Xi+06Mui43/mC1e2J0jIVgGSsNLukWfg3sySW56gy2ZSSsOmHa23JfFWbhUSseRbbt
         vjoZHAnm2Dnt/zvpkFbEhTol/Tasgw+gGDQp0549u+l6w1zkcc9gsu/iGfqnPkxFfqun
         nOSfRkBXn1ME3cPTvBMJGeOMloVkbYkeSB3B64WTmRXQjukTBz5RPSzEnBSLTjSsgvJh
         9uDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ESCEcmys;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o10-20020a25d70a000000b006330d1f4fc6sor1644845ybg.124.2022.04.21.08.52.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 21 Apr 2022 08:52:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ESCEcmys;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b1mXaliziQ4QK5PQFEfodQC8x08R4WWLdmuklnWImV0=;
        b=ESCEcmys7QjpxE9JvTPMLCv9hn8DVKTSueXLHhYh5TaJfNFB8lBS4+B2Soz4ZttdKx
         3urBiMQFp1d0feE3FiwSnHqHHFUusRvdZH6Gb/0FuS0W6tjn1tr5SRBCEJaJg9zld8XP
         V5rPQkQe6JctonyCGEOxbrqO5cyPXXRBzI0/yJZAm8NIZxVbTW3W8XzPUOR7kjl5FmpG
         2eIFofM4t0pg02PTAA8fpWlWcogMDKysrbXhK2baBBIARxJeMuP8q1Wlmzl+0VvLADAQ
         pVCtTjOBDbmhjEsl1mO4jUY9o81echhtEWpKL13VpTUo+PpmxRpWIUQpdXxECPJCyNH9
         UeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b1mXaliziQ4QK5PQFEfodQC8x08R4WWLdmuklnWImV0=;
        b=iNTF8bzWBRZoUu7KcxPwMFcc8BVHwRY+hhV8n8J3XvSGoDDyUvy+xgcMiQtIML5LR2
         uGINqKPJ83tOFwQSPXMaeK1xuE+iHvKLMAuvZvde4kUtOAPVeArpNq57Cnsd+3OgRhkR
         YrXBsduZXhvVaSpGHq+9nMBMWd31d4DdZ5kQL9pyLojMRz8Xr6UC4lqNPBp22LB49CYN
         Z3tyQqvmI7ZILuVQanbh8hG8Xw5ex9bnvkpS3ZdxqxWKdU9tPSa/mVrkmmCkloT7+wBb
         qvLT3+m9uyP4rSMlQLrtbcrfJZK25omxRjVDlxZTpKsC0CxdKUOCWC/bF9Dg8mjB/CMs
         ltCg==
X-Gm-Message-State: AOAM530kEwsclRhvW01X8GgvgLFbT+VBhB0J/iqc8ZWe2S5evyx1oG1W
	A8NJctw1yl/cnKJeEq2LYNiGPO1FWR2wyS+en7uIMivp
X-Google-Smtp-Source: ABdhPJyx0g/PGsALkiCn9SGbhRD9+UPHgxirv4jcN1Bc4yXBfwzmHqVURHIF/h6BR3WnVvM27apU05tswaywt/cYYME=
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr345447ybg.140.1650556326375; Thu, 21
 Apr 2022 08:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 16:51:55 +0100
Message-ID: <CAFEAcA-RW411mWCQOu03i=LaPHRm1F6R3Z9bquBDJPhv-ZxWGQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/18] user-creatable cpu clusters
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: qemu-devel@nongnu.org, mark.burton@greensocs.com, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Alistair Francis <alistair@alistair23.me>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Bin Meng <bin.meng@windriver.com>, Vijai Kumar K <vijai@behindbytes.com>, qemu-arm@nongnu.org, 
	qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: ww+qxoVUGZX3

On Wed, 30 Mar 2022 at 13:56, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Hi,
>
> This series add devices to be able to user-create (coldplug) cpu
> clusters. The existing cpu cluster dictates how cpus are exposed
> in gdb, but it does not handle the cpu objects creation. This series
> adds a new device to handle both issues and adds support for two
> architectures: arm and riscv.
>
> Please look at patches 2 and 3 for more details about the new device.
>
> Last part concerning the riscv is rfc as I do non-backward compatible
> updates. I'm not sure what migration (or other) constraints we have
> on these machines and I probably need to make some changes to cope
> with them.
>
> This series almost deprecates the cpu-cluster type as all uses
> but one are replaced.

I don't think we should have two different concepts which
are "a group of CPUs". It means we wind up with two different
ways to do something (which we have too many examples of
already), only one of which gets to use the nicer, more obvious
name.

The stated motivation is to allow user creation of CPU clusters,
but I'm not sure how this would work -- CPUs need a lot of
things wiring up like interrupt lines and memory regions, which
you can't do on the command line anyway. Do you have an example
of what the new code lets you do?

thanks
-- PMM
