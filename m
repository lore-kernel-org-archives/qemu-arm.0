Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp6322971wrm;
        Tue, 15 Oct 2019 15:04:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqza7OGVbnnu+b7prcFHiYsvs0ucRauy2MUtyMC9ULIEac6c1HcALNNykupUrDX6SKMXRevn
X-Received: by 2002:ad4:50a8:: with SMTP id d8mr39501576qvq.8.1571177066282;
        Tue, 15 Oct 2019 15:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571177066; cv=none;
        d=google.com; s=arc-20160816;
        b=xHekOBL6AxaUnXf3kB9JffAoR6FARz9lW/xZTMVwb/dmYK4ywT2YBHSjYoiLsX5ATW
         4NdBCugmXZn9bi35p/BJ4HweVmfXUkz8udFkvs502tQa7aVp5yo1NTaRH2v/+5T05Xn6
         deUVjAQWsRhY5jGJ12nn/XHKY9QxTwNpqE4yH0apbseES9pyESfdpJ5dU4HaAo+gD1JW
         FZk1GuhFFzIlEOGeICsXVbkfyMQE2raatace1tTAfNzHBGxM+iYqyHD0rAbFCEh2gUzt
         zbs5xx42fRSMv+sSl/KuVTfD/0icgvwRMHgfpclxPuzlO+IpP8lOhfvCGtC6HuRP9eOt
         XBDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=WlM9qJ26FVCtq2jMelepxWIYCn2U4CiSRTZw+YpUCb8=;
        b=c4WmuGFVMWy9SMGAnxA7KOod6j17nFxy8w3K/Z5cUCIKu1udDkBuIK1th6F3oD28zn
         maC37WI5L7ySREuXl36N1XBrisCETukht31gyIQuBcBJrM75pvVNpA0RyLes7NoP93Zj
         P1R3h3ZTLMW0rmomFopq2tmPydELwB+O1SbdIlRdO5fvXci/xexr+dbztN0VoMpNtEvc
         PQrDIrYtlicSdgH0ejl8uDQWGscR/0ddTLmKVYxKVxOjVXvPBT1dQfOMwEzXFLktMobH
         dam0Ll0Yj9hR+oJzyVOaR1/xk+7/mBFFdTzRJQg6+cy19jubOaS8uxRfw3AAsBnBS8BX
         JpbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="e+o7Flo/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o130si22775116qke.281.2019.10.15.15.04.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Oct 2019 15:04:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="e+o7Flo/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKUvZ-0006F0-MQ
	for alex.bennee@linaro.org; Tue, 15 Oct 2019 18:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35236)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iKUvQ-0006EH-Hp
 for qemu-arm@nongnu.org; Tue, 15 Oct 2019 18:04:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iKUvP-00008J-7T
 for qemu-arm@nongnu.org; Tue, 15 Oct 2019 18:04:16 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40170)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iKUvP-000082-0h
 for qemu-arm@nongnu.org; Tue, 15 Oct 2019 18:04:15 -0400
Received: by mail-pl1-x644.google.com with SMTP id d22so10233356pll.7
 for <qemu-arm@nongnu.org>; Tue, 15 Oct 2019 15:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WlM9qJ26FVCtq2jMelepxWIYCn2U4CiSRTZw+YpUCb8=;
 b=e+o7Flo/RQIdkm3zHprASXlgV+xKalpnNuUy66Cg4pWH2jsaB12eTKbyOX1XHcS2RW
 aglfuAnOOkt2Izir/zLe5YrkGtMeLQd0K6LjUBMnwW2lWDPOwtyOhXStbVpJInUVHubz
 UzRH8F/z3uL6Ml1nqWUAe5sSYdk8qwr3gY3fSkGCmYFx/LzlTI4KskfJzgWOZ7QxHbx+
 pyBIrziISb8v/QfN8zTxKdxtNYH563nJkGhDr9N8HAeHV/dCotuNcsQ51vEi6BDkIBvQ
 5/e9+arnYRUOGoXS89fvKEqcF0caGde7VzBbMwA2JsP9O1KpBdn4nFW3P59zv1KZg6E3
 VXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WlM9qJ26FVCtq2jMelepxWIYCn2U4CiSRTZw+YpUCb8=;
 b=YCFtrXM9Lj2woyWN+L1CDdJ+GTKc5KAChghiz+QHotEyzxcw850BoB0xmRO2OH9E7E
 adYB5Q+CW7AWtsR9StVj/9JkTEfYrvVWU2GqVM6/gjDoJy2uJDXlZkoYwpbymJgca6SI
 yxqZ163fDwnxAnIoq62MWuQxijmu8iDjBBd2Y6o6cZM4U2byttAWHucHp1QTSV62ZWtp
 7/fiTmlEEHipM8fJopSNhq47/gRSj/p/TCskFBBgHu343mTZiEiNo8pwuhsL6hWUya2L
 Rp+qKADVxDe1JVjJdmIlPnUQpOMxianTGvwz/FXCiuwzjfMnPlYMZZ/km57Vzyr3Dee9
 pmoA==
