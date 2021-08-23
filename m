Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2090913lfg;
        Mon, 23 Aug 2021 11:05:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0sgdWNiKUeHYokNVvgDjmHQaQ7hxq1G12kwYckO02no0u7kG/VOfGwNGMua+mboLZ0Q+R
X-Received: by 2002:a17:906:4784:: with SMTP id cw4mr36496030ejc.160.1629741920332;
        Mon, 23 Aug 2021 11:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629741920; cv=none;
        d=google.com; s=arc-20160816;
        b=WfNg1fMgWeXlbgPtYEYtmFf1HmjaG0O4hmIkcRKlKkI78nEAURE+kDCgH5TXXXJKA1
         uv7ff33kcN4YOBYgHBdEe39aIZkR2ev9TpeXILlbUUuMXHzJkh7buTwRqEnMoF80Wk6g
         yJqam4X9MNAkpq7CaW0ej7m0k6qq163FU7WQS+AmjNgk2fDnVH+RkGMLtj1scRj8RrTf
         z86KA3cefg40+QwgMS9nUNsoqINdDJ7TKx3LsVjwo9i6Z9F48tgDr5/dSMTVGK+oSzj2
         HkdecGK1Zrb6RyXpvNVDrhkCE3Sea0eeL+E2FaBl2b5eEcqjXHRmm9s1ewbtaIiXYYlT
         cZkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=DIaN21ysGXASYoaysgHyHmiWT2YqU3g3JDLJhljI6G8=;
        b=y75PkKLqssszZhPR7rCE4Iaq9azEezg7ki+eVavDqARAl6JTeDP+oakWi+rLlMWQgi
         E5bZDGYY8vPyqkrNS9RdzndHK8gDrBjPySNknZv+d2T28TWDa2AUiePwyAC+NJoCYcfZ
         1TPdWyF2WAJqQVGguEvYWFyoCQi5R0c+4EXeIS6L+ISQmXCs6GwN96evYp5jpx3PjRV7
         zM/ZQJopASicScyX3smncCPxngk5YNPozOsU40EV0OI1/6Ihj89lRdua8bBrErSQj3Yz
         LCIHM4HgX7c2dpEW5qntU+lEYL/qeAqbCC7e3ml635shv1z5itqeBPufqD4QewKpTg70
         BbEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="MNXPfXj/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id si13si15048933ejb.517.2021.08.23.11.05.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 11:05:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="MNXPfXj/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIEJy-0003D2-95
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 14:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIEJa-0003Cg-CJ
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 14:04:54 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIEJY-0003Qu-Ne
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 14:04:53 -0400
Received: by mail-pl1-x634.google.com with SMTP id a5so10649204plh.5
 for <qemu-arm@nongnu.org>; Mon, 23 Aug 2021 11:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DIaN21ysGXASYoaysgHyHmiWT2YqU3g3JDLJhljI6G8=;
 b=MNXPfXj/o98osrJJzqJ0a9FSpnrHFd+J9AhYXy2oEzbk8FoL/JtV7Ug8j2yDVaF72k
 AhyO7KMmanHjxCTHk6f2LzMoqtP8RIUan5fPWeMwbt1cZMR3Ze8NEYM+r2B9G/hArtlp
 Uidgvw+KfkwT9MAW5fFkB0ckhkAKx0K5CRcSGoBkdUD8LMZI/3U3Z23NBMM7YDFfAsim
 OBzAjdE4mk3tgkbHETulkLLDlIeWh1As53aZlI8AR4Aqu5fBFxXLHLNC0bsjUlJyB+jz
 0NnFS3Z0LqphIGQAgzHa4EFP9NIjt8f69FNnLDxAcFj3bS/QDxo8KiX6K2aCbtQSLTx4
 svog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DIaN21ysGXASYoaysgHyHmiWT2YqU3g3JDLJhljI6G8=;
 b=t5CP0lz4i2FyePBby2F53N5YkNblNiIa+cP7jCvuE0EozjdVsHplBHptS0zc9kgAce
 KmrBsY86mT/h+6si1ohrH4YnIAfjProMQ/eBHj45GTpn40yb/ZcsJ9IJmOoVDvkyMvoT
 utPoTZVHiV/fk3G46FV8VR7OK+ijKutHX19+i7WBe3gX6gN8O+sHf1PUhYeQhHEiOrGi
 xRKeq58+ldoWOVEMgs3RSJ4XW/Ivo8jYt+InlFgJNj5bH1Kmw+fAFsSNLebmcWT4bIIy
 5WU9iJaZNgcuaBAMQQOgsMnldKMlB5fsD1WSufjZQspqlBl/54JdOGFzJaw0ICH7jNXN
 OZMQ==
X-Gm-Message-State: AOAM530o4ad4JhysawLtHJB7fNCekOm8wfCEmZxApS9XosEy3lK+YoQF
 9G7TGTkURU5F0XXtR2ocvS6CWQ==
X-Received: by 2002:a17:90a:f8e:: with SMTP id 14mr9911084pjz.85.1629741891091; 
 Mon, 23 Aug 2021 11:04:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u12sm19613117pgi.21.2021.08.23.11.04.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 11:04:50 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] target/arm/cpu64: Validate sve vector lengths are
 supported
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20210823160647.34028-1-drjones@redhat.com>
 <20210823160647.34028-5-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <31e867ec-d122-d45f-3e17-ba12d7d840ae@linaro.org>
Date: Mon, 23 Aug 2021 11:04:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823160647.34028-5-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
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
Cc: peter.maydell@linaro.org, philmd@redhat.com, ishii.shuuichir@fujitsu.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aBZAO7HCT33h

On 8/23/21 9:06 AM, Andrew Jones wrote:
> Future CPU types may specify which vector lengths are supported.
> We can apply nearly the same logic to validate those lengths
> as we do for KVM's supported vector lengths. We merge the code
> where we can, but unfortunately can't completely merge it because
> KVM requires all vector lengths, power-of-two or not, smaller than
> the maximum enabled length to also be enabled. The architecture
> only requires all the power-of-two lengths, though, so TCG will
> only enforce that.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>   target/arm/cpu64.c | 101 ++++++++++++++++++++-------------------------
>   1 file changed, 45 insertions(+), 56 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +        } else {
> +            if (kvm_enabled()) {

Nit: better as

     } else if (...) {

if I'm reading all of the diff context correctly.


r~
