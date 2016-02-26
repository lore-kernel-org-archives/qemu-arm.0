Received: by 10.25.208.211 with SMTP id h202csp3225754lfg;
        Fri, 26 Feb 2016 00:05:34 -0800 (PST)
X-Received: by 10.55.201.219 with SMTP id m88mr199056qkl.41.1456473934194;
        Fri, 26 Feb 2016 00:05:34 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id j19si12116854qhc.69.2016.02.26.00.05.33;
        Fri, 26 Feb 2016 00:05:34 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dkim=neutral (body hash did not verify) header.i=@linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 9DA594130B;
	Fri, 26 Feb 2016 02:58:42 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.209
X-Spam-Level: 
X-Spam-Status: No, score=0.209 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_LOW=-0.7,
	T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jEwZnphoj3Hr; Fri, 26 Feb 2016 02:58:41 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 7BCEE4852F;
	Fri, 26 Feb 2016 02:58:41 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 18B8948529
 for <kvmarm@lists.cs.columbia.edu>; Fri, 26 Feb 2016 02:58:41 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Az66pFY1VLBn for <kvmarm@lists.cs.columbia.edu>;
 Fri, 26 Feb 2016 02:58:39 -0500 (EST)
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id B63804130B
 for <kvmarm@lists.cs.columbia.edu>; Fri, 26 Feb 2016 02:58:39 -0500 (EST)
Received: by mail-wm0-f50.google.com with SMTP id g62so61587959wme.1
 for <kvmarm@lists.cs.columbia.edu>; Fri, 26 Feb 2016 00:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=F8QtcBczzHdbewahlta1qfsWjLU5PjTdYCB9BLaUHZM=;
 b=KDMXxeUhJdL9mUQEJ70mMOn6bUGlLLsqlj1FyY8iqvMf4J7uy0GPcxUGQLen/EKBx4
 GfZvGnSNumyQkNI8mqmBj4v/n8fCsbsZmtaDEfuNaA+v8iEq1ZODMUTYcN63axIRp+jL
 3sP43mNSDDBJeG0JCkOJRqiWYRO3mX9zSDZHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=F8QtcBczzHdbewahlta1qfsWjLU5PjTdYCB9BLaUHZM=;
 b=MwwkX4C7icRByIorJ5ZpOvxEKOyFb89UP1Ogx749h94ywUffA6DhfK+icinrXnkKgx
 JT7sgmYatLEYZiWMstfZVkIDjQHxiA+g7FVGwM/k9FmWXCyzUj22wK4BbGPGwiLz1izQ
 E2Xr71zoMtSq7fm2i99frHiyRSKBSrjwSgDWE1PahC0SUcFS1gnXEr1Gev7Nf9SnqaCn
 IPwM2LxmW3QRjA58SvWyoMSrVJb9fq7QV08w+U995W1cKzniQlxjfX4hG6/1eH1OE7a7
 GlRBSPDByT9GDkAXxoG+QihmlCHYXRGjrLefw598xo3uKUt4YDyaAAMbXs9i+lfX6AsY
 3nqQ==
X-Gm-Message-State: AD7BkJKJaHgsWIz74ywaxFkrL3YwhZBUIDAOGBls7irfPpwtQwggeQuUIFtmKhWjACS4T9nm
X-Received: by 10.194.112.98 with SMTP id ip2mr281044wjb.24.1456473929485;
 Fri, 26 Feb 2016 00:05:29 -0800 (PST)
Received: from localhost ([94.18.191.146])
 by smtp.gmail.com with ESMTPSA id w66sm1765734wmd.2.2016.02.26.00.05.28
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Fri, 26 Feb 2016 00:05:28 -0800 (PST)
Date: Fri, 26 Feb 2016 09:06:31 +0100
From: Christoffer Dall <christoffer.dall@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-devel] [PATCH] virt: Lift the maximum RAM limit from 30GB
 to 255GB
Message-ID: <20160226080631.GB9352@cbox>
References: <1456402182-11651-1-git-send-email-peter.maydell@linaro.org>
 <CAFEAcA9d6u=2GLo5UEXGPzb=9bZNnk-CgEOt=235giCdPTW_pw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFEAcA9d6u=2GLo5UEXGPzb=9bZNnk-CgEOt=235giCdPTW_pw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Marc Zyngier <marc.zyngier@arm.com>, qemu-arm <qemu-arm@nongnu.org>,
 "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
 QEMU Developers <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: P7vqURD5w4Al

