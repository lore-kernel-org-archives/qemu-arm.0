Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1255696lfp;
        Mon, 11 Jul 2022 21:52:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tt+KRcSepSceAVuhYf3w/0M7w7F9yf5eCpf1tK/DfPZ/qd+I0x44GDpDi1SiirtSzvftRJ
X-Received: by 2002:a05:620a:4690:b0:6b5:944d:b70c with SMTP id bq16-20020a05620a469000b006b5944db70cmr3772325qkb.621.1657601560206;
        Mon, 11 Jul 2022 21:52:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657601560; cv=none;
        d=google.com; s=arc-20160816;
        b=IjQAk+nIsg5rl3sG+7jIqqv//7W7R+P8ziCL7+FtAC+knIHwhSqf22nu0tD+x5pE2r
         35vuAnmRy/sY8FA9FJ5WnaVeV7MCUqGlvBZUPn1BnylLBysy989B+J1Shp8nbB/oOAH4
         GJxnrdsRJ5G9tcZ42w8dZzTTI4l3M+fP9HJrieCj2AvcbTAIZjIPlZUSd4I+9Vm+nQBa
         NyYZY0wMTT4R07/o0sKqxMlda/zfveYBUgxXcTV4o2Mf33VFyQm4B5G17P8eADUsN1ra
         bpeuhdbfVnHLDW4afG1KtaYf/ldu+ntrOCuEbvDxgpcPhO4Ym52xt+QkM/j0Et4bZDFs
         MDYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=vtUHf4u1UHMjILb7P+zr79jU//IlIqKKH/MA/LVyU+A=;
        b=PT7R0FVXwfjU/OtAcIn3L5yUTWm7AUSYewmx3zRNlRjd6bXKUR37yDCuSe0WROcMB0
         VPvEgjKXivyJJ7O/NJNxQbOleNGFzFIVj+KdWFm/Dk7ehW5keBTvuFG8rYUVLjOWyKN1
         W/bP+29cd0uqOBTd+273/Y3b34HFth5NzaVk29Nb+ml/HuUU1Knok5V7qKMNmivL+YQu
         XXmQ4cFh2Sx1+zwqk8xfiRAeVx2/CfmjxPK2v77tJOA35gqDeNEcMBTgJwee3SWQxSFB
         5kEKZdNKAN5Ag6BDw8YpWsWiBL4hi99t6ZQ7wMOauq9nwLMr+FlfpvWfAs7ar3l9SOR2
         fYcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sOO8Dov+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fd12-20020a05622a4d0c00b0031eb55b7ab8si2589140qtb.366.2022.07.11.21.52.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jul 2022 21:52:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sOO8Dov+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oB7t1-0004Yd-Mu
	for alex.bennee@linaro.org; Tue, 12 Jul 2022 00:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB7sH-0004Xf-Vd
 for qemu-arm@nongnu.org; Tue, 12 Jul 2022 00:51:56 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:39441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB7sF-00069C-HG
 for qemu-arm@nongnu.org; Tue, 12 Jul 2022 00:51:53 -0400
Received: by mail-pg1-x534.google.com with SMTP id q82so6567161pgq.6
 for <qemu-arm@nongnu.org>; Mon, 11 Jul 2022 21:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=vtUHf4u1UHMjILb7P+zr79jU//IlIqKKH/MA/LVyU+A=;
 b=sOO8Dov+2LK02vkPH5m5N3konRKdZN2WIvYiEecv1qIbvmP4RY84QRZFD8KaJm7rsF
 KxNIQs+MbDlHU+ngMZXl66Yee+ThF+Jfkob8Mgv5kCgQtU96lD86J9jxXPwPvOReRasK
 Jrih93PtSsRLk5QZiGZkVW5uTZws0M4KZKJdyhY6RhyLSzzLjM2O3Ty3iPvzD68s0LnH
 r+eF1cPM2O32udlPKbSPZGWqjXaLUEISz/XK6O8BxXh9VuasUECba0ilp0QcayKztqcm
 MAMA7u5cfKDfP+Pv4D0DQ4zog/uxOYy4xUhEmorGwoN8DrnISUxFzCEf5dh0ebNl0ZY4
 ilhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vtUHf4u1UHMjILb7P+zr79jU//IlIqKKH/MA/LVyU+A=;
 b=kk/U/aKg+M2bUb4SqCWhgcuyDTwSxby2susJOmryFcaIISJCOXHZih+mSV5MHWbmmi
 aVI0tNeXHshG/DJZ9VKqd0JxDJtkWFEu3CXWSHt/fS5Af/VLhc8rO2J5jJKnabjcKGBs
 uHCo/4874VwpG/c7li5DKJX9n9NcBV2FUUhrVlUs6sibcCVg8v5QEWEOWmyL2Aqry+Aq
 rOvu3pFggJfKd13zvefqLuI4l1OhymjAauk7A4h01wItamui1xSVPRP4eix8g6CAq0lv
 ehSegyzk6rTF+qXeFrkyEO6iVbjhaOuNGOdnnD4YMgqqoYOttCD9TIg51fiqOYjWF+Dq
 vfyA==
