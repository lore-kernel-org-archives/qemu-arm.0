Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5771117lff;
        Tue, 17 Dec 2019 02:04:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqyer3bmWTL49b8OGzox2PaSGJnHRHZPSFla2WlXIX5Rq1aiz/8bSrdzQL0GNPE+cta2wBB6
X-Received: by 2002:a05:6830:1d59:: with SMTP id p25mr38311316oth.308.1576577057546;
        Tue, 17 Dec 2019 02:04:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576577057; cv=none;
        d=google.com; s=arc-20160816;
        b=jkNbS0hH1111ajfLm/Qpff4uoXo+xLmx+a41Nm3qSpx8Dxs5yPaNl6gpeqZFWgrE/E
         +nDh/c69OWbj6KDsXGgwnn5XmmRCxIPh3lla/JmrttJk/Qh9bAf1UgozqPh+qDcYRslT
         02wHLOuAtaAsj0dyuAQYWLvTiGj3hoKDgP7PP8UrtaMc84q5/FwQLpcA55UHF5Vpqu/Q
         oCix3He+y3mwBUA7wp82BpIAA5M12lEbEY63er90b+IR9VFztS+IcaXkTPBIwBw3fTAI
         Pl1YhVgDALZCEFGPJop6YgL1xRGrFy8Hh2w5rkpGDJXQN1cGa16CxmgYHxl18okX6wBn
         /Spw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=YTdJ9BlYlKA52aob596FqEnZ+Y7D0Vb4IPmF21pH2xE=;
        b=johuUWFkrfetWCbQAhSLD8ICJ9+CnanmovcDXkh6yzJQO9qk4U2ZmHn+Api7W0Ps+I
         ukqDCAI/kyIs2pabTIiHx39ytBMO/ffi04zZHADKnmGRQXozfY15bpezTotcBy3aQlOe
         YRqMndet56ra6vETfVl3QMidYpjvExPEiWjQy5dYNr4vOKKss/KU8cUtqicLXUU2zdFo
         Qg/851Mk1d8QFvxP7MWxVR3oKC7X/XIuvV0j+uK2vxfwduVH5+NYFnw+V+wwojvHptt4
         +rGO4Ox2xnwTllsu4LGENGd8QEY4ck+hsnDD/JMrMEL6Lwgz9SOEGfeF1gFyM1BJG0gD
         M5RA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iXDgfssS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k185si9264815oif.81.2019.12.17.02.04.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2019 02:04:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iXDgfssS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ih9iC-0002UK-Ny
	for alex.bennee@linaro.org; Tue, 17 Dec 2019 05:04:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35947)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ih9i4-0002U9-4p
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 05:04:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ih9i3-00069S-55
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 05:04:08 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:52798
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ih9i3-00069N-1l
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 05:04:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576577046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YTdJ9BlYlKA52aob596FqEnZ+Y7D0Vb4IPmF21pH2xE=;
 b=iXDgfssS+voa5Nm0EnIQqSjlNvkMRazNB5qInEMQoOVDnY2t+pgQVeMgjrlWc6zSXQk/OL
 0vHF3N/GEU/ODT5PvyqsJGsEB+ZLK6Nn05PD3uvZY4vrSyXwWY8tlVQlfQP7N2MRaBSctN
 NRSak4M0qZmzmtr/5FBVwQh0oyCcqpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-ct_whX23NC2rkIxa7qnbow-1; Tue, 17 Dec 2019 05:04:03 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C012107ACC7;
 Tue, 17 Dec 2019 10:04:02 +0000 (UTC)
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D3A37C836;
 Tue, 17 Dec 2019 10:04:01 +0000 (UTC)
Subject: Re: [PATCH v3 0/6] hw/arm/smmuv3: Correct stream ID and event address
 handling
To: Simon Veith <sveith@amazon.de>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <1576509312-13083-1-git-send-email-sveith@amazon.de>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <e0a55905-e76e-40d2-3d9b-06ea5b917001@redhat.com>
Date: Tue, 17 Dec 2019 11:03:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1576509312-13083-1-git-send-email-sveith@amazon.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: ct_whX23NC2rkIxa7qnbow-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jbUdcZhqK9Lq

Hi,

On 12/16/19 4:15 PM, Simon Veith wrote:
> While working on the Linux SMMUv3 driver, I noticed a few cases where the QEMU
> SMMUv3 behavior relating to stream tables was inconsistent with our hardware.
> 
> Also, when debugging those differences, I found that the errors reported through
> the QEMU SMMUv3 event queue contained the address fields in an incorrect
> position.
> 
> These patches correct the QEMU SMMUv3 behavior to match the specification (and
> the behavior that I observed in our hardware). Linux guests normally will not
> notice these issues, but other SMMUv3 driver implementations might.
> 
> Changes in v2:
> 
> * New patch "hw/arm/smmuv3: Correct SMMU_BASE_ADDR_MASK value" added
> * Updated patch "hw/arm/smmuv3: Check stream IDs against actual table LOG2SIZE"
> * Updated patch "hw/arm/smmuv3: Align stream table base address to table size"
> 
> Changes in v3:
> 
> * No changes, but sending again to correct a patch submission mishap that
>   confused Patchew
> 
> Simon Veith (6):
>   hw/arm/smmuv3: Apply address mask to linear strtab base address
>   hw/arm/smmuv3: Correct SMMU_BASE_ADDR_MASK value
>   hw/arm/smmuv3: Check stream IDs against actual table LOG2SIZE
>   hw/arm/smmuv3: Align stream table base address to table size
>   hw/arm/smmuv3: Use correct bit positions in EVT_SET_ADDR2 macro
>   hw/arm/smmuv3: Report F_STE_FETCH fault address in correct word
>     position

The series looks good to me. Also tested against non regression.

Tested-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


> 
>  hw/arm/smmuv3-internal.h |  6 +++---
>  hw/arm/smmuv3.c          | 28 +++++++++++++++++++++-------
>  2 files changed, 24 insertions(+), 10 deletions(-)
> 

