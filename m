Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2396045ejm;
        Sun, 23 Apr 2023 12:03:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350aBaHBseEQo0FtXnVok2qVFAmm3px7mj9avDInrhpFSHVJOIQY8SGTzLwAZLXAq4sItwFje
X-Received: by 2002:ac8:5a54:0:b0:3ef:4c4b:7e4c with SMTP id o20-20020ac85a54000000b003ef4c4b7e4cmr15975814qta.31.1682276636017;
        Sun, 23 Apr 2023 12:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682276635; cv=none;
        d=google.com; s=arc-20160816;
        b=G3iNBvQ/4GidplO1YW23daXGa909iejl+hzGhkwC32s7jrcZiKvkCEAL/4YI6Gp97T
         PfIggoNuBcH+7J9QTTbnF77iYtBS4EWVNYyMFGCM4DPjnGJNOak/TXGpmXu95TYlULVz
         KoAIrj0itcR9CBAtuSY9x7VN1IUar6H1jiKsYswK5Tje8NixIbYP0SEGbb+DRsKZXStD
         O5HtBFfGzBDcTG8WyFwMgZUEKunRfF8/vyPRhoCW7EgWuuYnw23aUZYrZkZVNvivAK3Q
         pp29qURkz/I/6XzQoDXkpXBlHoi0SsNZHVr7oonj5+jJg/yrickdbhjyom/675g+oCue
         l/jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fDqD0NOgFd+BDN54u+N4JXur4xZq9Wg0xLr3FJPuaEI=;
        b=LH9qdi7g6jtzrpvZRqmyukBcsO2MkiAdRrAfRfEU8E36FRKXacZfnW6/AZpEjVdlkR
         RtXc1raOczyXaSO5DlGBXtz6GwqSf87/ihMkEgNFYtUwO5b/s6eStX+jktNDMK84D4Bk
         P8YcWiwX8LbOZo1lPzo5dHEXy/XOwCzPWKwQnp50GY3xdleUb1ubengzjXbt/c2gQJfK
         fAqbPFuMdGH68+gRhqzf2aosByJrepulwaNDleB/lcwOH5Lqgr0kG55QO0naT4sVsb/r
         7+1fnkQMtfRRE4b1Eefk3/TSszkXNXGpiMMOWqnzphW+nkJBVEWaam/dLzIfVHsAPSrA
         AEnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mpLuPtKA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8-20020a05620a0ec800b0074a8df5e59bsi5844664qkm.670.2023.04.23.12.03.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 12:03:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mpLuPtKA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqex5-0000Au-Bv; Sun, 23 Apr 2023 15:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqeww-0008Uz-62
 for qemu-arm@nongnu.org; Sun, 23 Apr 2023 15:00:44 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqews-0004Od-HL
 for qemu-arm@nongnu.org; Sun, 23 Apr 2023 15:00:36 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2f27a9c7970so3330654f8f.2
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 12:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682276430; x=1684868430;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fDqD0NOgFd+BDN54u+N4JXur4xZq9Wg0xLr3FJPuaEI=;
 b=mpLuPtKATJuVrs3QIpcTbFHgDhtJ6/ZKfXkdojpjv/KueHEuuqh2ZBmbDc+Faw10CW
 53fKmHVqc0yY5DYtVh7QvO/5oOsG9PFgKBdNqZgogh3wK7UUxG2FaVvR0CosiMt7mLnC
 iHiPqp9PRnYM3vpMK/QyHAEMP5mCAdaSfx+dyyhJqux6ZbFRgLR3ZREFP2W99UUtDirD
 rItfMnNRQKIo4CnU8MUDmJx8xt9i66W8VE92ZoJZ54icH1vXlhVQOBY8A45dxEa7ndxM
 RqoRW/p7kIJgftNYK8xBy01Ybip1Pu3s93AFopXQ8cppYGnSAiyG7H0oQ8DRN/DSM5Ah
 WYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682276430; x=1684868430;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fDqD0NOgFd+BDN54u+N4JXur4xZq9Wg0xLr3FJPuaEI=;
 b=mHs4ojWP/ZxCb51Zx9ep54mvA/DWIjq1h19dAFPBEyB5yuo+Qxyjcgu2TWpaXpoTm2
 M7jiofAvXE6OulOexqJ65QJkN6jzUfwvBemEC4HIZjgJFydckE+dQLvTOkS39bp1dO19
 3OJDqCFwJ3YEdl5mKamUnCRmemIOtDPlC9k5MYr9IwazxLRaxXDnXg8GKhJD8iqpksGW
 diyezr26+6QZ8bGI0T6a0/mRe+mCIdF4K40WVPdlc8ZLTWiVtP7JzvuyLi2N4nWAGC1H
 tlUN05SrcZ3jtk0C1qa1PDYn9Ggq2ie2jhqv/Bwdn4qWoN8F9EKtAGSu2a7OfnTSFA7F
 U/WQ==
