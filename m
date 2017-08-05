Received: by 10.25.221.202 with SMTP id w71csp507595lfi;
        Sat, 5 Aug 2017 03:14:28 -0700 (PDT)
X-Received: by 10.200.46.194 with SMTP id i2mr7241717qta.89.1501928068280;
        Sat, 05 Aug 2017 03:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501928068; cv=none;
        d=google.com; s=arc-20160816;
        b=0dqJD0eGgMkshXlmSpYnzsAi3e72tHbkpcYTkLs+WgvXaKmFZNW1Vm13O61q5+ASVK
         EfYTR95UNw7Hns08XTsrSeQjUjTNLz3EkFp15SVkM8KxEDWNGKRFVKlU6WE4Aa8ExNuW
         2F57iYR88R5xrZPE5AIp+e67FVDTMjk7V64fRvjJ7QUx5nYLDgPs/pfSIk5vNCsDuwCz
         eWsWrHe/AQweKrQF1ijyHY/BV5W5yj/Yl155UXFj1qP+fw1ggTPFqbiGNcN7+oSkSazk
         HYz9jXXX3jXyxv5sXnOZ/NbnLBgnSK/zDOeIzuXfhGlGDyOF9OtWhF04SWrUxAWoH0P1
         CoNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=bO+Ep6mna8023m4YvFjz7bdG1dH0tqV6mTE929g2G+c=;
        b=rzsrkjq9BvIYnIoH0QTC4gvkuDfMsI+Gs0Jck+YjRC8iL/iRJq75h5QQCa6tPCS2kr
         s8JK5T0VZBqUmlXEfCyFK/7H8kohouaAKaZ6+j02GcKY9wluMMP84QNyqOaGOreFXQyR
         6juizmKtBsqAhPEle6mnZB6IbrsUIBWwIK6uNKuF7v3TaSnbDbk6HAE9udWeah3o7MX0
         p4aOEpJW0C3TNUz2ya0+Ua30PrJ74KghNq3r9+PuUQda4x3cgJQHWjy5VuGxdw0m5VCw
         LfMGUYmdNbg6PjUG/aW4jjsVe662X8fhU3LcWShkwI1LicTvSLTKS+oJUb0UxdlxN+2+
         bNEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=W1bKuThx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e1si3293151qkc.105.2017.08.05.03.14.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 05 Aug 2017 03:14:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=W1bKuThx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56091 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddw6D-00076B-N1
	for alex.bennee@linaro.org; Sat, 05 Aug 2017 06:14:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ddw5J-0006ls-1V
	for qemu-devel@nongnu.org; Sat, 05 Aug 2017 06:13:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ddw5H-00018F-UO
	for qemu-devel@nongnu.org; Sat, 05 Aug 2017 06:13:29 -0400
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:37356)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ddw5H-00016Z-Nc
	for qemu-devel@nongnu.org; Sat, 05 Aug 2017 06:13:27 -0400
Received: by mail-wm0-x22d.google.com with SMTP id t201so36067919wmt.0
	for <qemu-devel@nongnu.org>; Sat, 05 Aug 2017 03:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=bO+Ep6mna8023m4YvFjz7bdG1dH0tqV6mTE929g2G+c=;
	b=W1bKuThxQwx47bX9MHVzmwh5rELyHOHDUU0aAjLKXFnDJI0zKVCPj8ZSOOssiYkhr3
	GrX9geC0S+lfRHxJXYV/3SRxmTAEUuW4u3MDE9XwtGY0ycZ5i7we24TEWrGhSb/wDfEN
	mA84rU4VEdhKS41y5vDXhhb4VZvMLtYxSRhOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bO+Ep6mna8023m4YvFjz7bdG1dH0tqV6mTE929g2G+c=;
	b=kY93eF9DA0jizkSWCkgWpqIzuO/PPz7APMWB6UOmEg/MzDmzDroOf7i5WkutH/CvzZ
	F9+lNqR9zING2n+X/pM/dh8K8xoAbgCIL3+CbWQTWICuSAr7me6SjF/952AmKAGn8EWD
	4hWux9YkUuw8YfrVUcRm1dxhXqDgQhMkUc7Heskoj4v8MMnZK+6oK702XEH9sejsPX++
	dp6VQ/Q9QHb7lnYzJO9SudOArUWory5RV3+fhDmzJVDWF36rdOptSPCD2qfcWYbUsZ41
	Irx67izCjs+3xEIYoWrffUhNgvlM4XA3CtpC8kA6J2I1wa2hapMVOdWdDySUtS1/Bcc/
	wCeg==
X-Gm-Message-State: AHYfb5i8cW7vKtFwv747/hadw6PpVTVd6PY9k6u+Ceegj3AWDay5snNe
	DTRbDDk8h7vHAmxsqFwWX+xhP4cSpzAd
X-Received: by 10.28.175.8 with SMTP id y8mr480572wme.42.1501928005021; Sat,
	05 Aug 2017 03:13:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Sat, 5 Aug 2017 03:13:04 -0700 (PDT)
In-Reply-To: <c38728a0-da49-635e-2954-1030b223e3c9@linaro.org>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-5-git-send-email-peter.maydell@linaro.org>
	<50d6ba4d-cfa3-5b5f-5da1-dca2326d4f5d@amsat.org>
	<c38728a0-da49-635e-2954-1030b223e3c9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 5 Aug 2017 11:13:04 +0100
Message-ID: <CAFEAcA_nPya92Vatwt7RiZnhKTH4_GKypSrX_KgPj3GitxV0Tg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 4/8] boards.h: Define new flag
 ignore_memory_transaction_failures
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R7bG9vdsSvIR

On 4 August 2017 at 20:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 08/04/2017 11:09 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> Since create_unimplemented_device() register overlapped with low priorit=
y, why
>> not register it as default device directly, over the whole address space=
?
>
> That's a good suggestion.  It makes more sense to me than adding a flag o=
n the
> MachineClass.

Yeah, I did think about implementing it that way, but...

That wouldn't handle the case of a device model directly
returning a MEMTX_ERROR, or a transaction dispatched to
a memory region whose MemoryRegionOps valid settings
prohibit it (eg byte accesses to a word-access-only device),
or accesses to a MemoryRegion that was created by passing
a NULL MemoryRegionOps pointer to memory_region_init_io
(I dunno why you'd do that but some code does).

In short, there are lots of ways the memory subsystem might
end up returning a transaction error -- this mechanism
ensures that none of them start generating exceptions
when they previously did not, and is (I hope) easy to
review in the sense of being sure that it does what it
intends to do without the need to audit a lot of corner
cases.

thanks
-- PMM
