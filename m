Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e8bea5sm205895255e9.31.2025.01.14.03.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 03:25:41 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 580185F89C;
	Tue, 14 Jan 2025 11:25:40 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org,  manos.pitsidianakis@linaro.org,  Andrew
 Melnychenko <andrew@daynix.com>,  Thomas Huth <thuth@redhat.com>,  Michael
 Roth <michael.roth@amd.com>,  qemu-block@nongnu.org,  Jason Wang
 <jasowang@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Yuri
 Benditovich <yuri.benditovich@daynix.com>,  Kevin Wolf <kwolf@redhat.com>,
  Peter Xu <peterx@redhat.com>,  qemu-arm@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  philmd@linaro.org,  Fabiano Rosas
 <farosas@suse.de>,  Konstantin Kostiuk <kkostiuk@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  Markus Armbruster
 <armbru@redhat.com>,  gustavo.romero@linaro.org,  Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 0/6] Enhance documentation for new developers
In-Reply-To: <20241209183104.365796-1-pierrick.bouvier@linaro.org> (Pierrick
	Bouvier's message of "Mon, 9 Dec 2024 10:30:58 -0800")
References: <20241209183104.365796-1-pierrick.bouvier@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Tue, 14 Jan 2025 11:25:40 +0000
Message-ID: <878qrdk56z.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: jZiIVpV73krD

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> This series extends our documentation with new pages to help developers
> onboarding on QEMU. It focuses on providing a big picture of QEMU (to a
> modest extend).
>
<snip>
>
> Pierrick Bouvier (6):
>   docs/devel: remove dead video link for sourcehut submit process

This was already merged.

>   docs/devel: add git-publish for patch submitting
>   docs/devel: add b4 for patch retrieval
>   docs/devel: add information on how to setup build environments
>   docs: add a codebase section
>   docs: add a glossary

Queued to maintainer/jan-2025 and docs/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
