Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp622237lfc;
        Sat, 20 Feb 2021 14:42:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzESgZ8QKQt9CNqjyhRh3Oy7TBisMemUn+bWA29gkjQ6w0RXOoIjyjxjZ5SVExV3H8jxmiI
X-Received: by 2002:a25:e74f:: with SMTP id e76mr22666562ybh.421.1613860951059;
        Sat, 20 Feb 2021 14:42:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613860951; cv=none;
        d=google.com; s=arc-20160816;
        b=eDzIYalTpWUNMUAo12c1rW2yyiOQG27ZFHybFM12PPhIIDfZINa9Kb5lN3CW81cH+6
         QTCq8rGs/Jqz/O6ztYz6UfRetD1VHq8laLTc8dJcYZSxJlYeLsDyDWg9etkH6YehxV4K
         RJ8JoBINS+Gt+IDxDRJB8Q8QxVAQ+6oHMgjec7OmKpk2B8O+EZ+aZ7symIk0A5e9QhW7
         3bgzcWMdztJ8gRrxRyxNBNAMQTyxmPnmIA6H8qIHKJ3ysluSkN8i08Yi1/rZxWlm30no
         /VoO793fEw/kSFgW/KuzRMgmc8v0BIgLCwEjpuHULvz9MGptuw5WtjDdNP501LjTxUzB
         AwJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=CqMqW8sAfPMZWp2XIYiOB0VefZjJ42GTPuMmTsz9xTc=;
        b=mBAyISaNf0ZCvPGzXvwEG15NJcjC2nUatbURYdMVWlYtGu1S5ddZqHrJbqdH+hOeBN
         jlS4A24LEUskG5ArsXd9VTDWcARhmYu26mI+va7+KuN2u2YYCw0a/uscBc+nKfTz2Vvb
         L2Ch11hv+YrxWzN8Fxjl6oUwurX4PL8fXlIdCGrbz54OUon08QZ1xtYfC+8bHvhqac5v
         v6Ns1LRdYwU/lHQuDBs4vzOTRaFG65vhui16uUOlrXi3FOJYrTB/6lWy4UIqiWv48O6u
         bYyu4wRgJ3ZQYs+gQ/Zx+djWwUKfIWsAZ+5wWNuGsrviYVsbEV8gKknXeowyqi7Zpr0V
         Ifqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dua67Buz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13si12613292ybl.422.2021.02.20.14.42.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Feb 2021 14:42:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dua67Buz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lDaxK-0002x3-GK
	for alex.bennee@linaro.org; Sat, 20 Feb 2021 17:42:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDax2-0002vU-Fv
 for qemu-arm@nongnu.org; Sat, 20 Feb 2021 17:42:12 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:39417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDax0-0003LO-Rg
 for qemu-arm@nongnu.org; Sat, 20 Feb 2021 17:42:12 -0500
Received: by mail-pg1-x52b.google.com with SMTP id o63so7735000pgo.6
 for <qemu-arm@nongnu.org>; Sat, 20 Feb 2021 14:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CqMqW8sAfPMZWp2XIYiOB0VefZjJ42GTPuMmTsz9xTc=;
 b=Dua67BuzNmK5nd9Lfq+4b0DP4Hb4Aui011yXHg/zqsJtjrKk8P9/LyceSrbsTkEh4i
 S/97YM5gvZwZh41pM8JNmIIOo3hZ1DYP+SOfb5IDPmh/+dLBkuryZpOSFkQP7QvLpaMH
 G2aS+dnudjL9jRS4penZX9+7akVKUHAUP1bWE1KVhK4MprvzOHCTLN1Hg0Mq5Cxzid5M
 90axrVVJcCXA5g3y1GsDxdGMNP73khggv35Q8Xn3hl3AK/SyQWB5lijAdKOKLg4gKksm
 SFlpyRonEhOxhKtZWEF3QILnU8k8lA0bHBRPhnjEUP8NuNtiBWRfo+iVeml92TQLSdfM
 CG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CqMqW8sAfPMZWp2XIYiOB0VefZjJ42GTPuMmTsz9xTc=;
 b=sJeQcUMMNldnKXsxtJlgmIXKNDirqUVVF5s2GqYHouxpAvVpR99o3RgHhRQJlg1Cf0
 0qBdy2VLSwJbZ09NE+zqSyErEDbOOaOifoo35K/DXEWRFMSslGZqBb42kMD9v+UAa93Z
 ZYfa8aTmeJ4MbkmUNwP6DFqT0pGN80/9dtoFJvIts60c6aUMoynj2cLaEH67c5hth5eR
 OCBQOdVb9z5BQ6nYzfDHUd4jJF1lyN+zsK1w27xCbjhObvTKC56fL516QSxXpHyNuqxY
 zxw/YXxuVV2NRzVcfu3i6LH/a/n8ruZvbEU4gdllb8r4DEPOyMGE6wH/Mk4QNgxTN+/8
 IXDw==
X-Gm-Message-State: AOAM531df3t3dQL9Qgosx/U603RdNT1P/dWFUH3gQT7oecXoQ/9lgCRm
 u8ekAV8rMlYihQC4cPJyFtlWug==
X-Received: by 2002:a63:1f1d:: with SMTP id f29mr14134713pgf.47.1613860929198; 
 Sat, 20 Feb 2021 14:42:09 -0800 (PST)
Received: from [192.168.7.36] (24-113-145-216.wavecable.com. [24.113.145.216])
 by smtp.gmail.com with ESMTPSA id
 gq15sm316071pjb.9.2021.02.20.14.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Feb 2021 14:42:08 -0800 (PST)
Subject: Re: [PATCH v2 01/24] hw/arm/mps2-tz: Make SYSCLK frequency
 board-specific
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2c62837e-8898-e8a8-8080-3a6e65b67a29@linaro.org>
Date: Sat, 20 Feb 2021 14:42:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wm/fTBnCO9yx

On 2/15/21 3:51 AM, Peter Maydell wrote:
> The AN524 has a different SYSCLK frequency from the AN505 and AN521;
> make the SYSCLK frequency a field in the MPS2TZMachineClass rather
> than a compile-time constant so we can support the AN524.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/mps2-tz.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
