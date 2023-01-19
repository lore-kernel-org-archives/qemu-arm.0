Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp548586ejc;
        Thu, 19 Jan 2023 10:50:50 -0800 (PST)
X-Received: by 2002:a17:902:d2d1:b0:194:c5d6:328 with SMTP id n17-20020a170902d2d100b00194c5d60328mr6175421plc.35.1674154250498;
        Thu, 19 Jan 2023 10:50:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674154250; cv=none;
        d=google.com; s=arc-20160816;
        b=f9OitzkBskDy/s8OZLj54qCg7hXYsC/mzXuYRWqV5bO6LUbiqFYrelBR3DxgK4sRe9
         UFJjDZOMzueZoA2IdUaZdvLa86oBprPLbIAsadWyRD21SAfu7WoTg+9mNVsXUfGi7t5t
         UShTJipcT5r/40GhdbUc6iZ6kzQ9GWFuWtPlOjcTy1TNEFlhIxjlwd+RsYNhdOP5d/JP
         53bzznQkVyYg84qjwOuTmK0saoxm1JY6MOFO8EV0oABoRydoGq+G/zNWiwK9bPw6lVj3
         mf4wxu4nEXLrn3w521huaiwWWKqgAUMaXtKlJJggsYVQX6ptabMmxbhalc3+AoxGYpVQ
         hhKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=GdyIqDBORKeBIB2nqzTteC62DEqWIRgpw3MYBaoO79k=;
        b=EPp6OWgmxYHOT4CU4v4HTThuzZ4Z84RgZzcsuKEBHP+vK7L/UKYHZfSDf3KtJqT0ob
         rypzQ+ahbVkbwnsq5XA4E6GdbZuo3HNBs7hUkzOfae4R68p189ZqFVaranRNTecs6hVl
         h6Nw3QQgtfB5D1EJBKgFdaWih/z1kPyp1nWFc2VX/2YkqrkUxORKeWoT+LYQ4T2bHah3
         1sCcUM9BK/QspUx2vofNv2DEdgx62fpVjaNcT+rcjuONCk1rPdHoPcD7ytmvWBzk+Qay
         EBqGQsBhqN75xbA+dLT5HlZkrlmJwzbeBfVREdds39OQZv+1sw+zD1W38UcKG4zHzdP0
         z5Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o0QBdw2F;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ba7-20020a170902720700b00194c0547e6dsor2013277plb.25.2023.01.19.10.50.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jan 2023 10:50:50 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o0QBdw2F;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GdyIqDBORKeBIB2nqzTteC62DEqWIRgpw3MYBaoO79k=;
        b=o0QBdw2FW1W0XFLhImcQC8ks//Xpte1wwEstxPreCiU2aPYvY8L9mpthS/ybGnv20Z
         x7fsrVscCD2FORWmV1alL7cEeGBX4A4sFJmTDyaMoCZxuyrhPLmDJXd0drFkyJW7D/6s
         Pf1jE8ZADB+FsKA3qOHvFidv4aI8IfF19XFZNlzY7RZ4EF99xr89saJkPcP4urwjKyKb
         6LZjv6Sio/eaSnozgYfYRLmhOgf5j/2y1OHg7p/2QW6n3ljXdQ1My8eNMNfWsp+BIuj1
         MB9CPQ0pR71GyXeKimXZ68Cla+KtOa+9kzRghLz2BPZefQ6B6V1hyBeIF3/hSZ1pLtG9
         auLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GdyIqDBORKeBIB2nqzTteC62DEqWIRgpw3MYBaoO79k=;
        b=S9OjxwgBVpN9BFXLuFu9dctcqO0PHKAwdfLH4mS0yxWg6eO2vG5wHs1U0ySEI0rKNA
         SC9ZwMjPHYJnzeBpKWINLCAazdoD/FGL+8KTLSUfs3FM9qhz8YrddWwL3AuF6/371BoF
         4ATkqlnfpze2bG14mngb+Sfe+P3mighub1mm7o3zDXi6THgmvQpOwYf/VdDemEdAnBne
         XuZ//lAVR2Dp9z/cuW3pke4BwgcEybB1DC+w93iFTNZGhikZSzx+fA1MzeixoQhOCH+N
         QUxOus3UHLLnk7uByOTogaPd5e7VTfqLUTS5uOHwCTB9HzCECU0W8m9KmcZc6q6jWEWu
         +Njw==
X-Gm-Message-State: AFqh2krT2ofW+YHSSGi4+BjV+Ez4HcvVANBKtix9o95LpBiUGgHeguPY
	VKsqrxd+U818dHyCUoPzxWUV0Fg6
X-Google-Smtp-Source: AMrXdXtyBA1xw4TzTDqX8pIhH+F79cS6awa9UalcOABaKUzLnLkp7UhbXhxMDHqOkOANGzLNCEjdAA==
X-Received: by 2002:a17:90a:6a42:b0:229:4dd1:359b with SMTP id d2-20020a17090a6a4200b002294dd1359bmr11952790pjm.22.1674154250072;
        Thu, 19 Jan 2023 10:50:50 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id z15-20020a17090a66cf00b002293b1aa2b6sm3366176pjl.30.2023.01.19.10.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 10:50:49 -0800 (PST)
Message-ID: <d700c608-f886-8b6f-1ecf-bc48cf671153@linaro.org>
Date: Thu, 19 Jan 2023 08:50:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v4 15/15] arm/Kconfig: Do not build TCG-only boards on
 a KVM-only build
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-16-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119135424.5417-16-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: RwHiLDJiMDni

On 1/19/23 03:54, Fabiano Rosas wrote:
> Move all the CONFIG_FOO=y from default.mak into "default y if TCG"
> statements in Kconfig. That way they won't be selected when
> CONFIG_TCG=n.
> 
> I'm leaving CONFIG_ARM_VIRT in default.mak because it allows us to
> keep the two default.mak files not empty and keep aarch64-default.mak
> including arm-default.mak. That way we don't surprise anyone that's
> used to altering these files.
> 
> With this change we can start building with --disable-tcg.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> sbsa-ref has an explicit check to avoid running with KVM
> xlnx-versal-virt has avocado tests tagged with tcg
> ---
>   configs/devices/aarch64-softmmu/default.mak |  4 --
>   configs/devices/arm-softmmu/default.mak     | 37 ------------------
>   hw/arm/Kconfig                              | 42 ++++++++++++++++++++-
>   3 files changed, 41 insertions(+), 42 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
