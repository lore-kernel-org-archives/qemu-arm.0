Received: by 10.223.161.27 with SMTP id o27csp3499124wro;
        Tue, 31 Oct 2017 02:50:02 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QdQJfeUSaMzMXxudGBJfzYbOmykFSg4mwIj67WQL1NtKYLzAXGq9dmYKe3cjYTKIvUgQsz
X-Received: by 10.129.129.194 with SMTP id r185mr840380ywf.70.1509443402516;
        Tue, 31 Oct 2017 02:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509443402; cv=none;
        d=google.com; s=arc-20160816;
        b=T/bMvaJ2i/ioLyeFiT+jWiZoTZ4qpWpF6ljJaagFwrCjXaz+ip5u6SxSTlXCIsQEiR
         mPbP8XSSrlI8+5tnlzy/4TXGMHgf5fLOR8z/Zhs4TdSeiCfMwnameo1bsLsj6xVcKkSa
         VMuuriGnbPyXzmmeDb9RRholZkbPIQLIxWtmbH3T1X8ysV6J+c3z4P84X0mQmYWNEL+B
         iZjMIi++RWWIiVPzTr9ymxEvJdlNzc2T0DI5C1hE6mnqwPTGKvDc8b9hjiVdWXvTZ/Yb
         /YSjZYJfaSZvGjlmdAwfHCAI5Py0uPx+112XgDthBU4EI1WEoHbnbqW5xvPY9co6lbM7
         14FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=9B2Mn5A3uv7cjQf7+KhMXM2tSencFqG95/7la6Z8OVY=;
        b=bkBKqk5k5fs4MTkT33CqUl9RIv8Gjj45nS7y49mqxgmqjxS5wURZX8f2czDnIGTNzK
         j5X7l8Iy89UkmnxNbsyLFXWPpsz9qcGvStVhuuigWGQJigAMbLwvCF08kRuKC3dgEiMQ
         tyg8A5jCBeEUNpW87I+0WOhYYCoQkaB6nxOzv5Fh6UWX0qByPvHq6i7udJ6TAeA7sVrS
         EdtPwlYWg4+3+kAdvZFtskTaRjGPoszUxEl8kHVMd8lSczyUht0hY7WE/qGRlDAcG0KV
         EemO1od+bMkDRjD+B98wccBm+sanxiAoD0DyQtYjXEp1ZpWeapdjBE/yQFwkO4Fz/RLD
         Xl5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DKmIcKqE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m187si312125ywe.599.2017.10.31.02.50.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 02:50:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DKmIcKqE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44422 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9TBK-0001HE-1X
	for alex.bennee@linaro.org; Tue, 31 Oct 2017 05:50:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e9TAL-0000yu-4d
	for qemu-devel@nongnu.org; Tue, 31 Oct 2017 05:49:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e9TAK-00067h-A0
	for qemu-devel@nongnu.org; Tue, 31 Oct 2017 05:49:01 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:46427)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e9TAK-00066d-3V
	for qemu-devel@nongnu.org; Tue, 31 Oct 2017 05:49:00 -0400
Received: by mail-wm0-x241.google.com with SMTP id m72so21185088wmc.1
	for <qemu-devel@nongnu.org>; Tue, 31 Oct 2017 02:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9B2Mn5A3uv7cjQf7+KhMXM2tSencFqG95/7la6Z8OVY=;
	b=DKmIcKqEPpEihGxgFJvK+02P1cYkYulVGDOEQQ9lYquVf7ABHvD6I8z/fl2CEjflTT
	vwWjBxu8dS6AtoYHTM+7o7w8XTsKQoV0RinIxyHXa+bNwdZmbDngdDvGX11m2o3cW/+z
	rAzufaBXOrBKeUGbz8d2sjSN/gApc6ff1IoZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9B2Mn5A3uv7cjQf7+KhMXM2tSencFqG95/7la6Z8OVY=;
	b=Bw+ixGyynACHHhFHgXZV79H0hMtdctRY8ts6f5Xd1jvT9FlflEnPcdgbqNW5j4mgC5
	d6EaMPAIGjd5FiqghUbcQMsDQLNHDKmhgPAEHmfL+ldfnuNyRmqDYMAXr/G3v14WOmvA
	zNlSFIlt8bsfh4zPAfymuDnoK+e5ikbbTIzjfXi3LcX9RzbpliRvT/xxtPOCfINvBeTk
	wekxlE7p2xK6mCnGrs+iS+a5+wo7Eqnuuqw7DolJMrz0e1vxXFaGsjanDzE1aHFE4htg
	YC1I6nea2ZJ0kV7MJKZHebYxGz3lVf8bPEgjOo4baPl+P5sMLJvVgKop66aHfmphHO5J
	PD9w==
