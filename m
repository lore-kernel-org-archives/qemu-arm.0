Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10543183wrv;
        Thu, 25 Jul 2019 04:52:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwXjCnm8thfYYeBSJLdeScGybjDLFfGDhBlMrVVg0ynkbGYV0aiFodezmhEd/pZ2AoHgpfQ
X-Received: by 2002:aa7:ce91:: with SMTP id y17mr4635510edv.56.1564055541578;
        Thu, 25 Jul 2019 04:52:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564055541; cv=none;
        d=google.com; s=arc-20160816;
        b=B5+arCKoDYkwii8mOr+GjIZZWrfY+TGNsCPEn987g7N8ciRB5EjNR7XkEw50e0b7dr
         111EVdHnUYTD/AZi5NFGl87l0u5KRXoENe+kFOBKjZJa0QEDRHtj7bbRe2M8sQC/oXkz
         tg1x9XHflQRAmoorLTVwNIubNrKvVmU/OAG8VkrmX6qtOR+md+stxwEZ8EhYTD2tqYDZ
         5kNOQibD/Q98jJN6Zha9AcJjMp3cA2g1O3wF+XbO9Wn4zhregMZMmdTMd3O6QAiikOuj
         DfGenwShi6fS412saL3+3yCVWtrLWeBzFTjt6J/6MHHBAvjUs0C8vEMnqWNOtBNMm5Ry
         jCtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=TYb+D3MfNU/o6PwwWSLz4bH+LBJ9olL56DTJDlFeh+w=;
        b=cHj60czrBIraD0whceTc/K49SJP5ytM9DfHxEa+KUNjriG/i6QY3ZMCnWoR46FlXKD
         foR4mr9iE1IPFDnHtw8yZRT1P3l25BKuzCl1ktwq2XOcKWrTyvNdhXtjQL9EXSvPSRfy
         Al+F71L1toSQ4iGHJuAxFLy3yYwIXoCnL8ygOtuerm2tT99M/1G0Mkkzr1YIdTlMM7sv
         1dVQXBhN1bVY5tIr4FwHTijlVa2xOuPAcCyv+oHfdK79gieyziTXs19bXoGq708ZqbPa
         4RC03Tb/DVAK2WtvPq0tnlYO+L9+JBc5s4oMMF3YYEpOPaRLAE3tFLGkPIJy8A/vEjMN
         jGHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v30si11094054edc.187.2019.07.25.04.52.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 04:52:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqcIF-0007fv-RW
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 07:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55111)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hqcIB-0007fR-GD
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 07:52:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hqcI9-0003Qy-RC
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 07:52:15 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39206)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hqcI9-0003QS-Hz
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 07:52:13 -0400
Received: by mail-wr1-f67.google.com with SMTP id x4so50405463wrt.6
 for <qemu-arm@nongnu.org>; Thu, 25 Jul 2019 04:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TYb+D3MfNU/o6PwwWSLz4bH+LBJ9olL56DTJDlFeh+w=;
 b=mtQ1fJe460SITyZrXvCiA2LmzIdXjUNm1oUCky0S3H2Epnvvdsyvpns3qkzni6QCM4
 Twbcwfj6PtQzPj9A78hv364Y3xRbuJFO0RRPsFPsUJfbbqwcCHwS35YQE2HbT+d/RBrc
 BCMOez7YZg5cuY83AEkeI6d/x5qdxTkDXMQgZoa+UYMQZNtwyJB41kSEO6ZC46ufjPX2
 g2tekHnffbKpSso0yrbNv3Wx4qUz54DE/tFWc1LbC0JvjOyCzLwwbTQvfBuer5BZwoiS
 5jxY8QoG64OLYBRcYWV5JiPK17qXv+n/RxibTME3qxlGwq65MFqsBWSZeMBFLwT3dJJd
 MWqQ==
X-Gm-Message-State: APjAAAUbNXJEvXPhU/JBO/wwxcO78PY/v9ueOcqqBwWLUv8IUAxs9oIA
 bPOa+BFEPY/gh6n1jOp3IElpmA==
X-Received: by 2002:a5d:60c5:: with SMTP id x5mr6797660wrt.253.1564055532637; 
 Thu, 25 Jul 2019 04:52:12 -0700 (PDT)
