Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp474324lfg;
        Thu, 25 Feb 2021 07:56:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyphuRQDu/4ilu9DnemYniP/9Iha25gb4cTgWz5eDNe9SjyMZpJH+A+5GS7dCiAkCHU+0zV
X-Received: by 2002:a5e:dd46:: with SMTP id u6mr3231997iop.73.1614268599577;
        Thu, 25 Feb 2021 07:56:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614268599; cv=none;
        d=google.com; s=arc-20160816;
        b=Wqi7Tp6malRgQVxlJMgDh0eCk1Hw+94Wkl13YBkOGs+inJpqvXO3HNI1suTw2K2nlj
         Pj7S+pMMQ6SpXonX37RrKdBhmRXvN1i4VBJ8vAkzPJIV01dUA1duow2kBPYIVMgTjT64
         7qsLUVfONYtxN3Pxlj+O8VeAh+ENTdMn6Jd7q8gotCfHMhK8R31BOu4EseIWYGiEIR8t
         BGoLzp9UpDMfr9KTAPCSBhNKQju2c/wZnHjWVstgyQ3mvAe4IuiH9iO/xbuD4gjUXFYO
         IhU8IgzApUUlnTcG6DkeNwPdHoBTv0qe7HjEBwJAKALtV+c8rShm6WloZckcgs6p2oR9
         YgCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=hpQPOnB6Md6K9kFbFsiD78ry0yvucg4/u1aMCB3awsE=;
        b=AAG5lpdOwlCXRsh/MuNQQMxQrU/f1/puhNwFPA9ogGoRBtOGvaQX3LoGetgM1li04h
         EYfQLwAf4qqinVp0B4i0BSSIPJai7/fYHQZMtnPECbXUhN1/0BP0phdvT8JkCkyshNsG
         OudfS/ZlZbbpni4QFrDD8ZEZXIf20rscMEadThEE0Gb1OoJ/Tk0G8Wl6xCQPh/Y5hlxD
         cESYRiKq3myk4gCwSsG8o3iQgRpgRKndKherB+GteuGSFltBkYek0BFN0EqKVrCuWPTs
         G3joWXnlbkB7PiuKDecAtVlsFOrCih3UkmCWiZkq229KaaVEFKCSmHiQ6fHTO1Fgt5IW
         6Weg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dehLlYDk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4si5680800jad.53.2021.02.25.07.56.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 07:56:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dehLlYDk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFJ0I-0000U9-Kv
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 10:56:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lFJ0B-0000Tv-EC
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 10:56:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lFJ09-0001Mf-1L
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 10:56:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614268588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hpQPOnB6Md6K9kFbFsiD78ry0yvucg4/u1aMCB3awsE=;
 b=dehLlYDkj5hgWtgKMjG7Te1ADvf+XHj5XODmiDfqaB5fCyKJ90otfGdZ0b5pKTvfUWk5VA
 /4vvuGJOdyRQOD/qL0ox9JZCJr053VZimeYSa2q8TASR9mm+xFn3ppFzWFBGzisWTCIhMB
 ulSkOrHbbXGPx3Jtsh3s47rLT8Thx9o=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-Vq4fUN_9MCavebkOE4ElLA-1; Thu, 25 Feb 2021 10:56:26 -0500
X-MC-Unique: Vq4fUN_9MCavebkOE4ElLA-1
Received: by mail-qk1-f199.google.com with SMTP id m16so4764654qkh.20
 for <qemu-arm@nongnu.org>; Thu, 25 Feb 2021 07:56:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hpQPOnB6Md6K9kFbFsiD78ry0yvucg4/u1aMCB3awsE=;
 b=LObR5RtrG9Pt/8KLkyShx8dMtFR7OxJm0whDPRSaZ3pV2i5lUdzUXVk7/Rhj2krTF2
 9P0xzt8ZU0uJ+1iDXyPzJPjMc8aB7enzc1mCQCiDKWfCsOTuu8tk+x4Ncbi01BeFV13H
 W4+KL02WHFrzFwHC0W8F/CoVIZpvqwOJqzJsCAtW1pwb/3pDlCP++FZKS1h8728LVXRV
 ya4Eks4r1JnvA3NTGmVUfxc/43fLt661cVaP1CPpa5UTyeVpWfHW6bBImzBPTW8OgGeQ
 LweYQUSAVfwbEjL+dJRItt9+FR/JXwuvdTZuxQQ4506M66M7EyCDdcyi6sCudXwmwHw0
 LhSw==
