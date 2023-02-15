Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id r19-20020a05600c459300b003dc47d458cdsm3088261wmo.15.2023.02.15.09.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 09:33:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5D4F01FFB7;
	Wed, 15 Feb 2023 17:33:21 +0000 (GMT)
References: <20230215152233.210024-1-thuth@redhat.com>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, Beniamino
 Galvani <b.galvani@gmail.com>, Strahinja Jankovic
 <strahinja.p.jankovic@gmail.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] include/hw/arm/allwinner-a10.h: Remove superfluous
 includes from the header
Date: Wed, 15 Feb 2023 17:33:17 +0000
In-reply-to: <20230215152233.210024-1-thuth@redhat.com>
Message-ID: <87wn4i96la.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 0/JpG10n72lQ


Thomas Huth <thuth@redhat.com> writes:

> pci_device.h is not needed at all in allwinner-a10.h, and serial.h
> is only needed by the corresponding .c file.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
