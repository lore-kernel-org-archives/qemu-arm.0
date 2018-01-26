Received: by 10.28.71.27 with SMTP id u27csp695408wma;
        Fri, 26 Jan 2018 05:18:02 -0800 (PST)
X-Google-Smtp-Source: AH8x2249d77YMFOP8M+b+DMooQX+pcMP15hMk0zSObiBIGVEx3++ZGm/lbYYNidiwFHFvdPfpkY4
X-Received: by 10.129.65.74 with SMTP id f10mr11268558ywk.290.1516972682588;
        Fri, 26 Jan 2018 05:18:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516972682; cv=none;
        d=google.com; s=arc-20160816;
        b=GwsOcYANXEEwAG0/Hnx6MQPC5gXRynua8754KIWAM8T4Glknzz1a0b2OJLfoUivaFj
         4uenZDSh7dNI8btU200chXBXdlWw20clEWIbXiTQS4DF2u8dArMKCMs1jYOBufHYONXg
         ZAsXPiguyfnwpp5A5xjYMwKVcdR6p2KuBbWD+eHZ9MeHmYj3dmzKeCu32+Gj1uKDd8eX
         YRFfC7wmW7gZ63UDbg8Q5JVsfugxnv396IrsaD2Bmn7dAfFjD3gkOOqBE7USUQSHDWLC
         ZBRPbixGoXs3w5qwObsT41h/nOVrpIllhDbpAalAdcq60h0C+93A6A4kgHrdqBg2nM+5
         PMmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=eLO6KBY6wa4P7H0DQ16r7Aat2VyYPoLa1Cb/k9qUQ68=;
        b=EsB+D+m28BerMb01Sibc8oMf5jmu27VmbdkIszmhBEdRnvBxX5NYp1T5+IQFOKcQHQ
         yyz5Fz8wD3rR9Mub7pLMvtitlgmEILpPiOkZAmHCXzW8V9YPJHCO4ktvCHEmHVSMhXlm
         6Aqz99A5YbKTftFZb/Tw1zed3PPEUdeHFTl+qtNa36hYpbyYcWHbf0QNKRLvdSM7q3jf
         bwKL9oUB7cGuKaKHRD9ksvjUbRIcTlIGLe7PkS2GpFAsVTgH9RnRR10Q0QJLzhNa8pPl
         YyqP4O7pt1NAuUFQ9F13cqEh1WAsEOaDbf9bOaSRdDEycEfuhfc2D2nVmH8bppxgd7C8
         sDCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b5si1868011ybh.658.2018.01.26.05.18.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 05:18:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54944 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef3tK-0007jR-2q
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 08:18:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44477)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ef3ny-000306-Io
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 08:12:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ef3nx-0005XH-1q
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 08:12:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43592)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1ef3nq-0005PM-P6; Fri, 26 Jan 2018 08:12:22 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91FEE31A321;
	Fri, 26 Jan 2018 10:45:52 +0000 (UTC)
Received: from localhost (ovpn-116-57.gru2.redhat.com [10.97.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 223F27FB8F;
	Fri, 26 Jan 2018 10:45:51 +0000 (UTC)
Date: Fri, 26 Jan 2018 08:45:50 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180126104550.GG25150@localhost.localdomain>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA-UO5Y_ACSZ2EEQEzgy30wdfEm3u8wUrBrXWaQaE_v+Kw@mail.gmail.com>
	<20171209010811.GJ3037@localhost.localdomain>
	<CAFEAcA9oG=+mJ+jSGTM_z54S09gjHoFowDkOvofdkhJd+g3=Cw@mail.gmail.com>
	<20180122183301.GA31237@localhost.localdomain>
	<CAFEAcA8pGXMs3hMxSs-t7qGfeR__H-CQ1roRVe5NFMCP8R2vjw@mail.gmail.com>
	<CAFEAcA96N1Nuh9rXVtWnmnmm_+xQRFiesdSLbTx4yJBGYEVJaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA96N1Nuh9rXVtWnmnmm_+xQRFiesdSLbTx4yJBGYEVJaQ@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 26 Jan 2018 10:45:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 0/6] arm: support -cpu max (and
 gic-version=max)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>,
	"Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AyCAHbbIl0UP

On Thu, Jan 25, 2018 at 03:10:31PM +0000, Peter Maydell wrote:
> On 25 January 2018 at 14:41, Peter Maydell <peter.maydell@linaro.org> wrote:
> > On 22 January 2018 at 18:33, Eduardo Habkost <ehabkost@redhat.com> wrote:
> >> About QOM type names:
> >>
> >> On x86, all CPU models are resolved to "<model>-<suffix>", and
> >> i386 and x86_64 have different suffixes.  So the QOM type name is
> >> "max-x86_64-cpu" on qemu-system-x86_64, and "max-i386-cpu" on
> >> qemu-system-i386.
> >
> > OK. Looking at the target/arm code we do a similar suffix
> > trick, but we seem to have cut-n-pasted the handling in
> > aarch64_cpu_register(), so it uses the TYPE_ARM_CPU as the
> > suffix, rather the TYPE_AARCH64_CPU.
> 
> ...and that's not as simple a fix as I thought, because the
> code in helper.c for implementing arch_query_cpu_definitions() and
> arm_cpu_list() assumes it can create the QOM type name by appending
> TYPE_ARM_CPU. The ARM_CPU_TYPE_NAME() macro which we use pretty
> extensively also assumes the suffix is the same regardless of
> what CPU type it's being applied to.
> 
> Looking at x86 it seems that TYPE_X86_CPU expands to a different
> string for qemu-system-x86_64 and qemu-system-i386. I could do
> that, but it seems very confusing: I would expect a QOM type
> name like TYPE_FOO to always mean the same QOM type.

Yeah, I don't like the way TYPE_x86_CPU works, and I don't
recommend doing the same elsewhere.

> 
> Given that the type names don't appear to the user, I think
> we can go ahead with implementing "-cpu max" for Arm without
> having to first disentangle this? "max" isn't in any worse
> a position than the existing "host" and "any" types.

Sounds reasonable to me.

-- 
Eduardo
