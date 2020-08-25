Received: by 2002:a0c:f381:0:0:0:0:0 with SMTP id i1csp5099764qvk;
        Tue, 25 Aug 2020 12:41:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVIJveD6/pSSiEkNEuZwRcsW+BtSJK0JfX1mNQ04FKP88oWS/QFn+NCKRSz6WMUtl66J6w
X-Received: by 2002:a25:c791:: with SMTP id w139mr16182682ybe.345.1598384315212;
        Tue, 25 Aug 2020 12:38:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598384315; cv=none;
        d=google.com; s=arc-20160816;
        b=SGhbyhxylGnyhAhVuC+bfiqTDfCP3ZZ24Qi/mefh/O4WRtPIp/pFbDLGBw6iU118mQ
         La32iN3m4BSBvex1FH+aS4jZ7JR8wBXKQyUFWDr88MF43mFREJbnjeaCt/rsMgKfawn8
         V9s1kV0Hv5azcfNoWYgs5Tnbv/PtlckjxpaKd3CV3HRRoyVBJHGBlJuLmlnHFJmFpQ5a
         JvuK6QNtIn5Bg6rhEaU7AsFhnL4fcCgQc+4WMhcztGCCGyO4qLpKeVXzckmmkWXxpZfE
         sJCeq2gF4EokLS0a8KOn9Y57TVPxCUzlF656zEZ4VKoK1+AaXwmHi+jr02WW6fI9L0Ke
         499A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=gwUMg//wgrjXwTQ9kMa/PPluoqP399CBrBsdMzkVKAE=;
        b=Gt4fISKAdZDyLNmNqPm0f9MbXiYQMV6oPdCbIsUV/sCsPxVByg8vUCxmjKo8mQwk8/
         IkHcZ/ZwrmU9zJ+h1DnCZA7KTcY5pEXQi/Nc6RJk8hoRvo78EnpZd1AzsL/Z8K22kl0f
         YEBOa1xNYo6ZTgPFqzjSaa5ujmZu9H18vNbubNr3xknPn8JqI+/H3WQ2btQpds3gktst
         RBTeWMrr5MJ8Ld/WxPr94TqKJ1rLrR82/YP3e+4pM2hJ/wW7ja2MA/S85NHSKzosDVRM
         G0dqkf2Yq0CTUSSPg9PgSoki9FjEYlIY0KG/4BpOzT3f/7k4KzWxMa3RZHweaKjZIH3Y
         AP0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JTmkS1Hx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h21si17560806ybj.392.2020.08.25.12.38.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 12:38:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JTmkS1Hx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAemA-0000Az-Lr
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 15:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAeXt-00041r-K3
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 15:23:49 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:37253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAeXs-0006PK-1g
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 15:23:49 -0400
Received: by mail-pf1-x443.google.com with SMTP id x143so11779pfc.4
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 12:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=gwUMg//wgrjXwTQ9kMa/PPluoqP399CBrBsdMzkVKAE=;
 b=JTmkS1Hx9tNj1TOyhiG8OQK/izPhFW9XeKztqLWhP6r8lsoWf+XkVVKNEgK9CP4750
 SYwQdp94GhW12AFh5rPvKk+98B3aQsLVdXmvdtMckE/dLesSdLOIMqr8SXk4tXOjxF/v
 hInaMda2gJBdMldA1j8S8rPpktv8KiBY7zw0Nb6JFUuEwoMbtBw6FQLWTd9in2tAbQYA
 bWETLy8c6g3C4S6F8p4pdFiIoZXvaEleHqFnPXw25WC+cvUzvhaBRHnFfVrmaLYTbFk0
 /OY2g2SQJj5wHNgwNh89dkMZT1hoqj2qxL5y+XgXi1y0rsHCdlfuzP+qOK6jExsFxco/
 b3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gwUMg//wgrjXwTQ9kMa/PPluoqP399CBrBsdMzkVKAE=;
 b=TVAo4kUTQdWI4QMGvpWImOtnqLT5PVAaBwwBhT/WhvAJSlc+JdZgFtJYGSDnYmRery
 Dkgy8GN/EdHnaWxDWtqGcOkSWRFsmErDTiHU5gakcmMwpJzmk4yVfu6OhJuXEcubaSY4
 0V73XpUxVCeDCbnKXHAIi+g7wKJ5k7xurUz6tFOXIlE3qFhQi2+BCzdkmGQC42vrbM4i
 eIaiKhO/ELHZ7ixb1/YdR2nGJMHvgx7Ft9TGhDn1KesBhN+qNjSX9NEZKOMkOZCof+51
 8TiCtVyJtSe2Ly/jpmFLybpI2BU+VEK9bpXpVBQrKWUxKrLFl6JM5DtixJL70YKOoysd
 8zdQ==
X-Gm-Message-State: AOAM530176s8f9xtIxHvzf3QjaY9fKF3K5eotzQUTGMN5O9QJakEEwrk
 RRoC57yBSai9JMVdNDjBOAAC+Q==
X-Received: by 2002:a63:1262:: with SMTP id 34mr7963859pgs.37.1598383426160;
 Tue, 25 Aug 2020 12:23:46 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id p11sm3343pfn.109.2020.08.25.12.23.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 12:23:45 -0700 (PDT)
Subject: Re: [PATCH 19/22] target/arm: Implement new VFP fp16 insn VINS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <863f1d23-1002-ca2b-60fe-2f6e4721ff33@linaro.org>
Date: Tue, 25 Aug 2020 12:23:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: maZkTnqNUczo

On 8/24/20 7:29 AM, Peter Maydell wrote:
> The fp16 extension includes a new instruction VINS, which copies the
> lower 16 bits of a 32-bit source VFP register into the upper 16 bits
> of the destination.  Implement it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/vfp-uncond.decode   |  3 +++
>  target/arm/translate-vfp.c.inc | 28 ++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
