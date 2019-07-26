Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11977931wrv;
        Fri, 26 Jul 2019 07:25:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzeqSWnlYZEw7gbG3vlUDjMAUrleL3NrymOOSwPIua/lvbe6uAR11MIVpp+lVa/2DEK3e9v
X-Received: by 2002:a17:906:4354:: with SMTP id z20mr32507891ejm.163.1564151107905;
        Fri, 26 Jul 2019 07:25:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564151107; cv=none;
        d=google.com; s=arc-20160816;
        b=O+8p4V9WSqiAryyKg85Myl15rT0mA/6he9jojr/gTlZpdgIkhJgBcg2qqp8Mz/H1vJ
         Yr4eL0bHYifvOiisb7VoIySBsZAjEDlJbQkSPWA0v7S9h+Yl/JuycWSGCEMaZk+Mq5UD
         wL40RvoyxIaC8ne0t6mkWZVGLg3rpBddPur+Px93OAxXMuq5aSVAEwxCme85jNJJvxht
         nne3682OxcqyM2i03Q6HUdT4b0BBoVBvpWdgpAwbVkSHbbkvGA2SUpbPIlrixHEcLM7e
         Mg06sN6XNfQyOYvilChRAVH6BNisCYE/5V3jUOzKTuc3P0j1u4jMg+Snw0lGHQ69WXik
         Yrhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=ch7GhX8r4Ua0ued6sWDZ5gUIVhUso0uIeEsP69b2pZY=;
        b=v6YR9D7Xygtu2ztZWc6MSVndaiVrpvv+awL5dtMD2c1VfbioIOuEXq6XPPs+xBOcTK
         3vlZVS/prf5KeVUNdvWKK4Ha8whahpHQzl+iiGwG8OuSQrpr9ipPVOkNoYkaFFxn+c/O
         8OE5AjleuGKDhjb+IqQxEpXxraKZB9q0wn01Vg5yddymHIyzY83UcMjJSqkCurfq+lsN
         p10w6vuaKNqF4hPnt9n9ZW9/vjCsHUPSrHte1gE4iqqXunjrnxsWLG7boRqm+2ISUJJy
         L19OyJX4fWSYZAE9v4L2utmWeF9Hy4yT42+6yujhin4EX9POd0/GRF4Qov8ldSovK9a3
         XPIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MN835LS0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i29si13415956eda.300.2019.07.26.07.25.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 07:25:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MN835LS0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hr19e-0006jg-Vh
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 10:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35872)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr19Q-0005wB-2D
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 10:24:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr19O-00041b-Qk
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 10:24:51 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42971)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr19O-0003zr-II
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 10:24:50 -0400
Received: by mail-pg1-x544.google.com with SMTP id t132so24861440pgb.9
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 07:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ch7GhX8r4Ua0ued6sWDZ5gUIVhUso0uIeEsP69b2pZY=;
 b=MN835LS0CPkIR+fLKbEAD32Q6aOiotryzACHWZFmTtEGv3TTD+xkck5wPvj0KshTkE
 j0ZUJC0KtpnAzkMiLulHHUnfbr+Ul3br6lb/amGB4hTvnF1h0h6anllyp40/ZogTH5JC
 +Hcc1egomrLtt2+xz5gJMVV3QHBWdDW6wkswEYEQCRDbUMqESEf1BI7L9+OKeRZjJM51
 pgyP7+CUALIsQqEoEU0feN5VVs3TMfL9T9eGc3Bf5ng8wDozqPhKmoVp9XdXztSVJXrB
 O3x3y1h8sqtAwsH02jJ9FpEGvx6rpOBr01Rn3AxVqS9wsi+KKHn6W5NX2/UriM6sWjde
 gbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ch7GhX8r4Ua0ued6sWDZ5gUIVhUso0uIeEsP69b2pZY=;
 b=FELfmi6tATeVNeB339iRYUhg/dwOVv6rBKBygw+sQTlddAn5lXGQQH5j9lGmK01Dpm
 eGT5GW2kGB8wI5J3SFW+IXi/v+KsFBAn6RiPdcqYxsDlthdbTMDU5uE2CzFgfhH/AECT
 MicwBFgpWA5XRUeOOPOl4zD2P9yDCaiDeKno+zHEkQ1ebTxzRBkksdOcH/4PUxSjkS6w
 M+gFDNlJfOu3g+1KRYhephWZf05CsJbnlam/t50biePI4MBbjA2L+5oVsVfLyfTglPzc
 SJeKl5ZaJ6d/o8vct0XKGW8Z8hpurMzQtPp59f3OVkQ27U/bWZ2n57jvBmA7/ZUq10/i
 CfeA==
