Received: by 2002:a05:7022:43a6:b0:92:a90b:6588 with SMTP id bo38csp339255dlb;
        Tue, 7 Jan 2025 11:29:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXy+dwdGqBlhTASzcHjGRe/H4zJcvD4MFBG/KSoG7hdyE5lVQiEht85p+LRFrf+cDVqovy+fDInbComjA==@linaro.org
X-Google-Smtp-Source: AGHT+IHc6wyTNnZ/f0qbJ9GFDE6jqFQQ1PKPL90zLD/g7J/kMHE4B7QNAIJhDx7+ISdikUG+SxeK
X-Received: by 2002:a05:620a:444d:b0:7b6:e931:45fc with SMTP id af79cd13be357-7b9ba8823efmr9442890585a.59.1736278168281;
        Tue, 07 Jan 2025 11:29:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736278168; cv=none;
        d=google.com; s=arc-20240605;
        b=ZcKhX2RJFQkH48v8YWnMZI0KKoCR2mdP7PdP5EZy89sn98xa+MGS7LhVSTgE0aJHgg
         4uD9sU1+NlMQl+iRzk6mUrHUmsXk1YegLRpjG7HO37j4BLG6/nmc8CdERU/S6hAwPDE1
         RCsgjCxcQXushbab57ZLhTl2gRjlH8e1F327YoHJ9FUA9exo7L6DvUieVo/VzxoxQQ3Z
         jxu3il8XDWbVLwKuAGBqK3rJj4l3WyPYhclhDyMWK0Cx9dNHUrQTGmNpMVuCW9pYuhbX
         aVVBIKUPHM3Hdc06YW1O8q1IZwUWMKJSyt1GS5D2ovCPRrX8a9uAmIzYwXeQm7dOMHXK
         9SzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0JTBG8DEE9pSJJctN6IsBh2WG7ETth1gvgAg+/wJPaw=;
        fh=oce3qQNPdueUZDfOdZ0pjtF1++T9P+yzQAwjqlqHf0Q=;
        b=bnml3Mgug3riARKyrNl1fmswm68OKU8R1ZkThjL7VicA4MTad3JA+/G2XdwXKSU1vJ
         dFgVbdXl25l/hSV04qzqiG1vJOh1NbUGuwDSJgy/LFmRo5t2rCZg9T1IKljoEJ1MICza
         8VE9upmKbQEmfRIIvM7u8SetfzpmKy/JrmELHQXROyI/xsircHzfyw25uTwUeDL4nFW7
         tt2NJOT+QwEtexQed2neAcfwhPrNcQQOVXNtT24fmpz8+ZDg5goRu4XJ27WXEzuPz5Ov
         D32afSp3Aha264jKMckAmdoV0nZ4XgtuJOTX068r5wiLj1e1lr0fMcCu+HXkHuQ1MI4z
         2hkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qs+51WzI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac2ad97esi3587014985a.123.2025.01.07.11.29.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2025 11:29:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qs+51WzI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVFGB-0004c7-UL; Tue, 07 Jan 2025 14:29:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVFG8-0004b0-QG
 for qemu-arm@nongnu.org; Tue, 07 Jan 2025 14:29:01 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVFG7-00083V-E9
 for qemu-arm@nongnu.org; Tue, 07 Jan 2025 14:29:00 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43634b570c1so114497785e9.0
 for <qemu-arm@nongnu.org>; Tue, 07 Jan 2025 11:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736278138; x=1736882938; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0JTBG8DEE9pSJJctN6IsBh2WG7ETth1gvgAg+/wJPaw=;
 b=Qs+51WzIkcaUArs/pqCG+ycVtNuNTk2J3tuLpgdKN/fre7XcsauYN67gD0QHYdxyC5
 vweoQ90YSSZne/IWpGVhV5Y+hFRM63WhzgAlizpGmbMAvR8KMcEOZI8A5cnsWuK1MVbe
 NoLyCmK/S5TGD1FKC9DUyGMYaW3HLc5A9qUFTYopxgI2H/G635F1WC4zrEjePdKSOXsx
 kwM5O3/NW+imKZJUzrhtL0gglmsebUgfdBRFQ1S2Uwvrt0H3UuqBQQc6LIINkgv0n70G
 F7VJwUdWYqC07oE7tF0COwpFdaVaO6uO4L75MzKDZ6vCCU/EVz3J+9LHiRev3ULccyRI
 H/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736278138; x=1736882938;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0JTBG8DEE9pSJJctN6IsBh2WG7ETth1gvgAg+/wJPaw=;
 b=eDp2vYhy2/Jl3j2cTw1Q6V4ka/g3fBJgfATQfyFIkufIVAfO6MjXWOvbMXjwwG1vRz
 gEXFxX5wqFedS/zKA8xcTfBNyDUt8mnlaMktPFx/oGOc+5oqKfKMuqPmRERpsbegEOBU
 kInGPfThMzUkEK5WjIyjuufYG2kA1K6JL1SPJGsSEBJew4RVuOgCJuhhCzQo2sOXIE9K
 NupTVYtSvFC8gwf5u1EBNqeKBvNlNf3SGgGch34ZG/m5ND2+WtTzXvS69eUYySZcGcAc
 QFYSHElEPfhSOxnw6IPb5x/c6ziwZu5ik6VV84yU1d++do/nyA4dG/8KMskwavHVcsFi
 aVFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUDfJIg2skLtxAjdY7Gm2Gp1ncbeHng5thxuHIsHpd83ckB/vmiC8pkazUmYaHMw+KwK5UKi3uWQ==@nongnu.org
