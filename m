Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4881871lfb;
        Tue, 17 Nov 2020 11:13:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwk6cMfs/hp4AAIUs62JH0W3gETw2c34S57ocCsw+RgHMk4qiw2JMfcQn/Lfb5lhm+1FGaQ
X-Received: by 2002:a25:3281:: with SMTP id y123mr1905126yby.467.1605640437502;
        Tue, 17 Nov 2020 11:13:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605640437; cv=none;
        d=google.com; s=arc-20160816;
        b=TWs3vtzcmqjE/N/wshN7b3eI9oXDaJNryipupfaO36927X0wAdZNS8ZLsHXvRAlGck
         xQuWVOIuQ0aUzyEVItcTXiPpU5OJfy5DAQjnaH7qbZwxiDtjyLRVCSk21jvHgiZZQoAG
         F2/z0eJqMTpd3uyqP/giaijtU+kK8juNIDVDQq0nddD8zStYXUof2O2U/xWaGu4RfaaW
         PUK5ds9mr/Elln5TYoVaLfmMenOgIrPzEO3n71bHzLVIsQ4Wyyl343y+HRhzfbf9V5K+
         QvBCEoXMCdfAJYlfZkxdEQQ2iwAc45icgBbYOVrCeEN9Zld9QV7YDGS5MvswO6fXI9cL
         z3gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MjVn+fo4ZmvONEERM7jkwbaqBmcWHw8AO/SWg/VJg5E=;
        b=TVLkw9U/uXqYEGgrbVDRBdlIASN0qtFEks+iOvG6dVRKYJl9Mw0MpuwKIyrBl3xHGZ
         jOpz+Peew6JLprbod+xSgPUDg6v7MAHRtoZdTBlH5A7tuC6h+GIVCkmwcYKnVmg4jblW
         Cfw5smOcRUSL2xGsrE1aPXHBHz/BWdUyAJM7H2kHCJmDk3WHg7JyOOFqKvghmU6yCdzh
         Dg9yPJuS9noJCj7aopf0pfg6k96wlj4Jw6p4keaz7ukX2wLdD4sjzxQ4/YxhymY5P4oH
         VbxQEl7wE5ttE96RrPChmMOdLjZJS4xhnL3CuEKQwEiLj8YfGM97C9pzuOemqc/XcvIR
         TChw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oKLyTYBG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13si23562003ybb.128.2020.11.17.11.13.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2020 11:13:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oKLyTYBG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kf6QO-0001JE-U7
	for alex.bennee@linaro.org; Tue, 17 Nov 2020 14:13:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6P2-0000S5-6U
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 14:12:32 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:43387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6Ox-0007LQ-Hi
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 14:12:31 -0500
Received: by mail-pf1-x441.google.com with SMTP id i8so4210606pfk.10
 for <qemu-arm@nongnu.org>; Tue, 17 Nov 2020 11:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=MjVn+fo4ZmvONEERM7jkwbaqBmcWHw8AO/SWg/VJg5E=;
 b=oKLyTYBG4UYixeBoDeP0LwE5wZc7qZFIrQ8BVolUr4uuteeI9chKG0DnqAkpLtQF1Q
 UTDYlbpmEkvCOiXX8V2oHpEEmaRrq3m5b9gVESGD7cmYCZ39dWepzeKLBetaisynj6bY
 JTNC0hLdQurBu3qf3C0A05JOE+9s/VDQHRCWa23PS2shjMHG0piR7A1eynKDEM31ddgz
 3pLN9EKAz69KtOHkANvVBabbrRR8OX7cVejpHU1GJUJLN83Tfd7qXSLTqeZhIRBZps63
 U6R+orQ2a5hYEhB0hrA2wTLROxoeHugBsvQrz2SqQ8k/34PXs5fFpQt+VjM4oi6GiJhO
 GdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MjVn+fo4ZmvONEERM7jkwbaqBmcWHw8AO/SWg/VJg5E=;
 b=oKGis5k8RAg4Xis75m3O0ZCrfpsk9doF/G7iEz/exhPL8Bff5AL0CSszbr4957tIe1
 W1TwSjQuUFDrGL1exI9YSmQ9jl9/sAV5A6b2nko0QhC7j+ZxCUmKqzUuk8y9gOhMst0H
 cCroKFseZnTL03ne7WMdGTACErfKhQkxSTG6u6wpRbksCNc6dBs6fx5k9y0NCul55vtz
 xQxVm7Z1wBUZ5t5iGNt3u3dN77BBezsWQRoD0V2eIxhOLeFbTkKT+lbTeXqBGHQMPQXx
 B7N6TC1n0Zb7B3X7oV1uG+R79uJCeOHEZDG2AUVievoaBOb+vEJHgunrkDw2lrLplm17
 xatw==
X-Gm-Message-State: AOAM5333nIbykMuvI5L0TK4m7TDY2Y8NH8tHVAj33aitL3p765p5I5Rs
 4AMlN8owqiMlA+J5ru/slo16iQ==
X-Received: by 2002:aa7:981a:0:b029:18b:490f:77d9 with SMTP id
 e26-20020aa7981a0000b029018b490f77d9mr782229pfl.46.1605640345773; 
 Tue, 17 Nov 2020 11:12:25 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id d68sm376655pfd.32.2020.11.17.11.12.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:12:25 -0800 (PST)
Subject: Re: [PATCH 03/15] target/arm: Don't clobber ID_PFR1.Security on
 M-profile cores
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201116160831.31000-1-peter.maydell@linaro.org>
 <20201116160831.31000-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <75fe1394-e68f-a3f1-1240-298114243cd3@linaro.org>
Date: Tue, 17 Nov 2020 11:12:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116160831.31000-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ri7zid3XGkdp

On 11/16/20 8:08 AM, Peter Maydell wrote:
> In arm_cpu_realizefn() we check whether the board code disabled EL3
> via the has_el3 CPU object property, which we create if the CPU
> starts with the ARM_FEATURE_EL3 feature bit.  If it is disabled, then
> we turn off ARM_FEATURE_EL3 and also zero out the relevant fields in
> the ID_PFR1 and ID_AA64PFR0 registers.
> 
> This codepath was incorrectly being taken for M-profile CPUs, which
> do not have an EL3 and don't set ARM_FEATURE_EL3, but which may have
> the M-profile Security extension and so should have non-zero values
> in the ID_PFR1.Security field.
> 
> Restrict the handling of the feature flag to A/R-profile cores.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

