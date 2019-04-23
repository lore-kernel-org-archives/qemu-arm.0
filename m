Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4054078wrx;
        Tue, 23 Apr 2019 17:04:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx6pdUgMZnF1U/UxqoxXKl6DjHOPVztXPh79t+BSIOmO3VzTMd9oF6tG17SaVT3lGPGDwLt
X-Received: by 2002:a1c:eb03:: with SMTP id j3mr4275930wmh.15.1556064260312;
        Tue, 23 Apr 2019 17:04:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556064260; cv=none;
        d=google.com; s=arc-20160816;
        b=vWx8avI3bbUXxsUUJMS5QkqsOsGhlKJZyNrBdmaRk6JpcLST5nVs6+M+OsyLyzPtPU
         HibsODB76aBAjQLaox2y0faqFzJXxtJoVvU13dyZCjuzOrvLyX080Z7imOzoYylh735q
         4Br0u72zyPFYg8WVZkqCA89snHTLNWYCmdmyNeCEBEcDzlqy7TxXfhYA3ggsWfr0+UIn
         zc8wCIQ+kpOYEEuhLbmAqcKjXViTNv+yEzPkLKMf/rg++T/pdE7JOk4qCAvVqKTHiMcF
         L6MN8DMa7tseD/S5PLUmad5/US/GnKoOeWViPUKwdZfIWGMhKZnrwf7ckBJmngoDeTi4
         VUeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=pyqLEmgeTSgBOStVP69o0wQviqV5DPT/F96foFL2Qqo=;
        b=vWqjV6Ci9EnUgWrLfuQoEmh4QLYIZ6IKp0TwtLQnZjmGKHyrcDY1morJ09gZbBDYab
         nvzBw2Qjho+gYtgm75Zd/GT8mNghJIX2Vb7FUvyqNiGNjLIUAY6yEs9zXwYyEUzaGD/E
         XErrXtaarrkqvuEnJWFl/Qj0b5et7J/bpd911l1zBwwKUfI62hviO/L8CK21dVJi7UUU
         YUp0Y0pTP16pGfdbbIHeDtsE0chNxCY3NWOLbvsLwJNdU8Lc41LZOw3sSLQFhhoYNttu
         Q9Bn2fbujhSAh/sLWY6OcapZesk03+tEXe3Ll+KrjRDlE3tM/lpYgVpKbeAUarl+qQe3
         QG9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KEGDrp5S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6si12002873wmj.53.2019.04.23.17.04.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 17:04:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KEGDrp5S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:33086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJ5Od-0001e1-Ex
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 20:04:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ5OQ-0001cP-85
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 20:04:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ58Z-0004GY-NX
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 19:47:46 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:34729)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJ58Z-0004Ey-FY
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 19:47:43 -0400
Received: by mail-pg1-x541.google.com with SMTP id v12so8408211pgq.1
	for <qemu-arm@nongnu.org>; Tue, 23 Apr 2019 16:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=pyqLEmgeTSgBOStVP69o0wQviqV5DPT/F96foFL2Qqo=;
	b=KEGDrp5S/ixcS6m2keSmGukdm88KYfC4nf0TfKWHbaFOG3snJoMylS0WkssRfVV/YC
	/xi6ObVchaKrCeHSInZLhCxoqKRHs0U4rTWOy2nkXcgDz8KVkrQI/yC8VzcS5cRTrsBo
	XSeJw/EXSe84OuVugIQPsQ001N++Tf2wA3bYfCWgcdUB2Z03o5N5wpRt9929qCE1IHM9
	qdrRzA1atqQSmJyaIbboAh6G2WJ9gWsoqdJMTgE1GmXju2UM0eGoOrXELvVfnXdUhj1S
	2ZCr8AMN9ryleqRR4gWBgy1FTSDUDZNsT7R1vqC8Y97CWdoNbso3LZ8mvDrJ+4plYD+d
	odIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pyqLEmgeTSgBOStVP69o0wQviqV5DPT/F96foFL2Qqo=;
	b=FdBHvGolm5dCIkc+SW2P6uT+wyPe94b7lPTRJ6z3HB5Xjqeaw0ZmdKJJEP6PncP2kG
	Kz1gKpj7I/RmoRH+nFFBAL9o4ixmkj+qwCHLEfoKE4y1umxGNRvqk8FRNbs9Z4TUgBlH
	2nVHegw937gDSsI9oDC86RpL/TT1Z/ECSs6IyGPiaqdHqX0+saCQpBKKmUXhoOQx4fST
	kkKPdTf7C71CvvZnkYWixFe50HvDGCfRqec4dE6q83LCjeg5W3IgsekutQv76h24O5SF
	pzbjHc1qKIdlSSWFgr6V4Z3qSnWZ7LPfcTnMEAMWlzipLnWAGQ7d4w6Ys4k5nsUS6R3L
	opQA==
X-Gm-Message-State: APjAAAV0lGE+BAJ7RhmBbUtx1ewjZV1MW9hm5yp1314gWPL7/IxEF6I6
	DKD/EDJxcn6X+r6Xtjjf8RbU5g==
X-Received: by 2002:a63:cc0d:: with SMTP id x13mr27347679pgf.280.1556063260736;
	Tue, 23 Apr 2019 16:47:40 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	s21sm22684106pfm.3.2019.04.23.16.47.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 16:47:39 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <cbefe736-b85f-1b97-6ffb-07630992d3f4@linaro.org>
Date: Tue, 23 Apr 2019 16:47:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 16/26] target/arm: Move NS
 TBFLAG from bit 19 to bit 6
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e96vM94i62P9

On 4/16/19 5:57 AM, Peter Maydell wrote:
> Move the NS TBFLAG down from bit 19 to bit 6, which has not
> been used since commit c1e3781090b9d36c60 in 2015, when we
> started passing the entire MMU index in the TB flags rather
> than just a 'privilege level' bit.
> 
> This rearrangement is not strictly necessary, but means that
> we can put M-profile-only bits next to each other rather
> than scattered across the flag word.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

