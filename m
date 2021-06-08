Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4890062lfa;
        Tue, 8 Jun 2021 16:36:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVlgMfukSTf3Miy4TGc1mGGupI7ZB84zO/8cON9/GIgzDpfA/ECed2WWlM6sAGeEF6pTAw
X-Received: by 2002:a0c:eda5:: with SMTP id h5mr2914030qvr.26.1623195382329;
        Tue, 08 Jun 2021 16:36:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623195382; cv=none;
        d=google.com; s=arc-20160816;
        b=DX7khCpusTlqEwGWPMLPxu1mC8rgrcoroMOgl/MCHoI6LwgwAAJ5Tnz04ptLADKUBl
         DeysVc+NZWkeLH8peP0xb8yqfEwMJUqvCMsmPezdy5bYHOXlZucFUP4yxgBWsSt7PMik
         vdU8SzBIkqZmajYbZ/1BTUvyqoYIOLh13JAbjN8b066KoXBkgDbgkVtYTwOlMnFZ59MU
         vZcTsz4edo9lcT+LaGjjLkGwyRLYYCO0UZDXWtw92aJwl04nakfGcN7scPLoLkG6cIZW
         97rLClXLKdjMPS2SFgnzBgxmptmHD6ZR3M1jr4LecF1oUvnBrOWgRAPG+zVGgLlHpv8Z
         WeIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ekvzbLgNguxYyCu/mbACIGRwEcv6YiD11OHu8VN2gkg=;
        b=pkIgLn8sridXrG9WOiDqXc/cfeb6SReOp4SIQcsnqSXwStraqpF2V8v9m549DHEfzy
         g1H+rB30htIKzVd1CPLCHohgvC0TU5P7+KjzfW43mOlvJKxWEuFEcturwsu1nC6eYQ/1
         i0qYVgf2EZxYiq/C0ZaYSMI6fo5WYuLDJNGdyam3D5X9Ni2QMRRn18MhZKy0Gz0raV2t
         JCjKeQXNGLGxT792CHgf6u8K0Q8XIQVqkOyQrdiKHJ43l+4CM1jk1givMGjFHJSZ+gao
         ptTluPTigqPS3fUZtDmTrRKjn8z+apSSE/X7Gv3rI78RgFbDJEj8cClYwO/0uXTxv8TQ
         dtrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eTNFj6jD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si9802630qvw.111.2021.06.08.16.36.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 16:36:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eTNFj6jD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqlGf-0003gY-L7
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 19:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqlGP-0003e4-7G
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 19:36:05 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqlGM-0003JO-H0
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 19:36:04 -0400
Received: by mail-pl1-x635.google.com with SMTP id v13so11554175ple.9
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 16:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ekvzbLgNguxYyCu/mbACIGRwEcv6YiD11OHu8VN2gkg=;
 b=eTNFj6jDKyHcXHKx7VqVR/YGdqwSp2cyg181m2bOHbEe12J09pdLH0I2wHA7Gd/ssU
 0/nZ5aAlpI+gRyWyoICFTfp3qP27XB6gQIK5n+HRFfXIe87M+9z810Q3OtgZp50RHz2d
 2KnhjGbQkEiFw2xjO0uWbyzlmQ57kCMtepjYc6VTYHXVWtNBoQoRQ77wJ6WDlr7lCMKM
 kyXXnWXrWocp8M4ACFHMNKXChZGqHRNhsUuU1+Xv5oLaMeXkIiMVIxO287zPQJE2L3r1
 uFz2kNNYWNfLyn3oGkNAVDH8wVghsnigADI+p4g5qESOKDmRwB/ZrBG0HSZwUidA0AIT
 ZmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ekvzbLgNguxYyCu/mbACIGRwEcv6YiD11OHu8VN2gkg=;
 b=JaIsQzv6FmFL3qSEwJyl8SfltdYKqT+sEnkp+RgzfRxFsZD26Gliq4DRlqeXicWwWl
 nDAbvPGVyp3fMwYfwDzzHCbaBY4owfbCmtbpRiG77RuaRKDjmi88exMGDSZBD2IRGuOd
 Uf2nUCAsUybEZCEY9h19kWwCB5yoHcqRE1OCkPkBAbR0utlxYKH2KpdWVSJsvEi/gtWB
 6kbtCBLLlBQqZDDxtOH92sXZvUjGhUaP1nmXQ6Z68f2P5akzEOb9+VvMg9IGOTePD5no
 Ebr+4OSrW7+/DlutCUiIWYFLYC5PZmpZgy5dZRKaR7k4xC/BBN6nifrFNTBtS71wD+X0
 64bw==
X-Gm-Message-State: AOAM530LmkveC8PW6jVQq9lHQiQnLcGlIhM1mhfJg7y5H8jSBhbczz0i
 rLlULf5AjwPmmf1BbzwyAEtacw==
X-Received: by 2002:a17:90a:3d0d:: with SMTP id
 h13mr29259710pjc.20.1623195361049; 
 Tue, 08 Jun 2021 16:36:01 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 w10sm11809843pfg.196.2021.06.08.16.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 16:36:00 -0700 (PDT)
Subject: Re: [PATCH 25/55] target/arm: Implement MVE VMAX, VMIN
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-26-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0951ce4e-45d6-c271-511d-0917479c1b4e@linaro.org>
Date: Tue, 8 Jun 2021 16:35:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-26-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hiUIMSeBy2zF

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Implement the MVE VMAX and VMIN insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 14 ++++++++++++++
>   target/arm/mve.decode      |  5 +++++
>   target/arm/mve_helper.c    | 14 ++++++++++++++
>   target/arm/translate-mve.c |  4 ++++
>   4 files changed, 37 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
