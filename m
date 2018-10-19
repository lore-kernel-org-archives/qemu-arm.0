Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4162963wrt;
        Fri, 19 Oct 2018 10:55:50 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60PnXPAKDGGt9tag/9dZdPmnzVGhmPSFQSAWrmnSDxGp06KRwSr+FRgh821GAUM4i/XYF6R
X-Received: by 2002:a0c:949c:: with SMTP id j28mr35755614qvj.74.1539971750281;
        Fri, 19 Oct 2018 10:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539971750; cv=none;
        d=google.com; s=arc-20160816;
        b=QLXjWZhK3nqZKRJWeo4XOZew1UoS9j3g5qSE6Fkx7HstlMhFSbwo65ryRU37LP70BP
         RxsXf87mwLvL2NVlnqRugHBGiXXMedD9AQI+oXiOMCAUrBJy/v3kPENRDe3smrnnEZbi
         CGi+jv9Hdwhye0L5hWPJyQcBxlLaEQKcqu7F6VdIYatdrOU2eq06s/mBwMtl6hM09A/5
         DpBVoUg2pl6vESWOxIfKeRBFvwKs6OYzES3Yh/cPJ4ZpJk0oW6xJQL6ysd5yZY+rzhmX
         pXFW5VsmjhfRLxH6ZDXJS1vURDDcSrE6hMAjtChmkFHIYcSwh1HpxziAF0e3TI6xxp7K
         4oVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version;
        bh=DR8DeUDr9Vo+mOpXO5OIbVWOeIWRtncZPfpyuH3DR0I=;
        b=dlBX77Zx+O4z4kn3ziAJ9AlrD1RP1wg8UdrWx1Yr0Oy/un3EIyT1Kn//sdBiRF/n1x
         UnnCu0dKodt1GxAR3jPKGk9IBaQhZ81Y0mv0Ub3Hw0NE0XqlwEJeePQNkBrr3mw3TW76
         IDEhn+CtsidBMkNppzdfm8XM0rvt0oY7BeeJ9/FAVgaXRbuHbHbqAm1coEhFbQmjSm5n
         fMl7eZ22G5B4vy6QSzUclhun/gmwUB2/4qY7VezaOzeZmvRpIZS7VFSV5i4wF73HMc1n
         SNZub3AQNfbaZt1seu2dgEHQ/DxAhKq4Z8GyPt/THxITVkCGd3pbmJGB5SYhpHjBuOAC
         /jtw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s76-v6si2709957qka.83.2018.10.19.10.55.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 10:55:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52049 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDZ01-0005uu-Mp
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 13:55:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pmathieu@redhat.com>) id 1gDYzq-0005rW-P9
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 13:55:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pmathieu@redhat.com>) id 1gDYzl-00053n-L0
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 13:55:38 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51]:40424)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1gDYzj-0004dB-5C
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 13:55:32 -0400
Received: by mail-wr1-f51.google.com with SMTP id d2-v6so38320313wro.7
	for <qemu-arm@nongnu.org>; Fri, 19 Oct 2018 10:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DR8DeUDr9Vo+mOpXO5OIbVWOeIWRtncZPfpyuH3DR0I=;
	b=qgZ8jFX4wfw0V/uM/aMoeC4McxziDC3n8JVUHDQBjdklkqHhwLBYJcpVwbsVgrhR4U
	EzvFr8jEWxlbipbtS+EEfAzddA+ZdBzFhE9fTkb32DXh65secbprOvosJcO5HWBjOHhS
	c8A868JG5nRrF4O79q3HbFUqBZbrOttOrZXOtZpsxAPYqvgGi5Fm123xyLAgkNTD6pqZ
	VsyOis43fH7PUVEYtbM+baXZ6ZQa9fMZuOnR8595P5ch1i3sGDa3KdgA726vlsT7iO2i
	8aBI9XvBUh+5DQXGWZ9vPeBWMlWfm+ZPO3ABpuYiY7nGAb23Lop/sO6DKKV0A95oNjke
	fPRw==
X-Gm-Message-State: ABuFfohflUR1CJEBHSm+CZXkN8IdcCUkUxgtSXXBnoNuK+uPBt/ccWcD
	fMTCMP22DxZMRALhre9dLE9ksnlfLGH3g6AMMMwpCg==
X-Received: by 2002:a5d:620b:: with SMTP id
	y11-v6mr34600024wru.105.1539971726551; 
	Fri, 19 Oct 2018 10:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<CAFEAcA9p0dLoNQy7kBdcXMz0HiMGEZTBX67Lq2SizTY3kgeksw@mail.gmail.com>
	<8db2535c-c44c-ac0b-33b3-d2c2af7de15e@redhat.com>
In-Reply-To: <8db2535c-c44c-ac0b-33b3-d2c2af7de15e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Fri, 19 Oct 2018 19:55:15 +0200
Message-ID: <CAP+75-WAQ-9RF0EZVXDDwLguEtEQMP4vdhOo=CLSUSme5aSbrw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>, Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.51
Subject: Re: [Qemu-arm] [Qemu-devel] [PULL 00/45] Machine queue, 2018-10-18
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
	Max Filippov <jcmvbkbc@gmail.com>, Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Michael Walle <michael@walle.cc>, "open list:sPAPR" <qemu-ppc@nongnu.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rXotUtxFmUbR

