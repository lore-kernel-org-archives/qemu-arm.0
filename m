Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2904637lfa;
        Sun, 6 Jun 2021 11:47:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwK5lMDyJHFdYv9uRfRecXrPEc0zqsKz0sljM0ap1eCzaVVDF5afsWgclFihbanU+Mxx3RN
X-Received: by 2002:a25:b34c:: with SMTP id k12mr18172788ybg.6.1623005252116;
        Sun, 06 Jun 2021 11:47:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623005252; cv=none;
        d=google.com; s=arc-20160816;
        b=fABrUIRnDAtBKceEfcHxOz5gg/OLdPpB3I8LG5LLaUYKK/UExvJT5Ls854MgyEEhhq
         m7AUGIhYc0HAEmH2Qt9oa5EFAps8+1FEEXVjHUuiyklFF0B+piEMP9/m6vQB4ipByl0F
         VBuHRx9Gg87H+rFymFynsiRI4hFZfDg6mZdNo1bnKekfJWwDdF1mywFtzsHSV6FwcnAY
         ifTDAfzedC0NW2xCFEJjlKUEYzZdWbZVjLrghq8xFr+BICCpA0nEPnrRwG2pkzSbE4hb
         3c+JhinQF8w7J/AlJVV4hv1DKw/n5dIx6yjkCG24HsSUbP/fDigpq4a5xn/q5AB0yKo2
         hq6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jU2+5eoGGzDM3UL6JWyyWl0RPadzYcsQmTtSNIYMRaQ=;
        b=s8q4lx4M6uaKq7XCz+mjYngBH82xFxSk04Kg//5QfJCbtrQgCRmjxgo3UqZwbebgXg
         r8YeghHEffFbc+TCN3OsBMIN8FQPu5ijUUNUQgFoWHJE2mnO1bawA1egRqRT6JLDESmN
         qLK+E4SudZyOIWBD7qgu9gi2/pHTeLNOSMibXx1jaSP82J+YMvhhzLMaC7Zqnn33txL9
         0KQUkaEt9kVgM3wzcbYwT7LN4j5KyFVygtyl3K5/81wVTfL38MZnxORnTVsoYx+T2XOk
         3pWRXCRKKMxx17jx7+wITf2xRm2BG67fNGdvHPjaqHdJNWRlkgz+QDC9XRujpunfZr1b
         K8Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VDIOO9G6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14si11566138ybq.409.2021.06.06.11.47.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Jun 2021 11:47:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VDIOO9G6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:34434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lpxo3-0006pT-Ah
	for alex.bennee@linaro.org; Sun, 06 Jun 2021 14:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lpxnj-0006jL-3M; Sun, 06 Jun 2021 14:47:11 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lpxnh-0004V2-Ob; Sun, 06 Jun 2021 14:47:10 -0400
Received: by mail-wr1-x429.google.com with SMTP id c5so14854313wrq.9;
 Sun, 06 Jun 2021 11:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jU2+5eoGGzDM3UL6JWyyWl0RPadzYcsQmTtSNIYMRaQ=;
 b=VDIOO9G6eOy/JOguL8J+EyPI2wH9FtNWe0Vdgn1EEUFry1R4yzdjRwfKqz4a6UNCbO
 mRRC0GYrRE2hwxdth+NEvHWq5mw8bMubLUv8cxIHsd+A9W5bavFyLE3wxLDTyGgIQBDI
 PnsbJZD5r+69lGArexDmQ8W2Ybw2laerowz6HR4lLMgDP8TOSCqcbGD+BiulcvRgc+qf
 V16bObgKx0Z4qJ56jAQmUTNK5T7FDpp24tSUg+GfSiLLRf+34EIueJtanViITV9NIc5/
 Y27FppmB4M4tEw3uZowW0XMmONnWRZsCSitjW1VJU6UDVpBeCoxE9PX2nSRJFxIdg/qe
 qAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jU2+5eoGGzDM3UL6JWyyWl0RPadzYcsQmTtSNIYMRaQ=;
 b=VlF56Yytj8G1P0L7QTUcyBRjDsLWrbnlsRHPYQqF7wD1Yaff+fu8SId7SEprGgHm3e
 CspQ8C358udsEGZu9pxq9dKX7iy+XQAB577Szh2hZcfLRAYsxPBctKkowD+/oIEjeufV
 3mkBsWSVDYjjwkBVrLcgLYyeTb8rG6ZYJrcOuKOqG4fm4aCyMvafovo761W+khgSRsED
 AyatcsjlRejCseD77eb4XtanbAVPpHKZbvCHCbxMleUATR2IiKPq1gsiFk3GWbFNDqQj
 G76M/AsNZIL05ayuMG+Ec3K+Ea+FCHWBNSEGILAbOG2iJVhGHBuqOx+BY76tHVwEGIHf
 kjCg==
X-Gm-Message-State: AOAM532Eu0b/dDf+ic0arHh/bQWFBnAayOw+YK4X8DYpgiEA4J/AopUm
 7jmoaOJVPbRTKwSdSR2g6DJAz4hxW7NyRQ==
X-Received: by 2002:adf:fd4f:: with SMTP id h15mr13683618wrs.245.1623005227759; 
 Sun, 06 Jun 2021 11:47:07 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id d3sm12960595wrs.41.2021.06.06.11.47.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jun 2021 11:47:07 -0700 (PDT)
Subject: Re: [PATCH 3/3] target/arm: Diagnose UNALLOCATED in
 disas_simd_three_reg_same_fp16
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210604183506.916654-1-richard.henderson@linaro.org>
 <20210604183506.916654-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b0f0b290-f530-df91-3878-89e6cbaf1d5d@amsat.org>
Date: Sun, 6 Jun 2021 20:47:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604183506.916654-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gX6CDSlYrXST

On 6/4/21 8:35 PM, Richard Henderson wrote:
> This fprintf+assert has been in place since the beginning.
> It is after to the fp_access_check, so we need to move the
> check up.  Fold that in to the pairwise filter.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 82 +++++++++++++++++++++++---------------
>  1 file changed, 50 insertions(+), 32 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
