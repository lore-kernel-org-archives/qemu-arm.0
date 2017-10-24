Received: by 10.223.161.27 with SMTP id o27csp805044wro;
        Tue, 24 Oct 2017 10:06:38 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Qo6TsaBVC5okcJN1jnVmkRtAuFlrvIqH6yyYmy+i3f0Vcw07kY9TqYKoHfn/8PeBGKS6hD
X-Received: by 10.37.85.212 with SMTP id j203mr11197700ybb.231.1508864798245;
        Tue, 24 Oct 2017 10:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508864798; cv=none;
        d=google.com; s=arc-20160816;
        b=IPo3VNkOTsIOfY6A1yRKeiykQmfJhObPoO2VoLvyHcSt7QIZsnDECJM7HgXZyZn0fk
         AsUP8gd4OnAH+IrxgfP3qJahVMTfx0B2HYUm0oNgoNZvFzMW6FMg0cKEZlTFWjR0LsID
         gg4SVnFKuDxEK40M+EOmz4PAzHHxqwHPRGTBHEysosRy9GcnzGGeBCg6COrbhiwgkovi
         fDL2lQIblLEpOK+Mb0DPqFoMkaGqgq6cPAl+Vfd/ldDcRSUbJOv+A0VZHaaf6PuXLl/l
         w5thNlM7ZOXFg3RFNeeHXTKdXe+GGIPkU5WJEA7Dhm5IDgEnSRJg3v14hz8QptuthXjc
         2Enw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=dT6cBd45/nd4R2KMW4UEt9s1qotX3I7ncaMXaB3cDfc=;
        b=0YreWPx3YBk+tQqJIHBhK55HdeCn+FUseKUnJCWs4ueVrdYEb9enkXwV0v8b7uaVFm
         OfxSyXWTkkfKG+cipw1eV06RyTQe42aBaCRma6Gai+5Ti9UHzoXELrlT1mgPomibBgn7
         4rlzebCSPlU+aMfFc6/8WiA9JsO5Kv1Q0PFXQEBVfpZcxK3UdCcPysxxZ6A/KkgebopI
         MNEx0QszLJjRYEmXC72pDwVx6kmRPcsS+2wlW+IEdBABrcPQR1qUhUoYjHYRlyAg628m
         lg4mzW7thkBpciw8bOxdSZwGSHGEEbct35MsE3odyRZiodfbOLjudF6awc7g74TizVB9
         Lfrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=adwK4Qu2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 64si108566ybv.435.2017.10.24.10.06.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Oct 2017 10:06:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=adwK4Qu2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44838 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e72ez-0002fp-MR
	for alex.bennee@linaro.org; Tue, 24 Oct 2017 13:06:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1e72en-0002eh-TY
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 13:06:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linuc.decode@gmail.com>) id 1e72ej-0000n3-8a
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 13:06:25 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:53608)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linuc.decode@gmail.com>)
	id 1e72ej-0000mb-2W; Tue, 24 Oct 2017 13:06:21 -0400
Received: by mail-pg0-x241.google.com with SMTP id s2so15018209pge.10;
	Tue, 24 Oct 2017 10:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=dT6cBd45/nd4R2KMW4UEt9s1qotX3I7ncaMXaB3cDfc=;
	b=adwK4Qu2plZLha0p2FkwK1dw6/F4JeyhUgDJaKc//PrltNtl+QSbrbYd2+aX3mjsd1
	ZuZwYc8raFXglN1FsvKff75SwNXMvevDjQ96DwhlOBN4ndZw5pVBESt75fWvbdkhOU/F
	y7myyiL5m350O+D6dyJyJ8sP9kUIgK+Q0IEjWi8TLclJMkuyj5UnMaEQklwirQVryRyO
	8dlqmD/V1npZP91bQ5l89UKECtjCGrSJLSILpL1ppOIERHj9NZYAbKOfx498W5Eq78Xh
	cugi+9aDqbv7qa8+sLkKP7b0l4AnXabQsOu4ZvW/Ln6kqI9GMrm4Qpa2y/SmGGY+CLoh
	QucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=dT6cBd45/nd4R2KMW4UEt9s1qotX3I7ncaMXaB3cDfc=;
	b=Qs/Us2Z2httDkCdZtFRcbVOTx/eWkjjbxGLm8m/RzBA05IwZHWcGwHBHkOQRajFJCI
	ewaZHIKH5wTMzmZC0DEUuKv3T++NoX1sTdZlUkXA/4AjmAcEcKF+dkvfLqfD1ijWyhG4
	p9sX4yNVFjRhqm+gkUZdO8fA4bKewvKyxiW1Pny8LZGcnSrg3IkFVezcmDLM/+61U6kn
	U8ShaYePfX2VfqDq43ZPgBtvgA4gHC4Jbxbfj46IfhTDlOmRxQ710lHbe9wxELQ71pcX
	RggBhU8xopIGkV4AUxIRcy/G9Qo42rpgckpHtjL4TqekVIPZJ4y0eJeVeYhGUezeefgF
	o6nA==
