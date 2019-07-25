Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10530232wrv;
        Thu, 25 Jul 2019 04:38:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz3hltO7H7PJSiL/udJMKbzeJQ7aRbYnNj6eoXNN5TOC4pIVe3VtvPD7ISHqW47iKYlrCdD
X-Received: by 2002:a17:907:384:: with SMTP id ss4mr67631389ejb.166.1564054688025;
        Thu, 25 Jul 2019 04:38:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564054688; cv=none;
        d=google.com; s=arc-20160816;
        b=r/aGHX+ocY+c9nlkItxVGU1lfjkC+GL5iq96B6cJBSeD6djdOchhU+FlQvy+Jc77L2
         DRuk89QrscPo8vQSI+JD3ieJ6PYgrl0uoiCN3PVOUtBJC7R3lEa/SM4zOK6cqxwriTJQ
         SnWumf6dcZnLqYvI/6RX2d7TvkkRf76I1u6NRP9BxzvYgkCqUtk7Tpmmq9v7ZokrBvb6
         oh/j+1xO5G5VJr1FbqDiB1ST402M3w60BYCYdGCclbRGnNZoHivIemdW5/d9qvsFNDLG
         lv5IeK+9gIaNl0EkHT3NGhh8vRupkm9SUIVw5escwh13wdzOgGVkD1RspaaVFLHW2Fqz
         2H5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=uogSuPxOvtyP+/Y5rYXbgayF1NJ8ysZQzPcvLa/aI8U=;
        b=ooigZ2pFcRhE252TCTHoQZI4e1QlAaBpdD39uzezBzwKwX8BZyMDJwslOoTj6WXoSy
         ambYOTybqTijW260H6j42Jd+oVF51CMMwh2mzCwb3zBEg9VSjqG8OzwpMfUwyAxFSUvs
         7hC/koe0CDDeo9OtK0VFSIlwFYefwxtfY7izTU4C8HOu/rTsWhOlBR9U+HuxGXE2byUl
         ZXBYgSo2yOr5P1LG+U5vBd3elvHA5U1+Rq6aEVDz7wEjv2hKarFC7FYBClKV66+iMxqC
         9ND6uB1MQrDP5lDOQ6Y31qDyPOboB1+D+/zcuZUlhgoJv5qN6+Tx0nnQhAf0zky3yrl+
         xA5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12si10836764edm.38.2019.07.25.04.38.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 04:38:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqc4U-0006LS-R4
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 07:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51595)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hqc4E-0005Ny-Fw
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 07:37:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hqc4C-0003iO-Hh
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 07:37:49 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34901)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hqc4B-0003eK-W0
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 07:37:48 -0400
Received: by mail-wm1-f68.google.com with SMTP id l2so44419537wmg.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jul 2019 04:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uogSuPxOvtyP+/Y5rYXbgayF1NJ8ysZQzPcvLa/aI8U=;
 b=JskWQG/foKCf9koWh1kDJhDs/fCZAkynldSCUL/dmcqDT6M+nP+mjjMzpBOMwICyGy
 NcbeTxbZUVPBF9xatY5Bshvhan8ylDWjcqDabb6gUii87QUo11eziehS1hLaigs88qN9
 Gm1pvZuyVjFZ/RqTByBj/a9xQsxcPOh9IYkKLny6Y9drrmJ22Ur6KZ7TEDsb0GprrZZc
 nyhFCR02J9N7Bq2XTrgIh5NvNyExHmHzTyDVEvvG1wcbnEo6k7Aw+5e3v4H5SuJ29fgd
 YDEZmy7eVeAZaS4rQ3RjDPHjDeXWweTc/3jVQOC3qj9AJsO++VMR8nzua+aw8kK+YmL6
 UqGg==
X-Gm-Message-State: APjAAAU7VD+KfghaBYtoCgCbRs3qmMKdP1AHLslnITbu1qsZ25q1nXa2
 AukzJM0rrDx5zIYMCV+jJDiBuw==
X-Received: by 2002:a1c:b706:: with SMTP id h6mr77262146wmf.119.1564054665429; 
 Thu, 25 Jul 2019 04:37:45 -0700 (PDT)
Received: from [192.168.1.37] (190.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.190])
 by smtp.gmail.com with ESMTPSA id g19sm90017297wrb.52.2019.07.25.04.37.41
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 04:37:44 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
 <1564048377976.39897@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <a40b6144-3f18-f42e-25da-8c2ec7ad6da6@redhat.com>
Date: Thu, 25 Jul 2019 13:37:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1564048377976.39897@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 03/15] target/mips: Access
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
X-TUID: T4SQ3vKihWP3

On 7/25/19 11:52 AM, tony.nguyen@bt.com wrote:

<no description>

I think Aleksandar will ask you to describe what the MemOp does, you can
add something like:

  The MEMOP_SIZE() macro will allow us to later easily convert the
  memory_region_dispatch_ACCESS() functions to ...
  Meanwhile this macro is a no-op. Thus this patch does not introduce
  any logical change.

And you can reuse this blob in the other patches around.

With an improved patch description:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  target/mips/op_helper.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
> index 9e2e02f..dccb8df 100644
> --- a/target/mips/op_helper.c
> +++ b/target/mips/op_helper.c
> @@ -24,6 +24,7 @@
>  #include "exec/helper-proto.h"
>  #include "exec/exec-all.h"
>  #include "exec/cpu_ldst.h"
> +#include "exec/memop.h"
>  #include "sysemu/kvm.h"
> 
>  /*****************************************************************************/
> @@ -4740,11 +4741,11 @@ void helper_cache(CPUMIPSState *env, target_ulong addr, uint32_t op)
>      if (op == 9) {
>          /* Index Store Tag */
>          memory_region_dispatch_write(env->itc_tag, index, env->CP0_TagLo,
> -                                     8, MEMTXATTRS_UNSPECIFIED);
> +                                     SIZE_MEMOP(8), MEMTXATTRS_UNSPECIFIED);
>      } else if (op == 5) {
>          /* Index Load Tag */
>          memory_region_dispatch_read(env->itc_tag, index, &env->CP0_TagLo,
> -                                    8, MEMTXATTRS_UNSPECIFIED);
> +                                    SIZE_MEMOP(8), MEMTXATTRS_UNSPECIFIED);
>      }
>  #endif
>  }
> --
> 1.8.3.1
> 
> 
> 
