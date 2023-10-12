Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id k23-20020a5d5257000000b003177074f830sm17551898wrc.59.2023.10.12.00.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 00:54:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 484011FFBB;
	Thu, 12 Oct 2023 08:54:07 +0100 (BST)
References: <20231012073458.860187-1-thuth@redhat.com>
User-agent: mu4e 1.11.22; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/arm: Move raspberrypi-fw-defs.h to the
 include/hw/arm/ folder
Date: Thu, 12 Oct 2023 08:54:00 +0100
In-reply-to: <20231012073458.860187-1-thuth@redhat.com>
Message-ID: <875y3cnun4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 3k/9NDPVK4qr


Thomas Huth <thuth@redhat.com> writes:

> The file is obviously related to the raspberrypi machine, so
> it should reside in hw/arm/ instead of hw/misc/. And while we're
> at it, also adjust the wildcard in MAINTAINERS so that it covers
> this file, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
