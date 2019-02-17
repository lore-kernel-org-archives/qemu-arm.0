Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1518193wrx;
        Sun, 17 Feb 2019 09:57:22 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia3dpwLriziSaWtQ8BlYr25n/5+r0eZ8Fm5YC0NcecAqHaKmZ3YWbxfaXwkejO4th81MeG2
X-Received: by 2002:a81:4f0c:: with SMTP id d12mr15854249ywb.414.1550426242605;
        Sun, 17 Feb 2019 09:57:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550426242; cv=none;
        d=google.com; s=arc-20160816;
        b=r6tgzpetaetY0BFgG6WTAOURaeHPHDYBxph7wr0//QIvS5Lty6DMJCZVt8K6gkC503
         lDqF+KykcwWlLMUwAg/1swMfI6rLL1kHh96QGdQDH9cP50E6dMM++vByxkNtWJxyyDKE
         9rol89DEqsb3n8W20Ir7oDL6Z0N6p5D10kj3ePAZ/n8vQFgoLCqKDzgwAlfLjpib03Ey
         7bmYl9fE2CnEo/XQj+7xacOXhRgwkcAA3rIYcFdwcdSSjPI4IwPuBOnhvoPL2tjy63bx
         pYnBE0/s2N3H82B+ry3gH8ZifgTGGpgFeFh0PBKw3Pugg9S2oa8wYiugyG8/INMGpcSf
         UnSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=pY18iM2YYkOWR2X28YUGd6ScFKW3WW8r6lCbdI3dY+c=;
        b=iC0dQETLwQDuwzqIwWrsR4TzcXzR6pLf0aD6KpYnrhpS+oP8N76ajuzZ91PjGuhL+Z
         pl0bmWm4QqmmMvo+neRtagz6l71FpnfmQNWP+1HqJS6sjZREqkNcxjrC1o5SLRzyAN7S
         pCDdLyyhaYuzz9PiVqgXUvQOrjSANCdN+mfV9zWpkwymFBOSEKlXCgAVVEI6AB8LS+LC
         DdpDBz/HYzPDcsZDR59+GwU6GO65W9bYPTHU+BBNsGaVk/AV3c/5xzBGI4w/DKIwomWC
         cpt5e2s/lXeRvQ5G2RyitXZZuWrjDrDArZWOGOe9Jn2R2GDtozMxXpqA0lCaQTWSLIDp
         wCmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=InaIloAD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l184si6228004ybb.242.2019.02.17.09.57.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Feb 2019 09:57:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=InaIloAD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44650 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvQgs-0006pD-29
	for alex.bennee@linaro.org; Sun, 17 Feb 2019 12:57:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQge-0006nn-Ch
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 12:57:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQgc-0001xq-H0
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 12:57:08 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:34954)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gvQgc-0001wu-5o
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 12:57:06 -0500
Received: by mail-pg1-x541.google.com with SMTP id s198so7277480pgs.2
	for <qemu-arm@nongnu.org>; Sun, 17 Feb 2019 09:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=pY18iM2YYkOWR2X28YUGd6ScFKW3WW8r6lCbdI3dY+c=;
	b=InaIloAD8W7JZr4kQOyGX86WaNmAkOORLXfZd+V0T1BoF2LC9umVNW3d9V1qliod+Z
	7d9hIOdULjJosqOhzQu+l2pg8cAp6NjjD1o8ByqDXJuiLDvjk5fh+zJdHroY7UR61t3H
	J7317U5QMxE+kHwfEEifNuo/xXK1k3omTdGPFUmGJdkQajxXN+fEFRMVZ0T7VF6IVa8W
	VNGeT3anLXx/xmZn0wdxzLEr5TuVPNucG+VR6LjgvwSu5kxccIf7lBvO+VV9DK8mZCl9
	GaEVLTJ6CR2ddRqdtm9YElckw5jbEiSN4WIETqRufVQNoocsuT6uGzuvRsR6+7ehcnPJ
	x8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pY18iM2YYkOWR2X28YUGd6ScFKW3WW8r6lCbdI3dY+c=;
	b=sly8wNE9pfrIWzRkBiYhejiSrO80fhTFEg6srTUPZujI1JzrJvEpwyufiAwfWlZ50J
	TNwUiDGVCPlisqpQdRW2x4RyfC5WTm2HwPMtrbi3So255Jw8jH91V2bmyJ/QJ3ycA+cx
	q3v+139hw5Lsi3aiNbxKssaa3LQLgGP0eVFTUS/hSjUzreDQLeZ1Vvou9d+DnAygoQcr
	+npDLEr5dVSaKm2h3K4SAOi1a5LpstNMNRN+ACv0/HZu4YfgufXOE+ie7JqQmoHx4k9Y
	SJh6xX/PSN9QgZ4z7yWuPycVtn2H3rDulmSjlqDAqwD3RAPlcDwUqYWNqieMGVfNLjdm
	H+2w==
X-Gm-Message-State: AHQUAuZI9cy4625STar2hElRBKSCGVdMEiPPZ8M0w1ENOunRjnjy0A/w
	C7p0Ms3xXiUkZp6SuRzFSJm0hdTdNKY=
X-Received: by 2002:a62:1d8f:: with SMTP id d137mr19889580pfd.11.1550426225072;
	Sun, 17 Feb 2019 09:57:05 -0800 (PST)
Received: from cloudburst.twiddle.net ([47.39.62.139])
	by smtp.gmail.com with ESMTPSA id
	o25sm14999682pfk.185.2019.02.17.09.57.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Feb 2019 09:57:03 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190214125107.22178-1-peter.maydell@linaro.org>
	<20190214125107.22178-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f90b5e4f-f388-b167-5d2b-51c8598d0abb@linaro.org>
Date: Sun, 17 Feb 2019 09:57:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190214125107.22178-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 05/14] hw/char/pl011: Allow use
 as an embedded-struct device
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
X-TUID: xStRMSXZ97Fn

On 2/14/19 4:50 AM, Peter Maydell wrote:
> Create a new include file for the pl011's device struct,
> type macros, etc, so that it can be instantiated using
> the "embedded struct" coding style.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/char/pl011.h | 34 ++++++++++++++++++++++++++++++++++
>  hw/char/pl011.c         | 31 ++-----------------------------
>  2 files changed, 36 insertions(+), 29 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