X-Gm-Message-State: AMCzsaXdw0RoTkON17rdsAstWtOtP/7CeeWbQja7c0+/IJRORWEqsFXU
	O9E5+1vfJVtseKtwpjFL5zI=
X-Received: by 10.84.238.203 with SMTP id l11mr13325434pln.194.1508864779983; 
	Tue, 24 Oct 2017 10:06:19 -0700 (PDT)
Received: from linu-Latitude-E5470 ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	125sm1445928pff.14.2017.10.24.10.06.11
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Tue, 24 Oct 2017 10:06:18 -0700 (PDT)
Date: Tue, 24 Oct 2017 22:36:07 +0530
From: Linu Cherian <linuc.decode@gmail.com>
To: Will Deacon <will.deacon@arm.com>
Message-ID: <20171024170607.GA4906@linu-Latitude-E5470>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<20171024053802.GA22835@virtx40> <20171024102029.GE17909@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171024102029.GE17909@arm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: Re: [Qemu-arm] [PATCH v7 00/20] ARM SMMUv3 Emulation Support
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mohun106@gmail.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, bharat.bhushan@nxp.com, mst@redhat.com,
	qemu-devel@nongnu.org, peterx@redhat.com,
	Eric Auger <eric.auger@redhat.com>, alex.williamson@redhat.com,
	qemu-arm@nongnu.org, christoffer.dall@linaro.org,
	linu.cherian@cavium.com, wtownsen@redhat.com,
	robin.murphy@arm.com, prem.mallappa@gmail.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +gpqHiy6JG5S

Hi Will,

On Tue, Oct 24, 2017 at 11:20:29AM +0100, Will Deacon wrote:
> On Tue, Oct 24, 2017 at 11:08:02AM +0530, Linu Cherian wrote:
> > On Fri Sep 01, 2017 at 07:21:03PM +0200, Eric Auger wrote:
> > > This series implements the emulation code for ARM SMMUv3.
> > > 
> > > Changes since v6:
> > > - DPDK testpmd now running on guest with 2 assigned VFs
> > > - Changed the instantiation method: add the following option to
> > >   the QEMU command line
> > >   -device smmuv3 # for virtio/vhost use cases
> > >   -device smmuv3,caching-mode # for vfio use cases (based on [1])
> > > - splitted the series into smaller patches to allow the review
> > > - the VFIO integration based on "tlbi-on-map" smmuv3 driver
> > >   is isolated from the rest: last 2 patches, not for upstream.
> > >   This is shipped for testing/bench until a better solution is found.
> > > - Reworked permission flag checks and event generation
> > > 
> > > testing:
> > > - in dt and ACPI modes
> > > - virtio-net-pci and vhost-net devices using dma ops with various
> > >   guest page sizes [2]
> > > - assigned VFs using dma ops [3]:
> > >   - AMD Overdrive and igbvf passthrough (using gsi direct mapping)
> > >   - Cavium ThunderX and ixgbevf passthrough (using KVM MSI routing)
> > > - DPDK testpmd on guest running with VFIO user space drivers (2 igbvf) [3]
> > >   with guest and host page size equal (4kB)
> > > 
> > > Known limitations:
> > > - no VMSAv8-32 suport
> > > - no nested stage support (S1 + S2)
> > > - no support for HYP mappings
> > > - register fine emulation, commands, interrupts and errors were
> > >   not accurately tested. Handling is sufficient to run use cases
> > >   described above though.
> > > - interrupts and event generation not observed yet.
> > > 
> > > Best Regards
> > > 
> > > Eric
> > >
> > 
> > Was looking at options to get rid of the existing hacks we have
> > in this implementation (last two patches) and also to reduce the map/unmap/translation 
> > overhead for the guest kernel devices.
> > 
> > Interestingly, the nested stage translation + smmu emulation at kernel
> >  that we were exploring, has been already tried by Will Deacon. 
> > https://www.linuxplumbersconf.org/2014/ocw/system/presentations/2019/original/vsmmu-lpc14.pdf
> > https://lists.gnu.org/archive/html/qemu-devel/2015-06/msg03379.html
> > 
> > 
> > It would be nice to understand, why this solution was not pursued atleast for vfio-pci devices.
> > OR
> > If you have already plans to do nested stage support in the future, would be interested to know 
> > about it.
> 
> I don't plan to revive that code. I got something well on the way to working
> for SMMUv2, but it had some pretty major issues:
> 
> 1. A huge amount of emulation code in the kernel
> 2. A horribly complicated user ABI
> 3. Keeping track of internal hardware caching state was a nightmare, so
>    over-invalidation was rife
> 4. Errata workarounds meant trapping all SMMU accesses (inc. for stage 1)
> 5. I remember having issues with interrupts, but this was likely
>    SMMUv2-specific
> 6. There was no scope for code re-use with other SMMU implementations (e.g.
>    SMMUv3)
> 
> Overall, it was just an unmaintainable, non-performant
> security-flaw-waiting-to-happen so I parked it. That's some of the
> background behind me preferring a virtio-iommu approach, because there's
> the potential for kernel acceleration using something like vhost.
> 
> Will

Thanks for the explanation.
