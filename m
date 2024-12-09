Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2875501njb;
        Mon, 9 Dec 2024 12:54:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWSEuddgdWwVG/9H6ERQLSVWrlQEBCCzC3i4i6xY1n+jqSN9oaZb/kei3WqKMgTDDKUuSqerqAP15cgkA==@linaro.org
X-Google-Smtp-Source: AGHT+IFFYAwWCyYg4dCIN27cG5Vf3g5tueU6XTlaRTRwFkWw0UNWLhfLhzIKaINhi6V496mC68gP
X-Received: by 2002:a05:6214:20e8:b0:6d8:9832:75d0 with SMTP id 6a1803df08f44-6d91e3747a5mr29590296d6.17.1733777666538;
        Mon, 09 Dec 2024 12:54:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733777666; cv=none;
        d=google.com; s=arc-20240605;
        b=dMrekllItv6UyK/NCZMd7VgmKd4i6K55xNKRLSGuAGOuLogvP+P7Q2e8hJNUSpQ5xb
         L66dPGyOffHTx7ZaOi3QVs7hzaDBp/Sy28+FMjghPAeO847d0+Dh2EsJ5qSGOjtFdRY1
         YhvNL3ydph3ukSDGAYiVrJn7WX9i8OMKLe9/qQ8f0l/4mHy26DrvIhXV+RWzlOVBtVvE
         pwL9bfnfZibQP5znbBJxBtkkw//wBRdnX+reZBc10mrio/8T+9si40DkC4akfYgdW2LN
         miG7HpgXr27Ok5DzFG1CWUOkF/UOUY1hQv9XgtvbV5t8/R/VX06DwMl5cEkjhFBSfzZ1
         GuMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=l8OZJVPf1eR/P41c1vpif+GjHJOS8hkL9Hr9jdSU3/0=;
        fh=ye13+Niv7ihKA1NMc2Fkr4hctlJ4Z/+xreJ2Vv+NikE=;
        b=hxungn5GNcmKa5tH/hynKqf9CngR9TGxD7PJzSeq3N80z7+qWobtTRDbUFcUhKSmKT
         6SpKdcvMIXBbG/PE7W3HlMjcNTHVKbMZVGXETFf0jksavBfORBmcFvYmmcmNXW/hTUcB
         aTJ/K/Cw7ALq9A5XKez8E6ytTiIk4yUGX73r0JreCdqW4HjIEs69BJuhjsWaZ9l4wkxR
         L3NfQWE95gtciYJvzbZ9zCHHcO1IB+O2MiwzYVhcCaK8fVyauHj4rCindUCUi9exanNe
         UaYwSbIQMTaRoaSzGZDfALqkXTLw95pulcrvVM7ZYO/oCrsmt138zOe+kLYvoO5Cm/pf
         pgTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zHTNuiP7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8da67f909si122845886d6.20.2024.12.09.12.54.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2024 12:54:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zHTNuiP7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tKklg-0005YS-Kx; Mon, 09 Dec 2024 15:54:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tKkla-0005Xq-A9
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 15:54:06 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tKklY-0004nO-R2
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 15:54:06 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3862d16b4f5so1987427f8f.0
 for <qemu-arm@nongnu.org>; Mon, 09 Dec 2024 12:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733777643; x=1734382443; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l8OZJVPf1eR/P41c1vpif+GjHJOS8hkL9Hr9jdSU3/0=;
 b=zHTNuiP79K0qu1XSfgj9TK4CFtEN9Uk+2cGKMNeYZs0jMQQtVrXIC5uB/Ft1UYtI5N
 7UH85BmYoenkfG2uXF/4/h3KHcBAiwEVYMSJLW3B5nzHqsddA8UEkuXEpWcHGQq3kF7h
 MqqlNRBGoF8aJIp7lTSOTmczjotv0jsQGhfh0/kLVTf1dZsMlL7LP+dgNvPFM3PF7qxj
 IcbPWFQrtvldhJ/trsY8iPHA6Z+rBtHN1+fRTGIL/BWEZNq1Abi8s2+Si2MCDfXixomU
 q6fxqb2/1Z+b26Ldhe1RPr582uW2O5wJPJ1ZN9mS4vLq4B3OGuW3uVRYtr6n2Uo0F8Wz
 Nwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733777643; x=1734382443;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l8OZJVPf1eR/P41c1vpif+GjHJOS8hkL9Hr9jdSU3/0=;
 b=lDGuMzSgSYU1aoIeRmtRbR0QiHW0OHWQmeEswSlzwBXjFBGdp/ggX5FQ9GaSwcj8Dv
 /o0iolWru9raFQuS3p/y8mE16lqtBF+AMHA4L1ew1ev/t3M/LOSRDbeSFw17eOpB0EOY
 +ECXexebIuXG18v2oVsFYputLFMeIDmvHMXgCoIH2XRzwJLhQNyxCI3I0OKarrQMTUyp
 FuGk7TXS9zi//KToOTkoQKdpzxIB/6m6AUfyftSuzSF6Ofl2af/vGCjv9ez/bhuP26n7
 R0HTElc17in8lS6pFaqE5vFiN2jQMlVMnsrzhn2ylUQJZwXqec1AE2pgkaQoXxPe3fyp
 A0zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVofD0CDgCCzE1D+CBt+nPwvmyJFykR2Pbs7/I1qYVgSLYO1q23VVYgUfOsl8elSKPjeRYsqYjEUw==@nongnu.org
