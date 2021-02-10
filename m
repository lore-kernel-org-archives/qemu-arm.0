Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1754615lfc;
        Wed, 10 Feb 2021 15:45:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBzwrFFky2aZjhs2yX7M4Uz3kHVQN/JkEus5zUFpCu7n481NmVZiEwW42AlzsEQEmnyclN
X-Received: by 2002:a5b:491:: with SMTP id n17mr8064463ybp.484.1613000718487;
        Wed, 10 Feb 2021 15:45:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613000718; cv=none;
        d=google.com; s=arc-20160816;
        b=djfbFDeAVoTSCM+d2Y3iDmD3CZciNLlO6xppcGXOZ95/XkwFyuvXMiVZoAhGs+Z6lQ
         CaIy0SyY6WwxoN6T5jR8P+zeHTnzIhM1z9+I9N8xxgEM1dyi6JX4barj31PWE1yUYHdT
         rfQSma0pzuxLemb1gRiwpypTjo6SgdLbbdaAZeo6Jlr6yPl4E6o4NqbhGpVwNCjPwhMz
         gnvq0V2Av3B81n6czAv1Viv1FFT4mHXH89edWtFjE6maBTnHbvvMGnzkgU/WLtSv79i+
         0b61XbWynFUgWxVPd/ara70yAcKdETzyKXtzcx5RV800klT95uV248Yk58Z074PE5vjB
         l5AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HlhtPNixEKcALWN8qqxe1omZkzPH9pdmzxxsVoGt20s=;
        b=0BWsQO4P/ZzjOf0jsm8f27yOmJNbs7isN6VjBtPd6I2tnXEkQ+qQ/VZh/uCuHNHZ6T
         hKOxPNdE8GjKI0TWSqRz4QyMXtSOaSbgYy91pzBcveL8GvjKv4EpNxc9BqlUh/py1S85
         oA6/J2Q5k6DuFzTsuk1aGjkCBFiwK287yh19I3KBw4Iuhvx0lJ8W52SxAw1qGqIg1YgY
         Pgvl+3eHTaEkgvbOm/u/Y7gRvp+ds6KPwmjWtgSUWIRLwuwHXboz/fUgirqGsVfKKGYd
         jM9Bjk/LZw5FwznuSrOBr7kZwR76vnrkihfYDCweVZpwL7XJOdi6DFBC0ZpaNtc70zjo
         OlWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uRa6YPop;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si3146793ybo.323.2021.02.10.15.45.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 15:45:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uRa6YPop;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:50616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9zAb-0001A1-Q9
	for alex.bennee@linaro.org; Wed, 10 Feb 2021 18:45:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9z9a-00019J-NK; Wed, 10 Feb 2021 18:44:17 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:33237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9z9U-0006QX-71; Wed, 10 Feb 2021 18:44:09 -0500
Received: by mail-ed1-x52a.google.com with SMTP id c6so5102745ede.0;
 Wed, 10 Feb 2021 15:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HlhtPNixEKcALWN8qqxe1omZkzPH9pdmzxxsVoGt20s=;
 b=uRa6YPopvXT7HJHNVtDmhDL+639NuMPqWEnAQPXeaOrRe4pm6pesMHSR7GpCZbcmyD
 nEph0bDRCm8H2/9NP0Q241VRD7wIGi4Iz/Q7dIHak1sWQDJjXzNFfO8UW0DvAdLF/Bfz
 lEEBCAM+XLnkixz3JwPAeRu0IOzAw849mbT5/uVTiMnWEBtllec8eRremHN47qcq7osJ
 mt8dsfTn83MpWLTIBstCgtP1dB6cjNKWtpZqxSLN0GTscGoIKDF/3Jfw0kNUwxPuD8pn
 QmmvwV59V/TqeDErunjD+Ayq4/dUHANwJ1nqGA9kiyUaKHTnOPTdVPtHogWFoiRmAFTZ
 atcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HlhtPNixEKcALWN8qqxe1omZkzPH9pdmzxxsVoGt20s=;
 b=RuH5Sbcf34XUmerjZNgcyEdo7A4IpMtmKoZu99/FqR3huOAGnwFlN4BkfZYHgt+V/M
 6LR+DNSxxV2OUmckWBQe85h4DxmjlTxV5bk1Piq6A6Nk89IhxZIslWo4qpK93uc4Hfr+
 EBCv0TuM1CKgg3673wF9AOxK7G148MEocYThkprhqTrVWL+74guMZZv7ubAgQaA59u25
 0l3m7z7ujX5aO+w/AvgofAHmAHJ42/SWbsno9y1JpQxphE1/KAaIGcf77Z1b+Y5Yn9vg
 5Of/4jmXpg3Pxhk8oo/bRD39XpQamfUbiuHd3lhjW35fhp8/uVflGi37lO1JoY1foCOL
 owuQ==
X-Gm-Message-State: AOAM531tC5VPlKkOA5lpw9axiV1aOAVRITFgPrriYw0tibmFjfh6+ESw
 CqWHgXE4Drx3N7jaLUc9HFrXwTQQXEE=
X-Received: by 2002:a50:d90a:: with SMTP id t10mr5753239edj.162.1613000646390; 
 Wed, 10 Feb 2021 15:44:06 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q14sm2266139edw.52.2021.02.10.15.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 15:44:05 -0800 (PST)
Subject: Re: [PATCH v2 3/4] clock: Add clock_ns_to_ticks() function
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210209132040.5091-1-peter.maydell@linaro.org>
 <20210209132040.5091-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8f75529d-9696-e1da-9c0f-3fd59c0adfd1@amsat.org>
Date: Thu, 11 Feb 2021 00:44:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210209132040.5091-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Luc Michel <luc@lmichel.fr>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jmbj+aMGqsd4

On 2/9/21 2:20 PM, Peter Maydell wrote:
> Add a clock_ns_to_ticks() function which does the opposite of
> clock_ticks_to_ns(): given a duration in nanoseconds, it returns the
> number of clock ticks that would happen in that time.  This is useful
> for devices that have a free running counter register whose value can
> be calculated when it is read.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I have made the overflow behaviour here be "wrap", with justification
> as per the comment; but I'm not 100% set on this.
> ---
>  docs/devel/clocks.rst | 12 ++++++++++++
>  include/hw/clock.h    | 41 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+)

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
