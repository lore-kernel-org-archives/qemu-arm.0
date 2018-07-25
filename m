Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp552952wru;
        Wed, 25 Jul 2018 03:50:45 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcls5uzZXmwVNG038w6ofqwfoDun9xq7obghfh8tDKSfO+axdu2MGBjlDC/g2TkuiLhdIqM
X-Received: by 2002:a37:8044:: with SMTP id b65-v6mr18924901qkd.347.1532515845282;
        Wed, 25 Jul 2018 03:50:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532515845; cv=none;
        d=google.com; s=arc-20160816;
        b=vSutQ9pgJyt0AKSP5W0uNQFVOUZODsD85GgH0zg1uuh6YUs9NA2/1Zdy5PVIDy0n6a
         ktfQQmq6VhUV4dgY7aGXBkr5t3BQge+5fJU9qp0iUU/97iYwcI1ErZFwnX4SZrwHrg3o
         r38p8NfzDbsYuZUvSAyNa/n/MBT+LMFiHjS7Zz4tIzzYH9msm1THu9ooyjMdb07Vq6/X
         GfDSfAZ5MsflsTWYCvGyIR0mo2mxX2YtUKUWzXb7YZUmGptZ4bpQdY/0yaoMX+O4iTTC
         pAAcCd/0FyS90gyAYNQNGb1XBUVcsABBTAwdqErdk7nLO3wgH/32Aha8vUdZS1O6Zj+q
         WZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:arc-authentication-results;
        bh=5e3KW+9FD4tpmpfFKh3IMCYT55vGmFhhy7/H0h51t/I=;
        b=XkN0v69N/qsxvljiaShF5LlVJRCus4y+4So7Y7v8eIZvD4e3iMyiiiF8/5e7m9zmp8
         Ujx4YNFduB1fQh6JWNBWu0MDEJwnL7btBicLXxvew6Or2bMgh8M2zqtiRZABKh0efm0M
         SudcOcvme+h7MzHB7nfTQYDebyyoYGhmnsKsrTlajX6F6zr0sX+mphzYmjk61X6xMl1F
         6LmxJmRUeub5l93YOhkGJVESIjOBYsoLB0TvjfKhEES47dwZcajZ0bGV0KUMf2TiKGt4
         bmzOTOem7+QYUQGYgaZ0kiJyAfZSi8iqYUhWgp+6c3eawCW7TxujMa21BooYUP4ApEwx
         Tw/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dgilbert@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=dgilbert@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <dgilbert@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id k1-v6si9889329qvf.138.2018.07.25.03.50.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Jul 2018 03:50:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgilbert@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dgilbert@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=dgilbert@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A12B14014620;
	Wed, 25 Jul 2018 10:50:44 +0000 (UTC)
Received: from work-vm (ovpn-117-189.ams2.redhat.com [10.36.117.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3131D7C5E;
	Wed, 25 Jul 2018 10:50:43 +0000 (UTC)
Date: Wed, 25 Jul 2018 11:50:41 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, peter.maydell@linaro.org,
	radoslaw.biernacki@linaro.org, ard.biesheuvel@linaro.org,
	qemu-devel@nongnu.org, leif.lindholm@linaro.org,
	qemu-arm@nongnu.org, alex.bennee@linaro.org
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180725105040.GA2366@work-vm>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Wed, 25 Jul 2018 10:50:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Wed, 25 Jul 2018 10:50:44 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'dgilbert@redhat.com' RCPT:''
X-TUID: RHPpnQ1Bj32A

* Andrew Jones (drjones@redhat.com) wrote:
> On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
> > For the Aarch64, there is one machine 'virt', it is primarily meant to
> > run on KVM and execute virtualization workloads, but we need an
> > environment as faithful as possible to physical hardware, for supporting
> > firmware and OS development for pysical Aarch64 machines.
> >=20
> > This patch introduces new machine type 'Enterprise' with main features:
> >  - Based on 'virt' machine type.
> >  - Re-designed memory map.
> >  - EL2 and EL3 are enabled by default.
> >  - GIC version 3 by default.
> >  - AHCI controller attached to system bus, and then CDROM and hard disc
> >    can be added to it.
> >  - EHCI controller attached to system bus, with USB mouse and key board
> >    installed by default.
> >  - E1000E ethernet card on PCIE bus.
> >  - VGA display adaptor on PCIE bus.
> >  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
> >  - No virtio functions enabled, since this is to emulate real hardware.
>=20
> In the last review it was pointed out that using virtio-pci should still
> be "real" enough, so there's not much reason to avoid it. Well, unless
> there's some concern as to what drivers are available in the firmware and
> guest kernel. But that concern usually only applies to legacy firmwares
> and kernels, and therefore shouldn't apply to AArch64.

I think the difference from last time is Ard's comments earlier in this
thread:

    The purpose of the SBSA machine is not to provide a minimal
    configuration. It is intended to exercise all the moving parts one
    might find in a server firmware/OS stack, including pieces that are
    not usually found on x86 machines, such as DRAM starting above 4 GB
    and SATA/USB controllers that are not PCIe based.

that suggests that the intent of this board is to provide everything
which a firmware writer might want to test;  that's quite different
=66rom forming the basis of a virtualised machine for real use.

Dave


> >  - No paravirtualized fw_cfg device either.
> >=20
> > Arm Trusted Firmware and UEFI porting to this are done accordingly.
> >
>=20
> How will UEFI get the ACPI tables from QEMU without fw-cfg? I didn't
> see any sort of reserved ROM region in the patch for them.
>=20
> Thanks,
> drew
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
