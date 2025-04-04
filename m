Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4688571njd;
        Fri, 4 Apr 2025 03:41:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVpqcRkagnkzWu8ha/WT+I2rcINam9YB/MsM8EprBloKKfEu6c0GhSRkN++7AVGh17CuEQ/BosNWjWoog==@linaro.org
X-Google-Smtp-Source: AGHT+IFQWXjdCy48x91rE41Fg3LcoNnJQCehIIs527Cjrj9drutBlje07Uuco3WLzjbw2sep1VK4
X-Received: by 2002:a05:690c:688b:b0:6fb:9280:5bf4 with SMTP id 00721157ae682-703e33187c1mr37781207b3.30.1743763277299;
        Fri, 04 Apr 2025 03:41:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743763277; cv=none;
        d=google.com; s=arc-20240605;
        b=KHRoegAdy7LNXqk4A92KHL2RgMnTs7uxifrbSCUcJL+N8x0a/tGFdPZ5zM6BrgAdg/
         9ooQn3q2XmsIYmX4fc5jR3swYfMw517hj3j5xJN1e2GMmCDryAcrQ5D5zPWXCMqVkyIJ
         mye2swOF60PrCP3vox/CrGBxke5YZkR5HbxnPkOw28MgCX2TTZqg/8ObjtOStz2Cbd+2
         BrI1I8CdrJ2IiByn9hgugpiXaAU09XyOrkHynN0CduIf5PMeZuw67X8iUpyJo+l/q5S+
         5vTROKgrjNN+XgRfgbozity48aIgf19PLrU9jX8tArzNqi28TP5ogf2oNcqIodE7eJsU
         vyJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=YiKiZDA8EWFpdbB+bNybfbo35qu9M0V7x/neLlvqdns=;
        fh=K00C1N1oHCTN+PDqVv4OivM+G51sG5ANxJi6rphl6Ng=;
        b=lEVy+Dq3+SzhPuL2RzGeha0d8weP5USdtOEbF3LF821U+Pdkd6wnNKrNWZtwRcDTSj
         oLZzRwDqKfUhDhUd/1qa1d5eTuPsHGQyMRP0ARtjc5tTdBCMseMfEzrgFYF1tTN9Nx0/
         Psb+X9qsjxbOVhi6MUW2R5PrHN+9lRGFAtWY1W6QGVkw7eWTTcbWH95NknkraJqxA+t0
         RsOvG786FN0z01TQu0r34jEbLazFhw/ZrdwS/pSU+jxJJFf7j2CUwb7KX85a+cBxi0bI
         M9npG5yAgzSfuDnNRiQ//UIFWJC/5CwZBhqkn5AlAzJbHaSiokab9BGIoH8aPr/eW1ny
         k3vQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ld2peKzJ;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 00721157ae682-703d1e65f7dsi51043267b3.111.2025.04.04.03.41.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 03:41:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ld2peKzJ;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743763276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YiKiZDA8EWFpdbB+bNybfbo35qu9M0V7x/neLlvqdns=;
	b=Ld2peKzJsyP0J/XQoHZLUbAaL4IPp0lkeJjdNDRkzvCJ5JDal3iXrlru5EnR/tb/axyiKo
	aLsmtneaw1bOZ6QnrCto8346XJ2SX7392WF0VJhi1ljCTTJ0mhr6FbIrxlmLSc83/2k12i
	Tr2aRPibJm1QHt3AXH+nvE9bo6qjRLg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-4Uzmdq9gN2efok6xa14jxA-1; Fri, 04 Apr 2025 06:41:15 -0400
X-MC-Unique: 4Uzmdq9gN2efok6xa14jxA-1
X-Mimecast-MFC-AGG-ID: 4Uzmdq9gN2efok6xa14jxA_1743763275
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d51bd9b45so12411775e9.1
        for <alex.bennee@linaro.org>; Fri, 04 Apr 2025 03:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743763274; x=1744368074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiKiZDA8EWFpdbB+bNybfbo35qu9M0V7x/neLlvqdns=;
        b=nKGIlCvxeP8lzvXFE3aImAEk3iqxbAvRqD27IZfS7KIy9D80KQTdHdHwxTZsVcTz4I
         xMSV8STqRia8Y26Ay/YAYqNIDKaRCQUqoAELw5lgGgkZ5gR+Uvz96xylV6d9YIQ+4NNd
         Gpr9CeqW5m80K5cEXCP5CCWW/bQAshcjao6MzkCRQwXnuSgMdnULTEeZ1W9k0N/hOAtP
         ERPcQe9ZGZAHiyg2d4M5FxrB5HRYusKc8ZV/wy54QSN31oyE7ev+zH6CbXC4G4ZtKMDz
         xG600jdNExLFjcCGTr3D1TuZIeJhhpCfY74J8+1zDRx0/1BcomwPuR/JVzd0bIfw76aO
         h5AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC+c38n8oRlEER6PqyMNpCbfEDok5bMVAXeXaE9u6MW1QFtwDRP1p8tQ4Daex8zUbgvTN9k4BvY6LlVg==@linaro.org
