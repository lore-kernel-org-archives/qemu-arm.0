Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1406987lfo;
        Mon, 7 Mar 2022 03:18:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTh8tQaNNVQPa9SOd7+kL0f+d/dg06jBxy7SY8AyIZObaWkTXYGbm3anARkyuM30ihuPbI
X-Received: by 2002:a25:94a:0:b0:615:7cf4:e2cd with SMTP id u10-20020a25094a000000b006157cf4e2cdmr7633320ybm.227.1646651903703;
        Mon, 07 Mar 2022 03:18:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646651903; cv=none;
        d=google.com; s=arc-20160816;
        b=CP7AOvsSjDEk136tfpZZgz5BqUOUruHmHhurNeiHNA+H95PDtO8EakfyGW1KyuVU9Z
         mOVzjjlnR7SgVof55c9U1pxPFgOHhDBk5fbMA0GHFvpsExjubP62CCw5I1NuD2vz2gIz
         eCnOU8iAAd8YOahTm7FutG7x2E0p2VWH6PHJIGQfCXrF3wN0y6+5Qi9aUaInsh+4lk+u
         +XSUHb3JClX9lqKP56EkH6aKMDe2oY2mliN3JCQCiLP+JKAoEm9TZEONqR/tgEgPG8jk
         awfSBCPqAMduuAIU8HKce2X3wT7S3CjH/DXxVYPIFVhYDCMCAEyTgfHnCxr5pRaCPZxv
         IRhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=smQCX0y8tVWXC/eZ2zKSRCpRhD//Z4oYAKTF0Aj2T2A=;
        b=iHibPlRJq2rExBV0vXGNq9MwXBjBxiy1Eb4tvu/v5ersddM4QpddXmIAbmJxcgYeKF
         f5FAlY27kFkOtLtRR8EZ2+EdsJkjNHglPbo4k0Bjpn6Bsi8o5DGCeSPA6Ma3BnNAfivy
         ahpjtCGn+/DYPEDtHMVMf6Q0ghZsBwyGE8JUZlJs0BmXZj/FyrYv7GG1ivjoiB+kCiZ1
         Ij5fF5rKDneUixlAzDl5asO/aG7YFwr+oFi3jzYunlAudXX3ZeUVq4VDfAdFj6TvmmEs
         pzZN4Fxr7uCYQEmaoc06V4OjQZasHOcxZpWiQgALvsuQu4HVZX9LzWQFwLKdkuHkKEs8
         Z2DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=p13rKXsC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e5-20020a25bc85000000b00628ab6a414esi7820511ybk.533.2022.03.07.03.18.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Mar 2022 03:18:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=p13rKXsC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRBNf-0000Er-53
	for alex.bennee@linaro.org; Mon, 07 Mar 2022 06:18:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAWD-0004wO-Fh; Mon, 07 Mar 2022 05:23:09 -0500
Received: from [2a00:1450:4864:20::433] (port=37769
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAWB-0005xc-Uu; Mon, 07 Mar 2022 05:23:09 -0500
Received: by mail-wr1-x433.google.com with SMTP id q14so6852550wrc.4;
 Mon, 07 Mar 2022 02:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=smQCX0y8tVWXC/eZ2zKSRCpRhD//Z4oYAKTF0Aj2T2A=;
 b=p13rKXsCN+uGlmz5LGdyTb+QeYaWgyWZNpaaQcCfmyNToz878gaeiUkKk2h5HMk/ho
 +0fBt5xB7GRb+fTjste3QY9Iv00+Sx1K9EQD09oDhtwww6rgD6SnKkrYNRU2d6icARnA
 anoKb05LLox5x5Slqm379xxJZcH0jCr8JOU7mvvkzkcvym8NlJLn9H/C6JMgFeNDWzyj
 yda8TswJC44aqzvlXWy/vNHwDEMTJG4fkRej3gtW42hS4YoG5PmzeGhcfGXkdNUsEYQE
 fElEvaZTEDPOTIY+sp0Jo+plB/3BcYSpJopNDRXriQhWiEy7V/MxXmiIVWcPVlZhWGs/
 Qjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=smQCX0y8tVWXC/eZ2zKSRCpRhD//Z4oYAKTF0Aj2T2A=;
 b=d/6UqgMKprPbBFFr3tTZKqvbT8RfX0JC51fdVaNgbsc4sJR1I7tdUYYlqvHVZpe0iM
 hNLgSoXDM7eH7ygCCWF7I8057lLq7+42dUTWWBUa3xkeg7Wg0ANiXRIY0wBEtfZWRP1m
 6tW6bwbymWUGs9KhbVx7T2JKKUnHsZDN1iyQ89lfbph6ZKab2UiR+TsI7dh52jgnWQQ/
 RUpXVcx7j35oBS0NTdk8z1u0S6WDTvzSGqr7WBu7RyoHxwJkEUj0s8Fq2QPuazRCx/q/
 OzSv6CQDLvgzEX741BRSpmvJ7tsCT15kMcnIW/3k7o5Qf8+tAkfdP80eZsWONHgHtDnU
 7hWQ==
X-Gm-Message-State: AOAM533Ca1L/4roi9MbEewzO7eR/uSDMBZoYKXActimKINmaLAUdh6GA
 NwuEk45Jatw6ACmv713+ESY=
X-Received: by 2002:adf:e348:0:b0:1f0:537:1807 with SMTP id
 n8-20020adfe348000000b001f005371807mr8116593wrj.11.1646648586176; 
 Mon, 07 Mar 2022 02:23:06 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a1c4e01000000b003899c8053e1sm10055196wmh.41.2022.03.07.02.23.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 02:23:05 -0800 (PST)
Message-ID: <99e6a412-cb24-c2f9-97a3-b188e345b3e4@gmail.com>
Date: Mon, 7 Mar 2022 11:23:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 6/6] aspeed/smc: Fix error log
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220307071856.1410731-1-clg@kaod.org>
 <20220307071856.1410731-7-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220307071856.1410731-7-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nBn7ZplM/CZz

On 7/3/22 08:18, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/ssi/aspeed_smc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
