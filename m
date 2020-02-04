Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5489176lfp;
        Tue, 4 Feb 2020 07:24:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqyG/CpB/Ih2oB2YDOGSJfeJaBq4339cF9mZZA60WZADpr/nKLYb9jk+vA2SHwDGaAQtxtkd
X-Received: by 2002:ae9:efc5:: with SMTP id d188mr29278271qkg.178.1580829853497;
        Tue, 04 Feb 2020 07:24:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580829853; cv=none;
        d=google.com; s=arc-20160816;
        b=R/eo9GYGwQd6maemCAVG0w5i1+HgguxLPSqC4jh4+/EVC9u75mBZm5FeiZoaieOiJ5
         Spyoh7DFSIfPPWmJ23X71KY96tkUHwoW5jkzxyYsjweyXEYpJ74h/kcRJn75+pcjp+sx
         6NKqmdAo7izxqRnTbXgICS8pJkKmdubmnqaOCmtE/ueXGSvtH3P1GaBjzBPtavfFnH1Q
         19ofn1kisY7dfE6BkpAn3ENoYBpt7xDADqvdNngq9lvDEjZTqem5nY62oQhQdpK6eE0/
         pRGGSsexKM9coNK/DEhYktWbmd8wV/6nIufE2hpnzZnZaPhqTR91FG6iViT4lsk5bk8x
         C2kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=OGi9IIcyUk1XmiLj6EKWRUyxWG1emSceCAWGnoUxcJM=;
        b=wx7z+xzY/c6O/HUHzEYfOusjIyIMz4sydCV7KqXp5X0CaZfS0141aV24iioMNB6Ibz
         fEdqDCLQnGvIe/HUbCngufFw+xwtcYrbj1A5jaBUDFBNncOlqPXpJl1Ifz3gKoRUWGht
         WD6hPHw2PvP8qCCGCmHR/iBiVOczjMGXW7goJDVUtj5NyhNaknqHUt1IGmit1GYBjJYZ
         zLfoSVJawUn8Uqv0isydkugftcdi/JeDT2Kgel23aHfoI/E4jOq+B2SuGhRUJBHBfagy
         dVDWAESZd8kHk85EuCAO7h8yOjOo8bSXfUnUx59N6ll7XOlupb8uQak4+nFIlq8VyoDS
         PHDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hBxyOItt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h19si13601406qvb.29.2020.02.04.07.24.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2020 07:24:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hBxyOItt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iz03f-0002Vi-U1
	for alex.bennee@linaro.org; Tue, 04 Feb 2020 10:24:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41258)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iz03Q-0002I9-FH
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 10:23:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iz03O-0001xI-Mi
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 10:23:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40560
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iz03O-0001tS-GQ
 for qemu-arm@nongnu.org; Tue, 04 Feb 2020 10:23:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580829834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OGi9IIcyUk1XmiLj6EKWRUyxWG1emSceCAWGnoUxcJM=;
 b=hBxyOIttJRN8YbMtRlDzCibE3R6ujLg9waz5dG8fdaY9Mn//a/zXZ+X4gXouCDe/cgHrTK
 tTK5V9gtPir6ojTTT22H0IBcsfJ6adk0kv+1Rzgx882yYyaZnh9hw2azOQ2SEuIzUFTbq0
 cBAm458JwJXlXz0tfnZgc43h2sO3MQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-x-K2vMQ1NKKmsXwTE68xIw-1; Tue, 04 Feb 2020 10:23:34 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B81B8010F1;
 Tue,  4 Feb 2020 15:23:32 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E94360BF7;
 Tue,  4 Feb 2020 15:23:22 +0000 (UTC)
Date: Tue, 4 Feb 2020 16:23:20 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v2 1/7] exec: Fix for qemu_ram_resize() callback
Message-ID: <20200204162320.67e5d353@redhat.com>
In-Reply-To: <20200117174522.22044-2-shameerali.kolothum.thodi@huawei.com>
References: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
 <20200117174522.22044-2-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: x-K2vMQ1NKKmsXwTE68xIw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, mst@redhat.com,
 shannon.zhaosl@gmail.com, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, xuwei5@hisilicon.com, linuxarm@huawei.com,
 eric.auger@redhat.com, qemu-arm@nongnu.org, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hw3A1ysr4gqU

