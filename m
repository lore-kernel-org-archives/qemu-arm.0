Received: by 10.25.44.15 with SMTP id s15csp3675593lfs;
        Mon, 10 Jul 2017 10:11:44 -0700 (PDT)
X-Received: by 10.237.39.135 with SMTP id a7mr5479706qtd.164.1499706704594;
        Mon, 10 Jul 2017 10:11:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499706704; cv=none;
        d=google.com; s=arc-20160816;
        b=lhvS5gpHC4VA9jaFa57zul95Kecc+9b4j50Mhhbq29LwDBl2Y2pUPhstBhIq7nzNlb
         6AJFyzRxWes1gqeI1tl1rTCFqMabNk3ec+6uaTvfvPwPm/KhnAV1OrRYMd1q3MTluQIy
         4THpJVTLSRb174VzGoDSPt0GCtxePju4GKcSvAewaz37ijMH8QOnCmVt679GVupqXnDz
         PyB2D5veR4xkz/JhUc5SVx9/IL1g2X3xChUl5bHF8/+UMJd4ZtMeIDlqSlIaB1BLW41h
         C3Uy637IhJF3C8j69QSe1Qyx7BHAUXho52Kcic/8hvKyhG51PZKil9VNjBgt6ZNNq2Wh
         U5ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=2ZUKx30a4RpNTaO51RUr+gYtXSpUm0kGD5+Vlcqr37s=;
        b=C7RjIy1VOcOA+A+fBgERxzHJuuEs1hBuGS4zYngN1giZTxQPd7e9aZh9WQXDU75kHA
         etVk5Q6zimNotIuYjJwRl2dHRyjcaT+IKbHz7ZAg3eSIlfxnLQudx0s9DN2FW9dLCFxC
         fkXfSeByTqwlRd4Nnk2YOsElCjHNp49qpWscJckjfbo5WK+W3Rqu4jLBVgT9Egq+fh9T
         mBWylL/bly3LG/mwbFYZNrhVRRE/sOmwdJHAH8H7/wcjevIe85NJfUFShETePoVWG4Qd
         rec8QSnX+fvQ2rZTEJI2cqPRDDX2DpcOORxq4xTCze0ch1fvNDeEzqeDxjYKmaEB1Xs5
         tyXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=iZ+0GYsF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id u185si11143278qkd.28.2017.07.10.10.11.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Jul 2017 10:11:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=iZ+0GYsF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42171 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUcDl-00057F-QX
	for alex.bennee@linaro.org; Mon, 10 Jul 2017 13:11:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUcCW-0004bH-TB
	for qemu-devel@nongnu.org; Mon, 10 Jul 2017 13:10:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUcCV-00084O-Mo
	for qemu-devel@nongnu.org; Mon, 10 Jul 2017 13:10:24 -0400
Received: from mail-wr0-x236.google.com ([2a00:1450:400c:c0c::236]:33159)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dUcCV-00082a-Ct
	for qemu-devel@nongnu.org; Mon, 10 Jul 2017 13:10:23 -0400
Received: by mail-wr0-x236.google.com with SMTP id r103so147259527wrb.0
	for <qemu-devel@nongnu.org>; Mon, 10 Jul 2017 10:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2ZUKx30a4RpNTaO51RUr+gYtXSpUm0kGD5+Vlcqr37s=;
	b=iZ+0GYsF7Dk6TgDlx1ES9Qk7d3+gwzr83u2Ey4xo3do2Ko8W92xerhkQvhb6/JsmZZ
	+tYOZTaQGhLlOv67GRheMlcPte7ycyZXBlG2rXcN412hZN1L4KeItUOIBqQ8Ucvm2+t6
	0aa94qBBd97FdvvQ+83d+RcjkVLfjxRo8EP4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2ZUKx30a4RpNTaO51RUr+gYtXSpUm0kGD5+Vlcqr37s=;
	b=SsE+AG3D4rn5fgyH9GYjHCjYNT40aU3LwIOJMc508GEy5kafJZbH5qiaqjQaFhYexl
	wgl9d26vOu+9aGwWbHwDmhurt0gWvR3Oc1dfiIUM/2fbUG8oHwBXoAtUmpJ3JoiKPb+n
	IRHANgGfCdF5Agby6hB5r5v/ouQD2Uq1466rZ9vu8tvUNiFlGUn622kWyurrzZ6cN6Bt
	YZGl91mUWXd8fZL6yKsCmN1q4doRcQjpwnpzW8gX8Iiz54R8XR8GKvSN3hg0IWP+dRQO
	r1OEPkHBBT2bvxb0in4x0JjofOAmKU1ZR8+lzi81fD9ScvC2RwWulk5OVRYs+kkz6ZJO
	0E2Q==
