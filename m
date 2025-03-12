Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp610102njc;
        Wed, 12 Mar 2025 16:42:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVg5YnwnMbXxtFjBHntLFVn8L1K8cH+SW/ccZ/fYVAwAG+LHoxTbLRTdpCQn83gzXJdaHTFKWVklVUKAg==@linaro.org
X-Google-Smtp-Source: AGHT+IEz1qBaIg3BfNcGfskEf8W1i6CBBF4FuRRw+2IjG+r2rfZoM1w+KhGBtQdlMUOhm06ZsRec
X-Received: by 2002:a05:622a:c7:b0:476:76bc:cfc4 with SMTP id d75a77b69052e-47676bce157mr285986631cf.21.1741822944765;
        Wed, 12 Mar 2025 16:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741822944; cv=none;
        d=google.com; s=arc-20240605;
        b=Gt43n0Ism8PU4K19kqZr+MtEkcLhSm4oLPPAwU657Bpe2bcYyXzX8kmbZvudvfRvQL
         F6RaDfu7eHGyQiA4mRMp8q3upgUKNhfYF1acN5pjLMTDWLWoTmUoZuGbkZXrgOUQmbLn
         Czn7Wywg27tt6/CpoQJp9aXrE0sm2+HDz3rBHPDtERF3fzjocOklOdy816P6QZK09kix
         aBByYjVsRzlcnCJ6RscW/RmG6HTmxXYZjUF3Qpvo/FUlk4v7S9ac6AkOOz2Btai4odod
         hGBlO9xPMPkaWqKB8H+gyQbpxBKueojgfyx3TcrAYx97bEx8L7BQjUG7ENlPh3MVPyh8
         RhBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Oq1wNqWt44npgQTTfVXNN+4HcTVH3dl5D8oFlHK2ivM=;
        fh=QZWXLWR7PLrL7TZVBVlD94C22TC+jk5+6difFFeBAQ4=;
        b=EJnJcX1ubPFBLAy6H/tswfN2sEGhLF2VvUm0hE7HQoKElQOK1CQjk7Ie5TTtwKKxLC
         9kpxcGFI3MvotIwqMhNwXRgJ187Cj6PlXXNQywQgOvakVWLgrkoJDyADn+TWCOFUOg3z
         EH+p3TdNNQFFAErDziEtul0ThaJgVqOedFSxctAInrzvg8TBbuaZ18SUl7PMcQ+ZIxFs
         iHDyOm9Wkc3MoYKcKkXPcghptvcmjnRmzvMiazi9wtf7Nr2b3hp9lrVP233LZ2tGCJiB
         EeMXgrre7/M9dTKSubYmFAU+eyv0q+zaI/En1LL3CdzCVlyUCluuk798dbiWGJpMkNo5
         pAeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Vdrpt/p4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb857f0fsi1915881cf.525.2025.03.12.16.42.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 16:42:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Vdrpt/p4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsVi6-0000bz-AI; Wed, 12 Mar 2025 19:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tsVi4-0000bZ-A3
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 19:42:00 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tsVi2-0002TR-9o
 for qemu-arm@nongnu.org; Wed, 12 Mar 2025 19:41:59 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so2818945e9.3
 for <qemu-arm@nongnu.org>; Wed, 12 Mar 2025 16:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741822916; x=1742427716; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Oq1wNqWt44npgQTTfVXNN+4HcTVH3dl5D8oFlHK2ivM=;
 b=Vdrpt/p4f88dGIULbwds+l1lkH27UV0HLQjh23mOAhADE/8ZQNEZiB3AdHGnEwlUMS
 G4QKxj/fLc8iN9rvXu+4TOGlNvVKtxJ72uA4Pd5cxQX+P3mNuQBBWXnJjVYBjDKI2D1v
 OxAW3FonruUvdKvcaciLP8KkImyBTJI29o50hjNxlY5X9ylWNgldkdWs5bDvIxJoDk8q
 g/0RJbzbN1QitqMQ/zNiXftonB3zzzBrYzOgvwBZcgtnBKcOww58bB88YzOduzNzTTq9
 u7EhkHxUpvnYvovl/bn1/M4ej58V9ysZGv18sWqrcG6C2onRQhmJbnO7dxorRAYKIcjA
 Z7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741822916; x=1742427716;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Oq1wNqWt44npgQTTfVXNN+4HcTVH3dl5D8oFlHK2ivM=;
 b=lj7vvwAkKbP8gCJm3PbioYBLbvG5+3fU8Lx9YP8HEPm/8f5iAFj5l4uRQ1taw34VUu
 odesy2KbCyBhy7lE/iAuuPld9t6IuZJ10+tUF5E8m/BgezCRzJCusMsIQbdYArex5Vi+
 bmd4w4gEFxlynmgveAnXLlqgY2XCj4Q0ixpPENjr9AcgNaTlRq7AgqtVs9EmOK42evAM
 5ZQzpO3u2oLy/E9LdaLcK8whAYg5oy9CKCdbBMdMbCOCdRRJEMbsCVAIXZT7gpnr1RHX
 v9RJjUp5fVQ1cuejKrDsSdK/kaMBEvqIMTuOxtLSL/DWLxaZOAuLA+23p6KPaM89Jhqw
 Swlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl4RW4ybjh1+m3YPRp85TB3yA4IbFMzS9l8g/nAj5hexAsBKlrythTfmBr4VJBlztTnC1gGrY6Dg==@nongnu.org
