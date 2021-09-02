Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1404146lfb;
        Fri, 3 Sep 2021 08:32:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7Z138pjrx+U7tsVV84CCGFKgxCMsubIPxymTDMrW6Ie8qO6BF/rgzGqVwL7V0Y1sr1pCy
X-Received: by 2002:a5d:6ca4:: with SMTP id a4mr4970091wra.140.1630683134166;
        Fri, 03 Sep 2021 08:32:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630683134; cv=none;
        d=google.com; s=arc-20160816;
        b=lzTwzLwJMkI/l7mMHZBOgF4JMHerU891dzEuh6sSQmsB2Z8Olm3RViVu6OrbRNxck0
         RveRtIWxgSAsDroHj6IRV434uWNAumu54HqQOuQTXHuxxzW/UEroGLm9CIPGiGiEIroT
         g2fz6k8cK6dq1QGeKxfzFfEQ0gD4buD9MwVKgI9oOTEyzOpjdX8L+fxS3DLeceJiVpzQ
         k4CMehOYkk1Tj+SUUZ50Z2GA+vZcMxn6w9KlxiDYCuLxeUKkuuhOKoi7xiglRwYwqgHZ
         oCM8XlbyJEsSwnTtfQp2UCr+ecZHKxVEBmPmTgUGX62su0y8odGF9r92oQJgNsntlg+l
         WUYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=kmGB2uDsLJ5hA8HqTM6kNeHg2EsVNKVotuQOdbgU2UE=;
        b=kvacp9CglzmuMyDqRMSr+B8wPr9mOe3gwbx7JyRLBhub+izQVDBx/r0cSQZG60XvJx
         v4F1Lnqwr6zoSfNr2C2ZY+L5VJhx24UzYpBirtlixTncGt5voFN5DMOAawdwYGHdyxMW
         gdoJrhgsqemgYU4y2N5Oa9SUJRP7VTk3A34lYzXL+KnQ6IM9mpOyclCHi9rRIVQpPZ95
         tfXMlciTohaMCL1S+PIQs5tvz57H4xEBjVaoIwaMbXvc6nkdYvHeiGphoN9d8FIV8Mwp
         Zu05NutM5BUlcAqzK7TnHUJdhnSfdehgS7neUbkHmqVlt1+jRWUP1ZWG2I0rjSsJvvTZ
         16ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=DFU55ZOg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2si5459931wmo.6.2021.09.03.08.32.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 08:32:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=DFU55ZOg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMBAr-0004in-5A
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 11:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMB9L-0003K8-Iu; Fri, 03 Sep 2021 11:30:39 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMB9K-0003zI-4d; Fri, 03 Sep 2021 11:30:39 -0400
Received: by mail-wr1-x42d.google.com with SMTP id n5so8745119wro.12;
 Fri, 03 Sep 2021 08:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kmGB2uDsLJ5hA8HqTM6kNeHg2EsVNKVotuQOdbgU2UE=;
 b=DFU55ZOgEZ5O58jOXr2B2OJ5qL+x0ei+/ReAjLmml7+o7xBpQ5eNtpoMgTRdS7fmEJ
 WEeo+GiG5+MpWc9nxh1RnTNAmjJUdl32YdCauNOF/jIc3/ZQw4O83gkGy4+pHqFdSjst
 ODXdJ8hd4jthb2zpmNbsec1iCK/LvIu05b5bpvt+p9WHWnu6DLG/LbOc363geuQTlBiu
 O7jJlBVGWWgPpX5dcX6CdVG5ZmMIgUWkmiCxQdApm2WKjOqEExmVprJAJkY51H5FUMI+
 tmJLgDrlCw2N9I9a8xTbZIoJ0Wauva8lWJmskBI6b1XK+r2nTPv1BUw4oxlHmObAmSwr
 zdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kmGB2uDsLJ5hA8HqTM6kNeHg2EsVNKVotuQOdbgU2UE=;
 b=L3h5jC9gyJlkdvluc7hMuWHKb6NpXaO3YaOURm3I+kx0p7rzhwRNCaEvP0laXTP6HB
 fHt4Uy5a1kg1mYYNYMNzfGfrXy1Opike95BMbwjIoJSqkOlcd1nxWECVEIe8RVgPUvfB
 JrUa8N7/XyFIJPvQkTWfISvsRvx95QaweO3RfsQJaP3sOf0iiGYfCSDN9IYjZwsTh2PW
 u0g+RD1X8ZMF9sFHuBKik6UR7A7xOZjUGpwtqQpCGczlfBsl0sKOVW59lyi0VZx6chhc
 ohJkkdcp3sROzj16Yh1K803quXwfy1DFbDr/jzrXQMJOlgt1vPsIspRV2T3iZRwmcMOi
 ikuQ==
X-Gm-Message-State: AOAM530FgKmqwl4COjkEn25s3sVTYrpZVQJfQQP7jtrFd9guBD8M8RV3
 Qta338PK0Os2RwQIo64sF0YtA1JmII0=
X-Received: by 2002:a5d:526a:: with SMTP id l10mr4791236wrc.279.1630683036075; 
 Fri, 03 Sep 2021 08:30:36 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id t5sm5140079wra.95.2021.09.03.08.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 08:30:35 -0700 (PDT)
Subject: Re: [PATCH 3/4] target/arm: Optimize MVE arithmetic ops
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1813967a-0e93-f5da-1e61-c03fe114cf5f@amsat.org>
Date: Thu, 2 Sep 2021 18:20:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210902150910.15748-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.888,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4j0rhd7PsSck

On 9/2/21 5:09 PM, Peter Maydell wrote:
> Optimize MVE arithmetic ops when we have a TCG
> vector operation we can use.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-mve.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

