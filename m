Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1384076lfm;
        Thu, 25 Jun 2020 08:04:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9iZdROdhAzii+pPQ9UhhJyc6ApX+Wg3b9S9iD+vKXl8B2ZSFBV/EoR7gLhGWwnvG8zyc6
X-Received: by 2002:a25:7903:: with SMTP id u3mr50831656ybc.416.1593097480951;
        Thu, 25 Jun 2020 08:04:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593097480; cv=none;
        d=google.com; s=arc-20160816;
        b=YOo1h0fegQ4g+pqcc2D2yVuvw33L63PAy2jLY9c49SE1hJ2DCZAQoyAJugWP/9Q0qj
         tu10G5m2hB8VAUtnbMfdzyUGFAEyNJXqIlx1Yhhk5o8jp1Sa6FSOlgXgClSvmL8AFqx6
         O1YAyLqdCUwaAxIAvoxNJrcfmWTNArhUeqs9vIhhWv/ZCVTol68136dTBlPwXHa6wcv5
         5pZZuCThHX0kElyXsZJzREyRgu7Q4yqwtbKRm9Mc5hZhNB4Esr3b25O0QfeSaWVD0dJ8
         2LJnOMtsGsLlXWbmSrp8V0SI2EWzSQ8vmRHe7WgZ54ku/idnPLY1utbOXHuDyDGNRqga
         uK0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HTb+xpKiag52nCtXX03TGGS5qGkDtFzSLzjCAHkQg6k=;
        b=NA46RiR680P4PFrhZyp2eIK+qe0dxmusmf2Qc2ExMm6SQnYFcA2ZI72WyQ/of+Sxcf
         ZkkFE7A/JKJunDs2IAiNFfmZRwJfm63cwENvQndXySjR71Bj1VVhhSVC7uq5nqBxCb2Q
         zx+xuzcTlvo1RnaXO6NLZ6hXNZ9jFI5oxL7JHhEpHmv5ppYd7BAe4SwlGylByGw/mSil
         spoqFnRiYGwJ3/32jw0ZpvK42Q4V9d8qvzeXW0zedJG2PLZM5nfoETa2NO9VtDnmGEgb
         7IP4eWNcQZyMb6ox9dtkFmn4wh3QGlkzS/xAiT6vZztbFi+Zuiewfp4fKlJO5TKu6qQo
         4iHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xvIew33V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10si17254358ybc.15.2020.06.25.08.04.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 08:04:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xvIew33V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joTQe-0003Ku-7Q
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 11:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joTPa-0002LW-2b
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 11:03:34 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:32860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joTPV-0000GC-Fo
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 11:03:33 -0400
Received: by mail-ot1-x342.google.com with SMTP id n6so5574841otl.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 08:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HTb+xpKiag52nCtXX03TGGS5qGkDtFzSLzjCAHkQg6k=;
 b=xvIew33VqOP1FxolMSvdkdM2Chf0vi7WcrF9CuxJOJrXw5aNWLhvqetgkv3gPS7R67
 8nqhp6sHda7CCY4qYRT0etgcus1Qo8Nu1fg9ohVpsAiZO7E9uJkcSPo6mpq01OClFRTn
 Xex0nGkUCwkouDmZE89V/HoUbEsMOLk1bzGDGS1BXRU/wflRKaF4TB4za8AXQk5GNxrF
 qctBSj6icN87B/ZEp8+9z/hKzTouI/s0wepmXsdvRfYmtvj0AaSnr3FSB3+0i2oZvHOM
 C75aaWrEc5CcpHMLaSP35Ay5wfQmBg3LXd2QVpOEd/AEisdcw42A4DuePHAxJ87HzFfO
 L1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HTb+xpKiag52nCtXX03TGGS5qGkDtFzSLzjCAHkQg6k=;
 b=e6Qh0kuUJDagjBIphHQdca8ePD/gYGnvze4A0eaBmIH78hAcpoeL9EndNWbWbVR/He
 bZ98wuNlssCbYdHOl7Vzx7WjieQTpLaoWPp8eAfU9H0+PUPKrzK6lZ9Bvp4lnPoAXmA0
 3gMlQTa9BCUSrkW8S6k2V93JhBzr/lK3w46f/gDYRX72gYC1f7cb2jJYQ8I+oV0MV4vE
 3Sz2JNyaYOMiwXvyIV5q3tpj/kwsm/Zk/K6s6rsQPROUHvsPBUhHtoAWQ+8LTfUV/tNA
 dloqPpwCC9fyfjNlbnP+PffRsAfZJ/viZxRr7kLLqTSPIos+lWQixv+zOZuTvv8xAEMt
 7cIA==
X-Gm-Message-State: AOAM531o141E3n9zbVDZ6EjAQxxdN7d5jRgOfkPmywyjAsoM4fVk0XfU
 gOLV5VJ1v+XgbUhX6bZpHRHrudBYJzmL6k0c8W0+tA==
X-Received: by 2002:a9d:5786:: with SMTP id q6mr13299082oth.135.1593097408039; 
 Thu, 25 Jun 2020 08:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200611161500.23580-1-eric.auger@redhat.com>
 <20200611161500.23580-4-eric.auger@redhat.com>
In-Reply-To: <20200611161500.23580-4-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 16:03:17 +0100
Message-ID: <CAFEAcA-+eFh7q5-gQwTWxMCSV38ErwB-GZoigW+_sP-=Pmp1kw@mail.gmail.com>
Subject: Re: [PATCH RESEND 3/9] hw/arm/smmu: Simplify the IOTLB key format
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
X-TUID: XLRhb1E1ZAbV

On Thu, 11 Jun 2020 at 17:15, Eric Auger <eric.auger@redhat.com> wrote:
>
> Instead of using a Jenkins hash function to generate
> the key let's just use a 64 bit unsigned integer that
> contains the asid and the 40 upper bits of the iova.
> A maximum of 52-bit IOVA is supported. This change in the
> key format also prepares for the addition of new fields
> in subsequent patches (granule and level).
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 1dceec5cb1..7b9d2f0eb7 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -88,11 +88,6 @@ typedef struct SMMUPciBus {
>      SMMUDevice   *pbdev[]; /* Parent array is sparse, so dynamically alloc */
>  } SMMUPciBus;
>
> -typedef struct SMMUIOTLBKey {
> -    uint64_t iova;
> -    uint16_t asid;
> -} SMMUIOTLBKey;

I think we should keep the SMMUIOTLBKey type to abstract out what
the key type is under the hood, so it would now be
 typedef uint64_t SMMUIOTLBKey;

(and then the code that works with SMMUIOTLBKeys should never
directly look at it as a uint64_t. If you wanted you could
put the abstraction layer into place with the existing
SMMUIOTLBKey type and then change the type in a second patch.)

> +uint64_t smmu_get_iotlb_key(uint16_t asid, uint64_t iova);

This should return SMMUIOTLBKey rather than uint64_t,
or pass in the pointer, like:
   smmu_get_iotlb_key(SMMUIOTLBKey *key, uint16_t asid, uint64_t iova);

thanks
-- PMM
