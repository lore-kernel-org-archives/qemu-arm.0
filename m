Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2322511lfv;
        Mon, 1 Nov 2021 10:25:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxweZhBhhT0r+078T2KoiVcmS356BkzUDbUq8zNF8M8WspeuiaNb7TFJ8gHx3sXoRi+dJcF
X-Received: by 2002:aca:783:: with SMTP id 125mr254447oih.29.1635787542565;
        Mon, 01 Nov 2021 10:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635787542; cv=none;
        d=google.com; s=arc-20160816;
        b=BYu5lW7hOyEdbzMSadC2gWZ0ZolEg0/0xKLdPXzenERkWbXofvTjQEC7hWdQGzSSNL
         SzS6nzWLRQktmQZMmRjfCDzzNF1C+eLihnjBh7xaJecluEAD+osuKCx16MJbVjZeAIak
         2D7NUGM9v6NZd4y3zXImiCHz0z5TvhMLl5k2ZPjkqNjG8whCqGqyUC7rzkOE6Jl2OnOj
         l3JgW84xh92Tqa8Aw1VjEyqgXf5o7vLpHv5RrBqmaXT8Ij9jMCjfO6Ltiz4wVGhS+Bf9
         01/1GUCjeFaXNPj0Mg0mvOZ2iQafhRYeEJW4m/yrmHPAo4p5lNXuTAtLA9i2yLzA4nBc
         TZTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=E2yb7hCaOv8jKdPCnGkYTg4LQDZQEqkVxNmrI49Gu40=;
        b=VXa/TtMdiYlp0+vdMaghwy0haSmPywIexuZnDi2uqeqsP4SlvcbfNJSxS0enelNiYk
         PS0GEGF7aI0CaZTqgekdG+9521PlAuuNfwgC9NgFdxTYiSvQp84X8VnMTUZ1vW1GTigx
         QKinCGr7Q5Q70WhZZb9Ouu5q7FK8Vndl9sXlfBSiGrjA9VHL//UgLmU6z6CO5TiO9EF6
         z8jWoJctfCtd/7rYq5SJIY937a/HT+sCL1INgl79MmsoRTWXbyqvd+yuuheMXTg+qkMJ
         CAmbq2U+OKwE1ZXel4zfWdYCEtD9GxMhtrEYBbheS7FzmCrcETb3nDlQ2a74J2RnAgkU
         kGLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Mcmfqt/L";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si11117160otu.216.2021.11.01.10.25.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 10:25:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Mcmfqt/L";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhb40-0005lS-Do
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 13:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhazm-0007KC-UY
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:21:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhazj-0007x7-5o
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635787273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E2yb7hCaOv8jKdPCnGkYTg4LQDZQEqkVxNmrI49Gu40=;
 b=Mcmfqt/LwdItlgMnVcfKp0Y1N1waJB3VduYZjOSvz3qom87uPIgsZfXA8jVT8SkYd9pImC
 nH4s6yr8ragoGiYoqlSxc9zhWZhH91GJCnoj0UORiiZnXLcbpj5jkw0GSrcdSpnaSfCMBb
 IZzudFp36OnRgOOpeRgpNIp04dQNp2s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-rRqKUrmVN-Wkr4Cd4ACc0Q-1; Mon, 01 Nov 2021 13:21:10 -0400
X-MC-Unique: rRqKUrmVN-Wkr4Cd4ACc0Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 v5-20020a1cac05000000b0032ccf04ba2cso4924435wme.2
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E2yb7hCaOv8jKdPCnGkYTg4LQDZQEqkVxNmrI49Gu40=;
 b=u6eTf7svW+DAPQ6iY7cgdk7qmwDdoBL4Lqa+vVenMrmJoPB9+HUV53Z14yVp4eE/RM
 AQGGUQBNdduGZ+vuRIg/u/NHMWiGSf5mibTab7MctuRRNd6S3eNgqm+j7x3k55fuGWR7
 MUwePfJJ+dmiUlFncnJRC81LBeYWi9ADmN5/MCahWZltj/KvoAxk53GEhU5umRHxI+vy
 ZpZaU7xWnc7JBUUqwmUNV5mCA6G+ZWHOTveWdqFQ8WcR2t2uCbH0B45nfkCT6NTJhSWJ
 H1SuRFEd2UlKJMBzd9drU+ZpeyzEQsNQw3NG3abHQyyX0oNuaIXMKtypkWQ7eItQuGSi
 OOPw==
X-Gm-Message-State: AOAM5337s+lWuUyMnFE0uUG9CljYxgn4t91mHUM3WOld4PC9/UfXfD79
 4Cn6ScLAngPCYoTI/Ri9gHBAR5b7yyPGMf8xRa+it+Jf7mKw9y6gDkjfREEH9WuQG6qa5LBnsIZ
 AeE8PVSj4W6+HIc0=
X-Received: by 2002:a5d:42cc:: with SMTP id t12mr37988800wrr.129.1635787268858; 
 Mon, 01 Nov 2021 10:21:08 -0700 (PDT)
X-Received: by 2002:a5d:42cc:: with SMTP id t12mr37988774wrr.129.1635787268687; 
 Mon, 01 Nov 2021 10:21:08 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id b9sm8317058wrx.24.2021.11.01.10.21.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 10:21:08 -0700 (PDT)
Message-ID: <8eefc43b-97f4-0608-ee79-9296de44b433@redhat.com>
Date: Mon, 1 Nov 2021 18:21:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 for-6.2] target/arm: Advertise MVE to gdb when present
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211101160814.5103-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211101160814.5103-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CXVtBmBfo3FP

On 11/1/21 17:08, Peter Maydell wrote:
> Cortex-M CPUs with MVE should advertise this fact to gdb, using the
> org.gnu.gdb.arm.m-profile-mve XML feature, which defines the VPR
> register.  Presence of this feature also tells gdb to create
> pseudo-registers Q0..Q7, so we do not need to tell gdb about them
> separately.
> 
> Note that unless you have a very recent GDB that includes this fix:
> http://patches-tcwg.linaro.org/patch/58133/ gdb will mis-print the
> individual fields of the VPR register as zero (but showing the whole
> thing as hex, eg with "print /x $vpr" will give the correct value).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Reposting this unchanged except to remove the 'RFC' tag, as
> the gdb patches have now gone upstream and the XML layout is
> therefore finalized.
> ---
>  configs/targets/aarch64-softmmu.mak  |  2 +-
>  configs/targets/arm-linux-user.mak   |  2 +-
>  configs/targets/arm-softmmu.mak      |  2 +-
>  configs/targets/armeb-linux-user.mak |  2 +-
>  target/arm/gdbstub.c                 | 25 +++++++++++++++++++++++++
>  gdb-xml/arm-m-profile-mve.xml        | 19 +++++++++++++++++++
>  6 files changed, 48 insertions(+), 4 deletions(-)
>  create mode 100644 gdb-xml/arm-m-profile-mve.xml

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

