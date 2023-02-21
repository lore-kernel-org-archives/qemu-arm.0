Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3477521ejb;
        Tue, 21 Feb 2023 09:47:52 -0800 (PST)
X-Received: by 2002:a17:90b:4c50:b0:233:ce0b:8655 with SMTP id np16-20020a17090b4c5000b00233ce0b8655mr4954230pjb.28.1677001671961;
        Tue, 21 Feb 2023 09:47:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677001671; cv=none;
        d=google.com; s=arc-20160816;
        b=Fuc9d+roruDqAKAgq92JImzQB5vXWOKckcRkXWZCeBGizPAn3SZb4CnTezmlzjbuYU
         6Gf31o2JMPlHk0r3x3KLwXH7LXwa1aC8aYlZ38/0mvk5zWcssb8KtVtKD6V3lORfTSwC
         c8yKecPy5Y/IxDMok4tpeP5B2rpcM0KC9ngTUqNFVyMhv077kNHer8lYacEU30eYIoZQ
         /j2gQPutv89AuiY5/xdnlSoXVx7fGh5rLejalTocjeF3HGR55zuOHqmkIpKeNdrpCUdx
         gFvsr0ctUxe/7t4IhTfqe8LNodAZTQbZDAJLFyB7DkDDou31QMdfaVGQMxLUIsLeqncK
         HKlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8wa3cXOe8DQ5zdgwL8rAxctHQW3nFEC3AB3I9alARfc=;
        b=TA6WkniBpNHhd2bMw2NYeVyt7TZQYx4JzK+BbyAlvAePT3y7JbwRb5jNJljckHJJHV
         CXU0uPF7VAbw3n63/eGK/ufHTpZSQi5giIBeQ9OXiYscrKTAE1Cy5w2/+XNJzv3YwNId
         giyDIAG7/ZijO6G97bkn+yW2/qvqa4qfBPlEkLzT7PBKKOMQtIuEGBk1V2c9lhoFq5P6
         NCW60y1GZMVai8dIDTPrWViTisZrVNeb9XPn9GXhI8c3xqxVhYTmOK4mDzp/H/kpz08b
         QRluFRTWUoeQPmkD6M9xrVXRrXyJFrDIoGETnVgc3VIJOt2hPp0knirE1yelsm+eBQNj
         eSGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JG6STRWd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id cx14-20020a17090afd8e00b0022c2522280dsor2103493pjb.7.2023.02.21.09.47.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Feb 2023 09:47:51 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JG6STRWd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wa3cXOe8DQ5zdgwL8rAxctHQW3nFEC3AB3I9alARfc=;
        b=JG6STRWdrjjK+kWHfI/B3w3d80wBSLa6WFUOBGUU3W1+8oLAOlNm9OzqZoFEGPqzG5
         zU9Myt6W7doU8Mz23z291SQST66f7iv1m/awW1b8cfzbQn7TsRe2pgOplvVX4W2ayAi7
         GAxO17HsntqMNBQjxwcVcmwuFv2MvyiqKnAma3dZnYOIR2x4bfxlx4gxG9fAPYJGB5Dp
         k9eUdVn/zXgj4IgpbzolOpq8K1zYAQ6t882uYdcA35nCxeVu987oK7wjThTCjLA8rnYD
         TH/EZWtgu8mBCJjDOANzc/CarlgrUyfA8CJysopdvc36CNMouL5o0qnPod/0mCHKZV9k
         D0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wa3cXOe8DQ5zdgwL8rAxctHQW3nFEC3AB3I9alARfc=;
        b=cUL7q58gbtJad/N1HU4ayiQOaGYmGiI8EO5D8f0plstdqYaq0R9aLg2cBnXZ0sQMkV
         NzveK75aIzYMq+DQp6m7RSI98v+v5ZawZYhloPkQvBzPfo58kDyTklNFfR2RbqLoBUEd
         VTdeOI8RWP71I2/m0XwjZISwvWBlppZNOI+NYAPfjTlpTBVsZxnwKgvSpec4Daur0ypx
         +bGtGFWgx/LRT067cZ2/wmKHdf3ZMHSb8cPwd5rTsy+WHlDTEjDVOtWdmkPwuEZxqUWp
         eBSVpssVHUzZmAXvEGAJEYQsnB/B2DTw3dYw0kpBnSkDZq8gGWn6sLZMO+DBneiF5m+Y
         WRWA==
X-Gm-Message-State: AO0yUKWm6XTLTEOfDbGN4PozW92IP6Ol3he7fqHHdxbChfwa+Jchh8Aj
	Pe0VbS1ixbj/IkAO4ZA7L4NRhhab7GEJy0dyRvVOAX8D
X-Google-Smtp-Source: AK7set8Dn9NP8sx+CyphqMBiH1844tAapgjYYaOl64zs90/5hdQHb9b2NFW4qcLzMCbkvQd1hBFc5q5Dz2xne1CTYGM=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1940898pjb.92.1677001671261; Tue, 21
 Feb 2023 09:47:51 -0800 (PST)
MIME-Version: 1.0
References: <20230216142338.82982-1-philmd@linaro.org> <20230216142338.82982-2-philmd@linaro.org>
In-Reply-To: <20230216142338.82982-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 17:47:40 +0000
Message-ID: <CAFEAcA-Ju7G02yfGEmJmP=N2Eu0z5Q2UJ+AiLqvkwmLs3wcaBQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] hw/cpu: Extend CPUState::cluster_index documentation
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
X-TUID: RCc92xligvEd

On Thu, 16 Feb 2023 at 14:23, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Copy part of the description of commit f7b78602fd ("accel/tcg:
> Add cluster number to TCG TB hash") in tcg_cpu_init_cflags(),
> improving a bit CPUState::cluster_index documentation.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
