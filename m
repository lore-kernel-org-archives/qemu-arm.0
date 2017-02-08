Received: by 10.25.77.65 with SMTP id a62csp2780088lfb;
        Wed, 8 Feb 2017 10:24:06 -0800 (PST)
X-Received: by 10.233.222.197 with SMTP id s188mr2630482qkf.311.1486578246206;
        Wed, 08 Feb 2017 10:24:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l2si6185881qkc.235.2017.02.08.10.24.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Feb 2017 10:24:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60855 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cbWuR-0000iC-FD
	for alex.bennee@linaro.org; Wed, 08 Feb 2017 13:24:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cbWuK-0000i2-U7
	for qemu-arm@nongnu.org; Wed, 08 Feb 2017 13:23:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cbWuK-000371-2G
	for qemu-arm@nongnu.org; Wed, 08 Feb 2017 13:23:56 -0500
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:37677)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cbWuJ-00036a-SL
	for qemu-arm@nongnu.org; Wed, 08 Feb 2017 13:23:56 -0500
Received: by mail-wm0-x232.google.com with SMTP id v77so200981724wmv.0
	for <qemu-arm@nongnu.org>; Wed, 08 Feb 2017 10:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CHg64eK+OmAnW3uTjI98eCy8wS+6NQDqRwAMZna9nUw=;
	b=CqQp4SkK85Vdkd7cwpP+EIGyXiTpeUVHHaQaA3Y7Y1UmyzLzgaaa4Hj85WO2bFGKsh
	CTHct74lt0rkZqyPMW0+Fj52I118PV5QjfCEPzV/iwmmYTwoe5s7h1giRk2E/juGTSpF
	2JEkHEQK3M6CPEkVun6H6C8y8S9OFc24IG6es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CHg64eK+OmAnW3uTjI98eCy8wS+6NQDqRwAMZna9nUw=;
	b=R5zTscLIRsBGEtUIfw34lGl7h/boIBwHVqJP0p99PYM0HpoyvRzvObmbhmR9oZeY7r
	P9shfLPtPQGaIUHR1qtvOzDUMh60/WgSYzARjiwp0QNyt4zxSRAjud4pT/67YGlsMjza
	1cmmYeqeP08OT6fEJm5ZNNaVg4PgkwTZTVR1CV9Ws/+FEIgLT4DUCSAFxcLs5kUQMei/
	0H3R/2E6ZCpJjOpQgnR+opgCB+MadbYwi/1o/BW3i2q748fyw4+p8xJ26ClJGPBBUKX3
	EuMUxYBVOtAkltcgbmQoXte8ohkaD4mjT0aMSKCjPYC2Yi/6Ril5ovnm5J36cu1dlboD
	4VWg==
X-Gm-Message-State: AMke39mQ7Xo/lypDgn+k9zzYfTDr211dXue0QZSVPuTTGaf6h1VFX3Ihvk8Ee3dl7+MZ6FzUVfCx2yo2jB6086o1
X-Received: by 10.28.4.10 with SMTP id 10mr20552240wme.142.1486578232812; Wed,
	08 Feb 2017 10:23:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Wed, 8 Feb 2017 10:23:32 -0800 (PST)
In-Reply-To: <C4E1DF44-1626-425D-880E-0053AD688422@linaro.org>
References: <1486560712-44171-1-git-send-email-agraf@suse.de>
	<ef6b903b-5224-b4eb-1080-a3689fcec70a@redhat.com>
	<f2f119bc-9c22-ad52-ff26-7d6ecc213a3c@suse.de>
	<c1ff3829-b068-881a-1523-317ef0d31689@redhat.com>
	<C4E1DF44-1626-425D-880E-0053AD688422@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 8 Feb 2017 18:23:32 +0000
Message-ID: <CAFEAcA8rjjzgvN-RuNPVHM53R9V9xry1Uj_ArmF1va-Y920eBQ@mail.gmail.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::232
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-arm: Declare virtio-mmio
 as dma-coherent in dt
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aG5YdJhAwYVt

On 8 February 2017 at 16:27, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> The _CCA property is mandatory on arm64, and there is no default.

Is there a tool that can check this kind of requirement
and complain about issues in the ACPI tables (and
ditto, device tree)? It's really easy to produce a
dt or ACPI table that works with current kernels and
then turns out to have a problem six or twelve
months down the line :-(

thanks
-- PMM
