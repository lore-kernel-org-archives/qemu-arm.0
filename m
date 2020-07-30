Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2571653lfy;
        Thu, 30 Jul 2020 06:40:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDwCXEFbbfQ7EqS0xuzPhYTqt6xtD1QWkKYoYMm2OoIpTJmLn6bbmLlAx/ifIYAlLeSzRz
X-Received: by 2002:a25:8b07:: with SMTP id i7mr4503469ybl.39.1596116408737;
        Thu, 30 Jul 2020 06:40:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596116408; cv=none;
        d=google.com; s=arc-20160816;
        b=01hHHfIK+JLWydBxPyCxC2/G/uM25ClB2z5xeEz/Ft9d1hXygTfIdPVkFYrUFJoPd3
         JjbMgBb8aCExpJUcBen03IoXachAxcSHW5fn7zR57tp7UZfVo6ZOo3SoHEfkIhNOE/NI
         I75NyPGRQQmvYWPVvT3GtakGf2gJUyScsMc5BAaeV7gSLCsCjZLOJNFkgOoffkAgkqP3
         a/uqJZ58fGrbUb7iAA0n6qUpaYPr2cgwa8PC5KlCT9sZE/BOfGOCXcHH/J23mOZtOyi4
         e+ROiAw6Ls+696n8rB603nB8PRSdIPJVOam2xCLiHPe6TwTD8XH5NHTXKENNQQfyHdSV
         geZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hdyRaw+MpaZ1o/hv+4EuxaYQmnmMM0DvdREl5n2wCGQ=;
        b=LAHqiWf4QvO0u22JHe40yqfUSO1G+5LMQbq1f/3W0KZKmjFv5yeZwxaqnWTA+LBKdd
         TUHGNRjgwzVtDfgVoYlahuCdLXUDWPySW4t96JV9q+46LxLHG6Tt23lCCXb2nl0iBh7b
         7A0ELbMZvpZPIZUc1AkQUwDOHb75g+x0gPGwxtapEDhbPB6UfFz9jNQXveh+H108Onbl
         MwOa/CIwRVdDBpC4NYLizmj/85MU5d/XXUdv8LRwZ/oKUV7chhPf2TdlyuT/5aByXpFd
         9NHb+hIgFc+zyRUlmTcpPRvF4C2lU5B2w9141LR+lBXwYUOjYsasF8bzyfUiM/1p5wl4
         zaYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xZHBX+tv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c132si2617567yba.438.2020.07.30.06.40.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 06:40:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xZHBX+tv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k18n2-0003jo-4b
	for alex.bennee@linaro.org; Thu, 30 Jul 2020 09:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k18mq-0003hY-2y
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 09:39:57 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:38582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k18mo-0007yi-Fa
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 09:39:55 -0400
Received: by mail-oi1-x243.google.com with SMTP id u63so11983747oie.5
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2020 06:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hdyRaw+MpaZ1o/hv+4EuxaYQmnmMM0DvdREl5n2wCGQ=;
 b=xZHBX+tv4T2K5aDn2kS15RGDFqJmFBhMgv2ThCzxcJHpRz2y2Sl3O9M83Uyr5RvnrC
 RKEl5gEn4O/he2iYb4lhvyMht3Po0jhRlRvrL6x6D1PeNKoNMKIyFcLtsjl3aRT5I49b
 QLivo3gecmT7fw+mrRhkt50JORu3Opf07yhevWWsBpwE5TCHm44mZvcwuD/5b3yNrlxB
 +n+9xzwUJG8TWK6rfC1kpGP9knXA1Q5ucNsQxklwLAch81a8JLhjouIdwhXwZaym9faD
 wK99ZT84vCAgRo5Y/hnsXD8XYwRirbxih2r6mER3yIxwUdR23r7I1CdXDr0G0rVh8RRe
 hV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hdyRaw+MpaZ1o/hv+4EuxaYQmnmMM0DvdREl5n2wCGQ=;
 b=M3eXXZB+5ITIvVsPE4OrGWpXhmDIFK/QKWoz2f1ZEgQdfdgorUbg6bIc7u80OQRyOj
 yt0pexwausQ6H3LG3yZFrbDQ/5Md2/KMedjpnGwdpdHaDocLLLZ0xCILrmTc5Nj/I0Zk
 coyKxgWwh7PHzsEe2jQsyLzYuQMFVE7PD5CGadjkzfcC4GU3DbMiXSaoHetnskt1YUUU
 YIWNvjj2pVgc2zrNsDvE6EiaUJN+9Ee2R304Ak9RxqgZHvZWcpg1q8ucI/8x5huubg2N
 TzKDWUtosv96lyyI1WyoM9YpH/fA6kt8O2LPo1kiEgnAcW4QR4wd0Q2NRzLjhqBnHzF6
 29sw==
X-Gm-Message-State: AOAM5336zb12MzyWFy3TLBMaQhdys61KzagUEo/hOUsv4B2nJgaOUdwz
 8vHjOEwTB4gMCDDLNLwg+bZJU7zNH7mxGbENu1BFeg==
X-Received: by 2002:aca:4a96:: with SMTP id
 x144mr11531005oia.163.1596116393306; 
 Thu, 30 Jul 2020 06:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200728150815.11446-1-eric.auger@redhat.com>
In-Reply-To: <20200728150815.11446-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jul 2020 14:39:42 +0100
Message-ID: <CAFEAcA9Dh=cNr95ajznpQHCLQ0REFmjSZCTaygGOZEP8vg3swA@mail.gmail.com>
Subject: Re: [PATCH for-5.2 v4 00/11] SMMUv3.2 Range-based TLB Invalidation
 Support
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-TUID: 9Pq3rNzp4Ehb

On Tue, 28 Jul 2020 at 16:08, Eric Auger <eric.auger@redhat.com> wrote:
>
> SMMU3.2 brings the support of range-based TLB invalidation and
> level hint. When this feature is supported, the SMMUv3 driver
> is allowed to send TLB invalidations for a range of IOVAs instead
> of using page based invalidation.
>
> Implementing this feature in the virtual SMMUv3 device is
> mandated for DPDK on guest use case: DPDK uses hugepage
> buffers and guest sends invalidations for blocks. Without
> this feature, a guest invalidation of a block of 1GB for instance
> translates into a storm of page invalidations. Each of them
> is trapped by the VMM and cascaded downto the physical IOMMU.
> This completely stalls the execution. This integration issue
> was initially reported in [1].
>
> Now SMMUv3.2 specifies additional parameters to NH_VA and NH_VAA
> stage 1 invalidation commands so we can support those extensions.
>
> Supporting block mappings in the IOTLB look sensible in terms of
> TLB entry consumption. However looking at virtio/vhost device usage,
> without block mapping and without range invalidation (< 5.7 kernels
> it may be less performant. However for recent guest kernels
> supporting range invalidations [2], the performance should be similar.

I think this is all reviewed now; I've put it on my list
of series to apply to target-arm.next in once 5.1 is out
and we reopen the trunk for 5.2.

thanks
-- PMM