X-Gm-Message-State: AAQBX9dJ4lf1qV2BvjJ2UpFyKUGkS39SF1RvXHCNWruu13IGHB+3Y6ST
 7PQpPoxjOnJHYojavzO4BLa3UA==
X-Received: by 2002:adf:e952:0:b0:2cf:e74f:2957 with SMTP id
 m18-20020adfe952000000b002cfe74f2957mr8405605wrn.33.1682276430708; 
 Sun, 23 Apr 2023 12:00:30 -0700 (PDT)
Received: from [192.168.109.175] (119.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.119]) by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c450e00b003f0a6a1f969sm13733628wmo.46.2023.04.23.12.00.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 12:00:30 -0700 (PDT)
Message-ID: <f382adb0-ba0d-be74-c426-7d9a66c18b51@linaro.org>
Date: Sun, 23 Apr 2023 20:43:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 22/54] tcg/arm: Rationalize args to tcg_out_qemu_{ld,st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 43MbuWUth6jZ

On 11/4/23 03:04, Richard Henderson wrote:
> Interpret the variable argument placement in the caller.
> Mark the argument registers const, because they must be passed to
> add_qemu_ldst_label unmodified.
> 
> Pass data_type instead of is_64.  We need to set this in
> TCGLabelQemuLdst, so plumb this all the way through from tcg_out_op.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/arm/tcg-target.c.inc | 115 ++++++++++++++++++++-------------------
>   1 file changed, 58 insertions(+), 57 deletions(-)


> -static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
> +static void tcg_out_qemu_ld(TCGContext *s,
> +                            const TCGReg datalo, const TCGReg datahi,
> +                            const TCGReg addrlo, const TCGReg addrhi,
> +                            const MemOpIdx oi, TCGType data_type)
>   {
> -    TCGReg addrlo, datalo, datahi, addrhi __attribute__((unused));
> -    MemOpIdx oi;
> -    MemOp opc;
> -#ifdef CONFIG_SOFTMMU
> -    int mem_index;
> -    TCGReg addend;
> -    tcg_insn_unit *label_ptr;
> -#else
> -    unsigned a_bits;
> -#endif
> -
> -    datalo = *args++;
> -    datahi = (is64 ? *args++ : 0);
> -    addrlo = *args++;
> -    addrhi = (TARGET_LONG_BITS == 64 ? *args++ : 0);
> -    oi = *args++;
> -    opc = get_memop(oi);
> +    MemOp opc = get_memop(oi);
>   
>   #ifdef CONFIG_SOFTMMU
> -    mem_index = get_mmuidx(oi);
> -    addend = tcg_out_tlb_read(s, addrlo, addrhi, opc, mem_index, 1);
> +    TCGReg addend= tcg_out_tlb_read(s, addrlo, addrhi, opc, get_mmuidx(oi), 1);

Missing space before '=', and while here s/1/true/.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

