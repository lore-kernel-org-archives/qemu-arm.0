Received: by 10.25.30.65 with SMTP id e62csp532768lfe;
        Thu, 26 May 2016 07:54:21 -0700 (PDT)
X-Received: by 10.140.219.147 with SMTP id p141mr9271389qhb.91.1464274461840;
        Thu, 26 May 2016 07:54:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y205si740180qkb.170.2016.05.26.07.54.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 May 2016 07:54:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38763 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5wg1-0006Iq-A3
	for alex.bennee@linaro.org; Thu, 26 May 2016 10:54:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5wfw-0006Ig-HY
	for qemu-arm@nongnu.org; Thu, 26 May 2016 10:54:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5wfv-0004tJ-Ea
	for qemu-arm@nongnu.org; Thu, 26 May 2016 10:54:16 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:33989)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5wfu-0004t1-6i
	for qemu-arm@nongnu.org; Thu, 26 May 2016 10:54:15 -0400
Received: by mail-vk0-x231.google.com with SMTP id c189so105430617vkb.1
	for <qemu-arm@nongnu.org>; Thu, 26 May 2016 07:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZImsrAmtrqv3Om6lphTOSvNBi5TXlixsXGVSEmXmwBs=;
	b=QMKREPusjAWKLLBDKoyRDg2VB79CE9BqafK8zdNL8n80TAbnaYtdkJDjHNLuICix5g
	L+y/RT7CKZtEGe5Zve/v7JPl+/uQxxdadkxdl/fHc09sZzxMgC+4xI1t5cxqtOynEAyy
	pERPQNKxMQFMO4CyWm6qHTgLGUCZ4IWYErWxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZImsrAmtrqv3Om6lphTOSvNBi5TXlixsXGVSEmXmwBs=;
	b=A0WO/kFlaPsvJcu1Kc9NUGXly46hKqXGTFxitEVFcS0OpfhrcveBiTDFpEFwe4yAor
	ruOfXNcCJ1M21Sd6hRDyWTZu3I1evWJT7S5vA+t4RU/iVw3nbAaRY/C0Db5+lCx6TWdD
	qwNL10ziMb3Cs2jo1dNVDhfzu+3iJRSF5nV0Ovoxnrec1BusWe7xbt/WphPp8S/XwdRG
	hzXTjthAKsSj7dBKJUnqXyJDha0VVKMYovYfSKDbWclG+vxiM3nnIyf+9Kws9JaGbruE
	dnM7eHK3ltY1JXCIpv+Rudyn9BDnic8TtmtoCQ45TdXCJlbAoQn3l6rDJ7rl6fyYQtH1
	vitw==
X-Gm-Message-State: ALyK8tJuI87FV/2k8QrCQel2z8n5UrOg64EZ1tBMj50pM79CzS7tV/F7nTO7SL169Jg4VLQVnRGW8/HPtQDS17TZ
X-Received: by 10.31.81.199 with SMTP id f190mr4896525vkb.139.1464274453643;
	Thu, 26 May 2016 07:54:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.69.66 with HTTP; Thu, 26 May 2016 07:53:54 -0700 (PDT)
In-Reply-To: <20160526144629.GH28935@redhat.com>
References: <b1b3b0dd143b7995a7f4062966b80a2cf3e3c71e.1464273085.git.crobinso@redhat.com>
	<20160526144629.GH28935@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 May 2016 15:53:54 +0100
Message-ID: <CAFEAcA-G4rL8o-6gmQvXHMVUrvH9utZOQuFhDO=J9imtzophjA@mail.gmail.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: Reject
 gic-version=host for non-KVM
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TvXmy4Mk8GrX

On 26 May 2016 at 15:46, Richard W.M. Jones <rjones@redhat.com> wrote:
> The problem with this is if I'm using TCG fallback mode, how
> can I specify the right gic-version?  ie:
>
>   -M virt,gic-version=host,accel=kvm:tcg
>
> Only qemu knows if KVM is going to be enabled.
>
> The same problem happens with '-cpu host' BTW.  I really want a "make
> it work" option, as I've said on several previous occasions on this
> list eg:
> https://lists.nongnu.org/archive/html/qemu-devel/2014-08/msg04173.html

I agree that we really need to do better here (thinking about
the problem is on my todo list but generally other more pressing
issues intervene). I'd welcome suggestions for semantics which
(a) do what you want (b) are reasonably in line with what we do
on other host architectures (c) don't break existing command lines.
(I think those are the main requirements.)

In the meantime I think this patch is correct for what we
are currently trying to implement.

thanks
-- PMM
