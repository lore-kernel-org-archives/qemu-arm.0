Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3659156lfm;
        Mon, 24 May 2021 08:33:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHLTtmvGQJUr9EHVA53jPPT6KEcHoZ9/Fpe5Qs2nDYhdeHJuo/g16p7AhGEkJPbAbZoZxg
X-Received: by 2002:a9f:382c:: with SMTP id p41mr22705212uad.65.1621870418732;
        Mon, 24 May 2021 08:33:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621870418; cv=none;
        d=google.com; s=arc-20160816;
        b=Prr1Sh8bES1jbsNTNcUXLwHf7/vnNKJ0TOZMSgwVnhNN+SXavf23zbrYXvWcZa1Mgk
         0hDA6dfmXRMFJ+Uu9Z3nAGeB9/ez0auVs8QY8Y1RsMpf81m1Zlvvc9mP/Nw3ta+h3kHG
         bqclOxOMMXFsQV7NimHdI/ywe2SKG8MrBRl9FzGaZTeOWVFBhGE53T4fpz45g/fH5UB2
         1RcCOmQrU4n26hMNOIRUOEpLRl+5m73dkf8qibl69G1q+TsotFxx7wXsibKhmT7i+YoK
         kWppnTXMgm5R8GeyPDL3+d06yRw4WZh+bTzAX2QooYnN4O4Q2P7a9u9JjM0Mj/I5yMe2
         ISYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=E+1rF+gQ5BXZJh3iM48/7iy3zG5eQbhpWyUrAtHjcxk=;
        b=JYXTILX+YHcZXT4ovgOis5qVfvqpX50BkCLB2/y7k/+X7SA9m6jnZm8uD7l9dXZta4
         DMWbPnf6Yks2fWRy4gtVFrgq5IpA/90jeBTb8Nh77HI9zB6v6kWiFSZ66M14XHNzx/hc
         3iG9yJibZNBz39CollfwJZYoym/NEmq0YqgMQZPjNX8+4BOsYDM9BYH8k8jLtpCzFdrL
         3d5wNaoq3CWIE0pwV7RfhO7cJlLfqKqYN65ZYe0Qxx2WEQKIS/Y8bjpxaHdvFWNEC6XY
         KAVSN3aPJck1F76lNpVLWGYcrq0F5BIEootDzSGBVPbij9kDo4wpX8V5z/kS1aK27GXt
         l//A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sFJOHbSD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l19si2744990vsj.298.2021.05.24.08.33.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 08:33:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sFJOHbSD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llCaI-0003z9-33
	for alex.bennee@linaro.org; Mon, 24 May 2021 11:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llCZ0-0002Kb-1V
 for qemu-arm@nongnu.org; Mon, 24 May 2021 11:32:18 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:37834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llCYx-0003Te-1K
 for qemu-arm@nongnu.org; Mon, 24 May 2021 11:32:17 -0400
Received: by mail-pg1-x534.google.com with SMTP id t193so20363898pgb.4
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 08:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=E+1rF+gQ5BXZJh3iM48/7iy3zG5eQbhpWyUrAtHjcxk=;
 b=sFJOHbSDIplVt+wiWeuD1iqlNUg4LDtG5j46/ypDBxysfzt5y85j3ehCWRIJOgR4gX
 ZgmxZyGLDChx/JhqA2zVXVUl3fnwOe5uBCRFBFAwDmg4ohHMomemv5h+9rUIPQsqHq7B
 sd7SU3BE4oMdmIF7IGhMqDqP+TsXKNu9ZSuh8/MLHsIuTQ6th2JdNxMyBzVCXD4csWP2
 w4j+KgSNDCDuNZFkfEqr8CFck0VTl8EByI2DuHXHT8H367Rg/2xyagLUSNUg+ddIS4Mn
 B5bipshgOPP/F9OHiNNca8tTsI6WsPLieeKVBtPsuFdJ/WBtffpPY21fSarW2xk4mJ/u
 0oFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E+1rF+gQ5BXZJh3iM48/7iy3zG5eQbhpWyUrAtHjcxk=;
 b=k3jkNCdkSxlKAq+29FR36VTpObyaIpYr5rm2KD1IfGPKu9II2Lt7wEQJEdRz5I9rRf
 DtpNt1kI/NjCbRngAhy292IOR18ygxwkKqVlIJ3qvfDvLTQLqLwYEO4A0PijHNsBjd4o
 cd5OdyfO9H39oaEkl64h3G4tADot4wQXSayjXpS8Wb//iMre2s9oXUmvbz9Gl4XFF7+8
 jH488Dhsj37xtP5hgWgkpeM2semmwpIOozo7OzMroVdyjyaEzbqQtJ1JXaVawbwMeMLW
 Chv7bXMaFBQ0ki+OS7SeVWcbXQlZYDcORqhy45qP8WHb5xBlY7TH3M0uLvrW9XyTX6Zh
 q+7g==
X-Gm-Message-State: AOAM531pZy6cAnqfoVemZVE+A4tNVXwvcuJCTWfyAz+vAxI7dPddnxJp
 0WWj7jBBtJwjxK7GhGHI0pMjng==
X-Received: by 2002:a05:6a00:248e:b029:28e:bca9:5985 with SMTP id
 c14-20020a056a00248eb029028ebca95985mr25613198pfv.10.1621870333258; 
 Mon, 24 May 2021 08:32:13 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 m24sm1076538pfa.125.2021.05.24.08.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 08:32:13 -0700 (PDT)
Subject: Re: [PATCH 2/9] target/arm: Update feature checks for insns which are
 "MVE or FP"
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210520152840.24453-1-peter.maydell@linaro.org>
 <20210520152840.24453-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <45b047d6-a287-0cc1-8b81-cbaa727347c6@linaro.org>
Date: Mon, 24 May 2021 08:32:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520152840.24453-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
X-TUID: 9fhc2oumPdDy

On 5/20/21 8:28 AM, Peter Maydell wrote:
> Some v8M instructions are present if either the floating point
> extension or MVE is implemented.  Update our implementation of them
> to check for MVE as well as for FP.
> 
> This is all the insns which use CheckDecodeFaults(ExtType_MveOrFp) or
> CheckDecodeFaults(ExtType_MveOrDpFp) in their pseudocode, which are
> essentially the loads and stores, moves and sysreg accesses, except
> for VMOV_reg_sp and VMOV_reg_dp, which we handle in subsequent
> patches because they need a refactor to provide a place to put the
> new MVE check.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-vfp.c | 48 +++++++++++++++++++++++---------------
>   1 file changed, 29 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
