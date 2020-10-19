Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4158686lfa;
        Mon, 19 Oct 2020 12:49:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVQ5oNh3Jc13Wd/1roYpj5BT9KWriMcQ1NLLcywmfgOyyw5araddhfnKUel7OHGTY3kFbk
X-Received: by 2002:a25:a3e6:: with SMTP id e93mr1566804ybi.16.1603136970916;
        Mon, 19 Oct 2020 12:49:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603136970; cv=none;
        d=google.com; s=arc-20160816;
        b=XGgpcqxrvRE0iauV6xErwqA8wO/tiVUHUghEhWYvX3PQNuWXObUBNfWR0X3KeVcyvs
         CB/xWyfAzEhdySk250L9zVifJXscsTrh+peXNXJ1uMpdRxPRLPcp5ZJ3cpa9JGVsC9HP
         DP/7sSrMA5X/38HUFPacEwHDHhtK4qdhk7Y1HmC+miAn/pAiW2kenm6HcOxkfn8Z7BjY
         iBcTbcPAEpX5HdmFur+Tn23QFspBOyU2llpe9GVRES9YjZK2ysUdcPaUjjOdNHQ9W7vN
         0J79xnzcavhMp7MM429t3ZXXhS5PLamsLbdTmYTYE0zAgycQZ0vIVXR+6NmrBNGebOq9
         WDTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=T/BX4N3U/uTBPHZUwxR7MkpOR89ogPNmIaKZCbS5gxU=;
        b=lrIiZXItNxJqmbPIBWTu5ZXAA8gmjdqwTL9h8kzbkdu4jAwW+Eumc9W0j000nHJnyZ
         Fn26VirAeK9CX0esO5vuD76JUn0voRZWJqgAgWKKtqNOafAes6MBvvsVTfWpi7tuGxPJ
         ke/S7Sz0ZU/bM0nqwxebOYPcXDdY6hmxRa8AB3CFz3sufCfxaDw/6kV+6SoR0iaYCP4V
         HrKznf2fHyhoLeBcQWhRTLm8XOzXSaULJ9dAqntDCtcS7ElApLZkEyUeEL91vPFh0Oeb
         0wikAUkwsu7J2o0yVXl/gr4LuxDZOKx+yi7a1quj4j2SOqVvcKICFLguGXu/bnpyJ6Eq
         oHxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tWbmwoBs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a67si856962ybi.96.2020.10.19.12.49.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 12:49:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tWbmwoBs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:52684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUb9u-0007AD-AF
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 15:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kUb9l-00079s-Qx; Mon, 19 Oct 2020 15:49:21 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:35608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kUb9k-000795-9C; Mon, 19 Oct 2020 15:49:21 -0400
Received: by mail-wr1-x442.google.com with SMTP id n15so1097575wrq.2;
 Mon, 19 Oct 2020 12:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T/BX4N3U/uTBPHZUwxR7MkpOR89ogPNmIaKZCbS5gxU=;
 b=tWbmwoBs6oPkfV4SoyuahR4zMY64AK7lrZWJbSZehrbxNSl+fyQcUXwR1W2n20HivU
 oUdxCc3SIdPi34p4ovdGUNAYpUtme+B6mWShhLNV3csJfxpa4GT/aB7iddEhlYuSO6gG
 d3DULbHkYQwyNVrqgdsIyP8dLrtK+22vl7Z8Y6fyxiEIE/cbYA6sMqrltyu9B9UtLTrd
 u5GljLlcF2mnKNb9hVA4YSKwT9REQ2zy9e5shgielqDHv8KgyZ+89jZtVk/pQgpNXFcX
 8b8jpeYeTfXDkXevSci/FNsH9apNWfq361eTgnexql3Y7mXo8vFHbHzFRKtMfVtvC01X
 vV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T/BX4N3U/uTBPHZUwxR7MkpOR89ogPNmIaKZCbS5gxU=;
 b=NRcKYWCUu1AkGu2T/CSXkexmUGVnHUuVoz/sVMGk+XW5GX7cOPU6KxXb8B4kXyWQt1
 gAXzEX6CtAw7OoepNQ/RCtp2cRkCEdPOuRIY4QALSvmuEmlG7AnLhvwmLXdloDVS7X2w
 JqGHAQCIJOcJgXAd0OlgGa5ASE515nkRZYjY4FkZPykmQlbDO6V3NAEY0H2HiDXlLs6O
 aIVHZyVPlsxJsx4Yk+opnKVGuzBz8+dLD4MV7kA60R/xZxtItt2omCn7XF6YGACUhhxb
 LbDP0vPLl3PHV/Mt1d5QD0q5TNNBRuQVgyaOYFxUtQVha77MPwrhXCJAkfEGTxtKylNn
 VKxw==
X-Gm-Message-State: AOAM531w8n2ATwGzoiMti2ESndA+8qCfg6U7+woI+YN7IbOvIeYjPET3
 X7VvS+qMl8ajBQ0LOTj/1oE=
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr853706wrj.287.1603136958604; 
 Mon, 19 Oct 2020 12:49:18 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id l5sm973697wrq.14.2020.10.19.12.49.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 12:49:17 -0700 (PDT)
Subject: Re: [PATCH] hw/arm/trace-events: Fix misuse of '0x' prefix with '%d'
 format
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201019190751.24453-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9a5ed759-71a3-27d5-da60-4c1cb26e37fc@amsat.org>
Date: Mon, 19 Oct 2020 21:49:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201019190751.24453-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QU5Ko00JNP4w

On 10/19/20 9:07 PM, Peter Maydell wrote:
> The smmuv3_cmdq_cfgi_ste_range trace event prints decimal values with
> an 0x prefix, which is confusing. We're printing a range of stream IDs
> here, which elsewhere we do in decimal, so use decimal here too and
> just drop the '0x' prefix.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/trace-events | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
