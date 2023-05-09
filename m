Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2761078ejq;
        Tue, 9 May 2023 07:27:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Z/eAffccIkN9AIUBU6Vus6sbUedhT1Q3XQDkI91OmfonWroQyfLbeNyAl2+Gd9ui28Bf1
X-Received: by 2002:a05:622a:1aa9:b0:3f3:bae4:5996 with SMTP id s41-20020a05622a1aa900b003f3bae45996mr8080qtc.42.1683642447709;
        Tue, 09 May 2023 07:27:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683642447; cv=none;
        d=google.com; s=arc-20160816;
        b=YFv1hW4xLQ4g0+cYItxeqbJgyJzpXv8AbEZkn0MgRdxLjelwenUcFG7SdhtrEuhD0B
         9T5NppulAovN0Am2YGXA3/mweLR03j/8DdWdlN6WQMxAsHoOz1jW+juKP4tuGpe//K3g
         Zhm7MbS+SVNmLJUW3smj2YFeyMX7PNx8XHcY/96kbgVkfroR5O4zEt8OnSzvRvVKgr8D
         gL86TDLrnAWQZMoY/QVQP+yl3zU7Hs1d6efzdqTRHFNo+qkDsoEornV/p3QuPPYaK0b3
         LcJagnAJT0GPNxq9IudWN6KCTRR9wgDhYm7lVk+AfiGTDPsrW4jxkrLR1Cl70kIAhVml
         93zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=57QG+zDHMepkrmnymVj8E6KY+lrLCZL3UlUw+EW4kkk=;
        b=yicY9GsjQCczRObRfCAj3ijjGlzbg+Y/H2ZVn0Tt63LwNOF1hIFtVi7GUlMSydRBiz
         b+TdEOzr/j3KTv6kqDExSDFblZnNozlQEGf78DNqabF87d31jxRobaxKF8Qfc9XuTAhh
         dcqJ26EKjHzK6/VkyMkUUOQygZ828+pcMZqxlX0PElS3Roc1WfHNxJvUKsAn4SsQvEzL
         wjZeawg8kQuyaukVyLmDhIWRPRrCFkums3FdqY8kCdC07qcMAQY1neczsjSuOtdyu2p5
         3Vyp42/mYa7846Pb/iWE5vKU7brU0RM0LM09n+qvGWKravxg5Irr5vGgBUfia0Ys55fT
         l3nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OKM7fJLn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cz3-20020a05620a36c300b0074df136814dsi3878415qkb.327.2023.05.09.07.27.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 May 2023 07:27:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OKM7fJLn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pwOIw-0002EP-HL; Tue, 09 May 2023 10:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwOIs-00025C-7T
 for qemu-arm@nongnu.org; Tue, 09 May 2023 10:26:58 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwOIp-0005Vy-QE
 for qemu-arm@nongnu.org; Tue, 09 May 2023 10:26:57 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f19ab994ccso59697235e9.2
 for <qemu-arm@nongnu.org>; Tue, 09 May 2023 07:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683642414; x=1686234414;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=57QG+zDHMepkrmnymVj8E6KY+lrLCZL3UlUw+EW4kkk=;
 b=OKM7fJLnQlBOble1NfxvpF4PYISEpar7uGn+qMYPSkkCW/7/zWkkCh54t10KItbff2
 wDOf8BEhQNTxwo5R5RQD8eNgNUzVtiLzysYysTQGQYt7hsPiv0qT5UcESrqMQCbm/g4j
 NENI3Pu2sjD/d4fm6z0L//nlsOGYoN5TtNuysvmwrd94R3aqiZSm/rT7nrBjU7lwYh9K
 EKTIVBNQ/hha132wyXWKKukvnb3umpqSuVFBTKbyeKjwuhoGK1R8scFgPiX5WWuDl1jt
 3IkfFzyrrQp0lj4IivxHu8LjPuJsWJfzlktXcH2K/h7yG0H7nMCYPy1432oDbWRbSJJr
 Z3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683642414; x=1686234414;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=57QG+zDHMepkrmnymVj8E6KY+lrLCZL3UlUw+EW4kkk=;
 b=FDghkwYtlg+k8qwj3RbT33BU24wAhXxOD7Or5nlFpoNMYqpq+WxKTjO8VX8To5RjRv
 Bodl4xVUSKS+7IivxRDF/TrXkL1SZbKxJuApxOyXfq4BzOOs9A6ED1FZkL6zQ5pNZfPc
 +wsrCvfDJA7PdeZ0+0rmpFnA2auVkAIvYJWyZeglgfVSuHFddqmkCYr7FgSHxfNT03iW
 ZwtJIBp9ZqUOc/+kKeSpqbyxp6HNoKCicTgiTb06nDnMTLM5+OlLo1cKHPcGwOv9CQBn
 DGvl1yJwuVQEMhSjR4S66BdLag5Ph5b9YIKWL0eGjPcJr83pfpsVJA8N28J/oALJa06y
 Adpg==
X-Gm-Message-State: AC+VfDyKEaCnvepCjSW63CThMdAzmeQPSDH+obWjtyB91O52SC9nHQdi
 ECJacnm58sVpFVbvG/30qscp4g==
X-Received: by 2002:a1c:7c0a:0:b0:3ef:561d:255d with SMTP id
 x10-20020a1c7c0a000000b003ef561d255dmr8794966wmc.41.1683642413932; 
 Tue, 09 May 2023 07:26:53 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.211.62])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm19988241wmq.26.2023.05.09.07.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 07:26:53 -0700 (PDT)
Message-ID: <47a73c1c-bfbc-752a-c52a-0262b6554a5a@linaro.org>
Date: Tue, 9 May 2023 16:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 0/2] target/arm: Move more files to tcg/
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230504110412.1892411-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230504110412.1892411-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Z8j1NWyh4fHY

On 4/5/23 13:04, Richard Henderson wrote:
> Move 7 files to tcg/.
> 
> r~
> 
> 
> Richard Henderson (2):
>    target/arm: Move translate-a32.h, arm_ldst.h, sve_ldst_internal.h to
>      tcg/
>    target/arm: Move helper-{a64,mve,sme,sve}.h to tcg/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

