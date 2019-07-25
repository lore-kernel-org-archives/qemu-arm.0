Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10537273wrv;
        Thu, 25 Jul 2019 04:45:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwvquTrbbFc9lHsNLoiORKerj0s3RcBHzYDNjGIc02tr7tBLSgIVb7jY62e8n/9yy6WiC+1
X-Received: by 2002:a17:906:ccc3:: with SMTP id ot3mr68275495ejb.113.1564055143393;
        Thu, 25 Jul 2019 04:45:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564055143; cv=none;
        d=google.com; s=arc-20160816;
        b=0dKMDHzrSMtZqmvc9oUu6pgmRHWx6QbkTzu9KbtK7H2PdEiz4ROsOpwFWZvNCqf/7L
         hz6UvjZdDj9RMwxlCuCComPSJYMtY6rcVzCrVTsx/cqODoF65UYGwJhW2aVXzfOKZM6S
         JnE3cOPBsJndxju0sg+XwZFBzDHRAw2c3WSsuMXzzLKUSOXi3hmIxpldHZAZNkz+TYsH
         5X3vkaHKmv8oTNplkrPKZiHQvXcOVOc9g5l5ZpiJpa8IY2w9xPFaj+NpdVTFefawnlNP
         DIQAfzrSQV/IX0EihVCIneztVgZqJEtf5ggtARAWuYcDJsNMslhWspXEoFNg+Jvg5FZV
         ju1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=Hjpm8Rf7RyjQH3MjUQFnmhQY9vXYn0vLazK73zwsPIc=;
        b=cA6HEUJyQMalLIThJ7Wu6FUVOhTl1G2eXgxURCZEr+8visNJrP2JYM8UU+ti6xVFT9
         oFNt5twWFqQrCU86JlwTSIwflFjQ+jCQ/h1HqX5+Ef1/JbdkLWEZatU1zWsSu2/XMmcA
         Jt+8CSnpgaeeq9lsaJYkNdCQyxJZcVjM2c2vhXgPYHddPKL5C7FkBhkOP7xegBHrf0/W
         coREeUSxb0C44g8XDUsQBawaMaDhJ5tjmxCBF9TQHqFR3xoPosBpI6RxWJngxGPa8BrP
         SfUxyg8r8owjkuliabR4ZcUMzELGBVoD0XsqCcKUzPllMkV/hnt+OX8v1IUVFBFpgmLs
         FRPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t20si10408935eda.247.2019.07.25.04.45.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 04:45:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqcBp-00040I-Ms
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 07:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53753)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hqcBj-0003zo-Sb
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 07:45:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hqcBi-0000FC-I9
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 07:45:35 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40447)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hqcBi-0000Es-9G
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 07:45:34 -0400
Received: by mail-wm1-f68.google.com with SMTP id v19so44477102wmj.5
 for <qemu-arm@nongnu.org>; Thu, 25 Jul 2019 04:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hjpm8Rf7RyjQH3MjUQFnmhQY9vXYn0vLazK73zwsPIc=;
 b=kK7OojCgy71dp5TfwePYJAXe4bCXU4Zc85NT6z1Q+Aaa6qVadlwGVrQDvWBHqEdWkx
 G0BwPh21zzlyElarqqZoL20y+mbQTBClZg8zVxW5qMl+cma/1GP+ZPRIkR6o+B06swgb
 WjS7zPEXsyPPHGjCP8NW6aLwFJBh05FBrB7xvJPbWXjBd1y+tWLu5Gaq5TVs+z6CtZPE
 aIndblfqQluB7tpy5hQi6BRNdoVjBmK3kEFbWz2InxPYGgZrwL4Y44aceugFvJveQtw1
 eVo7cIhNg4R+qRODKVeP/g/pTo8U7VH/zRW/G9taNsgwpZzjHO0EYWSTSBu5c7yTCrn9
 W6mA==
X-Gm-Message-State: APjAAAU+5Fm0vWkUWJe6RLUpH+xOcv+GDbBQXmYUQc+pRwPylIX8mLi9
 afjIMmrNZD3mMSegxyylWbVzJg==
X-Received: by 2002:a7b:c4d0:: with SMTP id g16mr81340762wmk.88.1564055133344; 
 Thu, 25 Jul 2019 04:45:33 -0700 (PDT)
Received: from [192.168.1.37] (190.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.190])
 by smtp.gmail.com with ESMTPSA id a8sm38174833wma.31.2019.07.25.04.45.30
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 04:45:32 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
 <1564048354001.54262@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ee5949da-4457-0560-4525-40e4d4aaef4a@redhat.com>
