Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1949601wru;
        Thu, 16 Aug 2018 07:58:58 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPx98Rx5Upxwwgz9fAwrWvmL2ocjw7Tqm/gK8LYr/38VvTPN1F2sw0BgRnAdKr7AK2gBZqO2
X-Received: by 2002:a0c:c176:: with SMTP id i51-v6mr27312188qvh.40.1534431538236;
        Thu, 16 Aug 2018 07:58:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534431538; cv=none;
        d=google.com; s=arc-20160816;
        b=XMRg74dfa5YmOgf0fYlaNmkId4nbH90zPIJwNvI73zYUtXbcGa1Hzjo93Ml5hdyWrR
         jHV7xaHL5oyEqgFln1lrajdlCez6hM+llP0CSqbHNqhwryGd+glZU3iJKhh/ieyd/hij
         rkMfF9aP46BhmVTMhcZ7sdFZ24Dc69lQck5i0GBc1RwoZ5ei1kswrr+d16Ae69gRM3BY
         bFjOIf4i5ffJcHogHmFcbleWIWNallrrrExNcN0fJPz3a7xIDQAR+nPcj5BbfxPMtf6M
         InTJcIwXyHpK7zlU63DW+5VEnDyiU8w0gj2uq9oWFBPJ+KBDrsKinHJshOZpxQZIAI/E
         AmNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=nLEmr/lnfUOkGVLQJOeMoUAOfuYiKaN63EAG9DGZ5sw=;
        b=gf7WKe/6+jQ5eEKxv5FGf6nCBWl0ILoOVlMo3JNAC1+XD/XppWS0zvvX6uSlpPp5YW
         5VOV+ltIX/Fn/SN8scqApNPkhVn0Xfiwgq3TNzPzJgFm7EfTX6h86PB5QqiQwjM0xSiv
         52Ko8kYrjnD487Td6D2vKYJfZwHU0IcBytuvSr8jDWOhy6LX65MsjLKmZXMXiVxEwtXa
         h8Q8xuuMRkQxEGx82PJaj4q06Y7RKNiOBuQNlL+yp7xltLajO6srvJsh/6NVsK3weIzX
         y+SJYLzp9mEXrlYzHExHMtbOgmtXJXFTI30E3koozYJDkiCPnZhA9XMY7oK1E/eErm10
         8aXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HUiTCG3T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 19-v6si2246940qtr.222.2018.08.16.07.58.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 07:58:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HUiTCG3T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56187 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqJjl-0004Mf-L6
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 10:58:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqJjX-0004KI-6z
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 10:58:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqJjT-00082c-CZ
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 10:58:42 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:32837)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqJjN-0007z3-5S
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 10:58:33 -0400
Received: by mail-oi0-x243.google.com with SMTP id 8-v6so8560271oip.0
	for <qemu-arm@nongnu.org>; Thu, 16 Aug 2018 07:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=nLEmr/lnfUOkGVLQJOeMoUAOfuYiKaN63EAG9DGZ5sw=;
	b=HUiTCG3TszXLwrzrBRyeBdxgYx+YH5qmcHxoAhP45uOv+RtDYdEmnuQ1Ozas2LkppD
	vB4hP1LfMMExIfKJRlWvN1mIf4QbsDRkV+j5bSqfJSUXr8KgUUfd2PKnoO4C0f/f8yIl
	9FbY/GRf+Fm1/MWcTvjUUPWXexFwIu7juoexc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=nLEmr/lnfUOkGVLQJOeMoUAOfuYiKaN63EAG9DGZ5sw=;
	b=ExPSJLDcgLEmdoGnOT63Dc5RqfSd3bblmuartkNdl+0axLsdW/SgNRt+HiNxARSb2k
	f5qrIb7DyWmyLEIVxe+JhcKFBPS7eMpRlumqr1PpieDakdGDx3yqT9sVR32D4jLWLlSF
	pbFpQ20xenG4BayKUvgj4JkJbw4pwUVGSi7ZXw166GIjFARQsuuUEbFqNET7MQXewxkw
	YmBJuHMtt0bcG7BDKjTqwB63xi3JANqBQxkRTQok+1JI8yjTiU/hzQlrJqo6Rd9vYZ80
	yqwOWz3mihSK+CvyZUdHmaWzyJahTI1Pbjw8Ju4xKY90fKI2nAG/+f7XVvnAE94I6RH9
	4MLQ==
X-Gm-Message-State: AOUpUlF6eF/9u0Sh7Yb5vn0hDiGhKVtkbL42JViVhB/ffkD9j548+caW
	JG+5qMHp9X/UrcyabakhwZm/6sWVpWlCCL4/wdP7xw==
X-Received: by 2002:aca:c351:: with SMTP id
	t78-v6mr29674888oif.338.1534431512434; 
	Thu, 16 Aug 2018 07:58:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 07:58:12
	-0700 (PDT)
In-Reply-To: <20180811090836.4024-3-contrib@steffen-goertz.de>
References: <20180811090836.4024-1-contrib@steffen-goertz.de>
	<20180811090836.4024-3-contrib@steffen-goertz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 15:58:12 +0100
Message-ID: <CAFEAcA933sH19gCXqQq7ycNwpmGRHY+HekbXvHRn4CVZ_DBCwg@mail.gmail.com>
To: =?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH 2/7] arm: Move nRF51 machine state to
 dedicated header
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
Cc: Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eD/4jLO4psdp

On 11 August 2018 at 10:08, Steffen G=C3=B6rtz <contrib@steffen-goertz.de> =
wrote:
> The machine state will be used to host the SOC
> and board level devices like the LED matrix and
> devices to handle to pushbuttons A and B.
>
> Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
> ---
>  hw/arm/microbit.c         | 38 ++++++++++++++++++++++++--------------
>  include/hw/arm/microbit.h | 29 +++++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+), 14 deletions(-)
>  create mode 100644 include/hw/arm/microbit.h

These changes should be squashed into Joel's initial
patch creating the machine, as per discussion on that patch.

I don't think we really need a separate header file,
unless there's something I'm missing because I haven't yet
read later patches in the series.

thanks
-- PMM
