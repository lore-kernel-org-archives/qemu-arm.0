Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp809243lfg;
        Wed, 10 Mar 2021 11:30:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3SxUaHCmCKTnEl77VeVG5ud+cr9ISG3KhyqTwGNvWMRV3eqQhF2uzJnZNNz+UqLj4lh8l
X-Received: by 2002:aed:3ae1:: with SMTP id o88mr4133881qte.154.1615404613579;
        Wed, 10 Mar 2021 11:30:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615404613; cv=none;
        d=google.com; s=arc-20160816;
        b=k5NlMylcmyl2mSHskhdiv/QMNNExXDDtY4FzBZUSCMZur92FX7HfDpVUra6/xP27pC
         VIXzhS9/moHFMLX7cL1wX+bLUucNoVAx2Mqs/PJxHcjRuF7TQtXsM9Rbg4cp1GRJIsAQ
         vHNcRzz/IBWcyISFpw754PnYwVLnjDmc22yRFOp8mtZuEitTtly8sIagyEjELE7tK8sC
         NsbXOmYdGMkvigYKTo6vSrJ5nMLIQH8WPsZB3z9SnX5NHchwNfpf7JlTIY9qCKDk2iGy
         c56Is3wNomJHM+wGaBfiR2QjN8DavXR8VnTFzHI9N+05k6qv7M+VKZWbNuXYfjk7q/sl
         AQjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XSxPfeKsGt/KHL12eBPoOrSXhcsQE6kPRF7VXVs665M=;
        b=Xsw8z/kxmXLsitBdT3fxeErEnwmXl2swZdXdAAGdyuvoyrsi4LG3FJc/TkSQPQ76Yl
         LACTZl8u+sRtuPfQyWF2onKCLs0HuYQxFpcTra5GBLoxqFvC2/ETMLrP4pQSR5nyvpCU
         TYpWDx2T3pCENqKJaxhxXaJWbn8TCc3WUQmewMhREBLTpR87ngx0kRB/qAvJb6s5kf+V
         fCQ0s/rgdSNEvMsqdERaxojVJVQsB5ZTdlW8vDVMl576o2GjST8C+EMxCmAN1alRK4kk
         DCKYDYZFwGrdIHS4HBCDlUYNVtsPUEHT2GhxKq5QuCJyjPNSGV28MYADeqU1tDOMSTp7
         JkoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bLORgX0d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9si219646qtw.210.2021.03.10.11.30.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Mar 2021 11:30:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bLORgX0d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lK4X6-0001mk-Re
	for alex.bennee@linaro.org; Wed, 10 Mar 2021 14:30:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK4RQ-0006VV-Bt
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:24:20 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:44166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK4RO-0002r2-FH
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:24:20 -0500
Received: by mail-oi1-x232.google.com with SMTP id w195so13732479oif.11
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 11:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XSxPfeKsGt/KHL12eBPoOrSXhcsQE6kPRF7VXVs665M=;
 b=bLORgX0ddZUWx/DKFHG/Rf0ve65AbUxQtkaYO8sP3qQ0cO7GGjBPGhX5fbC3yT3FFw
 FQb9z7tZFKIeWt0WqWmRsOOLHXJOwbDW8fDXrgvoPSxW5Zq0snr6bXv/4UsEe5TLP6HD
 Ga7NXkVAA7THhAkiyl9LbAxlWDIIag9L3wcKnS82sDtP73hL5oBxJN6W3IlGBsGlgYUb
 5Ybxm5mKoLEo5FiNzSk/bi6+i+qB1R91p9x2ArCyd61ZhdrbEKHbomHZPk8g3YiDCvIA
 hhCdcJzhnydTB2Rj1taMoRep4v0PQQVneeSPZ/zEoN8+ygWARkVfZzID6C9muyKrbfi8
 CgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XSxPfeKsGt/KHL12eBPoOrSXhcsQE6kPRF7VXVs665M=;
 b=q+WQjH3f5w7+dzF9luPzdiakFT3+UdoERqynawVIRb4jkUNUfaJ14y/g7hmeUlmYvk
 +MU8aK+KYw+ECLql8iK1I2XA4U6iJ7+Ijvvkbm6KbZq03inlxTGek7ElSqqU0G4IT8uq
 bPSxtoCW34PpQsN2DILrgA9RfdUfV5alwwe58tqN2tHaqFtBdKZWObFyCGevjtGnWZCF
 f4gGgLZYmsSuZkl5qhPS0qtZC06dE8wO1p6jKtglB3+1x9Bobw+kg10THLZ4VrKazWd+
 ijldQ5kWPwlbz9O41lgq82B2JDOvgcdF7ddqwDr//BQq8KXBRfYx6OhWzPTwzeaSMyPT
 uBgg==
