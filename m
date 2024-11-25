Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1450797njc;
        Mon, 25 Nov 2024 09:02:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU5vAH8H8o2TG0fvJUv/JwT3zQJm445vKbI3IkX28VHhukZV79v373FDF5pbbJFSj8RujhkFTth/jBDNQ==@linaro.org
X-Received: by 2002:a05:6512:3412:b0:53d:dc25:f8fb with SMTP id 2adb3069b0e04-53ddc25fa19mr3800603e87.23.1732554147740;
        Mon, 25 Nov 2024 09:02:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732554147; cv=none;
        d=google.com; s=arc-20240605;
        b=iIR7opN60FigJnxTThR6LxFSg7mDjDrOfbsEYtqUI6Szl1O0kGnfrluBezLmBbrbIK
         pBDs5Hgkoa8jZBVYdWI3uxg/5zEjJPcMARcOrkxYX3QtJY+oRkpKBFVoxgRCHAyTBvEt
         sR/f+xixDt5XukHjMKoGhyH+YOXDB+ogx6GczIFfRMy2lk/9WwDGksIcjLooOyWYEAyT
         q51V9vcWejeJLE2m8DpNBzEJp+6jbiEdgemql+If6ANC6x4VvW8nLak8axhq8HDNBlhh
         kRDkLWRqVzy3q0kkj2uvZn6g2zhbHcFoinPjEit8woYT8c7OyKArbGxslUWiAxxJnrru
         4EqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eqLkZhZ7p76k8PAt3meHFxaU003h0npuWguDuJNfBSw=;
        fh=umxavrbtmJ65AI9+1mBG8PvRDABXTnC57a1zCD3RI8E=;
        b=CZp7P6wvyRYwge5doRgJ7UBC5MkGYDQAZTloEybAzKjplf1hgHpe7gB+ZVRYSPWGii
         li4RgdQU1DLqM74SDlTRUhoJjjS57nnjQ/Gj9Tz+41adBZonzvNjDor5RWc+BoB8rAYY
         PlYfzsWp2xI0ktYt8LrSbWe6ikVsu1ypbIq3uvXKma6Or1ENDWr/kFVGN+h0PupJq9xK
         vhuUd2S+A2F6/8AsmxdpaVVzzF7qstJxCnMhMqKN+OftF7200tC53jxZ5G/Eu+chaDZO
         OjBL29MI/sIOmHyQgg0Ahbljw3xxk2RSvpKMnIplZ1lOUN7cXdvjdCZcrnOjp2j/y8vb
         n2Iw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BILq3YUs;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-aa50a9ddaa7sor268127366b.0.2024.11.25.09.02.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 09:02:27 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BILq3YUs;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732554147; x=1733158947; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eqLkZhZ7p76k8PAt3meHFxaU003h0npuWguDuJNfBSw=;
        b=BILq3YUsXWJ2UsfIj19DrAgHQxyomLVVFO2pSmLGl3nbu1Hh+qdxsJbBRZ1MfVV59U
         bzN4QrXXwy/BfH6mn8aBwH6JUQsfFgTjKHmQzLuVF1kB1GaG+c1m2NWF6AdlQTnt5fz/
         yxKPAXUY26nrVmoQT7SAaOVsAFcPvvxXd7tRIDnQaTy2gqddRNGWeYuMnpnzj1UBxAxw
         YZBDF7m2wyPhhG/3rJz7uaeuvBwXzX4CiDSrZacplmcxf1s5RbVn+7cQw2cge+KAMu6b
         /1OP4h8N7K/7scUGxYQLKvXLFxc6c1FHO5MIyhUIaRixokhS1cEJxSKq7iRoIAESqcSD
         sWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732554147; x=1733158947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eqLkZhZ7p76k8PAt3meHFxaU003h0npuWguDuJNfBSw=;
        b=tc0ODxYzaPE2qpqZZQcLHLXhnjK2NV7CJGEg3WmUlYLnERv2LTomoQd2hqWiBkCR25
         8eylGyMB/LIIgXwprU3fWpnhuavuyXYQPypopyCpyiwc1yx/588umL5DE6PQifVqXVpN
         K7TVZkvS9ND0PIQNF9Z9ybW+y9weKjDL8vbJQ7xuUy+QQ4WbHGpCo4RMYP/hi09mgNvP
         cjnbQJ5VRZqKTT23l5inS9F7MvEpXyN2rCNo3nWcq5vy1Y13lde/SrASy79QbkAuCB9w
         9XWGfbwK5cYuPOlozN3Bw/hlLeszo1955HREz6u+A1dIXgUNyBzEDCN7qeT05ZX2+zhO
         drMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUqVykxlfrh/eemvu0BFobvKCWJku81t5tanDNIyw6kMwQnbwytB1k1sycMRg5Avn+qijEQ4FYWj/kVQ==@linaro.org
