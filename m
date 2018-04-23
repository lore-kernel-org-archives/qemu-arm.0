Received: by 10.28.4.212 with SMTP id 203csp3650475wme;
        Mon, 23 Apr 2018 02:13:13 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqFfoSSXjTramgEblfnPkRcHEhScWyYsOiejfy+WyMZwaT6H6HFKRmabbEHZdBG0LSAQ0rG
X-Received: by 10.12.189.172 with SMTP id n44mr1480729qvg.165.1524474793665;
        Mon, 23 Apr 2018 02:13:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524474793; cv=none;
        d=google.com; s=arc-20160816;
        b=S0B6qdHpwLilM2PI1OAlsA/kWwGvAwiElJmMlutvP+177vj2YNOjOktwqLsWYpp8J4
         5qMgeOwCPoNO5KcsPe0IZ9mpWQVxtmt7rDzjnADmfqM4bSc0iHjrieAL36qwKCXJ2YQf
         4jSpVW8pCCRVyVTW0W9L/rQgabvItLOLnRsSGhLfmn5JnP2svu7Dzg7oZivlESZ8Q4QP
         wY/GHhgKWw25YGd1NgBzA+8cth7VSPb+0c9for8MwnK6iWJec1K9nIx8iL59taslnml5
         ZruSj9K1Bm2PwMjDwsE8t1uKYFAbLzCRuUw00Vu/plqNAqeyvbH3h0U120A7WlmHTz/3
         +ICA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=PuzzT9wIJhDHiJlYDj0IoNd9sshyd0SeeoJI1Ai6z2c=;
        b=yR1Q59HbJCv+bRcYeaeXqy6+HmE0Zq+GfDDk/g4l6ioJUybKkC+a2pUb4wnVJ5MxzM
         fUphDbaR+D8K6Q5y5nAxgYz5wlO79Bf6ZYSRkqsI9DcN0UMM1TGrq9+D4WR7vT74pIbm
         0bCvGnhqZVAfX92ckFvUr2Zx1uHur5GftIQFIJDdjCwJi2e+QJgQfO76L75y7f8ln2h2
         n5qd3OmhrIHkcnSLqq/I46TAc3Krlj4cKrGYtlRIhyg06F9QOnHpgEEC/T75j4nRyl+I
         8slRtEhlRXws17HT2lyf4Q4pOrx13Z+45eUgcO2+2znPaiAnB88YsZ21dQFINReFQZ5P
         uUwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CZnHLi69;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k9-v6si995363qte.401.2018.04.23.02.13.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Apr 2018 02:13:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CZnHLi69;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57582 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fAXX7-0003VA-5w
	for alex.bennee@linaro.org; Mon, 23 Apr 2018 05:13:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fAXWr-0003Uc-U1
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 05:12:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fAXWq-0004Ic-O5
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 05:12:57 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:37601)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fAXWq-0004IH-KA
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 05:12:56 -0400
Received: by mail-ot0-x243.google.com with SMTP id 77-v6so10300616otd.4
	for <qemu-arm@nongnu.org>; Mon, 23 Apr 2018 02:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PuzzT9wIJhDHiJlYDj0IoNd9sshyd0SeeoJI1Ai6z2c=;
	b=CZnHLi69n7hsjsaqKT650klRFJ1W5SWzNma3nrFLjBU3/3k9qIiAdYH9hOIl7SoKQD
	cstIge00+xFbY6g7fSDu7GGHlI7zDn7ItLxUGhuYP2RYnTFy8lb89zFQNfNoYk2TT6xA
	RVbjdYNTpAqXmopBUTH/ZTbgm6iFd2maJynGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PuzzT9wIJhDHiJlYDj0IoNd9sshyd0SeeoJI1Ai6z2c=;
	b=pZ2TpwfyEVQvYb6KqiY7c2wYw+VAT1Tcj5LH838TnZm5LtuHz0U44LASa4JxDCRWpy
	K4K1RHg6jyBRfjXXfHHsOv6GoiC2H5BoxpZ2lZLX75E9KZSzjNNID3BG/Oum6m00ZwjZ
	0ilyuRIkX6PSok1LG1EehaZudpoiaQP+ydr+1rKrb4u2JftLdW3r0WAXe/eCIomBqToD
	YUvyfMobxn3LQEV9gOqB6/IPR1dphxZ9s82JPc1fDzaCPPjVNfybR6ohKdYgX8lNAibC
	nZAyKbMO3HjwdYo3iKrBfeSTKEVFS8yVdJR41ch5VQhv3nAeYn4+yyPgxh4bmcmDNvUu
	8wrQ==
X-Gm-Message-State: ALQs6tCD4/ykh8D48e9Bdvk4M0rRo4BDPNt0ovOH4GHTuzb4wI8ieUsE
	y8NWbXX20XKVqnj1z0mvM0dTQOeZ6+gDpHVX3M82bg==
X-Received: by 2002:a9d:2842:: with SMTP id
	h2-v6mr8730940otd.210.1524474775985; 
	Mon, 23 Apr 2018 02:12:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Mon, 23 Apr 2018 02:12:35
	-0700 (PDT)
In-Reply-To: <20180423064020.25434-1-clg@kaod.org>
References: <20180423064020.25434-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Apr 2018 10:12:35 +0100
Message-ID: <CAFEAcA-LtNpGTV08jvK4i5C5i64WjM5gMB4zGr8P4fkVSkNH7g@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH] timer/aspeed: fix vmstate version id
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3BjMczwJ5WZz

On 23 April 2018 at 07:40, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> commit 1d3e65aa7ac5 ("hw/timer: Add value matching support to
> aspeed_timer") increased the vmstate version of the timers array but
> doing so, it broke migration. To fix, we also need to change the
> vmstate version of the aspeed timer controller model.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>
>  To test on a 'palmetto-bmc' board, download the latest built OpenBMC
>  flash image :
>
>    wget https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,target=3D=
palmetto/lastSuccessfulBuild/artifact/deploy/images/palmetto/flash-palmetto
>
>  start two instances of QEMU with :
>
>    qemu-system-arm -m 512 -M palmetto-bmc -drive file=3D./flash-palmetto,=
format=3Draw,if=3Dmtd -serial mon:stdio -nographic -nodefaults
>
>  and :
>
>    qemu-system-arm -m 512 -M palmetto-bmc -drive file=3D./flash-palmetto,=
format=3Draw,if=3Dmtd -serial mon:stdio -nographic -nodefaults -incoming tc=
p::1234
>
>  then, run migrate from the monitor:
>
>    (qemu) migrate tcp:localhost:1234
>
>  hw/timer/aspeed_timer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index 50acbf530a3a..7df19bd9df91 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -498,8 +498,8 @@ static const VMStateDescription vmstate_aspeed_timer =
=3D {
>
>  static const VMStateDescription vmstate_aspeed_timer_state =3D {
>      .name =3D "aspeed.timerctrl",
> -    .version_id =3D 1,
> -    .minimum_version_id =3D 1,
> +    .version_id =3D 2,
> +    .minimum_version_id =3D 2,
>      .fields =3D (VMStateField[]) {
>          VMSTATE_UINT32(ctrl, AspeedTimerCtrlState),
>          VMSTATE_UINT32(ctrl2, AspeedTimerCtrlState),

Wouldn't it be simpler to just fix the incorrect value in
the VMSTATE_STRUCT_ARRAY(timers, AspeedTimerCtrlState,
line ?

thanks
-- PMM
