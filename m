Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q192sm4652163wme.23.2019.10.08.04.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 04:22:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 810641FF87;
	Tue,  8 Oct 2019 12:22:16 +0100 (BST)
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-7-f4bug@amsat.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Zolt=C3=A1n?=
 Baldaszti <bztemail@gmail.com>, Laurent Bonnans
 <laurent.bonnans@here.com>, Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Philippe =?utf-8?Q?Mathieu-Dau?=
 =?utf-8?Q?d=C3=A9?=
 <f4bug@amsat.org>, Andrew Baumann <Andrew.Baumann@microsoft.com>, BALATON
 Zoltan <balaton@eik.bme.hu>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Clement Deschamps
 <clement.deschamps@antfield.fr>, Cleber Rosa <crosa@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Cheng Xiang <ext-cheng.xiang@here.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Pekka Enberg
 <penberg@iki.fi>,
 Guenter Roeck <linux@roeck-us.net>, Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 06/19] hw/char/bcm2835_aux: Add trace events
In-reply-to: <20190926173428.10713-7-f4bug@amsat.org>
Date: Tue, 08 Oct 2019 12:22:16 +0100
Message-ID: <87y2xviis7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: WEjvLtBRpWDQ


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> The BCM2835 AUX UART is compatible with the 16650 model, when
> the registers belong the the 16650 block, use its trace events,
> else use bcm2835_aux_read/write.

My only concern here is how we surface that detail to the potential
user. It's not a major thing as I assume most users of the trace points
are developers so maybe...
> diff --git a/hw/char/trace-events b/hw/char/trace-events
> index 2ce7f2f998..a7d477ab1e 100644
> --- a/hw/char/trace-events
> +++ b/hw/char/trace-events
> @@ -1,5 +1,9 @@
>  # See docs/devel/tracing.txt for syntax documentation.
>
> +# bcm2835_aux.c

"(accesses to the 16650 areas are logged via the serial_ioport_write tracep=
oint)"?

> +bcm2835_aux_read(uint64_t addr, uint32_t value) "read addr 0x%"PRIx64" v=
alue 0x%x"
> +bcm2835_aux_write(uint64_t addr, uint32_t value) "read addr 0x%"PRIx64" =
value 0x%x"
> +
>  # parallel.c
>  parallel_ioport_read(const char *desc, uint16_t addr, uint8_t value) "re=
ad [%s] addr 0x%02x val 0x%02x"
>  parallel_ioport_write(const char *desc, uint16_t addr, uint8_t value) "w=
rite [%s] addr 0x%02x val 0x%02x"

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--
Alex Benn=C3=A9e
