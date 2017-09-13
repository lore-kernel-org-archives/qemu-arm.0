Received: by 10.223.172.38 with SMTP id v35csp205583wrc;
        Wed, 13 Sep 2017 16:09:36 -0700 (PDT)
X-Received: by 10.237.34.240 with SMTP id q45mr7291410qtc.1.1505344176540;
        Wed, 13 Sep 2017 16:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505344176; cv=none;
        d=google.com; s=arc-20160816;
        b=icNQFfySUWChyF/xSZvq7H3RMOInjIfmJKH50rLZ28EZtVJ/WVo3RhcgJ4ElFg5RDO
         6iOrsGcmoGr9Qt19o7TymQvlpSwiB52ldRpXZ3iGtF1FdsmbyCXzUhbpU80qg9jLi+DD
         Hs3yvgCsGQix3cg4I96s/Z/ZH4EzbAs89s1VRASyqQLcuQRY2ochpjNeRmcZiQQxksBF
         /4MHVgjU+sIkQmuCRporSBRE5RsDCr8xDs3UwkHKlIHUvtAAUZTYNfjtfpP3eq0nUhyi
         LoNqlWfExOGEFXWTK372ihCdhkd2Jstw+FZUqKYbgx0ZgmkhEScNZM8yuXFU827XPoQd
         Wp6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=aJ7VOuXov0xK9rkpdiPW+/MSGdn/CoRdZwW8lbSodyU=;
        b=WXzAbs0Q2oz5xyP8j0C/YpRzVNVdcotS1ZaEPyozFSfYb3NBx6ED5g5K17oZ1QxQuu
         PPSsrd5PQNKR6yu/iAH7PTYZLHldUnoxq0/FZ5bPwC17FZ0EVvOKvdpL0zCSnqT84r7k
         leTLlxwCl6t6VCVB7h9ADotq+laC0yPqNDGzr2kyJjwo8N4NLjmWe3euPowhiznxjiI0
         OC2qklIBxzUnNAa0vT0+JR4V8Sqiq9+5gQNLJitnToFvgGnF5xptk0KV+UhFS0+4LnJt
         YBNvYDTFN/S6nUAR3o5JH9mGnsi8cO5XnJgJyNnpCTxSY+QVPBWxZdq526bUtSWGfwrn
         gDZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BYB+J479;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n66si1428217qka.457.2017.09.13.16.09.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 16:09:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BYB+J479;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44962 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsGmk-00058x-AZ
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 19:09:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dsGlr-0004cH-LP
	for qemu-devel@nongnu.org; Wed, 13 Sep 2017 19:08:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dsGlm-0008LE-Mr
	for qemu-devel@nongnu.org; Wed, 13 Sep 2017 19:08:39 -0400
Received: from mail-pg0-x231.google.com ([2607:f8b0:400e:c05::231]:47867)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dsGlm-0008Kg-Gn
	for qemu-devel@nongnu.org; Wed, 13 Sep 2017 19:08:34 -0400
Received: by mail-pg0-x231.google.com with SMTP id d8so3071350pgt.4
	for <qemu-devel@nongnu.org>; Wed, 13 Sep 2017 16:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=aJ7VOuXov0xK9rkpdiPW+/MSGdn/CoRdZwW8lbSodyU=;
	b=BYB+J479T4ZAJlJjjDnDj8YJVuhbGTg6Y+xIMJTlJulM2LVpxOs9WTadEvOYB6BQW4
	vj+2aMK+GuR7cDuHe3PplMB22uUJlXisEefwrYXZlEtpCooojb3oJNkyqiaXCH/mPUxh
	BwAF5yEgn+SGEJb3twPoleceBokEX6tgnYRbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aJ7VOuXov0xK9rkpdiPW+/MSGdn/CoRdZwW8lbSodyU=;
	b=ozynYh+isWqgIQFAS/VXB1NXHwIlhze3dyOHP3w+LeLDN5H7hUpCKLi4KsFOxXnAGx
	EJGHgUsf/9SlKoDLxw1MijZAjC06AaqyDSwibQgNQ7rhDpZ1KXVNizNVYPr2dQ3V9p6k
	d/IEvW99AsbJpwHdikwJRgeQxGZ7vHLt0uZrf17TnSaRlrgQzDp88VIS5Dm7TXCwHmzX
	M4bnocr67tfFUh047U6P011EmCrc+xSNw5LaFOd/XAyUHVPvfC4fB1AkxeHmzcr748cF
	+gCBgVtXgil4OH664aKp7qAv8hutSxQn5c9H+/UvsxdG5jViGurzIvclQSRGU5CErNtH
	XQPg==
X-Gm-Message-State: AHPjjUhrCIuwU8/v95B1oeIHStIaeGE9ClqAGWNi8pP01fWXQykkduwF
	qADO3cRGnNwUQ440
X-Google-Smtp-Source: ADKCNb6rpBijX5Rm5JPgPs1NKVB+lmRlOlx4YMqgz4mx/ZVyJcSk5qhiETN2Lq3pn3227op06763eA==
X-Received: by 10.98.214.23 with SMTP id r23mr19890771pfg.195.1505344113543;
	Wed, 13 Sep 2017 16:08:33 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-103-167.tukw.qwest.net.
	[97.126.103.167]) by smtp.gmail.com with ESMTPSA id
	r138sm26152204pgr.12.2017.09.13.16.08.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 16:08:32 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
	<1505240046-11454-3-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <41634883-f5ad-a43a-d4d1-378176c95b67@linaro.org>
Date: Wed, 13 Sep 2017 16:08:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505240046-11454-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::231
Subject: Re: [Qemu-devel] [PATCH 02/19] nvic: Add banked exception states
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
X-TUID: blr5SD02PJPo

On 09/12/2017 11:13 AM, Peter Maydell wrote:
> For the v8M security extension, some exceptions must be banked
> between security states. Add the new vecinfo array which holds
> the state for the banked exceptions and migrate it if the
> CPU the NVIC is attached to implements the security extension.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/intc/armv7m_nvic.h | 14 +++++++++++++
>  hw/intc/armv7m_nvic.c         | 49 ++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 62 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

