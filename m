Received: by 10.25.77.65 with SMTP id a62csp501737lfb;
        Fri, 10 Feb 2017 06:12:20 -0800 (PST)
X-Received: by 10.200.53.247 with SMTP id l52mr8342222qtb.144.1486735940316;
        Fri, 10 Feb 2017 06:12:20 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d16si910348qka.326.2017.02.10.06.12.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Feb 2017 06:12:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@canonical-com.20150623.gappssmtp.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=canonical.com
Received: from localhost ([::1]:44062 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ccBvt-0004cl-O6
	for alex.bennee@linaro.org; Fri, 10 Feb 2017 09:12:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.hung@canonical.com>) id 1cc0Cg-0003SI-DE
	for qemu-devel@nongnu.org; Thu, 09 Feb 2017 20:40:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.hung@canonical.com>) id 1cc0Cf-0004S3-7i
	for qemu-devel@nongnu.org; Thu, 09 Feb 2017 20:40:50 -0500
Received: from mail-qk0-x231.google.com ([2607:f8b0:400d:c09::231]:34870)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.hung@canonical.com>)
	id 1cc0Cf-0004Rj-26
	for qemu-devel@nongnu.org; Thu, 09 Feb 2017 20:40:49 -0500
Received: by mail-qk0-x231.google.com with SMTP id u25so24617217qki.2
	for <qemu-devel@nongnu.org>; Thu, 09 Feb 2017 17:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=canonical-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=iT3AJZ0I67HvIskGn+9KDuwYFr3wEAV95zVOqT1uurg=;
	b=OHZ3UGTIBDw8hSuUT4OHm5Ars1TDhEYRfBfTmzZwJ31O82/aTq9deMckpgMoihK910
	O5OEVQWygrFNB7W3SgRSAaCzatxehUy1QmA6Ii0s7nvo2R9UwX6Ubvf/lcvtBXp5S4o6
	yhC8da08Nq+C2yy0pT8kpYpyuZxbZNLX5tMUjm0su4gtYfklyg9wyd/BizLY0I4wBNpC
	NCUQ9fqOpZZB3tu1JW9ny4m8jzd6W9nvcp63N+GNSVjS0qsLzNrozljYUq38/YII6emt
	+AZ1Gw+ZIkNrF84J241JlsQn51Fw9B67/kVJXmr246Ts8hmAGJODljA9qode/V5M4qRi
	2sZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=iT3AJZ0I67HvIskGn+9KDuwYFr3wEAV95zVOqT1uurg=;
	b=AuOIzpUyQipna5ZDmS+4dY8vXlDuycpZFIbJ1GcQ2oC+DGfae1xrMPIJtmjcJaBdJs
	3FcxBwBJWSSzy3WfscmZmkABjdsqOUDbiUhJqoZj6n1nuKro5ET+AGDQ4zjPxEtxE7rk
	SI27slHm6opO+D7y7HekM/RkyywR48pAJXN2AjGcW9uiWzceY2m9MC5kOIep8AVswcVD
	EqjTjBHh3+DiG807701OqsRZnO+cjbFY9HNr6y9c39Bete+ZJ3um0eD6CllhpQde3JTQ
	ZAOJ6GHpRRcCLtd7puhIJTECkVqltEVjr5Xm2GBl9UBDxeZmOOK3XHS1nP+PDUEgy53z
	CrEg==
X-Gm-Message-State: AMke39l0LltIQuqpnPVDRRhhb6gRfw3raa3XXljZqq0XT2mi4ofN7ZrdBlHLPBuWs9CZeOUyKZCeLQUNvU6DRZNZ
X-Received: by 10.55.17.223 with SMTP id 92mr5952112qkr.30.1486690847904; Thu,
	09 Feb 2017 17:40:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.157.200 with HTTP; Thu, 9 Feb 2017 17:40:47 -0800 (PST)
In-Reply-To: <374fb64f-9590-2b23-871a-90bbf08ce70d@linaro.org>
References: <1486560712-44171-1-git-send-email-agraf@suse.de>
	<ef6b903b-5224-b4eb-1080-a3689fcec70a@redhat.com>
	<f2f119bc-9c22-ad52-ff26-7d6ecc213a3c@suse.de>
	<c1ff3829-b068-881a-1523-317ef0d31689@redhat.com>
	<C4E1DF44-1626-425D-880E-0053AD688422@linaro.org>
	<CAFEAcA8rjjzgvN-RuNPVHM53R9V9xry1Uj_ArmF1va-Y920eBQ@mail.gmail.com>
	<991fc2e7-e483-c7bc-fc45-3d32d9d37857@redhat.com>
	<374fb64f-9590-2b23-871a-90bbf08ce70d@linaro.org>
From: Alex Hung <alex.hung@canonical.com>
Date: Fri, 10 Feb 2017 09:40:47 +0800
Message-ID: <CAJ=jquaaiX1GM_ea9b2X2NOW47q456kp71mcvtc1q_q+OnpCRA@mail.gmail.com>
To: Heyi Guo <heyi.guo@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::231
X-Mailman-Approved-At: Fri, 10 Feb 2017 09:10:24 -0500
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] target-arm: Declare virtio-mmio
 as dma-coherent in dt
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qvdg9emj21gj

Hi,

FWTS supports multiple architectures:

- amd64
- arm64
- armhf
- i386
- ppc64el
- s390x

Package details are available @
https://launchpad.net/~firmware-testing-team/+archive/ubuntu/ppa-fwts-stabl=
e/+packages

FWTS also supports device tree to some extent, thanks to contributions
from Jeremy Kerr & Deb McLemore.

Cheers,
Alex Hung

On Thu, Feb 9, 2017 at 8:04 PM, Heyi Guo <heyi.guo@linaro.org> wrote:
> Hi all,
>
> Just to confirm that FWTS is supporting aarch64.
>
> Alex is the maintainer of FWTS and may provide more information.
>
> Regards,
>
> Gary (Heyi Guo)
>
>
> =E5=9C=A8 2/9/2017 2:47 AM, Laszlo Ersek =E5=86=99=E9=81=93:
>>
>> On 02/08/17 19:23, Peter Maydell wrote:
>>>
>>> On 8 February 2017 at 16:27, Ard Biesheuvel <ard.biesheuvel@linaro.org>
>>> wrote:
>>>>
>>>> The _CCA property is mandatory on arm64, and there is no default.
>>>
>>> Is there a tool that can check this kind of requirement
>>> and complain about issues in the ACPI tables (and
>>> ditto, device tree)? It's really easy to produce a
>>> dt or ACPI table that works with current kernels and
>>> then turns out to have a problem six or twelve
>>> months down the line :-(
>>
>> I think the "bios bits" project or the FWTS (firmware test suite)
>> project might do some ACPI sanity checks. They could be run in guests.
>>
>> https://biosbits.org/
>> https://wiki.ubuntu.com/FirmwareTestSuite
>>
>> However, I'm unsure if they support aarch64. Also... it's not like those
>> projects are stationary. Even the ACPI spec is a moving target (and
>> spec-level regressions exist).
>>
>> I believe Heyi Guo @ Linaro used to work with FWTS on aarch64. CC'd.
>>
>> No clue about DT conformance testing. Is there an industry standard or a
>> working group behind DT?
>>
>> Thanks
>> Laszlo
>>
>



--=20
Cheers,
Alex Hung
