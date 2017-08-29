Received: by 10.223.188.70 with SMTP id a6csp6178368wrh;
        Tue, 29 Aug 2017 09:14:18 -0700 (PDT)
X-Received: by 10.237.53.115 with SMTP id b48mr6222502qte.299.1504023258491;
        Tue, 29 Aug 2017 09:14:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504023258; cv=none;
        d=google.com; s=arc-20160816;
        b=ybQzwbFnF2A3cXH8wrD2fJRr6X3823v+nOVI+4hdt5Dk0VE5Li5oYVf17V5h+KZYxs
         e3DZ8WM9DJQJ/MR0vT5NDFPnbmKNbkHB6ITymnjCLc8fIRnwCBfTiZbrkAPo+AImhAIz
         fOW3Bkwu9L57nkH19zT7W19SHn61BoEpw7XOjeDsRj6Mel0fcQeD0d2Nw1tX3oI9Q6JC
         pKfUNiqx9CHiyvqXrfAFbqYPOOyppyeEFxZOFJFNh8waC9yaL+eRXdHGuSoV6P3J8ZxJ
         BQdgWe7oG2erfIIousYvKoJ6YcQhtMr5KjEf/bF0tr6yN6aO4rlrQcUVQy6Vbjmasxkr
         Z3DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=OvFU/Orb7pxuvhFgu7HUkbM/F+RVC95ULLlBzdvJjDg=;
        b=i27xFzGuNhQ/pAjYy8i2ZPr0JjONQL3YDSYy1BfrAysSPAXUwMytguotIsvgneE1UN
         /mA1fhJjd8qTQpSY6T7WerwGQ6AgwQ8vp9opWMx4vO79Bl5Rjm0r/3BQrLlnmw2NzgPG
         4GOBdKEkorT2fJsvx0ZcftfMe9hy7YNduho9/RO15o47PPXuzif09an75xeKPFvgKgcq
         4fsY5dsTjWxnICklMhMXnZcHeEvU6v96iLpIeVojHYUO+VBZPd4IpHp17qvoFJX911Y1
         2b+UJ5gdLXcJs+d8hB2VQrejd+gy/X5mny28cLngdoDUJX05HhjANMmjxud72WCQquMu
         azeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aLgMe1aa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 32si3131180qts.218.2017.08.29.09.14.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 09:14:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aLgMe1aa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45895 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmj9c-0006wq-2w
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 12:14:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmj8S-00064V-JY
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:13:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmj8P-0006eX-Dp
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:13:04 -0400
Received: from mail-pf0-x22f.google.com ([2607:f8b0:400e:c00::22f]:34141)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dmj8P-0006e8-7v
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:13:01 -0400
Received: by mail-pf0-x22f.google.com with SMTP id l87so1709473pfj.1
	for <qemu-arm@nongnu.org>; Tue, 29 Aug 2017 09:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=OvFU/Orb7pxuvhFgu7HUkbM/F+RVC95ULLlBzdvJjDg=;
	b=aLgMe1aa0OKcm5+JJ1zlAmjE7+IahixH6C5v0+RUH3IhH7AFS0wsJ9wnlt1uMbJ5us
	VlISrYYE+Ct2sAQOey8LGAlvyBNOIFf+YHsNZ8kg/f2KvMGbIqxg4gWxaluXys5TS211
	I/kUgRQtEOBnv0Vh85/31AJ5xFVd7DQ6vBbsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=OvFU/Orb7pxuvhFgu7HUkbM/F+RVC95ULLlBzdvJjDg=;
	b=mG9koepYs1bbPMXSF1sSby3N4XSbrpSCW3poAlGK7qroe7q7uEfToHeDk5pHg67fEK
	6eVM49MS4cjVBfdheeLFlK0N84ATVaIbulohfuFITZagi849yXczY0f6hz1+1wuDT6w/
	mzbgpbFZE7x+7gulMoU+a6bIS2WFwDCYrVClIUGHskB0rMo1PVgRus9YlcCLuUlFznt+
	0aIrKePYGmigymMRL+KtU+7aFNj5zPw2grmMgQRZI9dkV+kgZPHWHUVlCb2p30owsfxj
	QrfLOOR2ojKMBwTkD10+xuNWPPLbYT9EGq/2pZ2NjsMGUsN1tooTpw+76hKgbuEwTIk7
	yVqw==
X-Gm-Message-State: AHYfb5gDlsp/0eI9aO56O8TIxCEG4obGNzC+YTsED5AtbnLgwO98YlhH
	vyC4wN8mR928sOqh
X-Received: by 10.99.49.210 with SMTP id x201mr791119pgx.151.1504023180460;
	Tue, 29 Aug 2017 09:13:00 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236])
	by smtp.gmail.com with ESMTPSA id i2sm5617247pgn.73.2017.08.29.09.12.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 09:12:59 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-20-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eb01a522-9cd5-070b-018a-8f0087d3a843@linaro.org>
Date: Tue, 29 Aug 2017 09:12:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-20-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22f
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 19/20] target/arm: Move
 regime_is_secure() to target/arm/internals.h
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
X-TUID: INMUVtvEtNfO

On 08/22/2017 08:08 AM, Peter Maydell wrote:
> Move the regime_is_secure() utility function to internals.h;
> we are going to want to call it from translate.c.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/internals.h | 26 ++++++++++++++++++++++++++
>  target/arm/helper.c    | 26 --------------------------
>  2 files changed, 26 insertions(+), 26 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


