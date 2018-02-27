Received: by 10.28.71.27 with SMTP id u27csp5290225wma;
        Tue, 27 Feb 2018 13:36:44 -0800 (PST)
X-Google-Smtp-Source: AH8x225pNLOaPqyOpdRsrw0k0zpVudMN7JNLmy2BWU49hQ1svwy0A50Kg7pZKXGXavDQ7ZHM1wH9
X-Received: by 10.129.161.16 with SMTP id y16mr10362267ywg.168.1519767404731;
        Tue, 27 Feb 2018 13:36:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519767404; cv=none;
        d=google.com; s=arc-20160816;
        b=ii3D3Nc+nZFeOsH9QN6+BOU0SZQnrNcXnuNKlm+wejwkIyO8ZAveiexUC26B74w7Wg
         eqLgSttrMTXSYpA/U8iK6tjkhkAcyDTPKoRfMn8gbua7TxV0NJ6hxMVCw4ks9hX4T+rC
         yS2nave5b8RnCxMcHk38d83i+W/wSJWyoaw7jsfmAf2F1xy4HTc/GdoeN8HdL2XMGzhB
         d9kXotZ+jeJhmxIxzlWQF4MOes/RQ7ApJHQK6L1t6HgO23+i+tA4ZWtFukc8sJkA1G/T
         43WTKAWIw46410mDlEHABAldEiZTjWEctbAgGx0IbtMVXo+sMFZSsfAanq+LQIrTUEgw
         UpdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=l3MDuPjSIL7Kc620AkS7hz1vkMsn1yMDhpCy2tXca9o=;
        b=jJBM3IsmTOestmvuZXjErvlCKJGapTCNywx14PKNmVYFdRvZjmCd9KuTw99daYJPdW
         UkdK3lL+c5/YY13h0G4oVafs0ZDfELY2WuBrvisfALleIFC4GwNUWdFNc325qlPI1Av7
         AocjjgHMbybPbCb8X+Rq3j28x7kGUYTKXPr4Skh/bTU49lgVRfCFygyhjH8D/J9bgq8H
         r9VtXqVFPuU2R5PQh1RVk3b8iweoZjBuL4H/KShRU6eALlRNyh4fK8Z09ey80gFjamXp
         HaspjK4a1gGbItHE3FYWB4GoPp3yiRw7X8yMfW36oiWRx+T192ai+fQZQqRWTd7Z+Jac
         nP6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KajaM86N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c187-v6si20465ybb.124.2018.02.27.13.36.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 13:36:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KajaM86N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40224 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqmvU-0000GS-5h
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 16:36:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqmvI-0000Ev-Dx
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 16:36:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqmvF-0003SL-Cz
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 16:36:32 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:38697)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eqmvF-0003Ro-6C
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 16:36:29 -0500
Received: by mail-pg0-x241.google.com with SMTP id l24so117877pgc.5
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 13:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=l3MDuPjSIL7Kc620AkS7hz1vkMsn1yMDhpCy2tXca9o=;
	b=KajaM86NxXIiOLtxQ4DbZON6BnkEFQtekEPuzZH76m5vpEoJ8wgu9VcFm5nkLSHEv+
	sidqlixjwhw/Kj2ucxZNYP+5+zxBeaBZuVVtFE3zTZQCPZSGJRPZOG4svBKnIZUWWsSL
	Th/svLM9vLLIJq2Hk43RYLByJh/2De4l8yLnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=l3MDuPjSIL7Kc620AkS7hz1vkMsn1yMDhpCy2tXca9o=;
	b=Wdz1wnyVwvxSBefi+YxPhVkVd1V7yNuDOqEWNeQnFPCsCfcYG/f6DdqPHqEbzxEaDT
	DQXOwiLgxiwRgQsANAYkN4L5JsFF91UMwulcB2KbC4WHRTjSZd5+yh5Ltik7Hhy1W/pL
	+4X7RKgp1/CVMoL7uCvAosyTtzuqqvnGx1Q+3Nwi6HcDIRbz6iW6QctmPU2t79ndRzyT
	OvRmoxIsU+aKKfWhWvWePqNX1uuRFscSkL4wspYUUh6phv50zwlSihIongwIykk1xPx6
	pQ76HXUJ4ktjxbSSXqheCDY0NA7aIgK9dHoW2yhQGH5tL4MW9ef6qCvdDKxQzaNNHtVK
	j+Og==
X-Gm-Message-State: APf1xPAjVr+X6Vs9Y/LnCdovV1mcewtDiP93saCZLBqeydusWkLm5Yms
	f6iKZY9fB6JdKS2Ose5utou9KWQJnc0=
X-Received: by 10.101.101.10 with SMTP id x10mr12573140pgv.223.1519767388116; 
	Tue, 27 Feb 2018 13:36:28 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147])
	by smtp.gmail.com with ESMTPSA id v186sm132808pfb.5.2018.02.27.13.36.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 13:36:26 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c3257e8f-8709-7388-3bce-38f61c45935d@linaro.org>
Date: Tue, 27 Feb 2018 13:36:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220180325.29818-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 14/19] hw/misc/tz-ppc: Model
 TrustZone peripheral protection controller
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
X-TUID: CZwg4ClKw1Ut

On 02/20/2018 10:03 AM, Peter Maydell wrote:
> Add a model of the TrustZone peripheral protection controller (PPC),
> which is used to gate transactions to non-TZ-aware peripherals so
> that secure software can configure them to not be accessible to
> non-secure software.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/misc/Makefile.objs           |   2 +
>  include/hw/misc/tz-ppc.h        | 101 ++++++++++++++
>  hw/misc/tz-ppc.c                | 302 ++++++++++++++++++++++++++++++++++++++++
>  default-configs/arm-softmmu.mak |   2 +
>  hw/misc/trace-events            |  11 ++
>  5 files changed, 418 insertions(+)
>  create mode 100644 include/hw/misc/tz-ppc.h
>  create mode 100644 hw/misc/tz-ppc.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
