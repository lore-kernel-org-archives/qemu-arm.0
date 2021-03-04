Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6554887lfg;
        Thu, 4 Mar 2021 12:24:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYdwPbyll7z3PzX8WPcBqSVR6s88eN8RER/GZ6xjLDKPUTfG0RB/TwHrVocUq+OSZW8oM2
X-Received: by 2002:a6b:e312:: with SMTP id u18mr5040532ioc.58.1614889489862;
        Thu, 04 Mar 2021 12:24:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614889489; cv=none;
        d=google.com; s=arc-20160816;
        b=znkTPcEyDoWMWNjwObn2X1lRNnIUB8qkHpRjCcXf8Z5f+m0tMDu/XkfUx7RARHKfof
         nwyb3R5axOrlxq/C4gC8usgRs1pgaexfFXIruqqGYq0eQU9q7hNhtuzLQtSYKUlRS0Uc
         2YAZD40SQMaqnWsNJYZL60auQZw7vj8ZdR0GN0RkHF1r2wWkiPBlHiZZXeGFaEKFTJ05
         LrwkeGCugNW1t+l0tv8BCSVwDDREDWxvr7mjviopAc9VlOE2+YegvTyEWwpeNFz8G10u
         koZe+BD+8y0tgkO9AzSbgp7aoKyJYSSgLHnrLi9Z2+cEwMEgmQ8NnYEyVWyiocMfLzUk
         ijnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=zOKHIlvMDN79VWQN1n9O8Pn5AFWbwZ3gbEuk3cdOSEE=;
        b=xd34weMoILsG+ZuQDv9GPJdghe8cuwO+/gfWlhJtUeky/sXImMuWdiQw0TSqibF9Ke
         fb0UrQxAV/TFwDCx+1O3YQrcOvrUpsFvTGQ0O/ZjjPtwmQYTUIn7oFW03BsMmnsHzlTN
         a1hA/hk2bteQtdAIt8DL5DpSowNsu8mcWT5rG+aDhHycwHR+a26dnPiZpOyVO+lJYtkE
         OUmxO+7RDUpH1llU82cYb3v9LDOKPmU7nL3YfDM9dB2DeiL0NKx8QpmEF7D1Coo2PoWt
         +2Pr6+OlKSqdy3D3gyRXTUJpE8v8Djz7Xcfsg1zp63uvTy20UeHMdH0D9hkMTlffU/Br
         FU0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HAawGYkE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si119707ilv.110.2021.03.04.12.24.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 12:24:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HAawGYkE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHuWf-0007vn-63
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 15:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuS6-0003mO-52
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 15:20:09 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuS1-0006mP-QH
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 15:20:05 -0500
Received: by mail-pg1-x534.google.com with SMTP id l2so19674762pgb.1
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 12:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=zOKHIlvMDN79VWQN1n9O8Pn5AFWbwZ3gbEuk3cdOSEE=;
 b=HAawGYkEiVzfDxXkHXQOGKkcYLv5UCqZq0fMQxyAJ91qTuKqtVD0/CMDMolaTtchd8
 IIcs5bogy6nLnpDKaBdelxkLld5AA3YZBflsQ6OojJNVrOYshJPMCUnANgyTDP1ivRiW
 /oEQ3ifcpYLm1CWKdegL1Kxn0MSRbR4mqObtH9MiE+Iobblzuc0HbB66+GHn5R6Kj+wN
 iG97M7kdDMxTcloL+37BywK4raOiLM9Y3HQcs5ZStK9Oe1csbwZ1IaLGpsj54RpgwMwZ
 EP+QTNkKENhw0GvP+RBxMdGHXr90plbm1X3DJNeSBd1tTL12rl+zoc0ICW4PWqh/M8eb
 Sc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zOKHIlvMDN79VWQN1n9O8Pn5AFWbwZ3gbEuk3cdOSEE=;
 b=tFppC3u5sWAAwpWuOw8R9DkSQKCTTV8QHMSPU8vhi662QGgoNFLf9yUVJxrczO5qbJ
 2IPd9Aix8rUej5ltFB4OSP+8SjI5g/n3/7b0M0od2bNzGflD/REhYAiLQCBdl+RpBXGE
 J9u4adEjgL95wioccfT0GyqwDHy1IcS1mYqS4RnTW+xsEMOI5bLj+FtaAQyaMDtSu87o
 kVrYaFPzXjzUXU2td5+35wBGGCWkScDwDbakFJmXoBZxUetbL+EfNeVyCe/Y1yMIHO5W
 MK9tPgL9VxuivrMRKyR2448ThTOixN5usyebBXeroBOmTRubxHht/mNF0or8V1UCJ0FT
 ajpg==
X-Gm-Message-State: AOAM533SOIkaT2EsSo6EGXEP3PFVyz3Fn+7uS2iJmujTvmw4D3U+yQ8z
 TToHOp0Qi9QoK7OuxT/OKu4MRQ==
X-Received: by 2002:aa7:947d:0:b029:1ed:a78c:59ea with SMTP id
 t29-20020aa7947d0000b02901eda78c59eamr5331699pfq.36.1614889198424; 
 Thu, 04 Mar 2021 12:19:58 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id g141sm234517pfb.67.2021.03.04.12.19.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:19:57 -0800 (PST)
Subject: Re: [PATCH 27/44] hw/arm/armsse: Move sysinfo register block into
 data-driven framework
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-28-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c63b08e8-b955-3631-36fa-1e8480d36d9e@linaro.org>
Date: Thu, 4 Mar 2021 12:19:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-28-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
X-TUID: hPESEBa9ghUo

On 2/19/21 6:46 AM, Peter Maydell wrote:
> Move the sysinfo register block into the data-driven framework.
> 
> While we are moving the code for configuring this device around,
> regularize on using &error_abortw when setting the integer
> properties: they are all simple DEFINE_PROP_UINT32 properties so the
> setting can never fail.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
