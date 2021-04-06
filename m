Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1421891lfr;
        Tue, 6 Apr 2021 05:37:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx++dT9lf2OsmG8TigG9xlPkomWebhK4SbkBOqmY8GejXM4lkxt447I/xklGl0I5GpzaKzJ
X-Received: by 2002:a05:6e02:1c21:: with SMTP id m1mr24634021ilh.204.1617712666337;
        Tue, 06 Apr 2021 05:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617712666; cv=none;
        d=google.com; s=arc-20160816;
        b=ptdOKP5P61nt+aahnbCNYzFQH9CD0apMs8IVBTL9836ki6eVOJuKGsVA1/JwSOZkNX
         Hy9kDycy0DfVMqUayVXlx89aWtwvOVPkxzyFG07MnfjB5K7x0jiQii2FgteXCFHQiUjP
         oe00DsvBZRU9eAnOxvolqgp2SRKwjIPykEiQ5MtTI1tS8RgHLnU+7QtBhOf4W+zopLSg
         I+1PVhnqMwAWZnUOW3geTS8FNJ+62vqFmcyHQYIpfbIKga1wt5CIhHCxCr1NJtyRuVYk
         WWu/MtJbKOka1yjlrOdKNAhEqkfmHOW4rqo1Uj+luaTKix0tqFyTfj7frOTONfLd4C/k
         QfQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZIEM+oR/G8WhjwQNFPSiZlCcshqCEEB2TZr4JXxdWiA=;
        b=X9jhzwVSEXz2WNveKomyVDl4tj0OyPTd/8Ja8QgVfariIfHEhgpXAE2X6a1qwiuXId
         XD0shrIif6CIYh6d762VGzd3Ue5qPIY08am6oLWnuwFIzsvZmOHXh+zRzeFJbaBECoIy
         nHHeCcEvy0mwtXthS12XjHNS/320/UfVIYBiD7eZvtcRkCyUKnsZlvdndh3MrSMbMYBI
         MXp6Cgw92+c8bfDvkj4S+7umoPRKms+SNW4ydDggeB42k1F33pYX2NVMbgWfmij32MPr
         L2tMPUWDPrHhHoRxBgPdljDKcbEQgPjfqpdOhnkvXPAVbjsRjUvLtEcSF/vtqg0FGxi9
         R+SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d4G9drGH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si6505544ilu.144.2021.04.06.05.37.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 05:37:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d4G9drGH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lTkxl-000795-Jw
	for alex.bennee@linaro.org; Tue, 06 Apr 2021 08:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTksT-0001jo-Cf
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 08:32:17 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTksK-0000Dz-LP
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 08:32:16 -0400
Received: by mail-ed1-x532.google.com with SMTP id e7so16320095edu.10
 for <qemu-arm@nongnu.org>; Tue, 06 Apr 2021 05:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZIEM+oR/G8WhjwQNFPSiZlCcshqCEEB2TZr4JXxdWiA=;
 b=d4G9drGHa8lYkHiJml3KBsoxC88ZxUtBvqs9NqNePhlLGw+5uTRUgI6WxPE/pByx5M
 5i1JPFXM0nU4SOu8TJN2bTC8HEgZnS4U8jg5G4JQHLrMFrVE+4pP5sHfrgi9IcslanXg
 FqE/S9WnppI2JyhalDBpFvnVZNeFSTzgTlD7Um1UqS3yVTjf0z4s3aXiUqRXwCDB7lPP
 R0zOrLpCfS8znTnSKErwpuO+o4oC0hI3gaHF2X8XwOCvTh2eVLg6GTbmfcrffU3NrIZR
 MlGqgC93lI10p5CCUxQKz9fEXEDt/sKoLk5RmApxO/kiGBMy9og1wk1rw/LnPOG3HqdH
 5BIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZIEM+oR/G8WhjwQNFPSiZlCcshqCEEB2TZr4JXxdWiA=;
 b=O4cyWzoCNumjFEraN2bMQ1oIyDS8BIMxSxJ5oRa0FMIENpk9BTwAwo2RsfKl3O5MFy
 ZfxbHxf7wDrtqQY1qscmB2KtnqCjKy6wdJS1lIKB/OE7SCzKpumvqhxISGkLnKodz1E+
 PjCLR5Nxp7NWGPNO/o1/MvW/9KfdsoJsBIcgODp8qhocZayXXY00hqhpcLvYcLxfBTwh
 ron49GMBFWwMtiFG4cvSQj2CKAqzlGnXTLnVvmZL12W7zIRUad/gw4Y4r1dEUioR+rUh
 bFAwKmgsURYyq3TJtZ7A2OSfitNODjPOBiiulm2hhIQVTtoKwQ8pQrQDiPAHBja6JBbM
 9yrQ==
X-Gm-Message-State: AOAM533zbNNuHFCyi1129T7rcXIVi1GSFtCb8QrmLgZiu2p1Kxxuty1H
 yViwI/i0exJMlO9Or2g7SqRGy2L6ss+zSOpG2zm1hg==
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr37421368edb.204.1617712326820; 
 Tue, 06 Apr 2021 05:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210402084731.93-1-yuzenghui@huawei.com>
 <7f42bc9f-3fb8-d24d-d9e4-9b93784504a6@redhat.com>
 <CAFEAcA-87+rOJa6kBZU2J2ACO07h1DDZe6MTcBCUrx_Zwp3UHg@mail.gmail.com>
 <24c077d2-0e0e-02bc-0f92-4086be7e8982@redhat.com>
In-Reply-To: <24c077d2-0e0e-02bc-0f92-4086be7e8982@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Apr 2021 12:31:28 +0000
Message-ID: <CAFEAcA-ehqeCw4kEFKXHefaT9_9GDO=xSG9cG_SOgedOpCoE5Q@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt-acpi-build: Fix GSIV values of the {GERR,
 Sync} interrupts
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Prem Mallappa <prem.mallappa@broadcom.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C/mXKDfpNLzq

On Tue, 6 Apr 2021 at 13:23, Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Peter,
>
> On 4/6/21 12:44 PM, Peter Maydell wrote:
> > On Tue, 6 Apr 2021 at 11:10, Auger Eric <eric.auger@redhat.com> wrote:
> >>
> >> Hi Zenghui,
> >>
> >> On 4/2/21 10:47 AM, Zenghui Yu wrote:
> >>> The GSIV values in SMMUv3 IORT node are not correct as they don't match
> >>> the SMMUIrq enumeration, which describes the IRQ<->PIN mapping used by
> >>> our emulated vSMMU.
> >>>
> >>> Fixes: a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT table")
> >>> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> >> Acked-by: Eric Auger <eric.auger@redhat.com>
> >
> > Eric, when you send an acked-by tag do you mean to say that you've
> > reviewed the patch, or merely that you think it's basically the
> > right thing but you haven't actually looked at the details?
>
> I mean I have reviewed the patch carefully and I think it is good to go.
> I thought that as a maintainer for the arm smmu component I was supposed
> to send an A-b instead of an R-b.

The usual meaning I think is that "Acked-by" means "I'm the maintainer,
I've seen this going by, and I'm basically OK with this" (ie it's you
saying "I'm not NAKing it") -- so it's not as "strong" as a "Reviewed-by"
tag (which means "I've reviewed it").

thanks
-- PMM
