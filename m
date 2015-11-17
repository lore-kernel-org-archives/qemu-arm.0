Received: by 10.182.158.201 with SMTP id ww9csp681448obb;
        Tue, 17 Nov 2015 04:11:50 -0800 (PST)
X-Received: by 10.31.188.195 with SMTP id m186mr2967664vkf.99.1447762310852;
        Tue, 17 Nov 2015 04:11:50 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u23si2405418vke.71.2015.11.17.04.11.50
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 17 Nov 2015 04:11:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:57807 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zyf70-0005az-LI
	for alex.bennee@linaro.org; Tue, 17 Nov 2015 07:11:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zyf6X-0004uw-1P
	for qemu-devel@nongnu.org; Tue, 17 Nov 2015 07:11:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zyf6W-0008Kt-2v
	for qemu-devel@nongnu.org; Tue, 17 Nov 2015 07:11:20 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:32840)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zyf6W-0008Km-0E
	for qemu-devel@nongnu.org; Tue, 17 Nov 2015 07:11:20 -0500
Received: by vkgy188 with SMTP id y188so777264vkg.0
	for <qemu-devel@nongnu.org>; Tue, 17 Nov 2015 04:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=W/Kxcp+CLjnZUifcGrmRBjEZfn2dhuEm/7H+nIqrvDE=;
	b=AwFqN+StYaTxvsa+zb2p7/nz9VdDUrE8dZiNEXP4X78nfktsgGdtVONlcYJcVzUYPl
	NzTxq4IHiGqj2QzsDWbYOPZpJsb8MHUCGRA4Mk11px2Phlsk41MKt61eNpaRxXgS2sgr
	PTiGlcHfmpzN2kkWJPnqHIhZ5Cv7RAbCTWojEg6RJ3jwFfNdbQYl6rmwxmSC4HYXaFeU
	bCkUFPBW/0VmQcDl01aqjLmFSZrMt9lQcrY/WBsdUIpbGuxoXBsIpibWqfgE0Cp1ChIq
	DQcW43ZjYQks2QiIzCpHLYhNaQSAfOrLRj/yg9EqDuBP2zDJuYc4ybhOtzSFoqxZB+qm
	6ZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=W/Kxcp+CLjnZUifcGrmRBjEZfn2dhuEm/7H+nIqrvDE=;
	b=dR2hM0piGSdrGqIpbmlO6lvFcPyezDdLdr0dRnO4OXOez9M0MP1qVVfxdBHrhj2V91
	AqjmQAIk0FWoy6E658b6rr91WvxMuUynm6PqR4gxOwhmIlm+jYAzCHOJa7Ep7rZAPRs3
	AH8tyR1n2pnqy43ixhS4Zub3zoZ2BJQPoof4LxrtOsOWvCruZ7capvtpn1dgj2ys4HhG
	5vHPp4CslHCrpIVFeva0InIdOo81css+8uDqSZ2DwRcSgiPb9yiHVqmyiJdLFmFDBSc+
	E+nQRDLlUbXH8aN8UiSzyj+wj9z6sm7u5BQayAmPT1eGwhiK3OVhLfmsiD4M4ANb+R07
	gQvA==
X-Gm-Message-State: ALoCoQk5i/TRfNqY9Wx9vQtV6li3yisI3yWfp+1VNjQBaui4kkdLCbZ588bAX9TRnGo/PsNsR48m
X-Received: by 10.31.190.208 with SMTP id o199mr3286489vkf.90.1447762279596;
	Tue, 17 Nov 2015 04:11:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 17 Nov 2015 04:11:00 -0800 (PST)
In-Reply-To: <CAHpaMEYsvr7374EO2Pufu3epfFZXDh7iE6ctyXHiSnqJNVa8Cw@mail.gmail.com>
References: <CAHpaMEYsvr7374EO2Pufu3epfFZXDh7iE6ctyXHiSnqJNVa8Cw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2015 12:11:00 +0000
Message-ID: <CAFEAcA_B1f1MzLjvQr+1XczJw7UqS8Oogt+Fp2wiRE9dOs=Phg@mail.gmail.com>
To: Francois Baldassari <francois@pebble.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH] hw/arm_gic: Correctly restore nested irq
	priority
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sGCO19ynBilq

On 17 November 2015 at 09:12, Francois Baldassari <francois@pebble.com> wro=
te:
> Upon activating an interrupt, set the corresponding priority bit in the
> APR/NSAPR registers without touching the currently set bits. In the event=
 of
> nested interrupts, the GIC will then have the information it needs to
> restore the priority of the pre-empted interrupt once the higher priority
> interrupt finishes execution.
>
> Signed-off-by: Fran=C3=A7ois Baldassari <francois@pebble.com>
> ---
> First time submitter here - I tried to follow
> http://qemu-project.org/Contribute/SubmitAPatch as best I could but do le=
t
> me know if I missed anything.

Oops, thanks for catching this. Your email client unfortunately
seems to have mangled the patch (it has sent it as multipart
mime with HTML and also wrapped long lines), which makes it hard
to handle with automated tools. Since it's a very short patch I've
just fixed it up by hand and applied it to target-arm.next. If
you're thinking about submitting more patches in the future you
might like to look into getting git send-email working.

thanks
-- PMM
