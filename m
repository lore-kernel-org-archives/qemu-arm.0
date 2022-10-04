Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp353465ocb;
        Tue, 4 Oct 2022 10:51:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ECUSoIbnZct/UCOj43xzWGfi2nmqIDVCpx69cwSriCJyy7LCO/RNOV3Y+Z1BScYepuGvf
X-Received: by 2002:a05:622a:1743:b0:35b:a8d6:ff6e with SMTP id l3-20020a05622a174300b0035ba8d6ff6emr21056747qtk.269.1664905903498;
        Tue, 04 Oct 2022 10:51:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664905903; cv=none;
        d=google.com; s=arc-20160816;
        b=JP0D7eEIVOUegjyBPoylthh/6xOrHxYfV8Rj6giSvuAN4eeYVBTWR68mDK2AVDmVSj
         vEAZSIgFHyBdZRpeyuOWVwQbHyoQt1Y8P1tb+w6yjH6BEieaMb+TIqdt2mWdMOC2lOQe
         /3MhR+ybYCunrqiipcsfgyNKAR4RDaEbi3lZLpJf6E8FqIgxRVG3U7hnC8Nfyw1QQ5o0
         FHBVHcEEtwObI3jucnv3OTzg6nmnT+Po4hHhtz4v4/VyMaShCrzrE6D2ATdabeteNNKH
         tqqefG3DM9Fv1OrMDQIWEjhUbHbw3qHLWNUEmwaEtczcZB34wGKTqvT3qT8ZXQS0V1D0
         zowA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:in-reply-to:subject:cc:to:from:message-id:date
         :dkim-signature;
        bh=wnen8TH25X4nHaPLUmOEwJJooxLDatDuPgOORUyqHe8=;
        b=YlWLQ5zx6iNQp3ytsWi1/aJ/1P9OwJT/r2o0VTh64Z+txJpHnuHsufgOQpJqw/5ovT
         1BCqCZBWug3YS9QcLCvwt1aMaiNHHi7AeYFxNosSmmRdj4UjvrCAr6qOCnA4MCDaQ5+n
         N1MRXHdHdW7qdLR2i/l2qIZHA3mNuDjicgywyJCjE5N9szSfF8oK3RNHRsINf/+V+3/X
         tQr6JYm53N9Bv8yZ0slWgGBGHWUxYld94ar6wK1vo0n8dp/sqLjM9YEwluy2eDuuR2/p
         +NcWGPtnI9RRc8SYHw6iSBvj1F/l1za/sXsZOqJe9qbIumvPfPsN2ScT1/E9H0O89Zb6
         KrjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="Pgu/QUZJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5-20020ac85605000000b00342f53c4a9fsi5731753qtr.564.2022.10.04.10.51.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Oct 2022 10:51:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="Pgu/QUZJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:48996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofm51-0007Wu-3e
	for alex.bennee@linaro.org; Tue, 04 Oct 2022 13:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1ofltl-0000ZG-Uw; Tue, 04 Oct 2022 13:40:06 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:37312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1ofltj-0001dC-Vz; Tue, 04 Oct 2022 13:40:05 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2D480B819BF;
 Tue,  4 Oct 2022 17:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4877C433D6;
 Tue,  4 Oct 2022 17:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664905194;
 bh=/bXBfJBMoK1Zc2CJHb1Ig0lrMGs3rAtIB92igWZPn6k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Pgu/QUZJjrdu11TQGgl2ooipQNY0RRDjRs/ssO3uFjfOsN9S3Ay5K9dctOJhxp6kU
 Ss7LrRMY0ZynYSMJyetXGCFmzGqipATwGG7Italgwxplm76kCyjM/nQFEerRj9QCkm
 YdjKOvNw9FJa8ICQ3CzWS3wOtnK2GdBRAiHmvIKIzwM3a6cABdR+QLfHGPB9t7fZkR
 aXZ8BUxttr7VUgtWNaGqW8SiLQ5Oje3PrpbMR5sWDtdZIWzNtKSYDnk21VbtC/obVv
 5dW2O8pr8qmY39QXIG1eyZkojJPQmj+rw2IWP6RKzNqGxiF2b4cm/EYQYcvI5OESA+
 jgSEn4nbF+5BQ==
Received: from sofa.misterjones.org ([185.219.108.64]
 helo=goblin-girl.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <maz@kernel.org>) id 1ofltY-00EZud-Ki;
 Tue, 04 Oct 2022 18:39:52 +0100
Date: Tue, 04 Oct 2022 18:39:52 +0100
Message-ID: <86bkqr8p3r.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: Re: [PATCH v4 6/6] hw/arm/virt: Add 'compact-highmem' property
In-Reply-To: <20221004002627.59172-7-gshan@redhat.com>
References: <20221004002627.59172-1-gshan@redhat.com>
 <20221004002627.59172-7-gshan@redhat.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: gshan@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, cohuck@redhat.com, zhenyzha@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org, shan.gavin@gmail.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=maz@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BKUXIGGVjYpc

On Tue, 04 Oct 2022 01:26:27 +0100,
Gavin Shan <gshan@redhat.com> wrote:
> 
> After the improvement to high memory region address assignment is
> applied, the memory layout can be changed, introducing possible
> migration breakage. For example, VIRT_HIGH_PCIE_MMIO memory region
> is disabled or enabled when the optimization is applied or not, with
> the following configuration.
> 
>   pa_bits              = 40;
>   vms->highmem_redists = false;
>   vms->highmem_ecam    = false;
>   vms->highmem_mmio    = true;

The question is how are these parameters specified by a user? Short of
hacking the code, this isn't really possible.

> 
>   # qemu-system-aarch64 -accel kvm -cpu host    \
>     -machine virt-7.2,compact-highmem={on, off} \
>     -m 4G,maxmem=511G -monitor stdio
> 
>   Region            compact-highmem=off         compact-highmem=on
>   ----------------------------------------------------------------
>   RAM               [1GB         512GB]        [1GB         512GB]
>   HIGH_GIC_REDISTS  [512GB       512GB+64MB]   [disabled]
>   HIGH_PCIE_ECAM    [512GB+256MB 512GB+512MB]  [disabled]
>   HIGH_PCIE_MMIO    [disabled]                 [512GB       1TB]
> 
> In order to keep backwords compatibility, we need to disable the
> optimization on machines, which is virt-7.1 or ealier than it. It
> means the optimization is enabled by default from virt-7.2. Besides,
> 'compact-highmem' property is added so that the optimization can be
> explicitly enabled or disabled on all machine types by users.

Not directly related to this series, but it seems to me that we should
be aiming at reproducible results across HW implementations (at least
with KVM). Depending on how many PA bits the HW implements, we end-up
with a set of devices or another, which is likely to be confusing for
a user.

I think we should consider an additional set of changes to allow a
user to specify the PA bits as well as the devices they want to see
enabled.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
