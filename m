Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2413209wrt;
        Fri, 23 Nov 2018 10:55:34 -0800 (PST)
X-Google-Smtp-Source: AJdET5dPL6MLL4WSepXetrKCUWcZUHEShpJJmccUFskTLb841TBI88F2wjMgTky1BNZ3tNzZeRqI
X-Received: by 2002:a81:7913:: with SMTP id u19-v6mr17943098ywc.171.1542999334577;
        Fri, 23 Nov 2018 10:55:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542999334; cv=none;
        d=google.com; s=arc-20160816;
        b=Sq1spINxKjJ+BwS9sDMqEqTJcjQxu/JImHL6nVOc258OkLcQ5IQtlX4bbizcJ8MsvR
         BrntExvPTqOecy4P0bILtA0QvVJetoevcVFdJCsZjnUzQsIpuO6yU7TjRxSi2vZm7xjx
         SxR2ZF5fimKCBc1ZudqwZ1lT/eeH1PezpY/ih136m03bNlHOjFnNWJTvH0dWSWa8r/a7
         PZIjpiQ5iiMhSlX15e8kOaRZivbeI4FRwnA0j3IEeKqvI5p/QCqz9Rj6B03gw9ydc9K5
         WWqf+20AcmjLOyuFh47e6C1uDYfEoKBURocThG+JeiHhvCEQATxG7KqNYt+6n3uioQE2
         nV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qye4iIQ/v893zVtWM2g4aKXe4cHElY7mrFQwkilI4Qs=;
        b=o9t6Ssx3RGL9GYuO9lwPVwFuAupOKEwUFylxObYVmt74VvtJn3IBU0IrUEVUztrehm
         m68EhHioYsQ8Dow4+mD3sJk739rnHIfFE7P483zJUscZaQGfQALYlpiVgBC8tp8zOkDl
         EEK6kSHHrvWFShQTsLMhPiSd/IBUBEn3Wgcf1fhPwbvOiL5h+kdw6lKQSwP6Bdue7FG0
         L+v9rnPJ7z8r5Z1z+KfGnaZUe2MfT3Vjg+2NVc8hcXjbPicKIsIRIZtHg88NmtyCTPpY
         wXyWuGi/vukhyEVesFnBruICcwwC7aDA7/hwrd63SF5WP8LSut++2GQtZ5gmnxXwArXx
         l3Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hfVT7buZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t203si7316417ywf.16.2018.11.23.10.55.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 10:55:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hfVT7buZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53954 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQGc2-0008LO-2h
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 13:55:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gQGbo-0008I5-R2
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 13:55:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gQGZr-0005I1-4i
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 13:53:19 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:35785)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gQGZr-0005FS-0C
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 13:53:19 -0500
Received: by mail-oi1-x244.google.com with SMTP id v6so10704330oif.2
	for <qemu-arm@nongnu.org>; Fri, 23 Nov 2018 10:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Qye4iIQ/v893zVtWM2g4aKXe4cHElY7mrFQwkilI4Qs=;
	b=hfVT7buZH2JKAIJXEt/RaQVJAdK3tBJ3whZCFc/EuHQr2Im0tZLbMAf5xBhsFuiNoh
	gMtiWkEB3hPUidg+cvXZmlNrRFPV5grTj1ygYOvg5eXMgOKcGdaR2lOdH3cetTBQ/6lO
	wIjuQI8Zx2ZG3yNnAYP0Mj5g7s+zFTZq/z5zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Qye4iIQ/v893zVtWM2g4aKXe4cHElY7mrFQwkilI4Qs=;
	b=lbqCR10PNabEo8J1s9FjxFxTzlKnO4VagmiZ2hTmAduvfP4+enAGaXyOmyX9YPNedA
	EbczsI2e/naKgPtVIUiaexk0KyWCC4QBz6HVp7v0h6Y8aWm1CR2/6zhJLpUFIjnXo5I6
	lX+/PfzHPI2D96wQQExJ9Zud8K50Zh/nsibyIe4cyzriqid3RTAV92Oj3PHXW1up3QIa
	w3zUFyz9xQqIdU9h31eErLuHxlrH8AkZDUVR6uaTeyDmS7l2wVSsd8qIC4xrg0Yvcvfq
	E/XlOpj7vNaxEUkESdLd9vKn2q14Q3254oXGWM1w2SETOMFHcycYdfrsZ9eboYKM7mNH
	gKEA==
X-Gm-Message-State: AGRZ1gJT6XprNesfN8snInphQJahHCjppbfTzS2U3Vb2Lf4pRuw1t38f
	MEpo/xW0FTPtjmST3s2eF7RJsGqaJbmEr1XKxQOW0A==
X-Received: by 2002:aca:fd12:: with SMTP id
	b18-v6mr9628302oii.337.1542999198406; 
	Fri, 23 Nov 2018 10:53:18 -0800 (PST)
MIME-Version: 1.0
References: <20181123091729.29921-1-luc.michel@greensocs.com>
	<20181123091729.29921-2-luc.michel@greensocs.com>
	<20181123181059.GN18284@habkost.net>
	<CAFEAcA_8jJz5dE7XP4R=LjEC5WzP3jzutg=YqiYjJVwZZz+jvQ@mail.gmail.com>
	<20181123182415.GP18284@habkost.net>
In-Reply-To: <20181123182415.GP18284@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Nov 2018 18:53:07 +0000
Message-ID: <CAFEAcA-WwupF9Lm85+S4YSq1f5Y0AjEOtG0Uzh=7pDVdF0w38A@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1xO9qTgTfg5C

On Fri, 23 Nov 2018 at 18:24, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> On Fri, Nov 23, 2018 at 06:14:28PM +0000, Peter Maydell wrote:
> > One thing I would like to do with this new "cpu cluster"
> > concept is to use it to handle a problem we have at the
> > moment with TCG, where we assume all CPUs have the same
> > view of physical memory (and so if CPU A executes from physical
> > address X it can share translated code with CPU B executing
> > from physical address X). The idea is that we should include
> > the CPU cluster number in the TCG hash key that we use to
> > look up cached translation blocks, so that only CPUs in
> > the same cluster (assumed to have the same view of memory
> > and to be identical) share TBs.
> >
> > If we don't have a unique integer key for the cluster, what
> > should we use instead ?
>
> This sounds like a reasonable use of cluster_id as implemented in
> this patch.  The ID would be only used internally and not exposed
> to the outside, right?

It would be internal to QEMU (not exposed to the guest or
to the user), yes.

> I'm more worried about cases where we could end up exposing the
> ID in an external interface (either to guests, or through QMP or
> the command-line).  This happened to cpu_index and we took a long
> time to fix the mess.

I see, thanks.

My other question about this code was a slightly different one -- are
we guaranteed to be holding the iothread lock when we create
new QOM objects? (ie that we won't have races between two threads
which both try to create new objects and increment the variable)

thanks
-- PMM
