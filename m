Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1448846lfm;
        Sat, 20 Jun 2020 04:50:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7vDfH+onNaXEsrJngpOr+lq0eZUNHT7iLvVoDlF+lJ41VITdFNXsufdolYVB63ZmDW2x1
X-Received: by 2002:a25:328b:: with SMTP id y133mr13696970yby.468.1592653829443;
        Sat, 20 Jun 2020 04:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592653829; cv=none;
        d=google.com; s=arc-20160816;
        b=eF1PQuGwoL7CHWVR5r64EZ9UAYjXooDhBfK3H3UVGjZ3+pKjp9BqDsi5a0Ujd/qLhm
         Vh8IgqWcezlFZmBiu6oubhzNy5fdVa6ji1IbpStu6BrE+4LQJz+OYWPQ+OQm73ykZF7v
         1jE1twfGc+V1mqc4fpg+H++F7aTp3RdRu9pb95eDcJI4ZoZlELqNoq6ipeo7Y+2Nws2O
         hYftyTDNniKbclzoqg9sA6co3M9p4gK2AGqCtrYNRmbfeCVrpFX5Pllobcu9R6wJiXL0
         KGWM/QNEt0gXBOmeQRhObh03QFnpW9M9BTPTmMr9jvXwB4K81mWNAyMPsgxG4RWTbugA
         WKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Ux4mfRTVWMcxBrf6xo9T8Z0qwZxSRgdeAbPuTScn+R0=;
        b=U3Ho872+D46U+RPZ6aGFGLe0fqTFvf8Nb3CvUsjzrEmuMwsgFI73KAkp9CcMPKAIHh
         mSeBuY7w0upmDrUNwQWnAPqfwSZNvHt/+KmNcstr4RIMXWD4juHT6WNpkjd5ZcxOLtMq
         YlFtCe+1GTf2az94Pst7yMTyzs9NljvXVHco3SViCutais6L+uiRB9V6BoGOdZ94YbdH
         o7nxVhxJPfNxopTrkaJV8EUriKU81yaVpgsqAU4jwbxWhQEh01krkkNWjvVixTLd1trF
         w6j3/ajYbpHntu6gTKmR9vCyT/qdfqSd9BDRSrM+wiPSBS3Y3Zwu879AHd5gHRI1mIaI
         tqPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BmS6nzHK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f186si8129310ybg.303.2020.06.20.04.50.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Jun 2020 04:50:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BmS6nzHK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:46354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmc0y-0006Xu-SW
	for alex.bennee@linaro.org; Sat, 20 Jun 2020 07:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmc0F-0005eS-Ii; Sat, 20 Jun 2020 07:49:43 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmc0D-0004mE-SQ; Sat, 20 Jun 2020 07:49:43 -0400
Received: by mail-wr1-x444.google.com with SMTP id g18so3024578wrm.2;
 Sat, 20 Jun 2020 04:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ux4mfRTVWMcxBrf6xo9T8Z0qwZxSRgdeAbPuTScn+R0=;
 b=BmS6nzHK3ePBVvRzFsUNyViXVHmjo/QPozAY/3qGbTVq/34n1NSfbpBGdB0WKfG/FU
 l9fo7ciDEPuQXrdlaO0bZi/5CTZ1XGszKv9mPSNlZ/c7yD8BDkiSfTH/cRUS0h9EQlru
 YssxjTX8X94ztj7itA/xPnUSoaicy2ksCnM7sAGy3ghNvBuH7qaVqnykGtXSJmVLKXEi
 8YDEhQlGq0Z0BM1xVS3b8AM+bwygOYrh/TnfQvb8uaIklAXMrtspw7kR5E0Q5M8p6hYQ
 15Pryqbt4WAMCVBrHMq6LAE/sWWI3Pq8nfQpQP1YObxzvgB59mSF5khUiPC0oO9c8T5u
 3gEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ux4mfRTVWMcxBrf6xo9T8Z0qwZxSRgdeAbPuTScn+R0=;
 b=t3j7MHUv+DB5Iy5pqEaaEvc1jgSyUFbgG20IoX4c3boDvsFnmrnYczH1TZQyfV18/D
 8QaWdeb7buUkwXPElM+PkZsBve3sTMOW4y++0YRUTU9umQNPUGXyae1CK2KlAKKlzTgu
 Ord1FfC5TlddL+tIFRcuonWVWrmAu9vif3Qywie8DZpGxDokpjrotUBa3nbV8ZN2DtSh
 GU/qqSUqLjOuYMfWJ3Uo3Mtu60CuRR0XNmhsJTmW2+hwtuElM8B4P/3SB+IL8Z0TMrWZ
 7+wREo5sbdzUzOwEDL1xI6qH0XbjiO8/eSBGgzXDXQynu6DUFWIwEXSPzUdcBDMRhPw5
 nyQQ==
