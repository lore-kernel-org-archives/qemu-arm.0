Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10523574wrv;
        Thu, 25 Jul 2019 04:31:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx9+mUhfBS/LKfCRHYRxyyBxrA81Tv9bOgfVOxuymo20NaTXBOq9MCZj6L85dY2X3qBk9u5
X-Received: by 2002:ac8:750b:: with SMTP id u11mr60315479qtq.23.1564054307490;
        Thu, 25 Jul 2019 04:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564054307; cv=none;
        d=google.com; s=arc-20160816;
        b=ske0KeNIPS0AATphncWJleHwaoFHaTVArTpe6kl0LzW0l6GQG4K5cATliJ49aRrc/P
         LLzGZHWvM3xg6xWacEcbptDeUtA+yhA7AYbRc6gLNh39Cn2pvylZ2vK2Mz+2KuPdz7p8
         Bobr0T4sMHOJqPlcd8APf9h1mdxvcbrvnPM3UB/IfxBEwALCZp2uDgUxStSJ2RC4iwNh
         3nnSR+lyAkpkt52mWh6CM401EE56cJV2oRinTVF3mFW96prBqnkJQpq66g7LBeUhCOE8
         LbkkrWVi0C4k6qEhWvNS48jwPS96QlOPsTNZFry53efv21TKoML5bXqXUE+NlIVBXQBS
         DQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=AizYLJUC8/bpkMUR9iyeBUQqrzd2m7arfwncBFdb8dA=;
        b=X3TrNoA5aYt5Q6h7CUiijrL57TNpmL1GohvI1RNVIEDI+fJcG9yGz72D3LdXJ4Dsn8
         2apBzZjDIDUzKccFXu02UDPrsb/r+gQh180OhVAABjbpPVTFjTcQpfE/RdwoBj2hmmg2
         3ztVpKGBlcrnpfmFIY2vmW/sRYvVMlCJujk1iuVwVD7GTyPZhOvuw6MeMPeW5aO0MrGo
         wLqxnQnETm2qlvj+fRfAGGtUqn1yJitz9EGjgOIDqJn0vcFpZbphegKeNqJZCE6oAAUW
         CzEwn9ov6Tq/7VMeIo3/BcOvZVsPzUkVAfUvptbCHLZv3mO4A0LfaJDY9juexDKj4N4M
         qLag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 40si32212140qvt.195.2019.07.25.04.31.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 04:31:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqbyM-0003UX-PK
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 07:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49797)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hqbyH-0003TE-IK
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 07:31:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hqbyG-0007AS-Ca
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 07:31:41 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37792)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hqbyG-00079y-5T
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 07:31:40 -0400
Received: by mail-wr1-f67.google.com with SMTP id n9so25304517wrr.4
 for <qemu-arm@nongnu.org>; Thu, 25 Jul 2019 04:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AizYLJUC8/bpkMUR9iyeBUQqrzd2m7arfwncBFdb8dA=;
 b=B4DSCIsGRJvfDC8fJmRPRC2gHr4xjA0U7qLtVd417biEDMftIxF+lvPIJ6B4kPdgL0
 pkyTiQdcdBYyAWyxhsW8OWEMDseg8DCytrqbWR6ONaLwrq8ERjZT4tDd9i4O7pdEAqmQ
 gU4/3KjP80wW3X5h4A2XjSBXYAJPAKHfdfR7wc45a8N/KIWOAGtH8yRDXPfUd1BcGDX2
 eVLafHY+y663te4wwys13ALz62KUFShetNsUtdfkR176EKiz2vuvH4uxtgGSN0lxF0kA
 I4qVhEQcVPpPXQ0uMcdEnfwqBDC/ODSxKsb5vLMq5BTOmaGcjFtulRDwE7svIdxKAxGx
 w+KA==
X-Gm-Message-State: APjAAAXPFwFMCMfhAwiKaXC4gVMHilfGgPu5crK8FLPGxCYGhFJ1k6wY
 NAmmlYVVvl5EvkJcLD+QpOfE5w==
X-Received: by 2002:adf:cd84:: with SMTP id q4mr18155849wrj.232.1564054299238; 
 Thu, 25 Jul 2019 04:31:39 -0700 (PDT)
Received: from [192.168.1.37] (190.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.190])
 by smtp.gmail.com with ESMTPSA id g19sm89988811wrb.52.2019.07.25.04.31.37
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 04:31:38 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
 <1564048432710.98755@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <0ca427aa-5a18-785a-0152-bc9948c3970b@redhat.com>
Date: Thu, 25 Jul 2019 13:31:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1564048432710.98755@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 05/15] hw/intc/armv7m_nic:
 Access MemoryRegion with MemOp
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
X-TUID: +twglRTOngyZ

On 7/25/19 11:53 AM, tony.nguyen@bt.com wrote:
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  hw/intc/armv7m_nvic.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 9f8f0d3..25bb88a 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -18,6 +18,7 @@
>  #include "hw/intc/armv7m_nvic.h"
>  #include "target/arm/cpu.h"
>  #include "exec/exec-all.h"
> +#include "exec/memop.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "trace.h"
> @@ -2345,7 +2346,8 @@ static MemTxResult nvic_sysreg_ns_write(void *opaque, hwaddr addr,
>      if (attrs.secure) {
>          /* S accesses to the alias act like NS accesses to the real region */
>          attrs.secure = 0;
> -        return memory_region_dispatch_write(mr, addr, value, size, attrs);
> +        return memory_region_dispatch_write(mr, addr, value, SIZE_MEMOP(size),
> +                                            attrs);
>      } else {
>          /* NS attrs are RAZ/WI for privileged, and BusFault for user */
>          if (attrs.user) {
> @@ -2364,7 +2366,8 @@ static MemTxResult nvic_sysreg_ns_read(void *opaque, hwaddr addr,
>      if (attrs.secure) {
>          /* S accesses to the alias act like NS accesses to the real region */
>          attrs.secure = 0;
> -        return memory_region_dispatch_read(mr, addr, data, size, attrs);
> +        return memory_region_dispatch_read(mr, addr, data, SIZE_MEMOP(size),
> +                                           attrs);
>      } else {
>          /* NS attrs are RAZ/WI for privileged, and BusFault for user */
>          if (attrs.user) {
> @@ -2390,7 +2393,8 @@ static MemTxResult nvic_systick_write(void *opaque, hwaddr addr,
> 
>      /* Direct the access to the correct systick */
>      mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
> -    return memory_region_dispatch_write(mr, addr, value, size, attrs);
> +    return memory_region_dispatch_write(mr, addr, value, SIZE_MEMOP(size),
> +                                        attrs);
>  }
> 
>  static MemTxResult nvic_systick_read(void *opaque, hwaddr addr,
> @@ -2402,7 +2406,7 @@ static MemTxResult nvic_systick_read(void *opaque, hwaddr addr,
> 
>      /* Direct the access to the correct systick */
>      mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
> -    return memory_region_dispatch_read(mr, addr, data, size, attrs);
> +    return memory_region_dispatch_read(mr, addr, data, SIZE_MEMOP(size), attrs);
>  }
> 
>  static const MemoryRegionOps nvic_systick_ops = {
> --
> 1.8.3.1
> 
> 
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
