Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10522792wrv;
        Thu, 25 Jul 2019 04:31:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzgspuW01P53PMaxegWj5bu8GrYs38Lz899nFQAGnfiQbkucOBCI/+T1TtSVJZ/yw1SRa6n
X-Received: by 2002:a37:660b:: with SMTP id a11mr56314859qkc.342.1564054270898;
        Thu, 25 Jul 2019 04:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564054270; cv=none;
        d=google.com; s=arc-20160816;
        b=p46aYiekMsivk9/VyPFSQj8nxXpHI8FgOOnOJDHefOsxjDhcMH4PWEM9s+ksosr/vo
         mI3NPD7UnoVYxtocYazhgV5NvnwjCphSxdax/hG0JR+DPvFjefCgFXvmJ+cZNE9HIouO
         zAHpxpsWqcW6UJo0kTzyrCGYUIxaBqnEcvwhSoKDgK7AEhrwIYHG6OUmDMZ4eaR2cDqQ
         hlaUcp2EhrIpf8HpMgIWUj3pOV1ZtvjBN4veAZ+Xny/yiN7hPh5gYKrsJpN9ByXa+18k
         6n+F/KeU0l9bgzvtRK+yP9ct/Vf/xe9rHF3N3N0exICyTTBW1iYdHVXHo1ri50wr/KS6
         SYsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=C5Rni6xcppwQX73lDjX1/8naB0Nngge1M5Zl3vPa2Hw=;
        b=KbSZL/3ibnXOmKG42HLe0YU9qqYAzYvuZSnRPYgBrZ6UKIaNJWJePpqCoXKl3X01ao
         aYkfhfnUKwsp2LxQMQ/n5nacAyDBpjbUTmfspC8npnry98wRWei+EflOlGVzLDuAcimc
         3dmjiGe4STL95XK9iT+mouLwCbQLIQMo/+vXRZI6IqOIXOnyJskMBrpT2YueSwK9qoRY
         y6ZPV7i17vX4F/p2rodKR/BO2T7zBdq1fk8Pjw4VilB7oOLRaYzS4cFU+zGzm0kY0+i0
         q1uVOkbX7aDDJ5fu3IRKRV5+t4h5w4Lc9U6VP3dHiAd9K0d3m0JgMVDI+0RIheLPCLUv
         NXKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s22si32480215qvs.40.2019.07.25.04.31.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 04:31:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqbxl-0002W4-Mk
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 07:31:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49576)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hqbxa-0002Jg-UI
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 07:30:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hqbxZ-0006rq-NU
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 07:30:58 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33597)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hqbxZ-0006r6-FN
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 07:30:57 -0400
Received: by mail-wr1-f65.google.com with SMTP id n9so50477869wru.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jul 2019 04:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C5Rni6xcppwQX73lDjX1/8naB0Nngge1M5Zl3vPa2Hw=;
 b=XXvjbcPqh9v/5jsBLy2SOS8/0FfOddaiL5vuEvQppip+aONa7UfCETSjQ7DM6OA1CD
 b2Y12SzCXFv+2dPY39NkSn0CKqObV8bveCXvisB1L674oDSyiMXjPPd0WsT/19UJkUi4
 K+aPyktlFAltzWKSia4koksZv6/lD4vnq/GFGcAaeUO9ISl1bUIFO8FI20+3CeEhu+k3
 If055mvt3Ea+Fsgmg16DuuQ9hv3NXiXhnlhEWqk0JwRRNA5eolZt/bUbnjWmgaIw0JPe
 yJ4Kz4cLPjWJ2VgHRGF9Ovb/UeVvnGXjinxu00EqdQ4kAmi0TVjrgMbiGynRM6v4cL9B
 pzKg==
X-Gm-Message-State: APjAAAXpe4zNDghU9u/Rqda0G9w5jgiDmSG9P7bIMxGpdf4doWHz1YX+
 IV909te03j3XIb/eAB6uy8m+zw==
X-Received: by 2002:a5d:6ccd:: with SMTP id c13mr91459552wrc.4.1564054256478; 
 Thu, 25 Jul 2019 04:30:56 -0700 (PDT)
Received: from [192.168.1.37] (190.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.190])
 by smtp.gmail.com with ESMTPSA id d10sm40553394wrx.34.2019.07.25.04.30.51
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 04:30:55 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
 <1564048377976.39897@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <e9b26c03-6fac-122a-ff50-74ea976e7ee8@redhat.com>
Date: Thu, 25 Jul 2019 13:30:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1564048377976.39897@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
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
X-TUID: GsPHHEAiPSr0

On 7/25/19 11:52 AM, tony.nguyen@bt.com wrote:
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
