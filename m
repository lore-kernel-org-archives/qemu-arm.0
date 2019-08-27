Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp5454348wrs;
        Tue, 27 Aug 2019 09:26:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy3m7Z8oF2rYXIwUi3EJVX6RdZ/jOss3dzzr9RQULYSSbYwsr2pAK4gnMVRB9xdVQAtEJLn
X-Received: by 2002:a05:6402:3c8:: with SMTP id t8mr25245951edw.211.1566923165370;
        Tue, 27 Aug 2019 09:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566923165; cv=none;
        d=google.com; s=arc-20160816;
        b=QTmEKiRhFWlnsmEq+McTxvpk81yZteAcfkqLX8cS8F4kJIhjVJmstqFKvJxUWmgfti
         cCLVNpuFbEcHrVyp6S6AQqbBthCwn/HA8FBwqL5cmYqRoCXapoHh8x3LS7IDceJqHe8o
         38wZR8tk5wh1BXRYGOwfk9LbwiJN7N0ji92yyWo5c1LCAhXuuea2PzS/M9wbueC4lQey
         BSJ7PRluCabs1sq552bg8VVsIsRttziFn8YLGPCMAcctr9RjBPmN7C+z2UE0XWXWnJY3
         ukQS13cd+/bJHVs7RScEmlPHRPd/jhrDcOIHrN7Ex5T14XTgAVzvWkEw9XZbi4dakyxV
         80eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sRF+hAhA5e8NbtJEE/PY94rIOMBkfkunaVAvvB9zB1c=;
        b=KE5Wr2uTOKCuB3Nxfasql6ydP3vYAfJFeDtTbCZaVss+qLh6O9NIoqBDV5eXA+U1/J
         LKPizAd4cOzSWX+GG5kwa13gSZV3TwATHMWe21PfNbeXP9dNMl62awvpfQcCfB3Y/pa4
         DmTqxDl9XpQuzDpA1AsjaOywia7UsRbMyYduIMLbwImUT7oWF3BQUiRv8/xlaHbCIChE
         xjPLoas3u4LpwfwJz3nLfnmc30ruZybe8VmLaSesOoFr9Hh6e703oKfy+ypmyYFDSLtO
         4adRKlLiU8mZhVU668zK3j60kj1o8Uhy7RRcUZOMaMC6LPBJPJGui/S/pVKrPW0o1qLU
         /THA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iCl+IQdn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jp14si7992427ejb.398.2019.08.27.09.26.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 09:26:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iCl+IQdn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2eIG-0001Wp-C5
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 12:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33680)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2eI4-0001VQ-Jm
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 12:25:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2eI3-00038S-EC
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 12:25:52 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40127)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2eI3-00037s-7q
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 12:25:51 -0400
Received: by mail-oi1-x242.google.com with SMTP id h21so15426612oie.7
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2019 09:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sRF+hAhA5e8NbtJEE/PY94rIOMBkfkunaVAvvB9zB1c=;
 b=iCl+IQdnlktuumEmS1ho/bYHAegxh26LMJqqut9a2u4E8KF2KjF3ps/ZW6qusCIRZe
 KaUzDONEKZD+R/lBc3WtxugO7XG4xXH8gqlPR7fwuUtwu6k2QChYjuC7dfsJrC86aYca
 lm49qVSohePbXECxNEg0CWcbjxvFOZbStaefES3W3zO2X+dIBlW+Ayw0Tlnqc/HeR+Sr
 KMord5RKOqKzpraZXQARgC87SEE/+xEiIeWYP+/5WMls1dl2CW9dXivDm0BPdv3Zx80c
 hqMHA/MtLJ62/zgLNxJ0cnyriPuRalYfKeUFjCsG6CLJXBTug+3zYTs1aBWy1Vd97Bp2
 xTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sRF+hAhA5e8NbtJEE/PY94rIOMBkfkunaVAvvB9zB1c=;
 b=BD4Asf+WtPwX9ix7JXeyqVZn0ZGWC0SWZGtequ8LMRDs4lpjpUTmkYUKKzI9E1mkT7
 iOBwHGjtwgnlBUCe+PA+qQB6ifj9bb9vd3fqjZYFbNpIsK1vDCuV9Fp6YpsqKZP4WRMF
 O4abcUBqI9Zbre23+hgKQSg4jjXTVmMFue4Mh0//KvKf7NWMVYAhoX42grxCt7dOGNOw
 vmmOUV8oY7vvwSlf4qKV9nxjVCewl7NW0sbzI0D/zJRVFo6rDswqAFnABpx/+VHYJIgR
 bOOCsXO+v7pPV6FUGtVLbZHlTZyxbeSwFkwbFdFbcXJQlhKbNBzbegS8fqrJGFAoQ4ro
 PQMA==
X-Gm-Message-State: APjAAAUVdsKYLiw7vsiHpQJDD9fpcN91FIyamHdFDbOPGvEYBx8S1aYT
 Ljrdk4E3BvlilEPQxaMnZ1qaE9Kvpc7eeJaiCPJy0Q==
X-Received: by 2002:aca:50cb:: with SMTP id e194mr15606956oib.48.1566923150027; 
 Tue, 27 Aug 2019 09:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190822172350.12008-1-eric.auger@redhat.com>
In-Reply-To: <20190822172350.12008-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 17:25:39 +0100
Message-ID: <CAFEAcA-TDGTXrj5M=DXWm5woFOiLKdibueqczS7Yz3kZPRMWpQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v4 0/5] ARM SMMUv3: Fix spurious notification
 errors and fail with VFIO
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
X-TUID: 5C2DyszNRx0m

On Thu, 22 Aug 2019 at 18:24, Eric Auger <eric.auger@redhat.com> wrote:
>
> As of today when a guest is assigned with a host PCI device and
> an SMMUv3, VFIO calls memory_region_iommu_replay() default
> implementation. This translates the whole address range and
> completely stalls the execution. As VFIO/SMMUv3 integration
> is not supported yet (it requires SMMUv3 HW nested paging), let's
> recognize this situation and fail.
>
> Also the series silences some spurious translation configuration
> decoding errors (STE out of span or invalid STE) that may happen
> on guest IOVA invalidation notifications.
>
> Best Regards
>
> Eric
>
> This series can be found at:
> https://github.com/eauger/qemu/tree/v4.1.0_smmu_vfio_fail_v4

> Eric Auger (5):
>   memory: Remove unused memory_region_iommu_replay_all()
>   memory: Add IOMMU_ATTR_HW_NESTED_PAGING IOMMU memory region attribute
>   hw/vfio/common: Fail on VFIO/HW nested paging detection
>   hw/arm/smmuv3: Log a guest error when decoding an invalid STE
>   hw/arm/smmuv3: Remove spurious error messages on IOVA invalidations

I've added patches 1, 4 and 5 to target-arm.next.

thanks
-- PMM
