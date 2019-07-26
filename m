Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp25758wrv;
        Fri, 26 Jul 2019 07:52:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwMEcqGoRVUgVVB6UvArciaCqUubhqQrXK0PbCkPphJebIHDxQQmuJ23GVSMAuytSDhWVI6
X-Received: by 2002:a17:906:ece7:: with SMTP id qt7mr74020158ejb.155.1564152740588;
        Fri, 26 Jul 2019 07:52:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564152740; cv=none;
        d=google.com; s=arc-20160816;
        b=S1/EhoKVe5gW2oblqapVLB8aESOn464HX4JJHYsJfO4WS7lLjYDxH8GIpqUBdYrV9h
         V5iEaDYT1/ynlOpVgBz5tghKHXt5kIkxNx84Ov0hfa5Ur+mPtNKZBRwxBWXROksulRNU
         NqNXOcLAiUKDlAslkaqWni/eg032LSZBBJSu+Qd5bV6izCQYDBXcqo8pVc3I+XE46gfN
         baa26xdi4Z4++8hRVpgN3lY9CF29B/nWDtawylZvreGkmWgvIgCKhf0kafJmp4MqryQH
         PfYhDTXQO/7UM38ETpAalCaut3VsA2CYEyHT1BhQB6E7R5TH7Dz939pTX0FXLdYHTi00
         5szg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=DKUk+JMDa/GVguAaQpilVBEyiY8Tss0uUjUAv7GcFHM=;
        b=LH2nZensCKeiWltPaB3FuIYcJRMm9q25CKykpZT9fGIGHH+aJEoDujEHjgP8Ck3wPz
         EvAu+6pHNehw4cpwM5+zjMUJt/goF5Uv3c9vtdziGANlzBBqDEnWYa/9cJ2N8eOgnlR3
         TQ4IVnj4nEQkvRAHH+hSMfAQ2DIv6Y1ox5q+E2FpuOdBrygWUMhINCA2w2AAeKidR8so
         VOyn+/7MRUgepXFUbfwN+Cn3zJ1hwIoE3L0T/LBATCntKq+U4tDRsVN7buH1EzonegAH
         D26ngLs8HDGVB5KoS45Lj1isq8aqva0IybvkI+2L1j0EuFWw7jUrlLym/vVrqrZ2kKuc
         P5xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yki7t2c2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c28si13789168edb.158.2019.07.26.07.52.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 07:52:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yki7t2c2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hr1Zz-0005vN-BC
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 10:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60095)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1Zv-0005sk-4z
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:52:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1Zt-0001B7-Sh
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:52:15 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:37841)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr1Zt-00018e-I6
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:52:13 -0400
Received: by mail-pl1-x643.google.com with SMTP id b3so24877781plr.4
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 07:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DKUk+JMDa/GVguAaQpilVBEyiY8Tss0uUjUAv7GcFHM=;
 b=yki7t2c2O4EFurbmFQvEdyp2l1LH67UUZpAvAa7DIzE4KYmj2UiYgbEoM+rp/7qIag
 Ter5W0Sr3Q4gwYajCgiyzqNzEbKIQ2GUDW4wSnM9/MsnmlMnsJtcGyPXfV8mp+CJVsZE
 Yf8hY8d53BhxQ1EQnlKxafogK2rb+yDeoU5FPVzdfCMfP7hQQfTHOZwOyoswqPpmwKya
 cA4ppEZQpv6rgbpY6NTN5LX2PaVuQWjb0Y3lU9/jTghcs48k3osinKmCl9oIw6r6SAhG
 a8dvKbqpx+8LzOU45SFiNV7i6X90NGn+GS8/qZmXBy35Y29FdotUaZEYRJzFjRb6OJ9y
 TvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DKUk+JMDa/GVguAaQpilVBEyiY8Tss0uUjUAv7GcFHM=;
 b=JZvpZ9vHcFvqz3zM7ZQEy9ulb3OnVCoQ0d9Si+/Oih2XaL5ZX2UsoeSKEORwv4n+5e
 LqFZTQgq5dEDa0k5U2XfTOLMSveEm7HxwAsMdAKY0vOntmlrnF7jcljWHIxePeamDUcj
 GzZ/cmmufQFsnqVz3xIJ2J0R2fSxPgh6f1a4du8PzJTu98olmAoCKoi8pG8ue/9MHcNi
 bVP6uNN3IejpdjGh4Cqsey3HDGk0Zjxq50Z4cU0dRQadlnpJRucyJ8yYWwV99UsZbc8U
 xtfvtzpPJPSzoU1G4saP61CizD38cOxu8+NUvqtRVvsBCJZexG2OpaepoD27Xh9doHjK
 9J6A==
X-Gm-Message-State: APjAAAWhBo6C7qt7eRmVtTuXX+s7gE2/xjViHNp61Mvf3rscKJm+dZAX
 vjxiVARl+pKZD0skj9kEdCDjRQ==
X-Received: by 2002:a17:902:d90a:: with SMTP id
 c10mr94535077plz.208.1564152732290; 
 Fri, 26 Jul 2019 07:52:12 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id a21sm60770923pfi.27.2019.07.26.07.52.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 07:52:11 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123712210.75919@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3342e044-607c-0aaa-fe63-27500db68e71@linaro.org>
Date: Fri, 26 Jul 2019 07:52:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123712210.75919@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 13/15] cputlb: Byte swap
 memory transaction attribute
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
X-TUID: HgNNj5DQwpzB

On 7/25/19 11:48 PM, tony.nguyen@bt.com wrote:
> Notice new attribute, byte swap, and force the transaction through the
> memory slow path.
> 
> Required by architectures that can invert endianness of memory
> transaction, e.g. SPARC64 has the Invert Endian TTE bit.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  accel/tcg/cputlb.c      | 11 +++++++++++
>  include/exec/memattrs.h |  2 ++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index e61b1eb..f292a87 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -738,6 +738,9 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
>           */
>          address |= TLB_RECHECK;
>      }
> +    if (attrs.byte_swap) {
> +        address |= TLB_FORCE_SLOW;
> +    }
>      if (!memory_region_is_ram(section->mr) &&
>          !memory_region_is_romd(section->mr)) {
>          /* IO memory case */
> @@ -891,6 +894,10 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>      bool locked = false;
>      MemTxResult r;
> 
> +    if (iotlbentry->attrs.byte_swap) {
> +        op ^= MO_BSWAP;
> +    }
> +
>      section = iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs);
>      mr = section->mr;
>      mr_offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
> @@ -933,6 +940,10 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>      bool locked = false;
>      MemTxResult r;
> 
> +    if (iotlbentry->attrs.byte_swap) {
> +        op ^= MO_BSWAP;
> +    }
> +
>      section = iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs);
>      mr = section->mr;
>      mr_offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index d4a3477..a0644eb 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -37,6 +37,8 @@ typedef struct MemTxAttrs {
>      unsigned int user:1;
>      /* Requester ID (for MSI for example) */
>      unsigned int requester_id:16;
> +    /* SPARC64: TTE invert endianness */
> +    unsigned int byte_swap:1;

Don't mention Sparc here, otherwise it seems like it only applies to Sparc,
when it is really a generic feature only currently used by Sparc.

Just say "Invert endianness for this page".

With that,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