X-Gm-Message-State: AJIora8domDRwMrYHQM32YMn32Bm8bUNDscNvuiuW8RI+X4SUpxffG9D
 iTW4T76k6h7M0JI1cr2+T3L/MWYc0xD0bazc
X-Received: by 2002:a63:82c6:0:b0:416:1717:4add with SMTP id
 w189-20020a6382c6000000b0041617174addmr4946010pgd.472.1657601508432; 
 Mon, 11 Jul 2022 21:51:48 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a17090341c700b0016befcc142csm5651018ple.293.2022.07.11.21.51.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 21:51:48 -0700 (PDT)
Message-ID: <bcb30961-ab68-3782-e763-cd1c4b9601d4@linaro.org>
Date: Tue, 12 Jul 2022 10:21:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] [PATCH] linux-user/aarch64: Reset target data on
 MADV_DONTNEED
Content-Language: en-US
To: Vitaly Buka <vitalybuka@google.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20220711220028.2467290-1-vitalybuka@google.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220711220028.2467290-1-vitalybuka@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v5Zdwx1QxYMH

On 7/12/22 03:30, Vitaly Buka wrote:
> aarch64 stores MTE tags in target_date, and they should be reset by
> MADV_DONTNEED.
> 
> Signed-off-by: Vitaly Buka <vitalybuka@google.com>
> ---
>   accel/tcg/translate-all.c | 24 ++++++++++++++++++++++++
>   include/exec/cpu-all.h    |  1 +
>   linux-user/mmap.c         |  2 ++
>   3 files changed, 27 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index ef62a199c7..d6f2f1a40a 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -2314,6 +2314,30 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
>       }
>   }
>   
> +void page_reset_target_data(target_ulong start, target_ulong end)
> +{
> +    target_ulong addr, len;
> +
> +    /* This function should never be called with addresses outside the
> +       guest address space.  If this assert fires, it probably indicates
> +       a missing call to h2g_valid.  */
> +    assert(end - 1 <= GUEST_ADDR_MAX);
> +    assert(start < end);
> +    assert_memory_lock();
> +
> +    start = start & TARGET_PAGE_MASK;
> +    end = TARGET_PAGE_ALIGN(end);
> +
> +    for (addr = start, len = end - start;
> +         len != 0;
> +         len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
> +        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, 1);
> +
> +        g_free(p->target_data);
> +        p->target_data = NULL;
> +    }
> +}
> +
>   void *page_get_target_data(target_ulong address)
>   {
>       PageDesc *p = page_find(address >> TARGET_PAGE_BITS);
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index f5bda2c3ca..491629b9ba 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -271,6 +271,7 @@ int walk_memory_regions(void *, walk_memory_regions_fn);
>   
>   int page_get_flags(target_ulong address);
>   void page_set_flags(target_ulong start, target_ulong end, int flags);
> +void page_reset_target_data(target_ulong start, target_ulong end);
>   int page_check_range(target_ulong start, target_ulong len, int flags);
>   
>   /**
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 4e7a6be6ee..c535dfdc7c 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -894,6 +894,8 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
>       if ((advice & MADV_DONTNEED) &&
>           can_passthrough_madv_dontneed(start, end)) {
>           ret = get_errno(madvise(g2h_untagged(start), len, MADV_DONTNEED));
> +        if (ret == 0)
> +            page_reset_target_data(start, start + len);
>       }
>       mmap_unlock();
>   