X-Gm-Message-State: AOAM530OgzG55rYuePTRJmFFlAcT0VRW4yTyQoa1Obe4mN4mi9JxIdLi
 v87Wq+gBamIdKoZ9haxyUYjbT26BBuHpcyLJ
X-Received: by 2002:a54:4e87:: with SMTP id c7mr3682810oiy.109.1615404252385; 
 Wed, 10 Mar 2021 11:24:12 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t22sm129532otl.49.2021.03.10.11.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 11:24:11 -0800 (PST)
Subject: Re: [PATCH v3 1/3] target/arm: Add support for FEAT_TLBIRANGE
To: Rebecca Cran <rebecca@nuviainc.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20210310002917.8876-1-rebecca@nuviainc.com>
 <20210310002917.8876-2-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3930c2d8-8972-0acf-7a48-71803072a559@linaro.org>
Date: Wed, 10 Mar 2021 13:24:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210310002917.8876-2-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Shjvnc0v9Q0X

On 3/9/21 6:29 PM, Rebecca Cran wrote:
> +void tlb_flush_page_range_by_mmuidx(CPUState *cpu, target_ulong addr,
> +                                    unsigned int num_pages, uint16_t idxmap)

I am not keen on this interface.  I think you should take either start+end 
addresses (inclusive) or start+length (in bytes).

Using num_pages, and as an unsigned int, seems too easy to fail when applied to 
a different guest.

> +{
> +  /*
> +   * We currently do a full flush, but for performance this should be
> +   * updated to only flush the requested pages, taking TBI into account.
> +   */
> +    tlb_flush_by_mmuidx(cpu, idxmap);
> +}

And if you're going to cop-out like this, you might as well just do it in 
target/arm and not add these new interfaces at all.

> +#ifdef TARGET_AARCH64
> +static unsigned int tlbi_aa64_range_get_num_pages(CPUARMState *env,
> +                                                  uint64_t value,
> +                                                  uint64_t addr)
> +{
> +    unsigned int page_size;
> +    unsigned int page_shift;
> +    unsigned int page_size_granule;
> +    uint64_t num;
> +    uint64_t scale;
> +    uint64_t exponent;
> +    uint64_t high_addr;
> +
> +    num = (value >> 39) & 0xF;
> +    scale = (value >> 44) & 0x3;
> +    page_size_granule = (value >> 46) & 0x3;

extract64()

> +
> +    switch (page_size_granule) {
> +    case 1:
> +      page_size = 4096;
> +      page_shift = 12;
> +      break;
> +    case 2:
> +      page_size = 16384;
> +      page_shift = 14;
> +      break;
> +    case 3:
> +      page_size = 65536;
> +      page_shift = 16;
> +      break;
> +    default:
> +      qemu_log_mask(LOG_GUEST_ERROR, "Invalid page size granule %d\n",
> +                    page_size_granule);
> +
> +      raise_exception(env, EXCP_UDEF, syn_uncategorized(),
> +                      exception_target_el(env));

You can't raise an exception from here, because you don't have all of the 
context for unwinding the tcg state.  Which you cannot access from within the 
callback of an ARMCPRegInfo.

The manual says that if TG does not correspond to the granule size of the 
actual translation then "the architecture does not require that the instruction 
invalidates any entries".  "Reserved" can be safely assumed to "not 
correspond", so I think you could just as easily return 0 here, after logging 
the guest error.


> +    high_addr = addr + (((num + 1) << exponent) * page_size);
> +
> +    return (high_addr - addr) >> page_shift;

I'll note that it would be much easier for you to return a byte value for the 
length, and that you don't actually need to pass in addr at all.

> +    uint64_t addr = (value & 0xFFFFFFFFFUL) << TARGET_PAGE_BITS;

The manual does not explicitly say, but I'm certain that this should be a 
signed address, when regime_has_2_ranges().  Otherwise it would be impossible 
to flush a range of kernel addresses.

But all of this is moot if we're just going to flush all pages.  At which point 
you might as well simply re-use tlbi_aa64_vmalle1_write et al.  Place your TODO 
comment in front of tlbirange_reginfo[] instead of buried n-levels further down.


r~
