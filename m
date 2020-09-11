Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp349213lfq;
        Fri, 11 Sep 2020 15:47:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSAIIFUUNJUh1GH3WHrNO4ox+qC0lK5btHN+t709tVfDWKKIOT8SigSG05pcOxzaBTEwSv
X-Received: by 2002:a25:81cb:: with SMTP id n11mr5940717ybm.490.1599864461150;
        Fri, 11 Sep 2020 15:47:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599864461; cv=none;
        d=google.com; s=arc-20160816;
        b=Z6GmGQIUToxkM/cxKGb9XX3JRuP1f7sVNYrg9OzXOnzNNxZBvvM6XiSlol82SR1Ldt
         pU/FR/xlzAsQWBv9utMwboP7olGYoq6pK9Ku71CdOhGyt7f/rIwS2ChyMniQGoMTWx8b
         tEz8YJ1ckWfAKO89SiR+AVecLDnMVVngt5Noyg2JUxWCA/SCc73qwYgK4DYFbDPLrxyL
         TDoRS1CkV0+4bmm+BJ8dGhvZDsp3sRD6httS6bU/+Hl4YN0U62C4KjH8Hfjq5WlsQZJY
         emY4DkR/eEtx7qJEpmKIYo6ACCaaPDXPZ/OcDPblrnrl0+gBh99J6pC5bw1+toLbmjTc
         WaYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=V6WaJlTZUc6e/j6lXXyh92+LR+6Qs2Lu7woOTUQ8szE=;
        b=cOdwsEdIrUMr3NC2DFjQDvnSkR/aYR2pJr8IawgCQwaqdq7e67akiq9Nf017GGQU14
         I2oifz+eqcbS8DIX7LKk4n80oeBIuPdkQsyjAap490j3eTCg69h79bPthGT6kXZqQPYF
         3kXpVP1ddMpkYB3Z10lnm8NMX8pxO5af9kru0ACyUhw/uapVb3O+CVeZsMSD21LV9oRy
         hUTcmG8CvsRfyd2Buhx4Rq2HjoWGTi0l0jl/NXFhYmaU6Xh0Jhoz+WNBGjaCDFAuHZ3m
         1hPcO2fzDMWm3Lj37gW3+jvj7supgCTSW1Tb8iYs9646h+9iX6Kt6kHeGUktsYAPScRv
         sqrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yq6VJMGo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19si3108066ybj.18.2020.09.11.15.47.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 15:47:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yq6VJMGo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGrpU-000423-IB
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 18:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGrpE-00040C-LW
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 18:47:24 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:35742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGrpD-00011W-1v
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 18:47:24 -0400
Received: by mail-pg1-x541.google.com with SMTP id g29so7588517pgl.2
 for <qemu-arm@nongnu.org>; Fri, 11 Sep 2020 15:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V6WaJlTZUc6e/j6lXXyh92+LR+6Qs2Lu7woOTUQ8szE=;
 b=Yq6VJMGobB30S2Nf6/+1Ege5Fd1MnhYxC2l6yxjhA+wv/qH1o6lPV4mfxirsnbGbNN
 WYDvU9+NxmoByLZvlm5+vUAZdgDErlVlWGIC6bwG8ZGb7oRhD/G+7AEmvR5XXPFHCQol
 WgaJ/OS7GynvTBvgwXowyyo4fcAixtjzgztLjkZiOziW2Pgex63tg272puy59/WmInxi
 QPGX4a5EjxX5IkAFFib0lXDGyi7otOw6ZSJ80ijWqSa0cFQUdhV1WPf8b8dXwNcEFx6T
 1DXHYKEaYcJ2NT34KLjdVOV74D0w6z4vCbJIvfniOGOcF/F3dYva9f+pmoe/vWA7wbM7
 ux7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V6WaJlTZUc6e/j6lXXyh92+LR+6Qs2Lu7woOTUQ8szE=;
 b=XLsLZCenRXqxY7uUmVVgbsGmDmGiMN9iUbFvzI6wVpZ+TEY2yiWT8u6cibatwSSniW
 ehIfn/9CP/YN5SU2Cy4hDe6U0GvKcVUADVkYHrPrs+l/UZyz6ojSJ4F1XGby3iWRjDcb
 +rAkxxKJ2iZ3piIFVau3hC9pcAFkQPF62gLYk5MWxW7MsQJyaFvSzdflsM9T4G6iYNjj
 9Xn/g3I/O+9Q5lXZZwXQ8KV2RyHIWW+M71T+PPrQbKd3BlJ1K+SCIgzAj4BjEWxSuhA7
 6dukPU+KY6OPsyKNZsprARQWxmq0eGoyM/whVcw8wLYDBUsc/FEDxAKBHU1qv6PpJbRm
 dOXA==
X-Gm-Message-State: AOAM532D3LRv0+F4XdMFlAo9ZnDWmDfB77Lv+1MM+8/jaHnK0dWvoyEa
 +wJSoXxG92tN9CagbqZXV7E5tw==
X-Received: by 2002:a62:52ce:0:b029:13e:50c8:499b with SMTP id
 g197-20020a6252ce0000b029013e50c8499bmr4106208pfb.14.1599864441322; 
 Fri, 11 Sep 2020 15:47:21 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id v5sm3183153pfv.199.2020.09.11.15.47.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 15:47:20 -0700 (PDT)
Subject: Re: [PATCH v5 6/7] hw/misc/mps2-scc: Use the LED device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200910205429.727766-1-f4bug@amsat.org>
 <20200910205429.727766-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d337ce10-a7f3-671a-46c6-5201b004ad6d@linaro.org>
Date: Fri, 11 Sep 2020 15:47:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910205429.727766-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.469,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0TO122svet24

On 9/10/20 1:54 PM, Philippe Mathieu-Daudé wrote:
> Per the 'ARM MPS2 and MPS2+ FPGA Prototyping Boards Technical
> Reference Manual' (100112_0200_07_en):
> 
>   2.1  Overview of the MPS2 and MPS2+ hardware
> 
>        The MPS2 and MPS2+ FPGA Prototyping Boards contain the
>        following components and interfaces:
> 
>        * User switches and user LEDs:
> 
>          - Two green LEDs and two push buttons that connect to
>            the FPGA.
>          - Eight green LEDs and one 8-way dip switch that connect
>            to the MCC.
> 
> Add the 8 LEDs connected to the MCC.
> 
> This remplaces the 'mps2_scc_leds' trace events by the generic
> 'led_set_intensity' event.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

