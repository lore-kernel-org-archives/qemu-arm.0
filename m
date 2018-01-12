Received: by 10.28.173.206 with SMTP id w197csp2087345wme;
        Fri, 12 Jan 2018 09:09:50 -0800 (PST)
X-Google-Smtp-Source: ACJfBovsap+a74YrfwCRyzK91nIFHdBJy2Hx3GNPx5KmLehV4+xTeQRtRefsXR4mmtfQlY8qa2dE
X-Received: by 10.37.64.6 with SMTP id n6mr20658195yba.415.1515776990547;
        Fri, 12 Jan 2018 09:09:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515776990; cv=none;
        d=google.com; s=arc-20160816;
        b=LEyR36DxxJS9rKMAttUSiFPTeG4bHk06CyQA4MpwxFtUyhNLILcnwZtdGllSEe+zgp
         Fd1MH+ymAqjmt3+C0hTi98jSPUgVqRFXrhyMBfhYge5r4Twv/5Hu0KaxMABJzmV0wjvv
         cJ8HDHvqSMHG+P7WajQDmkgwon1g905J/P+achoznMYJNc+LCyq5UDMcm01lzsOj+anh
         QBKcl5ZdFt/9zfNOhXF/cFMJYfAQPPQz49oCyTVlPnoPLuFy9OWGPzGoB/Pruqz3e+pl
         h9Dp99MzTZCdnNAfkbV3gqu+UNVpUnnsuYqu1GqBq5qIKkZAYYs4/+BYejR2gRAKq26C
         8ULw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=4wMwFWLU18GJDQIe3YQYZ+7JtU2di6IOq+LKueF9YKc=;
        b=gNihbWUjUxzRt0UoslWCa6eHGX8rsu7Ch1BZD2bY/ir3UIeYg6ZdOPgYkxsDIEkY6i
         DdgzTfKhliyQVFrDSgcwBwTmXHK2kaF4x9C5njANyZAoDCAvv4XRwuZhXTkPTVg/Y09E
         /E6iSnwY9CUfg/VpT2Jg8dSq0SOQNMF1SLnW+BewiBXL9aLbIO1hG+gazM4X9kG3SqMA
         exmQG3zrxUURhBWxwPeP0FTEcG7PS4B4PjxnkSJGfJzPBesCd6CG2GMPm/eWsGU0OsR3
         JKNd9TtBv/cUR2qCSBQpzkhreo100LAq+2GC9t8yaYC0FtJPVdemwWaDBmGtyL2vIXJD
         W7Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wvye1F2R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e64si4677080ybc.591.2018.01.12.09.09.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 09:09:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wvye1F2R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53381 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ea2px-0004Q0-RP
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 12:09:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ea2pH-00040D-IR
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 12:09:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ea2pG-0002a0-E9
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 12:09:07 -0500
Received: from mail-ot0-x22c.google.com ([2607:f8b0:4003:c0f::22c]:37307)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ea2pG-0002ZB-9c
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 12:09:06 -0500
Received: by mail-ot0-x22c.google.com with SMTP id a24so5598050otd.4
	for <qemu-arm@nongnu.org>; Fri, 12 Jan 2018 09:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4wMwFWLU18GJDQIe3YQYZ+7JtU2di6IOq+LKueF9YKc=;
	b=Wvye1F2RvzM4e9xJ4Q9vjnJVgpWBaMr2nv02u39l60cFHrmS4Qve+kNsXftZCJNpXb
	+Xrgmv47jJJYdt+89c1EmCz/lsoVmhZadFhFxBicmIatX9qkQ2sxrA30LGdS9A4YlsmO
	ejv4MwS8Im1ROm7PEDlUO5mWk5AynVWZkUT50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4wMwFWLU18GJDQIe3YQYZ+7JtU2di6IOq+LKueF9YKc=;
	b=jdW4VjPu2+SO2+QU7kJKXyyIgqWQYA0QEzbp+BxAUJtKqRYgiyND56Kw+/ze64fXR0
	vvz2Aun9RB70CQkhgJ13LrtplgtPyTMYfmIkq0E7EBEQI3d0M5pVGGCttAgd5OIcYaqP
	xK5vE3iimXzERYuBspcy/eRlf/Y39oTtqGQ3K+6ubcvvyuhQorOq/57WoIbayTDx6gUa
	lrDf0J79ihi429ob3IygBpPm5viKm9UjSQXu2c3Pfpd1FV7Hiu8PBw+GftezSrIyQw/0
	kwiqzVMvNrlzg/Aegnf1FK9/RBBUmt2aZD1j2MgzWdzHk+t2DJrgE1JZ6WiSGEX2aKXb
	Onyw==
X-Gm-Message-State: AKwxytcZy0AsvBjevfeJ+ZuN56Gp9zl90XS9v+uvtZjOspKheNf+rUSm
	CifGqMjauWa6Ly161aQvONSsslNYkQ0lfX+NvDok8g==
X-Received: by 10.157.29.233 with SMTP id w38mr14042115otw.24.1515776945549;
	Fri, 12 Jan 2018 09:09:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Fri, 12 Jan 2018 09:08:45 -0800 (PST)
In-Reply-To: <20180110203823.22292-1-jcd@tribudubois.net>
References: <20180110203823.22292-1-jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jan 2018 17:08:45 +0000
Message-ID: <CAFEAcA9q9tKedxXxMDS3e2jWA8geL2q2pe=Oo3-E8RQ=cD7LFg@mail.gmail.com>
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22c
Subject: Re: [Qemu-arm] [PATCH] i.MX: Fix FEC/ENET receive funtions
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
	Peter Chubb <peter.chubb@nicta.com.au>,
	QEMU Developers <qemu-devel@nongnu.org>, fyleo45@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IPKwzNK7tN/Z

On 10 January 2018 at 20:38, Jean-Christophe Dubois <jcd@tribudubois.net> wrote:
> The actual imx_eth_enable_rx() function is buggy.
>
> It updates s->regs[ENET_RDAR] after calling qemu_flush_queued_packets().
>
> qemu_flush_queued_packets() is going to call imx_XXX_receive() which itself
> is going to call imx_eth_enable_rx().
>
> By updating s->regs[ENET_RDAR] after calling qemu_flush_queued_packets()
> we end up updating the register with an outdated value which might
> lead to disabling the receive function in the i.MX FEC/ENET device.
>
> This patch change the place where the register update is done so that the
> register value stays up to date and the receive function can keep
> running.
>
> Reported-by: Fyleo <fyleo45@gmail.com>
> Tested-by: Fyleo <fyleo45@gmail.com>
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>

Could you have a look at current QEMU master, please? I think that
commit b2b012afdd9c has probably fixed this bug. (At any rate it
has changed that code so that your patch won't apply.)

thanks
-- PMM
