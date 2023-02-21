Received: by 2002:a05:7022:221:b0:5e:6ea8:9f07 with SMTP id 33csp2744416dll;
        Tue, 21 Feb 2023 09:11:42 -0800 (PST)
X-Google-Smtp-Source: AK7set/IUk6WW331p4wutSPz9Ic+d+Ice4pHcThip+LX9oPB2D09puRF+HF9eOVTrow26CQgF1qj
X-Received: by 2002:ac8:7d52:0:b0:3b8:6db0:7565 with SMTP id h18-20020ac87d52000000b003b86db07565mr23551317qtb.11.1676999502023;
        Tue, 21 Feb 2023 09:11:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676999502; cv=none;
        d=google.com; s=arc-20160816;
        b=wl/shGSXxR8IaGhR7rxIE9VU8TeRNrT+RIFZrBOY7KLV9OuWrrNCRx5BLhbyo+uStV
         Stn9SJ5c6038YfVMx5SIUKJwT1OK5YsAR/UgNHeCTxvtr0jS2A1slOB98R6+Cp+ixMgC
         m0OqYISFn3y0u6y7upn+zHy8DMwwF7uUgj7sj4gk/3xJ1sNtgOSxLyT7pzmiU1vekL2K
         OK+2RBl/TcFCPd+B7ZLJu5rVNRF6gKr0uW/amHfC5CHZ7omoLU2Hx0BvzQIbWN2cuvoX
         tG3ym3HMwtDTxrejfa3g2xBHmH1eAqYmXplUZjk4GI33rvv7VLZDQp6v30j96zjXNTVY
         2T0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8SPKI5k/zbVYg1kJLvV1E1dVbiZFoL0Re4U1LDMZw8g=;
        b=D4tkV1VmAENWJqIIXCtIh4+JFyYJzFz0HHLS5FKOStC+PElFE8JMmoOawRSDrfkm37
         c/GFVHnAqMZ5/Bjx7nj4MtX5gDgc+6bjioiVmQJU/cnl6xkFg3YRQfVLUkKkjl4iBsWp
         cbU7MYKeMn2qU+hNgGFDZoryIF1UvEeXg1dP0pyLDnSDOcLeRHdAjZf6rV0xy3R1yeJk
         KoTjOrw2/N16Kehynjzv73RAN6BN9Yv4z+UG24RR1Hu+sKYlNMD8kXvT826kyLdnSBNO
         cN3N30nM3kU1Z3XUfsznCktoHll65X/+jo8SFtRbRjikR0k4Xy77t+CSiN+Lo4aqsrvp
         GwIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j7uxMeyO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e18-20020ac85992000000b003b05130768bsi12683932qte.61.2023.02.21.09.11.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 09:11:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j7uxMeyO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUWAy-0002cu-F0; Tue, 21 Feb 2023 12:11:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUWAu-0002Y2-2a
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 12:11:34 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUWAs-0005pX-EK
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 12:11:31 -0500
Received: by mail-pf1-x42e.google.com with SMTP id s15so1398177pfg.3
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 09:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8SPKI5k/zbVYg1kJLvV1E1dVbiZFoL0Re4U1LDMZw8g=;
 b=j7uxMeyOyMQLXsSprFw9VpLQo4FGpiHRdioG+FlZxKSLy6cRFPjk+7z1O4dRPvGPk3
 SrR1ZkWjfxq6/H2Sde/MrZwU4OWTW9Ap5eztauINX1k3holJm3d+48abhVND6ioWwq3m
 WbN9NhIuC81LlwJrFpql4Y1wc2VcJDrdCoIdPGN93FO1N20PotaE2lv+30YnPMcWyVbL
 eZBpQxkGnKSi2PkfiQGZbrP2xKhGXpfR4gaNjKQd73SRPTq+cInQRy3KOkSiHE5z91T6
 GGxN1A5RRb1WZBLaqQlrGa3UyMocyQ/7YfzQcJYkq4m1oPurwLOQe7+RViOSL/mmfBP/
 lCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8SPKI5k/zbVYg1kJLvV1E1dVbiZFoL0Re4U1LDMZw8g=;
 b=NN6nsrxMPUGhwZ3Ez0/tARv7HUhIpA1eCPxcpltVk4L/v+YCho7xVcTawkL+nQFv6O
 HIcXvkbmQ/8xjpxxmLklpFvEHI9WyL8cx5RMPsRKBm5ncmqCAkzQ1hSNxy7iKwkVjaEb
 lDnakLWm4aDghLe0pccU/D3YWGQaf7tt4hAaYI2sACztTKqJEPWyS7TF1fESwwLDvceo
 liwBZ/XDQ45RH2RWxllVcMX7j7alLdOuDsDkMCmn3jK0Lz1okPGFIloBaypLKgLt8URa
 Oz5h0oozKk8Grj/VQ8DUQ4ETA0/8G4/AzpGQ4S7QyX+qnfjytESL2Lvny0xF/rIJY12P
 7wZw==
X-Gm-Message-State: AO0yUKX3mOnUd+OZUS58xvlJlSA4s3wJpUO4SYidH6reBSkFbo/E72Z0
 p7ql49jhHwirtb3RPUW3e2tXQ1O7LNP3TxR6FT8=
X-Received: by 2002:a62:52d7:0:b0:5a8:4bf8:1752 with SMTP id
 g206-20020a6252d7000000b005a84bf81752mr4591400pfb.32.1676999488748; 
 Tue, 21 Feb 2023 09:11:28 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 s23-20020a62e717000000b005921c46cbadsm3691040pfh.99.2023.02.21.09.11.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 09:11:28 -0800 (PST)
Message-ID: <2d33dd76-0518-3461-199d-a6e94616aba0@linaro.org>
Date: Tue, 21 Feb 2023 07:11:25 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] target/arm: Fix arm_cpu_get_phys_page_attrs_debug for
 m-profile
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230221034122.471707-1-richard.henderson@linaro.org>
 <20230221034122.471707-3-richard.henderson@linaro.org>
 <CAFEAcA8yq_h953pLi+zJ0Ai52ErYyS28YkZP2Mq0L2ZWfEK3FQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8yq_h953pLi+zJ0Ai52ErYyS28YkZP2Mq0L2ZWfEK3FQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: U0Ci2ZIjk1iU

On 2/21/23 06:56, Peter Maydell wrote:
> On Tue, 21 Feb 2023 at 03:42, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> M-profile is not supported by arm_is_secure, so using it as
>> a replacement when bypassing get_phys_addr was incorrect.
> 
> That's pretty non-obvious. I think we should either
> make arm_is_secure() handle M-profile[*], or else have
> it assert if you try to call it for an M-profile CPU.
> 
> [*] i.e.
>    if (arm_feature(env, ARM_FEATURE_M)) {
>        return env->v7m.secure;
>    }
> at the top of the function.
> 
> If we do the latter we wouldn't need the revert in patch 1,
> right? Or do you think regime_is_secure() is a better
> choice of function here anyway?

You're absolutely right that it's surprising, as it surprised me.
I'll re-spin.

r~