X-Gm-Message-State: AOAM531oJLBiwEQr+RD0yQYWIg2e/0v4HkaW2xglZ+lkrrkFWclOkc19
 oUlKldiaqgTbciTFb6X1HPo=
X-Received: by 2002:a5d:4987:: with SMTP id r7mr8722261wrq.316.1592653780003; 
 Sat, 20 Jun 2020 04:49:40 -0700 (PDT)
Received: from [192.168.1.37] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id 14sm1951354wmk.19.2020.06.20.04.49.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Jun 2020 04:49:39 -0700 (PDT)
Subject: Re: [PATCH v3 0/4] hw/misc/pca9552: Trace LED On/Off events
To: qemu-devel@nongnu.org
References: <20200619145101.1637-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <00d75321-7245-ef59-c856-148dbbd101e3@amsat.org>
Date: Sat, 20 Jun 2020 13:49:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200619145101.1637-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2K/c2fLDZxAl

On 6/19/20 4:50 PM, Philippe Mathieu-Daudé wrote:
> This series add trace events to better display LEDs changes.
> This helps me to work on a generic LED device, see:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg711917.html

FYI I'm going to send a v4, using the generic LED device.

> 
> Example when booting an obmc-phosphor-image, we can see the LED #14
> (front-power LED) starting to blink.
> 
> - ASCII LED bar view:
> 
>   $ qemu-system-arm -M witherspoon-bmc -trace pca9552_leds_status
>   19286@1592574170.202791:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [*...............]
>   19286@1592574170.203609:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [**..............]
>   19286@1592574170.204102:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [***.............]
>   19286@1592574170.204415:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [****............]
>   19286@1592574170.204758:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [****.........*..]
>   19286@1592574170.205070:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [****.........**.]
>   19286@1592574170.205380:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [****.........***]
>   19286@1592574235.384845:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [****.........*.*]
>   19286@1592574235.894049:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [****.........***]
>   19286@1592574236.404277:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [****.........*.*]
>   19286@1592574236.914644:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [****.........***]
>   19286@1592574237.424558:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [****.........*.*]
>   19286@1592574237.934580:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [****.........***]
>   19286@1592574238.444688:pca9552_leds_status 0x55dde47807c0 LEDs 0-15 [****.........*.*]
> 
> - Only display LEDs which status changes:
> 
>   $ qemu-system-arm -M witherspoon-bmc -trace pca9552_led_change
>   23367@1592575218.896117:pca9552_led_change 0x557cb6896d80 LED id:0 status: 0 -> 1
>   23367@1592575218.897072:pca9552_led_change 0x557cb6896d80 LED id:1 status: 0 -> 1
>   23367@1592575218.897487:pca9552_led_change 0x557cb6896d80 LED id:2 status: 0 -> 1
>   23367@1592575218.897855:pca9552_led_change 0x557cb6896d80 LED id:3 status: 0 -> 1
>   23367@1592575218.898256:pca9552_led_change 0x557cb6896d80 LED id:13 status: 0 -> 1
>   23367@1592575218.898663:pca9552_led_change 0x557cb6896d80 LED id:14 status: 0 -> 1
>   23367@1592575218.899138:pca9552_led_change 0x557cb6896d80 LED id:15 status: 0 -> 1
>   23367@1592575281.593379:pca9552_led_change 0x557cb6896d80 LED id:14 status: 1 -> 0
>   23367@1592575282.102994:pca9552_led_change 0x557cb6896d80 LED id:14 status: 0 -> 1
>   23367@1592575282.613558:pca9552_led_change 0x557cb6896d80 LED id:14 status: 1 -> 0
>   23367@1592575283.122774:pca9552_led_change 0x557cb6896d80 LED id:14 status: 0 -> 1
> 
> For information about how to test the obmc-phosphor-image, see:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg712911.html
> 
> Supersedes: <20200617064734.26956-1-f4bug@amsat.org>
> 
> Philippe Mathieu-Daudé (4):
>   hw/misc/pca9552: Replace magic value by PCA9552_LED_COUNT definition
>   hw/misc/pca9552: Add a PCA955X_LED_MAX definition
>   hw/misc/pca9552: Trace LED On/Off events
>   hw/misc/pca9552: Trace LED change events
> 
>  include/hw/misc/pca9552.h |  2 ++
>  hw/misc/pca9552.c         | 60 ++++++++++++++++++++++++++++++++++++++-
>  hw/misc/trace-events      |  4 +++
>  3 files changed, 65 insertions(+), 1 deletion(-)
> 