X-Gm-Message-State: AMCzsaVE9tmTDiZylNhJ3h1ml1G+l0kbyNfuiawO5axN3gveQ+6wpnNV
	P7af8bFwe/00aRM+UUfHrBL3IkPqxGraKhlH7Uy64A==
X-Received: by 10.28.14.195 with SMTP id 186mr1294603wmo.56.1509443338663;
	Tue, 31 Oct 2017 02:48:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Tue, 31 Oct 2017 02:48:38 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1710301444460.7297@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710251623560.574@sstabellini-ThinkPad-X260>
	<CAFEAcA8pvLNGReghJp0QATbBtC-KCgPqQheKnY=KzDPcjdym3g@mail.gmail.com>
	<alpine.DEB.2.10.1710301444460.7297@sstabellini-ThinkPad-X260>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Oct 2017 09:48:38 +0000
Message-ID: <CAFEAcA9GEpxHtPpe3OSZ5eycLB50i5Q_us8dzOjiUj1HxoFnKA@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-devel] [PATCH v2] don't hardcode EL1 in
 extended_addresses_enabled
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
	Julien Grall <julien.grall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZCDsoNL0VKlA

On 30 October 2017 at 22:57, Stefano Stabellini <sstabellini@kernel.org> wrote:
> On Mon, 30 Oct 2017, Peter Maydell wrote:
>> What's the specific situation/bug that you're trying to fix with
>> this patch? You don't say in the commit message.
>> We should be able to put in a point fix to deal with whatever it is,
>> but it's hard to suggest what that would be without the detail
>> of what exactly we're getting wrong. (It's the PAR format stuff,
>> right? But which ATS instruction are you using, from which
>> exception level, with which register width, for which stage
>> 1 page table format and stage 1 guest register width?)
>
> Thank you for understanding, I am not really up for heavy refactoring
> in QEMU right now :-)
>
> Yes, I am trying to fix the AT instruction, which is used by Xen for
> address translations. Xen always runs at EL2. do_ats_write takes the
> wrong path because extended_addresses_enabled assumes EL1.
>
> To go more into details, virt_to_maddr translates a Xen virtual address
> into a physical address. Xen implements virt_to_maddr as:
>
>   static inline paddr_t __virt_to_maddr(vaddr_t va)
>   {
>       uint64_t par = va_to_par(va);
>       return (par & PADDR_MASK & PAGE_MASK) | (va & ~PAGE_MASK);
>   }
>
> Where va_to_par is:
>
>   #define ATS1HR          p15,4,c7,c8,0   /* Address Translation Stage 1 Hyp. Read */
>   static inline uint64_t __va_to_par(vaddr_t va)
>   {
>       uint64_t par, tmp;
>       tmp = READ_CP64(PAR);
>       WRITE_CP32(va, ATS1HR);
>       isb(); /* Ensure result is available. */
>       par = READ_CP64(PAR);
>       WRITE_CP64(tmp, PAR);
>       return par;
>   }
>
> This is what breaks Xen 64-bit booting on qemu-system-aarch64.

I'm confused. You say this is 64-bit booting, but the code you quote
here looks like it's doing 32-bit cp15 accesses, not 64-bit mrs/msr
sysreg accesses.

We definitely don't support 32-bit Hyp mode right now.

Could you please answer all of:
>> which ATS instruction are you using, from which
>> exception level, with which register width, for which stage
>> 1 page table format and stage 1 guest register width?)

thanks
-- PMM
