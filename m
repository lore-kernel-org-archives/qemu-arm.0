Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id j8-20020adff008000000b002f6176cc6desm11213010wro.110.2023.04.24.10.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 10:43:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D08641FFB7;
	Mon, 24 Apr 2023 18:43:11 +0100 (BST)
References: <20230424165053.1428857-1-peter.maydell@linaro.org>
 <20230424165053.1428857-2-peter.maydell@linaro.org>
User-agent: mu4e 1.11.3; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 qemu-stable@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 1/2] hw/sd/allwinner-sdhost: Correctly byteswap
 descriptor fields
Date: Mon, 24 Apr 2023 18:42:27 +0100
In-reply-to: <20230424165053.1428857-2-peter.maydell@linaro.org>
Message-ID: <87bkjd9nww.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: z5ucMG6J9YN0


Peter Maydell <peter.maydell@linaro.org> writes:

> In allwinner_sdhost_process_desc() we just read directly from
> guest memory into a host TransferDescriptor struct and back.
> This only works on little-endian hosts. Abstract the reading
> and writing of descriptors into functions that handle the
> byte-swapping so that TransferDescriptor structs as seen by
> the rest of the code are always in host-order.

I couldn't find any datasheets on the sdhost hardware but the kernel
certainly explicitly sets the endianess of the descriptors so:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
