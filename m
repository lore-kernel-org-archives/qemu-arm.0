Received: by 2002:ac2:5bdb:0:0:0:0:0 with SMTP id u27csp517551lfn;
        Sun, 24 Oct 2021 14:21:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpy8y2WCSP2UrHk3I6XZXpEpFl1chvGW+/np/Q0GMl9DUfos0tyotgc25htZeuSJfbcwv5
X-Received: by 2002:a05:6808:191c:: with SMTP id bf28mr19479646oib.7.1635110508841;
        Sun, 24 Oct 2021 14:21:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635110508; cv=none;
        d=google.com; s=arc-20160816;
        b=ArUydtsAgAhTJ7S6MUbt9i3k0RMTxrK/h8sw+7gfWvY1B0ThAlQsRVtgWBs2H3nFjO
         /b6WCGzOuzRmuGweDiy/WAdWkyfgRcyphK4zmI+ZAoyZntjxqqVrnEhIOHS8P3Jm7jm6
         yBoh2slmmK7calJliKpxCOavtuvY6JEUsSAUvhxWaUBVU5bk0d0aZVpgMzTzI25SOVfV
         d3dVsk1fUpzDSE+hNuBA77gsWJ2gZbVwR2KbxeHyOLzvXcBOD1ksgpFv3uhc4j9d3VTw
         8i1bCj2kYqEV+j9RwK9nQuPqap8SrpxTimetu1c0/G4ZmydIpHli1SH85xg0FtR7La5X
         uV8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=68aAhMsMY8w0dcksqtjZDFdGc1GcY213y/9L15lshfU=;
        b=k9R/ebtIZtzNvC6BSDFbwQojR95W6vL4JfpGHKCorgPBOEnCuWEA8xDzwIS9XL8tcq
         Et8cXkiMZVBsyE6ZMCd/SYKM0r8erxadBERCQEtrv5OoGskpfL+CwJocXqp9alz7fovY
         BtOcKJti86LgHApKF4YfBje7cIlwVIX2MQ//BI2sQeDltol45M5gItErnCBtDfh+zaAh
         NslXVy3bbdmNn7OHKjdO+P8CkhEJ0sq19sV/MlxFVo2osJ/zISSPI1fJGOj4ZS3XNxGx
         j9+fRwl+N879+LFc7oq0MLly87Jhgo+fbLXPpH/eYjkK+cug3ecoTU2Wd3usDYcUsfc9
         k/pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ug/hOcMX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l16si17649789oii.81.2021.10.24.14.21.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Oct 2021 14:21:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ug/hOcMX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mekw8-0000HQ-2F
	for alex.bennee@linaro.org; Sun, 24 Oct 2021 17:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mekuS-0006OA-D0
 for qemu-arm@nongnu.org; Sun, 24 Oct 2021 17:20:04 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:36698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mekuQ-0007OB-JU
 for qemu-arm@nongnu.org; Sun, 24 Oct 2021 17:20:04 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 v1-20020a17090a088100b001a21156830bso3361097pjc.1
 for <qemu-arm@nongnu.org>; Sun, 24 Oct 2021 14:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=68aAhMsMY8w0dcksqtjZDFdGc1GcY213y/9L15lshfU=;
 b=ug/hOcMXzyC6uRk591yt+i48eHKI4WC8fDWze8bpZxokTs1JyGItZ+XWPD4V+hDBYK
 dELg7kadd9jzPqhLdoNUkm8yDWZBU56+BvG7NY1KUAo6OKGL4WzTOICwJOmh605HXbdZ
 npUJkB2M3qkgyG6iEdUTiIHFBqVncsztKFsqaICv/KgEfDZx5Hvp5o850cbX3hVl7f86
 ACDD1Jxi7fTF8xgsDX2zTQjywoxZmqAT+9RRiJ/QY9KzBE47KZV7arIoHvE9Hm9aSh5z
 D+eo1kPlJcDziStYX8UI3n+WN33qBLa9KOnGLnrdGl2NVvOA4zMonJoVSwAaisw1LU8R
 /SVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=68aAhMsMY8w0dcksqtjZDFdGc1GcY213y/9L15lshfU=;
 b=5AWi2bNvSodNqlr/503dzcK2t2wJW8E/454cdsQrIWONARIWMk755vYZMHPk5Bd85y
 LbI6co5vBtaYzo5JFFK8R2mErXY9TG7M1WH0ZiMd+Ev0KpGN0y4Py82tIsog3ZZXaM8o
 ZZrD5jKqOg/Ot61mbReb6SXwAdcN7h62nhUomcWNu1Tlpt4sPEQfHBtKrrgRAAGSmvAi
 DJNp6VSZ34t3erB/agI1Guy18ivAn83JGWCit7TChW3/AAQ4fmKQERR7CtdT7pUOPjPy
 /vFc4HVEiZ0r0Nnp7KUrrKshFUZQ0j5drH6JrW5wrFct7t7TDrBJEpjnfT8QJ3CvS91L
 xVgA==
X-Gm-Message-State: AOAM531S4u6DjCOqn3uLYtoC7BTwiqLjT0ei8pxqx+ku70XLZ0bu0M0F
 6ICAchhSAkSjKkPMznMSUikXUQ==
X-Received: by 2002:a17:90a:191c:: with SMTP id
 28mr15794887pjg.121.1635110401445; 
 Sun, 24 Oct 2021 14:20:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k19sm5703342pff.195.2021.10.24.14.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 14:20:00 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/alpha: Use tcg_constant_i64() in gen_call_pal()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211024161619.325903-1-f4bug@amsat.org>
 <20211024161619.325903-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2abbdc9d-bd42-e3cf-0045-ee8c4a094ad9@linaro.org>
Date: Sun, 24 Oct 2021 14:19:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211024161619.325903-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.33,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AqPjSQDmGa5Y

On 10/24/21 9:16 AM, Philippe Mathieu-Daudé wrote:
> Avoid using a TCG temporary by moving the flag and
> exception address to the constant pool.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/alpha/translate.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
