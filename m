Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3880635wrt;
        Fri, 19 Oct 2018 07:13:13 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62b45asFSChdjl4KElsXzN4JY6aIqLCqKh6W+quC8rqOjYgOPU5CMNbRX4ZrnbgdacB2ZiX
X-Received: by 2002:a37:c11:: with SMTP id 17-v6mr32502595qkm.95.1539958392950;
        Fri, 19 Oct 2018 07:13:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539958392; cv=none;
        d=google.com; s=arc-20160816;
        b=js/EgLYbtwrlC+3RyGwOgAXiykCXIL/Fvnjib36pdIrwVGj2/PZr9GImcrCZBi4QOj
         RLX/g8S3qLEZ03qt4E/K+pOefTZVqcvtL8v28cG5vLAXPAWvi2RlXhkxewuAPcfYI/Zj
         Hn0WJbWEH7j37awyBQZ2HGiHETsCXsda+iDAoOKRWhtt9fmiwiFV5g4rUlOdaXXhZNBg
         gZn0nkZVtzTi+mdCu42oJWeqjokS/jHp+QQ+VviN79M9J+9mBfcjcE5xj3sVtCgGPnn+
         nPOb5gP+c0c+AnqHvPprRDWyrzXv8pjzkd42X37ZetE1b+OY1jvtk1ldue9v/DOon3lg
         4+7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=mWZGi3q2EILvpxoCUZ6SG83lwTDzGdlxsIq3kabTq30=;
        b=U6JPCLqidkMHYdTVTSTzYP6jjRWs/bZbItJQN9qcFNgFhPfKEEfrv51qYizmPs4WIP
         f4ykyU8ybN9D5EOpnVjJ+IzQ7G/p4G2rr/rcyu3qIJfLAAv2Sx8mod+2DJx8qSVS0xMm
         ea8SRQHU3nPcWpow/v4u/c9ajfWUyp1DPcsdxyznlmtQYwqb9IsO880ipPyWFuFr+bG9
         51yCW+Fn8eJOrjQWQAfAThT0yVhp9SSET0o5nNELBxx4jls+ps/5yGbF2wfEaebqHEuZ
         rb0E652gjmr9HbWhHCwioI0orBN6hxlfcVf70YkGXollB0e6rR7Yiqvjs+E9lYAdDzdB
         8sRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="V/NlS3ku";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n64-v6si5900018qkd.186.2018.10.19.07.13.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 07:13:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="V/NlS3ku";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50829 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDVWa-00029p-Eh
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 10:13:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDVWN-00028e-6a
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 10:13:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDVWH-0005Xy-3P
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 10:12:59 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41981)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gDVWG-0005Wk-L1
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 10:12:52 -0400
Received: by mail-oi1-x241.google.com with SMTP id l197-v6so26897527oib.8
	for <qemu-arm@nongnu.org>; Fri, 19 Oct 2018 07:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mWZGi3q2EILvpxoCUZ6SG83lwTDzGdlxsIq3kabTq30=;
	b=V/NlS3ku9B8sC9QwyXus3lI1ksRplrYHcEMIleL1DsoZqvJ/6T8y8amJMPW6XYgy9H
	nvKXlhhivpBudC5ihtdOu1WEys9IVpqEuPj9FTIVsanJDRDp6o8pTYAhtc5G0JFMU23R
	ajKSljnR/6wbwDn4myd89AKzTg9OAO8uUMe9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mWZGi3q2EILvpxoCUZ6SG83lwTDzGdlxsIq3kabTq30=;
	b=ZdrHF6oYTqeuCaNemk/xFuqZFzOHRZBMTQNx1T8EmiG4SmOFqPbdq8qgAoyYU6tI5/
	MHlFecpHwTsc623qb9SIYcS1kZMlJRciuLkUKxjgMWcAo/byzbuRTkCGgLwGeUlIso0H
	8ecvZ0lryy+nZavtCMXwhXS5GWoeRrNs+tlBDrIdoBT/ohFX6Q0KXbYJ3GvFptNr1Ot4
	oUZBiX69U/87kC0jXQZasM84W5nTE7+sD+uv/GH2xULeOxAIvFGdhxJ/bKDPlEFDEk2Q
	eGI5qUe1j3G+tNbw9S1LbqJf2PKUwPECUTp696W6Dxi3lO+IW1IQzwhkV3Sra9t/LEef
	q76Q==
X-Gm-Message-State: ABuFfogEJcZiAxpmbTtmIBua7fPN9O7IGl7unweluc+mEgLbhfwepdBy
	ABmOdx4/UgLbe5sccjnUqUP+EQlOG44SHvtecLfieQ==
