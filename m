Received: by 10.25.0.144 with SMTP id 138csp167661lfa;
        Wed, 19 Apr 2017 01:42:34 -0700 (PDT)
X-Received: by 10.200.51.28 with SMTP id t28mr1612092qta.16.1492591354638;
        Wed, 19 Apr 2017 01:42:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h26si1567762qta.217.2017.04.19.01.42.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Apr 2017 01:42:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46349 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0lC6-00034t-3Y
	for alex.bennee@linaro.org; Wed, 19 Apr 2017 04:42:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d0lBd-0002kI-6I
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 04:42:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d0lBc-00018v-BD
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 04:42:05 -0400
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:35975)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1d0lBc-00018Z-49
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 04:42:04 -0400
Received: by mail-wm0-x229.google.com with SMTP id o81so74126175wmb.1
	for <qemu-arm@nongnu.org>; Wed, 19 Apr 2017 01:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V3ddgwmhElbEXTkMg/Lb1IGOUmYU4imu3L6YXKMzSU0=;
	b=b/XPcH6oHXOIJmeeU2h7t4/YiT92vXWFtPzV8oLnh17Yyka+/OCrtqf2TvFfcXTvye
	zjPg9xvWRACQGaG5TKetcnAXPV/l8ifiKppKxzcNJ1pt2YS3fYZN9EPTJ3Jgz+xwdD1l
	S/iYbagefg8c2WAshBpjKEDKag3lsxC9Ote1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V3ddgwmhElbEXTkMg/Lb1IGOUmYU4imu3L6YXKMzSU0=;
	b=CXHfidh/IY4E6eZTEzkkp/JsNKFimka+lUfOIxJNi2R20+ws1GJdVFZjhMqF9/lJ1Q
	KmaMn9k+k0Sc/SZr11BkWLjKlv+aOzP78XTMsc3MFs8VFPqhPTiPbko0Jqm7AR59Jk06
	9oOTx6scKc5guCKS6c1JsN9/7xLGK/4q5a4Z/qGIYDreQLmkLajao9ps39WycoFkjSFG
	pW8pG4dnJ8wJ7fGcSa6mD2mCkPwNlj8h2C75cxvQmjLHdnDPWCUublqWBRosPwD+fzWK
	d/5eIe4R43h5xooupdvIeUivBM1N0NUm5R2asqX38sQ13TY1nHLRXX1SnJDwlULB+Prn
	yOMw==
X-Gm-Message-State: AN3rC/5xRsZuFfB/9TF/pJHXUqtX8C+0pQ+831rK5bJLQ7oNg+ghBA0m
	t992AXPtMdTvU6HyAfQtR4yT40wZZFsu
X-Received: by 10.28.236.210 with SMTP id h79mr1762396wmi.92.1492591322724;
	Wed, 19 Apr 2017 01:42:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.68 with HTTP; Wed, 19 Apr 2017 01:41:42 -0700 (PDT)
In-Reply-To: <20170418221724.5707-4-ehabkost@redhat.com>
References: <20170418221724.5707-1-ehabkost@redhat.com>
	<20170418221724.5707-4-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Apr 2017 09:41:42 +0100
Message-ID: <CAFEAcA_Ky5SecogNFq3+RO8pX4sqxvsSbw0KihAv=8teqCSJbw@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::229
Subject: Re: [Qemu-arm] [RFC v2 3/6] pci: Rename and change signatures of
 pci_bus_new() & related functions
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Cornelia Huck <cornelia.huck@de.ibm.com>,
	Paul Burton <paul.burton@imgtec.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>, Yongbok Kim <yongbok.kim@imgtec.com>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Scott Wood <scottwood@freescale.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
	Marcel Apfelbaum <marcel@redhat.com>, David Gibson <dgibson@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Laszlo Ersek <lersek@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vlgTADSUGlbd

On 18 April 2017 at 23:17, Eduardo Habkost <ehabkost@redhat.com> wrote:
> pci_bus_new*() and pci_register_bus() work only when the 'parent'
> argument is a PCI_HOST_BRIDGE object. Rename them to reflect that they
> are meant to initialize a bus that's in a PCI host bridge.
>
> The new function names are:
> * pci_host_bus_init() (replacing pci_bus_new())
> * pci_host_bus_init_inplace() (replacing pci_bus_new_inplace())
> * pci_host_bus_init_irqs() (replacing pci_register_bus())

This is moving these functions away from the convention that
we seem to mostly follow for buses (eg ISA, SCSI) of
foo_bus_new() to allocate and return a new bus, and
foo_bus_new_inplace() to initialize a bus that's inline in
some other struct.

I'm not sure this is a good idea unless we have a plan to
convert all the other QOM buses and document that this is
the right way to implement init for a bus.

thanks
-- PMM
