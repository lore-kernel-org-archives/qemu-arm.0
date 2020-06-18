Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1666369lfm;
        Thu, 18 Jun 2020 06:56:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyH0xP84g3JKsdYCAZcmQVBHqX30Ubl5n0dUBAZM3hfh6bTCC7q08OeuDfcshpeTVw/ugUI
X-Received: by 2002:a25:afcd:: with SMTP id d13mr6655710ybj.413.1592488596545;
        Thu, 18 Jun 2020 06:56:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592488596; cv=none;
        d=google.com; s=arc-20160816;
        b=ZTiUHjbZy1gBA/ANwoXasonT5bj/sLtcTZxBRbHzXwfjawoB3tIJeRWCMH74MQ7K+S
         LF1ymsoNrah+oQrbGijWH+dQZyhCipVNUpHJtDPfqF4Fn2LiB7vFSMZLM80e7s0X24jL
         O6bSMCk6ehfkpzOhv2eM9sBn5Dm/NHKFP6vyW9r+G24fbG0xUTXp1uihS7u3NlAfeXpb
         G0KR7EONTqu79SsMibjLiJS7EhkI0HLQOBi8Ne6+LBTUIX6V5vkmoTY2b8hNCz3298w4
         hGjI28BLn4h8UB+OqMs91fnnp1A7mAdkoDUihjCA01Kzolaqd23OvIlrSg3AUsNjFB3y
         zd8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PS7epBTj2+CdJfP7UuJnZaOccZQrbfZauCy4eKz7PJE=;
        b=LCj4++3I4Us+GigJ/1AntTW5CiTvFVbGrrfAsMFUlnelSiA+n3euP+tmaHUo1Ft1rH
         ncPJXXM57rwnBxGp9e56wdWwEKAdWrJJpDU6kFg7mvv85ftc/X/dYkvCdGZcBjHreTeB
         zkOTo2B2VUIbpt+1vWbaas3Jeq3uysaX/BOC39WHiJG2FZCH4T4+ogW8/is/DE4I6q/K
         hvgV4kKmVF2R2QshmMZgiPyN1TwINB5QSLBCfO0cxxiHMnyGplxUKbjwYJiEECMCOIrn
         YraAor2JTldemUzBaQPO91AqSALJ027cBc8i4Sx+7/O1NaQDYwpQWp7wO/HjOHq8+VLU
         WDVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=asob7t7y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v69si2566347ybe.351.2020.06.18.06.56.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 06:56:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=asob7t7y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlv1v-0001W7-TH
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 09:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlv1o-0001Ve-Vz
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 09:56:29 -0400
Received: from mail-oo1-xc42.google.com ([2607:f8b0:4864:20::c42]:43700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlv1m-0004Df-Qc
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 09:56:28 -0400
Received: by mail-oo1-xc42.google.com with SMTP id i4so1181745ooj.10
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 06:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PS7epBTj2+CdJfP7UuJnZaOccZQrbfZauCy4eKz7PJE=;
 b=asob7t7yyPbXfjp778IjHBZn4zZ6Qf1noB6YLgPtmtPsKkIH7MLbq01VZGx9+ds08n
 OhKhWgI9cGZLjQD75muRshZdzD3Hfa8SFCnEjoJfmexvZiYXKj7Bfj3l7iyTvmI5hWQW
 6WxIW8c8QggjrFUL4Lb0gp+9Nw002b+vykXoE652KsUiWHcEG8E4DOoWLuSh8iLYuYiJ
 2CyWrqR4P3GTH1HajDSaAmuZz/rn4YvI/XyvdFodVLRVtbJ78Pq+enhME2jVkCF/XlfK
 5eIprrL08Zv34leHou39c9xGH7SJ8VslmUpQxXCZyk8LKiHg1U6yfTL5p7t/6eotijFS
 Bc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PS7epBTj2+CdJfP7UuJnZaOccZQrbfZauCy4eKz7PJE=;
 b=T4EBGZ+IVW6mNoKmG5LdRVgzFH+2ttfeb3pQPjnEQms5zTb5L65/3oy8siUm75qWE7
 Tpj6pLn4nN7sN/pBfLkxFjNBhvuuETw/nPKsm8ib3tVjXQkVU+LLKd/habTiqQ6ano/d
 1p+dDaVyPg0c/xgyALR6idhKj1zGRmWhFh+bKDQgqVT2kNTooUU/ymHBV1zz+h42hJ83
 gkCTtevXis4a7oqHzaM3FvZ52vmYuxxSpFrAOVKAJS6R2bPRJPI9yt85w5tXWSIEFeUA
 YZvJ+du4TMEJvbwb43FJOFExiOoxI9iBQKrETi+dzTuFefsnL+7e/vEuUDixknKxJvD8
 HRqw==
X-Gm-Message-State: AOAM531lOpif5smINntJz6lAKP6jmXReQeOBzdCGVzMulzUlwNdIUIaU
 Uy2hnhQMNsep6ae61d0CD9kxlrKBTcEK6fPUtFFVfg==
X-Received: by 2002:a4a:a20b:: with SMTP id m11mr4114391ool.20.1592488585505; 
 Thu, 18 Jun 2020 06:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-16-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 14:56:14 +0100
Message-ID: <CAFEAcA8LEApobASw-D6PMdkR2sAjJfnu5DzBeD29hjdoHtuXJg@mail.gmail.com>
Subject: Re: [PATCH v7 15/42] target/arm: Implement LDG, STG, ST2G instructions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c42;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UWzPIfy8UMVn

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Split out allocation_tag_mem.  Handle atomicity of stores.
> v3: Add X[t] input to these insns; require pre-cleaned addresses.
> v5: Fix !32-byte aligned operation of st2g.
> v6: Fix op2 extract, stg pre/post-index, stores vs sp, commentary;
>     use pre-computed ata.
> v7: Fix STZG iteration (stephen long)
> ---

> +static void disas_ldst_tag(DisasContext *s, uint32_t insn)
> +{

> +    addr = read_cpu_reg_sp(s, rn, true);
> +    if (index >= 0) {
> +        /* pre-index or signed offset */
> +        tcg_gen_addi_i64(addr, addr, offset);
> +    }
> +
> +    if (is_load) {
> +        tcg_rt = cpu_reg(s, rt);
> +        if (s->ata) {
> +            gen_helper_ldg(tcg_rt, cpu_env, addr, tcg_rt);
> +        } else {
> +            clean_addr = clean_data_tbi(s, addr);
> +            gen_probe_access(s, clean_addr, MMU_DATA_LOAD, MO_8);
> +            gen_address_with_allocation_tag0(tcg_rt, addr);
> +        }

The pseudocode for LDG has an
   address = Align(address, TAG_GRANULE);
in it. I don't see where in this code is the equivalent; have I missed it?

thanks
-- PMM
