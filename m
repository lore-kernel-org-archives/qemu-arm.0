Received: by 10.25.0.6 with SMTP id 6csp1886704lfa;
        Tue, 30 May 2017 09:05:40 -0700 (PDT)
X-Received: by 10.200.40.87 with SMTP id 23mr26129740qtr.37.1496160340384;
        Tue, 30 May 2017 09:05:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496160340; cv=none;
        d=google.com; s=arc-20160816;
        b=MG5Our1xhRVXq0qytBoiUcNQ1zU/FV/IbEf3OZyaFFpjg98a9I4p83sCm8IXUzCnqS
         SM/GCJOpPM1Xi/INHIgSl6jXgHgROVFi38mnEtvZaYRzb9kV3EMPcFcOjBhD1p+H14DP
         qDghhWo2sApMPxJuxp6O4e7jEvea6cmfRkpZGzAUDteOY7KZeMQa24ISp7/L/7/gL4tL
         RSriaxbzckvnhGh6y4lFoqO3NYbqrYzRR+0RVuscszklJCtGIy7XHraddMwpkuTtGfu2
         pKe9Ej1IObeeFYOkvLxUAreNyeIpjTIwqJrynM0a+QAZnm6sbVQoHSWXsfN/7YbDI2f7
         28yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=XNBqXpcPaRf+Uwke5guMlp1ayQNdwiMLpaLFB86CQa0=;
        b=eZM6SSERgAlqgKDtr6S/ertkg4RWkyqlyQg2WRS5w9qdZJg/PAGM9DHBRQlglVIeEm
         LRTI3BjWxdWVQqz8/aqN49BYcuaLN8rBgwtDKlY3/Nf/raEOyakTLf/esuLQpghw+VnV
         4QDtZeW9dk0xiA5yC6GxSCDpye7K4dGmZJek4Lpf3tQlxm2AnJqPDRbKfNhchLvq8tfY
         +sFei2VGLwJjYqkrejaJw2TkknzOB7MO1rqLGlTmMVDgrm2npU+GkWx4FVfP6I6SwlaR
         kazHo9UbL9q0VTLKu39Z4CkjA4boPnXVEe6pCnp6IYvFvPe0PB0ZfRiWgn04M2LxKLLd
         1WuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d35si13074545qte.118.2017.05.30.09.05.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 09:05:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54820 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFjeN-00046z-Qa
	for alex.bennee@linaro.org; Tue, 30 May 2017 12:05:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFjaG-00016s-R1
	for qemu-devel@nongnu.org; Tue, 30 May 2017 12:01:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFjaG-00061O-84
	for qemu-devel@nongnu.org; Tue, 30 May 2017 12:01:24 -0400
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229]:35845)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dFjaG-00061F-1r
	for qemu-devel@nongnu.org; Tue, 30 May 2017 12:01:24 -0400
Received: by mail-wr0-x229.google.com with SMTP id j27so3308549wre.3
	for <qemu-devel@nongnu.org>; Tue, 30 May 2017 09:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XNBqXpcPaRf+Uwke5guMlp1ayQNdwiMLpaLFB86CQa0=;
	b=E54PJXd4l4rYZpdiIAK+k6pvEnC0fMji9NGTPrFQr0ASindEkeS0F1g/endkSn6mLv
	OoJon/AM4Vgp2aQU5Kaj8B84E9ip9JvjHvOZJP8k2C/ZN/WYPlOBtftKeQLVCIjcNAuI
	afbp4HSMrMgWas2sIV3cdYHtDYBLCqNxaYdpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XNBqXpcPaRf+Uwke5guMlp1ayQNdwiMLpaLFB86CQa0=;
	b=MOaKm9hhsAH66VXZfBtq6Sjrx2HiABGUnnbL+XTKJSuikSd4AqVXEdCSbemwDMGOPU
	jl40BOB4e8vMVK8Avu4Lf2tBfWDyoXqdA5CEK9GIerjJyZAj65avFXqyxMdq33SK8rTl
	NkHluZWuXR9WteywHt8bStH5b06a0RjEqXxybc0HHgEZdMKT+VXnRSL6Sy3EeP7FPYp2
	ohSZz7iKSWCQobx9jBd233J/j6bb9Mz341geWu4nvTMFv0sAXLRMsDU4PQkh6ait7eLC
	UD4FEmjmiztapjl0/lBUYZ0b1C+LRUXxvf+IGAinG5h+gobmtcDN8rSISZQhlUNOqzlG
	JTtw==
X-Gm-Message-State: AODbwcDvZff4RlldpU6F4g/nghi6mS2oqeQsneLnoeKEchaxpzk1t46Z
	aqOhG0QG5AP3wZspeqe1/LZ1EjzmZu9R
X-Received: by 10.223.150.139 with SMTP id u11mr11832734wrb.195.1496160082020; 
	Tue, 30 May 2017 09:01:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.135.82 with HTTP; Tue, 30 May 2017 09:01:01 -0700 (PDT)
In-Reply-To: <1494697399-352-3-git-send-email-eric.auger@redhat.com>
References: <1494697399-352-1-git-send-email-eric.auger@redhat.com>
	<1494697399-352-3-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2017 17:01:01 +0100
Message-ID: <CAFEAcA9P=k88CFwUHeAg=oxsDpY72OTUc=+iyffM9dP5=tzRKg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::229
Subject: Re: [Qemu-devel] [RFC v4 2/5] hw/arm/smmuv3: smmuv3 emulation model
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
Cc: Radha Mohan <mohun106@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Trey Cain <tcain@qti.qualcomm.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	prem.mallappa@gmail.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dYkKpIf8Nqa/

On 13 May 2017 at 18:43, Eric Auger <eric.auger@redhat.com> wrote:
> From: Prem Mallappa <prem.mallappa@broadcom.com>
>
> Introduces the SMMUv3 derived model. This is based on
> System MMUv3 specification (v17).
>
> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
> v3 -> v4
> - smmu_irq_update
> - fix hash key allocation
> - set smmu_iommu_ops
> - set SMMU_REG_CR0,
> - smmuv3_translate: ret.perm not set in bypass mode
> - use trace events
> - renamed STM2U64 into L1STD_L2PTR and STMSPAN into L1STD_SPAN
> - rework smmu_find_ste
> - fix tg2granule in TT0/0b10 corresponds to 16kB
>
> v2 -> v3:
> - move creation of include/hw/arm/smmuv3.h to this patch to fix compil issue
> - compilation allowed
> - fix sbus allocation in smmu_init_pci_iommu
> - restructure code into headers
> - misc cleanups
> ---
>  hw/arm/Makefile.objs     |    2 +-
>  hw/arm/smmuv3-internal.h |  603 ++++++++++++++++++++++++
>  hw/arm/smmuv3.c          | 1134 ++++++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/trace-events      |   32 ++
>  include/hw/arm/smmuv3.h  |   87 ++++
>  5 files changed, 1857 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/smmuv3-internal.h
>  create mode 100644 hw/arm/smmuv3.c
>  create mode 100644 include/hw/arm/smmuv3.h

This is a bit of a big patch for review for my taste -- are
there some easy splits into multiple patches possible?

> +typedef struct SMMUQueue {
> +     hwaddr base;
> +     uint32_t prod;
> +     uint32_t cons;
> +     union {
> +          struct {
> +               uint8_t prod:1;
> +               uint8_t cons:1;
> +          };
> +          uint8_t unused;
> +     } wrap;

Use of bitfields here seems a bit odd but I haven't
looked at the code really.

thanks
-- PMM
