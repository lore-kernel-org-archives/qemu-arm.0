Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp62497ejf;
        Fri, 19 Aug 2022 22:22:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7EAuQ3t7zPKnoim0o1nqhQh0wSabPl881EFMTKwxrP/O+ds1k/QVsPJLYTAxzyDvWAEpxb
X-Received: by 2002:a05:622a:1394:b0:344:648b:575a with SMTP id o20-20020a05622a139400b00344648b575amr8519428qtk.607.1660972922041;
        Fri, 19 Aug 2022 22:22:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660972922; cv=none;
        d=google.com; s=arc-20160816;
        b=SWOoz2zbky00DkKbyn150EQAt7zwnXUaUUCz81gEHU+kIoC+xbdvpzsR17UXj+Gaw8
         6lwRyTAEzJEXyYIan0ylIKl7SFe9IY8Xf0VjLCXpwOlLa5UsCSXBQEh7IWsi9Hap6dw1
         HtoiuNivW039OfLYT5NWuhaMqid8/Dimglhoxg3Rl87CuxN1nIkwUNTH5vaOvh3AovRm
         VHtLYmt0fIGXJNM5lJbVwKVozmrss4pxvfODHC7NHSESLEaF2NTrBENZHvxG4SazWtlO
         YAQ01RZseji5VcB+cCgj+tZpiAWmUee/UG1sr3KGQMdOqocRlEtSdCiWXNP7L4zHFSUS
         dFYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=NDk5uDzmyZQmpEDy6CAJhPQ/D2di48CWnqJg/6Y0lW4=;
        b=CqTSxM/KlfpTPTtHvG6tkzIvIKc1KImW2n5lcoa52UFTsC1mNidMfiUU3+kS72Os1/
         TlpbK0YTQgA4ShAT+3nwKjJBe4vIGsnc0dm9059UiwnrPp74QurSkP7xnMCaj8RTIAFQ
         5i2m7prM7SMK/mKyLB3qkP9QhRXK342kUiwk0GSS3ebWShrHYwE6J98eB1Hx7eRybSAx
         aN7w62Q40LptPwhMSZHB4yTzY+0Twt9x6Do8WqpVjbDKlBFHpayR1ulsOj51y0ai+cxz
         G+10FFkRWSVMbGMQHHcLSVd+QbrF6+k/LmlM9EGpZr3gc5tBazI0cB4GkjRmdKP+ySGi
         RaSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wQaB7Epa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18-20020ac84712000000b0031f06a28743si2391292qtp.205.2022.08.19.22.22.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Aug 2022 22:22:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wQaB7Epa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oPGvp-0005qx-J1
	for alex.bennee@linaro.org; Sat, 20 Aug 2022 01:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPGve-0005oy-6i
 for qemu-arm@nongnu.org; Sat, 20 Aug 2022 01:21:50 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:36497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPGvc-0004Ny-GJ
 for qemu-arm@nongnu.org; Sat, 20 Aug 2022 01:21:49 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 r14-20020a17090a4dce00b001faa76931beso9291425pjl.1
 for <qemu-arm@nongnu.org>; Fri, 19 Aug 2022 22:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=NDk5uDzmyZQmpEDy6CAJhPQ/D2di48CWnqJg/6Y0lW4=;
 b=wQaB7Epaf39bre54T1G9PhMLdoq7y9c7YW+VzH90VeGtmKQAVN+lqIx5tROqaBc2nm
 etQfvXHsJJHo6o5SpYu8fnDcBMF+TnVsMM9tpFtcdINaPDCduCLLDNX9yV9rZnjE4JEh
 URReZ19skj0ut5urxyCWMUOOYtDIJnbH8gzI+8X+CDJ8dH38irZq3VvBDqIhc+rTsfNS
 zBzk3M5ZLfWQAEoi8BwnGKTZmCxBXSRqBv1NuPjJvALRad5ysUmvTXxg9+AWrDWLPadQ
 IxtYCIQDhJVifHQYvavxBm8NMnjUNHi/xEAP/JbPHg8Lhrngf31MJ1mXdL3DvqSiqeOc
 tuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=NDk5uDzmyZQmpEDy6CAJhPQ/D2di48CWnqJg/6Y0lW4=;
 b=3kYtzQrnqpyQSeiYqt2dkhjbm5Vn0ZusjWKKycSd/hCgairqQZq2/yDE6Trsw88yFt
 17SUSHdwF+pOqnJ5atR/LdMjdCNDS2R8Vk9ukEGUEkYqFy4EgL7H+ZfQPpZZ8nK1fZX+
 yE+7T18kfJ5PruElb8pcbEvqAOHEzXAZRl/KWB3HZEql8+qgp18lu/6+1n0IW7By06uK
 fXBS1eblxoDZc6wG2OvaszOIz4VqSwM6/qc0tOsLi7+zMdTdAUWlFEQy6MlYwYatxuxx
 riLi2BLWkNAXYsxKP1XSw+vELN2qNgLBBG3YfC5MzO2LzjDs9sMn3Nhex20DrRREvSGB
 T/Ug==
X-Gm-Message-State: ACgBeo2JlQa/gEr3BpCQKkR//8ibMHAygsEa0udmyn/YcUKnse3ysIca
 VghoCPcOFACnHm9CkAEjfA8J/w==
X-Received: by 2002:a17:903:1c7:b0:171:3ba4:9bb8 with SMTP id
 e7-20020a17090301c700b001713ba49bb8mr10503961plh.105.1660972907308; 
 Fri, 19 Aug 2022 22:21:47 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:b651:a70f:2852:70f5?
 ([2602:47:d49d:ec01:b651:a70f:2852:70f5])
 by smtp.gmail.com with ESMTPSA id
 b191-20020a621bc8000000b0052d2b55be32sm4425693pfb.171.2022.08.19.22.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 22:21:46 -0700 (PDT)
Message-ID: <5b2694b7-a1bf-504a-5af6-8ac95d34d5ee@linaro.org>
Date: Fri, 19 Aug 2022 22:21:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/6] target/arm: Advertise FEAT_ETS for '-cpu max'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
 <20220819110052.2942289-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819110052.2942289-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-TUID: kXMLPK93JScV

On 8/19/22 04:00, Peter Maydell wrote:
> The architectural feature FEAT_ETS (Enhanced Translation
> Synchronization) is a set of tightened guarantees about memory
> ordering involving translation table walks:
> 
>   * if memory access RW1 is ordered-before memory access RW2 then it
>     is also ordered-before any translation table walk generated by RW2
>     that generates a translation fault, address size fault or access
>     fault
> 
>   * TLB maintenance on non-exec-permission translations is guaranteed
>     complete after a DSB (ie it does not need the context
>     synchronization event that you have to have if you don’t have
>     FEAT_ETS)
> 
> For QEMU’s implementation we don’t reorder translation table walk
> accesses, and we guarantee to finish the TLB maintenance as soon as
> the TLB op is done (the tlb_flush functions will complete at the end
> of the TLB, and TLB ops always end the TB because they’re sysreg

First TLB on this line should be TB.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
