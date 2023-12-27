Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1208028ejc;
        Wed, 27 Dec 2023 14:59:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7kzbciZrz3qSftILeI5KkIeUmQdkTFH+zPpj71Mper+hRmd7Z+gHo6CFujtIkolD23TIA
X-Received: by 2002:a05:620a:1088:b0:781:3ef2:cc01 with SMTP id g8-20020a05620a108800b007813ef2cc01mr7839759qkk.5.1703717959558;
        Wed, 27 Dec 2023 14:59:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703717959; cv=none;
        d=google.com; s=arc-20160816;
        b=YKUvutujMCjawsPWV5rSZtSpxg7nfcXDDTJcEHAcLdpkqWGjYkXYeAy9P+58nTR4lM
         pusA/uwLxB9uKphqEFks7b2UFm3qZo2duzGkds/PCM6X8gLVaIdKqRJo+hvOtVmMYlXt
         6YtV7mXR8RB0KCs6XRLyB2bj2C98drj+JeoAITFl31vrKirRXTbIPKmt2trKbliBFpIc
         H4JZwfermB8sKhW8X0t3GlZLOzer0A+1e0DO+U1VXXHFAM5F2xk+8UOspYynQlK67wAh
         tgnAtySOIcvNndSzkKboe83+/xggHUAZraxJ+bzx9SUa7KI3OOuujw36Q1d9c+gwQary
         jbjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=WtfvLzPdSxebpaFJhGM4BSGPry9jCoomPU6OoNI/jIw=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=efdww3NCim1sPZUMRXLXKMfvjKkhor/n7vYd+5NRUAdlQFllCHiG4XMkcmhO2pebpW
         R5tmYCMAB8TPQ8fwCdnQDZHu+YM4uKQ0fXeEMil3TF3Yyw4RkeTz4bZle1ImlJDeAEWZ
         CHLVO+dvD91nKX+hfesK3Rr9Kh3YXUS9e45OFbbkIlT2vtCuu2PnWntH6FDMhUiiQTab
         as7ZSuSlT37VV/rt0iKkZf3aiEOTlwlcNq6XRg+If5fuwldIkjuF/WDr9+HH1rG2oznr
         qbOwe+lGw5Zrsd41/EC53AHwH46qUiXBzZsvlEsFCc0f3CT5l8LuIFRzBIpBcpUnpKCg
         Dh+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CDZcd1Of;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14-20020a05620a0d8e00b007756dfea0ccsi16368647qkl.90.2023.12.27.14.59.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 14:59:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CDZcd1Of;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIcrq-0004XX-Mg; Wed, 27 Dec 2023 17:59:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcrm-0004XD-MR
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 17:59:11 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcrj-0003o4-8H
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 17:59:10 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1d3e2972f65so14979285ad.3
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 14:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703717946; x=1704322746; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WtfvLzPdSxebpaFJhGM4BSGPry9jCoomPU6OoNI/jIw=;
 b=CDZcd1OfSmLGF5nVUwl3TFfpqV4ZbngqvD+bNUMI5AnktvBoQ5ah/cW+Et7DfkEG+z
 6LdHl1ghmHBrMcbqZcW/xkRGr4cBmMduoLEEO5xDuNyj5gqVC+iPz6g10PKKVTWJTtf3
 Knzv6jIEfcJ9F4886kRhOYpkGahrFZ19vRxlip/6m1QSoZCQdCoB0+uNu451a1BB19DS
 7hxZYVpPQQpL7AyLzg0hHpnnSXlkwpw6pGvXAu0JCi2ofAPXq3rDbyYJBPR4cG2rK1kL
 lIbI2JpUvE/qcwqk+GWdASiRXpm/8zW2o8An2JxQ0/gK8ok9mIQFski4lL6zWUlodKag
 PbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703717946; x=1704322746;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WtfvLzPdSxebpaFJhGM4BSGPry9jCoomPU6OoNI/jIw=;
 b=XJZEAfH/EPx2Xz1kvasMwNBPEzERAN2u/4dpCdYtcZZdMT+av/xMrx3dhSnDNWSV+V
 0kWQMaVAXGLLlD/IDu+V3/bLpAo/R30pUapj9VAFNW4ODTMmai7qRNJY4CNAaIkM22rL
 HPY7isJXBT47sbxEoONZKmfF5G/LQli8X5jxQUk2ed4QTKAFcod8YYxXjwqhNeD1gHWi
 ghGY8M2bko4jcDT58DE7VZ9K/rbvo/eRtbE7nQk445jkkuHZtWcYoFb13F4lgWaEMw6+
 ERB++x13iATt/tYHCAVRkhf9LgZPsrM/HjsVULLr71Gj93zUJehV/SePxXllB77h6bOg
 47cQ==
X-Gm-Message-State: AOJu0Yy0CjfjrJsDOMwpL7dc5VTsWnXOD1aRewtnIRk9ySiTf4yww1kP
 8FkvyovHlaBrHcu8GTFQMpLPwHVtmT+Z2MJtZZBHsjdQs8vTJg==
X-Received: by 2002:a17:903:2983:b0:1d4:5282:f26a with SMTP id
 lm3-20020a170903298300b001d45282f26amr3096636plb.118.1703717945893; 
 Wed, 27 Dec 2023 14:59:05 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a170902e88c00b001d06df5c1absm12529753plg.86.2023.12.27.14.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 14:59:05 -0800 (PST)
Message-ID: <937f38a2-440f-483a-8b4c-7346838aa618@linaro.org>
Date: Thu, 28 Dec 2023 09:59:02 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/35] target/arm: Add FEAT_NV to max, neoverse-n2,
 neoverse-v1 CPUs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: 2kLXwS0t80O7

On 12/18/23 22:32, Peter Maydell wrote:
> Enable FEAT_NV on the 'max' CPU, and stop filtering it out for the
> Neoverse N2 and Neoverse V1 CPUs.  We continue to downgrade FEAT_NV2
> support to FEAT_NV for the latter two CPU types.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/system/arm/emulation.rst | 1 +
>   target/arm/cpu.c              | 8 +++++---
>   target/arm/tcg/cpu64.c        | 1 +
>   3 files changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
