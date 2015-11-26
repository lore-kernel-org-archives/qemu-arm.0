Received: by 10.182.158.201 with SMTP id ww9csp591477obb;
        Thu, 26 Nov 2015 04:34:24 -0800 (PST)
X-Received: by 10.140.93.52 with SMTP id c49mr45719117qge.101.1448541264447;
        Thu, 26 Nov 2015 04:34:24 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a73si26092839qkb.126.2015.11.26.04.34.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Nov 2015 04:34:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:50784 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1vkl-0005qo-LJ
	for alex.bennee@linaro.org; Thu, 26 Nov 2015 07:34:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a1vki-0005pU-Mc
	for qemu-arm@nongnu.org; Thu, 26 Nov 2015 07:34:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a1vkh-000885-Tm
	for qemu-arm@nongnu.org; Thu, 26 Nov 2015 07:34:20 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:35483)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a1vkh-00087x-Mb
	for qemu-arm@nongnu.org; Thu, 26 Nov 2015 07:34:19 -0500
Received: by vkha189 with SMTP id a189so52571262vkh.2
	for <qemu-arm@nongnu.org>; Thu, 26 Nov 2015 04:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=okpCi055mVrKI5AZm2FOFS2+Lv72Isxp+lqSSQkX6ig=;
	b=YldGXJFqWNgiibmc7zkAu7otckb+1cubwG2y+ih4jmjR/AjQtjtB+DvjpYYsh2aoqW
	blFxfuAgzeiYQmRemWOBclJOW+TLxjFNFncDdyFH9XwbkGBQ+b31fZZ1wHoJ/Py7BB00
	TF5c8BcCt4tOAUYen5PDW6xRQrdhGVMjrkfmWtwl/BnIBpclKunJMU/eg/rhx/w75Fb0
	wlwb40cvUK2uBvExZFZU2PlHih3F0lDjv1LznWe3WlRb4ax9XIKXUtl12Mzxiuprcht7
	yEptLSEJ6SsIUdvFVqf9iKL2Vh2bbnZt9Kj7KZy2lcq238ycQjcBee6AV3oEef1XezDD
	pKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=okpCi055mVrKI5AZm2FOFS2+Lv72Isxp+lqSSQkX6ig=;
	b=DFMQyehJGMGJLM55yEtX4j7r1/WQq2uZ+rJVRCetPNUbmIpQOFSClUITtbA6LjtT4K
	QPzWnBq0tWuSmTPaai8JnVhUhzW5mtV+sR5T3jXfttZov0Z26z6aTnKVfPqLWbqMzoEI
	7tFbey+RHUE+kWZawtjT64pQg6GuUzmpfXtLSsMfVcmDJKvJ+VA05h+JNjgVaXnIpjeS
	+dR7jRkXwjRbofez+s+wpDmnIdRfJrU+TRthhATjRCm71WnaTJMuuFw4JGZTFprEhGZE
	5s3ims6scTdA22HXeO4smXr268DTok+zbV0AvduNIeTL187gcIi8ZD2jDFsC9b+Wikx9
	MyvQ==
X-Gm-Message-State: ALoCoQmujWVQ3n3j0VEelvxnjWYRexgzXNfWSEz3B+iU8KXP+5pWhPX6+4sGeK56mmNqTOeVdBxR
X-Received: by 10.31.52.211 with SMTP id b202mr37581520vka.82.1448541259366;
	Thu, 26 Nov 2015 04:34:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 26 Nov 2015 04:33:59 -0800 (PST)
In-Reply-To: <1448474560-22475-1-git-send-email-serge.fdrv@gmail.com>
References: <1448474560-22475-1-git-send-email-serge.fdrv@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2015 12:33:59 +0000
Message-ID: <CAFEAcA-D4ZYKqGEe9ySuBe+9nPQVah77VqwkTTDWiCOZDdR24g@mail.gmail.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::234
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] target-arm: Fix and improve AA32 singlestep
 translation completion code
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
X-TUID: 50PVZuILdy4M

On 25 November 2015 at 18:02, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
> The AArch32 translation completion code for singlestep enabled/active
> case was a way more confusing and too repetitive then it needs to be.
> Probably that was the cause for a bug to be introduced into it at some
> point. The bug was that SWI/HVC/SMC exception would be generated in
> condition-failed instruction code path whereas it shouldn't.

So I did some testing, and I think this is a bug that's not actually
really visible to Linux guests. For both QEMU's gdbstub and for gdb
running within a system emulation, gdb for 32-bit ARM will prefer to
do singlestep via setting breakpoints rather than trying to use the
gdbstub's singlestep command. So while we should definitely fix it
(and the code cleanup is nice) I think we don't need to do this for 2.5,
and I'm going to put this on my review-for-2.6 list. Do you agree?

thanks
-- PMM
