Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id o22-20020a05600c511600b003ef5bb63f13sm20891162wms.10.2023.04.11.04.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 04:48:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 39E641FFB7;
	Tue, 11 Apr 2023 12:48:32 +0100 (BST)
References: <20230411103106.3992862-1-peter.maydell@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qianfan Zhao <qianfanguijin@163.com>, Thomas Huth
 <thuth@redhat.com>, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 qemu-arm@nongnu.org
Subject: Re: [for-8.0] hw/i2c/allwinner-i2c: Fix subclassing of
 TYPE_AW_I2C_SUN6I
Date: Tue, 11 Apr 2023 12:48:24 +0100
In-reply-to: <20230411103106.3992862-1-peter.maydell@linaro.org>
Message-ID: <871qkqr65r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 4QFKyQdjIgxp


Peter Maydell <peter.maydell@linaro.org> writes:

> In commit 8461bfdca9c we added the TYPE_AW_I2C_SUN6I, which is a
> minor variant of the TYPE_AW_I2C device.  However, we didn't quite
> get the class hierarchy right.  We made the new TYPE_AW_I2C_SUN6I a
> subclass of TYPE_SYS_BUS_DEVICE, which means that you can't validly
> use a pointer to this object via the AW_I2C() cast macro, which
> insists on having something that is an instance of TYPE_AW_I2C or
> some subclass of that type.
>
> This only causes a problem if QOM cast macro debugging is enabled;
> that is supposed to be on by default, but a mistake in the meson
> conversion in commit c55cf6ab03f4c meant that it ended up disabled by
> default, and we didn't catch this bug.
>
> Fix the problem by arranging the classes in the same way we do for
> TYPE_PL011 and TYPE_PL011_LUMINARY in hw/char/pl011.c -- make the
> variant class be a subclass of the "normal" version of the device.
>
> This was reported in
> https://gitlab.com/qemu-project/qemu/-/issues/1586 but this fix alone
> isn't sufficient, as there is a separate cast-related issue in the
> CXL code in pci_expander_bridge.c.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
