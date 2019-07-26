Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11765932wrv;
        Fri, 26 Jul 2019 04:03:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzie1/pyMByxI9zEgZFdRuPWZz+I+yOttUV/OstOKghLSrG2oct1X9OHAnpoDNl5eJNxSzu
X-Received: by 2002:ac8:6c31:: with SMTP id k17mr63933127qtu.253.1564139000576;
        Fri, 26 Jul 2019 04:03:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564139000; cv=none;
        d=google.com; s=arc-20160816;
        b=XP+YVKMPqeDKWbo8mMe8H0bXAaQf8yL6qDG4ObqPlyBLcKKV2F/r8eYomAU7NaGTql
         3WxEZkt/ralj15tDw9DYYpxOK7yVctUIW+Oe6CidULTr5rHzSByJsRAjgfMRPxnDWL/I
         4ZwJSKOqEObqEbQZRpHhml/zVIKH/1KM7Fh6hg3Pxajw88PdjaGtFJCs80X9NdtSSFhb
         iwp24ID/AhxRG4vqF0NnOd+Y94VyRTfk8sOMJ7dWsAMlAG8s6P7j/iBgRl/yPH5on8sQ
         ZFaXoE5FBFksEv2/H78QBlR+4SX1Z6VnCZOsKnLuEgzUB+6XOyUkiyv7caE5mdQPDNgT
         0Scw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=6umawaz58VrZjodVPQ7Rd283rV9fK/tEWuXuksm8zU8=;
        b=hw3mY4BaFlTw34xb7XcTJM2RE9JK1RMn/tzZ69HYpRlExF0sJT7G3jf54iUpoy6fVn
         /Yw6Z9pTkIA/kepcXcpz/PoAutS9EWvTtFbJEP2ecvIIZOiab7v7FbqonaZQdaC5Vx9I
         JRCQCymsuVvZdNmxlxEe7dOHTq5zcoT2mxqBUL3TU8u9T6Dj5C2X9FcaCG/b9P7Fu8tp
         Z403dR09jo3k8FPBcdzwohn8ov7j2z19Mp+EH9pgMYpH5y6HYnn1cyKqLiVdnTQCzDPF
         uXqRk5HZcIkEl3IqcVjYru9RSUVac4hHKIc+qgVL2AemqE4RRpxzY3OkFdZLFiTPAwwH
         2c7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5si34112589qtc.270.2019.07.26.04.03.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 04:03:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqy0L-00078p-DC
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 07:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47782)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hqy0E-00076d-Hy
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 07:03:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hqy0D-0002Kv-1s
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 07:03:10 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42319)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hqy0C-0002DM-OG
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 07:03:08 -0400
Received: by mail-wr1-f67.google.com with SMTP id x1so4080763wrr.9
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 04:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6umawaz58VrZjodVPQ7Rd283rV9fK/tEWuXuksm8zU8=;
 b=aWsGGBoOb06GrYSd90AfoF1kEa6uUThsX1N2N83nKANH84hQciDH84ZG0V9zPCe/30
 vAN97B6GXyTXkOJWv373ElIpCy3y2uKWjT8UnRhc3FryyOsBCgBOEToNFVBGpsgYvnqu
 ld/9MjBe1/3Cwdn6ks9vFiO/jonKWGTjaB0yo53QYxZG/LbRo31S3NU0IRtOctV3Epji
 MbesSHvbXINJKkeUyMCmATXWOIwObYl0cUuf80AJzZnM5SfJCHH9J25xpwbu6ubP3OwJ
 +aFUhudnuIHVBjBsDqnuHHWs6YiOlArStZbelafYwMoxKAuKFO5/oJj0NcreXV/Lgzkc
 1iFA==
X-Gm-Message-State: APjAAAUVhBjBNqNsyozf6MdadRtkqyKxr1YJi/sjCH599ZBufF8H1PnH
 CYiz+iiWJdn4UFf+xT7z6WDSqQ==
X-Received: by 2002:adf:f1d1:: with SMTP id z17mr29267913wro.190.1564138986653; 
 Fri, 26 Jul 2019 04:03:06 -0700 (PDT)
