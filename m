Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1404157ejx;
        Mon, 11 Sep 2023 08:01:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8e82p6v3OX/U7BVVsnwMLjm15fSNTotkixUc5qe0OtP7mIEuHV3bGunDLh1c2L+kSzuK/
X-Received: by 2002:a05:620a:47a5:b0:76c:e027:2c1f with SMTP id dt37-20020a05620a47a500b0076ce0272c1fmr9496652qkb.14.1694444490413;
        Mon, 11 Sep 2023 08:01:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694444490; cv=none;
        d=google.com; s=arc-20160816;
        b=BcC6DaFcuZsb8h+RyhGZkyLTZXUiY27qPMF1MOu6b9Ik4tlQzZHFxeMIVDKx1qwc5X
         it9sVDzfsRZjfLBIxwKKKCyoCJZ8dCLZR8tmqZ5hxr9az7XMjn/ibYkZviW/r5O8EAAS
         Cp85BrcSDuXUtJ/lC8sQ1ubAdFzwMUiuxuf270joF7dVWiZ1Hy6Obeq7j8wQzbaJSgUZ
         Jh9RiLV8QDCsAdHCjlpTc5KGUw4U/vlDVb7v2Je9uAsH4TQrXh3mWGOP9AyFfbpBh2CD
         2cU8MSDN5R+xEXlciMJlGpvPxPXI5gVUN7xT425MN9GIigAp9pM+HDmeZ2xEqlRFR2Ih
         A/yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=z7TD4EfF4IKkfrqIZXhJPO/8U8bytA6UjmXODkotzPM=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=FRcOs/lr5w3CvKWVCZxCirokH6hDI+oE0ZwpYnek5XNMtoyttVZgu/NCsy5A115ax4
         ae0yK0uBhpedGqKJdHjzTo7Yq/wQC2o8b+XVbMPRLHcEqe+oONAT51JZw4mSBzea3RdL
         O/co9y5VBqRl2XZjHjEIxtLAjl+m7m91ZC/+fM0xpac2YJsOF2Grh0VS0wMMt/WYv35z
         eQD0F5gbYwlZcHO6U9TWCQMe7QyibK0ZwTwHdlTlW2u71DZo1py3X9wHOv1YhtFtxmm9
         fdFheOvIgiYzjy3ofcS694ZoPtAkfL0e5STMHKfb5pdE/5uFSn4ygB+oQPF1WlYVyz4o
         8Jug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uvbQSkAi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk13-20020a05620a1a0d00b00770f3611cf2si3106964qkb.685.2023.09.11.08.01.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Sep 2023 08:01:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uvbQSkAi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qfiPf-0007TL-IT; Mon, 11 Sep 2023 11:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qfiPe-0007T4-Kr
 for qemu-devel@nongnu.org; Mon, 11 Sep 2023 11:01:18 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qfiPb-0002lq-Ol
 for qemu-devel@nongnu.org; Mon, 11 Sep 2023 11:01:18 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-401da71b83cso51970045e9.2
 for <qemu-devel@nongnu.org>; Mon, 11 Sep 2023 08:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694444474; x=1695049274; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z7TD4EfF4IKkfrqIZXhJPO/8U8bytA6UjmXODkotzPM=;
 b=uvbQSkAi6rZHoGSXXCoM410QWDOfQ1+2aUFajksFmrpfbnC1rLh2JcqoIlb/LMe52D
 imDRSYle3htpE9PVtNwYABh/RUBR0tZ1/0NO/UqHeqToPgV9Wk3hseY4pFcxMntS3JBZ
 o1Q0aKkRMV1hFX78yd7ZrXUcKnuIwZkLZrieJsrrtEUr8h482N7Xa5P80xYIxDtf+Iuz
 i2Rsv/qdDYGe3W2C4oAMf6UvXxIBMakFCLE6kEdmTEYzdcoJGiPx4EJvv3c/D2dqjLKG
 EtTEIePR+fbbBVP+LE1KO6NV53eCmXuAfKnVbe8dnIbThluMkCHPo2/7K2IUijWpwfNH
 4Q8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694444474; x=1695049274;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z7TD4EfF4IKkfrqIZXhJPO/8U8bytA6UjmXODkotzPM=;
 b=K/bFIX4nH5o9jcspMWznfXyF/RGfuZiawcnblG7t1aRjRY0tcVSitQtVQ7mj71V7g6
 ZmAgBkzSFqVCNnSd0nfCX+HCwHdiSA/aWHGhwa66JQeE12IoDQNvEmnmSpVrajVZXpVo
 qE102nj6mdBPpyPPUnTPr2xglrk9Wxs/u3Kpza55VuYliH+wU2sNqSvcBCmU/xKiN3/5
 e3i2tYKh7epwixsj7VwrVUfob5ChIYPQLdomiHP7rAARk/BYiEqIwtL72kcraj6haulL
 Rez9SamuXohCeSgFgJ5Y09vkK9yxDgvBcbcqG+FXfP2IwpTwMpZIhuN6xu7kHXbl0jjm
 FjeA==
X-Gm-Message-State: AOJu0YzjtW7c0s63fsxoGQZuwseNoBG8yZcz25P54vZSUDvH33abknri
 2LKhS35alZUNLSnetyE2cSEVpjh7dmdMwC8rrwI=
X-Received: by 2002:a7b:c042:0:b0:3f8:2777:15e with SMTP id
 u2-20020a7bc042000000b003f82777015emr9069086wmc.31.1694444473973; 
 Mon, 11 Sep 2023 08:01:13 -0700 (PDT)
Received: from [192.168.69.115] (tfy62-h01-176-171-221-76.dsl.sta.abo.bbox.fr.
 [176.171.221.76]) by smtp.gmail.com with ESMTPSA id
 l23-20020a1c7917000000b003fe17901fcdsm13537248wme.32.2023.09.11.08.01.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 08:01:13 -0700 (PDT)
Message-ID: <bb402f78-9c2f-e337-933e-a024852a0994@linaro.org>
Date: Mon, 11 Sep 2023 17:01:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 7/7] target/arm: Implement FEAT_HBC
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230911135340.1139553-1-peter.maydell@linaro.org>
 <20230911135340.1139553-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230911135340.1139553-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BR1NvZfGqz76

On 11/9/23 15:53, Peter Maydell wrote:
> FEAT_HBC (Hinted conditional branches) provides a new instruction
> BC.cond, which behaves exactly like the existing B.cond except
> that it provides a hint to the branch predictor about the
> likely behaviour of the branch.
> 
> Since QEMU does not implement branch prediction, we can treat
> this identically to B.cond.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/system/arm/emulation.rst  | 1 +
>   target/arm/cpu.h               | 5 +++++
>   target/arm/tcg/a64.decode      | 3 ++-
>   linux-user/elfload.c           | 1 +
>   target/arm/tcg/cpu64.c         | 4 ++++
>   target/arm/tcg/translate-a64.c | 4 ++++
>   6 files changed, 17 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

