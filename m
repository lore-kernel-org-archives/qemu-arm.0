Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2519588ejc;
        Tue, 17 Jan 2023 08:27:14 -0800 (PST)
X-Received: by 2002:adf:ff82:0:b0:2bd:dbf4:b033 with SMTP id j2-20020adfff82000000b002bddbf4b033mr12948943wrr.69.1673972834369;
        Tue, 17 Jan 2023 08:27:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673972834; cv=none;
        d=google.com; s=arc-20160816;
        b=x1FRB/Rh7/OFn7A0N2rnrV5hW5Z+9pGnUJszS7rxGH9XBnKdYHX1nK2yAETeVOx8/q
         L6VY2o3AZWQwaiCkhwEqF52lFWcvPji8ZQiPO01JWH4vSs6IHJtzCdkfPK1D5QdGASAv
         OIxFmLkajRPCPw4ebEcZAgTbQt9zvxsqciEjWNCfsX/XAhk85swjY5tJTGzdyCWUkYtk
         XPbGuEelc6Xa6UuRCZuaDSlt/BfbXRP3ws1Mx9ekNHTwPILX5PXmLhTl/eDp+eXpmLog
         amMadLradusSxONBpScxwtqtyvPr3solRVwkgueXDsqyIPCxZFaUWRnFMLPN+zdUtJJG
         3azg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QQJitedrxBjgj8+3X+4dMvB9EsIoL8cmqYpeTc+YvNI=;
        b=wMKqWxzQXdBom6nb8Stnw0Q6iXl7Dp/aQ7/VNqI6qBB2U1+LeorIPvzHsSNx9l/iW6
         wNlHNOf/iYaByvDf28UMsoXpuUL29AiFqlJ5riOqpvF5vzVJNuyyXPyn36rKZPS4VUuL
         4TYVgCK/HoN7wfuMPKAbnkxiERbSFcKAk/eWlRtfWqGf9WuCRVVC5k8qZYtLj7S9d66N
         RsSF96eeexzpseaVCbE1n4hDnZkZwhspdJS3Dc6UF3XuVM/e8Vkp2J4fsTZaWOBBmvk+
         wjplKeT1E/c1ZnrqBhgw3BQk3umTgm+R6Cbef9qXH3yJ+Ivqy0L6T9Tlg24AyjyOIGyX
         khfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dGuMI0te;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d1-20020adfc801000000b002a74a7b9ab0sor12562129wrh.57.2023.01.17.08.27.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Jan 2023 08:27:14 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dGuMI0te;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QQJitedrxBjgj8+3X+4dMvB9EsIoL8cmqYpeTc+YvNI=;
        b=dGuMI0teO9SjtxrmqYNzwhyibhvcrSV355LhxLg3gRC7Pqvoxb6vrMsRF95xdvGmD8
         WiphmgWQO7RYqFVer7e+1VzReVnOVurLyly+RPjIhZCdVVFhz2hKuzbW1kY3AWDZgkxe
         oCeBxa0XS/5fP/uF5e2oD9IflNkj4BDPOE2X+cFL6fIwz3Bzt90nMmfl6etXipGmqSuf
         dAVOITLNROvZOICT0g0Sp4Ns8eMHzyiB/v5p5GjtfDuM49WUSXVLQav4N2TIBZsSEHkU
         /7FCiCjTkNJ7KkXJMaCGaRsJrJLKSMWC4o7FaCbhRwdbqdChklxyYaIY8K8m4XmhnMp7
         Sfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQJitedrxBjgj8+3X+4dMvB9EsIoL8cmqYpeTc+YvNI=;
        b=X4UMljXHLwVJWI6wJvKcrJkS2CECVtU+eFBs5XQyPoNyiNJ6ruFmghG9xT+8LcZTCi
         dMocmyye161goKvqRgFbTycX83/nH6RA1OgVP5Z68kxSuV7swidygwvL1Kivyqv+I1mQ
         bFEv9OmArwp0smxe0iVeqEMKiz6cMT0Tf4SGb2COXvQHMPaK6/kVrLf5T/gJ0egASiOz
         I9a2hsvdCRfx0B9hVUmA7kDP6ZLXFQvRTevw5jPjAS7dcohLUpR4CUuro/1GRtEDrtde
         sJJ+TsmZpSrx9Qcjd4+m7KZQ2cHKSZLXuXkHhBDKM2sGJiH0tc458QvUDNNMZw1LLdd6
         IFdQ==
X-Gm-Message-State: AFqh2kr7zpOj7onP+U8+T62lTPVxj7O6AyMKkcjvcxEeWwc/+PUJFZay
	TmCHtbhZPKAyDoipRuC/5jQ6vvw4
X-Google-Smtp-Source: AMrXdXvE4M+3jOxN8x4zN9SkDxZlOUcNnx3nJsLUnp/YX5H5zyGFwHC1JVjkAK8NYh1zHpnxdPmfvw==
X-Received: by 2002:a5d:6e91:0:b0:2be:1ea0:f794 with SMTP id k17-20020a5d6e91000000b002be1ea0f794mr2760284wrz.52.1673972834178;
        Tue, 17 Jan 2023 08:27:14 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id q16-20020adff950000000b002bcaa47bf78sm19739439wrr.26.2023.01.17.08.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 08:27:13 -0800 (PST)
Message-ID: <0a3720ef-fbc4-2be8-14b6-2906117f9fe6@linaro.org>
Date: Tue, 17 Jan 2023 17:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 12/28] target/arm: Wrap arm_rebuild_hflags calls
 with tcg_enabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-13-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113140419.4013-13-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: OH40O63ZpWKy

On 13/1/23 15:04, Fabiano Rosas wrote:
> This is in preparation to moving the hflags code into its own file
> under the tcg/ directory.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
> I extracted these into a separate patch so we can discuss. If I move
> the tcg_enabled check to a header that would add overhead for all the
> calls where we know for sure that the code is running with TCG. And I
> don't think we want a new arm_rebuild_hflags_foo to be used for common
> code.
> ---
>   hw/arm/boot.c             |  6 +++++-
>   hw/intc/armv7m_nvic.c     | 20 +++++++++++++-------
>   target/arm/arm-powerctl.c |  7 +++++--
>   target/arm/cpregs.c       |  2 +-
>   target/arm/cpu.c          |  3 ++-
>   target/arm/helper.c       | 16 ++++++++++++----
>   target/arm/machine.c      |  5 ++++-
>   7 files changed, 42 insertions(+), 17 deletions(-)

Shouldn't we also restrict arm_rebuild_hflags() to CONFIG_TCG in
target/arm/cpu.h (to be sure future code using this helper stays
TCG-only)?
