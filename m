Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y130sm3443977wmc.22.2021.01.05.01.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 01:25:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C2B0D1FF7E;
	Tue,  5 Jan 2021 09:25:24 +0000 (GMT)
References: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
 <1608704767-9317-2-git-send-email-bmeng.cn@gmail.com>
 <CAEUhbmURMNzT5T_LOVvi+m0658jVZhXrEuP=JhJL+pVCbDFuLg@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Bin Meng
 <bin.meng@windriver.com>
Subject: Re: [PATCH v2 1/4] hw/misc: imx6_ccm: Update PMU_MISC0 reset value
Date: Tue, 05 Jan 2021 09:23:41 +0000
In-reply-to: <CAEUhbmURMNzT5T_LOVvi+m0658jVZhXrEuP=JhJL+pVCbDFuLg@mail.gmail.com>
Message-ID: <87lfd73fcr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: FtnEQvHyvP2G


Bin Meng <bmeng.cn@gmail.com> writes:

> On Wed, Dec 23, 2020 at 2:26 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
<snip>
>>
>> (no changes since v1)
>>
>>  hw/misc/imx6_ccm.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>
> Ping?

Looks good to me - Peter should be able to pull it into his tree soon.

--=20
Alex Benn=C3=A9e
