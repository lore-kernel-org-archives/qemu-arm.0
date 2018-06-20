Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1301414wrq;
        Wed, 20 Jun 2018 15:54:30 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIyTFL+qEl4EjopNMSchJz2uPSeG+g1zjSOC1P7d6hI7QYmnwQSfLm2nrDVyMt5sEKTV2nc
X-Received: by 2002:aed:3e26:: with SMTP id l35-v6mr21145608qtf.102.1529535270007;
        Wed, 20 Jun 2018 15:54:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529535270; cv=none;
        d=google.com; s=arc-20160816;
        b=GvJSdQYqqClphF9Uvn0HDjyY2VsiccZQfsvb2ZfhpQyaYbhTdYUygQ4NQmmTXF0Sz5
         Kczkslk+65OUKprMThSBxh+jb7WIG2Kg8nIxAbbTrtOScu2hI0FbDhyfPeBCawexDuzG
         9QyIbjENjd47mNME8dylbwE8q1hu55eBRQEQrJbgZRxSk3hgAJ4hbdgX5gsfKSI8opOa
         lZ66s2oYMtg3KcfzJR4rVCsSFW+yyDanYoSzjp8z1g5gsiO5doWMNwADPCkRzgPmPD+o
         TBEvFEaJQnXB2EdEUFNw05Y8Y7x6yo5j5ZaTM26EJlTS0E1gE7OykIT/yUo4WAUiaykP
         dOsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=Cn+M3XPdtLIrcquMuTHad1ob9AK3D1hDxu7GdrvZ6ho=;
        b=BkzrpQY712omIk/pCT7H51Os12rCR4PYZC9mL/dcxP9ZYHdtfQtJHyPn840dYLBr9Z
         84ya1ZzdF/UbTiAdd+LKry/CHxnHn/9Kzaji/ACv7mj7l8UUvVtnO4btI1cBWWAJ/fIw
         ylpxA59qK+Lv2RbX0xUChX1HBxBt+UaDTTpx6v+OqfNhiR3X8XN9aeiCz0QK91JocEkK
         TycoFA1CFSIcPKypknIQ8/JKrNANKPOCSpmUOssbbxXt3zBtW3uzQQwCQTUE9ih/M+Mu
         YUT5oYyJy5e0+JJeYZuhkNVDIjv4ls4Fykj93s1vb6ZexR8lquPTVNXOZOJDq6VwskhC
         /jHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=X8Fzie1z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o10-v6si1782430qto.347.2018.06.20.15.54.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 15:54:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@roeck-us.net header.s=default header.b=X8Fzie1z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52093 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVlzh-0003dZ-Kd
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 18:54:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fVlzW-0003dA-DR
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 18:54:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1fVlzT-00005M-AT
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 18:54:18 -0400
Received: from bh-25.webhostbox.net ([208.91.199.152]:53194)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <linux@roeck-us.net>) id 1fVlzT-0008SX-2E
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 18:54:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default;
	h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Cn+M3XPdtLIrcquMuTHad1ob9AK3D1hDxu7GdrvZ6ho=;
	b=X8Fzie1zTTrLyQEfNMXl/m0ysx
	JYd5dQRFCu9GwrmE1z3eD/JTcOByTZILVsKxPArzgzL7URA1xRrg62+3O3NQpmso/VO0ZwvYUUxbX
	CISyaW9SjZWQSnveqErgWfMhc6FQQAHgeSvmHBMjsbfkX58hCGAnskZ2TeoXE2qmB6E+9SLcBNGfu
	WD/U7R4TUiVqqx4A10RdqgbojKa/GRLyi50SY/tvqcngI0W6m31yBrFXmgGwVku3FdybP+8eo59JO
	TKVcwYVvFMFNAQUG06d0ChU1GyjjBATeQdV4TsZF/QmrZWcxGbdcuQxkbtc/wtdUWNNmBgBDzbb+F
	P4bbFcGw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
	([108.223.40.66]:56950 helo=localhost)
	by bh-25.webhostbox.net with esmtpa (Exim 4.89)
	(envelope-from <linux@roeck-us.net>)
	id 1fVlzG-0048jT-O2; Wed, 20 Jun 2018 22:54:03 +0000
Date: Wed, 20 Jun 2018 15:54:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180620225401.GA9674@roeck-us.net>
References: <4ff384cf-14ad-ef33-5532-4f8dbb8d0ff6@roeck-us.net>
	<CAFEAcA9+nW7nZb0ZaN__xBGGV9WFcBJ0_q=EYTA_DM6=bVfhNg@mail.gmail.com>
	<20180615181331.GA29302@roeck-us.net>
	<CAFEAcA_ua-FMw_SCYExPNPyFoY_jvokns7R=weoODbfVuP82+g@mail.gmail.com>
	<5ebbb70a-79dd-b3b0-6d87-10a1942af1f4@roeck-us.net>
	<CAFEAcA-Jiu-93wqtWuCQqJsQ47g=Zeb4J7y+eAZBsv1ct_QxYw@mail.gmail.com>
	<c7910c30-6b71-a376-e945-e30a6f954c0e@roeck-us.net>
	<CAFEAcA_8c6awzGcik2Hzs8zrHpkqGG=tCt_ykjVnSSa1fkkpzQ@mail.gmail.com>
	<20180619174345.GC16846@roeck-us.net>
	<CAFEAcA-6BHUScxvBNZ6zCF0e9YxDuN-7Y6HveoCUuT3+r=tA0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-6BHUScxvBNZ6zCF0e9YxDuN-7Y6HveoCUuT3+r=tA0Q@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
	guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 208.91.199.152
Subject: Re: [Qemu-arm] Booting Cortex-M3 Linux kernels in qemu
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: scBNuYUxQ/zB

Hi Peter,

On Wed, Jun 20, 2018 at 09:52:00AM +0100, Peter Maydell wrote:
> On 19 June 2018 at 18:43, Guenter Roeck <linux@roeck-us.net> wrote:
> > Thanks a lot for the link; that gave me enough information to find
> > a solution that is not too invasive and works for me.
> >
> > I need to be able to run a single kernel image against multiple
> > devicetree files and root file systems. This doesn't work with
> > above solution since it bundles everything together (or, rather,
> > it would break my workflow). However, it was easy enough to tweak the
> > boot wrapper and load it using "-bios". I added support for "-bios",
> > "-initrd", and "-dtb" to mps2_common_init(). That change is simple
> > enough to carry in my private qemu branch.
> 
> Glad you found something that works for you.
> 
> It is also possible to write a bootwrapper that loads a
> kernel/initrd via the semihosting ABI (assuming you trust
> your guest, since semihosting lets it read/write arbitrary
> host files).
> https://git.linaro.org/arm/models/boot-wrapper.git/
> is an example of doing that for A-profile.
> 

The simple bootloader does its job, and I prefer to have a uniform user
interface - it would really be nice to have consistent support for -bios,
-initrd, and -dtb in qemu. Getting it with ~70 LOC are worth it, even
if I'll have to carry the code along myself.

The last problem I had was that either uclibc-ng or Linux doesn't support
pthreads without MM. With pthreads disabled in buildroot (and with the
cmsdk-apb-timer fix I submitted), I am able to boot an-385 to shell.

Thanks,
Guenter
