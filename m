Received: by 10.25.208.211 with SMTP id h202csp1893036lfg;
        Tue, 8 Mar 2016 04:10:44 -0800 (PST)
X-Received: by 10.140.157.7 with SMTP id d7mr37205537qhd.17.1457439044821;
        Tue, 08 Mar 2016 04:10:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 207si2655005qhw.106.2016.03.08.04.10.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Mar 2016 04:10:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:33999 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adGTM-0002GQ-8P
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 07:10:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1adGTG-0002BE-MX
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 07:10:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1adGTF-00052H-Js
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 07:10:38 -0500
Received: from mail-ig0-x22b.google.com ([2607:f8b0:4001:c05::22b]:36996)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1adGTD-00051N-VJ
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 07:10:37 -0500
Received: by mail-ig0-x22b.google.com with SMTP id z8so15837368ige.0
	for <qemu-arm@nongnu.org>; Tue, 08 Mar 2016 04:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=WsXGKjtKYJi4pI9kPSXBLaz7LrIWKaTo9bRm4DM8rJ4=;
	b=PZTt0VLaAsAVW9+b5f9AI8oDoOLQo4SmKB7w4PIXBozK6xsZ3dmDAgQgiQt1g9HGjc
	+1IOjSVxCvqzg18hqon16nnnZOmpMyB2RN0EtsNLixFIgB0THGvm9Z7Uu8ZJpBHMn8RE
	xYrviPgcXkBTpChYaog3/9Dp/tftByf19y1og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=WsXGKjtKYJi4pI9kPSXBLaz7LrIWKaTo9bRm4DM8rJ4=;
	b=hmrWOstW8u6YZE7dYaz+XCJpUCEyjiX/s6OfQwwocHkw1IJ/om96p2d2hY/k/g3SWO
	WU4Xz3zaNtyOauIBaAiltArBk7dbRNN0oxitNDxCPL7RIdx9g57qgqmaDfD9DGfvOvat
	EO2HHpOiTRrRSEBKfTesPzykg1rk9sCjYlesuBdeOfsOevwA6fBkKbtoYZRwTwW7mGq6
	n93Ks0LwACC7YXVBdjU6MxiHcMVUMWfVHmiqYMp886Ce+PKmpB6+BarG7MnMyhMFEJyv
	hKxL5APoKngMZO8Eoe6O3kJZXPAzTahlHc4qOGF/uUu9ZjCN6fULsMaf31U69RR7NrbK
	vfmg==
X-Gm-Message-State: AD7BkJIxq58u6Onp06HmCDWS1EM19yU8t51xSEH8BtGGgQ/AraMdLv1MmSkkKFGE7F/66ULHKKtaIZ3JRIICkMG6
MIME-Version: 1.0
X-Received: by 10.50.13.102 with SMTP id g6mr16790266igc.71.1457439034973;
	Tue, 08 Mar 2016 04:10:34 -0800 (PST)
Received: by 10.36.29.6 with HTTP; Tue, 8 Mar 2016 04:10:34 -0800 (PST)
In-Reply-To: <56DEBF6A.6070809@redhat.com>
References: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
	<56DD9C58.7050306@redhat.com>
	<CAFEAcA8C2VzkD=87W5Jn7X523cFZLZL6onxjKDoOcZsCPMQxZw@mail.gmail.com>
	<56DEBF6A.6070809@redhat.com>
Date: Tue, 8 Mar 2016 19:10:34 +0700
Message-ID: <CAKv+Gu9LzTTzdw5CSCDfpCyjSgB2h6+KawTTJQXSqJ7mhV_YdQ@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c05::22b
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 0/4] virt: provide secure-only RAM and first
	flash
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: adeB4Xj5wF55

On 8 March 2016 at 19:02, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 08/03/2016 00:34, Peter Maydell wrote:
>>> > I think that, if UEFI secure boot is in use, the UEFI environment
>>> > variables should also be only accessible from TrustZone, because they
>>> > store the key database.  At least that's how it works on x86, where both
>>> > pflash devices have the secure=on flag.
>> If I understand the setup that is being used correctly, UEFI runs
>> in Non-secure, so making the second flash device secure would mean
>> it could not access it.
>>
>> Ard, do I have that right?
>
> The part of UEFI that accesses variables can (optionally) be moved in
> secure mode.  If you don't do that, secure boot is not secure at all.
> Accesses from non-secure mode do the appropriate marshaling/unmarshaling
> to call into the secure driver.
>
> Again---that's what it does on x86, but restricting variable access to
> the trusted base is an important part of UEFI secure boot.
>

There is currently no implementation for secure boot that moves the
authentication layers into the secure world, not even on actual
hardware (modulo the closed source solutions that we don't have access
to). So our secure boot implementation is interesting as a reference,
since it has all the moving parts in place, but should not be relied
upon as an actual secure environment.

As far as this QEMU port is concerned, having some flash in secure and
some in non-secure is going to be useful regardless, and 64 MB is
plenty for both the code and the data. So if users of the Trustzone
port (which is disjoint from the KVM port in any case) can tolerate
having the code and the variables in the same pflash file, I could
simply move the code into the second flash, and we could reserve the
first flash for secure (so it sits at physical address 0x0

-- 
Ard.
