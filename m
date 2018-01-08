Received: by 10.28.173.206 with SMTP id w197csp2502350wme;
        Mon, 8 Jan 2018 06:01:02 -0800 (PST)
X-Google-Smtp-Source: ACJfBos1YBx/HHy9xJ1sQmLVYjJBdAv+CVNueSXKpZ8+Rd1WTs9TIzHQKM/NSFzW8MiD0qooPukn
X-Received: by 10.13.231.1 with SMTP id q1mr10622075ywe.451.1515420062403;
        Mon, 08 Jan 2018 06:01:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515420062; cv=none;
        d=google.com; s=arc-20160816;
        b=nkLDBcWVxbnaIna1CMIpkPE7dR3bgJvyvH9jFEdekf6HNmU77oOkkLXGgScNBHs7Qn
         tv2VHQJYxr41LJCqvHH2M/KJ0/kI1cxKZgIf6V9bFBRJlPQk/aZG1u73atLK4PqHAqiW
         xTMzpj97AktRyYdOXmnSYQq52nmpWYgXjoqCs6SCmdMdHfIdRoEuWb7Jkr3amsdwOqus
         53UWDbp3z1rC9IqqGpVA4YeLMAiNXjbfGCrOfbAOuKOL6nqnsulMVtMKQlBjR+UC3E2f
         JI/vLi8lBIPtbtL1k6ftL6sIiLLi4/gFREapf+q1yTvwOinA30nUl/4nhv9N19hRaUes
         xeIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=vv8R7uZ2Z4EF1LNOXqzvGX1RCN0zY7VzSaOdo54c0K8=;
        b=eVR0uEwyrLs3ONd+IYTfbPO5F1g0Z7fuYwZwDwKwXAjacDqUaTUrw8sukgMjKEHJeU
         Ui+a/K7WmlkX01XpFBwbeiTzNOlXf+G6U3Ab1pSLgQSZhIB5sgrlUkKwbJRwPVMOaSRk
         Xt6XEgFgASBNAcfdj5Iu3jcKM2qckl8XGsBAXMPvejPKO9KH/gifvaZexsFYuATQuopd
         yaT8PmDJ7UjcIwQ/iDqHyyj4FX6pai3Eo+G+m1e5jz/DHcaZdvbw9/plvZXMH55FAXRM
         I7wLRNlBTo7o34emEwDs37FwdtlMGrXcMb6PqIHK7gYkR2CeVI4PTmk1UK2kFvVhFlNW
         PamQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AizmxaAV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h31si1492971ybi.282.2018.01.08.06.01.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 06:01:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AizmxaAV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36204 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYXz3-0006Lp-Sg
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 09:01:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYXyp-0006Ih-IR
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 09:00:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYXyl-000490-21
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 09:00:47 -0500
Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e]:43059)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eYXyk-00048g-TU
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 09:00:42 -0500
Received: by mail-oi0-x22e.google.com with SMTP id t16so2149513oif.10
	for <qemu-arm@nongnu.org>; Mon, 08 Jan 2018 06:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=vv8R7uZ2Z4EF1LNOXqzvGX1RCN0zY7VzSaOdo54c0K8=;
	b=AizmxaAV0E+u4C8NYZFYUrO/aduDbGRzrsjP8jAHuwcZBvEIMrPAk6ylZDYBIuCEDj
	55wcXQuJ/3zqJdMQwRh76Mv9N2Esz1MoX5ykqcrGtUHdfvjaluLC5LcPX+Nzy5r33yxK
	wDtMqGxW4+R8JVLH+pxUhZgNccRI0RcPnaLwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=vv8R7uZ2Z4EF1LNOXqzvGX1RCN0zY7VzSaOdo54c0K8=;
	b=Rjq/PCjPBqvlezLjH5/sXlhYtKbvZJfhw3rcQFG4rJzpj0mC8b5EdotqGQ8sfc2xR4
	kzWZaEauVICiIGSEF7yYxwKAsZRrOAm0r33ayIqIuHkbt6jZjNHjS/WrylbMW6ApD4Jd
	v9WDEjGyWut4PzYNU038MkJ9RcTq79bwyeSloCV2Vvsx9QDIQuW+tfGPMd6pJTSZXM37
	0a3/JqJWjKsRe2uM/jnkrWdztVF/4bhteMkT1eroA1QexI/RkHRepq+lUFKIzv6krtrX
	oIkP3ldd54fjJ5+z45Ta4fgZWd10g1AjOxm55SYT2E4ITbOYk/pFLjncREiXyJy4cvwM
	B0dw==
X-Gm-Message-State: AKGB3mJFzogepd2SsdqWmY3TmRSqDgX8Egx4MY/NTDuqnSkr3pCxHaMt
	gN1wQGRwmzJ/aguAeahjgkVlC1sMbHHYai191xKspA==
X-Received: by 10.202.237.198 with SMTP id l189mr5690467oih.8.1515420042084;
	Mon, 08 Jan 2018 06:00:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 8 Jan 2018 06:00:21 -0800 (PST)
In-Reply-To: <20180102193622.27215-6-andrew.smirnov@gmail.com>
References: <20180102193622.27215-1-andrew.smirnov@gmail.com>
	<20180102193622.27215-6-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jan 2018 14:00:21 +0000
Message-ID: <CAFEAcA-4=wy==HyXxivLQJE1rRsZxOW0=r7p3raTKfJEtsVPBA@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22e
Subject: Re: [Qemu-arm] [PATCH v3 05/11] imx_fec: Use ENET_FTRL to determine
 truncation length
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
X-TUID: 95nmEIxuzCB1

On 2 January 2018 at 19:36, Andrey Smirnov <andrew.smirnov@gmail.com> wrote=
:
> Frame truncation length, TRUNC_FL, is determined by the contents of
> ENET_FTRL register, so convert the code to use it instead of a
> hardcoded constant.
>
> To avoid the case where TRUNC_FL is greater that ENET_MAX_FRAME_SIZE,
> increase the value of the latter to its theoretical maximum of 16K.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
