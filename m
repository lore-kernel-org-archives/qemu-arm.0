Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1989455lfg;
        Mon, 8 Mar 2021 08:34:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7aOMQVHkifZYIXX9Z+fFCIMUYyurQZ10VZ4Am2ITAMJ69YNXESVAsBB8eMBu6CJ7PTRTr
X-Received: by 2002:a05:6e02:ccf:: with SMTP id c15mr20559089ilj.189.1615221288977;
        Mon, 08 Mar 2021 08:34:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615221288; cv=none;
        d=google.com; s=arc-20160816;
        b=zp3GSxtpzRFlxdKZqWlnfZ96POVzsylrSvIYt585/if2Vv3o/h49+favQy/yVoIZN0
         DE+S81lBD25CxssN5Og+3IzBPIzvi6v0fAP5uh8YsUqlPVPJEd6665gPD1UHA+281Bws
         NkZ/6ewRshH4ETZzARWFU0vgLIVdIoiqt5ACQMIGds9KFWzjwdK8zUUewPDuCuhDm2zD
         MG/MCfg1gmp2QvoRUxG8E95YHHMAckMy39FFY+OrMWUK6SfwAO/OzfiyF93uxLDKKwMI
         RKWKU2p4gx5s7cyJdDoycnC0DtwPj+dTtGpEmQ4Qqma3xdWFBNG7vpEoCPIV4J5f5GVQ
         8wgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IIr3RAE/2BvT/PHAdnb5qTM7sWGGmSdWUSjARFmD1hM=;
        b=ZsVvaKtrzSzkQmEn98J4ro9W2V01APylPWAJOE1XSDhZ1mincewIR0LPGq7JKLerzo
         gd7ocwsnnEWLtZXekZLZt48qx37rWwkayJZ5K3GTpFJThSbELjc3v6EY77RTr3K1cfeV
         FcC7maRwSiF+/155IsxJuGpQNVsVsji6o7FJeXD0E3VpxOFFA8hBJzSxC/PC4R/6z8sA
         YAX0ZVyP83HNtRCG/SBHugUTqwKsn2NtyYf03EpMfAMTLLGD/JibyGtu1zmMDzhUV1Lo
         RJrO2UShYTdKIrVidqEs3sLnpuVYqLOp10XBs0MtubVRdBjMyX1on3tzjaVahy7heAiq
         QtsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FTqsbXQ8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 17si10261138ilg.102.2021.03.08.08.34.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Mar 2021 08:34:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FTqsbXQ8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJIqG-0002il-A7
	for alex.bennee@linaro.org; Mon, 08 Mar 2021 11:34:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJIq3-0002ie-K4
 for qemu-arm@nongnu.org; Mon, 08 Mar 2021 11:34:35 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:43678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJIq1-0007es-EG
 for qemu-arm@nongnu.org; Mon, 08 Mar 2021 11:34:35 -0500
Received: by mail-ed1-x535.google.com with SMTP id bd6so15614259edb.10
 for <qemu-arm@nongnu.org>; Mon, 08 Mar 2021 08:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IIr3RAE/2BvT/PHAdnb5qTM7sWGGmSdWUSjARFmD1hM=;
 b=FTqsbXQ8DaB1B8amUc4lzbMK5fQlWmjJrmEg1RI9bvo9r5RMgoaRu3c6AfVFYdzDSN
 6LbnkB3UV/YXA5bAGtvkZAyvLCw3YSvu6HhPjVsWtRTxTseftfufigzIvWEWE1pf72DQ
 xULIr0OBuLBWgv1EfsVpd8ScbsEr7GLIPlfTKQRdObnhPL/CRmY9Fn6C02gYpkzQPFAo
 3YaFf2SaUnHNwxQJcgk8KiAGUP6C7e+86GUr0mR4qBb7N+mAk5iLfa9XzonWkU9GA+ZC
 VFqH+yB8lQeg0UFCObmzpaDGbwiA1WMDYX+lYRZ4w4qPYrKLJjOXyMewooU99N22oECg
 U0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IIr3RAE/2BvT/PHAdnb5qTM7sWGGmSdWUSjARFmD1hM=;
 b=aMT74bGXqJ9WxwlmFwb/BgGZ/5AbtDe5qNnhzKvdaulMnhU2PisHIkb7z38J9T8AxK
 FKOM1Ayi7SAyWoWMFvv6fZ7xYjukhO8bwS2k+fLyPWoo06/VNzGecrd/AsLXSrgjbZDk
 FTCQUfbqo/yYbAnVHjYK4RhowiDSKhh4t715svqpj9ROKPgDYZt6o18GrfUj74oPcn2B
 GcTQ8F84nWWLkoGmWZsUuPf3k7+eXXNE1jvD4YF1OObOZJjn7P/vUDeMaVo/SkVscHQN
 Ew83a3b1g2Yysx+VZY8m6lqBPFgiy77JyiKc1wYXjVnUvJuyRtrVab9BjX683gFei/tW
 as4Q==
X-Gm-Message-State: AOAM532moizTBbWFPToSpvbANXdbPZIoZtCPl7hy9WW3+Grepv4f85cc
 C3etBDeriFDdypKpn+TD/ysYrtc4/VpI21MaFfFiYQ==
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr9735123edv.44.1615221271714; 
 Mon, 08 Mar 2021 08:34:31 -0800 (PST)
MIME-Version: 1.0
References: <20210225091435.644762-1-eric.auger@redhat.com>
 <20210225091435.644762-3-eric.auger@redhat.com>
In-Reply-To: <20210225091435.644762-3-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 16:34:15 +0000
Message-ID: <CAFEAcA_0YjoSF9BxLxhe_YrZWSQPMxXRtnYL_w1SRc7_iuyS1Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dma: Introduce dma_aligned_pow2_mask()
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, vivek.gautam@arm.com,
 qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XqPITA7joQ3Y

On Thu, 25 Feb 2021 at 09:15, Eric Auger <eric.auger@redhat.com> wrote:
>
> Currently get_naturally_aligned_size() is used by the intel iommu
> to compute the maximum invalidation range based on @size which is
> a power of 2 while being aligned with the @start address and less
> than the maximum range defined by @gaw.
>
> This helper is also useful for other iommu devices (virtio-iommu,
> SMMUv3) to make sure IOMMU UNMAP notifiers only are called with
> power of 2 range sizes.
>
> Let's move this latter into dma-helpers.c and rename it into
> dma_aligned_pow2_mask(). Also rewrite the helper so that it
> accomodates UINT64_MAX values for the size mask and max mask.
> It now returns a mask instead of a size. Change the caller.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> index a052f7bca3..2acb303be2 100644
> --- a/include/sysemu/dma.h
> +++ b/include/sysemu/dma.h
> @@ -296,4 +296,7 @@ uint64_t dma_buf_write(uint8_t *ptr, int32_t len, QEMUSGList *sg);
>  void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
>                      QEMUSGList *sg, enum BlockAcctType type);
>
> +uint64_t dma_aligned_pow2_mask(uint64_t start, uint64_t end,
> +                               int max_addr_bits);

All new globally-visible functions in header files should have
a doc-comment describing what they do, please.

thanks
-- PMM
