Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1637017lfm;
        Thu, 23 Apr 2020 01:36:35 -0700 (PDT)
X-Google-Smtp-Source: APiQypK1BfgFbexJAWRXHU8VKkrq8WG0wCyKZE94Cj+yAo2TxGypVJP2lSzXnTbZoWd4Jf70HwR6
X-Received: by 2002:a25:2904:: with SMTP id p4mr5285395ybp.475.1587630995590;
        Thu, 23 Apr 2020 01:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587630995; cv=none;
        d=google.com; s=arc-20160816;
        b=n3zE95NqoeH7/372rxH9KoUcTeunqVIhqxAy3AMFYs9eKEnLyyACtduBIbYewxdSn4
         ycPzYC2nGRWauqHcZbChl6IWLzDF6f09ucxhb2xMgwJnw9xKibMycwcyTFS2D4ix3suU
         WHCbrDKGwaVM/5MGl9ePqtGBj1dfv9/vBXf72HOBxb7oQodmBwpZs2aRwMxKFHD6TljO
         O6IBJiCULUc1g7YxLXVhKk4RZBpLi05Rk1J1Yjc4V5wwsiKFwZRlj3h8sSj2T2hB61LS
         oCx+uWWICyAFn/G4SvPY/5Jpbzp5xaHvpz9EwPDA3xlvCL22BRlTPKh6n66a0cv/0svN
         YAFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=jt2SI3Ec4+DBoM95/mhaSkMRQB7x7rtS4p5XoJdtD18=;
        b=rOgkKhQl3SP1QE+nGSIKRxgzrC0cSc1nOszOI9t9eG9ys5IxTO01MivXwIPdj7jwv5
         w56lx0bceKfAVDLtYNk8/HNy8Lx8tBCTP2J5kZGabFdo47ib4N5kD4xBT+q+W7M/Rjbg
         ubHhv5a/CnKUQ5HqV4oEG1mDduyxC3tOQ6NwxiFNlXCTsbzd0fYzus0SIloSnwBjErzr
         SuZkqophJswAPBXFsBw7FOxTe9K8CR2a8YAIbN3mwMROcAbBea+F+8Xh193wnSCurRVv
         R640pmlRVvsYGeTSCEEnjD1Pwrq3ONGoYGJXrGfaZ1Mnh2JAyQbYMGrySff6Vpex8/2r
         Wlyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hfnvJ/WG";
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id k7si1731181ybp.354.2020.04.23.01.36.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Apr 2020 01:36:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hfnvJ/WG";
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587630995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jt2SI3Ec4+DBoM95/mhaSkMRQB7x7rtS4p5XoJdtD18=;
	b=hfnvJ/WG3/97SLKhQaIQPdG9hgMH+HARDGZ4ennj15p/BtIHZzZpmW4Yh3EjXpGt+pdZEq
	p9acxjjP7SINXbAzwYgd3gCHXMJmCqsrpuFfp3/BsAus6iJZFNgkWJpoZf6bJoA7DXB7vy
	ZZHmKSfFkz+BfVtQkh30sl7kzRQKPiE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-hC1J-J0ZNSuyqNY0PPwS3w-1; Thu, 23 Apr 2020 04:36:33 -0400
X-MC-Unique: hC1J-J0ZNSuyqNY0PPwS3w-1
Received: by mail-wr1-f71.google.com with SMTP id q10so2509451wrv.10
        for <alex.bennee@linaro.org>; Thu, 23 Apr 2020 01:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bRD8O5iG7EfvWKOKXBFAGi4rL5dnL8/PwE9Z+SSrmik=;
        b=mB5dKMMyGgBu2v0U72VAYnNTXfBD1OzLelABfdqq0qdx+UQ5Pa6dpjAFUl+HJ5xXHY
         P/u5SOskwrC0eF5kQKeDTDk04F/mjBzierKshS8NqZOGaszI4AefrWvvJ8S/tdnhBm2n
         nkZu/4fUdhEJgr48b74zEjbKXztXO0IairW+CLD6mfaSzoa+cLncMDb6hKdRChG7OHU3
         m6wskJseBHixp40mzcHITRc7kuYmo/UgMhwcsp8NGzzejlmbq+TX2CyC2yeXZRerCwbw
         7jw7UBsa2xrnBTOJB2461lnakzd3cA3d3l/XIZYH8UlvKa5MIw+RYHp4wDC2lfYx+h11
         lQzw==
X-Gm-Message-State: AGi0PuYRQMhD9fkaV94Fqzp7Z7bs+Qx7lVwrddANVLG/6kdW0tr2GnUd
	MlMofIaZVYdPVKMn1Zo+yXk8dPIiGoFq1Xa/akMJQKHiEs/vJuBowiJYJOtVAT0ffm+kIxdHJbf
	fwdNP8qS17sho62Mv
X-Received: by 2002:a7b:c84f:: with SMTP id c15mr2725575wml.166.1587630991696;
        Thu, 23 Apr 2020 01:36:31 -0700 (PDT)
X-Received: by 2002:a7b:c84f:: with SMTP id c15mr2725541wml.166.1587630991255;
        Thu, 23 Apr 2020 01:36:31 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net. [83.42.57.116])
        by smtp.gmail.com with ESMTPSA id h188sm2861902wme.8.2020.04.23.01.36.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 01:36:30 -0700 (PDT)
Subject: Re: [PATCH v3 10/19] target/arm: Restrict ARMv4 cpus to TCG accel
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, Thomas Huth
 <thuth@redhat.com>, qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-11-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6849be34-8e45-98f8-7424-0fdb9466e9bd@redhat.com>
Date: Thu, 23 Apr 2020 10:36:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200316160634.3386-11-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: YFnQExUYwD6g

On 3/16/20 5:06 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> KVM requires a cpu based on (at least) the ARMv7 architecture.
>=20
> Only enable the following ARMv4 CPUs when TCG is available:
>=20
>    - StrongARM (SA1100/1110)
>    - OMAP1510 (TI925T)
>=20

I missed to explain, the point of this Kconfig granularity is on a KVM=20
only build, the TCG-only CPUs can't be default-selected, so most of=20
their devices are not pulled in.

Instead at the end the KVM-only binary only contains the devices=20
required to run the Cortex-A machines.

> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
> index 8b89d8c4c0..0652396296 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -17,8 +17,6 @@ CONFIG_INTEGRATOR=3Dy
>   CONFIG_FSL_IMX31=3Dy
>   CONFIG_MUSICPAL=3Dy
>   CONFIG_MUSCA=3Dy
> -CONFIG_CHEETAH=3Dy
> -CONFIG_SX1=3Dy
>   CONFIG_NSERIES=3Dy
>   CONFIG_STELLARIS=3Dy
>   CONFIG_REALVIEW=3Dy
[...]
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index e3d7e7694a..7fc0cff776 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -28,6 +28,7 @@ config ARM_VIRT
>  =20
>   config CHEETAH
>       bool
> +    select ARM_V4
>       select OMAP
>       select TSC210X
>  =20
> @@ -242,6 +243,7 @@ config COLLIE
>  =20
>   config SX1
>       bool
> +    select ARM_V4
>       select OMAP
>  =20
>   config VERSATILE
> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
> index e68c71a6ff..0d496d318a 100644
> --- a/target/arm/Kconfig
> +++ b/target/arm/Kconfig
> @@ -1,2 +1,6 @@
> +config ARM_V4
> +    depends on TCG
> +    bool
> +
>   config ARM_V7M
>       bool
