Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4477915ejb;
        Mon, 6 Feb 2023 10:58:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/MqYt9CQkXqyeAWs2s0cAUkLnWNyOYOE3jyPURegznhHKD3W2Auhhnrcq2EAj7JNLbTomS
X-Received: by 2002:a05:622a:1995:b0:3b8:6d74:234a with SMTP id u21-20020a05622a199500b003b86d74234amr852178qtc.2.1675709886681;
        Mon, 06 Feb 2023 10:58:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675709886; cv=none;
        d=google.com; s=arc-20160816;
        b=IWd4xrGefSuJMygQFb4UuXKQjDnh25NCBnSb+wxgZ489XRD+TnIqLJgI0WS8vDd2sC
         TEIjfdug6DdMFNzaqDy5lEzbT3Cs7po8o/d4P4gcYZPTrE7AB6BIzGWc7G9OP42nTQoY
         pYU8H7zwN3ZN4EpLH5Z7thZtmHulFIk+P8ZdxwKzUriOlP0rSmRBEVB9Y8Tvuz9y7OZz
         okfthJERWSPqh5rDLUmxO/p+tdOvjdV4yKto6kyxkveekI524d/wQYLrxH5rTq36ZjpY
         RLLCs99rnWqjXIGr7zKFyH39Mng/x/L7PMYm8+eLPgWWzDznJzJvv2fvX2X8qoS9u1hT
         zrFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fkid5CyfGq/kNr+S1VVUqa/YmCt0u0b2MJ9buGyJAUM=;
        b=YvEEs0J+e/Q77VdmRGxtaMXQ/ZmVlikRrKvaKoj8e/cMF7PO0xpiaZv21Q9tXk7491
         PqUFZ7hynQIhUObzGrh4mlh3Nynh6uZFDi1G3/Igp5uvB1PKE8kRqMH5VIfQ/p0L4yw6
         amKAfEIc7GgF1ux9jUiEkMO+6vqzm58I56pRgf1x+t9BIqevpS99UwyBGHiDyWsHiY6P
         oIs7M6WMJS8pt6GStMpXqTC7JL4DKA4H7gT2FiwAgUp2VqZGO/CU4N8mxCa3Imb5dKnN
         CxCz/5UdR6oyhE+x1hZLfnQcTEfuDMVec/XyrrBn0Uu3kcpg8kHNoA5wcLkRKDVwzzfN
         QEOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yrYXAe5h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2-20020ae9dd02000000b00706999a2a82si7903488qkf.554.2023.02.06.10.58.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 10:58:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yrYXAe5h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pP6gI-0006Re-9d; Mon, 06 Feb 2023 13:57:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6gC-0006OQ-Nk
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 13:57:32 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6gB-0006Ki-8N
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 13:57:28 -0500
Received: by mail-pf1-x433.google.com with SMTP id a5so6085150pfv.10
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 10:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fkid5CyfGq/kNr+S1VVUqa/YmCt0u0b2MJ9buGyJAUM=;
 b=yrYXAe5hXpqT9QMcuLoi/ahVgyAKDdXFkhfqEpIukxzzXrY/itP7Zs7Gw505SJLzJs
 Lx2Rj0k9VXIxJj5q7LkzgTC4/NOVSgJue4es7FF7jqMkKK1hc2Sbi0sRg15cQ0V9EE+P
 HMAudyE6uvw1NqxEg03QgxsRD+tX2fDItVF1S0QiUiF4IcCE+nTPVeJLEfHCDgjVq2sb
 YnmSbhtKfEJG2tuHmq/JTKjnmXrQFO+K2XDfkciT+sKl9SThakkEWfjSucNxe+iQfHjo
 5s181satupTBbVKED2+dWpmwg0irKu4TVvERaE4A8o12HdNbponr4dRJam6tvL0+HEmO
 yuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fkid5CyfGq/kNr+S1VVUqa/YmCt0u0b2MJ9buGyJAUM=;
 b=wGkcsP9hebO64cmZLLBPlOzPRztf4+RAJ8wEZyUwHMy0x7O1p0m5lW0ZYio+aMwkYm
 bzBzwvigscjC/8avBNUyRDO94E4KdJk0VfMvX5gC40epwPui+ieocfpibrfUpWNOjjoC
 cdlquVhyIY0eERePMdh3dMLAZ7l2Xri4zYD7BvfBIOkskMOhIQV2NwGQABcvkYMnvF+S
 MZbCbA/+b6YIR8UqRkWujEWUm0xLcqTbhDhSMoftyTQ29/PurFQ13kxHlBs6AeK4Hi+N
 bj2/nAa2fUZgiLsc74SdC3kWbp3w93TXopxi9EdN1izQQCL+l26K76h4cv1E2lXPcYbw
 eaew==
X-Gm-Message-State: AO0yUKULWBWFylunaoN4MYu2X6frVQOqCbuK74yfgTfIdijbEsTgbc11
 ssiRSMlIl5qCyAEMcOaKtaLJeQ==
X-Received: by 2002:a62:648c:0:b0:593:b309:aa55 with SMTP id
 y134-20020a62648c000000b00593b309aa55mr371741pfb.28.1675709845632; 
 Mon, 06 Feb 2023 10:57:25 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 g4-20020aa78744000000b00582579cb0e0sm7435787pfo.129.2023.02.06.10.57.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 10:57:25 -0800 (PST)
Message-ID: <888efe85-b495-41c6-742e-70e9a0a5dfe1@linaro.org>
Date: Mon, 6 Feb 2023 08:57:22 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 6/9] target/arm: Restrict CPUARMState::nvic to sysemu and
 store as NVICState*
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
 <20230206121714.85084-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206121714.85084-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: QzWqdqmGF8SA

On 2/6/23 02:17, Philippe Mathieu-Daudé wrote:
> There is no point in using a void pointer to access the NVIC.
> Use the real type to avoid casting it while debugging.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

This is doing several things at once.  The nvic interface change needn't be done 
simultaneously.


r~
