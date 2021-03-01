Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3267121lfg;
        Sun, 28 Feb 2021 21:10:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcA7U8AyS0zpp5ZLkXP0baU+VkGu3TI/ivYOQ32Px8MDTGcvdTyGmDJBEKpYAolDu/ga79
X-Received: by 2002:a05:6902:727:: with SMTP id l7mr11969708ybt.184.1614575423077;
        Sun, 28 Feb 2021 21:10:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614575423; cv=none;
        d=google.com; s=arc-20160816;
        b=JgvkPjufqWxLHDT4JhsmEspL0q2YNWEcWGLJRPDSPkEXKmtfaoVK2rQo8Y6m2vytH6
         ODyEQP4SaEnZsDxbvfIZH1cPjnFr3r/3DBlSUtsBQvtrVYlEQGQ7NrUhSEB1twOzBFV9
         pmgj/FBcIDtbePQ39Y9te63hCLKYpwzGAODiti+kp3a2uqO0qtOB4a5YMhfyYiYgTEtb
         veAGMHG74jxaNsi0k9R5GP1O5xnxvJpR24JyFtYtUSOB8imLsCl7SJpDb3MM31PI6UY8
         OCieg2c6NI8AIbddD76gGU80ydKDJVgWQm/jK7fuucGv5Ga3TcvtRxzAjacOpC7AaesW
         rAlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=oNMgX9PlOgeIdu5IyVoME7R4MOUwSVIYCcN9AJno7Dg=;
        b=vCZPdS8KNAsFIJdk0mG8e5Q8ys9vWPTDu40GIeK78DlSnln7YsG7B+Snl9EZnqTRq5
         odrxjDDxdymPfBggb2PfohBdU1bt/MVpF2bIj+vbk4XE42l6o5gLktmL2U/K6wWddjhj
         ZkL+3ZnRxlu8XB6/PMwSoedeUPNfNjula1fdwbqXQeTFnQJBXBG3AcLpZLI9FDAN59pT
         cCeTKdkeAlhO4FzH2mI3itEE+vhK8T7rBlPw05ceaaURKhJ+EI7i34b1Z6MWgTpI0qO1
         taZcLnhWYgvZjetKl5Fj/5g2KDKEIWBxlximdHBjdpNzJcr2jIzqd1mEIU4XnE1ftcb+
         DvKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VYTNe0By;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p5si17077274ybk.130.2021.02.28.21.10.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Feb 2021 21:10:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VYTNe0By;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGap4-0002y3-Ey
	for alex.bennee@linaro.org; Mon, 01 Mar 2021 00:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGaom-0002xp-NI
 for qemu-arm@nongnu.org; Mon, 01 Mar 2021 00:10:04 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:46529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGaol-0006jl-17
 for qemu-arm@nongnu.org; Mon, 01 Mar 2021 00:10:04 -0500
Received: by mail-pl1-x62d.google.com with SMTP id u11so9109210plg.13
 for <qemu-arm@nongnu.org>; Sun, 28 Feb 2021 21:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oNMgX9PlOgeIdu5IyVoME7R4MOUwSVIYCcN9AJno7Dg=;
 b=VYTNe0Byx/WJkZ65OhikMSFkg5reSfU0IHaRRIuk0oBcdo3UuxSCxrg0I0/tSK54eQ
 OTmo98Sh8ClCpDt1LanjxJHSYiciRNC5NWdX8FeuoOLYSSW9k69OiVlD1WaW7i6IRWPn
 6h6ZFg3+/g1ktqpybP9Z6F7dGT1qPQPVcbiP4rtrbshFOKtjLtBly5LFZtMZqeZ6kcLF
 TqMtNF+FEu4liwhmuq/2mp/qiAaO7T/Pxqoh6trd8IK+REj0u/2GgItd3pJDtU0F/gVz
 zWEIO54KIy30n2O3t+yqKsePHM6q+f82fUhawmXYK4lIGeiEXuhacCqut8jS9iDhndKm
 O0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oNMgX9PlOgeIdu5IyVoME7R4MOUwSVIYCcN9AJno7Dg=;
 b=dFQ8cvQfzGraH9Ysl/z1/oxW2DPI/LkajAvmA1FGH0w7pgvkSPbZGlhlDdBtsUFpJQ
 VTA7bZ8/15Rk+E9bye6WisZH9K0Hc5y9S48flsCHCGbPlygGzjZYP0Mu9UgpAGPlO0aS
 oNs9GzCXELmYN7AjvQgh/OwfihYQlnTTxtNc3xEBSJSXrtd2Oh7v7RqQN7IOibx9izuB
 jjyYqd2e0dW+u+eIvOYdrlQyYjlZwITbmqZM1cx5U0v2E5m0ZRgxHTkkF4icIPYizGND
 P+yENyeJyfiubOphfaGnBB0SPcbUvlmYHYT76R4OzqtasLU+apixl76ELyn2hrO29TaA
 rY4w==
X-Gm-Message-State: AOAM533C1txuiHDy64XgdieIupU5K/65P0KxXJ3oS4uk1NStpVkf/4mG
 MA0M1yxHw2tFL1+GOjeg+Bz+2A==
X-Received: by 2002:a17:902:34a:b029:e4:8b7f:14b8 with SMTP id
 68-20020a170902034ab02900e48b7f14b8mr8420282pld.29.1614575401471; 
 Sun, 28 Feb 2021 21:10:01 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id h6sm15159684pfv.84.2021.02.28.21.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 21:10:01 -0800 (PST)
Subject: Re: [PATCH v2 19/24] hw/arm/mps2-tz: Get armv7m_load_kernel() size
 argument from RAMInfo
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3301e83d-cfcc-e690-a501-c1bf6de7d5c5@linaro.org>
Date: Sun, 28 Feb 2021 21:09:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RZXJo6+a78aF

On 2/15/21 3:51 AM, Peter Maydell wrote:
> The armv7m_load_kernel() function takes a mem_size argument which it
> expects to be the size of the memory region at guest address 0.  (It
> uses this argument only as a limit on how large a raw image file it
> can load at address zero).
> 
> Instead of hardcoding this value, find the RAMInfo corresponding to
> the 0 address and extract its size.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/arm/mps2-tz.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

