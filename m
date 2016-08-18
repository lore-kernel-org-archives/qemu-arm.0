Received: by 10.25.21.156 with SMTP id 28csp359899lfv;
        Thu, 18 Aug 2016 07:56:43 -0700 (PDT)
X-Received: by 10.55.45.131 with SMTP id t125mr2940440qkh.179.1471532199949;
        Thu, 18 Aug 2016 07:56:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h186si1463943qkd.278.2016.08.18.07.56.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 07:56:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53070 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baOkJ-00082e-FI
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 10:56:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1baOkD-00081Q-Vh
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 10:56:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1baOkD-0004dW-7F
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 10:56:33 -0400
Received: from mail-ua0-x233.google.com ([2607:f8b0:400c:c08::233]:33097)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1baOkC-0004cz-0W
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 10:56:33 -0400
Received: by mail-ua0-x233.google.com with SMTP id 74so32326495uau.0
	for <qemu-arm@nongnu.org>; Thu, 18 Aug 2016 07:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rjQjenaVmemL1kgACaA6M51uN/YSOIbEutYuUHN+ajM=;
	b=dUH3LNPaM3XoT28qVcuX4pqeGLDBTPZDGDnTnmWD1RqYE6Pc+qOf5cOehWLK3t6ZUh
	vgsnaiHEGAkgtukrClweLZT80qu0GLS4lkeaYJ7vA+fbzGOk57/lhLREZH4SS8sbr5g2
	A7K3d4yyGGNx7IFiETQf3ccvyuvxYLnWBztaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rjQjenaVmemL1kgACaA6M51uN/YSOIbEutYuUHN+ajM=;
	b=TGCxkjCMIdrRZC/hvDMDtWEWIG+Nur9uY0P7IypzwFRoYAv6qFk16PSEU+hmCRhgss
	VGJqHua9vYWczYnSr28ARkeinJUWL4DLhs7vxMV/zhR3fAewqs6w7Od4JMF2FLTpcdUi
	C/9RD/y9fH/eX5NTFkqTKnyQbnuLn4BMG73I3o/0m8YyZBf4gDjEcu36a40e8MSAwh9N
	XYRhC1JIm2ZhgA9WZvIkAnOIWfMJrR0BtuOElHcVpiwpYTgsVInyhiKjfu/vzS3jsbF6
	g544aASJpVLdd9F5GmL6Iwqmo5MOxzxUbwftE4fWpJg+JM+7GBVoycQ5EgXhXFW+8cqV
	VFwQ==
X-Gm-Message-State: AEkoouua3FlVePaXJJYjqrunvX954JVK7c+Z/r1Ac1B56ccVpOsOMH1Z/9rvR44/KI7m31JNY8eEWWCMi02d41ZG
X-Received: by 10.31.1.6 with SMTP id 6mr1312871vkb.82.1471532191248; Thu, 18
	Aug 2016 07:56:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.149 with HTTP; Thu, 18 Aug 2016 07:56:10 -0700 (PDT)
In-Reply-To: <1d77e7f0-61b6-5533-f0b2-04eae0fed815@twiddle.net>
References: <1471348968-4614-1-git-send-email-vijay.kilari@gmail.com>
	<1471348968-4614-2-git-send-email-vijay.kilari@gmail.com>
	<151e49bd-d79d-0035-c775-86be29df3ac2@redhat.com>
	<CALicx6vzQyvhQPM2qgN1wkT_M+vr2WL+H5pc9HhuB=kWVU-JnQ@mail.gmail.com>
	<59517fd9-049c-adfc-5793-68165fe87f34@redhat.com>
	<CALicx6tGZ1z68nTBdYrSTcdBzCQwzHtGJ-DixKJjKSq7-cfkHw@mail.gmail.com>
	<f5f56ea7-795e-81d3-6892-f30772631e53@redhat.com>
	<5e34688d-af70-9fed-33c7-96d86868d1a6@twiddle.net>
	<CAFEAcA9J1_xGV7ScRzPNdU0qVa5nREa1ibPVHZgA8Nj7FXeGgw@mail.gmail.com>
	<1d77e7f0-61b6-5533-f0b2-04eae0fed815@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Aug 2016 15:56:10 +0100
Message-ID: <CAFEAcA9BL3u7WJnqFEVxwyW=D-FtUW7UdDxPhhgiFKObkuXibg@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::233
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
Cc: "prasun.kapoor" <Prasun.Kapoor@cavium.com>,
	Vijay Kilari <vijay.kilari@gmail.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y4HwXxqaWkcn

On 18 August 2016 at 15:46, Richard Henderson <rth@twiddle.net> wrote:
> On 08/18/2016 07:14 AM, Peter Maydell wrote:
>> While we're on the subject, can somebody explain to me why we
>> use ifuncs at all? I couldn't work out why it would be better than
>> just using a straightforward function pointer -- when I tried single
>> stepping through things the ifunc approach still seemed to indirect
>> through some table or other so it wasn't actually resolving to
>> a direct function call anyway.

> No reason, I suppose.
>
> It's particularly helpful for libraries, where we don't really want the
> overhead of the initialization when it's not used.

Ah, I see.

> But (1) we don't have many of these and (2) we really don't care *that* much
> about startup time.
>
> So a simple function pointer initialized by a constructor has the same
> effect.

That seems like it would be a worthwhile change since
(a) I think it's easier to understand than ifunc magic
(b) it means we don't unnecessarily restrict ourselves to a libc
with ifunc support (musl libc doesn't do ifuncs, for instance)

thanks
-- PMM
