Received: by 10.223.159.82 with SMTP id f18csp1002660wrg;
        Tue, 21 Nov 2017 10:19:05 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYeHHy7cCgt4SC0gNboAlq/+u21C4RdTDhd1tiF9BxXhkMMi5PfW+sTljTsecyvHNFzgKxr
X-Received: by 10.129.132.140 with SMTP id u134mr11630423ywf.4.1511288345758;
        Tue, 21 Nov 2017 10:19:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511288345; cv=none;
        d=google.com; s=arc-20160816;
        b=J3RM6+OjDez2XLsMIYFRP8ahN2jAmKa18pA9z53zl0pXId729QtahmN5TozzvypW84
         iC8B5sDHFAmI1YUye37ydyR6QmX9FJ5TLkUb+VwSNi1nJHwph45J9yIJGpyul2oN08OC
         jc//Hx43pSO2JkHzrsgX8CWhhXeZhTKcxEt1mq73uc0x16gWl4EOwREDkFqfq5vgzIgQ
         DYB+D33PQDs8Y8t1lh4/U1ASXDNaJ836WIARTi76bOhxZI8eWMLxmLWtwrUFNoNlVknu
         /WM5BBQ5Lbww2DHCUhbmJykAV+nK35pczTrUnuwhjUALZ4shOWZIIPzPq9RTokznKTkm
         N2IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=HQILkCMB2qYlitFmJFkc/NUSQaQzCtGhi7mjtLYtTg4=;
        b=vxcSZcg11tbXpYjmVE+zRls8D8CJbGmGeSidN53uwkM6FKmrpryj/BjsSKWelTn13d
         OmBEVpY82x4JQRZGC+5FGlaTe57tAbcycPfCNkmLgLkg7iryF5PtQng+WHKwt5i9xw5C
         Fvwq8j9QCz6rvv2DeAX5zRkIcnK/TxkzE89OFi1GhgM7zKKoa08hlQTygScz11Y0bUIq
         X6jKACU1fBcexF7fiqYh6T2ENB+zyJUIIG01UWEiaqPpdowDHyD9ssJ94HhnKD7o0Xfc
         NQciBpB2ICbotvNw2+nK/E+vaV3peSZx7VXM+bDaVTyM/2NgddfowTAyrYs9tI9opLJb
         pPZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EvtrGUqu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z186si3003866ywb.26.2017.11.21.10.19.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Nov 2017 10:19:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EvtrGUqu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35920 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHD8T-0006fq-5d
	for alex.bennee@linaro.org; Tue, 21 Nov 2017 13:19:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHD8I-0006fa-7n
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 13:18:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHD8H-0003Qu-El
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 13:18:54 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:42848)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eHD8H-0003QQ-A4
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 13:18:53 -0500
Received: by mail-oi0-x241.google.com with SMTP id p23so6070372oie.9
	for <qemu-arm@nongnu.org>; Tue, 21 Nov 2017 10:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=HQILkCMB2qYlitFmJFkc/NUSQaQzCtGhi7mjtLYtTg4=;
	b=EvtrGUquFnPN+h90OE8nPoxXppLV9PdvF3Ie1VbVh/NoQ+ftCVYnhuWHCfNqYuyfoI
	SvnUQXZglLI7ejqxGL30QkQcnNVua+kzcuXYiqTDosRFNinAlyAA90mWrCKWQ6XLUuOV
	534Bwgzrumd02+K2oRJdvoRGnEBTDKMPVqyBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=HQILkCMB2qYlitFmJFkc/NUSQaQzCtGhi7mjtLYtTg4=;
	b=EzwvX0Pqeuh71hYrc8+i3YDEHGSq3ANWILbRbJG57E3p1KHGWwLSi8DV19Him7ctei
	+OLv9prCEFVoOYcr7/y7A44OSau0rc7DtoxPF/8ivucxXr7ylhmMyXXiiAItftn7Wj1D
	6odFof6xBDQ1rMoKWCmp80ujz8hsICdsJz6BkBraaTfDrrm+kRSFkXOBUeIgkHvvsIWe
	RVsyawQStraAIMrf+FdsrzL4vwjCIqsNclfVjbMa3L9Xqt9NRKv1OFMR0jl28ITVn4WU
	p818jJP6ennNnuUWT6hETvBOWIdGIPJkyc24cNHXRnd5Z2q9uBp/2QA5bwMQgqt7x7Ik
	JABg==
X-Gm-Message-State: AJaThX45cG43cFUlPq/d+QbK8xxhxYIXw5q4bFEqlbc+Uya3eMP7MWSk
	Gk4KLLy3NWToH6IYe/wIZZF5LHn6MYRalaELWH4uIw==
X-Received: by 10.202.213.151 with SMTP id m145mr2010814oig.328.1511288332615; 
	Tue, 21 Nov 2017 10:18:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 21 Nov 2017 10:18:32 -0800 (PST)
In-Reply-To: <20171106154813.19936-17-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-17-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Nov 2017 18:18:32 +0000
Message-ID: <CAFEAcA8RExNSWHO1F87o6j1Z8k1MEcJ_VvrE3VOpgJRPcCa-vQ@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v3 16/30] i.MX: Add code to emulate GPCv2 IP
 block
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
X-TUID: 0m2WoxfTs1cu

On 6 November 2017 at 15:47, Andrey Smirnov <andrew.smirnov@gmail.com> wrot=
e:
> Add minimal code needed to allow upstream Linux guest to boot.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/intc/Makefile.objs       |   2 +-
>  hw/intc/imx_gpcv2.c         | 125 ++++++++++++++++++++++++++++++++++++++=
++++++
>  include/hw/intc/imx_gpcv2.h |  22 ++++++++
>  3 files changed, 148 insertions(+), 1 deletion(-)
>  create mode 100644 hw/intc/imx_gpcv2.c
>  create mode 100644 include/hw/intc/imx_gpcv2.h

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
