Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp139221lfm;
        Thu, 30 Apr 2020 19:30:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypKegGk+mGOZ+ZUUciUYHdizMbiwn+7qkrdY9Q6X6GBhlyNXficGTNp74E7ccGBUNZPQjWjE
X-Received: by 2002:a37:e10c:: with SMTP id c12mr1495211qkm.483.1588300200383;
        Thu, 30 Apr 2020 19:30:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588300200; cv=none;
        d=google.com; s=arc-20160816;
        b=DqYppYe5/PsIUwfHRZf0gtmzhuziAHkl1f9cFGsmcSdX2tuy4mNkTAiTuzwlqEkVcx
         y39NxAYVYub9OkuYgaEkb0KQXTcp5gRyrOiChLVNRWiYnTY1YjOKMZ414vBI3AMlM/Gd
         2+tFwrCiFrcfmPvuzaYiz5uYYNRxjsezPCdkmJmkZkGe3tE9x757oSgPc7lCe99uHmb1
         fEqMCZTGiR4DlF8JijtmDXQ/neP5I++7pB6t3CQmEt+l6nKJu+uSYaSaQM7fWETx4nOz
         fZ7IaKSlam+E5WRsC90RVYsSyIJZYQeuRkSqx7HaWSZ5ocj6eyg/ETHdSilzK1qiBDGW
         b7MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=f4reCtjNzjsXTu75I8NY9VQ9DL2EU8/6lJqM14J8sS8=;
        b=wnF8Y7jQ1DqRmXrlo902eMxFGXopVP5qg3w05liOSBdQV2TkZstlo0bENkhwmpIpKP
         T8jcT0wcbwZTWRVLg7GTKB3spaFP9uw2IEMhrvuu+rODOe4GE5FHMMrGEnaWTpWHn2pm
         UqwS37ysdxR9ziQ63esRcWiktOPEb44BMO4dXPUFrRu9SD68wvFMNcHxkIBnjQNG6Fy6
         NjLrQ4FE6I98Yrgi9Sy0fWwDmt1QlXGeLF+EQjuMvy2RVkw3/kxVKeTI2dVNHhzexeJN
         jdvUssOj9RVmWI3yGiqEvBlJ0uWdj6GjZWO51FwPETIq+gQMIMfbgfzwdd4i9N8AeefV
         K2jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kd19CRyW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id j88si992864qtd.224.2020.04.30.19.30.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 19:30:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kd19CRyW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jULR9-0005UR-RQ
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 22:29:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35918)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jULR0-0005UC-9j
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 22:29:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jULQz-0006N6-44
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 22:29:49 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:35101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jULQy-0006Dd-KX
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 22:29:48 -0400
Received: by mail-pj1-x1041.google.com with SMTP id ms17so1853756pjb.0
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 19:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=f4reCtjNzjsXTu75I8NY9VQ9DL2EU8/6lJqM14J8sS8=;
 b=Kd19CRyWXihC/EwF9Kqz4bjaCvR8esjyJhCrjBBPdxyr2MXWKpyO3woYa5WFSJjb6U
 zpe8u4oX7WD32xxqI49OKC90VVqpgu3Gs6ytfn5Ml/l3/uIoAKBmLI2tbGD2jTfSMr1P
 RnqeE64z39Slj7FtwoMl2BBd6+FzEKk2Qv5cdN+GvIVgs/Y0CwLM+eMEiu0A8pe1Q+Rq
 w91AOJ9SdPcdBRNapYHLylW1s8i7bgyj4LA6HFfH3d6NHdMTlf5/+WjG4pFk1F2ANPvQ
 u+G2dXfWqwDhQ++g8y6p5CkVN12oC3kmAS1wsRFgoAYnYDR+B5mAOtoWgDN/0LSTm6OU
 ed8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f4reCtjNzjsXTu75I8NY9VQ9DL2EU8/6lJqM14J8sS8=;
 b=lqtC5p0ShV+vtGWK2/ptqGY1P4xqW0uYxEJwGLux/RyjvN/nqNfeatPI8TcOXJ9SzA
 qEVvFww7KDe9nbim+zctsuaqOz87lkYPgcJ6ju4M7k4pwfjpKfIVWhgUgfrQ9eJ1qqjw
 m9hqHSp6XbFEbU5RFt0v4v5PJgQDWhStavTAhCSo3gb+uPeZV7CNnyKkj54Gv6o3/sEJ
 1UPSSgwdcuFMP6Ttprw2p6gLOo/aoLjv4kuL+cYFfDiAV9/V4CGCypIfnJcB/lQ7fEGl
 xdLBrqw267Y3+TDrz4G0ez2DWRy8JdNAUedvdN5O+LQeheyDsbmL98wbCHFo3vt1Ijq/
 FH1g==
X-Gm-Message-State: AGi0PuZhdYx/zOBuQYTVKrCXUntdwLUoVS6SeS9PhkkQIdZCZdgFtSHs
 GDmFcUh7m+dh4O7mUrgAFWU66g==
X-Received: by 2002:a17:90a:8a09:: with SMTP id
 w9mr2091719pjn.95.1588300186727; 
 Thu, 30 Apr 2020 19:29:46 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id u5sm831482pgi.70.2020.04.30.19.29.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 19:29:46 -0700 (PDT)
Subject: Re: [PATCH 27/36] target/arm: Convert Neon VABA 3-reg-same to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-28-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a60a2de1-b46a-a13b-8a60-4006c9d70ff5@linaro.org>
Date: Thu, 30 Apr 2020 19:29:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-28-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::1041
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bnGCfe+41Ixa

On 4/30/20 11:09 AM, Peter Maydell wrote:
> +    for (pass = 0; pass < (a->q ? 4 : 2); pass++) {
> +        tmp = neon_load_reg(a->vn, pass);
> +        tmp2 = neon_load_reg(a->vm, pass);
> +        abd_fn(tmp, tmp, tmp2);
> +        tcg_temp_free_i32(tmp2);
> +        tmp2 = neon_load_reg(a->vd, pass);
> +        add_fn(tmp, tmp, tmp2);
> +        tcg_temp_free_i32(tmp2);
> +        neon_store_reg(a->vd, pass, tmp);
> +    }
> +    return true;
> +}
> +
> +static bool trans_VABA_S_3s(DisasContext *s, arg_3same *a)
> +{
> +    static NeonGenTwoOpFn * const abd_fns[] = {
> +        gen_helper_neon_abd_s8,
> +        gen_helper_neon_abd_s16,
> +        gen_helper_neon_abd_s32,
> +    };
> +    static NeonGenTwoOpFn * const add_fns[] = {
> +        gen_helper_neon_add_u8,
> +        gen_helper_neon_add_u16,
> +        tcg_gen_add_i32,
> +    };

This can be packaged into one operation.  E.g.

static void gen_aba_s8(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m)
{
    TCGv_i32 t = tcg_temp_new_i32();

    gen_helper_neon_abd_s8(t, n, m);
    gen_helper_neon_add_u8(d, d, t);
    tcg_temp_free_i32(t);gen_aba_s8
}

static const GVecGen3 op = {
    .fni4 = gen_aba_s8,
    .load_dest = true
};

etc.

FWIW, this is one that I've fully converted on my sve2 branch.  aba(n,m,a) =
max(n,m) - min(n,m) + a -- four fully vectorized operations.  So anything that
allows a drop-in replacement would be nice.  But whatever is easiest for you.


r~
