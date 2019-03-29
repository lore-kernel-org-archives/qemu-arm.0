Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1852330wrx;
        Fri, 29 Mar 2019 06:14:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzWlVNxXwKnDnwiRqbpNVJOcVQthSh6BtS1RfdtHLG/zSuRLWx9cRqf8IcBPyg6yrMbi7f1
X-Received: by 2002:a6b:5c0f:: with SMTP id z15mr2398878ioh.26.1553865269915;
        Fri, 29 Mar 2019 06:14:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553865269; cv=none;
        d=google.com; s=arc-20160816;
        b=xprQ2tywl3VlKwEf3/YYW4Zk2MdVgCsNh9xjWHWMeGKmJoew9qu3HiSPIqKH/8GjiU
         3cFunC1Iu2p+4r/v48dEFMylHiT9W5mhl1gf3MzDnt9qs6KOtxk1N1F3DS5a/EceCNCX
         jwSEpR6s+iMnZkVj0Gw5TlNUfc9RTV9NYwXkI5qno6QA/ck6jsPlB2aNKnberUHutvUY
         1Yy6jNEqk2qucGne5pxGkcilCIX4tice8Q4l8mALqfpLSAN1HAozgtWooMcuBaKM/vAk
         35pkS86L31e0em06B9mlQO+zAo7yZRkJwlRQPA1bOotlO38ZSX9xugRgOI0Sb4WWfV4H
         Rxng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oLUD6lZbqfI2yPc8jMuaplnYswS+wBn2VMqo0IArlI8=;
        b=pkioOubtJYJxWKJypQOXgMRSOMQDsLFGaZgCOf5opyryg7Ms622wbqHqceKD3wg1LX
         zZqUnqZU34b6dtz0iB/UeIPrVWHz+IK2c6gE2cDqWo0LU1UAziYGa9tzEBoxdHMuowG6
         zpLTejF78uuZbIsN5U+3GLSh+GSEA5VHr7EGLEAlZsqkklMnJWfohsAZ+JjX5mD94Kvd
         rYoYQS0hx2Gv/Ge5hp2+MCXUZdFY4KTn5Sb2H6t1TxnUSlWoIwQ2ImWCEQrXTp3GiNAj
         a6G+xIutk+GhrvfL5OG/ZBxCHWeB8gupIcIeppyNSYO11O7ubJnrtehp1LAiDw0MZIMT
         tS4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="YoUlhu/B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l16si1021126itb.118.2019.03.29.06.14.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Mar 2019 06:14:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="YoUlhu/B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52791 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9rL3-00035S-1O
	for alex.bennee@linaro.org; Fri, 29 Mar 2019 09:14:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1h9rKq-00033y-Bd
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 09:14:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1h9rKp-0008Jn-2m
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 09:14:16 -0400
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144]:53233)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1h9rKo-0008JR-PD
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 09:14:14 -0400
Received: by mail-it1-x144.google.com with SMTP id g17so3618372ita.2
	for <qemu-arm@nongnu.org>; Fri, 29 Mar 2019 06:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oLUD6lZbqfI2yPc8jMuaplnYswS+wBn2VMqo0IArlI8=;
	b=YoUlhu/B/DMUaddjXGO/Z4gBcyrvgZW1Zi8ghsJB3ezzhU4eUv0Op5WmR7QO4I+nO8
	CuZbJQC7pCs1RNcn0CnVHkSzWa5lDyZw+IsdbpmQ+HaSOg+ogrX4BLxSAS9n4Sir0Xeb
	SieHru+lUsK4uRWL/1ShTNOwlnvd/HyQstP5F8pVweGlYWqTX3gCpeq/2Q9gfwJgLvwy
	HjwyZI/8uvRJZ4xNUEydmjkNjqF8vCvNID4nIK0EqOwboNg2r8vAY/A5APstAe40m3Cx
	Swmaqyn9wxQX/M9bzF5FmqZhVF08vX8ncEAv05xSpWgQYS2dv6UNs2vPpPKbfvvXr3MB
	qTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oLUD6lZbqfI2yPc8jMuaplnYswS+wBn2VMqo0IArlI8=;
	b=Jni0YHbj3nrLuvV+NZH++JFPXUpxsc1hHKPqafhpS7ouIOp6y70tyf6dBsUky1mftg
	3TZPs1Q3WwhiKr0AxSubDUxxR8rSBuwZr6bXA/yrQcB4b+lxYHblvOnIDR1DICrb9toF
	eut0VzNcgRPNGrLsWMgiqueZTLYSHnieCO8kWZM01zZENoZlfEP3+erh/iTGWUoZUC79
	J2n/va0S9dBV+qST6+Pk1zCAzSxwU1eLAc+bGkNkQLayE8//nelj0sIfeMvvXPXBrtpm
	i7QoqOk2uWQ4s8JfbrYkNecr9a/NJHu8EroHcmsIq5GMxls2P6qm5GtjArtQ14mjv2OZ
	tgpQ==
X-Gm-Message-State: APjAAAXiGaHQ66pO0YwkLgdBSpbx1YeIFYAwhtum1vo/A7R2EoN5OD2/
	kcpagNtbpcMqikl7EGRgPWc/xac/9kxWyH7Yh4tylQ==
X-Received: by 2002:a24:11ce:: with SMTP id 197mr3983107itf.121.1553865253781; 
	Fri, 29 Mar 2019 06:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-8-shameerali.kolothum.thodi@huawei.com>
	<98c7f0fd-8446-8897-0808-e7615af29670@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA83933836A@lhreml524-mbs.china.huawei.com>
	<0dcd3f3c-15c4-318f-28bd-4b6706708c0d@redhat.com>
