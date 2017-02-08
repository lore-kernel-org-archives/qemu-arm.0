Received: by 10.25.77.65 with SMTP id a62csp2788693lfb;
        Wed, 8 Feb 2017 10:47:47 -0800 (PST)
X-Received: by 10.200.56.187 with SMTP id f56mr20573419qtc.234.1486579667672;
        Wed, 08 Feb 2017 10:47:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o99si6239550qkh.54.2017.02.08.10.47.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Feb 2017 10:47:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60983 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cbXHM-0004ZV-Tv
	for alex.bennee@linaro.org; Wed, 08 Feb 2017 13:47:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1cbXHJ-0004ZD-IV
	for qemu-arm@nongnu.org; Wed, 08 Feb 2017 13:47:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1cbXHG-0001Cx-FV
	for qemu-arm@nongnu.org; Wed, 08 Feb 2017 13:47:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34982)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1cbXHG-0001Bv-9j; Wed, 08 Feb 2017 13:47:38 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 169E164A4E;
	Wed,  8 Feb 2017 18:47:38 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-31.phx2.redhat.com
	[10.3.116.31])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v18IlZPS028482; Wed, 8 Feb 2017 13:47:35 -0500
To: Peter Maydell <peter.maydell@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <1486560712-44171-1-git-send-email-agraf@suse.de>
	<ef6b903b-5224-b4eb-1080-a3689fcec70a@redhat.com>
	<f2f119bc-9c22-ad52-ff26-7d6ecc213a3c@suse.de>
	<c1ff3829-b068-881a-1523-317ef0d31689@redhat.com>
	<C4E1DF44-1626-425D-880E-0053AD688422@linaro.org>
	<CAFEAcA8rjjzgvN-RuNPVHM53R9V9xry1Uj_ArmF1va-Y920eBQ@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <991fc2e7-e483-c7bc-fc45-3d32d9d37857@redhat.com>
Date: Wed, 8 Feb 2017 19:47:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8rjjzgvN-RuNPVHM53R9V9xry1Uj_ArmF1va-Y920eBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 08 Feb 2017 18:47:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
	Alexander Graf <agraf@suse.de>, Heyi Guo <heyi.guo@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E7/S3YXJsSfO

On 02/08/17 19:23, Peter Maydell wrote:
> On 8 February 2017 at 16:27, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>> The _CCA property is mandatory on arm64, and there is no default.
> 
> Is there a tool that can check this kind of requirement
> and complain about issues in the ACPI tables (and
> ditto, device tree)? It's really easy to produce a
> dt or ACPI table that works with current kernels and
> then turns out to have a problem six or twelve
> months down the line :-(

I think the "bios bits" project or the FWTS (firmware test suite)
project might do some ACPI sanity checks. They could be run in guests.

https://biosbits.org/
https://wiki.ubuntu.com/FirmwareTestSuite

However, I'm unsure if they support aarch64. Also... it's not like those
projects are stationary. Even the ACPI spec is a moving target (and
spec-level regressions exist).

I believe Heyi Guo @ Linaro used to work with FWTS on aarch64. CC'd.

No clue about DT conformance testing. Is there an industry standard or a
working group behind DT?

Thanks
Laszlo

