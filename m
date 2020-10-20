Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4700697lfa;
        Tue, 20 Oct 2020 04:34:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiVWUCKVtdCOavz0k8/p/tRaEPN9zkEtrrjXtWtb12qfXu6Hps+ChLbU4i4cU2qCQRuvO+
X-Received: by 2002:a25:cc81:: with SMTP id l123mr2880180ybf.155.1603193672613;
        Tue, 20 Oct 2020 04:34:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603193672; cv=none;
        d=google.com; s=arc-20160816;
        b=Mbs2NyvdXvAXsKOm6YIlpZr0dKTB2MWhzWcnKKbExn2T1vSWvWTFMIT48McHuHc5mY
         5oM2Vycebu6ceruzOAOMAvayfN+6ScW3WYPyChX8P612UDZQmAAdx21Q9r0f+yyhQ+ql
         Lhw3y0Ja2ZBE2cLB+yzmK44vdPgL1SQKFvMzhsS3j5V/d4uscdU6bAXMVLI45yZW2Y74
         oqpnORgXpw9uuqQ170waMKSitdzy5IlMIhr993O+P8a+3KP/43Nf/S27KwkpjdD6njf/
         jYtg7nNphHFU/K73NItxYNz3Pvqqdhxqsou4bgSfL+nQEcQ43UR9i92dVEydmjZC/nIi
         Nafg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QONgRfenDuI4RpW0FL5NIret7BNhEnCuWDDU9PU5+As=;
        b=SCdZT09J7VRFeK4+1ehGtfD+DVVxjGqO2b/U7g7vgAQYdeTFj5c1+UqHOTI5TQJ5Ay
         AsnhIEMgnFf+UCAhscQWG8JG3e998yhjZk2MBp3oOcGM2lwjQBWuX7zzIHndJAaxnUYL
         FHmhIhhphqnlsBxGmbhUDD2d3Gu7NS33Rz+rzWliGffG/NuELASxc1DTozSp/Jp6BMVm
         UKUUr7Jqn7vnWOfgLFPS09Ru/eVGOxcALFjtMrachC/4+iIyqVaW9DWp25wpo+gDYrAd
         1fEHCXMwIZNoVNo6NAgxdJbYeQfc/8lOGTDF1vfvN6A8WgdBVo4Pd/upLUgGrMRHXdHC
         U0MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Noa1QOKv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18si1573396ybj.148.2020.10.20.04.34.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Oct 2020 04:34:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Noa1QOKv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUpuR-0001is-RR
	for alex.bennee@linaro.org; Tue, 20 Oct 2020 07:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUpu4-0001eQ-Sh
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 07:34:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUpu2-0002NB-D2
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 07:34:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603193644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QONgRfenDuI4RpW0FL5NIret7BNhEnCuWDDU9PU5+As=;
 b=Noa1QOKvMsxLQfvP81anStTvN1Rk3kIeFgbYrFGlVSWKcZ0eKskvr4RWJK93+SpFq27Q7v
 3sEvXTTuCZjcx2aVyfW5vtGN15k8o8jcc1RZ/Lj+lk9Qd3q+pLaCNEXnFv7Wxyo/yk04Di
 1bfmwvBS2xWx2MLZihykz0iMrDVE8xk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-aaceRuvTNNedOVvC0bW9GA-1; Tue, 20 Oct 2020 07:34:03 -0400
X-MC-Unique: aaceRuvTNNedOVvC0bW9GA-1
Received: by mail-wm1-f72.google.com with SMTP id r19so348053wmh.9
 for <qemu-devel@nongnu.org>; Tue, 20 Oct 2020 04:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QONgRfenDuI4RpW0FL5NIret7BNhEnCuWDDU9PU5+As=;
 b=FA6NxHhDJztyYR/2osP08TcXlIWooWqa+HuLhZw+n2tsIhBhv6l7MP02PhjhcXGz+6
 1cJZUIVln5Uc0kgh5fQaArlksFUNWjlLnOVlR8mEJ4s/KaylbSYiiv/XOnvbcCbeP+Gy
 VZDlrdW9zVtkTqnGauWDXEfFi1KCvULmK24tStRA+ZYCM6tspAj3x968SCdin7jBUF/n
 7Nmrz16Ato7RugsKCXKbcby0I4Fg5I/TxKwA7OvqlUhbKkg8xz0M1NVaHVOpF9QZN0H9
 q+7ogX4eiYNTbrgxyeiFkXm/zLGLePJ7UWragXiNO3Vq+btmTmymyhFPjgymz9jlLaW0
 dISw==
