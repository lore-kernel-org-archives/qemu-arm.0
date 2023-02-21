Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3484673ejb;
        Tue, 21 Feb 2023 09:59:18 -0800 (PST)
X-Received: by 2002:a05:6a20:54a8:b0:c6:d2be:1a09 with SMTP id i40-20020a056a2054a800b000c6d2be1a09mr7521063pzk.33.1677002358244;
        Tue, 21 Feb 2023 09:59:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677002358; cv=none;
        d=google.com; s=arc-20160816;
        b=Mv4BTlP8k2ojR/Cu18m3MFw81n02KXXK4MgucwpOv0Hef/BCqC9Eus3k8MZZJ4xFwK
         mlQYf0zw5pnUyiSwq+h/nPdSiO+oZO+rc74QRJkjR9OCtzqkXdzMwY0kl7ByGmBBF1/u
         d3T2tP1YF1byL31AJiZJW4F0iAZrKXISGI2ZzCsqXY7NQxdb3SQNAJSS+jyDyDbpFNlT
         I9JExWCNJ9E9JY1qvKSidAWIj9eqINFZkUW7O/Merx7IAzKA25wAzYpC+0N73ei/nhc8
         /t5sU8E16lmuX5bYOZfpiw4KBAz0UQc7CI1+xsV4ufig+j064G1SGnEfOCH2XyB2pBaO
         A7nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pk3HqKJdAIfe2w9FuzkLzW4K1hOPaBemQWMfR0trEb0=;
        b=VjqM87v7WmMDYvKZ8FHVPAziRJE+t8DGn+9siWXnsfCWciD0VmbA5uFtSgYF8y8kZN
         C4CzvO+IsNCnoj+3CmamSaDKre98xERo90Ta+Oui84qpy8a9pGREEDOe6vw/qPpkKSLU
         Tq2JLknRbt1MjbbL8tg4knzyU3pywUubUzcrHsDp66uwizOienUl7mzaNdwnPWJ1VzdY
         HCcZtRKGOeiL3k82C3TAKBFRERDi+NkfNBT9ILK5L9h1hwIK61VEuZUuzl3Y8v4ZMeq5
         qHV3pWjGarmFvXoOnObzT38DvVBx1uVSiq9RP5/CK2jbNGRj1gz5WGzdR5ZFiBpMYwKd
         Lecw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HwJbYpBT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s11-20020a632c0b000000b00502d7c88815sor873316pgs.7.2023.02.21.09.59.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Feb 2023 09:59:18 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HwJbYpBT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pk3HqKJdAIfe2w9FuzkLzW4K1hOPaBemQWMfR0trEb0=;
        b=HwJbYpBTMlsFwwXCzBuMXbjw/j31IDDcdcuLSBBKzOD1+Ga/ljvM2EsCvm2A+i9BeI
         por3VGEBbxfd70TBMescMKf5cCFui08t0XJjyiugyUkZlqdj2rJUK/hlJjxOEB6FNQkF
         Qm53UuYPYBuXlV9vXv1Mrsq3klvYfZnUJI7OsmE02QkU6YzZYHXf9tYdBwDxE2DxLEe3
         C7bZwuA7yblHnO+PkGrOfRun78J4jAptEGNTuvg7465hOubTGR+y9VZNp9Kdt3LebyRr
         0ZFv6BtXWWdA+AuYaTbxXn+dyTijvA4gPWifrmDcx6NNky6cAOq+jNLaCjX/sllslM0s
         CS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pk3HqKJdAIfe2w9FuzkLzW4K1hOPaBemQWMfR0trEb0=;
        b=Kgg9zs4rihw9w+U0d1U7ji3UcFpttXnSDiEyHKU0dmx5H6DjnsprnOIOiXPrIwuw4i
         jC0sZbdRABnonw8wadCVAZeynSw3rQcBZd0XV6+g/iEzJH6lwsTyKDVHg89rkXyPZVbw
         1x7qdUQx259cQd00qDDk9YufsWBpPuiQHoF6ftyJjhqaq/Tqi3aijdZtAfzzlfz61Pds
         zqm9Zgpc9iGDRBqSMAGIgrpatyoMg1hMOJdjlTscMEBlLHlHPezkbRcb6gSHDfGX/5Ef
         xsyFl/bPCmzIjOU67xc30JkGBuuIh6mmEg4EDpcsJj7zEfrpq+QnBjd4WV5wyMD6pRVY
         BBzw==
X-Gm-Message-State: AO0yUKXlBsnNQK6+a4QodH9F99yYa1jpcW3MB2DvWf7SsPOs2ikfygjs
	KA29GQyY2ZYD6klnJicVfHEMnBGXWqkcKtG0oxOIt4VK
X-Google-Smtp-Source: AK7set85TFxumxGnEaGDYlPCUyVNaX4N5sjZPMCkYIL5m5CgH7JbxxCwOvBUiDQuBfAeJih33Ln29zUkPM/8gQ1+xX8=
X-Received: by 2002:a63:3815:0:b0:4fc:2369:811 with SMTP id
 f21-20020a633815000000b004fc23690811mr755656pga.6.1677002357723; Tue, 21 Feb
 2023 09:59:17 -0800 (PST)
MIME-Version: 1.0
References: <20230216142338.82982-1-philmd@linaro.org> <20230216142338.82982-4-philmd@linaro.org>
In-Reply-To: <20230216142338.82982-4-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 17:59:06 +0000
Message-ID: <CAFEAcA8vMWOcuRib5aL=SVrRoDMOBdD+PpSOrsZh0kdCU7KavQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] hw/cpu/cluster: Restrict CPU cluster to a particular
 CPU type
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
	Dapeng Mi <dapeng1.mi@intel.com>, Sean Christopherson <seanjc@google.com>, 
	Bin Meng <bin.meng@windriver.com>, Zhuocheng Ding <zhuocheng.ding@intel.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Zhenyu Wang <zhenyu.z.wang@intel.com>, qemu-riscv@nongnu.org, 
	Alistair Francis <alistair.francis@wdc.com>, Zhao Liu <zhao1.liu@intel.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Robert Hoo <robert.hu@linux.intel.com>, 
	Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Like Xu <like.xu.linux@gmail.com>, 
	Alistair Francis <alistair@alistair23.me>, Zhao Liu <zhao1.liu@linux.intel.com>, 
	Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: hRx3xPn0h8MA

On Thu, 16 Feb 2023 at 14:23, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> CPU cluster id is used by TCG accelerator to "group" CPUs
> sharing the same ISA features, so TranslationBlock can be
> shared between the cluster (see commit f7b78602fd "accel/tcg:
> Add cluster number to TCG TB hash"). This mean we shouldn't
> mix different kind of CPUs into the same cluster.
>
> Enforce that by adding a 'cpu-type' property. The cluster's
> realize() method will check all children are of that 'cpu-type'
> class.
>
> If the property is not set, the first CPU added to a cluster
> sets its CPU type, and only that type fo CPU can be added.

This seems like a reasonable extra assertion to add.
It won't catch all accidental "wrong thing put into
cluster" bugs (you can still put two differently
configured CPUs of the same type in a cluster) but it's
better than nothing.

Personally I think I would just have the "check they're
all the same type" guard, rather than having the board
code set a property explicitly.

thanks
-- PMM
