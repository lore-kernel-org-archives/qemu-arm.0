Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp652946lft;
        Mon, 20 Jun 2022 12:46:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t7NxgmtFZNbpDbAuehp1NvxcwHWpA2xXkVi5K15F0AVSzmxbCuTlFTN5Tw20op1kKGqxzg
X-Received: by 2002:a05:622a:3d2:b0:305:3477:4486 with SMTP id k18-20020a05622a03d200b0030534774486mr21237847qtx.209.1655754413871;
        Mon, 20 Jun 2022 12:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655754413; cv=none;
        d=google.com; s=arc-20160816;
        b=crzargD+T4Yw+mBNE5r2QHzHgXgEnQjEcCSTRq5tq1E9eZ3pvFHnCqsHo9B5sXpvxp
         vdSKen87S5cElifdZsbm9fhvXXw9PAiQT9dR+zxTD+TpVl8F/MveEIk1n5Ar71l5fD+R
         +ieLOeQHLragBi14XRV+2sFto4RnoRalWbQ/7itpqr1a3vjTjm5TQCmmV1hxa8Eg7s4N
         8yFWyM0NNH4LxX0JZ7DDQetD0uI9feH37j84J0DITxXhXb3rK+y8ANZ34Q+WxNvWHsp3
         NmzSVEXn6cR4GakFqfqTLKyGbx4q68USpbnCM0TPih/c00V/HDlDeLpM+X1N/XBZWxHF
         Ae5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7AHcjGt+zIgGZf2lvdLNW41pvrEW5oxP1HGGKcOTgrU=;
        b=oqWjf5PyLxxxtwWGphXnkTu8VPCm55mNkz5Vy6NBwcAgGNMSpQFoU9KbNe90GV7V4P
         mDgBvZIrCi5ahEfGk2e5w+aCXT1Zo1SMPGSOSqlQv8h5Za+bG342OSQzaPqGhiNTwWo4
         41IkGH9iRQnU9ITz0Q5G7gSNNds40hrmHM/RVNTU2cBak3r7Ugg9iQKBX+2EODV1ti7h
         Fz+VmWKkE5tw/3fZtPe1GTl1sLCTkKPPAS3S6kPXoZ/vdGygGh/kM1W+Xe8tRY2tNj/b
         DVtFIPnvz4j+RCaahLDMDtiteYuLEIPOlIQvvUCot34PoJJ03loH5awAiYKAuZCusAxL
         gNlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PmgRZ4Li;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o21-20020ac87c55000000b00304ddef99edsi9700844qtv.73.2022.06.20.12.46.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 12:46:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PmgRZ4Li;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3NML-0006eo-B2
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 15:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3NM3-0006cq-ND
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 15:46:35 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:36784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3NM2-0002TY-8I
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 15:46:35 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 k12-20020a17090a404c00b001eaabc1fe5dso11673099pjg.1
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 12:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7AHcjGt+zIgGZf2lvdLNW41pvrEW5oxP1HGGKcOTgrU=;
 b=PmgRZ4LihN4lJpdZ6AR0a9eFcdDAtFqbzLPTrmGUOkJvPwomh6nIQCiIgq/uhD2mC3
 M/vVnSwiqYc0fIK1a9bokzHKfdJMHmJoCIbQAS7rKkhyAH9s/SmlrdBgAJ6pH3igyfH2
 nw/XjreCWHKZ2zHWWCsZHHSl4XtbqCtraaT9vtJtIi/iSJUeLx9i50NkntLVSouRuvuq
 BUKQt1gsUfj8cQ8uo4PuVtsxFJUZ5q3FyaLed0OJPObi9vC/BRNzNgxAnM8R+DLNqv8T
 RqUp4esngYPx2pQk+CoN3NSo13cGtAU6koQQSC1BI4/hImd4O1PkR3NcJrSugy7n9MAb
 If3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7AHcjGt+zIgGZf2lvdLNW41pvrEW5oxP1HGGKcOTgrU=;
 b=fkQD5KXUUIvBwzD7vmH0I0DeFNsQvZaWdTFE0EDvVUSriuC9uvmuPH/EM+RoZfm0OP
 CpuX8fBZ4mvd5ThIpgeWhEwVb3U9/OqaaHHpeVfUiq4CpGlbBsdWzUIsen7hhNL7bMWo
 g2x0RnmxjChhxR6zgM3ej0jdeaLqFsakzbOiyrcSZoq8Nu8wSx7eVGaz6VtPAbV24x0d
 QdCGCWRMhT+uaMrZqLAg/RSX10rU1NnGo6fFTdb2P5JO+MnC/ywyegI6lIRkaWjUM8ff
 Bg/Y/zQ0ICLvJIJKCyOTJhNeAu1dWffaOelfB9VPaITC3Z4IufDHiczw3AS7wiH9VD4T
 trlw==
X-Gm-Message-State: AJIora9e1Sa54Rz1mnUzefWmMsCFzOJherik6EJ9dgY7sDIbcO5+7Pxq
 ulEofX8XTsXnf06jRgVqDK/DtA==
X-Received: by 2002:a17:90a:4210:b0:1ec:b859:91a3 with SMTP id
 o16-20020a17090a421000b001ecb85991a3mr3827545pjg.164.1655754392831; 
 Mon, 20 Jun 2022 12:46:32 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b001696751796asm7847778plp.139.2022.06.20.12.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 12:46:32 -0700 (PDT)
Message-ID: <1a4d4c40-b588-b89c-3b90-8beaae76f58a@linaro.org>
Date: Mon, 20 Jun 2022 12:46:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/2] accel: Introduce current_accel_name()
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20220620192242.70573-1-agraf@csgraf.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220620192242.70573-1-agraf@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ozRA1D2GzKrs

On 6/20/22 12:22, Alexander Graf wrote:
> We need to fetch the name of the current accelerator in flexible error
> messages more going forward. Let's create a helper that gives it to us
> without casting in the target code.
> 
> Signed-off-by: Alexander Graf<agraf@csgraf.de>
> ---
>   accel/accel-common.c | 8 ++++++++
>   include/qemu/accel.h | 1 +
>   softmmu/vl.c         | 3 +--
>   3 files changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