X-Gm-Message-State: AOJu0Yzi8ll0UzROACl7hkYQ2QErtAL8IBM9ou5KDiMFyXcp4AfkASwV
 DD6nT+uRE5IFQxIW3Rl63HYVoggrk/3uUXpH/s/RwvpaKnIfG3MOUNnc2jJZL9m6RfMBxNlPZ/A
 l
X-Gm-Gg: ASbGncuBD400WL+fnl17ahT2ln8uMAwgPNtnOSD/83GOo/Vea/KWdqhj7cEOFjM9GCj
 tG37B9NEG2DX+Ju24/D/L6VB4o323JCwaibaBFHqsDs7/KxkYrFX+ddtKoTxyHE0/Egb+7MCBl4
 nlrZYuVM0G8rwIfXj1fdoecgMeAIu6vC+oBrBkSfgi1AB3udbLcqcF6SjCUD/8a+Ry2oh1SQtMw
 +poAprZEebMXJ7ffdTBBouEF2HHuwr2P69yasDUWvMAsxt8rehaa0KsSMlLxS6QpdjvGPujxKZw
 kQBAGEo4qTq92mbF2PaHRbNn8ddjtaXT
X-Received: by 2002:a05:6000:178e:b0:385:f7e5:de88 with SMTP id
 ffacd0b85a97d-386469a0b15mr579423f8f.3.1733777642869; 
 Mon, 09 Dec 2024 12:54:02 -0800 (PST)
Received: from [192.168.1.17] (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr.
 [83.193.250.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38621909644sm14375777f8f.76.2024.12.09.12.54.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 12:54:02 -0800 (PST)
Message-ID: <3d0d87b8-d86f-4411-b1dd-7e825ec237e4@linaro.org>
Date: Mon, 9 Dec 2024 21:54:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] i386/hvf: Print hex pairs for each opcode byte in
 decode error
To: phil@philjordan.eu, qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
References: <20241209203629.74436-1-phil@philjordan.eu>
 <20241209203629.74436-10-phil@philjordan.eu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241209203629.74436-10-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: QPe1ylSagWWX

On 9/12/24 21:36, phil@philjordan.eu wrote:
> From: Phil Dennis-Jordan <phil@philjordan.eu>
> 
> Printing a sequence of bytes as hex with leading zeroes omitted just looks odd.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> 
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> ---
>   target/i386/hvf/x86_decode.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/i386/hvf/x86_decode.c b/target/i386/hvf/x86_decode.c
> index 6c7cfc820f..f8d37f2d53 100644
> --- a/target/i386/hvf/x86_decode.c
> +++ b/target/i386/hvf/x86_decode.c
> @@ -30,7 +30,7 @@ static void decode_invalid(CPUX86State *env, struct x86_decode *decode)
>   {
>       printf("%llx: failed to decode instruction ", env->eip);
>       for (int i = 0; i < decode->opcode_len; i++) {
> -        printf("%x ", decode->opcode[i]);
> +        printf("%02x ", decode->opcode[i]);
>       }
>       printf("\n");

Maybe we should use monitor_printf() here?

>       VM_PANIC("decoder failed\n");

