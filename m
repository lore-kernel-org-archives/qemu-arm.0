Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f204sm3881422wmf.32.2019.10.31.08.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2019 08:01:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1E7371FF87;
	Thu, 31 Oct 2019 15:01:02 +0000 (GMT)
References: <20191031040830.18800-1-edgar.iglesias@xilinx.com>
 <20191031040830.18800-2-edgar.iglesias@xilinx.com>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, figlesia@xilinx.com, peter.maydell@linaro.org,
 sstabellini@kernel.org, edgar.iglesias@xilinx.com,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org,
 frederic.konrad@adacore.com, philmd@redhat.com, luc.michel@greensocs.com
Subject: Re: [PATCH v1 1/1] hw/arm/boot: Rebuild hflags when modifying
 CPUState at boot
In-reply-to: <20191031040830.18800-2-edgar.iglesias@xilinx.com>
Date: Thu, 31 Oct 2019 15:01:02 +0000
Message-ID: <87y2x16jtd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: CK3DYdxjxTJ2


Edgar E. Iglesias <edgar.iglesias@xilinx.com> writes:

> Rebuild hflags when modifying CPUState at boot.
>
> Fixes: e979972a6a
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/arm/boot.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index c264864c11..ef6724960c 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -786,6 +786,7 @@ static void do_cpu_reset(void *opaque)
>                  info->secondary_cpu_reset_hook(cpu, info);
>              }
>          }
> +        arm_rebuild_hflags(env);

Do we just get away with armv7m_reset because there is no futzing about
with execution state?

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>      }
>  }


--
Alex Benn=C3=A9e
