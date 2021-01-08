Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp787709lfq;
        Fri, 8 Jan 2021 12:09:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxz2j6NW/ylSA/k8NJ/qRpzHNe0UgtBg/3A2ENdUVY3qGbH21EX0lGTEY9u5cJo5OMSTcLh
X-Received: by 2002:a25:a527:: with SMTP id h36mr7903237ybi.400.1610136575905;
        Fri, 08 Jan 2021 12:09:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610136575; cv=none;
        d=google.com; s=arc-20160816;
        b=zoHobYDJXUGdZIWjtF+SDX3sC7WgP8RIbeUdBgGiRQPJqHM2ggHYCLM9MqIxE4t02v
         pCMjxwvCkeqcu+MEbwDcxQPhgblVLpH3A0teqX25WCN7QGnKrjZ0PDcwWxdX9ci7blat
         /Jbfuf4zD7dZj3Gh0v6LNq27+SvD+oQFnQOc6+JwgO5YnR1EwTv9TtSwREJBTnDVb8TT
         +pik4fRvUsIOLNzESqQ88Puv7g+smDORfgLt2qpAGaEbWs5qEo3Tlnd7PySCn0rVnUAm
         LbYZjIO2urnQb/nz7ldVmRxuA2ENftSjOyghHVb906A5qpI/vtMNpyowHqeZt83fcAt8
         m6iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=lB68adO6GrIyK320+aTFNTpiiJBBuCJBQZObKpChUMY=;
        b=ZJYjw2YGk8g4ZvLuK3XU5HMSd223DRfbYk7kE2Xu9/MDIPCgbek2bYDfnHLiTtqgIK
         i0erLLxqO2B8+KAL4Uzg7iwANGUTkfbVu/1vmSDh56YQZ1bfUOijbfgNC2tmTH+T0QI/
         1oLKonTtz0icHa82V+X5c2DehSuMev7HsLSChMyGRL3+Pw36f+SViUPQkr/kmebiVHtl
         Ah6sRjhk6Ef8crwApyp0tuTaKLM7fC1v6dfhOmeSo0UH8VFHNLftIVaoSArkDQvc7/n+
         IkR3jfUOAZ6k00D3LcTQ3hWj4vk13qHwiA3IDJoRClHzrdAL9P4sYQjHuZ8GIev/SAuC
         cUKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HQekSAIz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si9863606ybl.171.2021.01.08.12.09.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 12:09:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HQekSAIz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxy4l-0001lG-8J
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 15:09:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxy4d-0001l2-KT
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 15:09:27 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:33546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxy4b-0002Ol-0W
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 15:09:27 -0500
Received: by mail-pg1-x52f.google.com with SMTP id n25so8333598pgb.0
 for <qemu-arm@nongnu.org>; Fri, 08 Jan 2021 12:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lB68adO6GrIyK320+aTFNTpiiJBBuCJBQZObKpChUMY=;
 b=HQekSAIz+3mdrcj378y3SzlysmDaVv4O0JdmdMiFwerukroC0ey4tlcENlhcQaQzEo
 A5/folDv+Z8kav6FvAXB5dc8vGJZqISV9QO3qAxtRh4+DT8DFDXHyAejzXNewCZCTyA9
 gxxOelchZofvUm7Zke+SMJC9FOB3BZscfZK51mY9X75HtVQkghg/lp/JSIRa3JkVhhJI
 e+MvHXtFxgm1GySJHHq8TsAkU2rWaVoakKLoo/bnian8pqLSiioUslzKPsYALm9lSU7t
 MdiePuJYKHsbSBeV/CAOd5rHaD96s8b4xDO17q0DZquijKKdh/Ijshqy1aJ5NxJMhJnU
 VY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lB68adO6GrIyK320+aTFNTpiiJBBuCJBQZObKpChUMY=;
 b=ZeS2PAmB7E+gCtou8GPHZWUNk8xmwf9vzJdlPrVDB7tJ3r8fJRH9Ai1Y/pisakqq8l
 YQaoLwuR9SZJO+7jqqalexnk/yg83adgscsXGoX7iL9Bi/S5D6NC6g5ABperAb7hidOr
 aCnbaWrnlUhkhHBsqbAX7UKt8sMRaO65AqmO4WIgwrgsJXlULtJB29wvniHj/IcqOxM7
 m//PgeOh6K37ZKxc1d7wlvDc6rrbC4nNlU1XAcdcUHC1Jlw+yh3WxnxO+Bd5mAkuli2m
 ucLLzZuKLXg7OOz7GWLPDBsIFll5eBQSYPQUt9+9RCfs+b91oJt3kGJDftnDKNuiBhKT
 NaGw==
X-Gm-Message-State: AOAM533C7tmS8enOBgrkDBprjPPs3z2jc/so4bi9g2+bP9vLQR5UV4Hw
 JoR1DsHV4tydIEQQ1PqoYdJyaw==
X-Received: by 2002:a63:170f:: with SMTP id x15mr8635801pgl.157.1610136563457; 
 Fri, 08 Jan 2021 12:09:23 -0800 (PST)
Received: from [10.25.18.7] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id a131sm10794419pfd.171.2021.01.08.12.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 12:09:22 -0800 (PST)
Subject: Re: [PATCH] target/arm: Don't decode insns in the XScale/iWMMXt space
 as cp insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210108195157.32067-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <93a29bfc-bc4c-b46c-3e8c-9be3ef40356a@linaro.org>
Date: Fri, 8 Jan 2021 10:09:19 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210108195157.32067-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.241,
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
Cc: qemu-stable@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lI1HgKGvmn5J

On 1/8/21 9:51 AM, Peter Maydell wrote:
> In commit cd8be50e58f63413c0 we converted the A32 coprocessor
> insns to decodetree. This accidentally broke XScale/iWMMXt insns,
> because it moved the handling of "cp insns which are handled
> by looking up the cp register in the hashtable" from after the
> call to the legacy disas_xscale_insn() decode to before it,
> with the result that all XScale/iWMMXt insns now UNDEF.
> 
> Update valid_cp() so that it knows that on XScale cp 0 and 1
> are not standard coprocessor instructions; this will cause
> the decodetree trans_ functions to ignore them, so that
> execution will correctly get through to the legacy decode again.
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> With this Guenter's test image now successfully boots
> and shuts down again.
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

