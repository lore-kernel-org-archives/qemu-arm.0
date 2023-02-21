Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id e16-20020a7bc2f0000000b003e215a796fasm1034740wmk.34.2023.02.21.03.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 03:09:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7C3041FFB7;
	Tue, 21 Feb 2023 11:09:02 +0000 (GMT)
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
 <20230221094558.2864616-2-alex.bennee@linaro.org>
 <Y/SjiDQR1/xBlUMr@redhat.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Yonggang Luo <luoyonggang@gmail.com>, Li-Wen
 Hsu <lwhsu@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>, Bandan Das
 <bsd@redhat.com>, Cleber Rosa <crosa@redhat.com>, Qiuhao Li
 <Qiuhao.Li@outlook.com>, qemu-block@nongnu.org, Beraldo Leal
 <bleal@redhat.com>, Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, John Snow
 <jsnow@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Anton
 Johansson <anjo@rev.ng>
Subject: Re: [PATCH v2 01/14] block: Handle curl 7.55.0, 7.85.0 version changes
Date: Tue, 21 Feb 2023 11:08:38 +0000
In-reply-to: <Y/SjiDQR1/xBlUMr@redhat.com>
Message-ID: <87mt57qnqp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 1wbo732dprmA


Kevin Wolf <kwolf@redhat.com> writes:

> Am 21.02.2023 um 10:45 hat Alex Benn=C3=A9e geschrieben:
>> From: Anton Johansson <anjo@rev.ng>
>>=20
>> * 7.55.0 deprecates CURLINFO_CONTENT_LENGTH_DOWNLOAD in favour of a *_T
>>   version, which returns curl_off_t instead of a double.
>> * 7.85.0 deprecates CURLOPT_PROTOCOLS and CURLOPT_REDIR_PROTOCOLS in
>>   favour of *_STR variants, specifying the desired protocols via a
>>   string.
>>=20
>> Signed-off-by: Anton Johansson <anjo@rev.ng>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> Message-Id: <20230123201431.23118-1-anjo@rev.ng>
>> [AJB: fixed author]
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> I assume you only CCed me for this patch? It has arrived in git master
> meanwhile, so when you rebase, it should just be dropped.

Well git-publish did but yeah. I've just re-based and it skipped
cleanly.

>
> Kevin


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
