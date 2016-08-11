Received: by 10.25.21.156 with SMTP id 28csp50202lfv;
        Thu, 11 Aug 2016 03:26:52 -0700 (PDT)
X-Received: by 10.55.201.200 with SMTP id m69mr9951361qkl.235.1470911212828;
        Thu, 11 Aug 2016 03:26:52 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b42si1164073qkh.95.2016.08.11.03.26.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Aug 2016 03:26:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47357 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bXnCO-0001RK-4Q
	for alex.bennee@linaro.org; Thu, 11 Aug 2016 06:26:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXnAH-0008Vs-K5
	for qemu-devel@nongnu.org; Thu, 11 Aug 2016 06:24:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXnAG-0007Xq-IQ
	for qemu-devel@nongnu.org; Thu, 11 Aug 2016 06:24:41 -0400
Received: from mail-ua0-x22f.google.com ([2607:f8b0:400c:c08::22f]:33886)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXnAG-0007Xe-Da
	for qemu-devel@nongnu.org; Thu, 11 Aug 2016 06:24:40 -0400
Received: by mail-ua0-x22f.google.com with SMTP id k90so112884173uak.1
	for <qemu-devel@nongnu.org>; Thu, 11 Aug 2016 03:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=s+RHGsRDRvuMR8kiKdd+NyBUUIAMa5K/heYwJs3dVUM=;
	b=i3aYuiyIIaLYxhKLXFZ5iAPwWFzv7QZ9CL/lBIKbNFGM6/JNpRCXEEWThKLP2HZxKQ
	so+ZStwUjyvOE/86oQXK8IqKmCez/uatGQYqzaAgURjYgOgJQ+eAFCvssgCC2zrOw8Kx
	EIUkzc7S3MX0HNqeGUm9Yp+sWOZQigrY281WY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=s+RHGsRDRvuMR8kiKdd+NyBUUIAMa5K/heYwJs3dVUM=;
	b=SKr1xhjXN4t3f4xVzZ8fAtgk33YUsn9WcACkS3BGUE4PQrdA9EUHcA5UEaPC5eq10A
	5q+Xkf+JraDMu7HUyntFCI28lpHxYJCxiFYw3X1+5hV8vnO79EpCh/6a4/go0fT8WQVM
	XU41DWCwvZzRAAITyy/UbZMwjIObdEYkXmsnt0P2ypNrpO+rJmFH/dcSiKO/3GKWIMzr
	khKcSO/fbMVnN6f/g27Vp6mm/+4J9CKJG/8+RwYa2//TsGU6ruNAiXnghPefIran/8C4
	6/UIVjdeQmICSF2+PEwqVCyzTKGzALhN+WilC6nL/Kgc99tvwnFYDjNuk5Gu60uoRLUU
	j37Q==
X-Gm-Message-State: AEkooutnaWizt/yliAX61iaQFxEFTp+xNJ6YLS7hlEJVH5s1Ios4SUCKEO7C4vVDr2yoIAJN6EZ6XzSHWI/tZ5fy
X-Received: by 10.159.32.66 with SMTP id 60mr1024558uam.125.1470911080113;
	Thu, 11 Aug 2016 03:24:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.150.17 with HTTP; Thu, 11 Aug 2016 03:24:19 -0700 (PDT)
In-Reply-To: <1470158147-16378-5-git-send-email-clg@kaod.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
	<1470158147-16378-5-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Aug 2016 11:24:19 +0100
Message-ID: <CAFEAcA_tMZsDmWWxr7O11y7RMbA-ku7=PSSxaQbZsHOUFm7pDQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22f
Subject: Re: [Qemu-devel] [PATCH v3 04/10] palmetto-bmc: rename the Aspeed
 board file to aspeed.c
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T5E353pdxjoB

On 2 August 2016 at 18:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> We plan to add more Aspeed boards to this file. There are no changes
> in the code.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/arm/Makefile.objs  |   2 +-
>  hw/arm/aspeed.c       | 106 ++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  hw/arm/palmetto-bmc.c | 106 --------------------------------------------=
------
>  3 files changed, 107 insertions(+), 107 deletions(-)
>  create mode 100644 hw/arm/aspeed.c
>  delete mode 100644 hw/arm/palmetto-bmc.c

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(again, the right format-patch options will help make
the patch mail clearer).

thanks
-- PMM
