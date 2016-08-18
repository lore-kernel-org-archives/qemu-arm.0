Received: by 10.25.21.156 with SMTP id 28csp214085lfv;
        Thu, 18 Aug 2016 02:02:00 -0700 (PDT)
X-Received: by 10.200.44.115 with SMTP id e48mr1096756qta.64.1471510920249;
        Thu, 18 Aug 2016 02:02:00 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i46si611647qtc.76.2016.08.18.02.02.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 02:02:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baJD5-0006UJ-OS
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 05:01:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1baJD1-0006UB-Gd
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 05:01:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1baJCz-0003AB-Ku
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 05:01:54 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:34823)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1baJCz-0003A1-Fz; Thu, 18 Aug 2016 05:01:53 -0400
Received: by mail-oi0-x244.google.com with SMTP id e80so2917614oig.2;
	Thu, 18 Aug 2016 02:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pr7Yg/eHe7BKtr8uz1sMp2yaDTKEdFjL0BbdhUs4crc=;
	b=NThEd1fQmaemjl8sUCYwD0DSF14fkweBT2jjiLaJ9iwK5wYHpxyO+karYgUorAX7ID
	OGyobfrhkSX4pTZugrsomD5D1q81EZKMYPi2empyHPyTrBv2xJQICadB2ZOWF9scZAzW
	z5E0f6BqvHonUEcjJQUaV/FzbO8BVOODnXHqdR5uAio8IRGtpBbOliWz9n40RNyUL+FP
	Y0LjQQlobxBeNC8ZA0yqQJsP8wWgdJph2oEKFnOLk7AwQQifEB1w1SM1iplMHDLq5s9p
	9APu0LvAm/uguZiZJEirb3e592qpoJbMBdWX0XBGiDqM2eCdCNl3pAlGcrZR4rF3an/X
	wBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pr7Yg/eHe7BKtr8uz1sMp2yaDTKEdFjL0BbdhUs4crc=;
	b=lbymfQKe6vD2d9W5uEGxhFjOT6ACsnZq2HKC/r6GiXpysGJF9NLs7sAqruGi7L3Ooe
	mq4kr2ohCy0zkrcegLViE6lvjEm98rnFsE+LI0Vcd0DN2PAyyemqVHKZxc/Dnr3eMDXE
	sXsX/v4RJWsui0OulyQ9T7sEjp/MSWuNc/ePN5MgQky7dweAJN86TIFVtPuqobeX9608
	xAz+2JklwVxK3hLGP44hOM7DO4BYbIeiQ1sss3uKdTOOoPofYIGJvusgmBXdWIuqkDcf
	nMisRBXj3LVDTZ0O15EuBinC/SDyga9K++lcl+TyasuSPI7cOUKOjVxfE9c6uymo99+f
	BeMA==
X-Gm-Message-State: AEkoouvF189/0ayCAD/BVpHI69u4OsaAdiLMpy5ZPpOhyCJlTuvHQVVz7RBrrd3viyWgJJY0njWhe3EuCn/Wcw==
X-Received: by 10.202.60.87 with SMTP id j84mr572738oia.53.1471510912767; Thu,
	18 Aug 2016 02:01:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.244 with HTTP; Thu, 18 Aug 2016 02:01:52 -0700 (PDT)
In-Reply-To: <59517fd9-049c-adfc-5793-68165fe87f34@redhat.com>
References: <1471348968-4614-1-git-send-email-vijay.kilari@gmail.com>
	<1471348968-4614-2-git-send-email-vijay.kilari@gmail.com>
	<151e49bd-d79d-0035-c775-86be29df3ac2@redhat.com>
	<CALicx6vzQyvhQPM2qgN1wkT_M+vr2WL+H5pc9HhuB=kWVU-JnQ@mail.gmail.com>
	<59517fd9-049c-adfc-5793-68165fe87f34@redhat.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Thu, 18 Aug 2016 14:31:52 +0530
Message-ID: <CALicx6tGZ1z68nTBdYrSTcdBzCQwzHtGJ-DixKJjKSq7-cfkHw@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [RFC PATCH v2 1/2] utils: Add helper to read arm
 MIDR_EL1 register
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"prasun.kapoor" <Prasun.Kapoor@cavium.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NQGE5M2QX1DB

On Thu, Aug 18, 2016 at 2:20 PM, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 18/08/2016 09:56, Vijay Kilari wrote:
>> The get_aarch_cpu_id() has check " if (unlikely(!cpu_info_read)) ".
>> If we call get_aarch_cpu_id() from is_thunderx_pass2_cpu() which is
>> called from inside the loop, we will be adding one additional check.
>
> On the other hand, you are making an assumption that the caller of
> is_thunderx_pass2_cpu() calls get_aarch64_cpu_id() first, and not
> documenting it anywhere.
>
> And given that you shouldn't call _any_ function from inside such a hot
> loop, your solution is inferior on both counts.

Yes, but I could not think of better way to get rid of this check. However
as Richard suggested (in another email), to drop this check and let prefetch
be called for all the arm64 architectures. But I don't have any other
arm64 platform
to check the impact of it.

>
> Paolo
>
>> What I observed is having extra check inside the loop is adding 100 to
>> 200ms overhead
>> on live migration time. So I added this variable extra is_thunderx_cpu
>> static variable
>> to make it simple single check.
>