Received: from [192.168.50.36] (243.red-88-26-246.staticip.rima-tde.net.
 [88.26.246.243])
 by smtp.gmail.com with ESMTPSA id t15sm45627206wrx.84.2019.07.26.04.03.04
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 04:03:05 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123618147.19868@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <55d4c7f3-633b-0005-f74c-53578dd1bee1@redhat.com>
Date: Fri, 26 Jul 2019 13:03:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1564123618147.19868@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 09/15] cputlb: Access
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
 mst@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 Alistair.Francis@wdc.com, alex.williamson@redhat.com, arikalo@wavecomp.com,
 david@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, laurent@vivier.eu,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GO737dIE7WgV

On 7/26/19 8:46 AM, tony.nguyen@bt.com wrote:
> No-op MEMOP_SIZE and SIZE_MEMOP macros allows us to later easily
> convert memory_region_dispatch_{read|write} paramter "unsigned size"
> into a size+sign+endianness encoded "MemOp op".
> 
> Being a no-op macro, this patch does not introduce any logical change.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  accel/tcg/cputlb.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 523be4c..5d88cec 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -881,7 +881,7 @@ static void tlb_fill(CPUState *cpu, target_ulong addr, int size,
> 
>  static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>                           int mmu_idx, target_ulong addr, uintptr_t retaddr,
> -                         MMUAccessType access_type, int size)
> +                         MMUAccessType access_type, MemOp op)
>  {
>      CPUState *cpu = env_cpu(env);
>      hwaddr mr_offset;
> @@ -906,14 +906,13 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>          qemu_mutex_lock_iothread();
>          locked = true;
>      }
> -    r = memory_region_dispatch_read(mr, mr_offset,
> -                                    &val, size, iotlbentry->attrs);
> +    r = memory_region_dispatch_read(mr, mr_offset, &val, op, iotlbentry->attrs);
>      if (r != MEMTX_OK) {
>          hwaddr physaddr = mr_offset +
>              section->offset_within_address_space -
>              section->offset_within_region;
> 
> -        cpu_transaction_failed(cpu, physaddr, addr, size, access_type,
> +        cpu_transaction_failed(cpu, physaddr, addr, MEMOP_SIZE(op), access_type,
>                                 mmu_idx, iotlbentry->attrs, r, retaddr);
>      }
>      if (locked) {
> @@ -925,7 +924,7 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
> 
>  static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>                        int mmu_idx, uint64_t val, target_ulong addr,
> -                      uintptr_t retaddr, int size)
> +                      uintptr_t retaddr, MemOp op)
>  {
>      CPUState *cpu = env_cpu(env);
>      hwaddr mr_offset;
> @@ -947,15 +946,15 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>          qemu_mutex_lock_iothread();
>          locked = true;
>      }
> -    r = memory_region_dispatch_write(mr, mr_offset,
> -                                     val, size, iotlbentry->attrs);
> +    r = memory_region_dispatch_write(mr, mr_offset, val, op, iotlbentry->attrs);
>      if (r != MEMTX_OK) {
>          hwaddr physaddr = mr_offset +
>              section->offset_within_address_space -
>              section->offset_within_region;
> 
> -        cpu_transaction_failed(cpu, physaddr, addr, size, MMU_DATA_STORE,
> -                               mmu_idx, iotlbentry->attrs, r, retaddr);
> +        cpu_transaction_failed(cpu, physaddr, addr, MEMOP_SIZE(op),
> +                               MMU_DATA_STORE, mmu_idx, iotlbentry->attrs, r,
> +                               retaddr);
>      }
>      if (locked) {
>          qemu_mutex_unlock_iothread();
> @@ -1306,7 +1305,7 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
>          }
> 
>          res = io_readx(env, &env_tlb(env)->d[mmu_idx].iotlb[index],
> -                       mmu_idx, addr, retaddr, access_type, size);
> +                       mmu_idx, addr, retaddr, access_type, SIZE_MEMOP(size));
>          return handle_bswap(res, size, big_endian);
>      }
> 
> @@ -1555,7 +1554,7 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
> 
>          io_writex(env, &env_tlb(env)->d[mmu_idx].iotlb[index], mmu_idx,
>                    handle_bswap(val, size, big_endian),
> -                  addr, retaddr, size);
> +                  addr, retaddr, SIZE_MEMOP(size));
>          return;
>      }
> 
> --
> 1.8.3.1
> 
> 
> 

Cleaner :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
