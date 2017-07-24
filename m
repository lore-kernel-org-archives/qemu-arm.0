Received: by 10.25.44.15 with SMTP id s15csp4316547lfs;
        Mon, 24 Jul 2017 14:09:33 -0700 (PDT)
X-Received: by 10.200.47.146 with SMTP id l18mr17158729qta.176.1500930573779;
        Mon, 24 Jul 2017 14:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500930573; cv=none;
        d=google.com; s=arc-20160816;
        b=YCjWmlpHQpEAH6AppsO84AGWV9CpvyQpmBRzqmIMnjfciwiLncPt59cZ3J4Spe/0im
         AAtd8PmBBPhRPH0pAypotb4F6Ig+C94BBZ5KR3SZCFoeh3Z5if3EUMWDfpiMmzPpuuLw
         /snssCWStVn51w73kUkl9cxX0yS+bcZRhcafkK7lvkYdjOOV+pjdblSiodhiFWLndfwy
         hEo0LFkFtJ28zajZNRdk27DQF7Wq96DhbFXZpFJo3oygpQ+HLs+ZFAvt7kflcnSG+NG2
         H1uE2NsqNGHAS0p+4INcILfYnk5yPep5M1yt7mm40MaMlLmRi5ZyqmyzxmETwaiwexUF
         I/iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=FCGgIPNxRSKch94vKex9Myp7fLOl642uZARVTKOhMec=;
        b=wGR/kEZR4vF7ULGXEYtan1WD/tRWevuQyL0ZQVOI8+LjnO7pQ4g0Px1B60gbyJ+slj
         f8/2ePt1psxtP8lplbDO+8kA8tVb0BMe4T0uCdscoawDZOKMy5Yq/MZRPheXH4XtIekO
         UVami3mc0TnfmgjpaXtttY0b/FoZMkl6u3KFej73UQ42m2BXPn3AevxrUby1zvw/4LqW
         b4KVuPagpDkj5cbNAUezuRhmdjZj6oSrVYNZGMUjG2ouuuzSBLnAvsk0J1uZpXk2z5Ah
         a8dEVFSnrUSSqS3zMD4yNkGHXSkXpKNmN4vEa4zTfYaXbga4y0DTuNTaRVTkPc3GWYc6
         js3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=cR3dIdPC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c13si9523525qta.534.2017.07.24.14.09.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Jul 2017 14:09:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=cR3dIdPC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57045 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dZkbb-00085z-33
	for alex.bennee@linaro.org; Mon, 24 Jul 2017 17:09:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZkbX-00085g-DL
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:09:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZkbW-0006Go-Bk
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:09:27 -0400
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:38223)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dZkbW-0006G2-6I
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:09:26 -0400
Received: by mail-wm0-x230.google.com with SMTP id m85so27323134wma.1
	for <qemu-arm@nongnu.org>; Mon, 24 Jul 2017 14:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FCGgIPNxRSKch94vKex9Myp7fLOl642uZARVTKOhMec=;
	b=cR3dIdPCHKlGQZ25uyGJ9ZBI5ffdC5zLQuvZSFWM1caaWYNqIHUe/9HKwjyjT8BABA
	JmWd+iNVP8P2WlBRlIvysnALhVYJLNuM8BkvFOtTJYPFG9WlK7q6X3Qh/udldiDoOZED
	p0+/oNE1qLIwScFi+MZOox9Fv8Qe5kTWws+F4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FCGgIPNxRSKch94vKex9Myp7fLOl642uZARVTKOhMec=;
	b=HEM7Byosd7OKNUfXJ/yxJNa+N2mhQgaQTeUrCgU57i9T7KOPo2hSDA9SSkPbnGKDk9
	7Uip4hflJ2ItHmqnAplCUTx8HRMDw1axgO3N/WSIRLJY615htnzxqQZfPxxIRIhkXFBm
	XVHZ02qKozsM1oTgQpLz+iYe3LwBPIpx3Pmz3p4nC/Qb54pguzNiJKYHJziBn/fpEict
	J9cJpMBCcHEpabO1uE4uGHZ4UXyqguHAiBKBEKv9oY07SK/mg0fqGnCQ+jjci97l3FLa
	5rRgXbf9SxTAq8PfGHVk1VwCmuIru7GiTwdoCM53NksBTehnnI7Hkcr+6ysT6uO7Cwl5
	bx2A==
X-Gm-Message-State: AIVw111bs+sFjdZ1hRrs2L98KA4dkZSFkUiO/16tFJ9jbtP2gGhsyO5R
	YNy1YMT6KATYoesxaMd6NhnMWJWVAaWV
X-Received: by 10.28.95.69 with SMTP id t66mr2069702wmb.74.1500930565128; Mon,
	24 Jul 2017 14:09:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Mon, 24 Jul 2017 14:09:04 -0700 (PDT)
In-Reply-To: <20170724182751.18261-22-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-22-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jul 2017 22:09:04 +0100
Message-ID: <CAFEAcA_PRH_BuUOTtC=cvRFT7Gtiwt50T6C3avm+Sy13aDS4tg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-arm] [PATCH for 2.10 21/35] arm/sysbus-fdt: fix null
 pointer dereference
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Eric Blake <eblake@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6et3MEk4jwWD

On 24 July 2017 at 19:27, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> Use error_report() + exit() instead of error_setg(&error_fatal).
>
> hw/arm/sysbus-fdt.c:322:9: warning: Array access (from variable 'node_pat=
h') results in a null pointer dereference
>     if (node_path[1]) {
>         ^~~~~~~~~~~~

I don't understand what this warning is trying to say.
We can't get to this point with a NULL node_path,
because of the previous conditional, which is using
error_setg(&error_fatal).

> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/sysbus-fdt.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
> index d68e3dcdbd..ad0cc49b19 100644
> --- a/hw/arm/sysbus-fdt.c
> +++ b/hw/arm/sysbus-fdt.c
> @@ -315,15 +315,14 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbde=
v, void *opaque)
>      node_path =3D qemu_fdt_node_path(host_fdt, dt_name, vdev->compat,
>                                     &error_fatal);
>      if (!node_path || !node_path[0]) {
> -        error_setg(&error_fatal, "%s unable to retrieve node path for %s=
/%s",
> +        error_report("%s unable to retrieve node path for %s/%s",
>                     __func__, dt_name, vdev->compat);
> -    }
> -
> -    if (node_path[1]) {
> -        error_setg(&error_fatal, "%s more than one node matching %s/%s!"=
,
> +        exit(1);
> +    } else if (node_path[1]) {
> +        error_report("%s more than one node matching %s/%s!",
>                     __func__, dt_name, vdev->compat);
> +        exit(1);
>      }
> -
>      g_free(dt_name);

This doesn't seem like an improvement. Now the
error handling in the function is an inconsistent
mix of error_report()+exit() and error_setg(&error_fatal).

thanks
-- PMM
