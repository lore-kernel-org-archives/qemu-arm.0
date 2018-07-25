Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp505139wru;
        Wed, 25 Jul 2018 02:54:30 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfepJt5xpbDNpJTrhohMvG3QX3prL4/y5/GmxQqV7RS8mXX2K6iLPAEy9YiCH1ahZY5uCLr
X-Received: by 2002:a0c:9e5a:: with SMTP id z26-v6mr18416201qve.15.1532512470731;
        Wed, 25 Jul 2018 02:54:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532512470; cv=none;
        d=google.com; s=arc-20160816;
        b=WQqkoKLfVQtTrUzTATbTh0gCoWCGYHPGXZhBfRvePMwZY+6230L3DlnWNOXHNiFRTx
         jDCYHxcD65GbEeMHsCzz1OJPFfoDTv2QH9vOTzg8n5KlR6x6q71ygIy7QZ1qroqEjWpr
         zpIXT2AN8JqKh1ehcBOeyf/gO6tnPnMgNQxG9OEI8gaTbBDkr4f7i11y8qpZNzYc3UJ0
         9GLxFfkZwtdGQUC+uyOCRnZTf4XC3DekQTenGfUdW8MJ7bJjq1oRIdPh5o/TCH75nX7e
         iNSJ8O6lStzuQs2Z9wkaCOgM1+ZXLFUJo33hj0JMrGbnuF82t7XBHCMGK10pJFQJ6CrO
         VH2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=NhgwGdSWHdswC+BCxu6Qo/s1Pubxp0J6u9tCaRTKOTI=;
        b=UaEH4Q3uwxg+CDXi3x/hYuGmEFJLk3N0jCVnb9mwvj0Sksh7e3JgLikl7H846tZS/4
         eI2hwCbNDM3jmmDeTly+sTa/VwoZuY5n3HqZBEvIcNY4PGNUrCDk1OQGhCR0DBtOrHxG
         AqfH9IN3BA31nyKIt9JgT2ckQ8MthkJN1xdPoDhjkj+YPHyASxG0zQgfauYaocCB/VLL
         mCJBNdeTvISlKnN5PolIFeTchjJXyNmm68XdfZaDX8XDQIensp74oj3HxjEh7kdhSd4M
         jCGrTac3kzGtgVFFTYZWejzOc1AgcZX6cLrirBtfvUsyDBMBnAdXyeTQUbVuwPkJ26gG
         CxcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id x58-v6si12588554qtj.117.2018.07.25.02.54.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Jul 2018 02:54:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B7394219DA3;
	Wed, 25 Jul 2018 09:54:30 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBA55111DCE5;
	Wed, 25 Jul 2018 09:54:28 +0000 (UTC)
Date: Wed, 25 Jul 2018 11:54:26 +0200
From: Andrew Jones <drjones@redhat.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, radoslaw.biernacki@linaro.org,
	leif.lindholm@linaro.org, ard.biesheuvel@linaro.org
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Wed, 25 Jul 2018 09:54:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Wed, 25 Jul 2018 09:54:30 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-TUID: Ff1zQysU6T8F

On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
> For the Aarch64, there is one machine 'virt', it is primarily meant to
> run on KVM and execute virtualization workloads, but we need an
> environment as faithful as possible to physical hardware, for supporting
> firmware and OS development for pysical Aarch64 machines.
> 
> This patch introduces new machine type 'Enterprise' with main features:
>  - Based on 'virt' machine type.
>  - Re-designed memory map.
>  - EL2 and EL3 are enabled by default.
>  - GIC version 3 by default.
>  - AHCI controller attached to system bus, and then CDROM and hard disc
>    can be added to it.
>  - EHCI controller attached to system bus, with USB mouse and key board
>    installed by default.
>  - E1000E ethernet card on PCIE bus.
>  - VGA display adaptor on PCIE bus.
>  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
>  - No virtio functions enabled, since this is to emulate real hardware.

In the last review it was pointed out that using virtio-pci should still
be "real" enough, so there's not much reason to avoid it. Well, unless
there's some concern as to what drivers are available in the firmware and
guest kernel. But that concern usually only applies to legacy firmwares
and kernels, and therefore shouldn't apply to AArch64.

>  - No paravirtualized fw_cfg device either.
> 
> Arm Trusted Firmware and UEFI porting to this are done accordingly.
>

How will UEFI get the ACPI tables from QEMU without fw-cfg? I didn't
see any sort of reserved ROM region in the patch for them.

Thanks,
drew
