Received: by 10.223.197.9 with SMTP id q9csp2526635wrf;
        Mon, 9 Oct 2017 07:46:44 -0700 (PDT)
X-Received: by 10.200.33.242 with SMTP id 47mr13817626qtz.301.1507560404170;
        Mon, 09 Oct 2017 07:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507560404; cv=none;
        d=google.com; s=arc-20160816;
        b=Z/F6fT/cPqAMSc3gdsXPhL/+xk+DNrSmP32twXGUZgu8+Rz0n+9CyOrM7pon42nWk6
         kAggmJ5Mvygi2Ha5rCScRKR2K+sdqVLo9lbpJ4RdNWKOesTLDG/b/TJkkvQ7Jy/9xCA4
         zXzDondOcPeMdS2bGMqdHEARrrYF2chk1y13wROwrZoTRBxX9PSgSAQRaLDKmr25PO6R
         hUv36MvtTaYfD1BbtQiJLLTqNc+cL/o9ZtFcX+AiDlttmad25KG8EN6MzD/AdOLqtBZx
         h05uutKG8d7ZeMaEITButxk+gkTaAtGnr5rV6Btzwf3ZS8sSRPeQYJUkTHWLdsoLFm6Y
         h0KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Q1+fUyyHFk+EeB9lVbLgT/U9GjOd5MZ3yNY0sGKU32I=;
        b=tjXyxUhwAEjGTtGvAjjMzQWN2LtmiiqXNzzg/kjRlUjDH59gCRxz/TxgsLmOBD5JlC
         7Rh589R+YGtChJchfM8hutyzK8BG86NCCNayQXnZQUBS7qfgnoaPtOT/GEDTBvdaQ8SD
         +1RCdbjKoPp9zrI/6iTujZSNEpSJR+W81F+Wlq/cffybcpwju8bEqb/zy3/3csS/oIfi
         hxxlu8E6acbM4Yld6Z9N2UlNDsNoI34BhLESZYSgnGSCPcRfhXHcvZ06pmuxd/cAGSXc
         DnOuGMlhvi3HzQCiJasKTkAUBGOsIOtTD0of3YwWXDDoC4ct90Wu7U9xqjyJu+9iIWdF
         1ANw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P2qS6DLx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g4si2251222qkf.99.2017.10.09.07.46.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 07:46:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P2qS6DLx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58250 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1ZKN-0007zr-Mw
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 10:46:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1ZKB-0007xx-KU
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 10:46:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1ZKA-0004UP-Hm
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 10:46:31 -0400
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:49234)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e1ZKA-0004TW-AS
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 10:46:30 -0400
Received: by mail-wm0-x236.google.com with SMTP id b189so23131634wmd.4
	for <qemu-arm@nongnu.org>; Mon, 09 Oct 2017 07:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q1+fUyyHFk+EeB9lVbLgT/U9GjOd5MZ3yNY0sGKU32I=;
	b=P2qS6DLxx6NE8Rr6Jq17AhZBSo7eXmW02pxHvhll4HLwkrmhO63WzkVjdTtx9/JXo5
	oes2OBJdZxUBJVv7jEp+aadrNGHi+JwquYbrI5y7s7LM44XtdtrNShdIvDQG4bEA5J4d
	mggxOm27d3/S++UngCEUqwYfeuEQzDr4JP+AM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q1+fUyyHFk+EeB9lVbLgT/U9GjOd5MZ3yNY0sGKU32I=;
	b=rEQJGBatDYfG4VfdQqOc8Y+JLtPuRVMzNa7BOaQ0qdp0zQ1krHX86F35mgi/UYxava
	94giQI0+sc8CbvTuBxyfWi0ONBHkIvGtPlF3ycQJQ+VcB6pyNVOYyyvxfd1C9roGLgM6
	KjAZYL8uvKHHqJdxwWDzbEz+S9qPU1B6OvOLGRKrMguDZh1IjZFfzdIUXipAxZIpQ9b/
	CnFE8Ahy1UmQGc6HEQhbo5U59zrprKdaNIh9wsCywxRctfL67u+eBKflFpymjN5rghvR
	fdf0oPPA1VPes6g2WvFmSfEyUR97NFj1rTbryDDpTkEbEt2qGtY6wHWgYwSD8UlGbWJd
	saYg==
