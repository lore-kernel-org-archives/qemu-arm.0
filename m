Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp5446346wrs;
        Tue, 27 Aug 2019 09:19:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxsN5GavlQ3XEC5RPbEuaE5rx8J0fxkiMa1YyzjYo+WBbfwv6Xsm3qo0erw00XbFmrFW3dT
X-Received: by 2002:a17:907:423d:: with SMTP id oi21mr21864036ejb.184.1566922786054;
        Tue, 27 Aug 2019 09:19:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566922786; cv=none;
        d=google.com; s=arc-20160816;
        b=WENA18nTZhdy5YrqIyRvbiPdiLLSAFddjQd7/5OlaMiSQ3mXVNxQI/PfcpswA3YqhQ
         kP4CUnJ0tOpjn+N7agQR7z8ZZhdPzggZi2qqpZJymFQxXpwE7FM9lBjCCCcAvAF86tM4
         zceqpmkhDhpXHB5tuKVg9/dr0V5/yKUs9VOwZLuaZtkiuy1zJDIXIDlzCiT7ZxeP5R7V
         NdVZ8CPulTPAAPPxdJXrDHf5aLKsuFbBGeOoj11eX+uSMSdwkyOxyWu2/opcO937/Cvy
         BM51LBWsSROSADRjjFFB9+u1eOqaigRsGBAzSKRQlU4ATZruSs9dZDaO7GfskQf/3Fz2
         huQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LRcqPI5IGI7GYFNOvPFcLY7Z0FntDdjfHLxS7h1JfRo=;
        b=pVs3F5aQwXw+c4tdxrJs8ThMmpQMmIGS+MMfa/sXQuseSuyEr/QcOOWAiLtVrKrSz2
         3q4ik28u6IOp61SrlzZqIAd9RAuPODQflMl1NrM7LFNRvWMtjobfwOZLvHmmmhED6gHy
         dqFwXb4tR1fc2QdhKAwWlR25jupXp3J89SO+EiF+8bRkPyN8ph5SdsLs/nUPZwqvTGDD
         GasbwIegjALDGc4TvlhEv1Xe8k1NEH0x8wxy9aGrpkR6sE1t2QkJi/9dt6kXcPlguJzW
         da+fVRwJljtaB5KTZIm/V5D52rHMzvE2ZtEBdznZJ33OpO+SsJDPMhYYKMh+2oBT7tFv
         MdRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uXU+atD8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x24si7513578ejb.278.2019.08.27.09.19.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 09:19:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uXU+atD8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2eC8-00067F-St
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 12:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60797)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2eBs-00062f-Ab
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 12:19:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2eBr-0008Og-5Q
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 12:19:28 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:37848)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2eBq-0008O8-Vy
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 12:19:27 -0400
Received: by mail-oi1-x244.google.com with SMTP id b25so15436307oib.4
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2019 09:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LRcqPI5IGI7GYFNOvPFcLY7Z0FntDdjfHLxS7h1JfRo=;
 b=uXU+atD8EbakzzWGNHnrkYHdrakfk0gD6lZzH+ymoXHLlcHj/BEprWocl7x1bgErWt
 VsYGjtpq5U9sOHpg1guN8sL56yjmufx1bAPcfONzSwqFfhYIb0KybHgLEf6oDYj7PcXO
 zpafjTWZu2SWPvhEOzkXCLAmMZ2i4lpsE3N8LwC4Q563ySycfnA25CijaFx7AF8PCejD
 BEkA3ia6YsnWqMOobh6zNwgkyb1v1rdOUXyHiHzJL/963KQF48dpaA5QmbJu5pH90Pi5
 nUp9cIlwdHPBvtREEcpkWkaDozfzupsZ0YuCWUjxcbGBw5F+YA9P4FnYD27YvsCgF1Es
 B0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LRcqPI5IGI7GYFNOvPFcLY7Z0FntDdjfHLxS7h1JfRo=;
 b=XBFb2QZ7O3xgLXQo4ggfclqPKwbN6orjBiTj0idEc4u7BYyt0TAcQY1ZOEaVcBmNO2
 JGVTEgRr3FS40ZhonVFjqhY3t0xgm0+Or8OLZm0dN7ucrYk0ibwDy9XqLmTCkaHB3Ui0
 ypgGqsmm7fge9XeWBSdG40pEIBECcPIvzHZ6ykWjXoAKKOWtNex24jeSESBcs8c4ZF92
 4BSWCZDGbLnhBP10MrqMnrFgbDvelGQEKRjI0qsiYxZ3Br4ljBc+8nDFVo7lQkRXLrz0
 VrRO8vE+4cXrqxKt7aZguxX4oFs8+wAmIGTM0EMy9gGokIdQq6THHFniVcAoaF+lUkoa
 pV3g==
X-Gm-Message-State: APjAAAXKB09TCQLp5LF1EVnEmCnQ0WyYe/o5BxB+Ccj2SK6p+T4YJTOU
 TnN77VsT/GsXbIsUY1vCiALL/km6CsbwoXH+jeyJ5w==
X-Received: by 2002:aca:4b86:: with SMTP id
 y128mr16825420oia.163.1566922765952; 
 Tue, 27 Aug 2019 09:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190822172350.12008-1-eric.auger@redhat.com>
 <20190822172350.12008-3-eric.auger@redhat.com>
In-Reply-To: <20190822172350.12008-3-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 17:19:14 +0100
Message-ID: <CAFEAcA94O=o+Kr25on40kv4UvyjdwVt29rVa9ObzgweJaYZuQg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH v4 2/5] memory: Add
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
X-TUID: y0JktaulAYIR

On Thu, 22 Aug 2019 at 18:24, Eric Auger <eric.auger@redhat.com> wrote:
>
> We introduce a new IOMMU Memory Region attribute,
> IOMMU_ATTR_HW_NESTED_PAGING that tells whether the virtual
> IOMMU relies on physical IOMMU HW nested paging capability
> when protecting host assigned devices.

I'm still not really happy with the name of this attribute.
"IOMMU_ATTR_HW_NESTED_PAGING" sounds like it ought to mean
"true if this IOMMU supports/is using hardware nested paging". What
your commit message suggests it means is "true if this IOMMU
*needs* hardware nested paging", but there's no NEEDS in the
attribute name.

> Current Intel virtual IOMMU device supports "Caching
> Mode" and does not require 2 stages at physical level to be
> integrated with VFIO. However SMMUv3 does not implement such
> "caching mode" and requires to use HW nested paging.
>
> As such SMMUv3 is the first IOMMU device to advertise this
> attribute.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

The code changes look good to me though.

thanks
-- PMM
