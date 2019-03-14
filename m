Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp688341wro;
        Thu, 14 Mar 2019 03:57:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqycsNRKqf0SFAwH1W4ibvrmPFtjES9b43VgiA5M8dq4ZgY+SH1pi4YOaoFtHDVlhG/HDAny
X-Received: by 2002:a25:c45:: with SMTP id 66mr38744425ybm.30.1552561039490;
        Thu, 14 Mar 2019 03:57:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552561039; cv=none;
        d=google.com; s=arc-20160816;
        b=NbhQrBmvM0NJdSIGnPO2yzYRWHL01fQPdc3x3sd5lG7jegiR9v0+cry7R2HtcvCXNY
         F8qdnwl0Z9t58lyoWY/zUEn4Ynyy3KV3ESAg0i7wjGEpJFrk/z9E/V5UvlRHD38H3OK+
         5AeA9JqXSwVKhIWPEZYpUBrR/TU4sgbriHYLfia0cFx8fr83uBJCuPfjzKFaJ3xVKDku
         QY3aw+96fwOaCtt4267MGOtEnmOBgigRziHDCz60wK1RCk+QLNGhz0gRQc+m3A6xV3P5
         7QJkcbBQeCXHvdlMLbnVT16XDZ+uBgBAIZwKvIoQAb+EQeSwaIDveOnH919F0sgnvGzn
         BVEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=Tc0VUveyRtpocWfF4VlMfZh8xgdzAN60Tur1FCwBmP0=;
        b=BjPT+yp665f8VxTSP6KGHKT0CQOX6aHebynGFSKTWLNUGmAhojiwjM3bgfFYQjvBvU
         qvKXgdA4ph/Ac+5HTdUo3LeEWpcMh7fkUH9iCuuXPAz7D7seEasB8Xmehfp8sm6RGb6R
         ayIdUlByPtR2p9SZ9u4gRmYhRqSaAZ/fxgR9GQ1y6YpuR7Vk0TeUH9Nx5VEFIZbp88+F
         UXqWoV0SSr2LpjcKbYtiERKIzEh4dnCH3p/JFSl+9EOOfTWrlf2rtws3RPvmY/xRNdwM
         /hQ6iq09jbeKnmzDv+es3rzurY5XSK0FNn+6lnaa8IuorBX0Esc4AzavyA8ql+zJ7BwH
         HefQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x189si8423699ywc.338.2019.03.14.03.57.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 03:57:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:34218 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4O35-0003vV-0J
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 06:57:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1h4O2K-0003tT-R9
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 06:56:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1h4O2J-0000ds-Pp
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 06:56:32 -0400
Received: from 10.mo178.mail-out.ovh.net ([46.105.76.150]:37063)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1h4O2J-0000bR-J6
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 06:56:31 -0400
Received: from player779.ha.ovh.net (unknown [10.109.143.24])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 7E15E51ECC
	for <qemu-devel@nongnu.org>; Thu, 14 Mar 2019 11:56:28 +0100 (CET)
Received: from kaod.org (lfbn-1-2226-17.w90-76.abo.wanadoo.fr [90.76.48.17])
	(Authenticated sender: clg@kaod.org)
	by player779.ha.ovh.net (Postfix) with ESMTPSA id 873CA39156C9;
	Thu, 14 Mar 2019 10:56:20 +0000 (UTC)
To: Christian Svensson <bluecmd@google.com>
References: <20190314084235.9887-1-clg@kaod.org>
	<20190314084235.9887-6-clg@kaod.org>
	<3876e39f-ed28-3b86-91e1-8bc1fc99be60@kaod.org>
	<CAEfeXvaB_YHJ+p=iSaywuJm0nAaxOyHzOTGgHb6SVauY-F3sag@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e27e3de0-5392-c89f-ea8c-80a97bcabd6b@kaod.org>
Date: Thu, 14 Mar 2019 11:56:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAEfeXvaB_YHJ+p=iSaywuJm0nAaxOyHzOTGgHb6SVauY-F3sag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 3700832997315218240
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedutddrhedvgddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.76.150
Subject: Re: [Qemu-devel] [PATCH 5/5] aspeed/timer: Use signed muldiv for
 timer resets
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xe5u4usHqwgL

On 3/14/19 11:47 AM, Christian Svensson wrote:
> Hi all,
>=20
> I have a new patch but I'm not sure how you want me to post it.
> Should I do a "PATCH v2" with a single patch and this thread as the thr=
ead ID?

I would wait for feedback from Peter first.=20

Thanks,

C.=20

> Thanks,
> - Chris
>=20
>=20
> On Thu, Mar 14, 2019 at 10:05 AM C=C3=A9dric Le Goater <clg@kaod.org <m=
ailto:clg@kaod.org>> wrote:
>=20
>     Christian,
>=20
>     Could you please provide a fix for this patch ? patchew complains, =
see
>     attached log.
>=20
>     Thanks,
>=20
>     C.
>=20
>     On 3/14/19 9:42 AM, C=C3=A9dric Le Goater wrote:
>     > From: Christian Svensson <bluecmd@google.com <mailto:bluecmd@goog=
le.com>>
>     >
>     > If the host decrements the counter register that results in a neg=
ative
>     > delta. This is then passed to muldiv64 which only handles unsigne=
d
>     > numbers resulting in bogus results.
>     >
>     > This fix ensures the data being operated on is signed before it i=
s
>     > ultimately casted to the final unsigned value.
>     >
>     > Test case: kexec a kernel using aspeed_timer and it will freeze o=
n the
>     > second bootup when the kernel initializes the timer. With this pa=
tch
>     > that no longer happens and the timer appears to run OK.
>     >
>     > Signed-off-by: Christian Svensson <bluecmd@google.com <mailto:blu=
ecmd@google.com>>
>     > [clg: - checkpatch fixes ]
>     > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org <mailto:clg@ka=
od.org>>
>     > ---
>     >=C2=A0 hw/timer/aspeed_timer.c | 3 ++-
>     >=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)
>     >
>     > diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
>     > index 9988b8fbbf17..0b16eac8970c 100644
>     > --- a/hw/timer/aspeed_timer.c
>     > +++ b/hw/timer/aspeed_timer.c
>     > @@ -275,7 +275,8 @@ static void aspeed_timer_set_value(AspeedTime=
rCtrlState *s, int timer, int reg,
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t delta =3D=
 (int64_t) value - (int64_t) calculate_ticks(t, now);
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t rate =3D=
 calculate_rate(t);
>     >=C2=A0
>     > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t->start +=3D muldiv64=
(delta, NANOSECONDS_PER_SECOND, rate);
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t->start =3D (int64_t)=
t->start +
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((__int1=
28_t)delta * NANOSECONDS_PER_SECOND / rate);
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aspeed_timer_mod(=
t);
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>     >
>=20

