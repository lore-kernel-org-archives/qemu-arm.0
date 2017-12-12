Received: by 10.223.159.74 with SMTP id f10csp4095183wrg;
        Tue, 12 Dec 2017 09:41:31 -0800 (PST)
X-Google-Smtp-Source: ACJfBotLYUztnX7LoMpTuESEZd18MgmFfr2SLnZ+R+Z32Qzsq+druNv4tlRnOlzI7vYO4d4WJdp0
X-Received: by 10.37.246.39 with SMTP id t39mr3475214ybd.44.1513100491784;
        Tue, 12 Dec 2017 09:41:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513100491; cv=none;
        d=google.com; s=arc-20160816;
        b=Z1KSwDMcdfR+vnKuB11dlAqudUAIdzjYKEq9Ohu1qs4Eokg9+H1EOfqgNWPE2Ie6he
         jyNpdmw8s7YTXbgO+y/gtQC8vmM7VzcSvyP2D2CLEQuiWvf1ijjbeuB+WkuUVkkQZizT
         6F2762dc07BGtFyZT2u+Mb5bsLoLMKttAE94YBy59A79L2f0OUdwd0EDA32GrWwZBUqy
         XYQgRTr3ZiAXlEYkR279wXRo5+7cklawTCoMwI1V9uIRV04A3mnUJ6fh4+Hvac/Q4lcR
         WwaFj0eqwv33CSvUtivdl+uNe5y3roV0ATCYU8WIcPIZuicFIRv/73x8XI9y6f6nrpQH
         wQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=u7PVq1fFnGsiZklTgwYChErpwH4Ot6k4LVj+cOtAot4=;
        b=y5Zmahg/7qTOxQQIuwlK5Ms9DMrXCYtBMOa54jXA21M62Y9YkBTFGffFObhsNGpEg7
         z2WOaeKP2wDi/c2vgbeM06dIaOswhbZQTk7yGoHnyP8NhtXBD4iZhyXroi7/LalrlxQd
         7fciNFRXfUfMWcdUKQE+7DQ0tb47frFJpleeWZHgsnDCEgIMCgyu1clciUWE6vXf4vIr
         vu7N3F8hPaPkO4qdMekWJMMQMbVNXFgOTdrib4L4Euh3TlLgBuyxY7/fS3qw474cWnDs
         qRUpaJv+Fz53wS+EnCXx79Tve+h2mCTTd7U1b6+PzFnvdXxCaOFu+rrc/bw4BJCONpEu
         S/cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dA0V26Aj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c193si3474164ybf.371.2017.12.12.09.41.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 09:41:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dA0V26Aj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59755 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOoYd-0005TB-7d
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 12:41:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOoXj-0004wg-TO
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 12:40:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOoXi-0000jy-Um
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 12:40:35 -0500
Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231]:38693)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eOoXi-0000ja-PM
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 12:40:34 -0500
Received: by mail-oi0-x231.google.com with SMTP id s9so14539284oie.5
	for <qemu-arm@nongnu.org>; Tue, 12 Dec 2017 09:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u7PVq1fFnGsiZklTgwYChErpwH4Ot6k4LVj+cOtAot4=;
	b=dA0V26AjLSWXWNfv61jNytrE/MNdsSeEgqoXpg1zNPAmrmnlb1BpmcyKGVuB6HoBmb
	X9JcWAXSignC3CgAtFWgrH56VxHalPKTQzZaX6dzDxNlPwiShAgfymXB9kROp/a7uueE
	GWasOORNFTklt+49ZwAd1+0EvVZefZPk2XkzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u7PVq1fFnGsiZklTgwYChErpwH4Ot6k4LVj+cOtAot4=;
	b=C4iyT8nyJMHHe2L8tIc5Ow2aOJk/97N2fNXqfoT5JY4kD1ci7rfP+Cczx0Q8t5qbXW
	mm9OVNkdLRmsqt8zxoyAMl2kIk4AlksOYCxwXIOI/RAkQE3F0IMfcXczdTKM5/hphgy+
	Rm+Ij+gNpiZzF+QL2RHAg67HpiDYYu4wHGdcpuXCD+zKeSjd85otaoKJH+XogboamQ7A
	mbycSqYs16BdtEKgn6kWuo5N68L4i0i9rWkR2AVxd10MbPKtsTGCE89hofVOvKvkVPhR
	Pyzw0qZywc0j2zjDthrnBCEcC4XsEH7M1nyLPYn8lLsfHm3tdipiCJZ4b8o2/bI8Wxqy
	2Wvg==
X-Gm-Message-State: AKGB3mLNsCtfok5wZZyc0HXb9SsL0/1dt72evGqDrb8H+vLr/ARzb5QB
	y6z0hWfhObpkw98o1hewl1x8ogWgOHmlmW+vhyFTiA==
X-Received: by 10.202.108.66 with SMTP id h63mr3416380oic.305.1513100433980;
	Tue, 12 Dec 2017 09:40:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 12 Dec 2017 09:40:13 -0800 (PST)
In-Reply-To: <20171211213007.7353-1-andrew.smirnov@gmail.com>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2017 17:40:13 +0000
Message-ID: <CAFEAcA-gEjU+rBWSL8V4d520DOVheZoJZ76p5=9hmkXk3NqeOw@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::231
Subject: Re: [Qemu-arm] [PATCH 00/13] i.MX FEC and SD changes
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ggwF2kAkNe0a

On 11 December 2017 at 21:29, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Hi everyone,
>
> This patchset is a spin-off from original i.MX7 support submission
> found here [1], containing all of the patchest that are more or less
> agreed upon and are ready (hopefully!) for inclusion.
>
> Changes since [1]:
>
>         - Rx buffer in FEC was moved from stack to heap to allow
>           worry-free expansion to 16K limit.
>
>         - Added more comments explaining rather convoluted bit-moving
>           in eSHDC emuation code
>
>         - Triple Tx ring DMA "VMState" code was changed to follow
>           Peter's recommendations (avoiding the need to incrememnt the
>           version_id)
>
>         - FSL_IMX25_FEC_SIZE is used as a size of FEC's register file
>
>         - Removed leftover code from "imx_fec: Change queue flushing
>           heuristics"
>
> [1] https://lists.gnu.org/archive/html/qemu-arm/2017-11/msg00045.html

Hi; thanks for sending this set separately. Patch 4 ("Move Tx frame buffer
away from the stack") seems to have got lost -- it isn't in the mailing
list archives or my mailbox. Could you try resending that one?

Incidentally we should use the new i.MX SDHCI controller in the
imx6: coincidentally somebody ran into this bug recently:
https://stackoverflow.com/questions/47538951/qemu-freescale-i-mx6-duallite-sabre-root-filesystem-does-not-mount/47552596

I'll retest that this patchset works with my imx6 image, and
send a patch to sit on top of it to switch imx6 over to TYPE_IMX_USDHC.

thanks
-- PMM
