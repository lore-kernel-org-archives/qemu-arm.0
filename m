Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1122516lfb;
        Fri, 10 Sep 2021 05:29:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxchj8+JUyjGM75d70d/aR+1Hjw0EEHRYuDQtEoVGEiacC3tAKdttMzNSpl6JnkDLVNMyw0
X-Received: by 2002:a05:6638:2051:: with SMTP id t17mr4199436jaj.143.1631276962302;
        Fri, 10 Sep 2021 05:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631276962; cv=none;
        d=google.com; s=arc-20160816;
        b=ZehX4GHofq3Vx2rBJ2TldZFMiBBA0UX6TyqC5Hz3qJ+9cuK0L24I6c57fAUmMm8TMC
         q7xUv53xlWBU2Mb0iOanDmI8rYKVkt4xb/yfAt3bbIdXDAWFB7UmYZbcAw1I3WEFPZAb
         sagPMhJBTdQr/APvigSw2jO7KySK1zSdz6I5W55sSlAsDqARPDp3ixlr4/CObpYPGpdC
         GTuGTWltoqKJqT08K5Fs/iX+hwViw6XefxKjAsAhATqRh2QeBqlG+W6KdA3dzfGZzN9N
         9UdKZjHq5rDv8t8MJdF3kf7Fq1fMUVltzZyiJ2FhR653le80VUDD5QGkophGlG7vhSaK
         oRSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QHZNMUbqaI7z38U63M9bCLV3uukNmXmqkLmOEuX7MWc=;
        b=vKGKDRhfpp5Ngki6GHQPbDQqk7FSijkn1BktzTZ8YJ7CC843KMLBBN/dkjY1He88qt
         XZbNrDvX36uS/g8/IfigVsCQYNEr6bVyUTs5QGzxv5CAqGOa1+xIDEVA8KI1Vdl09Yp2
         HICi9d+EFDNGwctK86aIrkoPSXF1JlAAgpPOp5bNL+B/K2dmYVrxqD4iMJah0qM+xy0M
         Zqmxrpv2Cc/bgjWFAmb6s+j+IcWlwPHM1ku4TK//BJc302nNppnv+FWPjqHGYn8mDBjQ
         eTUcPwHKRNdHMKrWT43KkntDwF7/dyvle1FctPefmrY3Ga35Q9DWGQM9JUv3sI7KUFyd
         6v9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VZuQcJYF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c30si4340511jaf.110.2021.09.10.05.29.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Sep 2021 05:29:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VZuQcJYF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOfej-0004n2-BL
	for alex.bennee@linaro.org; Fri, 10 Sep 2021 08:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOfeG-0004jz-CS
 for qemu-arm@nongnu.org; Fri, 10 Sep 2021 08:28:52 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOfcQ-00040E-KY
 for qemu-arm@nongnu.org; Fri, 10 Sep 2021 08:28:52 -0400
Received: by mail-wr1-x42b.google.com with SMTP id m9so2391858wrb.1
 for <qemu-arm@nongnu.org>; Fri, 10 Sep 2021 05:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QHZNMUbqaI7z38U63M9bCLV3uukNmXmqkLmOEuX7MWc=;
 b=VZuQcJYFH72s/ldTjifr8x5mWavzBgjMFw5px8WR+XsC7c9tTrgEITiDT8eTbxSqYK
 ZYT3mskw1PZGmGJD9fIwYqjbcX8cGmQa5UQ/inHI+eO3q1duudstLtr/7ARYOlju+Hv6
 iuo9VmxPGBfUnnFFInULTy60m+Wfnm0KeiiLZqXJLPV55f7Hicg+pRREmfK1t4Xq64DR
 prOVXSKvyeh71m2JTZTj4tqYiFWJA38+uc+/f13rTtQIzr4j21ht/RYJWHOYDD5lVIWm
 JH3BRCt/D1NvjkdZntsBxzALEif9xftNlKwBUU5YxTbJHCqpuKBfdRSvQAztQvKIyuIY
 RKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QHZNMUbqaI7z38U63M9bCLV3uukNmXmqkLmOEuX7MWc=;
 b=Q4RdElqTOAefeGDmf9EgOYJnAXhNLlWLAFfee647HbUNP4BKM9DHnSXj4aC4UiG8zf
 ZdP/V8ndhexquNnIFydToBwzY7MhxHBi0dc4D7eB1LWhjy5iFkNWvutM+KqZ+hYf3D04
 0+SoHAzwLJK11w1uCVbPHOqKNkZfQehnoM0BJ5/13FNexJqSPrRMpHO8EYVdMrnoN1/r
 glzqapAdhgIC0tV7uurm76f2RvSsvNqqGclMuGKtfIjY5D/G4i/T2LtBJWD+Pro0b5PC
 6pgxJNY5UkZOX+TTzEVYb7nzIYpHQdbWtgXXxWUtUQ8aiKzaX4U257H2U1jlV9GL3VBr
 do9A==
X-Gm-Message-State: AOAM530nSHCpkyKpqG/+ji/TATv3KyBvrsER5P28ajp66+nYJWIWF+Tp
 LC4ldvVfFhWGa5ViGnIRqpulWw==
X-Received: by 2002:adf:9d4b:: with SMTP id o11mr9448560wre.29.1631276816462; 
 Fri, 10 Sep 2021 05:26:56 -0700 (PDT)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id o7sm4012716wmc.46.2021.09.10.05.26.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 05:26:56 -0700 (PDT)
Subject: Re: [PATCH] tcg/arm: Fix tcg_out_vec_op function signature
To: "Jose R. Ziviani" <jziviani@suse.de>, qemu-devel@nongnu.org
References: <20210908185338.7927-1-jziviani@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <244b78cb-10dc-330c-467d-bea655deb727@linaro.org>
Date: Fri, 10 Sep 2021 14:26:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210908185338.7927-1-jziviani@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.349,
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vMYF+S/jszD7

On 9/8/21 8:53 PM, Jose R. Ziviani wrote:
> Commit 5e8892db93 fixed several function signatures but tcg_out_vec_op
> for arm is missing. It causes a build error on armv6 and armv7:
> 
> tcg-target.c.inc:2718:42: error: argument 5 of type 'const TCGArg *'
> {aka 'const unsigned int *'} declared as a pointer [-Werror=array-parameter=]
>     const TCGArg *args, const int *const_args)
>    ~~~~~~~~~~~~~~^~~~
> ../tcg/tcg.c:120:41: note: previously declared as an array 'const TCGArg[16]'
> {aka 'const unsigned int[16]'}
>     const TCGArg args[TCG_MAX_OP_ARGS],
>    ~~~~~~~~~~~~~~^~~~
> 
> Signed-off-by: Jose R. Ziviani<jziviani@suse.de>
> ---
>   tcg/arm/tcg-target.c.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Queued, thanks.


r~