X-Received: by 2002:aca:fd14:: with SMTP id
	b20-v6mr19639749oii.337.1539958371762; 
	Fri, 19 Oct 2018 07:12:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Fri, 19 Oct 2018 07:12:31
	-0700 (PDT)
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Oct 2018 15:12:31 +0100
Message-ID: <CAFEAcA9p0dLoNQy7kBdcXMz0HiMGEZTBX67Lq2SizTY3kgeksw@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PULL 00/45] Machine queue, 2018-10-18
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Libvirt <libvir-list@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x4IqnFvo4nRo

On 18 October 2018 at 21:03, Eduardo Habkost <ehabkost@redhat.com> wrote:
> The following changes since commit 09558375a634e17cea6cfbfec883ac2376d2dc=
7f:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-201=
81016-1' into staging (2018-10-16 17:42:56 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/ehabkost/qemu.git tags/machine-next-pull-request
>
> for you to fetch changes up to 6d8e1bcc7dd5e819ce81e6a87fffe23e39c700cc:
>
>   numa: Clean up error reporting in parse_numa() (2018-10-17 16:33:40 -03=
00)
>
> ----------------------------------------------------------------
> Machine queue, 2018-10-18
>
> * sysbus init/realize cleanups
>   (C=C3=A9dric Le Goater, Philippe Mathieu-Daud=C3=A9)
> * memory-device refactoring (David Hildenbrand)
> * -smp: deprecate incorrect CPUs topology (Igor Mammedov)
> * -numa parsing cleanups (Markus Armbruster)
> * Fix hostmem-file memory leak (Zhang Yi)
> * Typo fix (Li Qiang)
>
> ----------------------------------------------------------------
>

Hi. This had some problems in merge testing, I'm afraid:

On aarch64 host, warnings running tests/cpu-plug-test for i386 and s390 tar=
gets:

TEST: tests/cpu-plug-test... (pid=3D12602)
  /i386/cpu-plug/pc-i440fx-3.0/cpu-add/1x3x2&maxcpus=3D12:
qemu-system-i386: warning: Invalid CPU topology deprecated: sockets
(1) * cores (3) * threads (2) !=3D maxcpus (12)
OK
  /i386/cpu-plug/pc-i440fx-3.0/device-add/1x3x2&maxcpus=3D12:
qemu-system-i386: warning: Invalid CPU topology deprecated: sockets
(1) * cores (3) * threads (2) !=3D maxcpus (12)
OK
  /i386/cpu-plug/pc-q35-3.0/cpu-add/1x3x2&maxcpus=3D12:
qemu-system-i386: warning: Invalid CPU topology deprecated: sockets
(1) * cores (3) * threads (2) !=3D maxcpus (12)
OK
  /i386/cpu-plug/pc-q35-3.0/device-add/1x3x2&maxcpus=3D12:
qemu-system-i386: warning: Invalid CPU topology deprecated: sockets
(1) * cores (3) * threads (2) !=3D maxcpus (12)
OK
  /arm/qom/n800:                                                       OK
PASS: tests/cpu-plug-test
[...]
TEST: tests/cpu-plug-test... (pid=3D15040)
  /s390x/cpu-plug/s390-ccw-virtio-3.1/cpu-add/1x3x1&maxcpus=3D6:
qemu-system-s390x: warning: Invalid CPU topology deprecated: sockets
(1) * cores (3) * threads (1) !=3D maxcpus (6)
OK
  /s390x/cpu-plug/s390-ccw-virtio-3.1/device-add/1x3x1&maxcpus=3D6:
qemu-system-s390x: warning: Invalid CPU topology deprecated: sockets
(1) * cores (3) * threads (1) !=3D maxcpus (6)
OK
  /s390x/cpu-plug/s390-ccw-virtio-3.0/cpu-add/1x3x1&maxcpus=3D6:
qemu-system-s390x: warning: Invalid CPU topology deprecated: sockets
(1) * cores (3) * threads (1) !=3D maxcpus (6)
OK
  /s390x/cpu-plug/s390-ccw-virtio-3.0/device-add/1x3x1&maxcpus=3D6:
qemu-system-s390x: warning: Invalid CPU topology deprecated: sockets
(1) * cores (3) * threads (1) !=3D maxcpus (6)
OK
PASS: tests/cpu-plug-test

(plus similar ppc64, x86_64 targets)

I see similar warnings on hosts SPARC, PPC64BE, S390, 32-bit Arm
and x86 FreeBSD.

I also got a build failure on one of my configs, but I think that
is caused by some latent bug in our makefiles where we don't
correctly rebuild x86_64-softmmu/config-devices.mak when a
change is made to default-configs/i386-softmmu.mak -- doing a
hand rm of the config-devices.mak fixed it.


thanks
-- PMM