On Thu, Feb 25, 2016 at 04:51:51PM +0000, Peter Maydell wrote:
> [Typoed the kvmarm list address; sorry... -- PMM]
> 
> On 25 February 2016 at 12:09, Peter Maydell <peter.maydell@linaro.org> wrote:
> > The virt board restricts guests to only 30GB of RAM. This is a
> > hangover from the vexpress-a15 board, and there's inherent reason

did you mean "there's *no* inherent reason" ?

> > for it. 30GB is smaller than you might reasonably want to provision
> > a VM for on a beefy server machine. Raise the limit to 255GB.
> >
> > We choose 255GB because the available space we currently have
> > below the 1TB boundary is up to the 512GB mark, but we don't
> > want to paint ourselves into a corner by assigning it all to
> > RAM. So we make half of it available for RAM, with the 256GB..512GB
> > range available for future non-RAM expansion purposes.
> >
> > If we need to provide more RAM to VMs in the future then we need to:
> >  * allocate a second bank of RAM starting at 2TB and working up
> >  * fix the DT and ACPI table generation code in QEMU to correctly
> >    report two split lumps of RAM to the guest
> >  * fix KVM in the host kernel to allow guests with >40 bit address spaces
> >
> > The last of these is obviously the trickiest, but it seems
> > reasonable to assume that anybody configuring a VM with a quarter
> > of a terabyte of RAM will be doing it on a host with more than a
> > terabyte of physical address space.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > CC'ing kvm-arm as a heads-up that my proposal here is to make
> > the kernel devs do the heavy lifting for supporting >255GB.
> > Discussion welcome on whether I have the tradeoffs here right.

I think so, this looks good to me.

> > ---
> >  hw/arm/virt.c | 21 +++++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 44bbbea..7a56b46 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -95,6 +95,23 @@ typedef struct {
> >  #define VIRT_MACHINE_CLASS(klass) \
> >      OBJECT_CLASS_CHECK(VirtMachineClass, klass, TYPE_VIRT_MACHINE)
> >
> > +/* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
> > + * RAM can go up to the 256GB mark, leaving 256GB of the physical
> > + * address space unallocated and free for future use between 256G and 512G.
> > + * If we need to provide more RAM to VMs in the future then we need to:
> > + *  * allocate a second bank of RAM starting at 2TB and working up
> > + *  * fix the DT and ACPI table generation code in QEMU to correctly
> > + *    report two split lumps of RAM to the guest
> > + *  * fix KVM in the host kernel to allow guests with >40 bit address spaces
> > + * (We don't want to fill all the way up to 512GB with RAM because
> > + * we might want it for non-RAM purposes later. Conversely it seems
> > + * reasonable to assume that anybody configuring a VM with a quarter
> > + * of a terabyte of RAM will be doing it on a host with more than a
> > + * terabyte of physical address space.)
> > + */
> > +#define RAMLIMIT_GB 255
> > +#define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)
> > +
> >  /* Addresses and sizes of our components.
> >   * 0..128MB is space for a flash device so we can run bootrom code such as UEFI.
> >   * 128MB..256MB is used for miscellaneous device I/O.
> > @@ -130,7 +147,7 @@ static const MemMapEntry a15memmap[] = {
> >      [VIRT_PCIE_MMIO] =          { 0x10000000, 0x2eff0000 },
> >      [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
> >      [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
> > -    [VIRT_MEM] =                { 0x40000000, 30ULL * 1024 * 1024 * 1024 },
> > +    [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
> >      /* Second PCIe window, 512GB wide at the 512GB boundary */
> >      [VIRT_PCIE_MMIO_HIGH] =   { 0x8000000000ULL, 0x8000000000ULL },
> >  };
> > @@ -1066,7 +1083,7 @@ static void machvirt_init(MachineState *machine)
> >      vbi->smp_cpus = smp_cpus;
> >
> >      if (machine->ram_size > vbi->memmap[VIRT_MEM].size) {
> > -        error_report("mach-virt: cannot model more than 30GB RAM");
> > +        error_report("mach-virt: cannot model more than %dGB RAM", RAMLIMIT_GB);
> >          exit(1);
> >      }
> >
> > --
> > 1.9.1

Reviewed-by: Christoffer Dall <christoffer.dall@linaro.org>
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
