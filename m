Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp6473945lfc;
        Tue, 16 Feb 2021 05:38:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhu0QfZeVE4C+U5AHbXK6V0QBQ/XThSoFb6MfMsN6pmkd9xbT7qDRnZRaN89QuXPbbPdYL
X-Received: by 2002:a25:9887:: with SMTP id l7mr30966964ybo.319.1613482687866;
        Tue, 16 Feb 2021 05:38:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613482687; cv=none;
        d=google.com; s=arc-20160816;
        b=C5Gux4/qvVwqjxNWP3vn7JUK58JUeRh4yXST+T6aDS2VqE6F/Ywclbx4pnlV4pSAzr
         sTGDh3G17ECqMZ9ymqQaJDbWn1K4p9Kn1tjJw0lNon+Y7W9ICMBBV2/DS9V5pBxAZm9Q
         Tpl3Vl0Z46cCnPMejt3qQrw48f53pZVKipH0YghpXh8hucHrXnnQvIhKCIP5AVxiBJgk
         yw3kBB2eCl5Tw0EUW1nl1ttGMlSJBicY5UiDgDXyLYLFnTonyqnfT6kiTpDeDd2JInij
         8bQ+P/3GR+K5PA8IdqEMZi+roWSDiXfzZt+WjWXRjh6/r5i1uCiTw8++rwMN7oaVE+ue
         q+5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qJQRgdQHZb+3ri78wQYvPF3xafIUrZOersAZ3kuqUOQ=;
        b=BBPRyhncZKAEo9S4F0oH9N21vDpsmdTZuqtWao5YM0Q20C7msRIsuQxGN/naY25ww2
         AKGyoJqCAfHGGtCb3fo3Vhigbz6/Vqp0Th9Q95uJVTDpWkmtcmisM1Anm3HRwHyYAbsg
         hSlcvXL0l8iWzOUGnAmEI51i3QisnZugh7LRnpRiCoJyrWohsZsbKLOIuz7I5qN+DRu7
         IiIAx00tNatMCGCbNW8v8LsJVEBynB164WrR0O4QiSci57Tyr3hKWvka1IW1NIO+vAfQ
         ZRKXSxlIhFINKtORPFKzP3AVgC3QOdG18lue68b03wySC9YTMWIfNJQ4+NPK9lxGOIJB
         Dfkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d1HlaSpk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y5si21089955ybj.494.2021.02.16.05.38.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Feb 2021 05:38:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d1HlaSpk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lC0YJ-0004HF-9r
	for alex.bennee@linaro.org; Tue, 16 Feb 2021 08:38:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lC0RW-0006lS-C1; Tue, 16 Feb 2021 08:31:06 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:56184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lC0RU-0005zL-R8; Tue, 16 Feb 2021 08:31:06 -0500
Received: by mail-wm1-x32f.google.com with SMTP id o15so9116554wmq.5;
 Tue, 16 Feb 2021 05:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qJQRgdQHZb+3ri78wQYvPF3xafIUrZOersAZ3kuqUOQ=;
 b=d1HlaSpkA1T4JM5jP/Y9KgTAEEb31VpPLNzRZZcMSsgmM3aA1P0BJy4a9QJJWa60pS
 Mg44Q710+BHzmDPYd7r7PbFeXRuaLmGU8Lf/d1hL+L40uJJEbKoXCbB2J0KSlVEs2ueu
 SjMtwgp8oO6QArDMHLhjqZDO4AS9LxUhLGp93OAzw/wvzf+qYg3f5uZxKCq7SddwScek
 u0LVhwl11brhwhsh52NlbqpxdMSUBK4HT5AzLaoUk4WUiyKSsCS3PVXDKlF2rqjEdw0L
 xWmDbhc9yIpma1cevcpUUxHKep+jj56EysrArRwZsk+IFpL7it0NBLp3U0Q4Ymkzyb3/
 dDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qJQRgdQHZb+3ri78wQYvPF3xafIUrZOersAZ3kuqUOQ=;
 b=pI3oyTiMFRihoeugZc6VEBf9xu5HCFdc8v4fg37KuHb7vDgHnuYYj6Xn4s0maM9PAf
 9ipbALVITLFHBEFt/PiPPmnQIuLFBxOVG0UQR+xhxvE2d0x/OnaDnY956Vi3CgeXHx54
 GmC7dN+/vDT0Rae8vmMu1vssQ9KGz0Y1diJ3k2UEfbar/TR/OvEy7M55IkaSnFQ1Y0kh
 b+SyWdsZwGmGnfh8YYrvK63WpyKoa46swcYXzmygALMyWRrGidr+vY0EMfNcnpBLZUev
 c9qWVyQV7NL6mIEgdW/LEel/FhSlWZeoLFrumqOzzRvwz7D1gdcKlTaYINyJy3RjSI8F
 Dqiw==
X-Gm-Message-State: AOAM532tk1ynq9v1EcSe/TgJHYQfJ3/KnMs9+H+vjWJkWcbH20ZZAt9v
 cg/3VjMN2I+j2mZOoapyCWRtXuL9E70=
X-Received: by 2002:a05:600c:4784:: with SMTP id
 k4mr3265821wmo.56.1613482262817; 
 Tue, 16 Feb 2021 05:31:02 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t2sm28771268wru.53.2021.02.16.05.31.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 05:31:02 -0800 (PST)
Subject: Re: [PATCH v4] MAINTAINERS: Add an entry for the Siemens SX1
 (OMAP310) machines
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210216131132.1116574-1-f4bug@amsat.org>
 <CAFEAcA9kg1qEMamBxgshqL0YADDX9e7U94wr9HuzCh0yV9w-mw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <97c54d1c-1029-80d6-4b6f-510d8d077263@amsat.org>
Date: Tue, 16 Feb 2021 14:31:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9kg1qEMamBxgshqL0YADDX9e7U94wr9HuzCh0yV9w-mw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.19,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tw7n+zpNVcPR

On 2/16/21 2:15 PM, Peter Maydell wrote:
> On Tue, 16 Feb 2021 at 13:13, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Add the Siemens SX1 (OMAP310) cellphones with the other ARM machines.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> v4: Maintained -> Odd Fixes (no test image known)
>> ---
>>  MAINTAINERS | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 8201f12271b..47f8c591760 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -656,6 +656,12 @@ S: Maintained
>>  F: hw/rtc/goldfish_rtc.c
>>  F: include/hw/rtc/goldfish_rtc.h
>>
>> +Siemens SX1 (OMAP310)
>> +M: Peter Maydell <peter.maydell@linaro.org>
>> +L: qemu-arm@nongnu.org
>> +S: Odd Fixes
>> +F: hw/arm/omap_sx1.c
> 
> docs/system/arm/sx1.rst is already listed in MAINTAINERS
> under the 'OMAP' section; if we want to have a separate
> section for the SX1 we should move that F: line here.

Doh I forgot commit 66278f8aeba ("MAINTAINERS: Cover
system/arm/sx1.rst with OMAP machines"). Please disregard
this patch then.
