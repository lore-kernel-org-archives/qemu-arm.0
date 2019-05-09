Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1006768wrh;
        Thu, 9 May 2019 09:54:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwqBb6g6Vxv/V5IlBfzIkvCgz8zWAVdmRY0JEfVZiejxIh+3OQBcWXv7MPtMFuAMxmdGH5T
X-Received: by 2002:a1c:4c09:: with SMTP id z9mr3643227wmf.87.1557420894855;
        Thu, 09 May 2019 09:54:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557420894; cv=none;
        d=google.com; s=arc-20160816;
        b=MGiMYMKXO1lsrWCVmpxX+XMFZe1GaVakHHAiiinxgzhmfuBpa2EbMB2kJJISa7NJtl
         5DZpdHt3yxKE3uBRiG1gDZfmkEqCeWbTl3WPf24+9QPq9ZE3DKH+e9pWdHu0qniU1Z9o
         xrCq81T8EUAdW0p8eSW/j8C3vWqIkXGn6S5D14o19qJK6wXI/xGwZitmLy/YxnVgLkmS
         0cuND4W57dwughWYRC0ePu/kQpI17SJeU1NxeuPqSVz4UAV3Bm/vqpmOSiU8dg6c8uRZ
         KGib8327h6vqAFn8kJfrL/3ymTDOT5r/dCO5pNlkyKtYccHqj8Czqq8jekVzfuM4aXjP
         ug9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o/8Jsiv0uTeGp70LdVI1zEpotx/WMlKHuO9O8CVae+E=;
        b=diouDU0WghR3ZDbNAy7BZlvMx/t34AiLvh6nmsagwdC+b+C3y+nZvbIg4hV7Lse+yc
         Qr37ADxHltY2K+QZzILhP3Q/1D9VkWE3LO6laexnr29quBL3zEbhbNbvrMG7+NxWwN/W
         VqVdHqQ4Mc6JYGwT79Ctjq6aLPqBaICIX0Wpnpo9+Tj2ybMp9h2H++dC+wMKbTZ21ayT
         H1ngvbhA3bf0HADw6GmVUAUOn2O4MtqF0i3Zfc9qiLj58eWOGhyb2OUhHMB/hVOlT5LU
         Cp5qyKJvhOENwGMvdXvy+wuyCjscFhCmetswXrm6Ud87IIKlYqmbcbWMdHoicTOIy1JJ
         vSbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Lur107uV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5si1857618wmc.117.2019.05.09.09.54.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 May 2019 09:54:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Lur107uV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:57892 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOmJp-0004P5-W7
	for alex.bennee@linaro.org; Thu, 09 May 2019 12:54:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hOmJc-0004Mj-Db
	for qemu-arm@nongnu.org; Thu, 09 May 2019 12:54:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hOmJb-00088u-9M
	for qemu-arm@nongnu.org; Thu, 09 May 2019 12:54:40 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35595)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hOmJa-00088K-N2
	for qemu-arm@nongnu.org; Thu, 09 May 2019 12:54:38 -0400
Received: by mail-ot1-x343.google.com with SMTP id g24so2961781otq.2
	for <qemu-arm@nongnu.org>; Thu, 09 May 2019 09:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=o/8Jsiv0uTeGp70LdVI1zEpotx/WMlKHuO9O8CVae+E=;
	b=Lur107uVhf7h91ogbRFh7tOFu+0nUBqnXVQwHBhoVPdre1RbIENiHuvIyJ+4hufdyd
	1FLLgdJhrGs1HVk5VJFxzV+y681eA3veIy5mnaG3WB2Jsb15PjeoTZiY6KJsUGMYLvbl
	BnpA5i3ZcbpLp11VMK+4AXFCCmEa/aeTJ5d3ne5TtY5LcghelYNkzfE1c/+BY4SlAPTL
	eA+Wbi2058F1xgrB6dVmkZTzl0P/XETUtoqyoIiFUqLSP1WvCo5vT1jNw1vy07A4djwk
	sbMbpYFS14qpyXwxVi/exBGWV/YgVeRFHelkOg2pEWQVJg8PXRlmtbTqwPQq5tr0m8Mx
	LMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o/8Jsiv0uTeGp70LdVI1zEpotx/WMlKHuO9O8CVae+E=;
	b=gKuFKo+hArr7bfsdfXXL+n6EvrycE7/4DbBiDxb+vj5dE5UGawN5uPuZEjNppdskoe
	t7ym4cN20j1gwf/p8m/+XOeLdjmpSylnhiExtO2B/A1FZ2fyfsSbKS8NC0HZEvCUnytA
	wq6PJVT6/Cuy3PcNEupHKcuMuEQM9aWzhUnB9OFzFzghjQrS/D4vVAj3aG+c8fGjy+8B
	bHhPEQnsSdLIojaSNThB1z9qK9ZTThk6SieOFgmsTKyObkzigyuxg3E65inIyu6oQpsZ
	zYf67+ANQElAQ8DLvwsLJGfD9slFMBR/jgI8hEbrIwNA0KM8bX0A79pXSvqesLt8iQSl
	X1vw==
X-Gm-Message-State: APjAAAVcEYlOabKM+26n+8mldkcXKxrWHTNiAR5D3/im3h17H6KkUoQb
	zyhlNdEbXCTc5tafjJxnaKEVCy1Fvf40IXebnZFmJA==
X-Received: by 2002:a9d:6855:: with SMTP id c21mr2406377oto.151.1557420877725; 
	Thu, 09 May 2019 09:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190507134521.31044-1-thuth@redhat.com>
	<CAFEAcA-j+wQXjPW+puxk=foi2T8O=MzXHtxdWJ6E5P7o89WQSg@mail.gmail.com>
	<c0cda8fc-cc68-eadd-0750-cc9eeca094a4@redhat.com>
In-Reply-To: <c0cda8fc-cc68-eadd-0750-cc9eeca094a4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 May 2019 17:54:26 +0100
Message-ID: <CAFEAcA8RoJ-ZSsn3Lhzj5hd3oYOE7Uxy8MvUUWrzhNfBmD=AWQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [Qemu-devel] [PULL v2 00/28] Kconfig for Arm machines
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, John Snow <jsnow@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pTg+wVKq95Si

On Wed, 8 May 2019 at 16:33, Thomas Huth <thuth@redhat.com> wrote:
>
> On 08/05/2019 17.09, Peter Maydell wrote:
> > On Tue, 7 May 2019 at 14:45, Thomas Huth <thuth@redhat.com> wrote:
> >> ----------------------------------------------------------------
> >> Kconfig settings for the Arm machines
> >> (v2: Fix the dependency of q35 to AHCI_ICH9 in the second patch)
> >> ----------------------------------------------------------------
> >
> > Hi -- this is still failing in the build test where I 'make clean'
>
> Very weird. What is running before the "make clean"? Could you provide
> me with the content of i386-softmmu/config-devices.mak please?

Nothing runs before make clean -- my scripts effectively just do
a git merge, then make clean, then make, then make check.

http://people.linaro.org/~peter.maydell/config-devices.mak
is the i386-softmmu/config-devices.mak
(it does not include AHCI_ICH9).

I notice that "make clean" does not delete config-devices.mak,
and "make" doesn't cause anything to update it, either.

Further, if I "touch hw/i386/Kconfig" and then run make, nothing
is rebuilt at all, so something seems to be wrong with our
makefile dependencies somewhere.

It's kind of weird that it only shows up with the from-clean
build and not with the incrementals, though.

thanks
-- PMM
