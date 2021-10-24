Received: by 2002:ac2:5bdb:0:0:0:0:0 with SMTP id u27csp521827lfn;
        Sun, 24 Oct 2021 14:28:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDANdeenWUkYhoQD/TK9h03siWpTl7PgLlBF/yyh9mO8VQP2zzGPwt1VdKAigLLQZ3BjOS
X-Received: by 2002:a05:6830:1c2f:: with SMTP id f15mr10897647ote.63.1635110920052;
        Sun, 24 Oct 2021 14:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635110920; cv=none;
        d=google.com; s=arc-20160816;
        b=y81f3HWfo6/LatGSdrGG1eJYGogoSldSdb5u59eu2ektILrM6Ub30AfQU9JXxgZrzn
         9Kq60iBd9sVZM/4vZ/OQ+e0dyAXgVZZjBmkOBp7d7Qbe3nqJVS7lFQ/3e/QjVoEKMt5D
         RKMjuOwycNXriMay5EvZbYWBf1r7YnOJ4O7fogB9yE5cflF4QHvH9fcE8Mt8qPMFwiSK
         BEkHWx/RhyFLxdQFtUToL5XDgO43JJispXTFez1nW6449sQ8mfk+fB8Z5k9MYmk5pLKM
         c7aVq88x7zgcdVF0UrKKSAYwvvN8fzvt7JC2RrFIPI23ugA/tY+SPoF7c6hvV0L9J2xf
         TNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=gEWWtpacZ4yjLeph+JVikg9SqbSH0QFN3bljD72SogQ=;
        b=TwioemcCvjyp+dvl0dzDRKldCDbC+tTXWrFZU7xfYmD0m4GJuN7k9xR296IJgT2Ezl
         Sg/qsLJwbx5MFRGh+eXRuXvsuRYSfop/aZYbuwFRPrHfYfCI/g5zaBZWwqbhY1UEbh68
         UYNsl1ZjSml1UWcR3lZdNoOoDtARdr9+UUnMHUHTezU2orCe/WKNqr4BQffuqV1sTlDV
         58xpx/OT+SPe3GHkF2Je9iezwQY3VH+msouiXKN0hjv0ZHmtqedjmO2X+nAkWlXeH5Lr
         f9kUVg1jJYne1PBEO7kip04SlzEbLqTsebcZncFuyeu9qY+kwaPrYYMWQsTiH5Mthh9n
         BSxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iRG9Rllh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6si14898990otb.156.2021.10.24.14.28.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Oct 2021 14:28:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iRG9Rllh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mel2l-0005K3-32
	for alex.bennee@linaro.org; Sun, 24 Oct 2021 17:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mel26-0005IU-LC
 for qemu-arm@nongnu.org; Sun, 24 Oct 2021 17:27:58 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:40489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mel23-0006Nz-8X
 for qemu-arm@nongnu.org; Sun, 24 Oct 2021 17:27:58 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 n36-20020a17090a5aa700b0019fa884ab85so9844496pji.5
 for <qemu-arm@nongnu.org>; Sun, 24 Oct 2021 14:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gEWWtpacZ4yjLeph+JVikg9SqbSH0QFN3bljD72SogQ=;
 b=iRG9RllhwjRn/6zWsNiW1WMQ9gW15EzS3P9nAldjEUVAUyL6fFrcfVzs0FcdTJWNAN
 dJriS8T0hspNVgComPGaeyFn7/bNgXPmJ5L08xWzfWEa/Y0t2jkn2t57SRs/6VoKp4Ht
 WTCKkkY6d6u/RI73L4MqsCYK7bgC7jxlUiFKAqTh1FAK/rswLMgIkkZLLhod875VfvQz
 jiKK0/4c2Q0/r8juaFQvIhWVtlRBRNUMnNshdJZY9agpkboc737nIuo0hLBbU59hrJH7
 0/j3i0YhGa+dmSts1YbnQrQUrIYG2UNli5cFGGEOaaNByEaYYqp1FS7cZZc6MOHLDEdj
 I/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gEWWtpacZ4yjLeph+JVikg9SqbSH0QFN3bljD72SogQ=;
 b=YIXmeN0RXV5xF1/pp2SgtnE218mZcI1G/sPP/sPwnW5huqnm6AdKbXKjGln6Ie6fHy
 AHnndWENAW65C58Pz99Aya51ZprNjcMzw/lbg6w4VNGhThjLqRblcuogmd0g4crOJtp2
 NNXlO0E7rpB5AVJOI37IwxBCXa2tUce0YOX6wTa/x179hNWgo6d2sriuDsiAY29V+gK0
 zoONkqx/Nh4IQkAjXWsna+karhWUYWz8e9+0x6xnngPGEUPL44ZiSTuQej65yd5BRssw
 iBZvkZsK7FiEH4aSEX6beSibVJP+9+Ohzmdmuiv1OiTnQyt5dzzWpkm92TgLge1d31Ld
 yKvQ==
X-Gm-Message-State: AOAM532Lt0MDUE1h9l0z3LmyYgtAl6r9mJ2ZMFSihl2rfKWpCNFkQtlS
 PWJg6Eo2kFOyKdubWttNBXFQvw==
X-Received: by 2002:a17:90b:4c47:: with SMTP id
 np7mr15917655pjb.22.1635110873862; 
 Sun, 24 Oct 2021 14:27:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id h1sm9786304pfh.118.2021.10.24.14.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 14:27:53 -0700 (PDT)
Subject: Re: [PATCH 4/4] target/ppc: Use tcg_constant_i32() in gen_ld/st()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211024161619.325903-1-f4bug@amsat.org>
 <20211024161619.325903-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <47754d7c-7a1e-1465-294d-b408ff44cbf8@linaro.org>
Date: Sun, 24 Oct 2021 14:27:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211024161619.325903-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.33,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mNN0xG+PrmRW

On 10/24/21 9:16 AM, Philippe Mathieu-Daudé wrote:
> Avoid using a TCG temporary by moving the MemOp index
> to the constant pool.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/ppc/translate.c | 29 +++++++++++++----------------
>   1 file changed, 13 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
