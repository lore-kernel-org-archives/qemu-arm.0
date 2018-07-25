Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp872448wru;
        Wed, 25 Jul 2018 09:15:46 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf68lBzIxx3N+MEwtKuuH3AN4M7173B8xRO1joe+0ic53BNB+MZn0s09LmIqqs1mzD+1HLk
X-Received: by 2002:ac8:8f0:: with SMTP id y45-v6mr21812967qth.408.1532535346038;
        Wed, 25 Jul 2018 09:15:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532535346; cv=none;
        d=google.com; s=arc-20160816;
        b=E+0FbvRVTf9GxDleEd+GDaKsr9/uTSBiUgICiPmaBmu4Mqz1Rr6eO6LUPfdh9fh6WF
         gN77DuKaL/HDA24P+6b0KQCSVKlF/ui4wZoPD7ix/9Yf1pbxIzVfxGdQ3lDdwEqwinfe
         L5UB7FXV6/4hWpqUjgK3esgRtOKZ6b4EsDYPCs8JNSJBI2zMGOzPj1+O7C0NQzYVc6bm
         0qqtxrzpjv5fsTcsoltLMBLm6mSouoKVWDnO540Doe6Dh3mmybAW0aB5YDKMuZPbRgMO
         d5JlW0+yqnX9wCfI+wdnuH21NjTctnrBwh4V6ELf4E+tP95X+XOJhB6ftEH1/7M+PYaE
         AGLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=39l3kLfe2iNfZr3ayivF5JnhvzAuJ5ilJy7P0uRKfmM=;
        b=QyOqzmJBQ0HTnoFXumgOWQHj0aKrDz5B/JR3KTHnidTLz58DpGcdpX5EsbX88tAth9
         8sB7kx5ZAV+7/QHgUBaYKQ+CfAhYxLpN4wCqxlBiikEoWEctmuqG77mqQO0kdhVNf8H7
         7s4WA6G6mIVFUHahLaT1i2qnBCXGjGvrXpysyAAKNTkVRj7/CRGlULIn3OUolI+XsINo
         cQ7MH4XwkYHZpAR52k4WRDO4ZoL7zDMOuT7mZw9V75QGeYF2G4JUcyiuUFmC1l8OhTpn
         bW7zspdXo49d5ZPFfMxz+iTuoBvLhYXqFwCPNYFHe8mISuNr7bifbYcYLQTK9B5Die4H
         uRVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of imammedo@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id q15-v6si6698938qtn.130.2018.07.25.09.15.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Jul 2018 09:15:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of imammedo@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 452CA40216E0;
	Wed, 25 Jul 2018 16:15:45 +0000 (UTC)
Received: from localhost (ovpn-204-26.brq.redhat.com [10.40.204.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2CDD52166BA3;
	Wed, 25 Jul 2018 16:15:43 +0000 (UTC)
Date: Wed, 25 Jul 2018 18:15:42 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 peter.maydell@linaro.org, radoslaw.biernacki@linaro.org, Hongbo Zhang
 <hongbo.zhang@linaro.org>, ard.biesheuvel@linaro.org,
 qemu-devel@nongnu.org, leif.lindholm@linaro.org, qemu-arm@nongnu.org,
 alex.bennee@linaro.org
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180725181542.0c02c720@redhat.com>
In-Reply-To: <20180725113645.fthwhvzx7otrr3ya@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
	<1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
	<20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
	<20180725105040.GA2366@work-vm>
	<20180725113645.fthwhvzx7otrr3ya@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Wed, 25 Jul 2018 16:15:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Wed, 25 Jul 2018 16:15:45 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-TUID: WWUkbVz+iFNI

On Wed, 25 Jul 2018 13:36:45 +0200
Andrew Jones <drjones@redhat.com> wrote:

> On Wed, Jul 25, 2018 at 11:50:41AM +0100, Dr. David Alan Gilbert wrote:
> > * Andrew Jones (drjones@redhat.com) wrote:  
> > > On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:  
> > > > For the Aarch64, there is one machine 'virt', it is primarily meant to
> > > > run on KVM and execute virtualization workloads, but we need an
> > > > environment as faithful as possible to physical hardware, for supporting
> > > > firmware and OS development for pysical Aarch64 machines.
> > > > 
> > > > This patch introduces new machine type 'Enterprise' with main features:
> > > >  - Based on 'virt' machine type.
> > > >  - Re-designed memory map.
> > > >  - EL2 and EL3 are enabled by default.
> > > >  - GIC version 3 by default.
> > > >  - AHCI controller attached to system bus, and then CDROM and hard disc
> > > >    can be added to it.
> > > >  - EHCI controller attached to system bus, with USB mouse and key board
> > > >    installed by default.
> > > >  - E1000E ethernet card on PCIE bus.
> > > >  - VGA display adaptor on PCIE bus.
> > > >  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
> > > >  - No virtio functions enabled, since this is to emulate real hardware.  
> > > 
> > > In the last review it was pointed out that using virtio-pci should still
> > > be "real" enough, so there's not much reason to avoid it. Well, unless
> > > there's some concern as to what drivers are available in the firmware and
> > > guest kernel. But that concern usually only applies to legacy firmwares
> > > and kernels, and therefore shouldn't apply to AArch64.  
> > 
> > I think the difference from last time is Ard's comments earlier in this
> > thread:
> > 
> >     The purpose of the SBSA machine is not to provide a minimal
> >     configuration. It is intended to exercise all the moving parts one
> >     might find in a server firmware/OS stack, including pieces that are
> >     not usually found on x86 machines, such as DRAM starting above 4 GB
> >     and SATA/USB controllers that are not PCIe based.
> > 
> > that suggests that the intent of this board is to provide everything
> > which a firmware writer might want to test;  that's quite different
> > from forming the basis of a virtualised machine for real use.
> >  
> 
> I think I understand the purpose, and I also don't believe anything I've
> said is counter to it. Whether or not one drives a virtio-pci nic with a
> virtio-pci-net driver or drives an E1000e, also on the PCIe bus, makes
> little difference to the firmware, nor to the guest kernel - besides which
> driver gets used. And, nothing stops somebody from not plugging the
> virtio-pci nic (use -nodefaults) and then plugging the E1000e (-device)
> instead. Machine models don't need to hard code these assumptions. For
> this patch it'd probably be best if we just ensured there were no
> default devices at all, rather than replace one with another.

with that thinking it might be better to put this machine in completely
different file so not mess with 'production' virt machine code and
call it intentionally ambiguous: "[linaro|generic|dev|...]_armv8"
so it would be just another sbsa compliant board with  a bunch of
default devices needed for testing purposes if users/authors think
that it serves their purpose better.

> Thanks,
> drew
> 
