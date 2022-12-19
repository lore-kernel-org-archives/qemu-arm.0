Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3905569ejb;
        Mon, 19 Dec 2022 15:58:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvRebrNx2RzC+QuYmz0U/7ebsJPaaElrZdC13Ca/EFwXGISBTlWwkADeG7yF9bKQsVVvXFw
X-Received: by 2002:a05:6214:4242:b0:4c7:4a14:79f5 with SMTP id ne2-20020a056214424200b004c74a1479f5mr15634418qvb.40.1671494296068;
        Mon, 19 Dec 2022 15:58:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671494296; cv=none;
        d=google.com; s=arc-20160816;
        b=PFY78uawKBzDM07nYU84HPaJXXd2tJAuXGrCs9dwPGOLV/369aEdUs2a5rT5gSbshk
         EWLOdnIB72ZBia5ae+/d8qpQC97KjurE5Zfti8MTKJgz5V48TxnfoUEKyBUw5iVSqtiz
         O1GaGbp7USW/UJyrX/nl6uMBpl50KfhBb5inpe7RY5o3DsaT7SSENeeVjCQWcFk5MX+I
         1W0ncuNqHIQtjsoX/nQIOxqesjcZJZXdSdj79hL/BLssiG7ZC201nh4Mh4HbVMQy2o75
         Mr2Xe1lQefgGrhzzgSROZoN53nsNtbpkSa7oSFAqi+U0nFrf+yi+c9ZBb0KYG/MfCNn1
         vi2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5xEN+/cHPXM3dmSajuhSA3EX2xSXPvzRgub6iQeKrbQ=;
        b=qSSF31KzxK986NSFWLQ9TzwPAPwzitiBRzj0GJXID09jtba8rKZ9o6wY39GwAbQ1Ua
         +tXMpBBd4zPfTiTUMK0bAjdxItRsudtwe9c9dG+EpcGHjqjaFqb7uPuZe4xkH5gRNJ+V
         GGjmOCVrOEnz1Dzwcb+0G6AHDNYOa+eZRTYRejt0MWnmq4X3j81Lk0QDWGitTyL5rxQW
         qIMav3YzfSpUUgI465xrWQTANYKwkHlPQoVGVBB2ueH41hfmCMrSWH6bmG746b4E/y1o
         yXIeeR7G+8nR+kSmiLTYnb7Q49oyVrufLsXTo5i1fGo6mWELmK7lFuHFHO7zEk4hAshI
         JobQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nVsZTf+V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5-20020a056214076500b004c70a196fefsi4541816qvz.580.2022.12.19.15.58.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Dec 2022 15:58:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nVsZTf+V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7Q1I-00013U-HW; Mon, 19 Dec 2022 18:58:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Q1H-00012z-7A
 for qemu-arm@nongnu.org; Mon, 19 Dec 2022 18:58:07 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Q1F-0004BM-3a
 for qemu-arm@nongnu.org; Mon, 19 Dec 2022 18:58:06 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 z8-20020a17090abd8800b00219ed30ce47so14773980pjr.3
 for <qemu-arm@nongnu.org>; Mon, 19 Dec 2022 15:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5xEN+/cHPXM3dmSajuhSA3EX2xSXPvzRgub6iQeKrbQ=;
 b=nVsZTf+VzorwY0KwX+fStO8mXF0bOxMT/JEleVEby/fTDy68JrjQKo2GvB9RRd+pSJ
 pwPrnHr6nEVszd/ckOaBG1HK2cuydydrkViu0RnsMfY5SK1lJvcX/v1UZoZ+AZ2bLRJi
 DgY2f3LQ7iTQPSck2U1aogY2qzmgyUncndbDnDsabxWyb4ZqptfpA89V8xP7AQI+SOwC
 xAvzf6H8As54XSMoYKPgO0lIYxBPtjAvDUTHZXo4PmzflNawZNsqKlPFNWtf34n0r3QI
 9VkqvQa0fPBHIUtzCHrc2dQBXHy28eo9mxcDMG9VtJTQ7AHB/HhG1mzX2i0U9QwCH9dd
 KaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5xEN+/cHPXM3dmSajuhSA3EX2xSXPvzRgub6iQeKrbQ=;
 b=F0KEv15H5/qYsyMteqwgnkATDtpqUMr138KhkjytCiE8L4pVGP0PympcL/M2KIvdio
 lHyA01citfp31qCo7X0V8gwX2C/NXRJtLWnw0UGHssih7L9mh4DkAEsl969n0Eho8Jet
 VhPZ2b6JD/ezhSQjT16ehGzB3ukQdyFElfxEYd5rUV9mgZ3y+4owc1w6hFuhmwwx8u3Z
 nvTSZQqIQDQJ4Y+NeqOLZUg1fnXnZlD286Lrwe54c/jBZxWUhWhyDrMa6qA9cEDBqDe6
 dbmi18219PG8GjESbHKSs5oU+foSory0+tKD0zi+cYqWm/xECsTLX5oe8Q9fSSjryu3I
 NH4A==
X-Gm-Message-State: AFqh2krQl+F3NjMYCRRcBh2zehYVpbm9XEC1XWoyBNUi07yOBgfItwcU
 WxEROkqDUAKfD4uwL4yaS7bmwA==
X-Received: by 2002:a17:902:848e:b0:189:66dc:4af5 with SMTP id
 c14-20020a170902848e00b0018966dc4af5mr12284839plo.13.1671494283676; 
 Mon, 19 Dec 2022 15:58:03 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:b343:d344:137b:e318?
 ([2602:47:d48c:8101:b343:d344:137b:e318])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00178aaf6247bsm7763922pla.21.2022.12.19.15.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 15:58:03 -0800 (PST)
Message-ID: <e1f13a16-e6a5-a484-8e6d-722b60dbaefb@linaro.org>
Date: Mon, 19 Dec 2022 15:58:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/4] target/loongarch: Restrict 'qapi-commands-machine.h'
 to system emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Huacai Chen
 <chenhuacai@kernel.org>, qemu-arm@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Greg Kurz <groug@kaod.org>,
 Song Gao <gaosong@loongson.cn>
References: <20221219211034.70491-1-philmd@linaro.org>
 <20221219211034.70491-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221219211034.70491-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: xK7Ax5t9qUpy

On 12/19/22 13:10, Philippe Mathieu-Daudé wrote:
> Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
> user-mode builds") we don't generate the "qapi-commands-machine.h"
> header in a user-emulation-only build.
> 
> Extract the QMP functions from cpu.c (which is always compiled) to
> the new 'cpu-monitor.c' unit (which is only compiled when system
> emulation is selected).
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/loongarch/cpu-monitor.c | 37 ++++++++++++++++++++++++++++++++++
>   target/loongarch/cpu.c         | 27 -------------------------
>   target/loongarch/meson.build   |  1 +
>   3 files changed, 38 insertions(+), 27 deletions(-)
>   create mode 100644 target/loongarch/cpu-monitor.c

Why cpu-monitor.c and not monitor.c like for target/arm/?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