X-Gm-Message-State: APjAAAX+I7S4oiabRw/iAueJLhU51zy7Y4lGwhdM5vQdvN4OmT40ZSkb
 NWkKW8lrEx4IYBspEp8XUlsGDWFWahs=
X-Received: by 2002:a17:902:bd47:: with SMTP id
 b7mr3491572plx.124.1571177053361; 
 Tue, 15 Oct 2019 15:04:13 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id a13sm33727661pfg.10.2019.10.15.15.04.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Oct 2019 15:04:12 -0700 (PDT)
Subject: Re: [PATCH v5 00/22] target/arm: Implement ARMv8.5-MemTag, system mode
To: Evgenii Stepanov <eugeni.stepanov@gmail.com>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <CABMLtrhb2n3WbpROs0Qa9hFBObom0Qm60t2nioOyWTtgbpu7HA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3d53c538-9725-18a8-079f-de490ed586a5@linaro.org>
Date: Tue, 15 Oct 2019 15:04:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CABMLtrhb2n3WbpROs0Qa9hFBObom0Qm60t2nioOyWTtgbpu7HA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /C6uf0+Irpmx

On 10/15/19 1:39 PM, Evgenii Stepanov wrote:
> Hi,
> 
> please find attached three random fixes for instruction translation
> and one for syscall emulation.

Thanks for the patches.

> @@ -2763,7 +2763,8 @@ static void disas_ldst_pair
>          return;
>      }
>  
> -    offset <<= size;
> +    // STGP offset is 16-scaled.
> +    offset <<= (size + set_tag);

Right.  I'll fix this with

    offset <<= (set_tag ? LOG2_TAG_GRANULE : size);

which I think is a bit clearer.

> @@ -3611,7 +3611,7 @@ static void disas_ldst_tag
>      int rt = extract32(insn, 0, 5);
>      int rn = extract32(insn, 5, 5);
>      uint64_t offset = sextract64(insn, 12, 9) << LOG2_TAG_GRANULE;
> -    int op2 = extract32(insn, 10, 3);
> +    int op2 = extract32(insn, 10, 2);

Yep.

> @@ -3679,7 +3679,7 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
>      }
>  
>      dirty_addr = read_cpu_reg_sp(s, rn, true);
> -    if (index <= 0) {
> +    if (index >= 0) {
>          /* pre-index or signed offset */
>          tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
>      }
> @@ -3726,7 +3726,7 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
>  
>      if (index != 0) {
>          /* pre-index or post-index */
> -        if (index > 0) {
> +        if (index < 0) {
>              /* post-index */
>              tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
>          }

Yep.

Ideally there'd be a kernel patch for MTE that works well enough to run RISU on
the fast model, and I'd be able to compare results.  I suppose in the meantime
more unit testing will have to do.

> +++ b/linux-user/qemu.h
> @@ -456,8 +456,16 @@ extern unsigned long guest_stack_size;
>  #define VERIFY_READ 0
>  #define VERIFY_WRITE 1 /* implies read access */
>  
> +static inline abi_ulong untagged_addr(abi_ulong addr) {
> +#if TARGET_ABI_BITS == 64
> +    addr &= (((abi_ulong)-1) >> 8);
> +#endif
> +    return addr;
> +}

At minimum this needs TARGET_AARCH64, because this kernel feature doesn't apply
to other targets.  But I'll see if I can do this such that it doesn't put
target-specific stuff in linux-user/qemu.h.


r~
