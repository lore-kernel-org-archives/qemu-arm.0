Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp222350njb;
        Fri, 7 Feb 2025 06:14:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVmGf1DlXX0nF34DMclrr1/xFnswv8nmpHKojWIsIAD46UyIQX7JdUztch1i935G0kBHsetO5ywIVwcuQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH/WOupODNS+7WG1SkuHBywFK9ukKsNoxMFs8eF+f8GpK38CxcXPpMbXsqEUSXYhmxNxbYu
X-Received: by 2002:a05:6870:7e0c:b0:29e:3345:74ff with SMTP id 586e51a60fabf-2b83ed32957mr2163571fac.23.1738937655927;
        Fri, 07 Feb 2025 06:14:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738937655; cv=none;
        d=google.com; s=arc-20240605;
        b=CRvbnWCqI0U+/vZXKxRv6+WZYn+TrqJ5sqL70n8SCBDMNToTkSxkcQp15BPqqKIQA1
         PAAg0d4fsRnk9+FoAo+My7lyXneALhgWH51GvDBV/l0fhuHiBmCCeGGftgcaeL2wqwzD
         +mfTU/RiA/3d30qDBnpjXmDqgdGtEvoWpsnFWOIQmXIJCMnv2Rr+Rlu9U2wP2uKg0ZCX
         jvPBiwbCpKbBMj9YSvxT1an3QxpD4sKEdiyNkCMzbq9pxHyYcagschYdLdkVYKRvKiu6
         +7A8aUsWWAWVQNhk87m5+WbVEQAc2w5E8KA/qkHYwmnUaZ9xEZrqshLzFt5u9BOQq1B2
         aMrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:user-agent:references:in-reply-to:subject:cc:to:from
         :message-id:date:dkim-signature;
        bh=c1HjyGYP9Yh1bpuq/AQdfUFM/6mCld5HBhtBj3UTk5E=;
        fh=M9IGPqzCvlwYRZmitoF3Os13Fza8XodbUcWXmIZpaC8=;
        b=QUelZQUTrYpC1+2W0ErrhMMhaaOKS+hY9Xt33p+UIS6KsY8TY163+h+nQooQ5HHbWz
         59hAAezcNJWvuDyLkLtnVXi8vd01MmhNB3Xy0CzH5pLPtNi++H6ZELrEAZLsttAqm2U3
         Sek1QAEz+lkJ4qjvZ2O0f4pdQ9gH0aaHsbI+uuG4SQkaSRPAgiEl8lPx29p0G3HGJmzN
         lRnwGW2CFOwDmZHuwx4QjQCAqH1YzFuL9njnxG4pshJMbuAK2cnjDv1RWd4nk6EgDZ3C
         Igjoo3/jEkDbgeU3TDjQzFuhwy22yMen5tWMhJKndkcIZdEGW4mwdBu6GAgChbxLZAkd
         xLAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=IMF89quz;
       spf=pass (google.com: domain of maz@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=maz@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <maz@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [2604:1380:4641:c500::1])
        by mx.google.com with ESMTPS id 586e51a60fabf-2b825fcb4absi3244945fac.74.2025.02.07.06.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 06:14:15 -0800 (PST)
Received-SPF: pass (google.com: domain of maz@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) client-ip=2604:1380:4641:c500::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=IMF89quz;
       spf=pass (google.com: domain of maz@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=maz@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BCB955C6197;
	Fri,  7 Feb 2025 14:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257FEC4CED1;
	Fri,  7 Feb 2025 14:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738937655;
	bh=9Q6k4uezwb7VUfhzCeqFc7EI03BM8d56WV2+2oon0wI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IMF89quzHiFrKbQeJHgRxksbqXc9XkoxNrvT4Vj7bLc+hgfn5RNEvgTCJqnnTR1YS
	 kAko3RZPqpqae8Bv6Ihm0sLPDl0jWbiT8mdSKu3S+t/bpssPkv9PT/1kS0XbAVTAEK
	 pLnQSly3b6TW08GNd1+fUeoTvNEAR50ADA2berl9oD5yWrmKdUYKiGEXN33ZYuv+Dw
	 fuMwofG15M746zvxM0xZ25aNR6P9SIPjE4WbzzzE0f9WiSLPw+qlaTWOY+HC5j8Gim
	 K7KwJIFrWBPMjnYrrPzZXHR7UrL5aLDMLulGiPIBwzIbxEDLxZtBWXe274foZSy5N5
	 RknoWtjXrRSEA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tgP7U-001eJU-VB;
	Fri, 07 Feb 2025 14:14:13 +0000
Date: Fri, 07 Feb 2025 14:14:12 +0000
Message-ID: <86ikplu9jf.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvmarm@lists.linux.dev,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	oliver.upton@linux.dev,
	sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com,
	berrange@redhat.com,
	abologna@redhat.com,
	jdenemar@redhat.com,
	shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com
Subject: Re: [PATCH 14/15] arm/cpu: Add sysreg generation scripts
In-Reply-To: <20250207110248.1580465-15-cohuck@redhat.com>
References: <20250207110248.1580465-1-cohuck@redhat.com>
	<20250207110248.1580465-15-cohuck@redhat.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: cohuck@redhat.com, eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org, richard.henderson@linaro.org, alex.bennee@linaro.org, oliver.upton@linux.dev, sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com, shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-TUID: xEue/wFiIdu3

On Fri, 07 Feb 2025 11:02:47 +0000,
Cornelia Huck <cohuck@redhat.com> wrote:
> 
> From: Eric Auger <eric.auger@redhat.com>
> 
> Introduce scripts that automate the generation of system register
> definitions from a given linux source tree arch/arm64/tools/sysreg.
> 
> Invocation of
> ./update-aarch64-sysreg-code.sh $PATH_TO_LINUX_SOURCE_TREE
> in scripts directory do generate 2 qemu files:
> - target/arm/cpu-sysreg-properties.c
> - target/arm/cpu-sysregs.h.inc
> 
> cpu-sysregs.h.inc creates defines for all system registers.
> However cpu-sysreg-properties.c only cares about feature ID registers.
> 
> update-aarch64-sysreg-code.sh calls two awk scripts.
> gen-cpu-sysreg-properties.awk is inherited from kernel
> arch/arm64/tools/gen-sysreg.awk. All credits to Mark Rutland
> the original author of this script.
> 
> [CH: update to handle current kernel sysregs structure, and to emit
>      the re-worked register structures]
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  scripts/gen-cpu-sysreg-properties.awk | 325 ++++++++++++++++++++++++++
>  scripts/gen-cpu-sysregs-header.awk    |  70 ++++++
>  scripts/update-aarch64-sysreg-code.sh |  30 +++
>  3 files changed, 425 insertions(+)
>  create mode 100755 scripts/gen-cpu-sysreg-properties.awk
>  create mode 100755 scripts/gen-cpu-sysregs-header.awk
>  create mode 100755 scripts/update-aarch64-sysreg-code.sh

Shameless plug:

https://lore.kernel.org/r/20250102144339.1564778-1-maz@kernel.org

You could use (something like) this to generate the sysreg file itself
from the architecture data, or another representation as required.

	M.

-- 
Without deviation from the norm, progress is not possible.
