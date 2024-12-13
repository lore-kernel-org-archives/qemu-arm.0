Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp666636njb;
        Fri, 13 Dec 2024 10:55:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXzmOrmgmbNbeQ+5ouCQA8EVyp9JM3LBuqZyFIXwBCFQ6SMX8iHYTvwdKk+5eYlVcc/whHfEivEB8Zk9w==@linaro.org
X-Google-Smtp-Source: AGHT+IH2tjMY/qhJw43RdPBuSWP1M/tkv2sqGNqXicYeYapaVK8cN2rP0R5ilhjFtZvcDIPWLvRG
X-Received: by 2002:a05:6102:1629:b0:4b2:5c4b:55e7 with SMTP id ada2fe7eead31-4b25de3c4demr4634895137.25.1734116112957;
        Fri, 13 Dec 2024 10:55:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734116112; cv=none;
        d=google.com; s=arc-20240605;
        b=LInJB3lbhgNJ5V4gAA/n3Fu1N4jmjd4QkLpXUKMSlHdRFOkunnG+XtGGSRrHwyInhP
         4joADHY9b5yfCZFGHsMCSdS7fEhLZW0z+OmBEKF6/7LPGkK5YFoZZ9MPVq9nZl5J+iQT
         sbGERofpymRvuS+h8YMgbAtTcLsUXbt/EaBB0G2xxLeflc8YgVEud4j4NaeAT+CU0vSL
         GSu/WUsA/xAZ+bqCL+nHve5F3AYg1odpQq5z4NbN9ySQaBMOXF9NCiqbR47yPhS8chre
         tuFneOT9IlE0wc/r/F4waXZTND5KUFcKQmE0vvxZneieoGNINBHniDLZjLlS87cyafTl
         GKCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sX0Yf0gF+ESVvKAXl3LC1Mv89Ckmh0JbyX7l3UT8Amk=;
        fh=1UOtjML8TuUuuXRAmGgf2dMdq57JxT4rCJvirs2Tn4I=;
        b=MU53S56nSLwGlroyRqjY2eosLUQXt+jVw9vXzHERwILVk0wJOahbpvvsuzFfQmRu0k
         UkE1yz9aYwmUEK5NItYrCC8VOR+XVvfBPVCqPo+9idDTty7IRjVTf5VpovaYlHJ0yLAz
         HbcyGnALjJ1uDw1n86JJssAp1KpSUTNYQXkI8a3KjvJ80L9xukYc5UdzDM+HUfRpJDeG
         dGK7/NDiEpQ1efEE+yQjuhtuZQEw18YiUM7XDM7yv1YukcOXUrzhOUjmVgl9g4imNBXd
         Q+aOb5Sm+039iSCbpIi4m4jKekpW6jiMOrlsd85UucQq8ImuGkJdJqk2gkdn4193rDKU
         q7Ug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y/6RgH2g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-85c2bac20ebsi5095504241.77.2024.12.13.10.55.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 10:55:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y/6RgH2g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tMAoI-00012S-Gz; Fri, 13 Dec 2024 13:54:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tMAoA-0000zv-5o
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 13:54:39 -0500
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tMAo8-0002li-4T
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 13:54:37 -0500
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-71e287897ceso1219070a34.0
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 10:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734116073; x=1734720873; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sX0Yf0gF+ESVvKAXl3LC1Mv89Ckmh0JbyX7l3UT8Amk=;
 b=Y/6RgH2g5bXio8HIAz9FJ+hzIN245aSUzipG6+oP2nbdMcHUY4z3WOQams6FHzAjMh
 78CV8yXKFdsoJRgANg8MNcWk0kuY27RdTfZ4RjE3qMtTQRFeJBrJmFjE0mXG2DG5h6gu
 YPV1fbmXHkyTypoqYDdiw7uEd6BSUyGnuJb5rN4lDCkCrBjBvZD5dmL7ioliwZUt+j+M
 1+WmwTlEjUn9IUHnUs2XGriHOo4yOW9+YoAcwx1uaBqH08WhXt1aSgB5sBOtZxMKKfTh
 GMaoN8fhYc0DTiCcA2EN6I/5kH92TitIlfqvZkqvz4SA3fPiDIAju0uDgXvr09isdXuZ
 hw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734116073; x=1734720873;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sX0Yf0gF+ESVvKAXl3LC1Mv89Ckmh0JbyX7l3UT8Amk=;
 b=vFHDWFmCo3Gc7qvApFxJBPaWfTTPT9afNizBtrgZsu3qI/yFMKFXQshy8qcteeQOYT
 YadI2/zolp3nZBpPyj+XEa3GR4x5lLSHpg7p93ObBqThX9Ho76tp8F4Pf5a/CAbiVbwM
 byaBf9vkhgC83tnDxjrQJGZKDmHer9QiRRAvmc00FROwYRWp/15bd9KoYsYNNQtQaf8l
 hDX3hnJzfJ36a94R67ywS91IwiKHLatCTTBwRSIEZ0r/mNMpuXhZGCnLO7mVa+PDNEcd
 /lB9VNoTxn5OH7mDincB3mKK0pwB93O+hGbu2Z9f3heqnnKkhsHYyh0vt8NSf+Bx0TZq
 /W5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW95AHieeoU/86yijlWOyE9bFyKrpJruuZYAMuOwRhYLICGjdevSEbiScLBxH1XKCaAZOdIffuuQA==@nongnu.org
