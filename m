Received: by 10.25.21.96 with SMTP id l93csp190255lfi;
        Fri, 17 Jun 2016 03:24:05 -0700 (PDT)
X-Received: by 10.55.195.193 with SMTP id r62mr1193724qkl.23.1466159045333;
        Fri, 17 Jun 2016 03:24:05 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c82si30805074qkj.237.2016.06.17.03.24.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 03:24:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55469 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDqwW-0001pi-QT
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 06:24:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bDqtT-0007om-Ca
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 06:20:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bDqtQ-0000au-Sw
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 06:20:54 -0400
Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e]:36820)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bDqtQ-0000ai-On; Fri, 17 Jun 2016 06:20:52 -0400
Received: by mail-oi0-x22e.google.com with SMTP id p204so110681567oih.3;
	Fri, 17 Jun 2016 03:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=P7viB/JkkPqeJej7s8nKEtm6ZCLDKZp8/QNnq4N74zY=;
	b=Lsqs/ZQ4CKdO7FJOrqlJMzUzPTyYuv9xFOtU4MnuEK9NFZXdZI59rOn3N+cRcrf0iA
	ljicaalPgpZfUrRWpKNrKBXolMMoaTxDWErz6B1JCgrNuNt3CBlqpaPFPzC0bzIiA1AP
	apriA0YHtnYuTZoqxNHqrO2XClqx1uYO6wDVI53eBoqXQ3BDOHQs5EKl7RrfiGwPZSnB
	t0H9dRACO9aR/tBSemgyHH8yBbHGCOCu7bZkdHvg2CI5JZbz01u7+36fOd4YgPpmQOvq
	suO7r4ThWmNQkgDBAJVT/Kw+Qc0o4GLdy+LAMsV1A6ThBCp1BZI3/rIs3oi/SaA15tqZ
	ofmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=P7viB/JkkPqeJej7s8nKEtm6ZCLDKZp8/QNnq4N74zY=;
	b=dpbXtKEANcIkiCxSVixvEweyBXRPL3ydK5bX8FcD7McZR2ZwbRYljGvQhwMlmt8UC8
	dQ2xzxUjQCvtfWXgNlRskealppmkEt2PlTZkts5r1ygaqj5BYMHieemYk03Wmdv7WOvp
	U784jtDD2SfmsozChufjj/4v6Mzi1+2ZvvIftYbdax5u4D2dVkkkGNwZS4CaXPVgaV/m
	t2xyZIQTcTaJkf730u9k05NZglAjRMx6+OE9F9pjtx02/k3VOnNqU0BOM+4tpd8ohETD
	J/1eAD3+hSSl+U3EtvTZ2xuk3qF2W355Vgxe9gRhbKiT2ZXFnfn2N0bkufpzy4F2/Pvq
	hj4A==
X-Gm-Message-State: ALyK8tIzOsChYsbd5HW0XYogM92OlVMJogemOQ0PSaDo36NxjrxNwZVeAijaJOtvNlOKZeyM6ztel7w5PoaNsQ==
X-Received: by 10.202.48.18 with SMTP id w18mr573039oiw.61.1466158852151; Fri,
	17 Jun 2016 03:20:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.37.201 with HTTP; Fri, 17 Jun 2016 03:20:51 -0700 (PDT)
In-Reply-To: <c551cc85-ba31-63bc-9c23-8457ec4a6c12@twiddle.net>
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
	<1465808915-4887-5-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA8+qWep8E3+k30n1gTUexoTrqipg=bnxS5yYPNvfFpTYw@mail.gmail.com>
	<CAFEAcA_dBDhUEZr+mLPJkiiMRyjqUuXMaaYfZX3PUwZdKFk9uA@mail.gmail.com>
	<CALicx6tYEX-6u7anPb=kgvOtg4HQriC5oRJPQtZiMipeBJazVw@mail.gmail.com>
	<CAFEAcA-=iT1r1mJgr94JUP9XfMJ2XxxW47pMF3vZ6btdO=MnUw@mail.gmail.com>
	<c551cc85-ba31-63bc-9c23-8457ec4a6c12@twiddle.net>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Fri, 17 Jun 2016 15:50:51 +0530
Message-ID: <CALicx6tuVFbUxqv9Jjj35w51PmkB2eVAPg-bbBPLgFavGTAs5A@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::22e
Subject: Re: [Qemu-devel] [RFC PATCH v1 4/4] target-arm: Compute page size
 based on ARM target cpu type
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
	Juan Quintela <quintela@redhat.com>,
	Vijaya Kumar K <vijayak@caviumnetworks.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Vijaya Kumar K <vijayak@cavium.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rnj7HESRiW5q

On Fri, Jun 17, 2016 at 1:12 AM, Richard Henderson <rth@twiddle.net> wrote:
> On 06/14/2016 04:36 AM, Peter Maydell wrote:
>> It would be better to delay the point at which we allocate
>> the data structures which care about page size, rather than
>> moving init of the CPU earlier.
>
> It would be *best* if we could re-initialize and re-allocate these data
> structures so that we can follow the current page size as it changes.
>
> Yes, this might require flushing just about everything, but it's the kind of
> thing that's likely to happen only at system startup.  After that, everything
> benefits from having the correct (larger) page size.

I tried shuffling the memory initialization code after cpu initialization.
but it was full mess. So could not proceed further.

However, I tried early creation cpu objects instead of doing it from
machvirt_init.
With this, initfn of the cpu model is called earlier and feature set is updated.
With that I could fetch arm architecture info. Based on this we can
choose page size.
I can send out RFC patch.

>
>> Also we should consider what happens if we have decided
>> the page size is X, and then a CPU is hotplugged which
>> requires a page size Y where Y < X.
>
> Is that a real possibility?  Or trivially true because the new cpu has yet to
> be initialized by the OS to use the regular OS page size.
>
>
> r~
