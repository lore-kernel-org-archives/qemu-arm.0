Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3615839lfb;
        Mon, 16 Nov 2020 03:23:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqLCO+OxI0lo7aQc5KiyJnkBncJI25DqP4Vaqi560VmPffEr/tnN+15tmi4GIbnmYSJpcr
X-Received: by 2002:a25:abea:: with SMTP id v97mr16346384ybi.275.1605525822114;
        Mon, 16 Nov 2020 03:23:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605525822; cv=none;
        d=google.com; s=arc-20160816;
        b=LnE1q9c4P6KOv3JeGiGq0Q46hQuhOX04IySVNNsgHtj4YnrDebXenD95ws5PNHCr0s
         v4tHBA4/qJGNTK+pCTNtiXsB+l66lXRJvDWx2Rgk/FCNozTr4RsVrJ7atwiB73vZC0uP
         sTA9QsuV8kdcODK7uPV1AuaJp8GnjHH1nnqRrMJ9Qk1rICx+9J3roulEMpm+05OP6zNS
         O5qJKwOf478oy7OjmPdasrkVFj6HveNykRpLVvq3aOfnBkqn5G4HBDLC/RT3fXrzqwz/
         8cRrns40AAmbo2jw8Y2vcqGlxqVIV0gq3mX1xwlLN6nnTY8bX5F89Gi7iFmmu2y62L09
         0IWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=DRKTTWsWHGZGO/jv9zo6HJH4VdJ1mbhniezBmF0H5lY=;
        b=hFmVHxn/8wXWM25LAwr7+oUtn4+ab4llwviDt2PHSqe8bWirGiP4r/5orjZN4tTcDr
         xaOJJNcm/fkk2zBCwpWRh3wWcbxI1o9hNiSPXx5i1Qc9MHgAqLoU3lN4Njkse1WJYYpI
         3UPHhXu/SbzdukA4RSg5MbVpxGfksdPyPKx3B3E1KYbhn3VkfshpmytzRT1pKH5xrGkR
         1fkvZXZXfOHoQXXiLCaWdM4LKzu289W/GHGE4VuzgdlEu9f1t4g50IKv/dqD3dYiwOUf
         hHlulMJKck9scmvrcoGDgOp3FdUnqtxYJDw8AvZy6fnZAs5dRR7alPhJKV1bMUeqswMJ
         /mVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QxPLWU7M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b93si17385449ybi.392.2020.11.16.03.23.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 03:23:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QxPLWU7M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kecbl-0005WA-Gd
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 06:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kecbc-0005Vn-QV
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 06:23:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kecba-0006gI-PQ
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 06:23:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605525810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DRKTTWsWHGZGO/jv9zo6HJH4VdJ1mbhniezBmF0H5lY=;
 b=QxPLWU7MZo3oAxZ3sYfGrVjrhu78OhC1xAFOq/Z0V5cQMoTlrj1euRRHqAM/GVi8fdPMQG
 6i+bgY/Fzcg/2GT6XyBtLWLoagx4iZ8G8lLVMM7n8JxWUyh/DAkBeZo3m6NQOZZI/HSXrQ
 ieAHCT34WYcUSlXo0XPfpwj9uMWtjgw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-E1iLczw9MV-_XN_WqUdRTg-1; Mon, 16 Nov 2020 06:23:28 -0500
