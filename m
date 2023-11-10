Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp1369732ejq;
        Fri, 10 Nov 2023 09:40:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8fVSHnofeF/xkMCqwqWte1pc496Y3QwWo38vbog/RdehSRl0Igu77vPZ11wLkOO4AopQF
X-Received: by 2002:a05:620a:6785:b0:76d:ada0:4c0 with SMTP id rr5-20020a05620a678500b0076dada004c0mr6723397qkn.76.1699638002934;
        Fri, 10 Nov 2023 09:40:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699638002; cv=none;
        d=google.com; s=arc-20160816;
        b=rVgRUQ3OJsPJrqPWrvPICBjKYDp13XGWWWjGXmUv1Ok270VMSYDuepxC74pcGw2iSu
         XHshuDcU5oeqxRb4x0vWUccqUj0U5814gdvOa4EjyoOA8S+uv7OHwuT/O2Ba4Y72GD8m
         P0EVvG97gx6WPT/tH5+8Fw74jzAHzPufCfn7G2kPphZZr1YKSQWTM7Z8E9dSgZV2wjLm
         FUWp9wS0yM0PT0GiupMvVpNdZv1LA+43B6sy+K6sP7fcXpPwe8v8W1SS/gZj4IcAbzWB
         3icNYRrVelHf23kEw/oJECXMB/O/gT/A4b/IpfeUbX/WrN3nFxP/kpj1CG6+dA767DBK
         ZDQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Hv8fPPn//PmhRBA88xam+Q80QI/jxHSgtImXRtKtCZo=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=nZk3lAIyfG4tL1+eMslHXqLxEmHoOz9xUNyVvGxW8SReiA0AaIQJ4XksTTraLjjDBx
         Dmzu2IoN4/Pu1CLF42ZWHdsSRzBxC2rMc3zyv6+joUuLGgOhC0M0OKs2qeVzpzJu65YU
         MydwXxnUdsKKwro+F+ZuW+xREOQ9OMJVfdSNkjJG1LaT8S8XQNdmTQjZ0tKFuUBufaWe
         HZHMBq8KI07r1xvYuXH+8uGm5jlllYuOPjSEQljRTRkgOTKbdqBcRFGP/KEycUSFK2NE
         tpTPmCcEmQkCc3ZmjAO5EI8bXBIRnbF4NaaXNdHvg9fZ04LIm4Je1s97frhMHTJcHpGy
         70KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SBn7xF2Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pr13-20020a05620a86cd00b0076db6af9392si5067326qkn.254.2023.11.10.09.40.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Nov 2023 09:40:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SBn7xF2Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r1VTz-0005ec-If; Fri, 10 Nov 2023 12:39:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r1VTx-0005e7-Ta
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 12:39:49 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r1VTw-0004ua-9V
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 12:39:49 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40906fc54fdso17569885e9.0
 for <qemu-arm@nongnu.org>; Fri, 10 Nov 2023 09:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699637986; x=1700242786; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hv8fPPn//PmhRBA88xam+Q80QI/jxHSgtImXRtKtCZo=;
 b=SBn7xF2Yp69T6F5nc6bCXHHWO/8E8ynAbLA52Ey5AhfqSEOn2QItTBIWUJ3/Xu2vlE
 z7NaGfGoN38XKovIm62xTOST9OVjUs67D2RdqBpxdV36hWbhpu/LOkWnOmubPV8cJ66M
 bCSYYG8mD+nEVvNkNJrFDcfKu0P/2FjzxTrLQ1u5n1rJz5GQhlYVZHmNmWDOanGxvkYe
 qadM/JVqM1lMzFNnXglyjgHsvFZR7+/jzlREJSe4w89d5mZa74vbdUCrleZDgLEqqdW2
 c9d+uyHwgig/KiLNW9bQirwv6ATb9C7el057rpZTwzyLUrMYB9mPtie0Q1QbhIQfssxd
 BhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699637986; x=1700242786;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hv8fPPn//PmhRBA88xam+Q80QI/jxHSgtImXRtKtCZo=;
 b=FNzCZidc4o4Zep/5O6WGJ2L25qgMXyRJnBFeRowGPk2WwTKSjCeNPNEo2DbJi7PiG1
 dlD8xrunUsZARXOkZrpMll/fYpQDkaL3cTEEQg76MHj5V91yS//3BD19UbcByxwj9Mqm
 zvSZ82o5kkXp74qzO+o2w2JkW5+XKYpcbmEMLPMTHxT/dNjvaKuW7AFij5E/fJLqhpDM
 NvXKiPcjJG02ecWqNLcziByWBCsdXTDhmppKI+VYcw/9yB2EUxQfmGOIG6a20i40sCr0
 Bi3qk9wu1tiWa+6s6/IBhyq1VwfdUWe3nH3Ye/mpGzV+DBLnNaWpQfF7NG+12bKpDY3H
 oUxw==
X-Gm-Message-State: AOJu0Yw94EKWhTiTor9au58AgMAk6d5wZbpny6lgZ7Q9Py05cpBvc24z
 7p9O8So25rB6llcDVlWdWCX0kA==
X-Received: by 2002:a05:600c:444a:b0:407:8e85:899f with SMTP id
 v10-20020a05600c444a00b004078e85899fmr48767wmn.16.1699637986484; 
 Fri, 10 Nov 2023 09:39:46 -0800 (PST)
Received: from [192.168.69.115] ([176.187.194.109])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a05600c1c8900b00407752bd834sm5806367wms.1.2023.11.10.09.39.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 09:39:46 -0800 (PST)
Message-ID: <02750def-f4bd-48bc-b3b2-ade4cfa343eb@linaro.org>
Date: Fri, 10 Nov 2023 18:39:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Correct MTE tag checking for reverse-copy MOPS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231110162546.2192512-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231110162546.2192512-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fLPg+sqXyE7h

On 10/11/23 17:25, Peter Maydell wrote:
> When we are doing a FEAT_MOPS copy that must be performed backwards,
> we call mte_mops_probe_rev(), passing it the address of the last byte
> in the region we are probing.  However, allocation_tag_mem_probe()
> wants the address of the first byte to get the tag memory for.
> Because we passed it (ptr, size) we could incorrectly trip the
> allocation_tag_mem_probe() check for "does this access run across to
> the following page", and if that following page happened not to be
> valid then we would assert.
> 
> We know we will always be only dealing with a single page because the
> code that calls mte_mops_probe_rev() ensures that.  We could make
> mte_mops_probe_rev() pass 'ptr - (size - 1)' to
> allocation_tag_mem_probe(), but then we would have to adjust the
> returned 'mem' pointer to get back to the tag RAM for the last byte
> of the region.  It's simpler to just pass in a size of 1 byte,
> because we know that allocation_tag_mem_probe() in pure-probe
> single-page mode doesn't care about the size.
> 
> Fixes: 69c51dc3723b ("target/arm: Implement MTE tag-checking functions for FEAT_MOPS copies")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/mte_helper.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