X-Gm-Message-State: AOJu0YzNDZqP0Tukm4FAioUeHGh+ldTh8RDUHVfmowXL91ynIIKAlZKC
	LNhEnawpMBljTP6My7bFMgPei58latGqfcRECWqDNj2rHrANZEcVldkfQyjug35zTKuZL+JkF5Y
	xzOAw9sj8GT/gcGTtKn3Z900TKyAFGwDp/UaLQn0j
X-Gm-Gg: ASbGncselxX4Y3sYfKTmGug9gHeZZDgDS7hhfXpo6/DhVh4aHwpHiP70xYZr1JuW2Zk
	/e70oYDcvy1EkOiUhPZOxZKjqMxba8GlY
X-Google-Smtp-Source: AGHT+IGz/86ZqJMIYRap/sJ993dRDzOWvj+mJ7093Ami+8aSJ2bj+9kUBYiZcETg0KqO9rcJbZ9oxnDq8SknuVLC//0=
X-Received: by 2002:a05:6402:210e:b0:5cf:ba57:b213 with SMTP id
 4fb4d7f45d1cf-5d0205a805bmr11366382a12.2.1732554146874; Mon, 25 Nov 2024
 09:02:26 -0800 (PST)
MIME-Version: 1.0
References: <20241122225049.1617774-1-pierrick.bouvier@linaro.org> <20241122225049.1617774-12-pierrick.bouvier@linaro.org>
In-Reply-To: <20241122225049.1617774-12-pierrick.bouvier@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Nov 2024 17:02:16 +0000
Message-ID: <CAFEAcA8BhxbGH7xD8rpwRq2yG-FCef2yiNc6DWVmPgTFXEbLKA@mail.gmail.com>
Subject: Re: [PATCH 11/12] docs/system/arm/virt: document missing properties
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, alex.bennee@linaro.org, 
	Steven Lee <steven_lee@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Richard Henderson <richard.henderson@linaro.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
	Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 4taHur3WrfkS

On Fri, 22 Nov 2024 at 22:52, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  docs/bypass-iommu.txt    |  2 ++
>  docs/system/arm/virt.rst | 15 +++++++++++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/docs/bypass-iommu.txt b/docs/bypass-iommu.txt
> index e6677bddd32..62818e44ed9 100644
> --- a/docs/bypass-iommu.txt
> +++ b/docs/bypass-iommu.txt
> @@ -1,3 +1,5 @@
> +.. _bypass_iommu:
> +

This is a .txt file -- adding rST markup to it won't do anything :-)

(It's one of the remaining legacy .txt files that we haven't
yet converted to .rst and moved to the right place in the
documentation. The .txt files in the /docs/ directory are
mostly the awkward ones to convert because they are a mishmash
of internal info about the implementation and stuff that is user
facing, that needs to be pulled apart by somebody with some
familiarity with the feature and moved into the right places,
or in some cases simply deleted as unnecessary.)

>  BYPASS IOMMU PROPERTY
>  =====================
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 11ceb898264..d3d21499ff5 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -169,10 +169,17 @@ iommu
>    ``smmuv3``
>      Create an SMMUv3
>
> +default-bus-bypass-iommu
> +  Set ``on``/``off`` to enable/disable `bypass_iommu <bypass_iommu>`_ for
> +  default root bus.
> +
>  ras
>    Set ``on``/``off`` to enable/disable reporting host memory errors to a guest
>    using ACPI and guest external abort exceptions. The default is off.
>
> +acpi
> +  Set ``on``/``off``/``auto`` to enable/disable ACPI.
> +
>  dtb-randomness
>    Set ``on``/``off`` to pass random seeds via the guest DTB
>    rng-seed and kaslr-seed nodes (in both "/chosen" and
> @@ -186,6 +193,14 @@ dtb-randomness
>  dtb-kaslr-seed
>    A deprecated synonym for dtb-randomness.
>
> +x-oem-id
> +  Set string (up to 6 bytes) to override the default value of field OEMID in ACPI
> +  table header.
> +
> +x-oem-table-id
> +  Set string (up to 8 bytes) to override the default value of field OEM Table ID
> +  in ACPI table header.

Do we have a policy about whether we should explicitly note that
x- options are not ABI-stable when we document them?

thanks
-- PMM