X-Gm-Message-State: AIVw110gzwc52r1SkL7uwNoauaHcNUMB5B3HFwUuxvxIp4DZ+akX8J3V
	ewsz/sQUAvh972IaAgbpREEsFhVE9w8X
X-Received: by 10.28.129.203 with SMTP id c194mr3163637wmd.120.1499706622200; 
	Mon, 10 Jul 2017 10:10:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Mon, 10 Jul 2017 10:10:01 -0700 (PDT)
In-Reply-To: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jul 2017 18:10:01 +0100
Message-ID: <CAFEAcA_Zd1kFdv11Pbh9=_Hu2uBvULxPHbk15ot-uKGpzw4s3A@mail.gmail.com>
To: Diana Craciun <diana.craciun@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::236
Subject: Re: [Qemu-devel] [PATCH v2 0/2] Add global device ID in virt machine
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger@redhat.com>,
	Mihai Claudiu Caraman <mike.caraman@nxp.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Marcel Apfelbaum <marcel@redhat.com>, bharat.bhushan@nxp.com,
	Christoffer Dall <christoffer.dall@linaro.org>, laurentiu.tudor@nxp.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZGwyEX73FR+9

On 23 May 2017 at 12:12, Diana Craciun <diana.craciun@nxp.com> wrote:
> The NXP DPAA2 is a hardware architecture designed for high-speeed network
> packet processing. The DPAA2 hardware components are managed by a hardware
> component called the Management Complex (or MC) which provides an
> object-base abstraction for software drivers to use the DPAA2 hardware.
> For more details you can see:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/fsl-mc/README.txt?h=v4.10
>
> The interrupts generated by the DPAA2 hardware components are MSIs. We will add
> support for direct assigning these DPAA2 components/objects to a virtual
> machine. However, this will add the need to expand the MSI usage in QEMU.
>
> Currently the MSIs in QEMU are pretty much tied to PCI. For ARM the
> GIC ITS is using a device ID for interrupt translation. Currently, for
> PCI, the requester ID is used as device ID. This will not work when
> we add another entity that needs also a device ID which is supposed to
> be unique across the system.
>
> My proposal is to add a static allocation in the virt machine. I considered
> that this allocation is specific to each machine/platform. Currently only
> virt machine has it, but other implementations may use the same mechanism
> as well.
> So, I used a static allocation with this formula:
>
> DeviceID = zero_extend( RequesterID[15:0] ) + 0x10000 * Constant
>
> This formula was taken from SBSA spec (Appendix I: DeviceID generation and
> ITS groups). In case of QEMU the constant will be different for each entity.
> In this way a unique DeviceID will be generated and the device ID will be
> derived from a requesterID (in case of PCI) or other means in case of other
> entities.
>
> The implementation is generic as there might be in the future other non-pci devices
> that are using MSIs or IOMMU. Any architecture can use it, though currently
> only the ARM architecture is using the function that retrieves the stream ID. I
> did not change all the replacements of the pci_requester_id (with pci_stream_id)
> in the code (although if the constant is 0, the stream_id is equal with requester_id).
> The other architectures (e.g. intel iommu code) assume that the ID is the
> requester ID.
>
> Tested on NXP LS2080 platform.

So I'm still a bit confused about what this is for and what the
relationship is with how the equivalent task would be performed
in real hardware. Can you explain how that works, please?
Would there be a system MMU involved somewhere that would be
allocating these IDs somehow?

The patchset also seems to be introducing a fair amount of
mechanism without also implementing the actual use for it -- yes,
if we had two PCI controllers in the virt board we would need to
sort something out I guess, but we don't, we only have one.
Evaluating whether the mechanism makes sense without its major
user is always trickier.

Essentially, I know very little about this use case, but my
default position is that if in doubt we should aim to match
how real hardware handles something. Virtualization-specific
code, and especially something specific to a niche use case like
this, is something I'd really prefer to avoid. The ideal is to
have something like PCI device passthrough, where the guest can
automatically probe for things and QEMU doesn't need to get
involved.

I was hoping Eric would review this, since he's more up to speed
on direct hardware passthrough than I am, but I think he's just
gone off on holiday...

thanks
-- PMM
