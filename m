Received: by 10.223.159.74 with SMTP id f10csp3911795wrg;
        Tue, 12 Dec 2017 06:53:41 -0800 (PST)
X-Google-Smtp-Source: ACJfBoujPH1lSjnH1V3ZWKvTxSRipJofBGCpWtxweSa+WdwYTlHM5TAmzJ1FelN1Y2iR7lTuQekI
X-Received: by 10.129.242.2 with SMTP id i2mr3048735ywm.56.1513090421763;
        Tue, 12 Dec 2017 06:53:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513090421; cv=none;
        d=google.com; s=arc-20160816;
        b=Bn0/Gg9ptfkpxHEapemaKttI6UMjQv0IeV9xTq3NYlLDTVfdgA54kBa5seWrsQoV6p
         pRc4QWkZN5lphvfmiAnrNQ4M546YwJGHSsYDuo/e3adrVJGEaSQUiGGJINFYDsrvldyq
         zheuer+SjzkbwEJxlsN08gZ9Zv0AAylGC4TomRKZnPCYtuUVg2tORJop7zc3bnSJYlOj
         2BjLmJIYPu4xhTQx6NGHUhEW0M0pTBFTRM6r+kBzqLcFHRWcDGxbEegM/vf6E7Se4dje
         falcDphZPWDYdJo6j7LuxORQ22tc4cI9hB7rZ4Y5OHSiepPZCmYKnFNcjf2TLrsRr64s
         IA2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=7l/R0gR7XDxF9InCqUudEZUjbiKx6Oh96EsRbSM062A=;
        b=rVvn1FKtyGCCVceK8g1MN7J7YxTo2hny6lwfivTrVy6hUvJ4VhduednXTOhAxvkxxF
         NCT+FN1NZS25PZ764oivfxB9UWBNWRn0jAcPjcwx8B2bVnuGEbGLlJTUHKrNaSVNWbDS
         Tw/irwpAbxM4xJYSE+I+30C/OwVvsp72nvJne/5bKhsHxJ8Y7ZDxu1R++t01AQaKHNgY
         aurqPn+w0ErC1XxCivzX6E67m1qtdXoiiuegWmLLEirHoLstA3pAkNEAfKysb98UP7Qm
         Huo2iVq2yrf8BHK/CNLLqcoFe3yeKVCbyTrOWRENebuM4qnyj6dj25+bhbz0yHsdT89s
         VkAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 22si2963453ybf.404.2017.12.12.06.53.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 06:53:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58809 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOlwD-0001T5-6b
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 09:53:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eOluR-0000Ow-KK
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 09:51:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eOluQ-0002y1-NG
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 09:51:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39294)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1eOluL-0002tl-6H; Tue, 12 Dec 2017 09:51:45 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 20A9E80472;
	Tue, 12 Dec 2017 14:51:44 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C5B070BB8;
	Tue, 12 Dec 2017 14:51:41 +0000 (UTC)
Date: Tue, 12 Dec 2017 15:51:38 +0100
From: Andrew Jones <drjones@redhat.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20171212145138.dqw6op2orgynlykk@kamzik.brq.redhat.com>
References: <09e7b89f-27f2-1787-b371-7b0c0eff78b8@redhat.com>
	<CAFEAcA-357eVt3s_7ULWxssQttvAV0DkUv_tGkyk8umVgfH1QA@mail.gmail.com>
	<d776710c-2255-947b-22c6-336e9491bb81@redhat.com>
	<CAKv+Gu9e6qwJ4=t=UHHGsVs1XM26agh17Mgy0ckAvUsy+2xi2A@mail.gmail.com>
	<CAFEAcA9JzK8sNF5TmENfXZ-NBJwfp03b2La4YQ=N2i1ZCzrNBw@mail.gmail.com>
	<CAKv+Gu_mzynBKSBSdtUhKRgNd3KmuJTwiNZpmvPCfkRDo_QCgA@mail.gmail.com>
	<CAFEAcA9HAcZTi6bT-FbsG9LtqO=4s7rpcz0niZbimG834t4uHA@mail.gmail.com>
	<CAKv+Gu8gZ-Y4-zV2GRgbXPcignAg3vi8__XaFXqAhYOZOL7GcQ@mail.gmail.com>
	<CAFEAcA8OY3PFk_bermKxQBuF_th7SudHgaRk8wf76EAGYnoCGw@mail.gmail.com>
	<CAKv+Gu_939a=cui76H5FqCZwbWqDUYhegNe18T+tBpq7CW+TrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu_939a=cui76H5FqCZwbWqDUYhegNe18T+tBpq7CW+TrA@mail.gmail.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 12 Dec 2017 14:51:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/3] hw/arm/virt-acpi-build: Add second
 UART to ACPI tables
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1imMzzQMVlPc

On Tue, Dec 12, 2017 at 02:31:05PM +0000, Ard Biesheuvel wrote:
> On 12 December 2017 at 14:17, Peter Maydell <peter.maydell@linaro.org> wrote:
> > On 12 December 2017 at 14:16, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> >> On 12 December 2017 at 14:13, Peter Maydell <peter.maydell@linaro.org> wrote:
> >>> On 12 December 2017 at 14:12, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> >>>> On 12 December 2017 at 14:10, Peter Maydell <peter.maydell@linaro.org> wrote:
> >>>>> That doesn't actually usefully separate debug output from the
> >>>>> console, though, because stdout-path is also going to point
> >>>>> to the UART with the lowest physical address...
> >>>>>
> >>>>
> >>>> By default, yes, just like is currently the case. But I would assume
> >>>> this new serial port could be appointed 'console' and put into
> >>>> stdout-path by QEMU, based on the command line options?
> >>>
> >>> We don't have any command line options for doing that, and I'm
> >>> generally reluctant to introduce new command line UI, especially
> >>> new command line UI that's specific to Arm and not also needed
> >>> for x86.
> >>>
> >>
> >> If stdout-path is always going to point to pl011@0x9000000, why would
> >> we need to parse it?
> >
> > If you had always parsed stdout-path, we wouldn't need to worry
> > about the order in which the UART nodes appear in the dtb...
> >
> 
> That's a fair point. But it still does not justify introducing added
> complexity in the firmware, if the conclusion is always going to be
> that the console will be on pl011@9000000.
> 
> To Drew's point re DEBUG builds, I don't think we should generally
> enable DEBUG and send the output to nowhereland if the user does not
> wire it up. That's a MMIO trap and two world switches for each
> character written, if I am not mistaken, and the DEBUG builds are very
> noisy.

100% agree, which is why I said "If a user wires up a second UART...",
but I guess my "Not wiring it up would lose the messages..." sentence
was ambiguous. I didn't mean they'd output to no where, I meant those
messages wouldn't be output. I.e. some sort of debug_printf() function
would be written that only actually does a write when there's a debug
UART on the other end to write to.

I just commented on patch 2/3 of this series asking if we shouldn't
just not allocate the second UART's MMIO region and IRQ, when the user
doesn't provide a '-serial' option for it. If we didn't, then AAVMF
would just not output debug messages when only one UART (the console)
is found in the DT.

Thanks,
drew