X-Gm-Message-State: AOAM531i/FuXipsdJ6k+3EPU4kpXnMfQD6gXcnec5s0LgrXONW20Z0C8
 HLKVFvTG8UfsNDZyShRmbiFa/vRlWx3RYd6Bvhuo/h4Va4wxY8+4kEecvpD39YYdxOApoDUQZog
 UzgSuWcluCSGeyQw=
X-Received: by 2002:adf:edc6:: with SMTP id v6mr2941057wro.273.1603193642053; 
 Tue, 20 Oct 2020 04:34:02 -0700 (PDT)
X-Received: by 2002:adf:edc6:: with SMTP id v6mr2941020wro.273.1603193641803; 
 Tue, 20 Oct 2020 04:34:01 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id i10sm2977962wrq.27.2020.10.20.04.34.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2020 04:34:00 -0700 (PDT)
Subject: Re: [RFC 5/5] block/nvme: Align iov's va and size on host page size
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanha@redhat.com,
 fam@euphon.net, alex.williamson@redhat.com
References: <20201015115252.15582-1-eric.auger@redhat.com>
 <20201015115252.15582-6-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <71f7e137-6664-60d9-eb20-887de6a05eac@redhat.com>
Date: Tue, 20 Oct 2020 13:33:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201015115252.15582-6-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:15:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nv+8zgaZAAjv

On 10/15/20 1:52 PM, Eric Auger wrote:
> Make sure iov's va and size are properly aligned on the host page
> size.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>   block/nvme.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/block/nvme.c b/block/nvme.c
> index be8ec48bf2..45807ed110 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -978,11 +978,12 @@ static coroutine_fn int nvme_cmd_map_qiov(BlockDriverState *bs, NvmeCmd *cmd,
>       for (i = 0; i < qiov->niov; ++i) {
>           bool retry = true;
>           uint64_t iova;
> +        size_t len = QEMU_ALIGN_UP(qiov->iov[i].iov_len,
> +                                   qemu_real_host_page_size);
>   try_map:
>           r = qemu_vfio_dma_map(s->vfio,
>                                 qiov->iov[i].iov_base,
> -                              qiov->iov[i].iov_len,
> -                              true, &iova);
> +                              len, true, &iova);
>           if (r == -ENOMEM && retry) {
>               retry = false;
>               trace_nvme_dma_flush_queue_wait(s);
> @@ -1126,8 +1127,8 @@ static inline bool nvme_qiov_aligned(BlockDriverState *bs,
>       BDRVNVMeState *s = bs->opaque;
>   
>       for (i = 0; i < qiov->niov; ++i) {
> -        if (!QEMU_PTR_IS_ALIGNED(qiov->iov[i].iov_base, s->page_size) ||
> -            !QEMU_IS_ALIGNED(qiov->iov[i].iov_len, s->page_size)) {
> +        if (!QEMU_PTR_IS_ALIGNED(qiov->iov[i].iov_base, qemu_real_host_page_size) ||
> +            !QEMU_IS_ALIGNED(qiov->iov[i].iov_len, qemu_real_host_page_size)) {
>               trace_nvme_qiov_unaligned(qiov, i, qiov->iov[i].iov_base,
>                                         qiov->iov[i].iov_len, s->page_size);
>               return false;
> @@ -1143,7 +1144,7 @@ static int nvme_co_prw(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
>       int r;
>       uint8_t *buf = NULL;
>       QEMUIOVector local_qiov;
> -
> +    size_t len = QEMU_ALIGN_UP(bytes, qemu_real_host_page_size);
>       assert(QEMU_IS_ALIGNED(offset, s->page_size));
>       assert(QEMU_IS_ALIGNED(bytes, s->page_size));
>       assert(bytes <= s->max_transfer);
> @@ -1151,7 +1152,7 @@ static int nvme_co_prw(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
>           return nvme_co_prw_aligned(bs, offset, bytes, qiov, is_write, flags);
>       }
>       trace_nvme_prw_buffered(s, offset, bytes, qiov->niov, is_write);
> -    buf = qemu_try_memalign(s->page_size, bytes);
> +    buf = qemu_try_memalign(qemu_real_host_page_size, len);
>   
>       if (!buf) {
>           return -ENOMEM;
> 

