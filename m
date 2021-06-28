Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4141122lfg;
        Mon, 28 Jun 2021 09:15:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwipvvwcLkm3hVfnXRCFa50EjWQAnEJzrL8Aiz9F6BgRnOfWMw0eJzDeLRipApiAx15GU67
X-Received: by 2002:a25:410f:: with SMTP id o15mr4253623yba.376.1624896957929;
        Mon, 28 Jun 2021 09:15:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624896957; cv=none;
        d=google.com; s=arc-20160816;
        b=IdpRBxJPnTw/2Mj0sl2fEJslfoZbmkqHmywRiI813ihWdf4iONO83JOuHz/r1e4VNm
         gZ9stOtqeJJERPU/E0XlwhkOz5j/KOgysh6D7AhUOYlt1qkUkJ91cHIxNx1MiE4E6IZ1
         rQ1OhDc6V8XgaYDCeADZkJ3/44p1G7KX2UH7f3u6pntPkDWxmZ0y1yoy3cW4V67vpbIp
         zP7fgypj/9++bJMiHWQpDVxk22/ZeGn0D5mA5kmSeUn6CAo83ILGzlhQ/kqfXiEK3WT/
         NSB5cq3VELm6eun6ID8p9z7UAdq0/5z0p66iqg3LLX7i4b1p++YwbWp8mqKaQ6Zf+11F
         U8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=7yQHApf48LP1/rHYnUWmrjW6c1HCLt8fufc6eZQxzEQ=;
        b=CyCgoY9821xZ3QXMqXnAT26gidiGUMAE6P9fpayyRzB+Sg+FVomuf3Ejjj2+4NjIgj
         Ap9mvFzaco7xlbJMjuCgbrFruTHMxN/WHVIO3X9YqnvKOvs0WcYAkHrHe7Qt22hRfkHc
         VVuOKYqD2Meni9S9n5vf2D31DU8B4KiaNh2vetOXLXc//HM7cvKX8udwyVOyVxXy5GQf
         RqJB2UeHV9plRlCipBSs8p6DG4/Mr1y1uovtlU75kfrNZhUnwdxkx00fC5svot7imUBQ
         dWlZxZEzPmMkpOyLVmdh09P3Oe8T0EHzbvESZoo5pRaNmD24TT1fs6EMit9hD1NLL0jg
         z+tQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W16eW3WP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4si4630550ybm.167.2021.06.28.09.15.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 09:15:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W16eW3WP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxtvP-0003uL-UB
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 12:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxtpb-0001EZ-2x
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 12:09:55 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:42913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxtpY-000253-UD
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 12:09:54 -0400
Received: by mail-pf1-x433.google.com with SMTP id y4so14486210pfi.9
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 09:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=7yQHApf48LP1/rHYnUWmrjW6c1HCLt8fufc6eZQxzEQ=;
 b=W16eW3WPD5CSC7AH1VXfYIkT4fHQVJzT9Tw0IaWTozVQ6AJ88HnNSPT8ifduWDo3EN
 q67BlUw9obWLe//T7SvJQRvizRLXP1spDpJCdB0W+W+klwTHFmF6DeOy1OoqTlOR/kmB
 Jo62HyllhC8QgDq7ZfjpRhYz/bh6dgZ4W+u/+5f2+ywYUsZAZeOF+rYyiUexusXWSi45
 y4KlNHKZIVSxxnSvWJVpE3S1D5VtMD9CG4c9UNzagMgM2xO35ATZ617pisTiuADdUHrS
 lAp9lmJ5zNAiES6ICg7gJKrd+cWEf4Iq2FeFWA5+wlCDv2OdOFzTWysEZT4am7qCB+oq
 Y5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7yQHApf48LP1/rHYnUWmrjW6c1HCLt8fufc6eZQxzEQ=;
 b=F2qQ66HGyAKsqB0tghnaP+qRmSjqPZmq58iehi5bleyGJMu5H/tul/sd7rxNZwjsvf
 V01jPAR6nouZg+h1Q1h419ctWtJAy5BZLQbfy2DN/4/bfYd3t1mGINMZCwwnnrUF8njo
 9KYPVEg2bowBZKxQsiD2VQ+bDNCiGnZDNLweQfMYIJ91mc9/cHllb0OoeQhChZiXDZur
 ePDY6g+ZAwccvN/2J+qUlpGWP90seJ+HL6W6ZHdDHjInRTgTpEjCLaU9jq4+ME9uZOuw
 wW/QFuabZV0WCOQaNxgKh1svuriHAMfzqRt5u2eEkQl/GQ2ij6qMDgKnLwPqJVMuzgq6
 i3bQ==
X-Gm-Message-State: AOAM5300SZfUNIKEUAWRDK+8IIQUcSRU8bfTENPrZohFUrAtI0mRdCEa
 kpGrQRS+6MeoZ0PwowT0maXmRw==
X-Received: by 2002:a63:ce0e:: with SMTP id y14mr18816196pgf.290.1624896590964; 
 Mon, 28 Jun 2021 09:09:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 136sm15236223pge.75.2021.06.28.09.09.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 09:09:50 -0700 (PDT)
Subject: Re: [PATCH 08/18] target/arm: Implement MVE vector shift right by
 immediate insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c4f5a608-c5d9-4215-a4df-1eca83d75027@linaro.org>
Date: Mon, 28 Jun 2021 09:09:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2DEkfG7n2tXL

On 6/28/21 6:58 AM, Peter Maydell wrote:
> Implement the MVE vector shift right by immediate insns VSHRI and
> VRSHRI.  As with Neon, we implement these by using helper functions
> which perform left shifts but allow negative shift counts to indicate
> right shifts.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h     | 12 ++++++++++++
>   target/arm/translate.h      | 20 ++++++++++++++++++++
>   target/arm/mve.decode       | 28 ++++++++++++++++++++++++++++
>   target/arm/mve_helper.c     |  7 +++++++
>   target/arm/translate-mve.c  |  5 +++++
>   target/arm/translate-neon.c | 18 ------------------
>   6 files changed, 72 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
