Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id k26-20020a056402049a00b004197b0867e0sm7106382edv.42.2022.03.28.08.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 08:34:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CD7161FFB7;
	Mon, 28 Mar 2022 16:34:36 +0100 (BST)
References: <YjzR3erB5ZhkAI2A@strawberry.localdomain>
User-agent: mu4e 1.7.11; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, robhenry@microsoft.com
Subject: Re: Plugins Not Reporting AArch64 SVE Memory Operations
Date: Mon, 28 Mar 2022 16:30:32 +0100
In-reply-to: <YjzR3erB5ZhkAI2A@strawberry.localdomain>
Message-ID: <87lewuxf8z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: cBvIt+DgzMQa


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> Hi folks,
>
> I see there has been some previous discussion [1] about 1.5 years ago
> around the fact that AArch64 SVE instructions do not emit any memory
> operations via the plugin interface, as one might expect them to.

To help I updated one of the tests and extended the exec plugin. See:

  Subject: [PATCH  v1 0/2] some tests and plugin tweaks for SVE
  Date: Mon, 28 Mar 2022 16:26:12 +0100
  Message-Id: <20220328152614.2452259-1-alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
