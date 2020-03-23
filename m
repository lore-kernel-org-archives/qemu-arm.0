Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1427758lfi;
        Mon, 23 Mar 2020 06:04:49 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtqgsqTBYQfTF5XMJV6UfW/uTCud4D33TSfp0NBulvfrQP+3Br6DLibJi7gPiHfdPOGV6yx
X-Received: by 2002:ac8:73c7:: with SMTP id v7mr7302940qtp.383.1584968689344;
        Mon, 23 Mar 2020 06:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584968689; cv=none;
        d=google.com; s=arc-20160816;
        b=Ms8urHZx31JQMBVjMAuF21ctOgyQEvlAsAe2GRd5n8PgsRsHsYnk5FqREspdcNQrH1
         lPxMGG2NykhO4f8JxHHFVdLTajHlCcXGhQKC5sy8osE3WS3fEmB0mrbbmFe+MnKVU0M6
         QJqwp2Qi1F1k9rdJ2fyCeVUvb8AAH3YYHqb4YbGLpoPbFe8bCwpzMkPnMzYc6moMUUe+
         pA7nulZCjygVdTcPyZwwltsFJZnrsG/dLl8SP+cyufnc9Q3hHbnNRaeOlJrRqPJmF+eN
         z3bovnbmk4+EsJsNaB5/xmC3I7PRbDefWNesukaDoT/3o13S3F5WHKqQpLfzUXxNB+rX
         Icpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=U4Murym63psX6+meV4lKlRgPFKJCk2F10k6WzTNwuxg=;
        b=CpKYBCqCMQovHL7sASn43fXK4AJzhvCAcW/lcrmMpv60+AnKPejgywJSqt53cV6Xga
         3AstPjY72EdF+s+X7CYugXo9MzZV+qE39rph6G3IceK77W6/eFciHQ3CWjVl4WCe9AFF
         UQUQgVRhhd8Ho6mHCXmXpB0sTvssnSUPNNJlXRttXOXDoFTvas8h1i3Ec1F87YRBGlwI
         jhl7UDj+SJQYH1Ljp29Z/LVCAoK5Ah62D/M8m+2mcJJVn0FthMtGSIQjhHtHo75PJcM5
         o+15C0XkMgYOLh0F1a2dXNx8jJ4TO8jsHBr4/ruU8QGLc/QuKDDov9/es3jsj5EzTyZB
         9/vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eJICmNXO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g58si7451202qta.296.2020.03.23.06.04.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 06:04:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eJICmNXO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGMl6-0003K0-NR
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 09:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55984)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jGMky-0003Hx-7g
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 09:04:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jGMkw-0002Ea-Uy
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 09:04:40 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:31423)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jGMkw-0002EF-R4
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 09:04:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584968678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U4Murym63psX6+meV4lKlRgPFKJCk2F10k6WzTNwuxg=;
 b=eJICmNXOKMu99D2PypFvsVVsDMQrOrWgovrmTtLDwZ4kdVyWE+XPhLq0mhNHLgBN/xq7sA
 aWt1aK1vwNBTdSYvnvQIrRn/5EQEwDgjC+EBaKC18ZanMMLKD0su3E1zO9mJx77u8c5tJ5
 39cigqqfU9LSceGoPKzPk12CmRXTNLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-p2lY1WNCM5quTXMe0tST5A-1; Mon, 23 Mar 2020 09:04:36 -0400
X-MC-Unique: p2lY1WNCM5quTXMe0tST5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF96B107ACC4;
 Mon, 23 Mar 2020 13:04:34 +0000 (UTC)
Received: from localhost (unknown [10.40.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A460A5E242;
 Mon, 23 Mar 2020 13:04:00 +0000 (UTC)
Date: Mon, 23 Mar 2020 14:03:58 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v3 03/10] exec: Fix for qemu_ram_resize() callback
Message-ID: <20200323140358.76d534f4@redhat.com>
In-Reply-To: <20200311172014.33052-4-shameerali.kolothum.thodi@huawei.com>
References: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
 <20200311172014.33052-4-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, david@redhat.com,
 shannon.zhaosl@gmail.com, mst@redhat.com, qemu-devel@nongnu.org,
 xuwei5@hisilicon.com, linuxarm@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A6Cv3HAQcNJT

On Wed, 11 Mar 2020 17:20:07 +0000
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> From: David Hildenbrand <david@redhat.com>
> 
> Summarizing the issue:
> 1. Memory regions contain ram blocks with a different size,  if the
>    size is  not properly aligned. While memory regions can have an
>    unaligned size, ram blocks can't. This is true when creating
>    resizable memory region with  an unaligned size.
> 2. When resizing a ram block/memory region, the size of the memory
>    region  is set to the aligned size. The callback is called with
>    the aligned size. The unaligned piece is lost.
> 
> Because of the above, if ACPI blob length modifications happens
> after the initial virt_acpi_build() call, and the changed blob
> length is within the PAGE size boundary, then the revised size
> is not seen by the firmware on Guest reboot.
> 
> Hence make sure callback is called if memory region size is changed,
> irrespective of aligned or not.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> [Shameer: added commit log]
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> Please find the discussion here,
> https://patchwork.kernel.org/patch/11339591/
> ---
>  exec.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/exec.c b/exec.c
> index 0cc500d53a..f8974cd303 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -2073,11 +2073,21 @@ static int memory_try_enable_merging(void *addr, size_t len)
>   */
>  int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)
>  {
> +    const ram_addr_t unaligned_size = newsize;
> +
>      assert(block);
>  
>      newsize = HOST_PAGE_ALIGN(newsize);
>  
>      if (block->used_length == newsize) {
> +        /*
> +         * We don't have to resize the ram block (which only knows aligned
> +         * sizes), however, we have to notify if the unaligned size changed.
> +         */
> +        if (block->resized && unaligned_size != memory_region_size(block->mr)) {
> +            block->resized(block->idstr, unaligned_size, block->host);
> +            memory_region_set_size(block->mr, unaligned_size);
> +        }
>          return 0;
>      }
>  
> @@ -2101,9 +2111,9 @@ int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)
>      block->used_length = newsize;
>      cpu_physical_memory_set_dirty_range(block->offset, block->used_length,
>                                          DIRTY_CLIENTS_ALL);
> -    memory_region_set_size(block->mr, newsize);
> +    memory_region_set_size(block->mr, unaligned_size);
>      if (block->resized) {
> -        block->resized(block->idstr, newsize, block->host);
> +        block->resized(block->idstr, unaligned_size, block->host);
>      }
>      return 0;
>  }

