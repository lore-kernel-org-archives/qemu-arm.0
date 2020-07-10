Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp490853lfm;
        Fri, 10 Jul 2020 02:11:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycK3+iii/y8ZV6aMMZaUZ7/ALNtCmr88xm27Xi+4PMqqkYKzSuhFfoqmcLwWRsDDCdqRxO
X-Received: by 2002:a5b:b0d:: with SMTP id z13mr27286508ybp.98.1594372262587;
        Fri, 10 Jul 2020 02:11:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594372262; cv=none;
        d=google.com; s=arc-20160816;
        b=U6F2q7OqxpujCHB8rkNAcYbcXlQA9bwUNpAR5Pb+twTvEFFi08BrHfrqdo8tQcSLw8
         XOxbngHhrYgf3/JikUZHyonk78uMokXLWYFa9vP6qTrCYJLg3OVfTaknSNN8xfdbguZf
         gsi2Yyl+vkonn5ep5l3QP3X1l1Y3b/dXLTbAs0bdZ4NioIHgzYv3lXGDQiFLMEl773ob
         sTOli0kNUV2wu8SNtBXzBRr18+/pKDNK609f5GumDbaQqU505UpC7wKIqHTrixzulAVz
         xnPz0wl+HpCtas7gfCExwurfAsZcWDimebdzicosHdWT+ShmQEP0pNR+9StkJpT9Wx/I
         r57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0sKLuAGm/07zoHFve/EB/qSwfzst4W9hReel6UkuZH4=;
        b=mlwHq/Al/5hXikJ7F5XsidcEmD58KYSsd9rfiTVe6rq+4nPIDPDL9xoGU5OEd9Blq/
         zLytz98mGLrfL0OMLpGXp0bew1JLqlualRg3Ac98Zqqw78x7U80bZ376aaAzMeOfxMeW
         G6vCozuAnQk0waEy4CibRLU8475EZ5mVYngyUPeEZ2bjDqNek4mA5MTA/8iGp9SoQRTc
         Yrna4atGSiBDTUCsI7UTCrZcBo5W4H9wcHjCTLG1yeAAtcJKmtq8Ax2y7WELNRuyGCVY
         TM33xSUdYVLycMCybhEnTuc3Vseq9Qd2Wi+Qk5xmC1uX/vGrN4YVSJS9mhWPRV3js/hj
         AZ8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lsH1N3Bu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e141si4881520ybb.230.2020.07.10.02.11.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jul 2020 02:11:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lsH1N3Bu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtp3e-0003VT-02
	for alex.bennee@linaro.org; Fri, 10 Jul 2020 05:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtp3T-0003T0-7n
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 05:10:51 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:33850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtp3Q-0002FJ-Iw
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 05:10:50 -0400
Received: by mail-ot1-x343.google.com with SMTP id e90so3741410ote.1
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2020 02:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0sKLuAGm/07zoHFve/EB/qSwfzst4W9hReel6UkuZH4=;
 b=lsH1N3BuuhS7re4J4dRC5Ok3CMIuYWhT0eO4OP71qvBGAE0puguVILUc66vERYcxIR
 LPej1vc4e1bVTRcBTFZnyY0Qlhq8C5NH9Su49ZRMqGi+Z6pbM7xuROLLrNMdZW7A+UIL
 qBq6/EuVyN4cz8NRbTbKQW4UfO0QQsNu0BahFO+BId1rVdyu1lKSkVToAYm6mNiAX4yX
 NMxZpAuPh83Ms89v3+BjE6iU0gu0gdHCtmD4StbJah7P+nQYWPKynTKQqvkz4vEwQinj
 1kAvC9EAnKIWG6dqAlM/b7A/c3uulBOoAmX3m9iyWat8BtYOXRMX0OnagV+6WA/2xxIY
 bxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0sKLuAGm/07zoHFve/EB/qSwfzst4W9hReel6UkuZH4=;
 b=nPieeprEkck2mHrHJnv6ExRSFOHCRcVVa4yqNT5/FY0badQfTpFxq7BzcZpropQ76y
 ydmA8tAKIkUzStD2NvOD7kM3h8Hoj+0IUxC+2RQs4stjgf0Tynmn3xpjy3q/+Q7u5yWP
 +iUxUBdleJAWwGaaBNDTSaTBlr5K5xxH3OyVUzUcASWRKhKTouU57xZAbjvrVuqKNSb8
 +RRXle26nSwyFAu6yQZqALHR9Ka5QI4SidqD5hUfeMz5LnSvTQF6BDLzuZLpu1hS/CAN
 /LW06m4FqIA4fguH8wINKUG0PKcuPKJ9r7+35+0N024hdE/s6NiwJ66LKO5gMfxaAD2j
 QE6g==
X-Gm-Message-State: AOAM531QVvLU0dP1v4FbfzKINpThOW7W1g+sClD/EKubJOqpx47t3nS0
 /NodYBjwiXr17DR87XAW1BHftrdwPRACwpSNroy+kP5P
X-Received: by 2002:a9d:7303:: with SMTP id e3mr49698179otk.221.1594372246886; 
 Fri, 10 Jul 2020 02:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200708141856.15776-1-eric.auger@redhat.com>
 <20200708141856.15776-10-eric.auger@redhat.com>
In-Reply-To: <20200708141856.15776-10-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jul 2020 10:10:35 +0100
Message-ID: <CAFEAcA8H_wOCDdoSeTALXV_QArm6EjCdHiUZYW3ezTW287V28Q@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] hw/arm/smmuv3: Let AIDR advertise SMMUv3.0
 support
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Sjm2dpRjGMg1

On Wed, 8 Jul 2020 at 15:20, Eric Auger <eric.auger@redhat.com> wrote:
>
> Add the support for AIDR register. It currently advertises
> SMMU V3.0 spec.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
> ---
>  hw/arm/smmuv3-internal.h | 1 +
>  include/hw/arm/smmuv3.h  | 1 +
>  hw/arm/smmuv3.c          | 3 +++
>  3 files changed, 5 insertions(+)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index ef093eaff5..6296235020 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -64,6 +64,7 @@ REG32(IDR5,                0x14)
>  #define SMMU_IDR5_OAS 4
>
>  REG32(IIDR,                0x18)
> +REG32(AIDR,                0x1C)

Rest of file uses lowercase letters for hex values, so "0x1c".

>  REG32(CR0,                 0x20)
>      FIELD(CR0, SMMU_ENABLE,   0, 1)
>      FIELD(CR0, EVENTQEN,      2, 1)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
