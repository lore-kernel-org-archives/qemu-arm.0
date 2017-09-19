Received: by 10.223.172.38 with SMTP id v35csp5227354wrc;
        Tue, 19 Sep 2017 11:07:54 -0700 (PDT)
X-Received: by 10.237.63.15 with SMTP id p15mr3266641qtf.113.1505844474315;
        Tue, 19 Sep 2017 11:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505844474; cv=none;
        d=google.com; s=arc-20160816;
        b=pjFQqBepAf/aFmQ0HWijRGTxNSi9pzBUKRiTB7EWensHXvAnTL7hVINCtomaHEvGNM
         h3PT7fKt8Rh7CrjTg7enO7NleXDM8QxmyJ1xcNmDzrwhgsIgBfuA/gRzjFvQWsCZivuP
         t8PWfR4zDs1fznF5GvokVlCZnS3PnXBT0jVy1QJ4jqLQWrKO/wZUkjaKC3O8GX93lly1
         h9TteaRYsw1Kb1Eyp9XsUduO3RYi3zg9tEnE7EOSAWzVvC3JXI42KKkSTnJx7zhG38vm
         Paf0GTy6HsZ11BC1AB4SHIMnVdcBz/MD303jWUrpIeF9IXNE9JFKiCH2JsaL64s/pkns
         d/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=xagJpXtQqXwXS91w4yJFpiCorz5d7rkbFBRRZPxx1Hc=;
        b=UhuafuNkvCwrtTD+9hiqLH7RnLR75/gv87lko4kG8rujhKUFEuWbAK0dYBYx6l/CxB
         qBqfXQNbK+fartVdNU37nuAurTfLZ8w54d9mPUQk8JS18PiDpNNyVxUoZBD9S0aEqJs7
         e1px5hmT6d4/sxMs5DBnWkJmJTzxlVN7I8Grw3jgUdeAtx9OnUQyklQsI+0p41YlRL5B
         Y0b04QDxYKoPJJDdmwbWcp4u5MbQqKPEPiQ7h3jQNCWDrrWzdt3+vsSo+mNFFJ60bSuY
         b/v+2cRgtGE/Vf708orPNCGrxrAtmYXGnD2clcBZnMJyUZxLej9tcd6eda3kPF5N6Gy/
         WZ2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bG3ZraQ2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q10si851075qtb.128.2017.09.19.11.07.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 11:07:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bG3ZraQ2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44678 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duMw4-0002nu-1q
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 14:07:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duMtC-0000oq-E8
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 14:04:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duMt8-0002eh-OF
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 14:04:54 -0400
Received: from mail-io0-x22f.google.com ([2607:f8b0:4001:c06::22f]:53015)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1duMt8-0002ct-K6
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 14:04:50 -0400
Received: by mail-io0-x22f.google.com with SMTP id i197so1026989ioe.9
	for <qemu-devel@nongnu.org>; Tue, 19 Sep 2017 11:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=xagJpXtQqXwXS91w4yJFpiCorz5d7rkbFBRRZPxx1Hc=;
	b=bG3ZraQ22dly9EkVP7lq0Nv065vyado0zFfyznBIKN7RGgcZQFR1au879WNfA1agcs
	BtWSmPJoVMFFqIfbZLRSPza7HpP//asJ/RcNelr3VvbThZEi7HPxWgsajIdkmPTPa4bs
	NOsxXuDHBI2uM0iO09m/9bkyrnj7yq4YfTSfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xagJpXtQqXwXS91w4yJFpiCorz5d7rkbFBRRZPxx1Hc=;
	b=LiBXRY731Ma1IcK50A0yGY4CYpvJyomHlJxYTUueRuspz/noFy+FwfcMLf/IakRhhf
	7itD55+IUAIjDO8lCMFzuZwjM0oUVz5VGaMQYuwBbqloEOHoINM3x3T8EY9ZEHTEjvuz
	mscFZ1LzTZMiHyThd0D0Es1y2lUjPaa66uvhGAJ4qLHRi/xofNqK+ZWKN0FM6EQum7BA
	8fH8A1czxbpdYj0lTdpMTRcY3PMKsACYeqcOHbm+SJ5WfoWValkuT4wJQhQAq5P8ohjy
	ptMVOyVjcgixIX6qg0OZgNLz+l8Si5XU6seVDlEQaUyuDGChkuGYRbSWcems/SD7d4B5
	FkAA==
X-Gm-Message-State: AHPjjUjsXkGizTteWAZgYaLufSuUKQXcZXWuvWDQXD7TFoB3vs+1M2fH
	P67Mufb+ZA4oEbB0I/roi49gwqifjK8=
X-Google-Smtp-Source: AOwi7QDjP5aQlMQytg9tel3tYvQD/1l+mVyzXhA/5q+4NwGUhBtx2BVQrHmwtD9L3HoPITfEMtqPlA==
X-Received: by 10.202.80.81 with SMTP id e78mr2308668oib.136.1505844289625;
	Tue, 19 Sep 2017 11:04:49 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162])
	by smtp.gmail.com with ESMTPSA id u50sm589660otb.45.2017.09.19.11.04.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 11:04:48 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
	<1505240046-11454-7-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <32166eca-14d9-63b3-cfc7-d7b63066cdc7@linaro.org>
Date: Tue, 19 Sep 2017 13:04:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505240046-11454-7-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::22f
Subject: Re: [Qemu-devel] [PATCH 06/19] nvic: Make ICSR.RETTOBASE handle
 banked exceptions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ohdSAsrLPp8G

On 09/12/2017 01:13 PM, Peter Maydell wrote:
> Update the code in nvic_rettobase() so that it checks the
> sec_vectors[] array as well as the vectors[] array if needed.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
