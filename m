Received: by 10.223.161.27 with SMTP id o27csp3961450wro;
        Tue, 31 Oct 2017 10:20:04 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RqnyeVdx4xnT+NftkB2xXrAXoi8Sib+jmpZZaYzFqI4wmZfTIEJ1tqn9EUeL2ksZNdsb7D
X-Received: by 10.37.114.138 with SMTP id n132mr1670764ybc.352.1509470404377;
        Tue, 31 Oct 2017 10:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509470404; cv=none;
        d=google.com; s=arc-20160816;
        b=mkrEBhxTj8xlXZJq65DgnA6KvHnnUhxPpKlBO/ntoxue02c28vKgYLCYq92fvoiRRb
         Y+C3yx7J3VSBNUEu/bKOd0PxDbEuyP89roqezGl1iVTO4Ddg0Fw8vO5OjHrYFT8X2gyR
         QWZkpRgNexAxf8FOTWRZGGQVhlnQuE3PqMrye8AyFtESwMBWqvcsat5UN8QBUDT0hlM0
         Khkjg0ACV3X6IA8N6ROwFP2zX2EnbTMsy9UHMGoYO2FcDdqmXGU6v3OFcnZX2fyeudMb
         C7QMGyKQdF5r5IR5n5aPH1IeKgRWhRz7zGzk2DylwjTwgqIOXBZRlB0R2ab/576wgBjs
         VQFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=QKnZ9VrweIxpeLmg/ZrxD8Mzof2q9lbz4zqkXAY6VjU=;
        b=UlTnN6MhIfkJe7RGFLY8AjLILE2MgUV7xG+Q0uX8ouMlOrcm7yyWcLkLYDP5DLGLjf
         zAZxRl9Gx/+jlOmKV1B47IoILAUU81PWHrJwqErDWkpsJToEF9g9WMBXpBpgBScbR9qK
         IoMmY7wWo81xWZNd95+dBqGbXoE57bf2FWku20hvIIOuTqhbQMD3+o8jIPRn3s4zkW5L
         sSw4H7j7jg1LdKtplOIHrekRrEzxdvAn1YoTuYPrUrGP6FjiLgKapQ7lwpS5F228Zm3P
         6znyzlb1+csRIE4Azkz7hko1HuRdD3En2UyzaMrnj2H/dKZdZDg76c+HXjsE6PXYvtVl
         9ziw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hO3uj8QP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j124si451223yba.668.2017.10.31.10.20.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 10:20:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hO3uj8QP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46686 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9aCo-0000VR-QB
	for alex.bennee@linaro.org; Tue, 31 Oct 2017 13:20:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e9aCe-0000Uh-6E
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 13:19:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e9aCd-0003NI-Dv
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 13:19:52 -0400
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:45319)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e9aCd-0003MS-5s
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 13:19:51 -0400
Received: by mail-wm0-x22e.google.com with SMTP id y80so305670wmd.0
	for <qemu-arm@nongnu.org>; Tue, 31 Oct 2017 10:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QKnZ9VrweIxpeLmg/ZrxD8Mzof2q9lbz4zqkXAY6VjU=;
	b=hO3uj8QPeEZh1HCupHoZw7M2TsvcKb4tqRNnk/D2cWbHbLiDvigKE46EjhIqGXDV8N
	U/WuX9f+AIAMFIBe9OnIRbY7RZzLzG3kBme6w+f194HhJvdkZg7doqMa2bsvW274W6JH
	xhRKMCLWZ70X+ld3/O3kqjp4lFITr4bSS29oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QKnZ9VrweIxpeLmg/ZrxD8Mzof2q9lbz4zqkXAY6VjU=;
	b=ptfdlzXQBbpjazuziHVj+PR0qiY2gb6Armtdi4g7AWjRIpdFlpkVDIws43JBXC6bp7
	xivnXhog92nvEIcxhS5RFQGKQce1WgNAwSOi+yjlcqMnCuFttL1IOHq6UM/aRMs+1o+F
	ySp4Ts95/7DbFHQJvNo9kCpIj9b5nZNuxqdih/vjBm9Kic2eXNgnt1L2DNKt60DYs8gn
	n82A8k4X2uuDELmof3ACVKEdjYqape4kT3Ttzhif8n4BxZYHyNIdGVyoFreVsHKFsnCq
	v9V0h1XsRjaS8bTexmz7QW0+Yq+uYCftWDj8kisu/paDUAjaYQgjgjtibOkt1Xy7m3Eb
	MZ7A==
X-Gm-Message-State: AMCzsaXsfhR2A9e3oZSVBHulhFl6ihjwZcWe9xZfgaMV8FGu8gL59X/T
	PrtrO9agEaak6cnwC6+e4lTdKuH6i93i0L1iP3GKZw==
X-Received: by 10.28.112.22 with SMTP id l22mr2388788wmc.35.1509470389951;
	Tue, 31 Oct 2017 10:19:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Tue, 31 Oct 2017 10:19:29 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1710311001380.13766@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710251623560.574@sstabellini-ThinkPad-X260>
	<CAFEAcA8pvLNGReghJp0QATbBtC-KCgPqQheKnY=KzDPcjdym3g@mail.gmail.com>
	<alpine.DEB.2.10.1710301444460.7297@sstabellini-ThinkPad-X260>
	<CAFEAcA9GEpxHtPpe3OSZ5eycLB50i5Q_us8dzOjiUj1HxoFnKA@mail.gmail.com>
	<alpine.DEB.2.10.1710311001380.13766@sstabellini-ThinkPad-X260>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Oct 2017 17:19:29 +0000
Message-ID: <CAFEAcA91kisKT_wCj8swwJzUn52YycpigpGwv9Djsc-Q1Sq2SQ@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22e
Subject: Re: [Qemu-arm] [PATCH v2] don't hardcode EL1 in
 extended_addresses_enabled
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Julien Grall <julien.grall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CyhW+Xxlh5CN

On 31 October 2017 at 17:07, Stefano Stabellini <sstabellini@kernel.org> wrote:
> Sorry Peter, I copy/pasted the values from arm32/page.h instead of
> arm64/page.h in Xen :-/
>
> Xen is running at EL2, 64-bit (aarch64). The ATS instruction is "at
> s1e2r", used to translate Xen virtual addresses into physical addresses.
> This is what breaks.

Thanks. OK, so if we change the line in do_ats_write() from
     if (extended_addresses_enabled(env)) {
to
     if (arm_s1_regime_using_lpae_format(env, mmu_idx)) {

does that fix your problem?

thanks
-- PMM
