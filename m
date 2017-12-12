Received: by 10.223.159.74 with SMTP id f10csp3909515wrg;
        Tue, 12 Dec 2017 06:51:31 -0800 (PST)
X-Google-Smtp-Source: ACJfBosvJFvaGD3nlwmsZZHY7WjF5jm3e3QRgQxgG9fwcf943i1+hFvPeK00FMVtxl6DmKZB0tlB
X-Received: by 10.13.196.4 with SMTP id g4mr2920330ywd.41.1513090291783;
        Tue, 12 Dec 2017 06:51:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513090291; cv=none;
        d=google.com; s=arc-20160816;
        b=kfvT8brelUudnLDr6vEb8uAC59wSJgjfiirnCfKpPt5bKgYS9mY190VS2G8ip7Ircm
         KxpAcOK7puAoy3mufXbiADS8fikatzCDmRAylu4NmkI72lisU4lT+8QTsGt7QLPkJuCR
         L6m5DzpQ8sr2iaVPfRHvLOETIsHLO4gYaEEZw3gnd0A4VYKkJDfzdvSiE1MpvVz5XFb6
         c4l0oumI/hx2VBIzAnxe3dQ5rOkMK510YZQNzDA2kuqRrnG5ALvYvF5u6JZpwl/rRnxt
         E7glDPVTsRcM3jeA612EZ6sTMPft8UvR0vqwdcgSrLwKa9fzR54Xy9BIyvSzf1QIEpKL
         mz2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=cLwL4VMImdJP8Ww/hfFpv4/xd/qwXsb+bJE2CUvAL1k=;
        b=LpRB3dygTdrmuhNgngTPrpgYA8Ja3E7+ux2uxHJjYMhmCwb7ClDwg4oOV2JsrHGWgE
         QynuIfaB1GgSG0VB5B2OrWuCkhEV5UBQFMbleOKLoCGDe1Vswd5wRYbrkB5GFUJN/U2W
         O28adOmlvNcAT3zewFx4LesFYA7KAnbej+5dlyWa6nCFyuKob6bkhUTmSshjkEokLRSJ
         tBGiiJjzLr7K96DbYvr82d+tb+3vPIaBdkuYIMbjEsWIGWidh733dAKAR1k+wWkQ/ELJ
         p9wipjV1Sx/kyy7nxbbQaPmdNlPk7avykPz31SLIuToi5nDuxzCIs4hyWojyIjsNZduH
         Y4xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Dt9Ur4Gg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y184si3480799ywy.615.2017.12.12.06.51.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 06:51:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Dt9Ur4Gg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOlu7-00006H-7C
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 09:51:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOlto-0008WE-Jj
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 09:51:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOltn-0002fN-Rm
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 09:51:12 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:41070)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eOltn-0002fE-Mb
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 09:51:11 -0500
Received: by mail-oi0-x241.google.com with SMTP id t78so14143646oie.8
	for <qemu-arm@nongnu.org>; Tue, 12 Dec 2017 06:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cLwL4VMImdJP8Ww/hfFpv4/xd/qwXsb+bJE2CUvAL1k=;
	b=Dt9Ur4GgijDY6oCkfgb4a0oMCEqEucZ043MDwiB/4FuMVmPGCMO5kXnF7ojQxlJq9L
	zdRH8y3K9z2q3ds0Vvf6BM1zxhyzBwAO7M7Tqlo66LWaw7bwvJWZOrt4sr2Gl1IPQTsC
	PJUJITm+tmMTTRQFEaidDDu5DvG2c/WMLeXp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cLwL4VMImdJP8Ww/hfFpv4/xd/qwXsb+bJE2CUvAL1k=;
	b=IaUMA1Pky8nEK/G0q5JWQCPVHmY9lCVlghVcww+bi7gbNVxdWWevD4h5CBmkcK/8ld
	K91iM179oIGd6WnIP+uJ2fqLftgRhDwvFebhORKik9bR1MriQcR3+OrfBqpt7qNbDUFf
	Pve5KPEGZ8W7Yb+capSGOGj1kmPnewOs+HfUtg3q/5N31kqSRPS1FcVvxaL+rJFKLLr6
	iHwNjRl6vo80utoArB1lmj/QyzEZpAK+F3V4uQrV/7QAIKPetvYPuVglJMXM5aos0I0U
	1MNNfg/xONhSxmVQEhXH73l1ZbhYRgJk7Qi4ZrMZSY0xj1fuR/nB+MDLd/GHnEMQ4PG8
	zroQ==
X-Gm-Message-State: AKGB3mJQvwarNKRnTK5agwE1mYciLXR1xvpE7jigZRD8sl10uLq64x8W
	DB47Lx70ugu/bIyJZxvpdeT3vl7OPQr3DGF/WR1xbg==
X-Received: by 10.202.117.207 with SMTP id q198mr3280711oic.217.1513090270647; 
	Tue, 12 Dec 2017 06:51:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 12 Dec 2017 06:50:50 -0800 (PST)
In-Reply-To: <20171212144513.sutjfenbjh33fm5n@kamzik.brq.redhat.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-3-git-send-email-peter.maydell@linaro.org>
	<20171212144513.sutjfenbjh33fm5n@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2017 14:50:50 +0000
Message-ID: <CAFEAcA-DyuObZjx-g2k9SkofLZ_akadfGYZCMum=3hQQLEdN_w@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] hw/arm/virt: Add another
 UART to the virt board
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NOEmT4d+bsP2

On 12 December 2017 at 14:45, Andrew Jones <drjones@redhat.com> wrote:
> Should this be
>
>     if (!vmc->no_second_uart && serial_hds[uart_count] != NULL) {
>
> A bit late now, but maybe the other UART resource allocations should have
> been conditional on actually being wired up too?

What does x86 do?

I think the conclusion we came to about UARTs in general was that
boards should always create the devices, and the UART models
should cope with being passed a NULL chardev backend. (This
is like real hardware, where the 2nd UART always exists even
if you haven't plugged a cable into the 2nd serial port on the
back of the box.)

thanks
-- PMM
