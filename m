Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id p6-20020adfe606000000b002ff1751ec79sm11194778wrm.65.2023.04.24.10.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 10:44:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7BD091FFB7;
	Mon, 24 Apr 2023 18:44:18 +0100 (BST)
References: <20230424165053.1428857-1-peter.maydell@linaro.org>
 <20230424165053.1428857-3-peter.maydell@linaro.org>
User-agent: mu4e 1.11.3; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 qemu-stable@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 2/2] hw/net/allwinner-sun8i-emac: Correctly byteswap
 descriptor fields
Date: Mon, 24 Apr 2023 18:44:05 +0100
In-reply-to: <20230424165053.1428857-3-peter.maydell@linaro.org>
Message-ID: <877cu19nv1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 35vSb4cFHy6X


Peter Maydell <peter.maydell@linaro.org> writes:

> In allwinner-sun8i-emac we just read directly from guest memory into
> a host FrameDescriptor struct and back.  This only works on
> little-endian hosts.  Reading and writing of descriptors is already
> abstracted into functions; make those functions also handle the
> byte-swapping so that TransferDescriptor structs as seen by the rest
> of the code are always in host-order, and fix two places that were
> doing ad-hoc descriptor reading without using the functions.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
