Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6665563wrt;
        Mon, 3 Dec 2018 03:24:22 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UgDM4sguD5sKMzN85GbwPiuMrz7FCYr7+7xXXYZAU8BJMMgqDlU6/j50eOKArM9LvTGl6m
X-Received: by 2002:a0c:98a1:: with SMTP id f30mr14870686qvd.224.1543836262817;
        Mon, 03 Dec 2018 03:24:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543836262; cv=none;
        d=google.com; s=arc-20160816;
        b=BlzQ5j6/GdRnoKAG7GUEYfJtorpxGB6V3wAv7cmj7esV5AVYnr9CRbVzrYy9RK3KFL
         vhZpOOUUFrAwFZgdH7u9tLkiNgtHG+T+znP0w41IkFC1wSQr9mkDaDfqVrIGN64B0tN9
         JQIAgWGLrCMw76BWLy4Fze2Kl1a5WQlUl+xftGaDHCkgP/ex6ekTig2rF2wAg447ovr/
         V+py0k15z1mnQrAvY4mK9NZWbm0YSWNcgKWMlAt6cljeI+T6aRDDal7repvGPWMAsP8c
         RvB+ZrOTs+0HibChr1Ymw9aRbi8KVqGBQR5AYvn/FD3ZtnYkN5Mgj0oJZH6G+/8M0yX3
         OLJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7cqpevmTY6IBlQepFgYBlSogB/3/y/OqplS+dAP3dWk=;
        b=R6mIhPdtpsGQUXUqb3BbNwkr0eTj7tkkHAfwpKuIqfXH5XtrM/OveKqxYb0WpT+llC
         D4bnXumrPhbPv+KMDy1iUcPMpDNypSaP+M2h2Hmg7Z3Q19iDgHrBwn6ldA/5aYdTJNzF
         41t6VwrZTr5ce9yszItK4/nIe4iS174mi/zaV1tbboCP+bhWcRrwaQHcQsVx8zBTptub
         R7DSXAo8B+Y1w5YAEhJAftB2ey7ipkMrxMLVEi5UXh/gPvivlLlIyRENvTEbkdZpJjql
         VHbL0tIE6XCiq7iz4IpM0fSP0uBrvBluNYxAtYYKQ57BkSbiZcc0XL0RAsAlTMkejV/3
         O2NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g4BFZT+R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c7si1631234qtn.359.2018.12.03.03.24.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Dec 2018 03:24:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g4BFZT+R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48032 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gTmKs-000696-Bl
	for alex.bennee@linaro.org; Mon, 03 Dec 2018 06:24:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gTmKg-00066T-Rz
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:24:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gTmKg-0007Zk-1M
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:24:10 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39551)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gTmKf-0007Z3-SE
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:24:09 -0500
Received: by mail-ot1-x344.google.com with SMTP id n8so7351682otl.6
	for <qemu-arm@nongnu.org>; Mon, 03 Dec 2018 03:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7cqpevmTY6IBlQepFgYBlSogB/3/y/OqplS+dAP3dWk=;
	b=g4BFZT+R8THV8OB6CTQA8Ts4zQ2eC/cOJFewVaO8dpbsC4z0Ff0N8sZ+W4r1Big9ra
	DX1HHrnsHrGcC0RCtFY9/YVZCCrPaVc/gLAEo0kXpejvGdK2g8VcjrxVryr1HP+FFI0R
	Ef4xey5skI9n0OM4d1nVA27NdN/Ihu9zzSDaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7cqpevmTY6IBlQepFgYBlSogB/3/y/OqplS+dAP3dWk=;
	b=H97MwtF7GLcESHFD2OOMRDMU1/pP69YSdz3aWFWgRivOq8gUjgHc1lkfYXnFRBtv2M
	Meb3/R/utTzk+cdXVnfuM5v3yYT0x8WaY/BJd7swKwFsdqqKoiRraK37Td5Zb+st7kBv
	RRB6iM5c7gCfqvdtvyavZGXjdOjiZgxesapdLKAUOFn4kr9jyiQRjlNFFodcOJzGCixM
	rhkiFYhrfpXtBZJ3oBi9ee3n6t2dt2ZsfW2FzV8+9/ZfpgILKdRfANea4LVSiXofuIyT
	x1YcOttXCa71gKL8zr7DTSc27PsvpZ5PZ6E2QCvRDvwISZ/mLDWhceHGtFVEVxyiycLh
	NW6g==
X-Gm-Message-State: AA+aEWZPL6XjLQeQrnDq8JEdmoCytHWdxeTxucQ4gmDVt9ymIPhQxjTX
	D37EjGB7qzM8umgH1ebo0mEVA6BHoXt+YGbJy2iImg==
X-Received: by 2002:a9d:bf7:: with SMTP id 110mr10298615oth.201.1543836248992; 
	Mon, 03 Dec 2018 03:24:08 -0800 (PST)
MIME-Version: 1.0
References: <20181123091729.29921-1-luc.michel@greensocs.com>
	<20181123091729.29921-2-luc.michel@greensocs.com>
	<20181123181059.GN18284@habkost.net>
	<65d3a572-9a80-f332-1f88-69e43e8a3663@redhat.com>
	<20181126132731.GJ18284@habkost.net>
	<CAFEAcA8D7ZjO059Sgrx-4i0iT+V3gxT4f=DvdmUAJS7KomtyOg@mail.gmail.com>
	<b8e20686-e5d1-a844-48f7-a4ae471e3fd5@greensocs.com>
In-Reply-To: <b8e20686-e5d1-a844-48f7-a4ae471e3fd5@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Dec 2018 11:23:56 +0000
Message-ID: <CAFEAcA8j4xTiS3_ktiA0hm2N4cu5RvxAtYqUHgvY-bUXgcwbjQ@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 01/16] hw/cpu: introduce CPU
 clusters
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 789e8ASjgTlv

On Mon, 3 Dec 2018 at 11:21, Luc Michel <luc.michel@greensocs.com> wrote:
>
> On 11/30/18 5:52 PM, Peter Maydell wrote:
> > Luc: what are the requirements on boards using CPU cluster
> > objects? I assume these are both OK:
> >  * does not use cluster objects at all
> >    (the gdbstub puts all the CPUs in one process?)
> Yes, when no clusters are found, a process with PID 1 is created and
> used for all CPUs.
> >  * all CPUs created are in some CPU cluster
> >    (the gdbstub uses one process per CPU cluster)
> > but what about
> >  * some CPUs are created in a CPU cluster, but some
> >    are "loose", not in any cluster at all> ?
> > Is that just invalid, or do the "loose" CPUs end up in
> > a default cluster (gdbstub process), or do they get
> > one cluster each?
> Currently this is valid and the "loose" CPUs end up in the first
> available process (which will be PID 1 if we are in your first case,
> i.e. no clusters in the machine).

So if there are some defined clusters 1 and 2, and some
loose CPUs, the clusters get PID 1 and PID 2, and the
loose CPUs end up in PID 3? That seems reasonable.

thanks
-- PMM