On Fri, 17 Jan 2020 17:45:16 +0000
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> If ACPI blob length modifications happens after the initial
> virt_acpi_build() call, and the changed blob length is within
> the PAGE size boundary, then the revised size is not seen by
> the firmware on Guest reboot. The is because in the
> virt_acpi_build_update() -> acpi_ram_update() -> qemu_ram_resize()
> path, qemu_ram_resize() uses used_length (ram_block size which is
> aligned to PAGE size) and the "resize callback" to update the size
> seen by firmware is not getting invoked.
> 
> Hence make sure callback is called if the new size is different
> from original requested size.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
> Please find the previous discussions on this issue here,
> https://patchwork.kernel.org/patch/11174947/
> 
> But this one attempts a different solution to fix it by introducing
> req_length var to RAMBlock struct. 
> 

looks fine to me, so
Acked-by: Igor Mammedov <imammedo@redhat.com>

CCing David who touches this area in his latest series for and
might have an opinion on how it should be handled.

> ---
>  exec.c                  | 36 +++++++++++++++++++++++-------------
>  include/exec/ram_addr.h |  5 +++--
>  2 files changed, 26 insertions(+), 15 deletions(-)
> 
> diff --git a/exec.c b/exec.c
> index d4b769d0d4..9ce33992f8 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -2123,16 +2123,18 @@ static int memory_try_enable_merging(void *addr, size_t len)
>   * resize callback to update device state and/or add assertions to detect
>   * misuse, if necessary.
>   */
> -int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)
> +int qemu_ram_resize(RAMBlock *block, ram_addr_t size, Error **errp)
>  {
> -    assert(block);
> +    ram_addr_t newsize;
>  
> -    newsize = HOST_PAGE_ALIGN(newsize);
> +    assert(block);
>  
> -    if (block->used_length == newsize) {
> +    if (block->req_length == size) {
>          return 0;
>      }
>  
> +    newsize = HOST_PAGE_ALIGN(size);
> +
>      if (!(block->flags & RAM_RESIZEABLE)) {
>          error_setg_errno(errp, EINVAL,
>                           "Length mismatch: %s: 0x" RAM_ADDR_FMT
> @@ -2149,13 +2151,19 @@ int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)
>          return -EINVAL;
>      }
>  
> -    cpu_physical_memory_clear_dirty_range(block->offset, block->used_length);
> -    block->used_length = newsize;
> -    cpu_physical_memory_set_dirty_range(block->offset, block->used_length,
> -                                        DIRTY_CLIENTS_ALL);
> -    memory_region_set_size(block->mr, newsize);
> +    block->req_length = size;
> +
> +    if (newsize != block->used_length) {
> +        cpu_physical_memory_clear_dirty_range(block->offset,
> +                                              block->used_length);
> +        block->used_length = newsize;
> +        cpu_physical_memory_set_dirty_range(block->offset, block->used_length,
> +                                            DIRTY_CLIENTS_ALL);
> +        memory_region_set_size(block->mr, newsize);
> +    }
> +
>      if (block->resized) {
> -        block->resized(block->idstr, newsize, block->host);
> +        block->resized(block->idstr, block->req_length, block->host);
>      }
>      return 0;
>  }
> @@ -2412,16 +2420,18 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
>                                    MemoryRegion *mr, Error **errp)
>  {
>      RAMBlock *new_block;
> +    ram_addr_t newsize;
>      Error *local_err = NULL;
>  
> -    size = HOST_PAGE_ALIGN(size);
> +    newsize = HOST_PAGE_ALIGN(size);
>      max_size = HOST_PAGE_ALIGN(max_size);
>      new_block = g_malloc0(sizeof(*new_block));
>      new_block->mr = mr;
>      new_block->resized = resized;
> -    new_block->used_length = size;
> +    new_block->req_length = size;
> +    new_block->used_length = newsize;
>      new_block->max_length = max_size;
> -    assert(max_size >= size);
> +    assert(max_size >= newsize);
>      new_block->fd = -1;
>      new_block->page_size = qemu_real_host_page_size;
>      new_block->host = host;
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index 5adebb0bc7..fd13082224 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -31,8 +31,9 @@ struct RAMBlock {
>      uint8_t *host;
>      uint8_t *colo_cache; /* For colo, VM's ram cache */
>      ram_addr_t offset;
> -    ram_addr_t used_length;
> -    ram_addr_t max_length;
> +    ram_addr_t req_length; /* Original requested size, used if RAM_RESIZEABLE */
> +    ram_addr_t used_length; /* aligned to qemu_host_page_size */
> +    ram_addr_t max_length; /*  aligned to qemu_host_page_size */
>      void (*resized)(const char*, uint64_t length, void *host);
>      uint32_t flags;
>      /* Protected by iothread lock.  */