In-Reply-To: <0dcd3f3c-15c4-318f-28bd-4b6706708c0d@redhat.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Fri, 29 Mar 2019 14:14:01 +0100
Message-ID: <CAKv+Gu_-nRqeCT0s6ZwW+q3=sbGmtazFJ9R=19U5SJ=gSUmJLw@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::144
Subject: Re: [Qemu-arm] [PATCH v3 07/10] hw/arm/virt: Introduce opt-in
 feature "fdt"
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Linuxarm <linuxarm@huawei.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
	Laszlo Ersek <lersek@redhat.com>, Leif Lindholm <Leif.Lindholm@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v3P+IWVp5yek

On Fri, 29 Mar 2019 at 14:12, Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Shameer,
>
> On 3/29/19 10:59 AM, Shameerali Kolothum Thodi wrote:
> >
> >
> >> -----Original Message-----
> >> From: Auger Eric [mailto:eric.auger@redhat.com]
> >> Sent: 29 March 2019 09:32
> >> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
> >> qemu-devel@nongnu.org; qemu-arm@nongnu.org; imammedo@redhat.com;
> >> peter.maydell@linaro.org; shannon.zhaosl@gmail.com;
> >> sameo@linux.intel.com; sebastien.boeuf@intel.com
> >> Cc: Linuxarm <linuxarm@huawei.com>; xuwei (O) <xuwei5@huawei.com>;
> >> Laszlo Ersek <lersek@redhat.com>; Ard Biesheuvel
> >> <ard.biesheuvel@linaro.org>; Leif Lindholm <Leif.Lindholm@arm.com>
> >> Subject: Re: [PATCH v3 07/10] hw/arm/virt: Introduce opt-in feature "fdt"
> >>
> >> Hi Shameer,
> >>
> >> [ + Laszlo, Ard, Leif ]
> >>
> >> On 3/21/19 11:47 AM, Shameer Kolothum wrote:
> >>> This is to disable/enable populating DT nodes in case
> >>> any conflict with acpi tables. The default is "off".
> >> The name of the option sounds misleading to me. Also we don't really
> >> know the scope of the disablement. At the moment this just aims to
> >> prevent the hotpluggable dt nodes from being added if we boot in ACPI mode.
> >>
> >>>
> >>> This will be used in subsequent patch where cold plug
> >>> device-memory support is added for DT boot.
> >> I am concerned about the fact that in dt mode, by default, you won't see
> >> any PCDIMM nodes.
> >>>
> >>> If DT memory node support is added for cold-plugged device
> >>> memory, those memory will be visible to Guest kernel via
> >>> UEFI GetMemoryMap() and gets treated as early boot memory.
> >> Don't we have an issue in UEFI then. Normally the SRAT indicates whether
> >> the slots are hotpluggable or not. Shouldn't the UEFI code look at this
> >> info.
> >
> > Sorry I missed this part. Yes, that will be a more cleaner solution.
> >
> > Also, to be more clear on what happens,
> >
> > Guest ACPI boot with "fdt=on" ,
> >
> > From kernel log,
> >
> > [    0.000000] Early memory node ranges
> > [    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bbf5ffff]
> > [    0.000000]   node   0: [mem 0x00000000bbf60000-0x00000000bbffffff]
> > [    0.000000]   node   0: [mem 0x00000000bc000000-0x00000000bc02ffff]
> > [    0.000000]   node   0: [mem 0x00000000bc030000-0x00000000bc36ffff]
> > [    0.000000]   node   0: [mem 0x00000000bc370000-0x00000000bf64ffff]
> > [    0.000000]   node   0: [mem 0x00000000bf650000-0x00000000bf6dffff]
> > [    0.000000]   node   0: [mem 0x00000000bf6e0000-0x00000000bf6effff]
> > [    0.000000]   node   0: [mem 0x00000000bf6f0000-0x00000000bf80ffff]
> > [    0.000000]   node   0: [mem 0x00000000bf810000-0x00000000bfffffff]
> > [    0.000000]   node   0: [mem 0x00000000c0000000-0x00000000ffffffff]  --> This is the hotpluggable memory node from DT.
> > [    0.000000] Zeroed struct page in unavailable ranges: 1040 pages
> > [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x00000000ffffffff]
> >
> >
> > Guest ACPI boot with "fdt=off" ,
> >
> > [    0.000000] Movable zone start for each node
> > [    0.000000] Early memory node ranges
> > [    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bbf5ffff]
> > [    0.000000]   node   0: [mem 0x00000000bbf60000-0x00000000bbffffff]
> > [    0.000000]   node   0: [mem 0x00000000bc000000-0x00000000bc02ffff]
> > [    0.000000]   node   0: [mem 0x00000000bc030000-0x00000000bc36ffff]
> > [    0.000000]   node   0: [mem 0x00000000bc370000-0x00000000bf64ffff]
> > [    0.000000]   node   0: [mem 0x00000000bf650000-0x00000000bf6dffff]
> > [    0.000000]   node   0: [mem 0x00000000bf6e0000-0x00000000bf6effff]
> > [    0.000000]   node   0: [mem 0x00000000bf6f0000-0x00000000bf80ffff]
> > [    0.000000]   node   0: [mem 0x00000000bf810000-0x00000000bfffffff]
> > [    0.000000] Zeroed struct page in unavailable ranges: 1040 pages
> > [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x00000000bfffffff
> >
> > The hotpluggable memory node is absent from early memory nodes here.
>
> OK thank you for the example illustrating the concern.
> >
> > As you said, it could be possible to detect this node using SRAT in UEFI.
>
> Let's wait for EDK2 experts on this.
>

Happy to chime in, but I need a bit more context here.

What is the problem, how does this path try to solve it, and why is
that a bad idea?
