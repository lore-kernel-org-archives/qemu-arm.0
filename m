Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4308145lfm;
        Mon, 27 Apr 2020 09:17:08 -0700 (PDT)
X-Google-Smtp-Source: APiQypI0ubrBwFWAbN604v84qpce+jzb9CJbKtzbp1iyGOdon6NwnDEG84TYYTOMyF3XNag+v9Do
X-Received: by 2002:ac8:2fda:: with SMTP id m26mr23475239qta.80.1588004228094;
        Mon, 27 Apr 2020 09:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588004228; cv=none;
        d=google.com; s=arc-20160816;
        b=jfiou2hfvnghXNyNapTzMlMfkkXH/4z/z2icuCS8zk+ecjE0+8tymiT5fyPX7tg1Mc
         nCx7rVTqMw2LzByUNq9NSUwnOaUCmTI1zFBqGVafCDPYY4Cl5mTACPt7/wNyeg/xDBRU
         squlBiiT9ktnDcXTJa4DzCLoOCe/PSyQb008aAvzbLHeJbBVW+jFgYyvLBGSe4dx1J6V
         tFeIJBmqIU1CN/XxmT9E6zJ1Kxg5Ll4Mn+xRfF+IKqeYFWjFsLVsXa07ew3CI2z43vbo
         1DCvRXGBl+BdTI/bsaRalDOIVLHUBdo76jdItyrMgqeFChh27HGIiH09jDplaRqafVfj
         5RlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Vs+9SgnafgxYI6coYVHzwjIW45e3x10OnSovARfUee8=;
        b=YFqL6vvX4Vsgdh9zU2lemSYadMhA50fMvfUn9y4lBRYecA1R9SUdXB9zqmxDHtb8z8
         OUkFzQaR2Oj+TedGm1pmUlQynY9+a2JSWIqAfx/lCQ/wpteuvjrcS3prYgw05+STU/Xs
         2AJwJ2i8dzZVUT0rj/ALEh6UUMRw5Sr8n9ANrzgVrn+e38ioqOOX1bicu/aXyVjKoTy8
         DVvqednQjB2hx1SLgnVTw1WLIyAg9aZn37+YAH19RxjOvOucVASABYFvSTdfnMyrDYQy
         gpGvQkq+NxFpAxCZnyq4KHX15wI6pKr+vI4ebeVNiPEv+/HCS8pxfKCybgqPEU5AVmsp
         UQJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uHnPyY2+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y140si8461123qkb.117.2020.04.27.09.17.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 09:17:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uHnPyY2+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jT6RP-0000wp-Hf
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 12:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46346)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jT6Qb-0000M5-Ca
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 12:16:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jT6Qa-0000fc-KZ
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 12:16:17 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:37583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jT6QZ-0000f6-U8
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 12:16:16 -0400
Received: by mail-pg1-x543.google.com with SMTP id r4so8880271pgg.4
 for <qemu-devel@nongnu.org>; Mon, 27 Apr 2020 09:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vs+9SgnafgxYI6coYVHzwjIW45e3x10OnSovARfUee8=;
 b=uHnPyY2+G0bWVWXmDJLx0pKo4pupP1fOIfiEuSqKwDyEPcbX+TYOcj7jOsVszMZIfL
 HcrVMFVH/GrCCgzhjB3fgQQscC2loBMiuS/ib3hb2SGkHR9khC12F5ScZipkxZ/s1i75
 /DR1LMKjCJN1nbLQTjsBNXuazu7vUm6VtKqzLd/3hz5Cy0OjKbjBuzLOzqC7z0+IpCeq
 p7I7of5Kz/ZeMEXkgZPaENnruz2sM0nRW0V+x92rhuoBU1z6A1Wr7RSt67DbL3wIRhvX
 tdXbNZLHp13C6Le/x1iEmsWexoy88GZMpqKDh0rLhqhokFpPznBbBIZINKA97NUVqdea
 PWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vs+9SgnafgxYI6coYVHzwjIW45e3x10OnSovARfUee8=;
 b=dxEHyb2eowi6LgjtjU70IDp3ylqrW0N4vbLvTrAwnDEkMxv/3VmCiuXl1UKlTszbqI
 ym3jrJrFMoWbH3R4bmIdkzh+0NbSrpYuahJtNNvpSoQVJcLC+4EmBEpqIa5F7mh5Wzn9
 7GrDocCVYqBjXlPqdWchJEPz4peucF4aBahqy0qPm4bSxrogeWHZUFg/rUk77zjNfUUy
 eVWvgdBT5vJi5irx6XLtN1DH5zoi/aXb1Jikx/PpuT/q3A329yo1dlEEP4itJAmsCHLV
 qEOJFVYOyR2EMaE7Copa+3r99JNvc6Jnqhh1oHnPVfRt1aZ/bBbddIK0xvRaHEzpucVo
 AlEQ==
X-Gm-Message-State: AGi0Pua+/tBKz+4WZDXSBzdoqgrGKmTBjEkKe1gPyJGjNz6YuvqZVHEu
 z3ezs7O9a19Xe0Hka0+avcQktg==
X-Received: by 2002:a63:491b:: with SMTP id w27mr161516pga.382.1588004174110; 
 Mon, 27 Apr 2020 09:16:14 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id w126sm12627032pfb.117.2020.04.27.09.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2020 09:16:13 -0700 (PDT)
Subject: Re: [PATCH v3 13/18] target/arm: Update contiguous first-fault and
 no-fault loads
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200422043309.18430-1-richard.henderson@linaro.org>
 <20200422043309.18430-14-richard.henderson@linaro.org>
 <CAFEAcA8oWP9XGzD+pb_VhDth8zx8j1Gz4vwiK+dArpw8x1BmqA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <22c1fd55-7cd3-6320-1f90-40d1bd2cc883@linaro.org>
Date: Mon, 27 Apr 2020 09:16:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8oWP9XGzD+pb_VhDth8zx8j1Gz4vwiK+dArpw8x1BmqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7Eezu9QsnK06

On 4/27/20 4:03 AM, Peter Maydell wrote:
> On Wed, 22 Apr 2020 at 05:33, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> With sve_cont_ldst_pages, the differences between first-fault and no-fault
>> are minimal, so unify the routines.  With cpu_probe_watchpoint, we are able
>> to make progress through pages with TLB_WATCHPOINT set when the watchpoint
>> does not actually fire.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
>>      /*
>> -     * Perform one normal read, which will fault or not.
>> -     * But it is likely to bring the page into the tlb.
>> +     * From this point on, all memory operations are MemSingleNF.
>> +     *
>> +     * Per the MemSingleNF pseudocode, a no-fault load from Device memory
>> +     * must not actually hit the bus -- it returns (UNKNOWN, FAULT) instead.
>> +     * If you map non-RAM with Normal memory attributes and do a NF
>> +     * load then it should access the bus -- but doing so is illegal.
>> +     *
>> +     * While we do not have access to the memory attributes from the PTE
>> +     * to tell Device memory from Normal memory, we can validly assume that
>> +     * non-RAM has been mapped as Device memory.  Thus we indicate fault
>> +     * on all MMIO.
> 
> I still don't understand why this is right. All non-RAM is MMIO
> but not all MMIO is non-RAM; so you might have something that's
> MMIO (at least for the moment) and has been mapped Normal. That
> shouldn't fault.

Everything that must go through the slow path has TLB_MMIO set.

What you're thinking of, romd, has TLB_MMIO set on the write comparator but not
the read comparator.

Have another browse through tlb_set_page_with_attrs, lines 859-893, and the
uses of is_romd.



r~
