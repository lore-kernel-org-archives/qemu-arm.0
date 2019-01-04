Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp704300wrt;
        Fri, 4 Jan 2019 07:12:42 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XEpqcFwzzjey0/8RmZeq8aXk2IHOCN/vABBtCFnTF1Z6jfKRo8awMrotxy4GJ+ejhrOXn/
X-Received: by 2002:ac8:2d2b:: with SMTP id n40mr48549528qta.38.1546614762607;
        Fri, 04 Jan 2019 07:12:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546614762; cv=none;
        d=google.com; s=arc-20160816;
        b=Q8/fCSG5BcBQTkqrcZSe5p1Tj5Yql230imVAWv9vL67w51Dbwq3B+1ViNr1GuVuyiA
         C+iIU9czAYpUmwZFE1amEbxgTqAj8i6joId/ygIYA5mW63tjgMFQtAx2+dNIO/jdbLAK
         HVr7TOjQxBO6xpHzgJprIScqNutgZ8qqokZUrwU38yms8NPju5etNauz62PzIq8G3z9V
         qm6cg8CutsFsdl6qSHHOGYzSZosiLVG3+Aqke3zoK50uk/o/QpI54STwaoY+BIwaBQaB
         yn4OMwxOa35crex3H4bGztbNwlIGFSjOfyELnHPDPPnxRNyiKwpLgqn8nWu0cv/ediqz
         AfhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vyt+0mF+avPg4hEJmZVJRHr8mpXS0mBK5uD/KGvrrQo=;
        b=HVG0qy34jZv8iW9xOS0GvvyIiVCqpihlAv8bl0SCS07LjJKFWLmz0+uzu6bc3kKIey
         lvUSqinh8QmZ6sDufzu0DuWhTsrn7VIcCe2V2P+GCFrdaJRBtFbrjnvMdQssSa6E3XU/
         V2vzJUoJyDvy7sY+DnZSNDl7JZT6ZiA2RLBWQ8lkL1EL7+BY6GpF47HUV/K100b1IXfO
         2gxSn3qQNHqkbJx576RnMhflOXmGytpBFM9R1n+pc9IQ6KTCRquYYoqRS/pqjxSFUVyk
         pPZpVDoQ87hltFQLhfKTlFXlojZBpqYMimnjY8vmpgEh2uwjucThiogeIawC1xJydST4
         YmYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YhlMamZI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id a129si57279qkg.122.2019.01.04.07.12.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 07:12:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YhlMamZI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfR9O-00030T-2f
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 10:12:42 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gfR9E-0002z1-56
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 10:12:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gfR9C-0003GU-OJ
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 10:12:32 -0500
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:38709)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gfR9A-00031q-4s
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 10:12:30 -0500
Received: by mail-ot1-x329.google.com with SMTP id e12so32336964otl.5
	for <qemu-arm@nongnu.org>; Fri, 04 Jan 2019 07:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vyt+0mF+avPg4hEJmZVJRHr8mpXS0mBK5uD/KGvrrQo=;
	b=YhlMamZI/4ZffQ2feoQ2HP+CIF9V8nCI9XopisJ+rB5F9uCWkehrXuwXB+nfWsQXG+
	SGiojngf5Sxv28zOt5dKjQHjnpvOdrTO1qSg9odBTAASrWRTvNWSM8GpLxlWcymBSQQI
	6cN/CQgqTGDTJ6F6Bz2dwFU0VPzTEyLbzoANc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vyt+0mF+avPg4hEJmZVJRHr8mpXS0mBK5uD/KGvrrQo=;
	b=NkKRvCczxWnL5WTdf3v+tEMmKKi6lnsUKgREW72SaO3t3Epn+Hvnpt56SZgICcdhEJ
	yLhVNgHpGVyqsgpSlvMQz57F82nRtt3Lt+WL8IbnRm2IqnCvxbpXTtvF646bNIsxOAts
	BJ+YGwO33hxi0VcYQJvzoI8jWzrAdJQFFrcEzk5RI/jg8I9lt/1VNiaZAlWAJK+O3G5b
	mwQmO8IPWwhEJzAUQR33Eh6feWmg5+NF2QpnBLt6BiOFQIA8Tqqee3Ytv2KiSIFtEEA+
	HbpVtQBQeV8hADH3SliDncxUYwdWlEByH9JP2lGqltQ8//jMOhRVH5V7+jo6blWOzMPF
	C7Zg==
X-Gm-Message-State: AJcUukfC04dxyOOU50BCTVampNVK9IxKcONDwqvG0nuXPiDBQeWNWK4U
	Sk1YOV5VDBEjQi4hVWXexw8wDQxehKEOdSA10QBpIw==
X-Received: by 2002:a9d:bf7:: with SMTP id 110mr36826502oth.201.1546614741465; 
	Fri, 04 Jan 2019 07:12:21 -0800 (PST)
MIME-Version: 1.0
References: <20181207090135.7651-1-luc.michel@greensocs.com>
In-Reply-To: <20181207090135.7651-1-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jan 2019 15:12:10 +0000
Message-ID: <CAFEAcA9F2q6fQV13EDWFzuPYiFTDvqSCx_4P9aD=zP2RR5Kp0g@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::329
Subject: Re: [Qemu-arm] [PATCH v8 00/16] gdbstub: support for the
 multiprocess extension
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
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: efKykfc+aFCG

On Fri, 7 Dec 2018 at 09:01, Luc Michel <luc.michel@greensocs.com> wrote:
> This series adds support for the multiprocess extension of the GDB
> remote protocol in the QEMU GDB stub.
>
> This extension is useful to split QEMU emulated CPUs in different
> processes from the point of view of the GDB client. It adds the
> possibility to debug different kind of processors (e.g. an AArch64 and
> an ARMv7 CPU) at the same time (it is not possible otherwise since GDB
> expects an SMP view at the thread granularity.

I've applied this patchset to target-arm.next, thanks.
(I fixed up a few checkpatch nits about block comment style.)

> To test this patchset, you can use the following commands:
>
> (Note that this requires a recent enough GDB, I think GDB 7.2 is OK.
> Also, it must be compiled to support both ARM and AArch64 architectures)
>
> Run QEMU: (-smp 6 in xlnx-zcu102 enables both cortex-a53 and cortex-r5
> CPUs)
>
> qemu-system-aarch64 -M xlnx-zcu102 -gdb tcp::1234 -S -smp 6
>
> Run the following commands in GDB:
>
> target extended :1234
> add-inferior
> inferior 2
> attach 2
> info threads

This seems a bit clumsy -- is it just the limitations of
gdb here? I was expecting that just connecting to the
remote would cause gdb to interrogate it and attach to
all the inferior processes that it had.

thanks
-- PMM
