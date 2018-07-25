Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp594761wru;
        Wed, 25 Jul 2018 04:36:50 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpek0rbCunbrhKedpmtQOW0MkVOYq2e5vdbmkN9s7kGTlVss7KkvTG5ch35pIQuEOIrILjKP
X-Received: by 2002:ac8:1928:: with SMTP id t37-v6mr19639043qtj.327.1532518609937;
        Wed, 25 Jul 2018 04:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532518609; cv=none;
        d=google.com; s=arc-20160816;
        b=Jx/MHtVuX3CQr7ct4vw/eBPCs5fmdooZ6X8Jx8AwlIytDt+GptWQ0I/AA8eGd017hA
         F8PvLu2jwuka7whBBTiWPk8WeQsdxbJqSXIG+PkMb3IoZdIQLYKN+b1YAR9dtazYe6kv
         2Fk1Rh9IccQFj+Vjw7lv2+y8+nCdrLFoNVwjx85kyTzNCvsLKEm9XbhxsQnje7yQABVj
         N9PZuaOWIDbEOio/oJrVizNtoriFfXcouuTUaulVoQ4wC8K/p/YFGDvp2oK0bL88l1FN
         iIiwEIPoWJRZwgLHNMTewtQowvV6lpfUThAIRr3Zn2m4xwnmoiLrUZKp6JpbFu2ZzM29
         w56w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=drF5f305/AcYz3CrlpppjAO1kSAm2Xr41EcCBS9eMS8=;
        b=dmnpQt8/KvvBqK4KxwAHbSXGan5aKjlc7M2l+N4+sYP4wXUGn8OHmrb01/PbRr7cjG
         Asne2sl8F1grFAuhpl65yLsjiVM8EKPVXQLeANPWRE61eHenrys3QLoVBDCeMm7xcXjy
         I1+N5ce/Pb/3ZA5y1GumbQcD978gxAqbfjbSESmmeaHb4/jJkaPyJa6WDAr1ho8fJR7V
         Hbgs8KTBwJtrMrAFeMIPPGCMt9HxKpczgkxzYm+PW4sflqw5L1PnXUzLdhGeRfYaBscC
         l+Gsi8n527nRhIz23TI8NefpZyHZhKjTYSBw9oXh45SLyh/1Oxp1PLtib+coFHczqzoC
         Oobw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id v89-v6si6774410qkv.257.2018.07.25.04.36.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Jul 2018 04:36:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 62F2D87A76;
	Wed, 25 Jul 2018 11:36:49 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1A76178B2;
	Wed, 25 Jul 2018 11:36:47 +0000 (UTC)
Date: Wed, 25 Jul 2018 13:36:45 +0200
From: Andrew Jones <drjones@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, radoslaw.biernacki@linaro.org,
	ard.biesheuvel@linaro.org, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, leif.lindholm@linaro.org,
	qemu-arm@nongnu.org, alex.bennee@linaro.org
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180725113645.fthwhvzx7otrr3ya@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <20180725105040.GA2366@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180725105040.GA2366@work-vm>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Wed, 25 Jul 2018 11:36:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Wed, 25 Jul 2018 11:36:49 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-TUID: bwdtjDPYIeRA

On Wed, Jul 25, 2018 at 11:50:41AM +0100, Dr. David Alan Gilbert wrote:
> * Andrew Jones (drjones@redhat.com) wrote:
> > On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
> > > For the Aarch64, there is one machine 'virt', it is primarily meant to
> > > run on KVM and execute virtualization workloads, but we need an
> > > environment as faithful as possible to physical hardware, for supporting
> > > firmware and OS development for pysical Aarch64 machines.
> > > 
> > > This patch introduces new machine type 'Enterprise' with main features:
> > >  - Based on 'virt' machine type.
> > >  - Re-designed memory map.
> > >  - EL2 and EL3 are enabled by default.
> > >  - GIC version 3 by default.
> > >  - AHCI controller attached to system bus, and then CDROM and hard disc
> > >    can be added to it.
> > >  - EHCI controller attached to system bus, with USB mouse and key board
> > >    installed by default.
> > >  - E1000E ethernet card on PCIE bus.
> > >  - VGA display adaptor on PCIE bus.
> > >  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
> > >  - No virtio functions enabled, since this is to emulate real hardware.
> > 
> > In the last review it was pointed out that using virtio-pci should still
> > be "real" enough, so there's not much reason to avoid it. Well, unless
> > there's some concern as to what drivers are available in the firmware and
> > guest kernel. But that concern usually only applies to legacy firmwares
> > and kernels, and therefore shouldn't apply to AArch64.
> 
> I think the difference from last time is Ard's comments earlier in this
> thread:
> 
>     The purpose of the SBSA machine is not to provide a minimal
>     configuration. It is intended to exercise all the moving parts one
>     might find in a server firmware/OS stack, including pieces that are
>     not usually found on x86 machines, such as DRAM starting above 4 GB
>     and SATA/USB controllers that are not PCIe based.
> 
> that suggests that the intent of this board is to provide everything
> which a firmware writer might want to test;  that's quite different
> from forming the basis of a virtualised machine for real use.
>

I think I understand the purpose, and I also don't believe anything I've
said is counter to it. Whether or not one drives a virtio-pci nic with a
virtio-pci-net driver or drives an E1000e, also on the PCIe bus, makes
little difference to the firmware, nor to the guest kernel - besides which
driver gets used. And, nothing stops somebody from not plugging the
virtio-pci nic (use -nodefaults) and then plugging the E1000e (-device)
instead. Machine models don't need to hard code these assumptions. For
this patch it'd probably be best if we just ensured there were no
default devices at all, rather than replace one with another.

Thanks,
drew
