Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t91sm1944874wrc.21.2018.03.09.05.46.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Mar 2018 05:46:40 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 45D9E3E009E;
	Fri,  9 Mar 2018 13:46:40 +0000 (GMT)
References: <20180308130626.12393-1-peter.maydell@linaro.org> <20180308130626.12393-6-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Igor
 Mammedov <imammedo@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Subject: Re: [PATCH v3 5/6] hw/arm/virt: Add "max" to the list of CPU types "virt" supports
In-reply-to: <20180308130626.12393-6-peter.maydell@linaro.org>
Date: Fri, 09 Mar 2018 13:46:40 +0000
Message-ID: <873719l5tr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 7BEY+SQOPiHY


Peter Maydell <peter.maydell@linaro.org> writes:

> Allow the virt board to support '-cpu max' in the same way
> it already handles '-cpu host'.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  hw/arm/virt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index dbb3c8036a..cda4b83586 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -169,6 +169,7 @@ static const char *valid_cpus[] =3D {
>      ARM_CPU_TYPE_NAME("cortex-a53"),
>      ARM_CPU_TYPE_NAME("cortex-a57"),
>      ARM_CPU_TYPE_NAME("host"),
> +    ARM_CPU_TYPE_NAME("max"),
>  };
>
>  static bool cpu_type_valid(const char *cpu)


--
Alex Benn=C3=A9e