X-Gm-Message-State: AOJu0YzSIvzLqNc5Jrq4l8ZMNa963CssNY0LLGNix2cnhCj/GZObJ0wc
 3LI0R/8BLYJS09lh2cidB6ZDeZP71PF0bohyZbMBoDY8R7NWNAM1DUPDYds9uZA=
X-Gm-Gg: ASbGnct28Gchr2DA5Q3BdQI5V6NVrYTRF0VFKcOeMqsDYYed7Mhuv9cUOIv8L3r4d4K
 qqZJcD0odMBWAUlzkTn4/o1rZKfJ/Aj2BrozTlTxrk/jUFmZimo5raV3FTgBe/5EwLDjp+6W5hy
 6VPboGM68xVhXqRMCFuzXIvqE702Y7olA88frLXU6Z5twKQ5Jf2sAIJwZ6NDk+OiOnUv5N7tdnR
 jg8WpSRh2OFIRTTRJB1b4SNRzXnoC1m20gy5qe2DSHZ2lQrqr6LIxpqRkoYo92lQLnZS3gUkEuf
 zdE+Ledk4M97jp5aU0bjHImx
X-Received: by 2002:a5d:598f:0:b0:386:424e:32d5 with SMTP id
 ffacd0b85a97d-38a221ea939mr54805325f8f.14.1736278136393; 
 Tue, 07 Jan 2025 11:28:56 -0800 (PST)
Received: from [192.168.69.132] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8acadcsm50576763f8f.105.2025.01.07.11.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 11:28:55 -0800 (PST)
Message-ID: <52b6eb4d-b863-4938-ad27-03f6978c84b9@linaro.org>
Date: Tue, 7 Jan 2025 20:28:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] hw/sd/sdhci: Fix coding style
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Bin Meng <bmeng.cn@gmail.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:SD (Secure Card)" <qemu-block@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
References: <20241114094839.4128404-1-jamin_lin@aspeedtech.com>
 <20241114094839.4128404-2-jamin_lin@aspeedtech.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241114094839.4128404-2-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 8vF8Fpgdq4G8

On 14/11/24 10:48, Jamin Lin wrote:
> Fix coding style issues from checkpatch.pl
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Reviewed-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/sd/sdhci.c | 64 +++++++++++++++++++++++++++++++++------------------
>   1 file changed, 42 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

