Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1431007lfm;
        Thu, 25 Jun 2020 08:55:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzG7blTSsq5Cyy/fBeUmOYResOi0toCPYJK5Sz7mSajpQUyvsyyZz5MNlc5T43o9VlII4Jx
X-Received: by 2002:a25:aaf1:: with SMTP id t104mr30074556ybi.163.1593100521277;
        Thu, 25 Jun 2020 08:55:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593100521; cv=none;
        d=google.com; s=arc-20160816;
        b=I55aFUKQRUVESHrZzoPg5dnlHRHrpiFS/6DK09xN7AjVV22B4tkDVaEpUHnc55OcTE
         Xn3BGFDjvid+RaSz4oFm83RbZFpHenPNpvL0UsLb69F/PPIX2Mw09oy3Lb3TAVMuhk9/
         xPAC/8Z9kCDF7mBsH4CP9gGFE/OXxNWgSgGu8qD8OY5xY01m1iCq0oSRYTQzkiuTSQIv
         GxF760dk5OCHcZCRWcNALKPT6wVI/h5hajj0VD5DYktsy4oJGchJAvoXa3oBb+35fHfM
         l40epXvIzNzb9ZpJK6Ac+0YdWpGSoyDmAwrsvW4FEk+4BoncYeh90gV0notOv7FM5Nlb
         8WVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eIx4b9nqclWsVVEQtsc7PEI14eNY0OylDfgl0jr6N+o=;
        b=PwC3gxwLh1TnivxseRv7bv5e3zyqFQn8qRZMV09mXkU2rMHFPwCN9Y5/EL7+pI5vdm
         h1YcSiBQfUv2XaMSeCGFWBgqvZu2SVhRbHAwqsnWwRLUWUo4OxkAZjWfyrrcJmEm5PDb
         9LBvbm6NAIR0Ep6Hyt3TqISXsRAQONtOqroqR+9qZiQfGvfx0xy8CUgs8VzsP4YWl/X2
         iPo9/Ztu97sAwd0I0AkI37CFGvyT1Drxn7AOMj8PzUUd0eT9I87jq9a28vJXca7VJODG
         IB5cQK7aJ363c6EhW9Tjoz2JEyvzNdFA/H+i/kz0pJoPrY3z5Au7IYpocZqM+KmVbIVQ
         4q2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CbdgHb55;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k136si1915811ybk.342.2020.06.25.08.55.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 08:55:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CbdgHb55;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joUDg-0004VW-Kn
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 11:55:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joTto-0004jU-Vs
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 11:34:49 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:32980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joTtl-0004ec-LV
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 11:34:48 -0400
Received: by mail-oi1-x242.google.com with SMTP id w10so1832448oih.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 08:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eIx4b9nqclWsVVEQtsc7PEI14eNY0OylDfgl0jr6N+o=;
 b=CbdgHb555xsXFY5UWwnXn6lKmeKjA1ZuREZdNIduU6dv9W74Or0kOnVxcK5AWdf5Y8
 POOkAfQrCr/HaMSo1EdOtnN2NIU5wiYghWHUVGcVBilfEfVVJ3MNsafXMj46NnwjyAkC
 53m1amDRyClkRiecb0stFaIx4MiBdV1uhH+EIYQgDrLnzJyBoYW2G9SmR7lPR25WHmov
 q3Wjg+Aen9OWwvMdCQewqeSLbriEyY2KS0B3+ULhVzLpjvCIbK4dIti84CWwTK9sbZDq
 cydQTAkZXscaOckJW+1whY0xRGYF/FTqpTp7iLx8FlO7yERM1/PJY6AsNSAmKxpCU0BT
 XDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eIx4b9nqclWsVVEQtsc7PEI14eNY0OylDfgl0jr6N+o=;
 b=dZbgmT+ZLJyqEPT2fbl+CnDXx8uWYSxLHtj4O///NpzHhRP28N3P4KJZXXXpO6QQKC
 MPpiEyUAryN56qJAh93KD+UhtrMWVUfzbKBzvGg+MIms0EPvbkYUNbNzF0Tf0ih7O8aF
 3OpWnUxzGGVnY1co0/cDfHSiUK16rLT+vjcN8uxBlop+zgzw7X/bu+qAwcQCEkZbxgyI
 JjyXhqCA98Vk1/ATOpCqB9YSFUB9ZxpaEeaXUXUbmZy3ac5rBs/6PleGKiuH1zl0ler1
 JCStUilM7J0lHxIXNaOxgnOC1HpUYHdPpf/TPMzR4XerUklg9XBL7AIKBF/VcO7L7meR
 vBzA==
X-Gm-Message-State: AOAM531sVriAY1L0kuClPZ5rzjuqYmYd+mP4e/NpMq8yTz0vD0ijRc2W
 lBNrPt70upto3kHvZjmSXK6Yr76PtMKRNJSuKjXFQQ==
X-Received: by 2002:aca:1a07:: with SMTP id a7mr2722313oia.163.1593099284476; 
 Thu, 25 Jun 2020 08:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200611161500.23580-1-eric.auger@redhat.com>
 <20200611161500.23580-8-eric.auger@redhat.com>
In-Reply-To: <20200611161500.23580-8-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 16:34:33 +0100
Message-ID: <CAFEAcA9W9XA6SA1XGnMxC4A91S65K1DRxPeV_VZ_N73iE31wKg@mail.gmail.com>
Subject: Re: [PATCH RESEND 7/9] hw/arm/smmuv3: Introduce
 smmuv3_s1_range_inval() helper
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
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
X-TUID: LczCQ57N/GMz

On Thu, 11 Jun 2020 at 17:16, Eric Auger <eric.auger@redhat.com> wrote:
>
> Let's introduce an helper for S1 IOVA range invalidation.
> This will be used for NH_VA and NH_VAA commands. It decodes
> the same fields, trace, calls the UNMAP notifiers and
> invalidate the corresponding IOTLB entries.
>
> At the moment, we do not support 3.2 range invalidation yet.
> So it reduces to a single IOVA invalidation.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmuv3.c     | 36 +++++++++++++++++-------------------
>  hw/arm/trace-events |  3 +--
>  2 files changed, 18 insertions(+), 21 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 931a2b6872..4eda16be7b 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -840,6 +840,22 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova)
>      }
>  }
>
> +static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
> +{
> +    dma_addr_t addr = CMD_ADDR(cmd);
> +    uint8_t type = CMD_TYPE(cmd);
> +    uint16_t vmid = CMD_VMID(cmd);
> +    bool leaf = CMD_LEAF(cmd);

We used to only read the leaf bit for
CMD_TLBI_NH_VA, but now we read it also for
CMD_TLBI_NH_VAA. That's OK because:
 * the leaf bit really does exist on  both commands
 * the only thing we do with it is print it in the trace
   message, so this isn't fixing a bug

But you could mention it in the commit message.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