X-Gm-Message-State: AMCzsaVl2Vml2n0ppWsF1RzixelK/xoil60DFxVhM7AeImDQjEBE0p7F
	XEb6DdLGLE5Vj9jahpn+YowCesvlYSLfRQso3T8oqA==
X-Google-Smtp-Source: AOwi7QA683aTOFXO1Msyrf151X/8aMl/buW1ilSz2EtxtiP/zKlR+sUj/o847tWXb8l+ntTCA4UCHgZPJu1xaS5CIws=
X-Received: by 10.223.186.201 with SMTP id w9mr9488908wrg.230.1507560389163;
	Mon, 09 Oct 2017 07:46:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Mon, 9 Oct 2017 07:46:08 -0700 (PDT)
In-Reply-To: <1504286483-23327-4-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-4-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Oct 2017 15:46:08 +0100
Message-ID: <CAFEAcA_N+7F__C-xdiB+HqmRY0H=8q5rzBGkxwrjhbBrgqSKPA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::236
Subject: Re: [Qemu-arm] [PATCH v7 03/20] hw/arm/smmu-common:
 smmu_read/write_sysmem
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
Cc: Radha Mohan <mohun106@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Trey Cain <tcain@qti.qualcomm.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	jean-philippe.brucker@arm.com, Tomasz Nowicki <tn@semihalf.com>,
	Will Deacon <will.deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	robin.murphy@arm.com, wtownsen@redhat.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dSNggzQCyRpA

On 1 September 2017 at 18:21, Eric Auger <eric.auger@redhat.com> wrote:
> Those two functions will be used to access configuration
> data (STE, CD) and page table entries in guest RAM.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmu-common.c         | 37 +++++++++++++++++++++++++++++++++++++
>  include/hw/arm/smmu-common.h |  5 +++++
>  2 files changed, 42 insertions(+)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 3e67992..2a94547 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -30,6 +30,43 @@
>  #include "qemu/error-report.h"
>  #include "hw/arm/smmu-common.h"
>
> +inline MemTxResult smmu_read_sysmem(dma_addr_t addr, void *buf, dma_addr_t len,
> +                                    bool secure)
> +{
> +    MemTxAttrs attrs = {.unspecified = 1, .secure = secure};

This isn't right. .unspecified = 1 means "transaction master has
not explicitly specified any attributes", but you are specifying
one (the secure one).

> +    switch (len) {
> +    case 4:
> +        *(uint32_t *)buf = ldl_le_phys(&address_space_memory, addr);
> +        break;
> +    case 8:
> +        *(uint64_t *)buf = ldq_le_phys(&address_space_memory, addr);
> +        break;
> +    default:
> +        return address_space_rw(&address_space_memory, addr,
> +                                attrs, buf, len, false);

Why do we have the special cases for 4 and 8? In particular, those
code paths will not correctly detect memory transaction failures.

> +    }
> +    return MEMTX_OK;
> +}
> +
> +inline void
> +smmu_write_sysmem(dma_addr_t addr, void *buf, dma_addr_t len, bool secure)
> +{
> +    MemTxAttrs attrs = {.unspecified = 1, .secure = secure};
> +
> +    switch (len) {
> +    case 4:
> +        stl_le_phys(&address_space_memory, addr, *(uint32_t *)buf);
> +        break;
> +    case 8:
> +        stq_le_phys(&address_space_memory, addr, *(uint64_t *)buf);
> +        break;
> +    default:
> +        address_space_rw(&address_space_memory, addr,
> +                         attrs, buf, len, true);
> +    }
> +}
> +
>  /******************/
>  /* Infrastructure */
>  /******************/
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 20f3fe6..a5999b0 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -111,4 +111,9 @@ static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
>  {
>      return  ((pci_bus_num(sdev->bus) & 0xff) << 8) | sdev->devfn;
>  }
> +
> +MemTxResult smmu_read_sysmem(dma_addr_t addr, void *buf,
> +                             dma_addr_t len, bool secure);
> +void smmu_write_sysmem(dma_addr_t addr, void *buf, dma_addr_t len, bool secure);
> +

There are so few callers of this that I'm inclined to think you
should just open code the right kind of memory accessor function
in the callsites rather than having a weird switch statement.

>  #endif  /* HW_ARM_SMMU_COMMON */
> --
> 2.5.5
>

thanks
-- PMM
