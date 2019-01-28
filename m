Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3472789wrt;
        Mon, 28 Jan 2019 08:35:38 -0800 (PST)
X-Google-Smtp-Source: ALg8bN71OXH2ccvsHv2UZGo44q17lybhQ4qh4c4XNVvWzIMAtZyOcS9Fm9yjUb6owGf40CjX2JJ6
X-Received: by 2002:a1c:1d81:: with SMTP id d123mr17326179wmd.112.1548693338219;
        Mon, 28 Jan 2019 08:35:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548693338; cv=none;
        d=google.com; s=arc-20160816;
        b=itru4PqPOOhRnwGRvRTr+sghasc6Bu9xFz18hq8H/1eLGMaq2f6bO0DmUnJJMBXaXF
         culSuDsRXtYV9qkS7K5NySIwK/LC0arBDrilZiINFoTv77IGywuRjZddtkmDXY6qgbvM
         AZ8bBhpLN2W5mYJxRC3OHy0xRHBrvKRCupL0zx9hoJnxlZ6izHDA/jE+dK1HoUR3/Yny
         /a2ZwxgogUiuq8RU4Nq/jPYUHq/6P/TqTc3L/XKMlQZR75A6eZsWNT1FADVReE1oMye0
         qpPR23rxc4iDxnDe29xWQcr5jyYV7afLDNjnrDKDK3Cd7dy4k0hNmDI5EPmokyIyce3d
         cO/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=A6kC3tM7+5GXiYqjOo8j/1TKnNEnT+mMbgISieKu9Gs=;
        b=Ba6fLGSrzlbza51+r05KSUyObr9QP7o7djsS4YnHJ8Bb3dZS10rsqAaS1cQZh/VJQo
         29cFD0UODR5ENPbinMEj1xXUjuQhX5cTid32rT+JjEYSgp1yW2TneZXQdJCsgETy61KU
         cpkmRkp74R0PLkSERBE25QXT7r3o6ylEPrMzWt0tqdwjYILzkQp5QEc63jF9rEbYEZ3h
         gqC19mP7q7iXOc5vN2drFA7CNk6k21XpcuSD0AkqNag4rhoZlUoEwowOSLQXlVHo1t+m
         nKzJq/FHpVA1W2VPs6/AymykIZ9kFI1ZQVEXPoIZCDIrwtAYoDPLRu550Yt2WuGGQuhY
         s1uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iIG1QFzH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10si80905191wri.399.2019.01.28.08.35.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 08:35:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iIG1QFzH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:34738 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go9sn-000076-4n
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 11:35:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1go9qr-00078n-P9
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 11:33:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1go9qk-0008A2-3Y
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 11:33:32 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:37453)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1go9qi-0007zn-42
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 11:33:29 -0500
Received: by mail-pl1-x642.google.com with SMTP id b5so7961058plr.4
	for <qemu-arm@nongnu.org>; Mon, 28 Jan 2019 08:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=A6kC3tM7+5GXiYqjOo8j/1TKnNEnT+mMbgISieKu9Gs=;
	b=iIG1QFzHdt/Sa/9D8p/tbPyfaHJZlUd+DCUMSEin1VvOixfNYIivA2Tvb8o2Drb/wN
	qqV4NC55XNsszAPMC+/LfxCkqsq4n2JFLENlEFcYj8x+qI8rhB76VP7lDnHm59JHnmAl
	3gHm267A839u1yUbLytAgMdfCKwaUfwHt+160=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=A6kC3tM7+5GXiYqjOo8j/1TKnNEnT+mMbgISieKu9Gs=;
	b=E+954BeA3Z0SvS/RKgHF6e1ejaz7QKWssy7movUVI+dmOXuQqp07bTlKgVS9AsMiIp
	3vyI1T31w5yXTTsnW1roxB36Lg5B9Wyz9LNOF01hVSoqWb8TYom80dY/CXfXL04P5KKO
	8+evJ5LvdC6lZ091UqyewxLONWeGJAXONW04hs/M2NHOh62wmG91N3OPHkRREDoUDxgx
	sSfIs/WpdzFETb2kJcddd6a0XSSpckYD2zvgrfswZ2ZJF+JcVONn5WjGy0WhGIW2d87g
	zPWKobrIgODMymJ5sp0LmHsDUP7/I4aqYkeGrZgYwkW08asptuNsruoc1BA1NMfXpWoN
	C28g==
X-Gm-Message-State: AJcUukfTad9ObKywwbJh/hX8zifGXlK9mwXc4yimzeZ9HZqaUIo+k3WM
	tYPJBHkAZYGg1mYqaKxioTzDIg==
X-Received: by 2002:a17:902:298a:: with SMTP id
	h10mr22599035plb.312.1548693200939; 
	Mon, 28 Jan 2019 08:33:20 -0800 (PST)
Received: from cloudburst.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id
	e23sm62337208pfh.68.2019.01.28.08.33.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 08:33:20 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-24-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8d0a8043-42fd-5ea8-44a2-8a27a90fee3a@linaro.org>
Date: Mon, 28 Jan 2019 08:33:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 23/23] hw/arm/mps2-tz: Add
 mps2-an521 model
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TUngMmP3UYPO

On 1/21/19 10:51 AM, Peter Maydell wrote:
> Add a model of the MPS2 FPGA image described in Application Note
> AN521. This is identical to the AN505 image, except that it uses
> the SSE-200 rather than the IoTKit and so has two Cortex-M33 CPUs.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 38 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


