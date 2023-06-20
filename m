Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp181951ejt;
        Tue, 20 Jun 2023 03:27:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6/kShSmDL/iEMVCzTxZ8+HNpP8viM9U7wFzLtDkdvwnex6fzgHQm04CzmjWSl2nnP9UQPp
X-Received: by 2002:a05:620a:8ac3:b0:762:4a67:2d79 with SMTP id qv3-20020a05620a8ac300b007624a672d79mr7208092qkn.35.1687256832685;
        Tue, 20 Jun 2023 03:27:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687256832; cv=none;
        d=google.com; s=arc-20160816;
        b=sCVm4l7h/Tlr5fSXO6/zZA32cCgSDwIvUxKIFRgKBLyQjq84Hf338nmSqLiWMOXuzh
         PopEFZnq5ewkI0CUVojptspr82MetkF0AGtM059uahoZ4aew5tncEmfVNlQyE3Scknkw
         FPvexmEHwT9zX1sc2dW5N28uhP8+P/hcYuW+PNvw5UExeKkQWgqxa+WeyX/bHCR4uaqo
         QJau8H41xTx1BQS2YyKEwctllgSzNl8YanzraSIPersSZOsmTgoKnzLRaaUj3WW8LfIu
         hdMTRvb9NEPeG4+vEq74x6BCV5Xq1ZXLc0WKqICuJHC9WnGDAMOs6fFMT6idrVL2fjsH
         KohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=SzJM+6L56YWxbbo4WFyn1FiBlLs7pGHH6BiG4bZ0DJU=;
        b=RW5lte4R87Yz01fV6d/NhxxHRJ588N/wT8sMUmBLUXu9aykFONryfG3hvrNVc2La98
         lIZMc0dW/3AKzO+47Mg3RV/Hg8mBGaH1LcH7WJbi/leYjCeLRu7Ifqne/jx9GBtuJR+T
         0kPz+0kZm61p0fMHo8OM/Wdy8v2HpmWagSfnJ6m0X8SoJh5sRp79XOlK5NTlYD1GWAqL
         4DfvXHGRoRH7OS89c4pC284NaQmZE2ngLJRjWR2f0tVTmRr+rCtZpFmWmd4TliEUC7Ky
         4wR++/jpR5co75TZg0qsM+cIwtLkQiPyywIRGkdj/bOBhpqtib/eIkZvl9AnmcIWamqN
         R27w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iV3oHdAU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q20-20020ae9e414000000b00763b5beda30si212727qkc.655.2023.06.20.03.27.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 03:27:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iV3oHdAU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBYZo-0003Es-TY; Tue, 20 Jun 2023 06:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYZi-00039Y-56
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 06:27:03 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYZf-0001Lv-0R
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 06:27:00 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5189f49c315so4772861a12.2
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 03:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687256817; x=1689848817;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SzJM+6L56YWxbbo4WFyn1FiBlLs7pGHH6BiG4bZ0DJU=;
 b=iV3oHdAUWNbjQqd8kFSmXlO7BmjBLo0kr2/jizcj0T5gUCrYQVEJyFdxE2cNlX9tFV
 P/AmxuRHPurpUmkkkwJPaPMGBEUOKoEPeTUjCEv4MGEabeN3MPQ9JwlS6J3A+bvhjOp9
 nPzlzemVbPYjLOqGfutulUuFhm8snLwMjFLQfByb+4oC/iVudMulMVGQ2IBbVIe6pcGW
 EicLQGn1RW6kz5+iefWXkOEMbAYaTUz+WW4fVDve4tDTvE0uM9tDCPWsmXOar1RPLFnB
 wYeMqT+puMmBdJfiMxL8lupvcU5rN0Cl31gceK3N0uaNcDESyl4jNIZOjWrDkO/RkwYy
 mTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687256817; x=1689848817;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SzJM+6L56YWxbbo4WFyn1FiBlLs7pGHH6BiG4bZ0DJU=;
 b=fDBhWkhvdS73YmAtaouqqhp1mOVOhVXW0jFQZA7XWLgY2fqLCgo+6PfTltMpaHYnCr
 Dc9KCB/gj+IxvcLI0qeaH6IKlShdfYvWrJF88g++e7aXW12Cvu4fNpwNylqDqhGHBloA
 vwufxxISrHcYBBAiwZiUVVEz6rVyX3Y1y3YkdXN56mdEaDhG4pQRaYGBaAi4nTzWFmDj
 jKpbSoM/QNx39lGWuXv7DboVHby7aFwWn9B/JlSBleThkU4tmGa631GK9+pfRhbpAMs5
 n8VmDdj3alDIxtrHheLXJI4YqNMadjQbG+gUJI09rI9/iI4NPtvWl1Jbc8OZ+MqzCiQ1
 KBFQ==
X-Gm-Message-State: AC+VfDxbwfSpXkOhiHdm5DPrrIxFlZ24/OUOTD10AtJ1h7izqNC8GIh4
 RnR1F20tfcP3eosY2GEQ39htgg==
X-Received: by 2002:a05:6402:1b0e:b0:516:81d3:2627 with SMTP id
 by14-20020a0564021b0e00b0051681d32627mr8917980edb.0.1687256817288; 
 Tue, 20 Jun 2023 03:26:57 -0700 (PDT)
Received: from [192.168.69.129] ([176.176.183.29])
 by smtp.gmail.com with ESMTPSA id
 b17-20020aa7d491000000b0051499320435sm924435edr.14.2023.06.20.03.26.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 03:26:56 -0700 (PDT)
Message-ID: <12a093fe-ff65-2c3e-fbe9-3d9fceb0e276@linaro.org>
Date: Tue, 20 Jun 2023 12:26:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 17/34] target/arm/tcg: Extract gvec definitions to
 'helper-gvec.h.inc'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
 <20230619155510.80991-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230619155510.80991-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: XhxAKyd5NaFi

On 6/19/23 17:54, Philippe Mathieu-Daudé wrote:
> helper.h is used by all units, but not all require the generic
> vector definitions. Move them to a new header; the next commit
> will remove it from the common helper.h.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/helper.h              | 380 +------------------------------
>   target/arm/tcg/helper-gvec.h.inc | 378 ++++++++++++++++++++++++++++++
>   2 files changed, 379 insertions(+), 379 deletions(-)
>   create mode 100644 target/arm/tcg/helper-gvec.h.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
