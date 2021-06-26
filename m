Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp2057723lfg;
        Fri, 25 Jun 2021 19:18:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3qf50ixnzfz9vbid+jLG8xJ/t7L5P0cROctMghzu6Rq5zQplXLeNW8uGMct3gU3Gs1jTd
X-Received: by 2002:a05:6214:17d2:: with SMTP id cu18mr14400749qvb.48.1624673922854;
        Fri, 25 Jun 2021 19:18:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624673922; cv=none;
        d=google.com; s=arc-20160816;
        b=rBCVROj43FVhCVUMuEyVlfLuzBIeLN1Z5ZhhpUzR6NFo7vNIq3BNr8PodUfIFCRxdu
         IoayVJyTSfq2M3n42xpcD9vR/y7EWPsOnqOdWVBroAToh/jUMUEDnlowW5R72rXV5bKC
         R5t7l6B4FdnbXgxL1K2L+lIa3O+nRWQeP7EXxSYqZmqR75PNKMP0igI/aDOBCXBOf93I
         IZ0TbBb/XsRkUjwmfAx0NU0zJMklhv+M2R0W9dQzSzKZ3l6p715OzkzDAC5zRRcEcoB7
         62I7xBoXdGPjaPeRmmTx64+fHy2G2juoB4I0zR3AlsdL7Yppr/Ebd3sgXXLU+gicsFBc
         XKkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=adTq5jNGvDtdlxJZ0jo/X2Y0G9eh94VT3vNbiTzlDqQ=;
        b=fTP6VwRnRCY/TegYYeot2CM/UWUoAXe+UcV0mF1U26ZJPaP3phjLCE29B7TTq/AHU/
         LnLxMvJ6C2aSAIqqHawBp7Fr1Fn4hyWp9OXPE/qWnGrKXR1f6lihhrtmuKcZeIkSZucl
         Xk1/n3Sa49mJGf1DtFGPMEt1fAkBNG+tD6GZ8cHyNZj0X9K1OeUKEThPEJl54ZJcyeKH
         eKqm2QIoaSAmN7/vp69ABrdrMu1TL2N5a10dk13E4LdXgmnbBDdLhnjvQSLIJ+8MoVg4
         8Wdr1iE4nW+XjN4YYLPcaLeuBUub2pq7ihXZEjxsyZ7MLsp9VIBzRTbhSS7g+mbI4cRY
         Pb7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ml2crYcF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v21si3286143qtw.349.2021.06.25.19.18.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Jun 2021 19:18:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ml2crYcF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lwxu6-0007vE-5t
	for alex.bennee@linaro.org; Fri, 25 Jun 2021 22:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lwxtx-0007uR-Bt
 for qemu-arm@nongnu.org; Fri, 25 Jun 2021 22:18:33 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:55106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lwxtu-0001yr-Rc
 for qemu-arm@nongnu.org; Fri, 25 Jun 2021 22:18:33 -0400
Received: by mail-pj1-x1032.google.com with SMTP id g24so6464606pji.4
 for <qemu-arm@nongnu.org>; Fri, 25 Jun 2021 19:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=adTq5jNGvDtdlxJZ0jo/X2Y0G9eh94VT3vNbiTzlDqQ=;
 b=ml2crYcFngrPmqZAajCUjXEnakbeAd37mweOz0RP0ooJ9Lkr9G/jE/JkU3Z7HN+Gpo
 dR6F/bwWl0AEjC/vtLa2aRTq3mqxAUeEBcq1xEhUJn9Cku+O0Jp3xwLH7C+d8ONw76Dh
 5T3cumZbG8VXOXBSb029wXL+BZkncyMdLXMiimHtwtOhhm/n5HQ1DzvFtgEWOm+xdWih
 UzDe5mXs+0ithYDPZLq7ygv1MYmQtFIVGzbY78VNWtyf5tkYZuSB2HkTl6zGrQlRgdxs
 7JXkHLeSU9thtHtLBrqEMcdplNgLYOhmYpyYKDx0bmEB69FqRobPfl7fiXYq0nFLUVHl
 u0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=adTq5jNGvDtdlxJZ0jo/X2Y0G9eh94VT3vNbiTzlDqQ=;
 b=bm/7Red6ieDdVC9vkRIMFhdhacU0tVUKUZvZZzOqADw3+0Hu062aecI08p2JiC79sw
 g7sTO5mwk9TgkPw/A8TwFUn3Ps6208uo1h60H1cEXq8Gn8BLPKJncJ4BdsIUGK554LmN
 xGQ1YEMYSjBc4hPkh1nMKvISFcNyYAuGCnQQ8ERMp4UK4MKlWyTd4RNyLJC+mXq+w/uP
 nDuSIf1IwAacgDFwQy4uIQXrjwMCnJDLf059EEvv6fdyfNBrpnT7YWHku0q+LSSCUqfR
 tEtILYAOIB6o7ybdOx60CL9yuZLC3BhHsZ0G77XVWyCxChnUS893zqK0LkRrGJMvURRm
 ZFrg==
X-Gm-Message-State: AOAM531Ut6QzpqrZ1qsRIHGyCHfwI1DzCQFlRnNZ0Wqh9rQu30I9dvdG
 PZvzTHslooj48HPPGulNA/bxMNGy60d2mg==
X-Received: by 2002:a17:90a:9411:: with SMTP id
 r17mr14271032pjo.49.1624673909182; 
 Fri, 25 Jun 2021 19:18:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y4sm6508498pfc.15.2021.06.25.19.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 19:18:28 -0700 (PDT)
Subject: Re: [PATCH 1/1] target/arm: Check NaN mode before silencing NaN
To: Joe Komlodi <joe.komlodi@xilinx.com>, qemu-devel@nongnu.org
References: <1624662174-175828-1-git-send-email-joe.komlodi@xilinx.com>
 <1624662174-175828-2-git-send-email-joe.komlodi@xilinx.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <99a806cf-8c54-a504-c51b-bd094a2773b3@linaro.org>
Date: Fri, 25 Jun 2021 19:18:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1624662174-175828-2-git-send-email-joe.komlodi@xilinx.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5ilOIFMx3cpg

On 6/25/21 4:02 PM, Joe Komlodi wrote:
> If the CPU is running in default NaN mode (FPCR.DN == 1) and we execute
> FRSQRTE, FRECPE, or FRECPX with a signaling NaN, parts_silence_nan_frac() will
> assert due to fpst->default_nan_mode being set.
> 
> To avoid this, we check to see what NaN mode we're running in before we call
> floatxx_silence_nan().
> 
> Signed-off-by: Joe Komlodi<joe.komlodi@xilinx.com>
> ---
>   target/arm/helper-a64.c | 12 +++++++++---
>   target/arm/vfp_helper.c | 24 ++++++++++++++++++------
>   2 files changed, 27 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
