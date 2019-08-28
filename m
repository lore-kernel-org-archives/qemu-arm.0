Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp327163wrs;
        Tue, 27 Aug 2019 23:25:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwCxL+CnJR2iPLNC14x9ZCxLNSoDKOREhkWqks9W/NMZjohH+NxNEyx+7+03stH1tjKgpUx
X-Received: by 2002:ac8:41d1:: with SMTP id o17mr2618171qtm.383.1566973509022;
        Tue, 27 Aug 2019 23:25:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566973509; cv=none;
        d=google.com; s=arc-20160816;
        b=lHi6PpVyQLD5iLtm5MnyhvDg+QU7E8lDjdfzWUz92+6QFqIE/NBpW/n7yKB5LBZjlX
         3bsbS/oNjfOwd1FisS5bCDFW8Uh9s1buYo7KDQZ7F++gE+oXEiQpDHn5br6PUrJElVR5
         BPQBvVyhaCgStvkAk+IJGET9X3y1wwlJPxmfT7L9BICz2CtKklFz29ZKSpmIjiAQv1W6
         6QWIm6C8WpirThcYjK47yLmKkFB6ajAv0rmVypOj1PvLyEL9TvzF+UGA7XQXDChkOKja
         aTAOJ47bT5/so6eu2WKrErmjTZ8Dd9IjErnzPmtkRwnDoOcefphaVt5TCy5ujglJhDMV
         2lqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=kbHwUedhCGfiHW4P/gN8m453HAkQL8TjNIx7nTqcVn0=;
        b=SnHVqyP76ZQmy08VdIdKbOv/4clpCcpyHySsHlBBMbf1qGDS7dTQldP+mZA4I4ew1b
         0oNawgK9ASpxU2v0lVOYot3yFcln67Rz0ReGrL5scONW3TOriY4UVJ0h/sqCmi1qKTPp
         EPkDB8gpUvgQ7+P2fkZVrjg854vzVpG8cYQOzCiQCtITCmmdYLAXJ6Fd7ritsWs4SJ7Q
         +Kj8s5rVqf4xh0kA5Qez3bzosjFSQ2K4BIdfxiDhmJk+z1cOErldRRfZrlv96i0MD3mD
         fEGytAviQmrNGoV1Hpn+x+crd4PT/2MfsqFAyXbqy50wtEaHiIXW0cuxySZ9fEFEVIxP
         cFtA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m56si1158210qtk.70.2019.08.27.23.25.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 23:25:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2rOG-00015f-FU
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 02:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41519)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i2rO5-00015N-CQ
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 02:24:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i2rO4-0004Y6-9A
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 02:24:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49656)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i2rO4-0004Xf-47; Wed, 28 Aug 2019 02:24:56 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 282FD1089041;
 Wed, 28 Aug 2019 06:24:55 +0000 (UTC)
Received: from [10.36.116.105] (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3F26600D1;
 Wed, 28 Aug 2019 06:24:48 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190822172350.12008-1-eric.auger@redhat.com>
 <20190822172350.12008-3-eric.auger@redhat.com>
 <CAFEAcA94O=o+Kr25on40kv4UvyjdwVt29rVa9ObzgweJaYZuQg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ea3f7af8-3d08-9133-82f1-1f46f5cafb78@redhat.com>
Date: Wed, 28 Aug 2019 08:24:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA94O=o+Kr25on40kv4UvyjdwVt29rVa9ObzgweJaYZuQg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Wed, 28 Aug 2019 06:24:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 2/5] memory: Add
 IOMMU_ATTR_HW_NESTED_PAGING IOMMU memory region attribute
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qjNadVK9UD+B

Hi Peter,

On 8/27/19 6:19 PM, Peter Maydell wrote:
> On Thu, 22 Aug 2019 at 18:24, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> We introduce a new IOMMU Memory Region attribute,
>> IOMMU_ATTR_HW_NESTED_PAGING that tells whether the virtual
>> IOMMU relies on physical IOMMU HW nested paging capability
>> when protecting host assigned devices.
> 
> I'm still not really happy with the name of this attribute.
> "IOMMU_ATTR_HW_NESTED_PAGING" sounds like it ought to mean
> "true if this IOMMU supports/is using hardware nested paging". What
> your commit message suggests it means is "true if this IOMMU
> *needs* hardware nested paging", but there's no NEEDS in the
> attribute name.

OK I will respin and add "_NEED_".

Thanks

Eric
> 
>> Current Intel virtual IOMMU device supports "Caching
>> Mode" and does not require 2 stages at physical level to be
>> integrated with VFIO. However SMMUv3 does not implement such
>> "caching mode" and requires to use HW nested paging.
>>
>> As such SMMUv3 is the first IOMMU device to advertise this
>> attribute.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> The code changes look good to me though.
> 
> thanks
> -- PMM
> 