X-Gm-Message-State: AOJu0Ywi3Inlc4JgEk7CDkMULJqolDv6dovoHNrq7tnOSeELkARIwCD9
 v19ZdcQSUQYDHBTJf7iHHifQkp4VRr1YUcqJ7WBnZSxIukkRq34crvD3E9pxR/k=
X-Gm-Gg: ASbGnctGE4aSF0yccYh9JaC0XTmydiOTY1pjjyRkC9XjSTAq3Q5ZfX7aaadKcc4qu/U
 k58r23gyilDbUM3votbujIrdK1kruDyu/kYASDQRoSlPGokIPIKtZlD4nFJxtZs4xrNFpGY1bBb
 YxymVVYb75kwMS0Uol8uMkEDZXKmrCOxoghdv82OWqZyaC0gwg6wdgN3PN9QDT52PQ/+1zycGk/
 VB7XuR+toxIfNrDSFwW4K8R1Rz3jbHE0lMWFymKxSXyHjH800bpX402cIydsEtJO8oX56jXsA==
X-Received: by 2002:a05:6830:2aa7:b0:71e:1c5:4f87 with SMTP id
 46e09a7af769-71e3ba9bd60mr2209179a34.19.1734116073450; 
 Fri, 13 Dec 2024 10:54:33 -0800 (PST)
Received: from [172.20.4.119] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f33a6e1f19sm44425eaf.13.2024.12.13.10.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 10:54:32 -0800 (PST)
Message-ID: <6659428f-1ebb-4e0b-bab8-3b4e2e703f70@linaro.org>
Date: Fri, 13 Dec 2024 12:54:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/intc/arm_gicv3_its: Zero initialize local DTEntry etc
 structs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20241213182337.3343068-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241213182337.3343068-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
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
X-TUID: O1PqLHSYYAY1

On 12/13/24 12:23, Peter Maydell wrote:
> In the GICv3 ITS model, we have a common coding pattern which has a
> local C struct like "DTEntry dte", which is a C representation of an
> in-guest-memory data structure, and we call a function such as
> get_dte() to read guest memory and fill in the C struct.  These
> functions to read in the struct sometimes have cases where they will
> leave early and not fill in the whole struct (for instance get_dte()
> will set "dte->valid = false" and nothing else for the case where it
> is passed an entry_addr implying that there is no L2 table entry for
> the DTE).  This then causes potential use of uninitialized memory
> later, for instance when we call a trace event which prints all the
> fields of the struct.  Sufficiently advanced compilers may produce
> -Wmaybe-uninitialized warnings about this, especially if LTO is
> enabled.
> 
> Rather than trying to carefully separate out these trace events into
> "only the 'valid' field is initialized" and "all fields can be
> printed", zero-init all the structs when we define them. None of
> these structs are large (the biggest is 24 bytes) and having
> consistent behaviour is less likely to be buggy.
> 
> Cc:qemu-stable@nongnu.org
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/2718
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 44 ++++++++++++++++++++---------------------
>   1 file changed, 22 insertions(+), 22 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
