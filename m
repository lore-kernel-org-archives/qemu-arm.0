Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1920067wrd;
        Thu, 23 Aug 2018 21:56:04 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbGQquNOjzquhaxvKTS5z5bwHsGfL6V4OnT6XeSPAknesKe9FxWpwpNzqA73Y0zGGr8IVGr
X-Received: by 2002:a0c:9a0f:: with SMTP id p15-v6mr83959qvd.126.1535086564032;
        Thu, 23 Aug 2018 21:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535086564; cv=none;
        d=google.com; s=arc-20160816;
        b=v6Ul1nOlY4k24HcJ1aT5ZbvK1eAsJ9Z8bFgGN7D/JICqtObmH1kbC+GdUGwYBP3t/7
         7ux/TNcUAJ+BX9p/7RGlQdUjUtCkgfLj6gZaNSCBPr3CJA8bFv3MKxIDuVkRs9/Lrc1h
         QeO+qBlMPTO4RUR04jQPvQ7EYKI+ebyVrGsbaOCn14OWAlceJ2DCH7QADd3WVUq6EI7I
         jyyH8XtkDgoA5XlFWFL6p2wdweecZ+AJtt7VapCuJ9EA3vnYX1CHY5a998ZYgILncNxg
         It+LVx9HKrcJgEv9E9kkzlUIjiz5+ccsL08SqCFQxscbAjP0fvFs0KsqZeaY2DfFxHmc
         sILA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=20TSVwHTkNfs1Kx+rysKGkjDpM3iZJczrUdnWBmLkQA=;
        b=JQpudd9TMgvY2Xw3zkmB98KVu+oFUUo6zNzSzZbFCGIUYu6Xu4M7JglxTgJ4lhZVgW
         FJ9b+A6xJyPUZesHpLsD4EA2XaZMehKvNaOWmaAsbIKBmgXKiJapJJ355blTgWkKQC8L
         mkg/y5u5wkGpepDPJe6LqKBjSZ7agkcrMw7SG+vpT1ku5P6YLhGKXz63psoYsFHngWEQ
         6AMeqrdJlkpsUiaV6DgBgfo+zd/oBbco4NOK7/dKVXbbJxwmZr9UInb9I568ZYygXGrk
         YWA6n5rQnORc0Y0RZnkUooErXuQQO7W8x4BXpETMUwntDL7UpelIugIOAM0rru8HZY2p
         F7kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hw7DsMoG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p1-v6si1484689qta.346.2018.08.23.21.56.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 21:56:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hw7DsMoG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39876 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ft48h-0003Cf-Ij
	for alex.bennee@linaro.org; Fri, 24 Aug 2018 00:56:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48281)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ft48Y-0003C6-3s
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:55:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ft48T-0004bt-W2
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:55:53 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:35284)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ft48T-0004az-F1
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:55:49 -0400
Received: by mail-pf1-x442.google.com with SMTP id p12-v6so3945806pfh.2
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 21:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=20TSVwHTkNfs1Kx+rysKGkjDpM3iZJczrUdnWBmLkQA=;
	b=hw7DsMoG1u9WZ9GJfYQoVyGUPjirGtzVv64WhFtTIKtQlGY69A3b9gwofdO92Q00ft
	9MA0ediepksF19Ci2DwEJ56IXRcKTb78d65XnPs0RGjUKFZ+nj9ZnPd8tPfOwS9i4cVN
	A7unlueAIayfxaA7dKrsNEbS7nPr2KzF+Zdcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=20TSVwHTkNfs1Kx+rysKGkjDpM3iZJczrUdnWBmLkQA=;
	b=S9z7/hchRT8uoi5A8BLMtjtHyFDyORhkdJuldvt2liKKZOAamafa9VnM3lCtwFrw7Z
	qXgzM6g4OaXEMjDqX6hkQpdwJSksP1qLOmhueapg0zsOTt3z8A+fBnav/BaVMU9RtvIh
	roF1EqGYdNtGK+S/MOwGlnEkTCbKnyjlpnyFTAbbANa1KSOXQZFiozCCqUGEVV3JqKv4
	bAimindSJIS+I1KtR7NpPFlRgdZLMkMEeoSx9H4z+p6ILjv7d/2TCXDpC29Hhj9034Og
	NuobJBTtSJdea0VPmYqz9idgqK6mbuPApjYhCp0xz1WvCd0SNG9x+qrdmvUZUTyeXfWY
	iTRw==
X-Gm-Message-State: APzg51BbptzI08yD0uVrH4w5QA+hIwLJAjIcyCR297lBz8M3ltn2N+LP
	yxAW6yOzpUBPCETARdOYoCkmIa5I8CA=
X-Received: by 2002:a62:b4f:: with SMTP id t76-v6mr106426pfi.36.1535086548569; 
	Thu, 23 Aug 2018 21:55:48 -0700 (PDT)
Received: from cloudburst.twiddle.net
	(50-200-230-211-static.hfc.comcastbusiness.net. [50.200.230.211])
	by smtp.gmail.com with ESMTPSA id
	b21-v6sm11283326pfe.148.2018.08.23.21.55.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 21:55:47 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180814144436.679-1-peter.maydell@linaro.org>
	<20180814144436.679-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7c00fe9c-3c7a-0feb-faa3-59ec1ca219f2@linaro.org>
Date: Thu, 23 Aug 2018 21:55:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180814144436.679-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 8/8] hw/display/bcm2835_fb:
 Validate bcm2835_fb_mbox_push() config
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
X-TUID: rMf3nf7SWUoD

On 08/14/2018 07:44 AM, Peter Maydell wrote:
> Refactor bcm2835_fb_mbox_push() to work by calling
> bcm2835_fb_validate_config() and bcm2835_fb_reconfigure(),
> so that config set this way is also validated.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/display/bcm2835_fb.c | 63 ++++++++++++++++++++---------------------
>  1 file changed, 31 insertions(+), 32 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

