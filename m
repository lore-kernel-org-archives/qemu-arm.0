Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5309486lfp;
        Mon, 17 Feb 2020 10:12:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqyTExZfIIoZJnkAhxQv4HlSA6aPcyMpLZ6SA3x4ueDs0GFRDuVAZZacL9orNynmvU3M1Y/Y
X-Received: by 2002:ac8:4410:: with SMTP id j16mr14353850qtn.261.1581963176091;
        Mon, 17 Feb 2020 10:12:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581963176; cv=none;
        d=google.com; s=arc-20160816;
        b=A5z0GumBWiGdiYUPzwnAwoMcQjOjlJulzIy8XpOXWsn62EuN9+4BrQKIctAORq2jyL
         98sR75Or/MuceSHQMXs21CxDCMoBJsAAw5Q18NyRd6FhG8PPqj5IJ0Y5peUN3NUjbz4c
         W8L1grY7GqkRDRsFBGLDQ8KR3OSpZh7jGNVxwSrf1BUHq3rnmYFhkow4J+dSa6AXxkJC
         AvyVXPZKOWBporm09j36THwkHyYJprX9C+hDbSifwanZvPsMuUJuUxi+I2Xt+gc5BpU6
         2m9g6wqGSOajjrBkgDmGrvMiPhlvWDIx3o/jpF9tNVFrqhH0i2AgBtlx7k08Nio4gEXL
         j2xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qC0Tm4A4DCzVRrulrvyNljaPVbcSaSsDoLMT3nU8GAI=;
        b=CyUCd3F2d8yDmzF+3E33hD2kvxC33NqWIv8+NPi+HWOFOgKdZCuP291I27k9EuVCc7
         jzX9v20G12wf3UQN1TqI7MVoZ1tDDNada/M4afSz5zBUNvj0f9gJIsw4bAwpQJJ0WndC
         HakLac0GhQxjk3FDOD5fIRbtXQhyEfoXDoysg5F6OIPeGibX+ggUdTpeBi2QBFr2ycSt
         mdKICZ8yUBPJZR6Vmh11duSkgugFsCJ+QqTIECGBmq5QQEU5pfypioU9Y5Hx1dFnSFED
         k1oLibt8nV8jNqT+WAzGmq1zrm39RBq9oWnnMjdkWPkJjd9wvcE26tzsmKPMVbcg81Er
         g9iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SowJWKg0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d190si683743qkb.265.2020.02.17.10.12.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 10:12:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SowJWKg0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3kt5-0007jD-Gq
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 13:12:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42662)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j3kmG-0001Py-Gc
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 13:05:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j3kmF-0004Hb-GT
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 13:05:52 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:40683)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j3kmC-0004GA-Em; Mon, 17 Feb 2020 13:05:48 -0500
Received: by mail-pg1-x541.google.com with SMTP id z7so9596551pgk.7;
 Mon, 17 Feb 2020 10:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qC0Tm4A4DCzVRrulrvyNljaPVbcSaSsDoLMT3nU8GAI=;
 b=SowJWKg0GkjJl2xqFetcPBcdOXLSqoIMWuncPoBxv4OeZhEdBj1cYWo9g9Lv6s7Xsq
 plu509/vkS5nvmxx7zefN17Oude4QrsvnrxvaxD+MMRvVYHnXuREpOG1oF/048qI6tIN
 cZ88DHFHz8Dp9XIBjSzqGVFOymLPH2cZyppGtHagUa5zZomtUxtzIFfMZJ+GroCwneMr
 pmW7yYEEoAeQrBbwSLR/aJXwxYke6XpkdTuNUsiA1LulTEVBibsmLOui83AtVUYq+irq
 yvLRVyMa4DWr4iLBF96ykUvifQ0sY6s76j/tGxRGmcePBvSFobQMeNwxnYVye0Mis9Ja
 Yq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qC0Tm4A4DCzVRrulrvyNljaPVbcSaSsDoLMT3nU8GAI=;
 b=mO5uKzLGKg9qobpdkWJgpuoF1i0GSWAca7v5kgHHeqBUgnX2DFDwo8hw7G1AyLVAfk
 Pt5U6CE2TayGKosC8zKdY/pelkXQPwIw0dNjyvsY5cHZWVcOkRgIgJU1V4Ed3+u9+aIR
 fwcolxHYJEyi6FKsuXakiC9OuImcstIbr19SM/MzDr3nf9Eazg0ZidiBIdwBymlymsVp
 s2Yq2Aw/mpYMAapkl6aMs9taeBBLTCg9+CqeO4J+pp0RFanT0azlJMIhjlZgtAjqSDuI
 jDYgXITk2bliUHJCfvo0JqaVxWPeL1j+Civ8tXzBmhxTN5icArQBruQtGNon9DnTSiSV
 4bVQ==
X-Gm-Message-State: APjAAAXuTzsal94iuqwxrKB6vGUIHVQHLtDUUTPxPEjgFxBCjsVhWBix
 H4gbhqLPu6OeX3CFtQbKtb9xcUbu
X-Received: by 2002:a62:c583:: with SMTP id j125mr18475652pfg.27.1581962746955; 
 Mon, 17 Feb 2020 10:05:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 n15sm1111246pfq.168.2020.02.17.10.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 10:05:46 -0800 (PST)
Subject: Re: [PATCH v2 3/3] arm: allwinner: Wire up USB ports
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200215001248.2642-1-linux@roeck-us.net>
 <20200215001248.2642-4-linux@roeck-us.net>
 <CAFEAcA8Su5SfM9f9BpwaEK2yq0NPwjbtUSwQ1n=G1a=8W881JA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5bc0d418-c717-be48-2dd4-346d193674c7@roeck-us.net>
Date: Mon, 17 Feb 2020 10:05:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Su5SfM9f9BpwaEK2yq0NPwjbtUSwQ1n=G1a=8W881JA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZFCPrr/DcXcy

On 2/17/20 2:13 AM, Peter Maydell wrote:
> On Sat, 15 Feb 2020 at 00:12, Guenter Roeck <linux@roeck-us.net> wrote:
>>
[ ... ]

> Hi; I tried to apply this patchset, but it doesn't apply to master.
> In particular, master doesn't have a #define for AW_A10_CCM_REG_BASE.
>  > Is this patchset supposed to be based on some other patchset
> you've already sent that's got lost in my mailbox?
> 

It is not supposed to be based on anything, but in practice it is because
I also carry a patch adding basic CCM support (which I completely forgot
and which I didn't send upstream because it is hackish).

Sorry for that. I'll rebase to master and resend.

Guenter
