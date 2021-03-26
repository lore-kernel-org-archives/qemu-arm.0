Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1381352lfg;
        Fri, 26 Mar 2021 06:56:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYfTpyile5u5lF42n9ZmU++bCib/AnA1wzK0ZpJCW8vz1XTkPJECDu63cOv/gz53LVrrb1
X-Received: by 2002:a02:94a9:: with SMTP id x38mr11959600jah.50.1616767002561;
        Fri, 26 Mar 2021 06:56:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616767002; cv=none;
        d=google.com; s=arc-20160816;
        b=IU91xNunvTcP0gAtcJiEYt897pTHht67q/iRJ0ED3LfvJ29kIbQDtWppYTiKQ8uP1i
         od/XfDzCerFHbpYPKaKHeVmFGYopspBZ7w9W8m2RWHX+XRNpNbkwapBjvTM0x1FSNNyM
         WGJQFy7qWtKgsqbBEVE2E5tR0o+62Z+D+wHjGNk+hyumThvRJsErfBcnigc53oTKobvG
         BQ+K3YVcQOLBygOH6eTIlbTloICueeteRtszeE0jbRJRjA3y9vqirsqQw6lI3LffRBZz
         sB7MOK+9IFEtM9ffdxWIWuYaAYji7avyYFnXETcCNA6vgQGbXFuZfLJk7E/jYxGyMaiZ
         hykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZvSGmQRYV21paSMIpl9aNffVDk0oeAXFMvY51jWDyHk=;
        b=arP4erCeIs2iniC+gmjpxVHBXZtdZCf3NE7OiRZ2OpGQKVYxKVUN+gtCsUE5+HkESy
         MjN3vu4an53L9vKacuLWP8RIDJwdYN0d0bHLRwVaBKNq8OwQavJyw6lebFgY4Z2dM8J7
         xeBU91vDwEv5HZKCv/LshS6B88dB2iYHsIs/y4Ah+3DiYkyj4AuIKjPruhVr3B3Cs+Js
         BHIOEBu17UmJ9VnvtoAGqw5iXDsZ6ejkG0hZFlUQQ7hU/edcmP7IijtzZcSorx0MRSNM
         V1IAvxfmLbPQ7fnhWXckOYuNAkKUG3Bo/vmBFYsqa+BQ2W+VAsUHWoKpUU9Esmu6bySe
         dZqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="B9vwq/P5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si4697211jar.79.2021.03.26.06.56.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Mar 2021 06:56:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="B9vwq/P5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPmx7-0004LC-Te
	for alex.bennee@linaro.org; Fri, 26 Mar 2021 09:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPmvd-0003Lh-JX
 for qemu-arm@nongnu.org; Fri, 26 Mar 2021 09:55:09 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:45016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPmva-00084w-RU
 for qemu-arm@nongnu.org; Fri, 26 Mar 2021 09:55:09 -0400
Received: by mail-ed1-x531.google.com with SMTP id j3so6372450edp.11
 for <qemu-arm@nongnu.org>; Fri, 26 Mar 2021 06:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZvSGmQRYV21paSMIpl9aNffVDk0oeAXFMvY51jWDyHk=;
 b=B9vwq/P5FxG2+lZSgLAwM4wT9ToJHUnKK6/v0P6u44Mayb4+4ci7MBqvdVL0RGhS9z
 5tViQx6gsU5tufpwan6sAJKOiL9jpQ9IXRU2qzwA7HjOb6E0yDsOtdgT8r+r/3bV6iyY
 KhJBrze7zQClMawwTVp8VQ/ztWc/3tw4qmH67OJ1m+kWgVhzFb+WJt2Sdvd2N2inzDbo
 rN7wPvEKd6Atq8QyKqOhZdb+V/TIkEDeqiehAojktSvbMK4FuvConfta8yfN9X7yHkGC
 L1nhqwFj2nzbprusK/m1JczqPu4AiVvNJq0/pC5yh00ERS8ped4dPFY8FiJdvLFogLFN
 URqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZvSGmQRYV21paSMIpl9aNffVDk0oeAXFMvY51jWDyHk=;
 b=iL9G2AcyWmSCjgnL9YKNawnupc9Rvpnxk3KTWmr0MjOSC0OEffBD/m40tDTDUQsX7H
 1Edyi/yj85FInb4DLZkKjl6i84apiyDuTuircymhQwgCfB0tfYnwYq2kQonxVWVi0Jxn
 KBuqQ6lvx4CDKOUchck5BwUiQ8KpQD5QJlTquOI1xUBNmcQxRu7E+e0j1452ytj1lkgP
 5eTBijUEPlbfPynz5wKBMFsofpocANIDzR9o7ChUrvN/3h9uuYP11M16Rq2B/e/LuxQI
 5ozu+cIVUGSapZGYz5chbF8dU/fAWdus/yGAwYR1Njy1+Uh5ErJorObJMHN417NdRc1G
 LFlQ==
X-Gm-Message-State: AOAM530M6biqMDxynXJ03BfVzrpULLK09GiyZCn8F4vCMsmgJ96HOh3z
 Vy1lCuOMR8DASgSAj/O/AUsyNQrOvcS1QqNDg9kaMw==
X-Received: by 2002:aa7:c804:: with SMTP id a4mr14931919edt.251.1616766905440; 
 Fri, 26 Mar 2021 06:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210325142702.790-1-yuzenghui@huawei.com>
In-Reply-To: <20210325142702.790-1-yuzenghui@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Mar 2021 13:54:37 +0000
Message-ID: <CAFEAcA8tbeJgxpRMu83aX+frPOgsDvHUG+PWHtaJEG5qQaFcLQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmuv3: Drop unused CDM_VALID() and is_cd_valid()
To: Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OWhhebjVafhp

On Thu, 25 Mar 2021 at 14:27, Zenghui Yu <yuzenghui@huawei.com> wrote:
>
> They were introduced in commit 9bde7f0674fe ("hw/arm/smmuv3: Implement
> translate callback") but never actually used. Drop them.
>
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---



Applied to target-arm.next, thanks.

-- PMM
