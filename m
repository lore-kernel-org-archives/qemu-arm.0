Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2739339wro;
        Mon, 5 Nov 2018 07:50:18 -0800 (PST)
X-Google-Smtp-Source: AJdET5eIX5CMxzbBLVerxdmZlKj4vuJLeqI9L7TcII+Iz0giDloFBPg3I6GLpiNInT9kr2ib79nQ
X-Received: by 2002:ac8:66c9:: with SMTP id m9-v6mr21982160qtp.349.1541433018709;
        Mon, 05 Nov 2018 07:50:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541433018; cv=none;
        d=google.com; s=arc-20160816;
        b=usqWVTqz0OlKPmNY/WrJ6syHcAw6+EmSbLkGE01016cl6kfedm+3acUHpVh1owpGPA
         A9LMKYEkwOf9YWuVJhQFRxYtFOC1Fs4wi4bLyrOeY/aXMnBYVQ36/33sCIBeHvejBpVl
         sCHI7Mh193XpNc7731USbIpDlJR/iCZo8+luJ8KHSVp/HKbeizpGX0Gd5I1GrERT+jVe
         uq+Us2O0Q0/pNBYnVU8c8EM0JxUGftmLwbwHneVVubjGXyJEpU/257ZaHGTuRHN5REbn
         JQcuJCgCFqvQaNBeVLvGljWjlY+faOiDFtB2TzL2sjUNb68bqIRhqEC7kPov99Gb2V6C
         viPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=VvUfADzvZbjf0vTJWX1ye4ShMKJRtR5E9XgIW2S1z4E=;
        b=fBGvweBMJr6Nesp52Xwe5WTAmg2Ux9XPNz8mKeCh26acBwUuIerFZXCKxVqhKZALzK
         9fn0PYori6SMaJrzAEipnXCWX3Ckxf/dLcRjNQ196lDa8k6jMIBgiaiFNrbGcbVNPB9m
         U/UnqeoHS1KJMm61LDUbg16Vr/A4z3EujZB1zy3bGItJI7ttDBOVgSuZbj/jn8mSONSX
         h8fJHOqJKdZN4roa+5/ch1ZZS8aiU/K5Hjtm1kYYuN0ebOcQkGHQLplcvn0dfB1KQvHu
         2oS78KCh1cLMxHCJnVZ75kMWJEj2Swj4Yyy/5xIlVFLzUhYX8gXOGSyvlt9VM/S/aiYQ
         pkJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZxVcN1h8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v64si562782qte.289.2018.11.05.07.50.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 07:50:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZxVcN1h8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35854 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJh8s-0008Us-1F
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 10:50:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJh6I-0004HB-Dj
	for qemu-devel@nongnu.org; Mon, 05 Nov 2018 10:47:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJgt9-00029y-4B
	for qemu-devel@nongnu.org; Mon, 05 Nov 2018 10:34:03 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34741)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gJgt8-00029G-Hk
	for qemu-devel@nongnu.org; Mon, 05 Nov 2018 10:34:03 -0500
Received: by mail-oi1-x244.google.com with SMTP id i138-v6so4802226oib.1
	for <qemu-devel@nongnu.org>; Mon, 05 Nov 2018 07:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=VvUfADzvZbjf0vTJWX1ye4ShMKJRtR5E9XgIW2S1z4E=;
	b=ZxVcN1h8HLtKll+G3o8aYZp2PWy9i6PeoiuMgZja7int8TLvcBJj/0sqZs1j+DEmwg
	cq0DLhiGsWVX8Q3xjJMg+yTI0qCT96GbQKxKZsbLAuAcrYeDiwC8QwHbZh3muehqhKoz
	I5NcNfdsN5HXDQ/zt8xXdP4Zk48LXN8a/WfX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=VvUfADzvZbjf0vTJWX1ye4ShMKJRtR5E9XgIW2S1z4E=;
	b=LcRGPyRXr7AoN9yJTqszzNBn8RDi86gvMQVQpIYvOCGpTYBe4Hz6utpNb8SP0oPEGo
	eCEvSt63xw4C1Nc8q03mkrt0dAeAdc9sdS2YHto8HVnuFYI8gmNBG+YpEfXCiN7AgKy9
	pTD/FGbxvG5jGUDhfmNsmTUR9PcVElGnIBWstbp2ZYaWkMwzTSYqYFtZ8EuFynyF5cgo
	REgm8aD6KpGWR2w2pekce09QFQm76dwfSplXMnKwrOKHkW8YkQSC7XUYP4hAAgu2gFQL
	VvB4pyfG6L3UmaADCDNYKm3oiEeWmH5nO2Q7OnJ8dmfREqN1qDfD2UZkGVUM7xkVxuer
	E32w==
X-Gm-Message-State: AGRZ1gJdACNI3VZbsz/ymdnubrg7YCykDsfjnAocgvhMzUfSdGL2jYn3
	f89wcUwhPf5jWsCSSszcdEq+jbm7FcIxYu7KMsQneg==
X-Received: by 2002:aca:b68b:: with SMTP id
	g133-v6mr1467062oif.25.1541432041387; 
	Mon, 05 Nov 2018 07:34:01 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Mon, 5 Nov 2018 07:33:40 -0800 (PST)
In-Reply-To: <20181102001303.32640-3-f4bug@amsat.org>
References: <20181102001303.32640-1-f4bug@amsat.org>
	<20181102001303.32640-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Nov 2018 15:33:40 +0000
Message-ID: <CAFEAcA_MCTODEZg0Ak841iaJRBJ43Feh4cw_UmLaxk7-thb1og@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH for 3.2 v2 2/7] hw/misc/bcm2835_property:
 Handle the 'domain state' property
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bauc0kAEaEgz

On 2 November 2018 at 00:12, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/misc/bcm2835_property.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index 145427ae0f..5d332324bd 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -121,6 +121,12 @@ static void bcm2835_property_mbox_push(BCM2835Proper=
tyState *s, uint32_t value)
>              resplen =3D 8;
>              break;
>
> +        case 0x00030030: /* domain state */
> +            qemu_log_mask(LOG_UNIMP,
> +                          "bcm2835_property: %x get domain state NYI\n",=
 tag);
> +            resplen =3D 8;
> +            break;
> +

Our handling of "Set power state" has a slightly more sophisticated
"always say yes" implementation, but we have other properties which
we handle unimplemented like this, so if the kernel is happy with
this we don't need to do anything more sophisticated.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
