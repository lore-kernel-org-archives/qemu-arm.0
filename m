Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74c6179sm63700505e9.22.2025.01.16.08.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:05:33 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id C4EA660853;
	Thu, 16 Jan 2025 16:05:31 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,  Markus Armbruster <armbru@redhat.com>,  Yuri
 Benditovich <yuri.benditovich@daynix.com>,  Jason Wang
 <jasowang@redhat.com>,  Cleber Rosa <crosa@redhat.com>,  "Dr. David Alan
 Gilbert" <dave@treblig.org>,  Peter Xu <peterx@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  Stefan Weil <sw@weilnetz.de>,  Stefano Garzarella <sgarzare@redhat.com>,
  qemu-arm@nongnu.org,  Michael Roth <michael.roth@amd.com>,  Laurent
 Vivier <laurent@vivier.eu>,  Mahmoud Mandour <ma.mandourr@gmail.com>,
  Andrew Melnychenko <andrew@daynix.com>,  Konstantin Kostiuk
 <kkostiuk@redhat.com>,  Kyle Evans <kevans@freebsd.org>,  Richard
 Henderson <richard.henderson@linaro.org>,  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>,  John Snow <jsnow@redhat.com>,  David
 Hildenbrand <david@redhat.com>,  Fabiano Rosas <farosas@suse.de>,
  Alexandre Iooss <erdnaxe@crans.org>,  Eric Blake <eblake@redhat.com>,
  Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  Pierrick
 Bouvier <pierrick.bouvier@linaro.org>,  Kevin Wolf <kwolf@redhat.com>,
  Peter Maydell <peter.maydell@linaro.org>,  Laurent Vivier
 <lvivier@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Warner Losh <imp@bsdimp.com>,  Daniel P. =?utf-8?Q?B?=
 =?utf-8?Q?errang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH v3 00/37] maintainer updates for jan '25 (semihosting,
 gdb, plugins, docs) pre-PR-FINAL
In-Reply-To: <20250116160306.1709518-1-alex.bennee@linaro.org> ("Alex
	=?utf-8?Q?Benn=C3=A9e=22's?= message of "Thu, 16 Jan 2025 16:02:29 +0000")
References: <20250116160306.1709518-1-alex.bennee@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 16 Jan 2025 16:05:31 +0000
Message-ID: <87ldvahhh0.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: qI1X3/oMpdhl

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Only a few changes from v2, sending out to cut a PR tomorrow
>
>   - applied r-b tags
>   - fixed bsd-user gdbserver_start
>   - a few minor tweaks to commit messages
>
<snip>
> Most are already reviewed, the following remain:
>
>   docs/sphinx: include kernel-doc script as a dependency
>   include/exec: fix some copy and paste errors in kdoc
>   tests/qtest: fix some copy and paste errors in kdoc
>   editorconfig: update for perl scripts
>   plugins: fix kdoc annotation

Ignore this part, all 37 patches reviewed

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
