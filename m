Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1547522ejo;
        Wed, 13 Dec 2023 03:20:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrr6eIzV8YR3QyP1MR2Bn4ev4eADsGVjiNTErZlW3gz5P/Pp+U4wNgmYob5Fe5KjzsVIPi
X-Received: by 2002:a1c:4b05:0:b0:40c:2dd8:3a18 with SMTP id y5-20020a1c4b05000000b0040c2dd83a18mr3575342wma.6.1702466427646;
        Wed, 13 Dec 2023 03:20:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702466427; cv=none;
        d=google.com; s=arc-20160816;
        b=l0T5aMYmFaeBgEESeHhr9Twsd+Ruj6Bs0LDU4hXcZZJBoeh/IM3T0+fuq+zoi6lLTi
         gKvn6xBKwOLHtNhpYZn5nHI60CPUyep4xFnfeb0GCNS+QWkB7ez83IjPEKMWFXQKk7QQ
         66gYfSsVyP9dFOietAnqjwBpj5zpEQT6gMqwmy0rvj0Ks3U3ncHu590wvvrNZZXXIBWt
         GJZCb1TLzW26LTFAAO64lJbWKwaZFYCbRLki5N3LMmb4mRo2CGiXNicYDegnyxpvCa5D
         NsaHr+zcwE0PSunm691ZnVGKnnIc6NLaTugaCo2X7EQD07NoHHN1+9b2ac1iIkGUqwo3
         IsJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ppt/ddrAQrRUY856oSykvJQUIFjAlxTZkZOYQ+t2gDk=;
        fh=NOh/4PDmi018MJvsM0CAUsxG5AhySrTgEfSOKx6HuU8=;
        b=oXChpZWhM+x9faq5QGcXXwb+c634CctSdCBA/XY6JMJ7+BCm1wxrtjwCK0+eywQqH8
         MDmzP4OVm7elwlm0ObpZJuxih/T3jddZsSR9zqoa3C0Ab0JTtsGbPcn/GyY5B8DR78Uz
         I+ZkCd26dml0NHIXPgdhDpGS6GlfgzDUr5If58tgvnTFcn1HJFfPTgHtzOxQGexoRY0t
         iJGHIZvGDt9Og6ket2Vrj7WV++YODMZxPiEj5TrXHHakHOGoByS9CpJ5FtG1ZWDlWYNA
         lhyrlZrv+pXtu7gG6RoYLag/HlBdomzY2jbTHwfkbKB53hP/DXcsa6PXgQfbiEJWlfKs
         XSpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=xk8sKxxx;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
Return-Path: <anjo@rev.ng>
Received: from rev.ng (rev.ng. [5.9.113.41])
        by mx.google.com with ESMTPS id hn4-20020a05600ca38400b0040c0aa8ba34si6553540wmb.116.2023.12.13.03.20.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Dec 2023 03:20:27 -0800 (PST)
Received-SPF: pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) client-ip=5.9.113.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=xk8sKxxx;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
	s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ppt/ddrAQrRUY856oSykvJQUIFjAlxTZkZOYQ+t2gDk=; b=xk8sKxxxaHqLiqiFv8zWZLxmf5
	P2Q9ATwaPas8xHziyQZCrKT+zzTjmqb0t1mb52a2WSATeIKHcPdOnqDNcxCL4VYQZl1ukCiOExpsf
	idfhoJKK8aKQpcdDOuVHZ+DWnpW0Wbwz0huxwFIb8EcgJgOQyV93c4hqcPHiBIovvR0M=;
Date: Wed, 13 Dec 2023 12:20:15 +0100
From: Anton Johansson <anjo@rev.ng>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>, 
	qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>, 
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Warner Losh <imp@bsdimp.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Alistair Francis <alistair@alistair23.me>, 
	Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v2 15/23] exec: Declare target_words_bigendian() in
 'exec/tswap.h'
Message-ID: <ryg3gighbp4tzel44ogzgvt42nwehllmfjrfe4brhpjgornd22@o4glvgq2p67j>
References: <20231212123401.37493-1-philmd@linaro.org>
 <20231212123401.37493-16-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231212123401.37493-16-philmd@linaro.org>
X-TUID: 1fjmpgMehMal

On 12/12/23, Philippe Mathieu-Daudé wrote:
> We usually check target endianess before swapping values,
> so target_words_bigendian() declaration makes sense in
> "exec/tswap.h" with the target swapping helpers.
> 
> Remove "hw/core/cpu.h" when it was only included to get
> the target_words_bigendian() declaration.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/exec/tswap.h     | 12 +++++++++++-
>  include/hw/core/cpu.h    | 11 -----------
>  cpu-target.c             |  1 +
>  disas/disas.c            |  1 +
>  hw/audio/virtio-snd.c    |  2 +-
>  hw/core/cpu-sysemu.c     |  2 +-
>  hw/core/generic-loader.c |  2 +-
>  hw/display/vga.c         |  2 +-
>  hw/virtio/virtio.c       |  1 +
>  9 files changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/include/exec/tswap.h b/include/exec/tswap.h
> index 68944a880b..77954bbc2b 100644
> --- a/include/exec/tswap.h
> +++ b/include/exec/tswap.h
> @@ -8,9 +8,19 @@
>  #ifndef TSWAP_H
>  #define TSWAP_H
>  
> -#include "hw/core/cpu.h"
>  #include "qemu/bswap.h"

This breaks system/qtest.c which gets first_cpu from hw/core/cpu.h 
through the inclusion of tswap.h...

../system/qtest.c:548:33: error: ‘first_cpu’ undeclared (first use in this function);
  548 |             address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
      |                                 ^~~~~~~~~

Adding hw/core/cpu.h to system/qtest.c seems sufficient.

Otherwise,
Reviewed-by: Anton Johansson <anjo@rev.ng>