Date: Thu, 25 Jul 2019 13:45:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1564048354001.54262@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 02/15] memory: Access
 MemoryRegion with MemOp
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
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, sagark@eecs.berkeley.edu,
 david@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 Alistair.Francis@wdc.com, alex.williamson@redhat.com, arikalo@wavecomp.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, laurent@vivier.eu,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VzdPNLP/u8IG

On 7/25/19 11:52 AM, tony.nguyen@bt.com wrote:
> Replacing size with size+sign+endianness (MemOp) will enable us to
> collapse the two byte swaps, adjust_endianness and handle_bswap, along
> the I/O path.
> 
> While interfaces are converted, callers will have existing unsigned
> size coerced into a MemOp, and the callee will use this MemOp as an
> unsigned size.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  include/exec/memop.h  | 4 ++++
>  include/exec/memory.h | 9 +++++----
>  memory.c              | 7 +++++--
>  3 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/include/exec/memop.h b/include/exec/memop.h
> index ac58066..09c8d20 100644
> --- a/include/exec/memop.h
> +++ b/include/exec/memop.h
> @@ -106,4 +106,8 @@ typedef enum MemOp {
>      MO_SSIZE = MO_SIZE | MO_SIGN,
>  } MemOp;
> 
> +/* No-op while memory_region_dispatch_[read|write] is converted to MemOp */
> +#define MEMOP_SIZE(op)  (op)    /* MemOp to size.  */
> +#define SIZE_MEMOP(ul)  (ul)    /* Size to MemOp.  */

SIZE_MEMOP() is never used until patch #10 "memory: Access MemoryRegion
with MemOp semantics", it would be clearer to only introduce the
MEMOP_SIZE() no-op here, and directly introduce the correct SIZE_MEMOP()
macro in patch #10.

> +
>  #endif
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index bb0961d..30b1c58 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -19,6 +19,7 @@
>  #include "exec/cpu-common.h"
>  #include "exec/hwaddr.h"
>  #include "exec/memattrs.h"
> +#include "exec/memop.h"
>  #include "exec/ramlist.h"
>  #include "qemu/queue.h"
>  #include "qemu/int128.h"
> @@ -1731,13 +1732,13 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner);
>   * @mr: #MemoryRegion to access
>   * @addr: address within that region
>   * @pval: pointer to uint64_t which the data is written to
> - * @size: size of the access in bytes
> + * @op: encodes size of the access in bytes
>   * @attrs: memory transaction attributes to use for the access
>   */
>  MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
>                                          hwaddr addr,
>                                          uint64_t *pval,
> -                                        unsigned size,
> +                                        MemOp op,
>                                          MemTxAttrs attrs);
>  /**
>   * memory_region_dispatch_write: perform a write directly to the specified
> @@ -1746,13 +1747,13 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
>   * @mr: #MemoryRegion to access
>   * @addr: address within that region
>   * @data: data to write
> - * @size: size of the access in bytes
> + * @op: encodes size of the access in bytes
>   * @attrs: memory transaction attributes to use for the access
>   */
>  MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
>                                           hwaddr addr,
>                                           uint64_t data,
> -                                         unsigned size,
> +                                         MemOp op,
>                                           MemTxAttrs attrs);
> 
>  /**
> diff --git a/memory.c b/memory.c
> index 5d8c9a9..6982e19 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -1439,10 +1439,11 @@ static MemTxResult memory_region_dispatch_read1(MemoryRegion *mr,
>  MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
>                                          hwaddr addr,
>                                          uint64_t *pval,
> -                                        unsigned size,
> +                                        MemOp op,
>                                          MemTxAttrs attrs)
>  {
>      MemTxResult r;
> +    unsigned size = MEMOP_SIZE(op);
> 
>      if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
>          *pval = unassigned_mem_read(mr, addr, size);
> @@ -1483,9 +1484,11 @@ static bool memory_region_dispatch_write_eventfds(MemoryRegion *mr,
>  MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
>                                           hwaddr addr,
>                                           uint64_t data,
> -                                         unsigned size,
> +                                         MemOp op,
>                                           MemTxAttrs attrs)
>  {
> +    unsigned size = MEMOP_SIZE(op);
> +
>      if (!memory_region_access_valid(mr, addr, size, true, attrs)) {
>          unassigned_mem_write(mr, addr, data, size);
>          return MEMTX_DECODE_ERROR;
> --
> 1.8.3.1
> 
> 
> 
