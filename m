Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3766843wrx;
        Tue, 23 Apr 2019 11:08:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyFw+jklPpahn9UqbuyiUgQj7WY1LMe05e6gAESNyxeZaUcJqQgRQ+S4nTe+gckp9sdOL9M
X-Received: by 2002:a1c:2b41:: with SMTP id r62mr3160121wmr.94.1556042906084;
        Tue, 23 Apr 2019 11:08:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556042906; cv=none;
        d=google.com; s=arc-20160816;
        b=vg4nHQAkfQJRDOcRN73PdsstGUqFIGA4Q/gpjFgdfLDqrOFnUkRWyrR0WvjuSoqF8B
         HAQA8zp0FA/tz9ACQpA6M0ITS7xUuOYDuvzK9NVllK1QX9ibUl3CDNvC4JZ2Dt87telJ
         b8MyvaS05oys1udWeBZdap3ONLnl1Mqa5RJMYcqgWS3Yn6z3eAsRKVnIVe97fWqtemzg
         UkT81kF6iNEfJ+1sZlHifJsYTxRgwqfdZ6sZHCRX7Yqb2PTkExB8+T/cok377KSLPUAk
         2+TgcD1ifqBDk/NW4+EcuItfn8q2WzaD9kb3Q4lZttYMVvBcIbg7UDaOOg6fJKeKibTA
         E2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=RLSi04VfP+nHRsWhvLYZJ8KBoIp2PuqT2/cVUyLbCbE=;
        b=Ob1fMoRQy/pN4tO+PZzQVbNuidtNbCPNhjzc8Wang9/oAYsaZSSsr8qecOxVELNHvn
         QEeFExLU+wm05Is/2EqMQG7MmkRYVgwOfqRWRnzUA4JAATIiS/zcsaVsqlNzA0bQy5y9
         WEUEhezLXxeJqa3+yi5BMioexYSt4gn7KZRyQPPIjGd7ftaN4OBFnjRkRXKWmu5FZtKA
         YtAAtjkH6UO+NB/IxgZnvB37924UzvqIDdCX9T2z9rewY1rWhmqAzYo8MjDpdfDKwKmh
         qS00pC/eTpI4+YCbFbjvuUN+mljxc1ptw7cZHzwX2/zpKlL3QqNxxO5+HJ062YnQdR1W
         fw7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B1ET1JRS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b62si11510667wmc.185.2019.04.23.11.08.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 11:08:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B1ET1JRS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:57734 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hIzqD-0006Bh-79
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 14:08:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hIzq5-0006Ba-G4
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 14:08:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hIzq4-0005WY-Jz
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 14:08:17 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:38328)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hIzq2-0005Vh-R8
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 14:08:15 -0400
Received: by mail-pg1-x544.google.com with SMTP id j26so7996778pgl.5
	for <qemu-arm@nongnu.org>; Tue, 23 Apr 2019 11:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=RLSi04VfP+nHRsWhvLYZJ8KBoIp2PuqT2/cVUyLbCbE=;
	b=B1ET1JRSUg6YrQ5158g4U6VTrCmzpyQdsQBnKTUP/gN12V486CKonOHp8ErnozVUq3
	uAHBrDNHpHO/3RoPrLM+mVMX6z4YIHWO0d3Se+GfMg9kBRN7B5Ey8qhjF7pwzFgVLmMt
	dvlfbkhjx3aOaUR4sMCUDomVlGBgGfdqGrt7Lo15IE1pe/mPqj6xjVJxZw8uBDb/ZA4x
	tC+MeN5563oAoFk5XzJd1rHxI9pD2vBvqpAbToNRnLh0rvhjnfH7/bYxz5988OnOkD7S
	3DFQNwJzPhLr26ADl27qCfAxzCgJ0S251pM6faZYZLc+6OskO/0tWa1zp/g2AgRmH478
	E8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RLSi04VfP+nHRsWhvLYZJ8KBoIp2PuqT2/cVUyLbCbE=;
	b=ZNl/UEGdl8qbXL9XcX3kmL6DuNwN4MNHOTIQxFOJmSe2X+dA2OU61Er5sW+nmWAEvL
	K6SnOZx2aMEDMO0jBuAwkovylw0UcrewUCGGwJJelyP+DbRorUJPXMsrtzrg09KEVWZd
	eDq5g+9UcCFtzz01Yi9SyL0CxjIQafqLGkNvioRIeZiChaC7gix1XZx7HWgqm8eHkeU9
	tXPa31SRUyalOBY9JRwZOIT2hY7NnyaoyGnapT9WefVO1zK4u6qTn/Kv26kAZDeo5Qlg
	kM+CgiD1nU5eAVNpf2C/44D5eNJvvwzOM38DyZwyFSzHydcXng1uhx7gqXliIYwH4y4M
	1A2g==
X-Gm-Message-State: APjAAAUKzVnKUpz+mUssxWsoCm5RUrX1Zlpv1ytSlNdhEVAHVSPZTH/m
	7+zNarBtkv5m6Jshd4Lgs2IAS0JqlGw=
X-Received: by 2002:a63:8f4b:: with SMTP id r11mr26129831pgn.271.1556042893705;
	Tue, 23 Apr 2019 11:08:13 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	h16sm7072476pfr.101.2019.04.23.11.08.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 11:08:12 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <42db75fd-84a8-eb45-b1e7-d64c3201440d@linaro.org>
Date: Tue, 23 Apr 2019 11:08:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 04/26] target/arm: Disable most
 VFP sysregs for M-profile
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
X-TUID: De3CFE38QyoF

On 4/16/19 5:57 AM, Peter Maydell wrote:
> The only "system register" that M-profile floating point exposes
> via the VMRS/VMRS instructions is FPSCR, and it does not have
> the odd special case for rd==15. Add a check to ensure we only
> expose FPSCR.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

