Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1844179ejb;
        Fri, 24 May 2024 10:22:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMps3ygC1svxYTUKCIwa1UT9uKZLHPMcW1t4Q/xA5fWEY1VHXwkWsLhlV+h8MpybQKQt2fNZ7/fcwjlgk8bjmdtbArRzuB
X-Google-Smtp-Source: AGHT+IEOtjFW3rOkQqNjoDGNhMQjDBRwiz2Bm/2eYLERD6/N00kxeeeT9CgHWFmkM59yH1zdmhJe
X-Received: by 2002:a25:ac43:0:b0:dcd:5c7:8466 with SMTP id 3f1490d57ef6-df7722145b0mr3179029276.44.1716571341653;
        Fri, 24 May 2024 10:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716571341; cv=none;
        d=google.com; s=arc-20160816;
        b=lXpxvig5GeTGlErcJvIg6Ve3b2O/Ggn5CKbiQYG0wD8sCGK/RJgjp6KLdHsswy+eEn
         ALF7IoWzaEHoG2ZFd+cTpU1fqKddr7FabiDr0rlro+xhAwm0/Y/zc6vM5BSDbnLa/bVI
         aBf95eyFY8gk86MqYB+eGXjZXoHLaFD6t5v8GrVThlBIS8lDxsICL2rqL+SYwfMoVIdA
         yk9qk7qtfTCoUFX8jwLpTmd3PXMVUHMCF6IsqyXYJ3vf/JCUaCuDsMS5HzpOVPL1uZgA
         +GDuopUk5Zdj5ZU6hh+QRIPMZO3GIZYwguR3nIDbN6eAkh92uRvt1jxFET0tC1V2eRBj
         XM+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=p+cSGY0JtnJyEyyDIOldXHvk2CiVm4l7H2fIuwcCo6I=;
        fh=HZiYvpWh3hQ0p7t2cMD/KvA3QTzbAdnrjzUeVNUWMKo=;
        b=D3O14+GW0R9K3DZ9GpTPrxJMkrAxtWVoIF38Db89c0s6Fvlspq1RiOAaDy1x8BeGtO
         w0bjRnypNKyB9q+BlME7MSNBNrMKD6cdTlrr2ZX6gmQIhxJL2kjkvr52BozvfQ8f6xFp
         IS0KFBPBfE5pr8BFcfvJd27EH4foCr3aRyOoh18xfw7QRpwdeUhs0+A+f8eIqIUwrj/j
         +yqwojRKsld7CZo09DVQAVFrU9Lyjjb8tcru/fMdE2vkv0WENXI8VyVCwRihqdOcA5c1
         Id4mYc2R+fCPS9ihLyGck8xUH1lkd5T9Ibu5AxSOQD1yc8clea3H8Pq7j2dfIcKlFLA3
         CM6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@xen.org header.s=20200302mail header.b=Dts3otvi;
       spf=pass (google.com: domain of julien@xen.org designates 104.130.215.37 as permitted sender) smtp.mailfrom=julien@xen.org
Return-Path: <julien@xen.org>
Received: from mail.xenproject.org (mail.xenproject.org. [104.130.215.37])
        by mx.google.com with ESMTPS id 3f1490d57ef6-df774765deasi969900276.544.2024.05.24.10.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 10:22:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of julien@xen.org designates 104.130.215.37 as permitted sender) client-ip=104.130.215.37;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xen.org header.s=20200302mail header.b=Dts3otvi;
       spf=pass (google.com: domain of julien@xen.org designates 104.130.215.37 as permitted sender) smtp.mailfrom=julien@xen.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=p+cSGY0JtnJyEyyDIOldXHvk2CiVm4l7H2fIuwcCo6I=; b=Dts3otviMrYN5n5Bx9niYxPt6+
	coOU8MRVCysjtZkkoKTFds26H1DhBleim6dxjZdgXCfvIYRlVwC6B4nONm4QBCLW5jYKJLYi6OzSP
	9/2KApw+XGA5WmJeQOKdpvDUgcP7/mrl1YMh4TijH/uJIEDdgqinS9TYrSX5JnzDcjzY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1sAYcR-00009l-6i; Fri, 24 May 2024 17:22:15 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1sAYcQ-0004oz-Vf; Fri, 24 May 2024 17:22:15 +0000
Message-ID: <0b40423d-cf19-46a0-a86f-aefc5c7b02b1@xen.org>
Date: Fri, 24 May 2024 18:22:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 18/18] hw/arm/virt: Set SMMU OAS based on CPU
 PARANGE
Content-Language: en-GB
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 eric.auger@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-19-smostafa@google.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240429032403.74910-19-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: NrOCL3XeqQ4i

Hi Mostafa,

On 29/04/2024 04:24, Mostafa Saleh wrote:
> Use the new SMMU property to make the SMMU OAS match the CPU PARANGE.
> That's according to SMMU manual ARM IHI 0070F.b: >      6.3.6 SMMU_IDR5, OAS must match the system physical address size.

> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>   hw/arm/virt.c      | 14 ++++++++++++--
>   target/arm/cpu.h   |  2 ++
>   target/arm/cpu64.c |  5 +++++

When trying to build qemu-system-arm, I get the following error:

[1/3028] Generating subprojects/dtc/version_gen.h with a custom command
[2/3028] Generating qemu-version.h with a custom command (wrapped by 
meson to capture output)
[3/3021] Linking target qemu-system-aarch64
[4/3021] Linking target qemu-system-arm
FAILED: qemu-system-arm
clang -m64 -mcx16 @qemu-system-arm.rsp
libqemu-arm-softmmu.fa.p/hw_arm_virt.c.o: In function `get_system_oas':
/home/jgrall/works/oss/qemu/build/../hw/arm/virt.c:259: undefined 
reference to `cpu_arm_get_oas'
clang-11: error: linker command failed with exit code 1 (use -v to see 
invocation)
ninja: build stopped: subcommand failed.
make: *** [run-ninja] Error 1

I think you need to provide cpu_arm_get_oas() also for 32-bit arm (I 
guess it is implemented in target/arm/cpu.c).

Cheers,

-- 
Julien Grall
