Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2735554lft;
        Mon, 27 Jun 2022 15:54:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v04V4w73P1vwI+hgxOfrZCLbVtGMI6Nu7VmkrnSa4n3MeONvdFLxznlSOYwhhxaeSD+4IU
X-Received: by 2002:a05:6214:27ce:b0:470:596b:4e82 with SMTP id ge14-20020a05621427ce00b00470596b4e82mr1522088qvb.118.1656370461018;
        Mon, 27 Jun 2022 15:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656370461; cv=none;
        d=google.com; s=arc-20160816;
        b=xpi4UM138rI71O1VNM0/H/ZOU5i77p9nyGkUlaEX18zw1fadh/Mo1jcn8TaYNFFNBc
         8IQmWYdq02sR4vTelF9nJ/dU8NhDhqcFCNk/BLfKPJ0qFiDeVz/YQ+2Amtf33gN6rt8R
         jzzuy3Jd6VVpSy0sKV033UNaN8+DSNAwiLcKyeWvDA1JjVgSSilPhPWsutVSw2U9mlJu
         pcaTuzfD8iTkoYcGWnWlpZnwNeCSQrJk14DuQojAWUJ1gKY+KhoJyLatFqtrT99hxwIw
         DvxdSjKqfjhTXVMtTcBIQZ8oUEDCvfD7vAiq5457Q4k25BLTGBPFXjolc7n/a/MxlpeY
         RmBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vYqXd79+V8jayTOkJhsqghC4+xfdJz7wmyDIIc9y5K8=;
        b=EEHFq0zFcWCle1Wo9NcR6vKFajxKnPXIz+TWvK1lnO1nPBKV8SJ80HQt9pzhStTHJh
         WhUzlwdYnDBVALSisoclzoIvsDoz1Hztb4d8HZm48lO+EdY8jooisM4M2SLhsWn+AtuC
         nbGy92tDB0USoJdL5tyxV2p382V+BHanOWEZjE3UtdMTJUfYqzMXrkDTW76OLxvu+q1e
         efa+j33yCekun3C1dKlbw5FUQKNd0ZQJ863b6FsS2BxOdjhxFAyBZFNL3wGADkeK72gJ
         U4hoZJBxdk6nBGVIcxZVjhFgjyvOUqJr4WD47ATvZTKIW1cQcp+pmAGcvCwAZM11Labr
         wuHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t46IGSRE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4-20020a05622a024400b00307c88f77b5si7342459qtx.463.2022.06.27.15.54.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 15:54:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t46IGSRE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5xca-0002Bi-36
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 18:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5xc7-0002Ad-Pp
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 18:53:52 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:46719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5xc4-00014Z-IF
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 18:53:49 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so10807555pjj.5
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 15:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vYqXd79+V8jayTOkJhsqghC4+xfdJz7wmyDIIc9y5K8=;
 b=t46IGSRECvFJy+uZorMe0b7NFz6RJbmhJ4ZmU4Ct7K14I1Y1FK9LbmHyeyENi/Y8II
 Um/lHrN4wqn0TF3XkuXjcEFzQKu5ddRFWhNcCEhUhDaDnxUI1sL9YnRy4Asy1ZQoNvkj
 T8pjRx+7TMrW/TfkLBE/GetN4p/og1ardDO6E6XAF82FSyIkTlIa6FIa6/yPqDTi1ZY9
 eOqGYdJYmn17wRGC6MugWSCtIlgVmVF1wOEo76gX3X+Hpu+LF6ciGdI9yt/Knb+C9Qd2
 2z742wBZ+rUhG1U9SEXwk+jWZssYxSxMNCddXhID+Bbmt224VGcVZitLbKVwF/UynlVc
 c+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vYqXd79+V8jayTOkJhsqghC4+xfdJz7wmyDIIc9y5K8=;
 b=jvRXwMQyuNZSyvwIgYPMvXNxa1RqkyKG+jSs13oAiV7x6g+Hw3F9cCw/EXUHY6ZDD3
 sB9fW/PJqJGt4iTdztjC5Kc1o3okmwqu6r1kKdn+/+ZMztIbyXX/7SA+daXB/F1jczDN
 5fk+zQPMi319rlYIPefGnKHzoh6DEA8YSSt4dSoZREGLj0rYXPIInasnbfVuz4j8XP+T
 JBLiBLbK4GYz+9uKB3UHJ6RUwpZamt5J4v4HhbaxNMsejY9BQu31VC+gxYnmn5Oq+0fD
 QIH4YhA1rk824xgFY9VgdawclH8tYs4uFZivqs/TcNMwd/O0jZ2GAI4RzmkLX0yhZYhw
 XmFw==
X-Gm-Message-State: AJIora+UHXOBoMstt7z6wj3DaoHYELObBxCiIAXvrWvMymAXIKFS35DQ
 72NJrE5WidysQjmf2l3+xc9vOg==
X-Received: by 2002:a17:902:d502:b0:16a:797c:cfb1 with SMTP id
 b2-20020a170902d50200b0016a797ccfb1mr1765573plg.137.1656370425843; 
 Mon, 27 Jun 2022 15:53:45 -0700 (PDT)
Received: from [192.168.123.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 ip11-20020a17090b314b00b001ec84b0f199sm83181pjb.1.2022.06.27.15.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 15:53:45 -0700 (PDT)
Message-ID: <a1467ccb-e0a8-b908-dfa6-08ead6aa3633@linaro.org>
Date: Tue, 28 Jun 2022 04:23:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/arm: Fix qemu-system-arm handling of LPAE block
 descriptors for highmem
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: He Zhe <zhe.he@windriver.com>
References: <20220627134620.3190252-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220627134620.3190252-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-TUID: Qnw2UlQ7U1d4

On 6/27/22 19:16, Peter Maydell wrote:
> In commit 39a1fd25287f5d we fixed a bug in the handling of LPAE block
> descriptors where we weren't correctly zeroing out some RES0 bits.
> However this fix has a bug because the calculation of the mask is
> done at the wrong width: in
>    descaddr &= ~(page_size - 1);
> page_size is a target_ulong, so in the 'qemu-system-arm' binary it is
> only 32 bits, and the effect is that we always zero out the top 32
> bits of the calculated address.  Fix the calculation by forcing the
> mask to be calculated with the same type as descaddr.
> 
> This only affects 32-bit CPUs which support LPAE (e.g. cortex-a15)
> when used on board models which put RAM or devices above the 4GB
> mark and when the 'qemu-system-arm' executable is being used.
> It was also masked in 7.0 by the main bug reported in
> https://gitlab.com/qemu-project/qemu/-/issues/1078 where the
> virt board incorrectly does not enable 'highmem' for 32-bit CPUs.
> 
> The workaround is to use 'qemu-system-aarch64' with the same
> command line.
> 
> Reported-by: He Zhe <zhe.he@windriver.com>
> Fixes: 39a1fd25287f5de
> ("target/arm: Fix handling of LPAE block descriptors")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/ptw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index da478104f05..e71fc1f4293 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1257,7 +1257,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>            * clear the lower bits here before ORing in the low vaddr bits.
>            */
>           page_size = (1ULL << ((stride * (4 - level)) + 3));
> -        descaddr &= ~(page_size - 1);
> +        descaddr &= ~(hwaddr)(page_size - 1);
>           descaddr |= (address & (page_size - 1));
>           /* Extract attributes from the descriptor */
>           attrs = extract64(descriptor, 2, 10)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