Received: from [192.168.1.37] (190.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.190])
 by smtp.gmail.com with ESMTPSA id j10sm83960221wrd.26.2019.07.25.04.52.08
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 04:52:12 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
 <1564048584882.52438@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <2f25f546-03c3-620a-61c0-73d146a19b82@redhat.com>
Date: Thu, 25 Jul 2019 13:52:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1564048584882.52438@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 11/15] memory: Single byte
 swap along the I/O path
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
X-TUID: 6K5nvBztnIph

On 7/25/19 11:56 AM, tony.nguyen@bt.com wrote:
> Now that MemOp has been pushed down into the memory API, we can
> collapse the two byte swaps adjust_endianness and handle_bswap into
> the former.

Nice cleanup :)

> 
> Collapsing byte swaps along the I/O path enables additional endian
> inversion logic, e.g. SPARC64 Invert Endian TTE bit, with redundant
> byte swaps cancelling out.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  accel/tcg/cputlb.c | 58 +++++++++++++++++++++++++-----------------------------
>  memory.c           | 30 ++++++++++++++++------------
>  2 files changed, 44 insertions(+), 44 deletions(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index a4a0bf7..e61b1eb 100644
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
> -    r = memory_region_dispatch_read(mr, mr_offset, &val, SIZE_MEMOP(size),
> -                                    iotlbentry->attrs);
> +    r = memory_region_dispatch_read(mr, mr_offset, &val, op, iotlbentry->attrs);
>      if (r != MEMTX_OK) {
>          hwaddr physaddr = mr_offset +
>              section->offset_within_address_space -
>              section->offset_within_region;
> 
> -        cpu_transaction_failed(cpu, physaddr, addr, size, access_type,
> +        cpu_transaction_failed(cpu, physaddr, addr, MEMOP_SIZE(op), access_type,
>                                 mmu_idx, iotlbentry->attrs, r, retaddr);

Please move this change in "cputlb: Access MemoryRegion with MemOp"
(patch #9 of this series).

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
> -    r = memory_region_dispatch_write(mr, mr_offset, val, SIZE_MEMOP(size),
> -                                    iotlbentry->attrs);
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

Ditto.

>      }
>      if (locked) {
>          qemu_mutex_unlock_iothread();
> @@ -1210,26 +1209,13 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
>  #endif
> 
>  /*
> - * Byte Swap Helper
> + * Byte Swap Checker
>   *
> - * This should all dead code away depending on the build host and
> - * access type.
> + * Dead code should all go away depending on the build host and access type.
>   */
> -
> -static inline uint64_t handle_bswap(uint64_t val, int size, bool big_endian)
> +static inline bool need_bswap(bool big_endian)
>  {
> -    if ((big_endian && NEED_BE_BSWAP) || (!big_endian && NEED_LE_BSWAP)) {
> -        switch (size) {
> -        case 1: return val;
> -        case 2: return bswap16(val);
> -        case 4: return bswap32(val);
> -        case 8: return bswap64(val);
> -        default:
> -            g_assert_not_reached();
> -        }
> -    } else {
> -        return val;
> -    }
> +    return (big_endian && NEED_BE_BSWAP) || (!big_endian && NEED_LE_BSWAP);

:)

>  }
> 
>  /*
> @@ -1260,6 +1246,7 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
>      unsigned a_bits = get_alignment_bits(get_memop(oi));
>      void *haddr;
>      uint64_t res;
> +    MemOp op;
> 
>      /* Handle CPU specific unaligned behaviour */
>      if (addr & ((1 << a_bits) - 1)) {
> @@ -1305,9 +1292,13 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
>              }
>          }
> 
> -        res = io_readx(env, &env_tlb(env)->d[mmu_idx].iotlb[index],
> -                       mmu_idx, addr, retaddr, access_type, size);
> -        return handle_bswap(res, size, big_endian);
> +        op = SIZE_MEMOP(size);
> +        if (need_bswap(big_endian)) {
> +            op ^= MO_BSWAP;
> +        }
> +
> +        return io_readx(env, &env_tlb(env)->d[mmu_idx].iotlb[index],
> +                       mmu_idx, addr, retaddr, access_type, op);
>      }
> 
>      /* Handle slow unaligned access (it spans two pages or IO).  */
> @@ -1508,6 +1499,7 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
>      const size_t tlb_off = offsetof(CPUTLBEntry, addr_write);
>      unsigned a_bits = get_alignment_bits(get_memop(oi));
>      void *haddr;
> +    MemOp op;
> 
>      /* Handle CPU specific unaligned behaviour */
>      if (addr & ((1 << a_bits) - 1)) {
> @@ -1553,9 +1545,13 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
>              }
>          }
> 
> +        op = SIZE_MEMOP(size);
> +        if (need_bswap(big_endian)) {
> +            op ^= MO_BSWAP;
> +        }
> +
>          io_writex(env, &env_tlb(env)->d[mmu_idx].iotlb[index], mmu_idx,
> -                  handle_bswap(val, size, big_endian),
> -                  addr, retaddr, size);
> +                  val, addr, retaddr, op);
>          return;
>      }
> 
> diff --git a/memory.c b/memory.c
> index 6982e19..0277d3d 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -352,7 +352,7 @@ static bool memory_region_big_endian(MemoryRegion *mr)
>  #endif
>  }
> 
> -static bool memory_region_wrong_endianness(MemoryRegion *mr)
> +static bool memory_region_endianness_inverted(MemoryRegion *mr)
>  {
>  #ifdef TARGET_WORDS_BIGENDIAN
>      return mr->ops->endianness == DEVICE_LITTLE_ENDIAN;
> @@ -361,23 +361,27 @@ static bool memory_region_wrong_endianness(MemoryRegion *mr)
>  #endif
>  }
> 
> -static void adjust_endianness(MemoryRegion *mr, uint64_t *data, unsigned size)
> +static void adjust_endianness(MemoryRegion *mr, uint64_t *data, MemOp op)
>  {
> -    if (memory_region_wrong_endianness(mr)) {
> -        switch (size) {
> -        case 1:
> +    if (memory_region_endianness_inverted(mr)) {
> +        op ^= MO_BSWAP;
> +    }
> +
> +    if (op & MO_BSWAP) {
> +        switch (op & MO_SIZE) {
> +        case MO_8:
>              break;
> -        case 2:
> +        case MO_16:
>              *data = bswap16(*data);
>              break;
> -        case 4:
> +        case MO_32:
>              *data = bswap32(*data);
>              break;
> -        case 8:
> +        case MO_64:
>              *data = bswap64(*data);
>              break;
>          default:
> -            abort();
> +            g_assert_not_reached();
>          }
>      }
>  }
> @@ -1451,7 +1455,7 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
>      }
> 
>      r = memory_region_dispatch_read1(mr, addr, pval, size, attrs);
> -    adjust_endianness(mr, pval, size);
> +    adjust_endianness(mr, pval, op);
>      return r;
>  }
> 
> @@ -1494,7 +1498,7 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
>          return MEMTX_DECODE_ERROR;
>      }
> 
> -    adjust_endianness(mr, &data, size);
> +    adjust_endianness(mr, &data, op);
> 
>      if ((!kvm_eventfds_enabled()) &&
>          memory_region_dispatch_write_eventfds(mr, addr, data, size, attrs)) {
> @@ -2340,7 +2344,7 @@ void memory_region_add_eventfd(MemoryRegion *mr,
>      }
> 
>      if (size) {
> -        adjust_endianness(mr, &mrfd.data, size);
> +        adjust_endianness(mr, &mrfd.data, SIZE_MEMOP(size));
>      }
>      memory_region_transaction_begin();
>      for (i = 0; i < mr->ioeventfd_nb; ++i) {
> @@ -2375,7 +2379,7 @@ void memory_region_del_eventfd(MemoryRegion *mr,
>      unsigned i;
> 
>      if (size) {
> -        adjust_endianness(mr, &mrfd.data, size);
> +        adjust_endianness(mr, &mrfd.data, SIZE_MEMOP(size));
>      }
>      memory_region_transaction_begin();
>      for (i = 0; i < mr->ioeventfd_nb; ++i) {
> --
> 1.8.3.1
> 

LGTM!