X-Gm-Message-State: APjAAAVFIMC8cfVDdlu2BSG9v3qgFKu4ANfDG4ArsdcVcizix+RJ+GWf
 XjqCxEjKryxD1mq4hZ+JvuAU7A==
X-Received: by 2002:a62:b60e:: with SMTP id j14mr22759183pff.54.1564151088872; 
 Fri, 26 Jul 2019 07:24:48 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id x26sm68965119pfq.69.2019.07.26.07.24.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 07:24:47 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123643791.27023@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <182cfe57-bd92-77e4-2b8f-9c4f543c6661@linaro.org>
Date: Fri, 26 Jul 2019 07:24:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123643791.27023@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-devel] [PATCH v5 10/15] memory: Access MemoryRegion with
 MemOp semantics
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, sagark@eecs.berkeley.edu,
 mst@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 Alistair.Francis@wdc.com, edgar.iglesias@gmail.com, alex.williamson@redhat.com,
 arikalo@wavecomp.com, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, rth@twiddle.net, atar4qemu@gmail.com,
 ehabkost@redhat.com, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 stefanha@redhat.com, shorne@gmail.com, david@gibson.dropbear.id.au,
 qemu-riscv@nongnu.org, kbastian@mail.uni-paderborn.de, cohuck@redhat.com,
 laurent@vivier.eu, qemu-ppc@nongnu.org, amarkovic@wavecomp.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vheCs6pN/2mG

On 7/25/19 11:47 PM, tony.nguyen@bt.com wrote:
> To convert interfaces of MemoryRegion access, MEMOP_SIZE and
> SIZE_MEMOP no-op stubs were introduced to change syntax while keeping
> the existing semantics.
> 
> Now with interfaces converted, we fill the stubs and use MemOp
> semantics.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  include/exec/memop.h  | 5 ++---
>  include/exec/memory.h | 4 ++--
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/include/exec/memop.h b/include/exec/memop.h
> index 09c8d20..f2847e8 100644
> --- a/include/exec/memop.h
> +++ b/include/exec/memop.h
> @@ -106,8 +106,7 @@ typedef enum MemOp {
>      MO_SSIZE = MO_SIZE | MO_SIGN,
>  } MemOp;
> 
> -/* No-op while memory_region_dispatch_[read|write] is converted to MemOp */
> -#define MEMOP_SIZE(op)  (op)    /* MemOp to size.  */
> -#define SIZE_MEMOP(ul)  (ul)    /* Size to MemOp.  */
> +#define MEMOP_SIZE(op)  (1 << ((op) & MO_SIZE)) /* MemOp to size.  */
> +#define SIZE_MEMOP(ul)  (ctzl(ul))              /* Size to MemOp.  */

As mentioned, I'd prefer inline functions.

I think it wouldn't go amiss to do

static inline MemOp size_memop(unsigned size)
{
#ifdef CONFIG_DEBUG_TCG
    /* power of 2 up to 8 */
    assert((size & (size - 1)) == 0 && size >= 1 && size <= 8);
#endif
    return ctz32(size);
}


> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 0ea4843..975b86a 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -1732,7 +1732,7 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner);
>   * @mr: #MemoryRegion to access
>   * @addr: address within that region
>   * @pval: pointer to uint64_t which the data is written to
> - * @op: size of the access in bytes
> + * @op: size, sign, and endianness of the memory operation
>   * @attrs: memory transaction attributes to use for the access
>   */
>  MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
> @@ -1747,7 +1747,7 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
>   * @mr: #MemoryRegion to access
>   * @addr: address within that region
>   * @data: data to write
> - * @op: size of the access in bytes
> + * @op: size, sign, and endianness of the memory operation
>   * @attrs: memory transaction attributes to use for the access
>   */
>  MemTxResult memory_region_dispatch_write(MemoryRegion *mr,

As I mentioned, now is when the actual interface change to these functions
should occur.


r~
