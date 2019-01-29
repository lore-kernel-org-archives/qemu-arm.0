Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4276111wrt;
        Tue, 29 Jan 2019 02:06:06 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5L7YoI/D7c0jrcujvogJ82l1W2aEFQjjQaJdIE0p08BAVQM83h1cEHl8jlecsidWmyCz1+
X-Received: by 2002:adf:e08c:: with SMTP id c12mr24084337wri.199.1548756366429;
        Tue, 29 Jan 2019 02:06:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548756366; cv=none;
        d=google.com; s=arc-20160816;
        b=pB6LS25elA9vpVKQ8H6/WwQLpQlKF7e30JctoO00uhws6Kz/sYgZRtHeej00oO/ZDO
         bvG0sV8SYmmiOTWZXTdqxJIbZx0VPtZ2xDdcjqvu4Or1EEvoUZaYMzGqN57eUGKl+CNr
         gPZutKsfW2h44Qi5HsCL+B7z25/G82rYLXhV+sY9mJMu85vZojZImNQ29YkFCQmdBWPm
         IDWvHb21iuQAL1TEZwuNk1S+M/6EySoXz3aNIwcGcGV8qxJxVvBcY09ZKoFL3iExyacK
         hGgUBtqTYFRyFPyVGUU19dGs3BKvtScbs7A7vB4b3BbO51cj671ax2buVY146dUjXfiL
         d6HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=57aGoquTDYnBmIIVICpwNNPahEcLCvMo4ia/JpWchgI=;
        b=KapWYZpEEYrrqjRQ3U8GmHZfKe0CESgRPGzF9iPiPoG07rG+tr+5Hj9M6n+ElxSVxT
         0g1ShZ1q3OnLRVipUG+uIRDJoSuHa843bgfUOHHOFtb+MxKbVMLbKQAySlGMpd54xQse
         KxEVpkmwIYmtLPFFAIC1KfTaYPZuT3tlmCSzEF3hUIpEE2xiF76kiPiNUxPSPFfJrRi9
         svhyoTAhqkLm/c82ClNHoxC+6A5C2GkalJmBcCSA+ML/2zodnLuJqojguTjaoVoM/NmJ
         oOaTMiehV19hcyDE7Uy6yTbc63cmvrrrpd8QW0lrPC4ptsBF5QuMBgEFlzFITvZb3flz
         Vx/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="M/o92YpI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6si1686701wma.72.2019.01.29.02.06.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Jan 2019 02:06:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="M/o92YpI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:46549 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1goQHN-0002en-GW
	for alex.bennee@linaro.org; Tue, 29 Jan 2019 05:06:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1goQHC-0002eY-3l
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 05:05:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1goQH8-0004jM-DU
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 05:05:52 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39689)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1goQH1-0004Nm-6x
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 05:05:46 -0500
Received: by mail-ot1-x343.google.com with SMTP id n8so17372914otl.6
	for <qemu-arm@nongnu.org>; Tue, 29 Jan 2019 02:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=57aGoquTDYnBmIIVICpwNNPahEcLCvMo4ia/JpWchgI=;
	b=M/o92YpIM3XFql1D0HqqpvQYIyHyGqsE8XNhgo/z+oQbpmOtYssI/5Nd+cWRpTsdw9
	uamcpiXZrEveAipwiHU8teXu5jJcT2CUh+b8DWcHK/b8StKBMp/dhaH+I3DEjfGqjvue
	G+/7NXm3QLYfK1LYJ6COGauXDjyqD4xHqNchE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=57aGoquTDYnBmIIVICpwNNPahEcLCvMo4ia/JpWchgI=;
	b=ZbKoYnn7qGGRPYfX4703OkRBxgFHNfxZaoVuXwEUsHehZFoYyPHCb9E2UIjs4dbT2V
	+EwKlx/9qtD3xpFuQhcqCsaOTWcAux4RdRPvfPNLR3Bb+jH1CFntGJezZmAnH6LVxfZw
	Z05jPzMz2vkXZ9ZE+BYmfe4YlXQ5O6HjLOaTKedS0o6Hx6KgrSUfdixDbQ7OUqGCbiNL
	ZjFUWfvadb08IFM1+sB3ilnjRu/FQOLkw9aofz/sAAFTgi2ubi0T50L6v7b+Q4DfLcWe
	kq2jfNoPU2x6soFZ3Gw57WK9+BFZzwynMbjVm/nGvjcN3Vw7GB3/gbiXJD0pYBGkka3w
	AZbA==
X-Gm-Message-State: AJcUukcU2tKbZ/6vfRVF9ENMy5aFi+K3TacLPOtwHEhKXD8wYZ+o7Rqu
	JQ6qvkgXGMKdGdS53uiC4VqRsJ2Hj4ib8uH0LToXGw==
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr19945102oth.317.1548756321837; 
	Tue, 29 Jan 2019 02:05:21 -0800 (PST)
MIME-Version: 1.0
References: <20181207090135.7651-1-luc.michel@greensocs.com>
	<20181207090135.7651-8-luc.michel@greensocs.com>
	<CAMo8Bf+siB=vdjK+WPKvRCqKS59OVGOcAoH0HtN6VSvFyOc9gQ@mail.gmail.com>
In-Reply-To: <CAMo8Bf+siB=vdjK+WPKvRCqKS59OVGOcAoH0HtN6VSvFyOc9gQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jan 2019 10:05:10 +0000
Message-ID: <CAFEAcA9uVMs8aGTcbUpz+EGGyFBXtCNVMT-_t5eYPBjJF_4Rrw@mail.gmail.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v8 07/16] gdbstub: add
 multiprocess support to (f|s)ThreadInfo and ThreadExtraInfo
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
	qemu-devel <qemu-devel@nongnu.org>, Sai Pavan Boddu <saipava@xilinx.com>,
	Edgar Iglesias <edgari@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NJT8p3nA2kcp

On Tue, 29 Jan 2019 at 04:56, Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> Hello,
>
> On Fri, Dec 7, 2018 at 1:04 AM Luc Michel <luc.michel@greensocs.com> wrot=
e:
> >
> > Change the thread info related packets handling to support multiprocess
> > extension.
> >
> > Add the CPUs class name in the extra info to help differentiate
> > them in multiprocess mode.
> >
> > Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  gdbstub.c | 37 +++++++++++++++++++++++++++----------
> >  1 file changed, 27 insertions(+), 10 deletions(-)
>
> Starting with this commit it is no longer possible to kill QEMU
> with the 'kill' command from the gdb. This was a nice feature,
> was this removal intentional, or is it just an implementation
> bug?

That sounds like a bug. I think with the multiprocess extensions
available gdb may switch from killing using the 'k' packet to using
the 'vKill;pid' packet, which we don't implement? Looking at
what gdb is sending ('set debug remote 1' turns on logging in
gdb of remote protocol packets) would let us check that theory.
It's not clear how our implementation should deal with being asked
to kill just one process if we have more than one, though...

thanks
-- PMM
