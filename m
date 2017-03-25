Received: by 10.25.15.230 with SMTP id 99csp438729lfp;
        Sat, 25 Mar 2017 05:36:04 -0700 (PDT)
X-Received: by 10.237.34.8 with SMTP id n8mr13351796qtc.98.1490445364396;
        Sat, 25 Mar 2017 05:36:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s29si1860782qks.309.2017.03.25.05.36.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 Mar 2017 05:36:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37203 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1crkvL-0004aa-QS
	for alex.bennee@linaro.org; Sat, 25 Mar 2017 08:36:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1crkvG-0004ZI-Py
	for qemu-arm@nongnu.org; Sat, 25 Mar 2017 08:35:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1crkvF-0001K2-LG
	for qemu-arm@nongnu.org; Sat, 25 Mar 2017 08:35:58 -0400
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:36191)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1crkvF-0001Jg-EF
	for qemu-arm@nongnu.org; Sat, 25 Mar 2017 08:35:57 -0400
Received: by mail-wr0-x22d.google.com with SMTP id u108so8103793wrb.3
	for <qemu-arm@nongnu.org>; Sat, 25 Mar 2017 05:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IXPkO/BuXc206H8ThgbSSxZ04/WmBfkJ1dP+1GlGN1s=;
	b=We8YY9PHzAXrm4BvaRVomQ+wZH63PEIkSmNKgfp4yildsu4tbXkQh5ww4o7Io7hFP2
	dlGzYs4by1QuKsYV9H5ci6GC63HT71Mx3Mw84ehirXq1BqnuNHP309Fx54g9uIv3r3bC
	nsq9qXG57Kyh4kMZzgVVuIGDcyLn7mD/rrnDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IXPkO/BuXc206H8ThgbSSxZ04/WmBfkJ1dP+1GlGN1s=;
	b=qOpwwxM7n2T1kReUn2B2u9nQVw+AtdrvL/GYxUpsremcPt6nhK5+SsOiEbPFEK1rZP
	we3qC6+XOtaELimyJ2uyNvXXF2+TWtegKvdwiVI3ovKaOuPpOSpQRZsHPd6TdPoqNV9C
	jrcHYdW/ApYox2CGZjFGpPmmiOylA8Ach1YvyDc12nNdvZkd43Mdsu1CW+UK2gL14Acf
	NG62x83mzDqhQGxMCqaSxkEQZxTXx1R0gD++MYKHfiGfcs/oQZNn9ZuC2NtVmRapWN+W
	oYSH3pLZTJCpZ3DJ9rldAUk5SOD0WJwVG8iYZHZXoc94fuTScm27r30elN0wBrFFLrVg
	Q1XA==
X-Gm-Message-State: AFeK/H0LrwoTlb4ZUztYe7f6QpLgfVcNGH8rB4uPJnaP722FwfV+jaVwQPNeTK5vvrUNeE0ZgMtiBUXocJDrWF52
X-Received: by 10.223.169.70 with SMTP id u64mr7356874wrc.187.1490445355695;
	Sat, 25 Mar 2017 05:35:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Sat, 25 Mar 2017 05:35:35 -0700 (PDT)
In-Reply-To: <C94A741879221447B4FC9B607EB4FFCD79EACAC2@DGGEMA504-MBS.china.huawei.com>
References: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
	<1459777195-7907-3-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_755uEOZoGj0SCtmT-5PyLMntkK3wZeuHvZ_kPG9A1aQ@mail.gmail.com>
	<5703D7EE.2000005@redhat.com>
	<CAFEAcA8G_-jQOtnVag2Ef++RbfbEJ-XzNnyYM=o9Sh8c6ohecA@mail.gmail.com>
	<C94A741879221447B4FC9B607EB4FFCD79EA34F4@DGGEMA504-MBX.china.huawei.com>
	<CAJhHMCDDu_kEJichH=60N=np+ZKbU1e9bWK-pP9Z-9=Fn4w1_w@mail.gmail.com>
	<C94A741879221447B4FC9B607EB4FFCD79EA7BA3@DGGEMA504-MBX.china.huawei.com>
	<CAFEAcA_0UA1hnP9XVBn8w0B66eyR12GnnUoCOxjirPSDgHcHvQ@mail.gmail.com>
	<C94A741879221447B4FC9B607EB4FFCD79EACAC2@DGGEMA504-MBS.china.huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 Mar 2017 12:35:35 +0000
Message-ID: <CAFEAcA_NQjvKiGxLwAOZ8zSwJXgHHwABWmDvQfC0dv7kaYFyqA@mail.gmail.com>
To: Wangjintang <wangjintang@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22d
Subject: Re: [Qemu-arm] [patch 1/1]about armv8's prefetch decode
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
Cc: "Shlomo Pongratz \(A\)" <shlomo.pongratz@huawei.com>,
	"Ori Chalak \(A\)" <Ori.Chalak@huawei.com>,
	qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Pranith Kumar <bobby.prani@gmail.com>,
	"Wanghaibin \(Benjamin\)" <benjamin.wanghaibin@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 73hw4mtzyECF

On 25 March 2017 at 02:22, Wangjintang <wangjintang@huawei.com> wrote:
> the patch regard the prefetch as load instruction, at the same time
> don't affect rm/rt register. Only the PRFM instruction been emitted to
> intermediate code and do a really load, then we can get the memory
> address relative to the prefetch instruction. Because the rm/rt register
> don't been modified, so the application can run correctly.

It will still fault if the address is not valid, which is
not a permitted behaviour.

> In our case, we need all the instruction trace & ld/st instruction's
> access memory address, the trace as the input for chip cycle-accurate
> model. Similar with flexus + qemu.
> Current code that skip generate prefetch instructions' intermediate code,
> So we can get prefetch instruction, but can't get the prefetch instruction
> relative memory address.

I understand the use case you would like, but if we want
to support that kind of thing we should do it with a much
more significant and consistent degree of support for
tracing of guest code actions, not with a small ad-hoc
change that happens to fix the immediate thing you're
running into for your specific problem.

thanks
-- PMM
