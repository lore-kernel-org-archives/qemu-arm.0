Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id kb28-20020a1709070f9c00b006d5d8bf1b72sm7095379ejc.78.2022.03.21.09.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 09:47:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D716D1FFB7;
	Mon, 21 Mar 2022 16:47:20 +0000 (GMT)
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 sw@weilnetz.de, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH for 7.0 v1 0/8] misc testing, i386, docs, gitdm, gitlab
Date: Mon, 21 Mar 2022 16:46:52 +0000
In-reply-to: <20220315121251.2280317-1-alex.bennee@linaro.org>
Message-ID: <87a6dj45if.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 2mXYd+NMLbOU


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi,
>
> As per usual here are the collection of random fixes and tweaks as we
> go through the release process. Most of these patches have been posted
> individually before although the semihosting and gitlab patches are
> new.
>
> The following need review:
>
>  - gitlab: include new aarch32 job in custom-runners
>  - semihosting: clean up handling of expanded argv
>  - tests/avocado: update aarch64_virt test to exercise -cpu max

Ping? Any more reviews before I generate the PR?

--=20
Alex Benn=C3=A9e
