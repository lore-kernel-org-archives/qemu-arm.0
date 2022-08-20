Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp62004ejf;
        Fri, 19 Aug 2022 22:20:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR448oRJlqh3vbNFyPSsKBAvQTyZszkwzvMoaRXqxCfL/cqsQcT3K7lsx6plHdRmg0mHGSiK
X-Received: by 2002:a05:622a:90:b0:344:6471:ef13 with SMTP id o16-20020a05622a009000b003446471ef13mr8797005qtw.50.1660972816527;
        Fri, 19 Aug 2022 22:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660972816; cv=none;
        d=google.com; s=arc-20160816;
        b=TzbbBkVLHNoXDIiWTDRc4KSEDHXHuhUcBPVsBT/zGCNFagybqOEoWuIrcm3adtDa8n
         NPdwR2UqMCqC/hWnAXdhJj+N45cK7hlqaU1zFoKllHAMQW2X8qxRxfDDGjzNNN4PiYLz
         MVjhn3YdecWsH9xAgkbLtx6/V+l9PqldvMed9R5Daj5x+3Hv98eBlINSQa2D995KSGwI
         IVLNMbUkqkk9ZjMYrBQu5sIFAmwMwQaTz2V+7wr1vYQxzjaJSrrwthLK1Kys3VaURD9Z
         zjrrEFM+cEg3cbjUVy5iitRnlVuxfAT9e/3BDYdhoNLIoC3+a8XgDvd4u2YYH8UqkP95
         ySxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Gt1LQjHVm6dNUnA0JJYzhr+cF4q8Z4YhDdujLaWT6Is=;
        b=qiylxsJ38ii7RXT4bYuObi4xWMK+fbwZlUY5uZAM2xVmDD60oHo9ABE4c/2OCH9XeD
         /nIHnzEMr7JcdETrXJxspvfEF0yRz7cAm0QecWr1ynWBPqHd3RQSukI9rcMtwwdTyRpb
         NkfBz5IYwpPUX+tKpSw+AVHgDnHY/ouHbAuDVemDX0/H998HaA0NyR3Uzt+8hLHouw+V
         VbYm8G/DUn24DUgEohfweSJebkFXbR+rTzV8nbjr/GSyTJuPL94dFRQmXO7JCBq6Zg4y
         dGg83vBT71250rgze7zS3iCN666cz+CxFN/nJXrpXUZbrt5Rey2IPy+5CniLDRLq8lqy
         aRrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uPlxWW2E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m126-20020a375884000000b006b95ae33f37si2488234qkb.485.2022.08.19.22.20.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Aug 2022 22:20:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uPlxWW2E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oPGu8-0004IF-2Z
	for alex.bennee@linaro.org; Sat, 20 Aug 2022 01:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPGtd-0004HO-0Q
 for qemu-arm@nongnu.org; Sat, 20 Aug 2022 01:19:45 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:43907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPGtb-0003rk-5w
 for qemu-arm@nongnu.org; Sat, 20 Aug 2022 01:19:44 -0400
Received: by mail-pl1-x62c.google.com with SMTP id 20so5676602plo.10
 for <qemu-arm@nongnu.org>; Fri, 19 Aug 2022 22:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Gt1LQjHVm6dNUnA0JJYzhr+cF4q8Z4YhDdujLaWT6Is=;
 b=uPlxWW2Ehzr4GIWWmOfNcBIMsTDsBqXWsVailm0dacC+SUucZJxWlY0Ady1j4I9e/g
 DELqmHiAWtvUWGxgJGmsiEhhMyCKRe0gsDerhuNKj6rQ4at1xrpZoZXQPEQ1BfZshPRU
 OPcWleayjJh4J4X7lzS8aqLaLMQMWfcalnQdCmVLgwQ/5Ixy62HmEPPQA5tBw3WJfxy+
 wieccBuH4TRkCEDSvrxHzHKaYQWPJ3bEOU+sOsLwjxvFEuN6zdPYGFMaITviYZ0iW09i
 UdaB+MYlUDXmFQI4TrlANVAUhSzZDa/vtRbh3IJJsrcXqwI+DatXeXFW2JyOufZsoAeY
 d5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Gt1LQjHVm6dNUnA0JJYzhr+cF4q8Z4YhDdujLaWT6Is=;
 b=e6zgA/W4EDpfx+In6jN8G0J1ha88NXDKP5Bq9AjbaeTgtc2gqjXYlrc4F7eAf0l9QY
 zz//eoc/rByuUgublcTgCaI3ZexYyA0o8ewRRgDY8lAC8wva8s+BRgUpmPJFe4DEE61t
 XaPRSM9OAHdvpD6B3xX+G4JOnVXfBAqcnX3opf9hKTGRldSZ4wDav30ISbjwx0pOonLD
 Mei6Cplpma42ExuqTnu+NDgvZNVOoSOJgVMmKNeSSDLoRmYGW2EqYivne9iMW8UWtckt
 eLQZE7Wn77KkDQUxX42ldmZ8bTsAFdF7wo8mgYsCBiCEAm8UFMtCu5T/djk1mCFB5ziU
 Lwxg==
X-Gm-Message-State: ACgBeo2KiDe0qFBucEsQcryHOr46uM4hAiXoI3xjOMxgk/+DsuDADlpe
 CaVr55djRZgL8P9AfErnWO+Q5Q==
X-Received: by 2002:a17:902:f64d:b0:172:d004:8b2d with SMTP id
 m13-20020a170902f64d00b00172d0048b2dmr1876435plg.14.1660972781179; 
 Fri, 19 Aug 2022 22:19:41 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:b651:a70f:2852:70f5?
 ([2602:47:d49d:ec01:b651:a70f:2852:70f5])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a17090a6b0f00b001fac90ead43sm4043660pjj.29.2022.08.19.22.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 22:19:40 -0700 (PDT)
Message-ID: <eb492ba7-017a-178c-ea9e-1f089d40c421@linaro.org>
Date: Fri, 19 Aug 2022 22:19:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/6] target/arm: Implement ID_DFR1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
 <20220819110052.2942289-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819110052.2942289-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uLWR1qVNEXmK

On 8/19/22 04:00, Peter Maydell wrote:
> In Armv8.6, a new AArch32 ID register ID_DFR1 is defined; implement
> it. We don't have any CPUs with features that they need to advertise
> here yet, but plumbing in the ID register gives it the right name
> when debugging and will help in future when we do add a CPU that
> has non-zero ID_DFR1 fields.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h    | 1 +
>   target/arm/helper.c | 4 ++--
>   target/arm/kvm64.c  | 2 ++
>   3 files changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
