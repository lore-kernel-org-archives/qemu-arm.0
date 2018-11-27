Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1437698wrt;
        Tue, 27 Nov 2018 07:46:56 -0800 (PST)
X-Google-Smtp-Source: AJdET5fCUZDPbZHJ+QpXGc/aFi/+7ESoWXQhfkRSDn9Z7bUdW1xg9dy7H3IncIMCS0pwH4KhzSjt
X-Received: by 2002:a81:65d5:: with SMTP id z204-v6mr34509376ywb.68.1543333616135;
        Tue, 27 Nov 2018 07:46:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543333616; cv=none;
        d=google.com; s=arc-20160816;
        b=gzAvdWv+J2Lk4KhI2plDLtcQXAqbPu78w+Bdi12c6JT64K0ougsWFcDcXRS4MxOaSb
         xUxr6jBbtHkXEZNXJ5p4axARZ4DpUpRRRxmb/+mRzIbhBJWdcxtbw6v5K0jotZuAfpZi
         rDAbzRfKERxJ4xtgR1icJOqW5CzyNs+D2orrLELf0I80bLCkaHorjzZfpxKawq9rQvEm
         2bFp19nEpySwkQld1hI/ToS3rTbeJS1MbwOZpXw3tprHYYF/XbS8FENoWq4ZoHAS5Hf1
         +jdIdTVOXYIQW+36y0bnBgfW5QHsNCnO2yvx7GQI4zypxX8fSWlm9poCk+k42AVbbJ/2
         QjpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vJvyRyevqHYdGu4papv5DjqCFqykVoawQuE6nNuocJE=;
        b=GD2Rw6qhZhNDEsJnC/1ZXj7MmgnzaLf9MpUTjCm9uA7bqdWCMId5YdWrwoomDWmP6X
         OpREPMaTf6aI0H8J/IHsHRYJ2Ihu5b6ucL9uAFeOEa+hS/cdutQy7+gQwKQUK5Gmn/2Y
         PhB9oVl1T2/Jd/9vCSiFxvYj6gmKi36BZo4lSuCIjYRQ9XaoqR/pK8ZIAXUMO1JDjo3c
         3QCfy9XYSeVAc/AtERdeeIvoQtNxQE650r4iwlnwb5NaxDRdIzY9qrRUhII3GPVLerz9
         QvM8LYgFBOfTuoOSBDhhxz0kHxekcJ1/IDEKY+aMGVAEwsAcYFYG169eV8QhtdYC+OEX
         +jQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ef9w4VXb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d8-v6si2882677ybo.214.2018.11.27.07.46.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 07:46:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ef9w4VXb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43059 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRfZf-0000bk-Ki
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 10:46:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55701)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gRfZT-0000b1-VP
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 10:46:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gRfZT-0003Ef-4X
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 10:46:43 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34519)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gRfZS-0003Bz-W8
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 10:46:43 -0500
Received: by mail-oi1-x244.google.com with SMTP id h25so19704221oig.1
	for <qemu-arm@nongnu.org>; Tue, 27 Nov 2018 07:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vJvyRyevqHYdGu4papv5DjqCFqykVoawQuE6nNuocJE=;
	b=Ef9w4VXbrgaWBXUR6KBVjWKA2cKRqoiot8pB9o1mCGSQeK0eEuCSx4IDHlUCN4pxDn
	RREgih5VdbPMP4ZJ/4R4Zup5r72dTEuUtv1TNN3msXFWBN5o6NxdOjenjcwNVtInClrr
	U/47epOcZB4pkPlr10wPyhzQvrRk3O/Jxpzg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vJvyRyevqHYdGu4papv5DjqCFqykVoawQuE6nNuocJE=;
	b=t4Yt6OLR35LvkS3bVE7X0BZQwj33Astkhsgich9WOtN5xIsu62W2hHHJDu2+o5/mvh
	OCgIAtTFDnNooz+HEswpa/o6MhqZ8J0v13cAicduECdIUIVQVghRYLE4p/HfBtRuhd5g
	Tu9V1bB1v+a7HDh6r7Ld16WvaWxWqe1792d1gFb9eQOSf7h3p1BAqVi2OqhUC8eG4GSK
	Zqf3f+cVcypKxhBdR4S73nlWVTglqgq10RV8aw0H7pQJQSl6/Q4K6aSw09BUo0d85zpo
	1oKrUsAof6TtjOEy5alPdZFcNp6iRu6cma3ZBxWCm1MUuhaRcUBqjjygCn8UtWx+fuQU
	JzIQ==
X-Gm-Message-State: AGRZ1gJEFgScDyEnuusQkSAZGRCzfuq/dfzg/4GRk1bdPQSHIOIOnh/G
	TfIfVeKIwP4esMdOm5UcRu9OhgKNyBXz6On8i/qCNw==
X-Received: by 2002:aca:b68b:: with SMTP id
	g133-v6mr18689121oif.25.1543333602362; 
	Tue, 27 Nov 2018 07:46:42 -0800 (PST)
MIME-Version: 1.0
References: <20181113165247.4806-1-sameo@linux.intel.com>
	<20181113165247.4806-5-sameo@linux.intel.com>
	<CAFEAcA9wvrnshOTYz-jZ0n6m7SfusYY+bnB-iPnQuVNqqdg5Ww@mail.gmail.com>
	<20181127153551.GC4393@caravaggio>
In-Reply-To: <20181127153551.GC4393@caravaggio>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Nov 2018 15:46:30 +0000
Message-ID: <CAFEAcA9B5DPeot26-oGtR-h+xdfg+tmUPrYpKhaneaT1tr1yqQ@mail.gmail.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH 04/13] target: arm: Move all interrupt and
 exception handlers into their own file
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /gJVl1kRqCiG

On Tue, 27 Nov 2018 at 15:36, Samuel Ortiz <sameo@linux.intel.com> wrote:
>
> On Tue, Nov 20, 2018 at 01:45:03PM +0000, Peter Maydell wrote:
> > What is your plan for dealing with the way that the KVM code
> > for injecting a breakpoint exception into the guest works
> > by calling the do_interrupt code ?
> > (see target/arm/kvm64.c:kvm_arm_handle_debug(),
> > which calls cc->do_interrupt(cs).) This patch moves those
> > functions to a file which won't be compiled and a later one
> > in the series seems to stop cc->do_interrupt being set at all
> > if CONFIG_TCG is not defined. That will result in QEMU crashing
> > when it tries to inject an exception, won't it?
> Yes, indeed.
> So it seems we need to inject an exception back into the guest when
> doing hardware assisted debugging and when we have not set any
> breakpoint from QEMU. So it's essentially handling the debugging from
> the guest case.
> Would returning an error when that happens be an acceptable solution? So
> when building qemu for arm64 with TCG disabled, one would basically no
> longer be able to debug from the guest.

I don't think that's a good idea. --disable-tcg shouldn't imply
"and you lose some features of KVM". This code is used in both TCG
and KVM, so needs to still be in the binary for KVM.

NB that it will also be used by the codepath for injecting SErrors
when the host detects a RAS memory error in RAM used by the guest
and wants to inform the guest of that. There are patches on-list
for that, currently undergoing code review.

thanks
-- PMM
