Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp897628lfq;
        Wed, 13 Jan 2021 16:29:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJRMAWxxXFN5dKPzOduT0zHjwNrggP2TwJFzZZ5eGaYBpkdM4RwEOu9CrJhTTwfJstWFup
X-Received: by 2002:a25:5a04:: with SMTP id o4mr6746803ybb.269.1610584161421;
        Wed, 13 Jan 2021 16:29:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610584161; cv=none;
        d=google.com; s=arc-20160816;
        b=L74fcbCeU8qyNA9s+B7Q+avc01e98OQiHMLGFaP86/iZp2O6NuNYsl3qBQ1FvuGnwJ
         dwPugMY8lucV8jsQRyr30TB49NuMpCY1DGPJGUQIJmaygdQsCNvLrJ2p5KS1e8d7htv+
         xrtx5RAaOFxBhSzH2d+1wi8BFskpPG7/VP9XaeEhqO7KvJkbiOk9ccYnc7onhXv/Y7q7
         NX7uFK4/Thm/VaGgSskCQ4T/49H7Tgb4ayFAJnBDU/SzXkKTY2xXeShyZWPiHVRLRoMk
         z+Z5/ggVu0ublWyQMJo12vOkARKaNj0DiVXiLY6O1C+4nyeH8bz/Abbzu8U5h7yNtljB
         LLrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=5nMYmMTdVYgu7E6Wqq3JcuqKHISmWZCZhp0OGnyFcyo=;
        b=DlntcA8lJxlmd4nscfSJXUAyFO4khvEEFZgnmUV9IrUhPKutiegsGWuOj0ReTpTWA4
         2rzUcRHRb+CRyljrafQdx3TWBDfdankOjghYPUzqpQ/cG9eZoJsb05RMWTAM17BqW2P+
         g3tmNvDSNaaQ4ypnLubw/2kZb1OZx8RqOsoDCD2ffMdCCDKyotAIEAjop0lUn1z9PKtO
         I57rVl+FQHtUv1j7nCXx2QvzdmFcqwEdHSQIlOgA9xaZ8Dn0YYfcKG0dLfF50PFMmNxI
         pJ+MCqg32dhjeRGW7dEp6V4RW2oHvmjk9QE1JPDJSv4RXZE4uwNDXDrqpoL6PyVUucJm
         T37w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HxR3kavm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d204si3089519ybh.382.2021.01.13.16.29.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jan 2021 16:29:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HxR3kavm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzqVs-0005Rf-Aq
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 19:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzqVa-0005RN-26
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 19:29:02 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzqVY-0000KS-4A
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 19:29:01 -0500
Received: by mail-pl1-x635.google.com with SMTP id y8so2018289plp.8
 for <qemu-arm@nongnu.org>; Wed, 13 Jan 2021 16:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5nMYmMTdVYgu7E6Wqq3JcuqKHISmWZCZhp0OGnyFcyo=;
 b=HxR3kavm8p+Gx1nK94zFXnLNNG3rFoepgBl5PFPNVP0mu9+bUPJyMp6IZDytB8CVq4
 Kbh+n9PEN35PW8bDBUgj6/zSGsZ7BZqbNzWzzW7m77F7bH53exJC4vgjBOAB2UszAfZs
 4UTsodqy/exJZ3184PZ27sOxAoIJWONSAv5D8wJ6xiDXhei9xdErSexJtYKU49HFxaXh
 ygp7462j1+WPQXehY9tHL4O1c2xcsj3ya5sEgrHWaQ2TP0GQ/psWSNAZhFY6oOxABT6n
 U9W4yei/2zTEgfbtAv/jd49JEdi2yWxkeNV14y+ajq/8MpGJd2izDDV8GLIOFNFLXsdN
 u64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5nMYmMTdVYgu7E6Wqq3JcuqKHISmWZCZhp0OGnyFcyo=;
 b=H6JV8aRKoxhqPxiJnKqUNCqRJrlsuf4+67RaKqyXMhnbqw3RUyoez2ZwCshYLEEI6u
 TOkG2O7bLtQq8Roi17qI3EQYoum2wY6hLeCR81euFcUJdBlJbKXOXpNuvxll6hPmjYjA
 EkrYcyH/KAGKT9zEzMTPTmvZ4evyOfkYNe3ZC6RlQ1PC4LdHnPWfykozZbQJkmaQfM29
 kQirSahkWSdHB4d7p1iPJ6QW81ANp/OzI2OwY1kaw8MmMCvm7K79lhkkwhcsHXd19i9m
 cs4JhRQjHO5YxMOS5h6FD8eOhVXjIuF7ycUla3jodYAVkG6k/Cu6BtWZJTMtwcSgtH3s
 RmGw==
X-Gm-Message-State: AOAM5321hUy0RdpLth9DiHw3IVzw0gSIQ+22Nan7tXDtCnxMJlxIOzEB
 5EbFj9PyOOhdOpxH6d+C2WAghg==
X-Received: by 2002:a17:90b:23d6:: with SMTP id
 md22mr1986058pjb.206.1610584137786; 
 Wed, 13 Jan 2021 16:28:57 -0800 (PST)
Received: from [10.25.18.3] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id 8sm3427718pfz.93.2021.01.13.16.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 16:28:57 -0800 (PST)
Subject: Re: [PATCH v2 3/6] tcg/ppc: Hoist common argument loads in
 tcg_out_op()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210113172459.2481060-1-f4bug@amsat.org>
 <20210113172459.2481060-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc9f392a-5b4d-899e-f34f-392a3c2b3379@linaro.org>
Date: Wed, 13 Jan 2021 14:28:52 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210113172459.2481060-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 qemu-riscv@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jcAzWlHIZqfy

On 1/13/21 7:24 AM, Philippe Mathieu-Daudé wrote:
>      case INDEX_op_ld8s_i32:
>      case INDEX_op_ld8s_i64:
> -        tcg_out_mem_long(s, LBZ, LBZX, args[0], args[1], args[2]);
> +        tcg_out_mem_long(s, LBZ, LBZX, a0, a1, a2);
>          tcg_out32(s, EXTSB | RS(args[0]) | RA(args[0]));

Missed replacements.

> -        a0 = args[0], a1 = args[1], a2 = args[2];
>          if (const_args[2]) {

Missed replacement.

>          do_addi_32:
>              tcg_out_mem_long(s, ADDI, ADD, a0, a1, (int32_t)a2);
> @@ -2475,7 +2481,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
>          }
>          break;
>      case INDEX_op_sub_i32:
> -        a0 = args[0], a1 = args[1], a2 = args[2];
>          if (const_args[1]) {
>              if (const_args[2]) {

And again.

Let's just drop the hoisting parts and only do the signature parts for now.
I'd rather think of a way to split up this large function than waste time
optimizing it.


r~
