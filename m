Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp670373wro;
        Thu, 1 Nov 2018 04:17:39 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cRJ+mUJyJ48O17FRbWajuVpdAwx6guK00wfiZGSIfhsaG7frCZJCur3YrWFrQkQJQgkXmo
X-Received: by 2002:ac8:59:: with SMTP id i25-v6mr6292254qtg.246.1541071059354;
        Thu, 01 Nov 2018 04:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541071059; cv=none;
        d=google.com; s=arc-20160816;
        b=CQjcjRJU3W4BlwpHEN6EEzZDHOa4o6Cl0NAQKpviOwz69znuBCriuj95/QZ+rrh2Ss
         UOXfK5Q3gyCcq3GShVl7cU0TjsD4PxV9U88pw2dYOvhdgNLJBSRKSoKQ+OPtCg8DB3nM
         /qxmPIxeJwsSyUwIPfNrX1CFfZidlwhzMgQ2wWg1+yj45TswLTjUtYi54nB7cisZhkPB
         nxhDE/1FAdvUynB52h0lR5PXlyqOi6B1Gbt72AGR7SXxFjc8n8wdS0EpDR14ZauivX9u
         6YK4LVYKqrMRhpwIF2uNMP+IuS0IaSZqyHjA8P9W8fKLk8AgkysTO8QFez/U9vYGYpu1
         Vh3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:dkim-signature;
        bh=iZCihtW9ETAXy4kQH+lf8682ihaSTChjpLnN2KWLiRQ=;
        b=z4chxMrHs9H2swFKLHC6pNpRZmXafU/glfT4XwIxY6qyXoYSq31XCX0RsNRCfg0oun
         RxTk8197zJcuGCMiuJsiAyXBBKzcYd9OgAdg35JvpBrZR3tf69zXm6TT6UK93M0FyGF4
         OK1rT10laDuTIRCJi4MWRIyckxngMyyjDJF96AEBWtWT7UPc3lo+/4Ryqcc27tsUfjSv
         3mgabIw1qsn6U2EouUohi+Q/7NuvTC2w9Wlep5X16dNaav2JA6PevKiA/6ryoFvilU/V
         UE8MplBiP+X5czfIANs5xWP9l1vyvcAOp15o8FS4RBjbHt1LxFFCOHM2JW01YqEzkmP2
         jxLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mail.ru header.s=mail2 header.b=opR3Y1W4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v62-v6si10404792qtd.320.2018.11.01.04.17.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 04:17:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mail.ru header.s=mail2 header.b=opR3Y1W4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41448 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIAyo-0005yf-S2
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 07:17:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jusual@mail.ru>) id 1gIAyG-0004yc-3v
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 07:17:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jusual@mail.ru>) id 1gIAyB-00047c-6p
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 07:17:04 -0400
Received: from smtp36.i.mail.ru ([94.100.177.96]:54316)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jusual@mail.ru>)
	id 1gIAyA-00045H-Q0; Thu, 01 Nov 2018 07:16:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail2; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=iZCihtW9ETAXy4kQH+lf8682ihaSTChjpLnN2KWLiRQ=; 
	b=opR3Y1W47fhc1fw+bL2qWD7PXmiE/wPMxeGKUp9I7wm/6UkO7OGorShae4xbq5gpODaoo86gguPxy42x/vW59HIfyfgvJc4pE1Y1ZLMEsSpr9rGNmW7P6haxFC4O2dVTYzMe3Kr0fNE7qu+fNA2oDN86KGCxX9aYNxmZ+DKTWug=;
Received: by smtp36.i.mail.ru with esmtpa (envelope-from <jusual@mail.ru>)
	id 1gIAy8-0002Sr-2m; Thu, 01 Nov 2018 14:16:56 +0300
To: =?UTF-8?Q?Steffen_G=c3=b6rtz?= <contrib@steffen-goertz.de>,
	qemu-devel@nongnu.org
References: <20181031002526.14262-1-contrib@steffen-goertz.de>
	<20181031002526.14262-3-contrib@steffen-goertz.de>
Message-ID: <93e1b8e1-c8f2-6a61-122a-8354b933782c@mail.ru>
Date: Thu, 1 Nov 2018 11:16:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181031002526.14262-3-contrib@steffen-goertz.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp36.i.mail.ru; auth=pass smtp.auth=jusual@mail.ru
	smtp.mailfrom=jusual@mail.ru
X-77F55803: u+RjvvemC9BaeFBL0qwpQTnPfOaH4wr5Ieb1VZ32FD83aHxZKJFwHZ1bcfbQTLZX
X-7FA49CB5: 0D63561A33F958A51F71F426DCEB465122AE38C1EA135222DF8DAD84FE64CBF08941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB7666BA297DBC24807EA117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C2249B1880DAAC9D7D4AB3AA81AA40904B5D9CF19DD082D7633A0E7DDDDC251EA7DABD81D268191BDAD3D78DA827A17800CE7DDC7D75114324D02CD04E86FAF290E2D40A5AABA2AD3711975ECD9A6C639B01B78DA827A17800CE7BE2EA2CB88ADC8A3EE788D65FB61142075ECD9A6C639B01B4E70A05D1297E1BBC6867C52282FAC85084A3168D6E26DF927F269C8F02392CD5571747095F342E88FB05168BE4CE3AF
X-Mailru-Sender: 42ECD68FB001EF9589BB0A53C8470BCA20D526A588592893F624CC1C48AD9E8C46D5F5DDF2E85CF7BCD5BA2C93075E1EC77752E0C033A69E882C431543FD75E20226C39053983FF03453F38A29522196
X-Mras: OK
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 94.100.177.96
Subject: Re: [Qemu-arm] [PATCH v3 02/13] arm: Add header to host common
 definition for nRF51 SOC peripherals
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
From: Julia Suvorova via Qemu-arm <qemu-arm@nongnu.org>
Reply-To: Julia Suvorova <jusual@mail.ru>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Jim Mussared <jim@groklearning.com>,
	"open list:NRF51" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MC6HDZRBIK1N

On 31.10.2018 00:25, Steffen Görtz wrote:
> Adds a header that provides definitions that are used
> across nRF51 peripherals
> 
> Signed-off-by: Steffen Görtz <contrib@steffen-goertz.de>
> ---
>   hw/arm/nrf51_soc.c           | 33 ++++++++++-----------------
>   include/hw/arm/nrf51.h       | 44 ++++++++++++++++++++++++++++++++++++
>   include/hw/char/nrf51_uart.h |  1 -
>   3 files changed, 56 insertions(+), 22 deletions(-)
>   create mode 100644 include/hw/arm/nrf51.h


Why do we need an extra file for this? nrf51_soc.h seemed like a good fit.
What's the purpose of renaming?

Best regards, Julia Suvorova.