X-Gm-Message-State: AOJu0Yx16IfltQANOUB4jazE1W4CtUt1rh4PpC6aRvzlRgTepj4GHeAA
	XN35ME216/f5fV5/ApBZCk804BEdhb+PE4NOUzUjT8CGV9ZhT8w+1hY7HjHYBI4Pm0CMaaldLl8
	Bffv1XQexHCc3NuX3XHI46HJxep+CToTNkAMGD/mYHq/8CVLSez85eg==
X-Gm-Gg: ASbGncsEkUygyEbSkuOwAHOF4cpTAYHf9P2w27cDibYHd6wxV00u9ppR+m3sSLC10hC
	W6IvVOgJE20qP70wqgCVtM+toXRso4USCmVCgSa3z9Bz+/bash1zswC5hTdCxAQx+phvm8qFcLu
	Gwk3rMOK7KVMLE/92gj0eSOE7wQDRjWMO2qOCj88YbeSgUiflpeGykaTjsn618WipJ80DNNFxmB
	z/eKG0ggq0ZJluonZQzPHkrAvo2GwJa5WLuXI3VJLx8elqVjJQdx4urSlPgb86Z4BPBrAhBLY1M
	7tWVLQV/8BHpuGYwego1iwLHVsskgh68FyTJ
X-Received: by 2002:a05:600c:1384:b0:43c:e9f7:d6a3 with SMTP id 5b1f17b1804b1-43ecf85f526mr23259015e9.13.1743763274640;
        Fri, 04 Apr 2025 03:41:14 -0700 (PDT)
X-Received: by 2002:a05:600c:1384:b0:43c:e9f7:d6a3 with SMTP id 5b1f17b1804b1-43ecf85f526mr23258635e9.13.1743763274263;
        Fri, 04 Apr 2025 03:41:14 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096896sm4092874f8f.19.2025.04.04.03.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 03:41:13 -0700 (PDT)
Date: Fri, 4 Apr 2025 12:41:10 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Gustavo Romero
 <gustavo.romero@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Ani Sinha <anisinha@redhat.com>, Udo
 Steinberg <udo@hypervisor.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Jones
 <ajones@ventanamicro.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Fabiano Rosas <farosas@suse.de>, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, Shannon Zhao
 <shannon.zhaosl@gmail.com>
Subject: Re: [PATCH-for-10.0? v2 13/14] hw/arm/virt-acpi: Do not advertise
 disabled GIC ITS
Message-ID: <20250404124110.59c59dc3@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250403151829.44858-14-philmd@linaro.org>
References: <20250403151829.44858-1-philmd@linaro.org>
	<20250403151829.44858-14-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: taPR5g31CuSWWi54fsoUylMERJAD0P5zTfOOJjIfA_o_1743763275
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: WHIk2YtdCK+g

On Thu,  3 Apr 2025 17:18:28 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> GIC ITS can be disabled at runtime using '-M its=3Doff',
> which sets VirtMachineState::its =3D false. Check this
> field to avoid advertising the ITS in the MADT table.
>=20
> Reported-by: Udo Steinberg <udo@hypervisor.org>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2886
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>  hw/arm/virt-acpi-build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index e7e27951cb9..38a9e6fe0c5 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -212,7 +212,7 @@ static bool its_enabled(VirtMachineState *vms)
>  {
>      VirtMachineClass *vmc =3D VIRT_MACHINE_GET_CLASS(vms);
> =20
> -    return !vmc->no_its;
> +    return !vmc->no_its && vms->its;

It's confusing have both no_its and its,
it would be better to lean this mess up (i.e dedup or rename if something i=
s poorly named)

>  }
> =20
>  /*
