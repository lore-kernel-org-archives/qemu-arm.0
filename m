Received: by 10.25.21.96 with SMTP id l93csp669591lfi;
        Thu, 23 Jun 2016 11:53:52 -0700 (PDT)
X-Received: by 10.237.41.134 with SMTP id o6mr117562qtd.12.1466708032502;
        Thu, 23 Jun 2016 11:53:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r30si1509117qtd.31.2016.06.23.11.53.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 11:53:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38775 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG9l9-0001Rf-UG
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 14:53:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG9kb-0000mU-Lj
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 14:53:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG9kT-0005Il-0M
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 14:53:16 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:34577)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG9kS-0005IO-Qy
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 14:53:08 -0400
Received: by mail-vk0-x231.google.com with SMTP id c2so89290187vkg.1
	for <qemu-arm@nongnu.org>; Thu, 23 Jun 2016 11:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=tj6KclgZQapQIwJVAbfJFpH+iAameoI3r4OXlUZPKBM=;
	b=dVBB11dCXKaaSMzcP2TWkIDbQbXc9fvIC4AqElJIVLaTwMjFyi9NvpzVn6mZvZ7atA
	41VJLUFIsDvuQtTHWaIEFC8brpOyuPjQM7bafgLkEZ3Xj8l6T4mIH8pkSmDJUWPdD6dC
	zG4HrF22LxpOMz1RAH+bSC0Xk5mtJN0nn0c/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=tj6KclgZQapQIwJVAbfJFpH+iAameoI3r4OXlUZPKBM=;
	b=Sdqw1PQAX5TZsRjNojN9BOtaLsw6OX4PruVlskoAjQEJv0Ax2XvLY8WA8leOfb1NT1
	PJWLQCODsRKYeoG+epAYpodTVgtIb4Yy8xynCHkIFhUaTx0mzdRWBJLwFIAnAaeHUvw9
	nFfD9KieuuQ77LgbB+zhtxIctMBc4UjOs3LuTFqZA9eaPBfJF2dhCq8LPAv3uZpPL2rp
	kTAGfR680/7/5eH+Lt2OnXLMDl/bb8yzIozuLMUpJtfRMbUKAwlhzA9laWNzF3XOmccR
	rTHZ+5xy9mK+wfUSzdSiyYEfnfETtbXo7Kn2F1XhwUibSYnMmbJhmXTw0A2sIX83Evgk
	KZCQ==
X-Gm-Message-State: ALyK8tKcNg+Vc9/qZuXc8JyiFx5S1Tf8d0BjCwB8TkNmB/dt0Mg+3XKt4YUDsuHa2P92nUMgXhtpLqGpXDRomx9m
X-Received: by 10.176.0.145 with SMTP id 17mr16682865uaj.103.1466707988338;
	Thu, 23 Jun 2016 11:53:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Thu, 23 Jun 2016 11:52:48 -0700 (PDT)
In-Reply-To: <1466699607-30406-6-git-send-email-clg@kaod.org>
References: <1466699607-30406-1-git-send-email-clg@kaod.org>
	<1466699607-30406-6-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2016 19:52:48 +0100
Message-ID: <CAFEAcA832Wa0wjSvSrAkmy5K3-jjLXgFtCs3RkK499V5W1vVNg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-arm] [PATCH v3 5/5] tests: add a m25p80 test
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
X-TUID: it8b/gg3iV8V

On 23 June 2016 at 17:33, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> This test uses the palmetto platform and the AST2400 SPI controller to
> test the m25p80 flash module device model. The flash model is defined
> by the platform (n25q256a) and it would be nice to find way to control
> it, using a property probably.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Are you in a position to check this test passes on both a
bigendian and little endian host? I have no specific reason
to think it will fail, but it seems worth checking.
(If not, it'll get tested when I do a merge eventually.)

thanks
-- PMM