X-Gm-Message-State: AOAM531+Ag2gbBWPH+3oX2N85RA8oqhmnCa5DFdJn4aUyLg6e65Mkt/R
 mzQU+rChqQ0CWElB5nOYH6aYa8zVcSw/TgT7hQH3q3BftN7Eef70q4MbsFGNKWWVmNOayWXTmMv
 ywBMnTFIzEG9q
X-Received: by 2002:a05:620a:4055:: with SMTP id
 i21mr3288782qko.55.1614268585269; 
 Thu, 25 Feb 2021 07:56:25 -0800 (PST)
X-Received: by 2002:a05:620a:4055:: with SMTP id
 i21mr3288761qko.55.1614268585001; 
 Thu, 25 Feb 2021 07:56:25 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id s4sm1065277qtw.24.2021.02.25.07.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 07:56:24 -0800 (PST)
Date: Thu, 25 Feb 2021 10:56:23 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 2/7] dma: Introduce dma_aligned_pow2_mask()
Message-ID: <20210225155623.GB250483@xz-x1>
References: <20210225091435.644762-1-eric.auger@redhat.com>
 <20210225091435.644762-3-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210225091435.644762-3-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, jasowang@redhat.com,
 qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
 vivek.gautam@arm.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tFl/NIoPrFTF

On Thu, Feb 25, 2021 at 10:14:30AM +0100, Eric Auger wrote:
> @@ -296,4 +296,7 @@ uint64_t dma_buf_write(uint8_t *ptr, int32_t len, QEMUSGList *sg);
>  void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
>                      QEMUSGList *sg, enum BlockAcctType type);
>  
> +uint64_t dma_aligned_pow2_mask(uint64_t start, uint64_t end,
> +                               int max_addr_bits);
> +
>  #endif
> diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> index 29001b5459..7d766a5e89 100644
> --- a/softmmu/dma-helpers.c
> +++ b/softmmu/dma-helpers.c
> @@ -330,3 +330,29 @@ void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
>  {
>      block_acct_start(blk_get_stats(blk), cookie, sg->size, type);
>  }
> +
> +uint64_t dma_aligned_pow2_mask(uint64_t start, uint64_t end, int max_addr_bits)

Nitpick: If to make it a common function, shall we comment the interface to
avoid misusing it? E.g., start/end seem to be inclusive. Also, max_addr_bits
should be <=64 (and we can also assert in the code, maybe?).

> +{
> +    uint64_t max_mask = UINT64_MAX, addr_mask = end - start;
> +    uint64_t alignment_mask, size_mask;
> +
> +    if (max_addr_bits != 64) {
> +        max_mask = (1ULL << max_addr_bits) - 1;
> +    }
> +
> +    alignment_mask = start ? (start & -start) - 1 : max_mask;
> +    alignment_mask = MIN(alignment_mask, max_mask);
> +    size_mask = MIN(addr_mask, max_mask);
> +
> +    if (alignment_mask <= size_mask) {
> +        /* Increase the alignment of start */
> +        return alignment_mask;
> +    } else {
> +        /* Find the largest page mask from size */
> +        if (addr_mask == UINT64_MAX) {
> +            return UINT64_MAX;
> +        }
> +        return (1ULL << (63 - clz64(addr_mask + 1))) - 1;
> +    }
> +}
> +

In all cases, the code looks right to me:

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu

