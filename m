Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id s17sm2709045wmc.48.2020.05.15.02.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 02:41:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C267C1FF7E;
	Fri, 15 May 2020 10:41:47 +0100 (BST)
References: <20200507151819.28444-1-peter.maydell@linaro.org>
 <20200507151819.28444-3-peter.maydell@linaro.org>
User-agent: mu4e 1.4.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 2/5] docs/system: Sort Arm board index into alphabetical
 order
In-reply-to: <20200507151819.28444-3-peter.maydell@linaro.org>
Date: Fri, 15 May 2020 10:41:47 +0100
Message-ID: <87mu69cz6s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 1/3qBBCCaCdE


Peter Maydell <peter.maydell@linaro.org> writes:

> Sort the board index into alphabetical order.  (Note that we need to
> sort alphabetically by the title text of each file, which isn't the
> same ordering as sorting by the filename.)

Is it possible to leave an inline comment in the rst to this effect so
no one mis-sorts it next time?

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