X-MC-Unique: E1iLczw9MV-_XN_WqUdRTg-1
Received: by mail-wr1-f71.google.com with SMTP id k1so10881902wrg.12
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2020 03:23:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DRKTTWsWHGZGO/jv9zo6HJH4VdJ1mbhniezBmF0H5lY=;
 b=TI1z3tCUvtxomRvOx6Th18c0aHgyvJ2JIJEgz7oVf+NrTg67/zm9njj4zPXsapZkUS
 eMPpuYqCNEtsBiPbyL9+kieP+n2yIpJBiLvVFCuPT9V/XhgOj5bxDBbZ6c5KMzhh7OB8
 f4OLudGcSaUjJGRoHDKEdDg+gXQb62BU6xdi6thUtUT5cHPRqCCAM7wEcNKE3l6kzQnw
 YuhhP+mSxrn1MptwczFkyT9VJtxkx6a2Td8kPOB7uAbGWXvglKwDgaG2xsEb3t7Bg9Ty
 PlNy6DH/mKay0wnRUlrJgfgZiy1vy8MZ29F1UmZSloDMSaNP3w2KkOcCCTiPVOLrvFd3
 HUiw==
X-Gm-Message-State: AOAM533h1V9wLvtAE/UzNM94gWJcsEvFD6ANXc4maMWu7Uc/4PDKZYxG
 nuIFiu8bouPJPWSXh1cCzy3yu3BMCBQSWUJ2mcNJfG6KgY4eVvbp34zihzN8D5sXf3e8IYpcdjw
 5P/7sHXbc4XRU
X-Received: by 2002:a5d:4448:: with SMTP id x8mr18564700wrr.364.1605525807089; 
 Mon, 16 Nov 2020 03:23:27 -0800 (PST)
X-Received: by 2002:a5d:4448:: with SMTP id x8mr18564669wrr.364.1605525806704; 
 Mon, 16 Nov 2020 03:23:26 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id g11sm22591845wrq.7.2020.11.16.03.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 03:23:25 -0800 (PST)
Subject: Re: [RFC PATCH 1/5] hw/block: blk_check_size_and_read_all should
 report backend name
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20201116104216.439650-1-david.edmondson@oracle.com>
 <20201116104216.439650-2-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0a06d4fd-215b-4bfb-cef7-5d1a03e1a41d@redhat.com>
Date: Mon, 16 Nov 2020 12:23:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116104216.439650-2-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kT2OChIPcrQ+

On 11/16/20 11:42 AM, David Edmondson wrote:
> If there are problems examining or reading data from the block
> backend, the error messages should include an appropriate identifier
> to assist in diagnoses.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>  hw/block/block.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/block/block.c b/hw/block/block.c
> index 1e34573da7..8b284e1f14 100644
> --- a/hw/block/block.c
> +++ b/hw/block/block.c
> @@ -20,9 +20,6 @@
>   * BDRV_REQUEST_MAX_BYTES.
>   * On success, return true.
>   * On failure, store an error through @errp and return false.
> - * Note that the error messages do not identify the block backend.
> - * TODO Since callers don't either, this can result in confusing
> - * errors.
>   * This function not intended for actual block devices, which read on
>   * demand.  It's for things like memory devices that (ab)use a block
>   * backend to provide persistence.
> @@ -32,17 +29,19 @@ bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
>  {
>      int64_t blk_len;
>      int ret;
> +    const char *name = blk_name(blk);
>  
>      blk_len = blk_getlength(blk);
>      if (blk_len < 0) {
>          error_setg_errno(errp, -blk_len,
> -                         "can't get size of block backend");
> +                         "can't get size of block backend %s",

Maybe '%s' to notice empty name?

> +                         name);
>          return false;
>      }
>      if (blk_len != size) {
>          error_setg(errp, "device requires %" HWADDR_PRIu " bytes, "
> -                   "block backend provides %" PRIu64 " bytes",
> -                   size, blk_len);
> +                   "block backend %s provides %" PRIu64 " bytes",
> +                   size, name, blk_len);
>          return false;
>      }
>  
> @@ -55,7 +54,8 @@ bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
>      assert(size <= BDRV_REQUEST_MAX_BYTES);
>      ret = blk_pread(blk, 0, buf, size);
>      if (ret < 0) {
> -        error_setg_errno(errp, -ret, "can't read block backend");
> +        error_setg_errno(errp, -ret, "can't read block backend %s",
> +                         name);
>          return false;
>      }
>      return true;
> 

