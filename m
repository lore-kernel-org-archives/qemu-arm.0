Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2593895lfm;
        Sun, 21 Jun 2020 13:52:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxdXiqk+AGKmjKxMqXokkx9jR9sH2GeT6tRlCYCgLgxpdPEVHJAp0bX2E6eEzwdCPUB63J
X-Received: by 2002:a25:9904:: with SMTP id z4mr9826764ybn.146.1592772722737;
        Sun, 21 Jun 2020 13:52:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592772722; cv=none;
        d=google.com; s=arc-20160816;
        b=zESfqzBmG51cGJ3RjzxH4XfIxYO8nbddLw6IZXYkUh1abnNJhnDPovMlf3e/78qkJR
         4FT8wXG38X2I7rzmyXwvPLpRTO02GCjhAwHbmgzLo3OPQ690uFfwCQhDW9zdGiAVb9IL
         /NSaCfahUn4kZyPqcDfOnKuX+MkS5VeTgl9iNJP+WEUMlLgRUpyqffN28shnrfuyJOyp
         aYtgQ1kQQCu0BzaB/598efj4Oq9d0OETtMqXR7KwbfnpBcBnO8MUw9/qR0UV75u18TKe
         ewOAjZebPu5koJliDkR5p1v1YhfyRNnaq32wnGFpQ6ZiXcZSD7bsxBnpDwgpOjHiX//I
         o42g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ReEdLYWtUFQwPUqiS4+Glqjc9RbhhprYJb19m5h+BrE=;
        b=I94KSiRmLEFcgrbp+hDxK97Rbmc/KiM1FauRBKSyS62R64dN3mg/3Z2cteSxHR5dVG
         wfl19d5df0IHmhfZcVkQ9vDQrz6rKeQTTIAGBOulBls/ihDYIfvRPAJPtHjolomRL2hP
         Y5DKdMR5cW52f5arazZFj8X7XtnqrTV798m3/A0AAlgir6RofULR8aZ5Zk+VvXXtdWcA
         f2ROl10BIfapN3X2J1T6A7QehmsNYF1raP0Ds4ZYsM461YbatrG9w3wy+iW3uZ5GM0rh
         j93o8RjlA8l61lGCtVWZVDV2kaX1unBP61lpVJB/Tt4w/9H/aA1dYozTOTSNSKXFXMhV
         QwpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Cbpb34el;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s88si14058662ybi.345.2020.06.21.13.52.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jun 2020 13:52:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Cbpb34el;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jn6wc-00051b-5o
	for alex.bennee@linaro.org; Sun, 21 Jun 2020 16:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jn6wV-00051P-9g
 for qemu-arm@nongnu.org; Sun, 21 Jun 2020 16:51:55 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:37167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jn6wT-0003xm-HO
 for qemu-arm@nongnu.org; Sun, 21 Jun 2020 16:51:55 -0400
Received: by mail-pl1-x630.google.com with SMTP id y18so6620804plr.4
 for <qemu-arm@nongnu.org>; Sun, 21 Jun 2020 13:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ReEdLYWtUFQwPUqiS4+Glqjc9RbhhprYJb19m5h+BrE=;
 b=Cbpb34elLV73hSWalJNra77G02OD841MPfYgsyoOXCDbjKOAeFFShEWJKsMpqrsIdP
 p5CLAPLUGCw8amDzWAC5SEBzVf7X9UudjPVTJ1Na9s2LpTrmKS+l2SLTYjGoFwO+/79W
 RlJ4BLP3ZJQEOZYpfCzpGRntCycfFOyMCjrGsqlQ0VIZbwoqWmFyBX66liflfQ4txxIw
 fdBQR71rW0y0JNCTD5xebt9zKhPPBVgsk48YbPrRLSSvW02o1E3it0DfSpCi2Ik64PNM
 Tn1bB3mG5YE219sWMuNgWwhU9qBHmvTUBn3m9U50TPbrUIlhsqZ1s2kqu4+v/ooI6Nns
 hCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ReEdLYWtUFQwPUqiS4+Glqjc9RbhhprYJb19m5h+BrE=;
 b=qoMPWSWBLEYomrdV18NNQfxfajl7NKhz42ROX3gXEwe43JA8A/DW/RM+8gAkEl+u7W
 1uS5Jt//4UFkoV06aM9X/SXUqSC9UK8QFfO6r42LLw9Y+tEmAqtHaQVq/aqf31To8PLj
 FDT3pTrU7GunKRuCDezJqGFtbeCQdnB0p3KTudNz7odw7A7MUwxf1TF5JQ2KhE+cXDs1
 T96x1n/+iEb4/qCUJDZ9Oh3SwfuQmPGnXaR0gQ1OSLeooE9H2YMA+LTh87k6kWQV/Kgi
 MsWH/vO6sz/rmjA6jxUlH4RK+PepnfpADLM0C+9ARKjo2JbzTnOXHyvRwlMB6EREWzs/
 jOwg==
