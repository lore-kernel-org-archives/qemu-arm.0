Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id f14-20020a056000128e00b0033d87da9ab3sm2556802wrx.110.2024.02.22.02.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 02:10:16 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 02A695F89B;
	Thu, 22 Feb 2024 10:10:16 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [PATCH] pl031: Update last RTCLR value on write in case it's
 read back
In-Reply-To: <20240222000341.1562443-1-jrtc27@jrtc27.com> (Jessica Clarke's
	message of "Thu, 22 Feb 2024 00:03:41 +0000")
References: <20240222000341.1562443-1-jrtc27@jrtc27.com>
User-Agent: mu4e 1.11.28; emacs 29.1
Date: Thu, 22 Feb 2024 10:10:15 +0000
Message-ID: <87il2gajy0.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /UCuklbjGeJP

Jessica Clarke <jrtc27@jrtc27.com> writes:

> The PL031 allows you to read RTCLR, which is meant to give you the last
> value written. PL031State has an lr field which is used when reading
> from RTCLR, and is present in the VM migration state, but we never
> actually update it, so it always reads as its initial 0 value.
>
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
