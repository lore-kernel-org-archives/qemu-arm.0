Received: by 10.25.77.65 with SMTP id a62csp12325lfb;
        Thu, 9 Feb 2017 06:55:54 -0800 (PST)
X-Received: by 10.55.77.77 with SMTP id a74mr3586441qkb.265.1486652154331;
        Thu, 09 Feb 2017 06:55:54 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q57si8158532qte.78.2017.02.09.06.55.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Feb 2017 06:55:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38365 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cbq8V-0000sL-OG
	for alex.bennee@linaro.org; Thu, 09 Feb 2017 09:55:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <heyi.guo@linaro.org>) id 1cbnTA-0007cs-UV
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 07:05:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <heyi.guo@linaro.org>) id 1cbnT5-000190-Ja
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 07:05:00 -0500
Received: from mail-pf0-x235.google.com ([2607:f8b0:400e:c00::235]:33044)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <heyi.guo@linaro.org>) id 1cbnT5-00018X-Dt
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 07:04:55 -0500
Received: by mail-pf0-x235.google.com with SMTP id y143so407632pfb.0
	for <qemu-arm@nongnu.org>; Thu, 09 Feb 2017 04:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=BdamhfSZ5LVk21gl+/2IT/6CiEbe1H5hC1LA412gp3M=;
	b=kutxxuynog4RE6Dxh9fjtO+ml2/phdYIb97FrRM6QNb0yWSPIWRd5EGscXCQoz/jtg
	C/hZh4qgbJNdHLgsxE2h1FcRnRJACmKCKuvD7quS6EVlniCu/d0X+Ua1GSHDLQWPpRJq
	VOQlSMOPdW+9bjlzZ88qtlojAhVAjVwqLw38M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=BdamhfSZ5LVk21gl+/2IT/6CiEbe1H5hC1LA412gp3M=;
	b=B5AYxjKp/u/mtC3p1aSUx4GNAvWYMffngN/UegGqHGLdr4zxYqumDDTGqdDy3AkqA+
	Ak3qoOgrve81MoFYCx4rkwQPcQC+G47irBT8shHuQwsnzniJYOibPg1TnEQ5XFq2Iii2
	8ch0vCGZaV4LBgCMqroG4NDvs68KED0Ib1jJ4kvdRkbW2eYR+PEWEuBhbNZmwnLWPu3i
	qJ7CSAmb0ZhW5l+oon047+WfXDFHc2hc6Kg6VBzvB2dd1ToLqlLeyww3Csh84KTsmjHJ
	HuqmUzcLCMJF8gSc7YTjnxyp0gYupPO/bnnZiJd4lBEfqKr3Xs/HY8Hat3habsqfSAed
	fujw==
X-Gm-Message-State: AMke39nVU9WWNrfAytbm1Y747B8kRSQaHA0qFuU253wDR5KSca6rGcnx7hIYVikRxNyeMUkK
X-Received: by 10.98.66.138 with SMTP id h10mr3331288pfd.94.1486641892845;
	Thu, 09 Feb 2017 04:04:52 -0800 (PST)
Received: from [10.229.36.134] ([119.145.15.121])
	by smtp.gmail.com with ESMTPSA id
	e13sm14367307pgn.38.2017.02.09.04.04.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Feb 2017 04:04:52 -0800 (PST)
To: Laszlo Ersek <lersek@redhat.com>, Peter Maydell
	<peter.maydell@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <1486560712-44171-1-git-send-email-agraf@suse.de>
	<ef6b903b-5224-b4eb-1080-a3689fcec70a@redhat.com>
	<f2f119bc-9c22-ad52-ff26-7d6ecc213a3c@suse.de>
	<c1ff3829-b068-881a-1523-317ef0d31689@redhat.com>
	<C4E1DF44-1626-425D-880E-0053AD688422@linaro.org>
	<CAFEAcA8rjjzgvN-RuNPVHM53R9V9xry1Uj_ArmF1va-Y920eBQ@mail.gmail.com>
	<991fc2e7-e483-c7bc-fc45-3d32d9d37857@redhat.com>
From: Heyi Guo <heyi.guo@linaro.org>
Message-ID: <374fb64f-9590-2b23-871a-90bbf08ce70d@linaro.org>
Date: Thu, 9 Feb 2017 20:04:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.0
MIME-Version: 1.0
In-Reply-To: <991fc2e7-e483-c7bc-fc45-3d32d9d37857@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::235
X-Mailman-Approved-At: Thu, 09 Feb 2017 09:54:17 -0500
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
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Alex Hung <alex.hung@canonical.com>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z1TkPhTkkrX7

Hi all,

Just to confirm that FWTS is supporting aarch64.

Alex is the maintainer of FWTS and may provide more information.

Regards,

Gary (Heyi Guo)


在 2/9/2017 2:47 AM, Laszlo Ersek 写道:
> On 02/08/17 19:23, Peter Maydell wrote:
>> On 8 February 2017 at 16:27, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>>> The _CCA property is mandatory on arm64, and there is no default.
>> Is there a tool that can check this kind of requirement
>> and complain about issues in the ACPI tables (and
>> ditto, device tree)? It's really easy to produce a
>> dt or ACPI table that works with current kernels and
>> then turns out to have a problem six or twelve
>> months down the line :-(
> I think the "bios bits" project or the FWTS (firmware test suite)
> project might do some ACPI sanity checks. They could be run in guests.
>
> https://biosbits.org/
> https://wiki.ubuntu.com/FirmwareTestSuite
>
> However, I'm unsure if they support aarch64. Also... it's not like those
> projects are stationary. Even the ACPI spec is a moving target (and
> spec-level regressions exist).
>
> I believe Heyi Guo @ Linaro used to work with FWTS on aarch64. CC'd.
>
> No clue about DT conformance testing. Is there an industry standard or a
> working group behind DT?
>
> Thanks
> Laszlo
>

