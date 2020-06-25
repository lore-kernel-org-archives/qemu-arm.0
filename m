Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1398599lfm;
        Thu, 25 Jun 2020 08:18:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5WSv65SpjvAslE4UpCTUjN7z482GPlZ9OHh3fYfuDjoeqb0waSzRC8ROsnBnY8kr++ERw
X-Received: by 2002:a5b:f4f:: with SMTP id y15mr53367908ybr.184.1593098313752;
        Thu, 25 Jun 2020 08:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593098313; cv=none;
        d=google.com; s=arc-20160816;
        b=xeP1AiYbNg7vgIKFJNSkg5PSMeldrJCbhHeMNXIpoJbPpj2ToB+wOT81N6xBl4wCAh
         /lIJ05sJYwhzl3vSLMC4FIokvOIBLTJgQDbqJ6AivBWs3EczdKyqCR12tj6R3hl2xhAq
         tlgzmkVCi9//6jMhie3+lFoByossFwkSOpZDKeEFxzKSzhoHJVstx6Z/tmqvKUuzhd0v
         T/NssuUtMMCMK51UJBf8tFv8sMeoI0mL9QQcrcUnETzVHUFvX+M6XK0v+VtfBkz5SOnz
         gGezeOasyGk5HmcMEW/DPpnXNKaT8SQPd2fBFb5ZGy2uz82k86wJeT9kxHJXDo5Cc8i5
         ACCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M5QBnNRu+wYkAt0WX7yc0inn3gIJTC9kDhApF5BKicY=;
        b=TqZLDlbPp28itBvwCz3yN/YcGzU6U+nicsC5InS47ed1vjo9BsEQapexiK606bmTKT
         UEvXTjdh3mZXSb7oZ9woRE5Y+3CCE3EzNbTn9HosTtkOV61QvNqL3h64TCPhc7OggcZ8
         CcTU5j0MOMjgEt0BLwq/Gkdij8D0r00DZWBRSH6H9qy9rGKTIJCs/SVgmp/f1NNMHusQ
         hNPKUKyO+Cfzsxb99ggrGMgqEThMyLDmINwyOurs0nUp3PHgdPPXfO1LccgKDBq5OCjE
         /D4CiRUNhmOKy2+kwav77cRO041Z+bWtq2F+bn6Fk4Rj2JynP8lFtP2EhYsGUO31WLek
         2DTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z6OW4iyT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k136si1837347ybk.342.2020.06.25.08.18.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 08:18:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z6OW4iyT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joTe4-0000t5-KV
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 11:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joTbS-0005r3-1Y
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 11:15:50 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:32987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joTbQ-0006GD-9D
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 11:15:49 -0400
Received: by mail-ot1-x342.google.com with SMTP id n6so5616821otl.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 08:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M5QBnNRu+wYkAt0WX7yc0inn3gIJTC9kDhApF5BKicY=;
 b=Z6OW4iyTpR7WQF6YNbvYNh5edEvXyID5xxaIPXsfjBz9G0RMYXCRueJjes8WIadhGF
 fp2XaZWCUowS6rITA2RSArx/8GKVwxe9T/M6US4eoXoxWPEfRp2tGig5LwtK4CNJ0ZSn
 Uvr8tK0wRm9/I+n3DsD954Qtcrt2N99AOD5EHSXnoyxke8Z+9DYuQ1Jpc/E96NunJ2R5
 wUbhDSXxjmbYrWAdBkMG0zNy8c+XQmWAKaE2OizrUA2M3NzzTn9iSfrw32NesbmC1iLT
 OVJqoQQLkXTBmnRylmBm9J9mHQThcMkSkyANAbAexFMiDuK2UAdISXQXlBqkm3uMl4BE
 QmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M5QBnNRu+wYkAt0WX7yc0inn3gIJTC9kDhApF5BKicY=;
 b=OTLvw34nOWYFiQNd7VCotvLI2ynlnmJDKF1jOMwgICWVNMmehQesPxMR53LUlDHXVO
 6Hv81l3Q/hcrJov+PRRi3msaFc/ZL6KbC+iPQ0SN+0borfrmWtmsjTZqTceLESctupQy
 0XlVq8ngm+vAAD6/bVUPiMRZc6nh/je5IWN6uaML+ZiiLzdgpqDkczDfrGXd3rCtvURi
 DPmUjY8clsHLlc6vH/HN1sYl/DxMkEEkp0IiCRa6DP1n29HGqjLrgVQSajQRatm49q2R
 cV42/uRt7+Te0pubL0b+612ezBHKtwdDaa7x+bqluzsSJClalXNf4HrsmSuLlkG5XBI+
 KBoA==
X-Gm-Message-State: AOAM533HZOCwyHESTR8BNajiidc9hhty5mKZwozV3uk5t8MH5sUhGhMS
 s4P/SndyO6pwOYud3QhKK6lG7uWoX0nIb80H00XYcA==
X-Received: by 2002:a9d:5786:: with SMTP id q6mr13363317oth.135.1593098146973; 
 Thu, 25 Jun 2020 08:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200611161500.23580-1-eric.auger@redhat.com>
 <20200611161500.23580-6-eric.auger@redhat.com>
In-Reply-To: <20200611161500.23580-6-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 16:15:35 +0100
Message-ID: <CAFEAcA9vMXtj-fiEB_FRHnau+K-XFf--i=3-KYTjNncc_9dgPg@mail.gmail.com>
Subject: Re: [PATCH RESEND 5/9] hw/arm/smmuv3: Store the starting level in
 SMMUTransTableInfo
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i4H0lEjANLfm

On Thu, 11 Jun 2020 at 17:15, Eric Auger <eric.auger@redhat.com> wrote:
>
> Compute the starting level on CD decoding and store it
> into SMMUTransTableInfo. We will need this information
> on IOTLB lookup so let's avoid to recompute it each time.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -224,7 +224,7 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
>      granule_sz = tt->granule_sz;
>      stride = granule_sz - 3;
>      inputsize = 64 - tt->tsz;
> -    level = 4 - (inputsize - 4) / stride;
> +    level = tt->starting_level;

"4 - (x - 4) / y" doesn't really seem like it's complicated
enough to be worth caching given everything else we do on
a page table walk. Do you have perf figures to indicate that
this change is worthwhile?

thanks
-- PMM