On Fri, Oct 19, 2018 at 7:00 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
> On 19/10/2018 16:12, Peter Maydell wrote:
...
> >> ----------------------------------------------------------------
> >>
> >
> > Hi. This had some problems in merge testing, I'm afraid:
> >
> > On aarch64 host, warnings running tests/cpu-plug-test for i386 and s390=
 targets:
> >
> > TEST: tests/cpu-plug-test... (pid=3D12602)
> >   /i386/cpu-plug/pc-i440fx-3.0/cpu-add/1x3x2&maxcpus=3D12:
> > qemu-system-i386: warning: Invalid CPU topology deprecated: sockets
> > (1) * cores (3) * threads (2) !=3D maxcpus (12)
> > OK
> >   /i386/cpu-plug/pc-i440fx-3.0/device-add/1x3x2&maxcpus=3D12:
> > qemu-system-i386: warning: Invalid CPU topology deprecated: sockets
> > (1) * cores (3) * threads (2) !=3D maxcpus (12)
> > OK
> >   /i386/cpu-plug/pc-q35-3.0/cpu-add/1x3x2&maxcpus=3D12:
> > qemu-system-i386: warning: Invalid CPU topology deprecated: sockets
> > (1) * cores (3) * threads (2) !=3D maxcpus (12)
> > OK
> >   /i386/cpu-plug/pc-q35-3.0/device-add/1x3x2&maxcpus=3D12:
> > qemu-system-i386: warning: Invalid CPU topology deprecated: sockets
> > (1) * cores (3) * threads (2) !=3D maxcpus (12)
> > OK
> >   /arm/qom/n800:                                                       =
OK
> > PASS: tests/cpu-plug-test
> > [...]
> > TEST: tests/cpu-plug-test... (pid=3D15040)
> >   /s390x/cpu-plug/s390-ccw-virtio-3.1/cpu-add/1x3x1&maxcpus=3D6:
> > qemu-system-s390x: warning: Invalid CPU topology deprecated: sockets
> > (1) * cores (3) * threads (1) !=3D maxcpus (6)
> > OK
> >   /s390x/cpu-plug/s390-ccw-virtio-3.1/device-add/1x3x1&maxcpus=3D6:
> > qemu-system-s390x: warning: Invalid CPU topology deprecated: sockets
> > (1) * cores (3) * threads (1) !=3D maxcpus (6)
> > OK
> >   /s390x/cpu-plug/s390-ccw-virtio-3.0/cpu-add/1x3x1&maxcpus=3D6:
> > qemu-system-s390x: warning: Invalid CPU topology deprecated: sockets
> > (1) * cores (3) * threads (1) !=3D maxcpus (6)
> > OK
> >   /s390x/cpu-plug/s390-ccw-virtio-3.0/device-add/1x3x1&maxcpus=3D6:
> > qemu-system-s390x: warning: Invalid CPU topology deprecated: sockets
> > (1) * cores (3) * threads (1) !=3D maxcpus (6)
> > OK
> > PASS: tests/cpu-plug-test
> >
> > (plus similar ppc64, x86_64 targets)
> >
> > I see similar warnings on hosts SPARC, PPC64BE, S390, 32-bit Arm
> > and x86 FreeBSD.
> >
> > I also got a build failure on one of my configs, but I think that
> > is caused by some latent bug in our makefiles where we don't
> > correctly rebuild x86_64-softmmu/config-devices.mak when a
> > change is made to default-configs/i386-softmmu.mak -- doing a
> > hand rm of the config-devices.mak fixed it.
>
> bisected to:
>
> 23d0571a24559b867fa47410aa8ec0519b0a1edd is the first bad commit
> commit 23d0571a24559b867fa47410aa8ec0519b0a1edd
> Author: Igor Mammedov <imammedo@redhat.com>
> Date:   Thu Sep 13 13:06:01 2018 +0200
>
>     vl.c deprecate incorrect CPUs topology
>
>     -smp [cpus],sockets/cores/threads[,maxcpus] should describe topology
>     so that total number of logical CPUs [sockets * cores * threads]
>     would be equal to [maxcpus], however historically we didn't have
>     such check in QEMU and it is possible to start VM with an invalid
>     topology.
>     Deprecate invalid options combination so we can make sure that
>     the topology VM started with is always correct in the future.
>     Users with an invalid sockets/cores/threads/maxcpus values should
>     fix their CLI to make sure that
>        [sockets * cores * threads] =3D=3D [maxcpus]

Per the commit message, I understand the tests need to be upgraded,
they only test it is <=3D maxcpus while now we want =3D=3D maxcpus:

static void add_s390x_test_case(const char *mname)
{
    ...
    data->sockets =3D 1;
    data->cores =3D 3;
    data->threads =3D 1;
    data->maxcpus =3D data->sockets * data->cores * data->threads * 2;
