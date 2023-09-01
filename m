Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp431556ejc;
        Fri, 1 Sep 2023 00:08:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnIb3k2UCcj88+Q5VQQ4EmO4Y4jpyovBiLwz5iaFgBPpQrIaEut53YeSBrhSHq7tG1hsqj
X-Received: by 2002:a05:620a:2209:b0:767:2471:c880 with SMTP id m9-20020a05620a220900b007672471c880mr1587225qkh.28.1693552121095;
        Fri, 01 Sep 2023 00:08:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693552121; cv=none;
        d=google.com; s=arc-20160816;
        b=u4sKosHwPLlKPtm+ck5+NwKdEXzsEffSBd2S50MPIluAIWbs6nY1oCPFpGfRK5qOUE
         W6hsmhF6nrVG6RhcJLE+BjCHMHL8m3zh4UxFUFyE3xW2SkpYpXJ2yftuHVkcLCWT6x4L
         EOhOCxPB9txToSq0uYp2sttr8atf6ImBLXLu5DBINUyM/y96BAUce3NQCOa1ARsbk2dn
         8Thv6k9Cul3DMVSZon5539fuRmFsG7jjm7UP8yKVKW97lqx8yRJ9SXed+5ovHnXy7dMM
         O0x2q4qOtlEPkSMCkEI2sCX1yrbVXcUQAE0g4KYYzkx8aUVN4cjBAaOVMJEdXsenIzfn
         FceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=hjVFuD3M65O9GtaZm0cwS2YYuBXB7QsN25zXjL/mYAA=;
        fh=NIdnYyRuTcyURSuXQOfXbmQgQFwPMecBKEpacxtAFDI=;
        b=OxnKXEaZWXhKMtxb/QV2VjdheWqYvI0e8LbKvvdiSro8oVne1zC0IKZj6xMI6yv5tp
         1DnmnDlKsVLL13u/AsUZsO5SXSJRj8ochUJHWt9n0WIV6ld5DNKSv5ydOngaLmmZ68PT
         kYP3nmi3WR5DAD5+0pO+nFD2aLXnYOdYRnydubxggdMpMIXl2CD5Y6KBsL4LyYCtz875
         CblmW8LzS3uQDvtqiLrXWoUGWy7fBm4STfALQNSFkYB2iezup7dBPEDRUIdnQGu8bkQR
         iNol3Y+CAewN5HZpPxsB/UOXl/mYlyVNwl+z/Km6bY4KxZtgfiuQWwA0REA2qmYgY4yD
         cj+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=kRlk3jMe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7-20020a05620a244700b0077056ec5cbesi218857qkn.678.2023.09.01.00.08.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 00:08:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=kRlk3jMe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qbyFr-0006LF-MZ; Fri, 01 Sep 2023 03:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qbyFc-0006GR-9f
 for qemu-devel@nongnu.org; Fri, 01 Sep 2023 03:07:37 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qbyFW-0003JT-FQ
 for qemu-devel@nongnu.org; Fri, 01 Sep 2023 03:07:28 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-269304c135aso1245613a91.3
 for <qemu-devel@nongnu.org>; Fri, 01 Sep 2023 00:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1693552040; x=1694156840;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hjVFuD3M65O9GtaZm0cwS2YYuBXB7QsN25zXjL/mYAA=;
 b=kRlk3jMePI1XHZrTZzhe6dDFH3HPXnWvf1oyt4iN2xX5sKsiMq4Xx+ADwiF4khs8y7
 m3XCoFhV3tBSF/Oy9xf6tQnwea6/7JaljLkEaQkNo4nK6E0/VOKvbBYQAkykIdWntVM0
 tFAi4s8sb/bWjj4vr1gdoxF/aKU215pquOZYisRavBf7ze/qaAubtOtFZg1Vfo2+zUO6
 o8Dcmf0UQ+bRHJNmfAAjtXtY/VF3N/p3Nfm9F/Uu9S/Vy0vKGIflwkFfgjiXn3D8RALn
 kHebw6zKEV34/0/TNkQEoaKI1agOR6MOPSLAlcb7cTsouWLRbh7IQhfZ9vlI5RIkhi1/
 JGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693552040; x=1694156840;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hjVFuD3M65O9GtaZm0cwS2YYuBXB7QsN25zXjL/mYAA=;
 b=jiWN87PY8wg90QSJ+VdVitoCY8LIOwGoZZ//D4JJSKuMtoknLXnyv8SgsxcZ6mN7k/
 Cco8CLkWi9aLw2dgJ2GVvAASF0XoRH9REQZhlV09A8mhVP9l++apWOHWPneYnQHYd7r9
 eXD17xKs3HJuXOnlDxHIaTW/gcJZHR+BrNXj07F0UbJDl8F+e6R93wM3U1AQrXKj/nRL
 0ZJHCVwmgET4MtNObqTTrU6OErSHLyP78ERgAwSSJlsHKa42lm6JHTNY/6nSuhvbLOPh
 M+W7SFzx2/fvbvObSqmyDXqpvSCtbzsig5lmdcLgVb+AxlL7iF3Bqc+fVMkrwm7P2Kf9
 1YsQ==
X-Gm-Message-State: AOJu0Yw66PdTNlUHghkrpL0K+ipl21PQ809fE1zYhqPyZJCueu+TPVP2
 GhsCP2IOmGR+LMO2Ugdl7/jtyA==
X-Received: by 2002:a17:90a:c688:b0:268:1068:4464 with SMTP id
 n8-20020a17090ac68800b0026810684464mr1462501pjt.30.1693552039823; 
 Fri, 01 Sep 2023 00:07:19 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a170903245000b001b896686c78sm2288662pls.66.2023.09.01.00.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Sep 2023 00:07:19 -0700 (PDT)
Message-ID: <17caf9c8-94af-4bbc-9b48-142606b319dc@daynix.com>
Date: Fri, 1 Sep 2023 16:07:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] net/eth: Clean up local variable shadowing
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>
References: <20230831225607.30829-1-philmd@linaro.org>
 <20230831225607.30829-11-philmd@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230831225607.30829-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ztH26c18HQib

On 2023/09/01 7:56, Philippe Mathieu-Daudé wrote:
> Fix:
> 
>    net/eth.c:435:20: error: declaration shadows a local variable [-Werror,-Wshadow]
>              size_t input_size = iov_size(pkt, pkt_frags);
>                     ^
>    net/eth.c:413:16: note: previous declaration is here
>          size_t input_size = iov_size(pkt, pkt_frags);
>                 ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   net/eth.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/eth.c b/net/eth.c
> index 649e66bb1f..cf030eed7b 100644
> --- a/net/eth.c
> +++ b/net/eth.c
> @@ -432,7 +432,7 @@ _eth_get_rss_ex_src_addr(const struct iovec *pkt, int pkt_frags,
>           }
>   
>           if (opthdr.type == IP6_OPT_HOME) {
> -            size_t input_size = iov_size(pkt, pkt_frags);
> +            input_size = iov_size(pkt, pkt_frags);

You can just remove this statement.

>   
>               if (input_size < opt_offset + sizeof(opthdr)) {
>                   return false;
