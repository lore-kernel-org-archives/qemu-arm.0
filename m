Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1574939wrq;
        Thu, 5 Jul 2018 05:58:51 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeRIVzJz+ZTPMkr8ID4wGAjAkwSigUuB3ydymJ1yplslBnv48rc9cAgIyVDDCm9yPXV+oMz
X-Received: by 2002:ac8:2191:: with SMTP id 17-v6mr5185577qty.279.1530795531861;
        Thu, 05 Jul 2018 05:58:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530795531; cv=none;
        d=google.com; s=arc-20160816;
        b=BYDHkdmzBkDZPA2zOc8v4LXdCtGJUctfIkvxkbT5E9SoEgYEZ+vRGsfprD3/2lR26Z
         s/K5GjC7MnY4Ul7O5JZQTftZXqyPbnFkHt+XCtutyBoXx9oKTSvGhs5gIOas01i/bZXK
         gprXmHn8cy2aMZ96eDRuhH0mj/FTeso8LX6EwheFOdQrV0+SFroo617fdwAlRl4o2pLL
         HIc7oC1L7xQrCl5Ua0xlK/Lzj23hwwTvEOAm0TjpkLEhTd7Xa0DQK6gidn0sewbFHATf
         fR+90X2kC7ywpeNrUPzy/EEyQXFhOB6Wrkw532MWguBxDhmuXBL8NiaMMGKumlWerp0l
         E47w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=3ZEuY5KpZFS0xOWzdWlZfmtthxKmIylxMiLSwSFAaSI=;
        b=fhRmWjFAvtw6LSMQAusTSIvzEtvj9vI8pZffv6i+XcZjm8jIBjmlDB75A41frszyHJ
         7grKRIsjOGVlT5JleC9HKmFuZ9XOP99UmOtMwJFBnHjKG9fVqGFPwRuvmAJ5IunRgOda
         /jZ2NDOYPgk7Cq0N+03ZuUIL0Mcm4UZknycZektNE35NrO5n6L2eYELsCxSmk5IopUL9
         HxSPsnRDq/e5uy8R9PTJK96En7nXz6kUFIrnz6PEH8ZzxVCKPdrV8STMnCnM4Keo75lR
         riOptNA2g5SMUV9pZcGVPdXWoYLePtNoOLnXFXYrfKtB7Raz+BAnUY2YyTZ5QGJsq7QA
         eIJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=REKRfADP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l17-v6si6084950qtf.21.2018.07.05.05.58.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jul 2018 05:58:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=REKRfADP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52587 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fb3qV-0002lV-EM
	for alex.bennee@linaro.org; Thu, 05 Jul 2018 08:58:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fb3op-0001eR-N7
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 08:57:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fb3oo-00043F-Ia
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 08:57:07 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:34078)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fb3oo-00042I-Ce
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 08:57:06 -0400
Received: by mail-oi0-x241.google.com with SMTP id 13-v6so16659363ois.1
	for <qemu-arm@nongnu.org>; Thu, 05 Jul 2018 05:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3ZEuY5KpZFS0xOWzdWlZfmtthxKmIylxMiLSwSFAaSI=;
	b=REKRfADPFW38zkgPUVl+fdcLR0BoWrH5PNHDszXkrIImo0/LWusn6SpqH5EWD7216J
	4ywHwluh4f4hw/6MJzGSrj/o1EZJHhGRHyOl9f3qa7+eibj5fiEyeCHqQmnO4naur0Ps
	x6Y3oA82uD16IS55nLuHmVMpCLAR6evM/3huQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3ZEuY5KpZFS0xOWzdWlZfmtthxKmIylxMiLSwSFAaSI=;
	b=uA1qv08Paqx0btSqtM93m5yrnOOA8+QiK6yLg6HEZ4Yx3iRxkF+xW2fu4UhrKqhvxS
	1zi5HO1XG+fn8l4R+iYBsN7xq0NHpmmZjIiKfCPvcbfSe7gOs003iHa9InEBBLPNQKhN
	2E05J4povtN57IYVLGVAg0fFJLYJjB3BeEtegSolj7f5RII4goSt7Ypy4utijlt9MPbz
	koCbHnThF9ZbJoJ9htfzvXZECmJNJ945qmWfQvDEZs5yVYwsGb2EvgAy+U+MUlqH0khr
	sPS/VR0Yv45ZAQ0RdMffXXFK2jBSAdrNv3/Sma0kxXbsUnki8d7pH29sidcKnHWSomeI
	XuXA==
X-Gm-Message-State: APt69E3QM3yU5kA6UZWR0/3qgN6InhV6u9aD41qlyY34Qxld/Sq5yCv1
	OhmGZwfFCPdv9l53kKQRAmsQjSBfCUJt5CLO+41+1A==
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr7003756oih.102.1530795425412; 
	Thu, 05 Jul 2018 05:57:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:554d:0:0:0:0:0 with HTTP;
	Thu, 5 Jul 2018 05:56:44 -0700 (PDT)
In-Reply-To: <1530775623-32399-1-git-send-email-eric.auger@redhat.com>
References: <1530775623-32399-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jul 2018 13:56:44 +0100
Message-ID: <CAFEAcA8YkDgJgr5Mgv4PgpmhQDpr+61hfaxmpnQWGXocEawxdg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH for 3.0] hw/arm/smmu-common: Fix devfn
 computation in smmu_iommu_mr
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xLamvDZ4dN2u

On 5 July 2018 at 08:27, Eric Auger <eric.auger@redhat.com> wrote:
> smmu_iommu_mr() aims at returning the IOMMUMemoryRegion corresponding
> to a given sid. The function extracts both the PCIe bus number and
> the devfn to return this data. Current computation of devfn is wrong
> as it only returns the PCIe function instead of slot | function.
>
> Fixes 32cfd7f39e08 ("hw/arm/smmuv3: Cache/invalidate config data")
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmu-common.c         | 2 +-
>  include/hw/arm/smmu-common.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 3098915..55c75d6 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -351,7 +351,7 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid)
>      bus_n = PCI_BUS_NUM(sid);
>      smmu_bus = smmu_find_smmu_pcibus(s, bus_n);
>      if (smmu_bus) {
> -        devfn = sid & 0x7;
> +        devfn = SMMU_PCI_DEVFN(sid);
>          smmu = smmu_bus->pbdev[devfn];
>          if (smmu) {
>              return &smmu->iommu;
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 50e2912..b07cadd 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -24,6 +24,7 @@
>
>  #define SMMU_PCI_BUS_MAX      256
>  #define SMMU_PCI_DEVFN_MAX    256
> +#define SMMU_PCI_DEVFN(sid)   (sid & 0xFF)
>
>  #define SMMU_MAX_VA_BITS      48

Applied to target-arm.next, thanks.

As I was reviewing this, I checked where we allocate the pbdev array
to confirm that it's big enough (which it is), and I noticed an oddity:
in include/hw/arm/smmu-common.h we define the SMMUPciBus struct like this:

typedef struct SMMUPciBus {
    PCIBus       *bus;
    SMMUDevice   *pbdev[0]; /* Parent array is sparse, so dynamically alloc */
} SMMUPciBus;

but in fact we don't ever have local variables of this type and the
only place we dynamically allocate them is in smmu_find_add_as(),
which does
        sbus = g_malloc0(sizeof(SMMUPciBus) +
                         sizeof(SMMUDevice *) * SMMU_PCI_DEVFN_MAX);

Is there a reason I missed why we don't just define the struct
to have
  SMMUDevice *pbdev[SMMU_PCI_DEVFN_MAX];
?

thanks
-- PMM