X-Gm-Message-State: AOAM533UuM0UN5N3icB2Vb60uKhp+jAcQ7cbdr5avdUMcSIen1p3USr/
 YKoWl59TdFLWBHjMTx2OySkF+w==
X-Received: by 2002:a17:90a:7062:: with SMTP id
 f89mr10100704pjk.203.1592772712153; 
 Sun, 21 Jun 2020 13:51:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o2sm10861512pjp.53.2020.06.21.13.51.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Jun 2020 13:51:51 -0700 (PDT)
Subject: Re: [PATCH v3 4/7] hw/arm/aspeed: Add the 3 front LEDs drived by the
 PCA9552 #1
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200620230719.32139-1-f4bug@amsat.org>
 <20200620230719.32139-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <55cca662-73f2-4a9f-9de6-0e8d9f1d4890@linaro.org>
Date: Sun, 21 Jun 2020 13:51:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200620230719.32139-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DqYpm1k5Ayu+

On 6/20/20 4:07 PM, Philippe Mathieu-Daudé wrote:
> The Witherspoon has 3 LEDs connected to a PCA9552. Add them.
> The names and reset values are taken from:
> https://github.com/open-power/witherspoon-xml/blob/master/witherspoon.xml
> 
> Example booting obmc-phosphor-image:
> 
>   $ qemu-system-arm -M witherspoon-bmc -trace led_change_intensity
>   1592693373.997015:led_change_intensity LED desc:'front-fault-4' color:green intensity 0x0000 -> 0xffff
>   1592693373.997632:led_change_intensity LED desc:'front-power-3' color:green intensity 0x0000 -> 0xffff
>   1592693373.998239:led_change_intensity LED desc:'front-id-5' color:green intensity 0x0000 -> 0xffff
>   1592693500.291805:led_change_intensity LED desc:'front-power-3' color:green intensity 0xffff -> 0x0000
>   1592693500.312041:led_change_intensity LED desc:'front-power-3' color:green intensity 0x0000 -> 0xffff
>   1592693500.821254:led_change_intensity LED desc:'front-power-3' color:green intensity 0xffff -> 0x0000
>   1592693501.331517:led_change_intensity LED desc:'front-power-3' color:green intensity 0x0000 -> 0xffff
>   1592693501.841367:led_change_intensity LED desc:'front-power-3' color:green intensity 0xffff -> 0x0000
>   1592693502.350839:led_change_intensity LED desc:'front-power-3' color:green intensity 0x0000 -> 0xffff
>   1592693502.861134:led_change_intensity LED desc:'front-power-3' color:green intensity 0xffff -> 0x0000
>   1592693503.371090:led_change_intensity LED desc:'front-power-3' color:green intensity 0x0000 -> 0xffff
> 
> We notice the front-power LED starts to blink.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/aspeed.c | 17 +++++++++++++++++
>  hw/arm/Kconfig  |  1 +
>  2 files changed, 18 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
