Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 55sm4359422wrw.87.2018.02.23.09.20.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 09:20:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 91B743E0260;
	Fri, 23 Feb 2018 17:20:55 +0000 (GMT)
References: <20180223154613.2096-1-alex.bennee@linaro.org> <20180223154613.2096-5-alex.bennee@linaro.org> <20180223161723.GF31076@redhat.com> <878tbjac3d.fsf@linaro.org> <20180223164937.GG31076@redhat.com> <CAFEAcA-r7o=yMD+Mvo0-3Lpfe-Vvs_SdKOnJoOFnuNJn1oEdLA@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, qemu-arm@nongnu.org
 <qemu-arm@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v1 4/8] new contrib/generate_all.sh: batch risugen script
In-reply-to: <CAFEAcA-r7o=yMD+Mvo0-3Lpfe-Vvs_SdKOnJoOFnuNJn1oEdLA@mail.gmail.com>
Date: Fri, 23 Feb 2018 17:20:55 +0000
Message-ID: <874lm7aah4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: QVcawelJoJK4


Peter Maydell <peter.maydell@linaro.org> writes:

> On 23 February 2018 at 16:49, Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>> If it is going to live in QEMU source tree, then avoiding introducing a =
new
>> license is desirable.
>
> It isn't -- risu has its own repository.

Ahh I switched to having a common function to prepare my patch series
across projects which didn't add the RISU part to the front. Fixed for
future series.

--
Alex Benn=C3=A9e
