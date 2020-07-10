Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp520849lfm;
        Fri, 10 Jul 2020 02:48:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9LE5g3HV4EphwS7gkcjiDr9DxqOma1559PgtEJdhKjYl6kOazdD7i9UoHeaRmiizVxEt8
X-Received: by 2002:a25:cdc2:: with SMTP id d185mr103557673ybf.87.1594374522611;
        Fri, 10 Jul 2020 02:48:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594374522; cv=none;
        d=google.com; s=arc-20160816;
        b=wqZYORKXMfCjmeIujrf0QDic+sJ5eyMjqbk1R6zkdXlnXhqczszWl4SZ8/TcSb8Kf/
         IFFKMv2xolXhXBnBRQDbJVC93K5an6adUN7TdWFqHbzbPDgkVH5vaTQkYp/WJO+VD3X/
         vGOr9a/afPe2sxQF8YHO8LAVHbEY+gAC5eWaYLljDO7xOkofB9zcLjrJ20rR0jXQiGkT
         Ho5sh0MenJNHNbq4KtqLCfhOin8AjtORUZq3g8c2pJMB5KDDeooEEAxJd2ncrK0GqB8X
         i98jFdQH24xwA7e5fW4hBApCy5VJFnlBwteDPl9F7vUsKYI0rnSu3biEi+KqXtXBy5/3
         9KLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fnp0j4YPUq6YO769WRhFkPNnreu2rDFJRpmnwAnas14=;
        b=fWV/JEyV5j3xpkwjRKHGkjierIPzLPn55bBGOjfecKFbDlJ/lcLf60+LTd8YJGg9of
         LUzFcen3oyvQ8kRAwG1d+vVxcnxzx8ZDw5j0uzmsZUc2plfNyobkRNzeTT5EdfgrfUAm
         bwk4VBT0aAHawAAOxbE+1euLCCs0svvELYZSdFJHTN08hmGstRuu6utRpwnk37N2sqFT
         aOEu4UEJeOCJegLf2j+Q9QAFmZBBHyZZPtZ2IsD6mfGUZoYUWaTlcjxgpONWK8zBhNxl
         2wB83KTh65kcmoXSHyDxO4uTp1IajU6aGy53vA3xDo02gjK1RY2nhykfEpapc7meWa1R
         kTdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HQDMQJYa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si4972520ybq.48.2020.07.10.02.48.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jul 2020 02:48:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HQDMQJYa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtpe6-0001i4-0D
	for alex.bennee@linaro.org; Fri, 10 Jul 2020 05:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtpdD-0001HN-CW
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 05:47:47 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:43698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtpdB-0006fJ-MU
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 05:47:47 -0400
Received: by mail-il1-x142.google.com with SMTP id i18so4536882ilk.10
 for <qemu-devel@nongnu.org>; Fri, 10 Jul 2020 02:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fnp0j4YPUq6YO769WRhFkPNnreu2rDFJRpmnwAnas14=;
 b=HQDMQJYarOLm934Ayy/ruKQ3M7HKrAxe/EtuJO1RxIjWbwlKJJpe+MskAiteKUkLm8
 2TGRUup4zqknWWHQLrfIehRBz/LvCnltyZ4HrW9yJ7FH48N3LYWu8B/xCWfPqd3c9PL0
 NBOEfyJ5k8fJs23o3B+BbXSmYHqbzhp6rednZFvBO/VDL/bKH/wcdVcaQ898ypCYpEiG
 Hw3fcojwP+2YiTCTFRNXv/FpZpZrByGmUiqGgewo/aqPL7cycb+kGxJcJeVAbP+o2uNu
 ggRGCLk8rCHV9JEWSYyl8oBga8j3cdzFdAJEwAzdTc1sYmcLfWQZJ2DtVEhCGzh7KQUV
 HtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fnp0j4YPUq6YO769WRhFkPNnreu2rDFJRpmnwAnas14=;
 b=ukxZti42/bMC1zNelP9gWx/sGa62AylKZh1JHUqAw61GVnEBVg35+8Q1UwnyT8voPu
 Ef31ThjQEca9tRU5lcLbP6ipfzDVFaUgaQTDbnGms7FVrTLHAu68TnpuvmdhG7jpx8UC
 0quxbMtzLiT6NHmxif/XBAAiVBr3pL+EiVshUwzTSPQ2j0Iom5kxPMq893+R41PXH6Qj
 EMk/AUMq3Rbu23EG3AegbnLx9aPRJ940v72lhav9nkHlCqviiZmERRNWgOJR8mBMTt2F
 BaZTU5Dx/d281oH/NddtQe7VjmuAQ1oDZZwj2ZbwmlLCXjhHnjb9m/6MSlhCyy6LvGns
 cTFQ==
X-Gm-Message-State: AOAM533YLqFir457kbtjwtLTEDGJ7Xcd1Xpjy0Bgxci4uDW6UBb5U9DX
 m/GIDwNci+VYOqjQuBk+HFu/E4iJvuRy9+ZK65NZGw==
X-Received: by 2002:a92:404e:: with SMTP id n75mr10676835ila.203.1594374464407; 
 Fri, 10 Jul 2020 02:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200708141856.15776-1-eric.auger@redhat.com>
 <20200708141856.15776-12-eric.auger@redhat.com>
In-Reply-To: <20200708141856.15776-12-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jul 2020 10:47:33 +0100
Message-ID: <CAFEAcA-zXyzq5ph3U0vFuqRz9=NEq-piw_9gsYbrwg=+g9nbXw@mail.gmail.com>
Subject: Re: [PATCH v3 11/11] hw/arm/smmuv3: Advertise SMMUv3.2 range
 invalidation
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=peter.maydell@linaro.org; helo=mail-il1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jplvuDXfYURX

On Wed, 8 Jul 2020 at 15:20, Eric Auger <eric.auger@redhat.com> wrote:
>
> Expose the RIL bit so that the guest driver uses range
> invalidation. Range invalidation being an SMMU3.2 feature,
> let AIDR advertise SMMUv3.2 support.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

I think that to advertise SMMUv3.2 we would also need to
set the IDR3.BBML field to something non-zero. That means
we need to analyze our implementation of the caching of page
table structures to see if we need to do anything different
(per the behaviours and guarantees described in section 3.21.1
of the spec).

Alternatively, we could take advantage of the language
in section 2.5 that says that a v3.x implementation is
allowed to implement features from v3.(x+1), and just
set the RIL bit while leaving AIDR advertising us as v3.1.

thanks
-- PMM