X-Gm-Message-State: AOJu0YysntpRknTE1KiHiMppdQqequItxhOiwwlLfYLIJgf6TTDh1PHl
 +I8I3md7bHUv+Sr2/JrTalSeF06+JYub2bKrJ8J4flyTfus8D4U4p1t1E9Wh4mM=
X-Gm-Gg: ASbGncuFFb/KHN0Zb8O+fHLSH3MV4YZXgS5Ls462qxtVviJ4qpo8GhWrNrDaKsKoggX
 gN00D9HjYgpcBhqLXuEtBHjsYPx5YllxgEB9LJlg5/2KC1uU0f2j+XZxh3eWu3P+vONWh5hmTRU
 K2BHNvfwSHxyeglqciNTGrEtVl4NeJWPbnEFkmTEldeIJQO6mNF5GvervPVJpMlDI2+XigDNyCT
 uFX1oiO2kux97rthwuozc39br20oQzbLxaNsBgl5WXvn7dvCfW5mP8QMulSDdmdJtyDItSCNDEU
 i+Wy+B0blY99OgDmIapL6weoRPlUYToPlGd8ExxWq4ORq6RJFtro1oUpvN6vN5AKRtQ9fEwlukJ
 yIEWaUv4/bg==
X-Received: by 2002:a5d:64c7:0:b0:390:e2a3:cb7b with SMTP id
 ffacd0b85a97d-39132da28a0mr22583500f8f.34.1741822915899; 
 Wed, 12 Mar 2025 16:41:55 -0700 (PDT)
Received: from [192.168.1.20] (88-178-97-237.subs.proxad.net. [88.178.97.237])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7ebbb7sm187402f8f.92.2025.03.12.16.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 16:41:54 -0700 (PDT)
Message-ID: <f7eb2c19-4950-4d33-aa9c-5d8052717e71@linaro.org>
Date: Thu, 13 Mar 2025 00:41:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hw/arm/fsl-imx8mp: Make SoC not user-creatable,
 derive from TYPE_SYS_BUS_DEVICE
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20250312212611.51667-1-shentey@gmail.com>
 <20250312212611.51667-2-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250312212611.51667-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: a9s/4/TGdwfn

On 12/3/25 22:26, Bernhard Beschow wrote:
> Fixes a crash when creating the SoC object on the command line:
> 
>    $ ./qemu-system-aarch64  -M virt -device fsl-imx8mp
>    **
>    ERROR:../../devel/qemu/tcg/tcg.c:1006:tcg_register_thread: assertion failed:
>    (n < tcg_max_ctxs)
>    Bail out! ERROR:../../devel/qemu/tcg/tcg.c:1006:tcg_register_thread:
>    assertion failed: (n < tcg_max_ctxs)
>    Aborted (core dumped)
> 
> Furthermore, the SoC object should be derived from TYPE_SYS_BUS_DEVICE such that
> it gets properly reset.
> 
> Fixes: a4eefc69b237 "hw/arm: Add i.MX 8M Plus EVK board"
> Reported-by: Thomas Huth <thuth@redhat.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/arm/fsl-imx8mp.h | 3 ++-
>   hw/arm/fsl-imx8mp.c         | 4 +++-
>   hw/arm/imx8mp-evk.c         | 2 +-
>   3 files changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

