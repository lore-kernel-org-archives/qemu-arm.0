Received: by 10.25.159.19 with SMTP id i19csp1409675lfe;
        Mon, 8 Feb 2016 07:58:40 -0800 (PST)
X-Received: by 10.55.77.202 with SMTP id a193mr34972730qkb.48.1454947120864;
        Mon, 08 Feb 2016 07:58:40 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a198si31045332qkb.68.2016.02.08.07.58.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 07:58:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:46018 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSoD2-000140-Fi
	for alex.bennee@linaro.org; Mon, 08 Feb 2016 10:58:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSoCW-0000bs-Am
	for qemu-devel@nongnu.org; Mon, 08 Feb 2016 10:58:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSoCV-0005c5-Kr
	for qemu-devel@nongnu.org; Mon, 08 Feb 2016 10:58:08 -0500
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:34891)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSoCV-0005bu-HB
	for qemu-devel@nongnu.org; Mon, 08 Feb 2016 10:58:07 -0500
Received: by mail-vk0-x22d.google.com with SMTP id e6so97782831vkh.2
	for <qemu-devel@nongnu.org>; Mon, 08 Feb 2016 07:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=xckAxQAnGkgXU/roCRd9qH94XRZ+WXvf1jnvSvYMAEI=;
	b=H6Np6RyRNvVLU88MngCNcUTcunbM4PlRCPhZlutV5DpNer7rwmt1CntCYwdKEW4AUm
	mcJa+wDCTIh8oQkk/zAaugkj/UKu6q0+KT2S4jv4d5QD1TysHZHall9kkRDY70sqB4Sf
	wDV6odXEzqAP9pWw4ktIN071YnbgC7hH+7BjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xckAxQAnGkgXU/roCRd9qH94XRZ+WXvf1jnvSvYMAEI=;
	b=HZX1cRqFRWjr2bTpVFOpA8BLKg+NN1LNX+YGUbdCJxVn6eQQcYERGrrWWcHlif04gY
	IkGkLCncjF7iJQw/hpm2yyHscFyTorq3b6AC+DQPi/HHYFIFozlfTWsJe6buxvKErHyW
	4poBiqXw82R4DRD6kXp7MvZQIbVNGLQVCeqPyFKigijLLEc1M3MMhEFc6fYUHY2KNEaf
	X1HedV4v39W0PlXH/DWiH/VMwu6e+AdM8vi6IaRPL4YueZ+JWeGEPP47ECF9g7BwnHyn
	kWNiO+3y0TjaZLP5Ve5GMCLWpXo2p/2A4+gIeTdvrAzCm9bC+0c3kTSxvOCSE38aEPn2
	Hrkw==
X-Gm-Message-State: AG10YORIcZ/HBPLTR3RBjxh8sOMuX2QuDh/w+trEylaPC6t01PTKpqkuHf34z8tEGK/CWHppgErBudTpWPl3Ez8V
X-Received: by 10.31.141.2 with SMTP id p2mr21031590vkd.37.1454947087089; Mon,
	08 Feb 2016 07:58:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 8 Feb 2016 07:57:47 -0800 (PST)
In-Reply-To: <CAFEAcA_gTqN6NWZwngezWp0HrMU_4tA9523q2UH9wBXjeNsyew@mail.gmail.com>
References: <1454256948-10485-1-git-send-email-serge.fdrv@gmail.com>
	<1454256948-10485-2-git-send-email-serge.fdrv@gmail.com>
	<CAFEAcA9MXhTT2aqEvaDx4ksOMuDU15Z4Wp_4ht+dT3XufPSrbw@mail.gmail.com>
	<CAFEAcA_gTqN6NWZwngezWp0HrMU_4tA9523q2UH9wBXjeNsyew@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2016 15:57:47 +0000
Message-ID: <CAFEAcA82GNcGNTunWodbhGS72MB24+zs3cf_uXbgTgiRZgRYvA@mail.gmail.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-devel] [PATCH v3 1/2] cpu: Add callback to check
 architectural watchpoint match
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: h36bteyAadEJ

On 8 February 2016 at 15:42, Peter Maydell <peter.maydell@linaro.org> wrote:
> Andreas -- can I nudge you to say your preferences on whether
> QOM CPU methods should have wrapper functions, please?
> I think this patchset is otherwise ready to apply.

Andreas tells me on IRC that he doesn't insist on wrapper functions,
so I think this patch is fine as is.

thanks
-- PMM
