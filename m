Received: by 10.25.21.96 with SMTP id l93csp347517lfi;
        Fri, 1 Jul 2016 08:19:57 -0700 (PDT)
X-Received: by 10.37.64.195 with SMTP id n186mr9931787yba.166.1467386397565;
        Fri, 01 Jul 2016 08:19:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g194si87046ybf.84.2016.07.01.08.19.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 08:19:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33965 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bJ0EX-0002YO-1N
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 11:19:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ0ES-0002Wm-Jg
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 11:19:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ0ER-0003sw-Ly
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 11:19:52 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:33762)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ0ER-0003sm-I3
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 11:19:51 -0400
Received: by mail-vk0-x230.google.com with SMTP id k68so70612091vkb.0
	for <qemu-arm@nongnu.org>; Fri, 01 Jul 2016 08:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jHJNJyTAEDVHKF6gaoOZ/LOlQuPL5fNp27vD9XegzLU=;
	b=YeuCn6+p785dcbaEMtAZnBekSp/wc9w+4sGYpf1F3g4BUuBEgEhhO4EQOByolrXLA/
	KZcU2vOwfN2PELsx+DDLkIXrX5LmcbZnhfjtP3cyzHYvBFaWP5LdE9qbkdLj4AAejc7/
	HlNLeyQX6SeBMLyX7bW5tkYDAebKLMdP12ZHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jHJNJyTAEDVHKF6gaoOZ/LOlQuPL5fNp27vD9XegzLU=;
	b=DguZYbOfZhz4qfgBO5U1jO01liN7+k62wugyB8OrzEqKlCzwzNrAGNVrNOgbVfPs5O
	zu0Yn/H35I6PJiw7kihtPO6CiJajgdbWB6ocnJIWdwmXBKTbqgikd/UjgbtOmISz2Fo6
	ZJMwPnvFaEjrOE4n5tozo27DDivNBUo2P8TB3zgtq2zkq6UY+x2m/suZdKndRNwKIghY
	VoslXtmWrFKh4OlmQ4Zd5Q891S7rjBcs5+c+pWFXkxeewTmFmEQAd2EobKqd7I5FcZGr
	5GTUVaardkIuVkRJteAuN379TiVVw7WwXR+M8YE1lglQscg1feGjsa88NyEvdpXI4HDa
	wCVg==
X-Gm-Message-State: ALyK8tK9GEMx/s/61LcNSL3tlmMIsWxEDgS3+gqIkWs4uKjHZ2CpykuRjp9BQHBzrdFR+h5K/O274j9Fz1fAx95n
X-Received: by 10.176.69.138 with SMTP id u10mr9612662uau.24.1467386391139;
	Fri, 01 Jul 2016 08:19:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Fri, 1 Jul 2016 08:19:31 -0700 (PDT)
In-Reply-To: <1467138270-32481-9-git-send-email-clg@kaod.org>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
	<1467138270-32481-9-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2016 16:19:31 +0100
Message-ID: <CAFEAcA_aRb-n_QhG8KU_7XCSXPmsCUUa_agZGv+Jn7cjfOfPbw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-arm] [PATCH v5 8/9] ast2400: create SPI flash slaves
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
Cc: Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a2NaZUo/9sQ/

On 28 June 2016 at 19:24, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> A set of SPI flash slaves is attached under the flash controllers of
> the palmetto platform. "n25q256a" flash modules are used for the BMC
> and "mx25l25635e" for the host. These types are common in the
> OpenPower ecosystem.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>
>  Changes since v3 :
>
>  - moved memory mapping to platform initialization
>
>  Changes since v2 :
>
>  - moved the initialization of the flash modules under the palmetto
>    platform
>
>  hw/arm/palmetto-bmc.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
