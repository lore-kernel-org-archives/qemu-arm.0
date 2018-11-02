Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2261088wro;
        Fri, 2 Nov 2018 08:39:58 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cZxu0DKmcsMm6W0yjEQ6KgGZbllDoUSXC21xWQ8fKB0yFFPTXdYuqSwBsl2cBDqes3Kctq
X-Received: by 2002:a0c:88e6:: with SMTP id 35mr11381373qvo.61.1541173198132;
        Fri, 02 Nov 2018 08:39:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541173198; cv=none;
        d=google.com; s=arc-20160816;
        b=fpB/pUiGskmqb0zgYGdY51GhNFwxQENpsN72eCdSF4Dp9byTlylABQIlhSvi5dOy8/
         lsEpxhBQA03Yqr1ppSwQHMgaRBO7kiu+ymi/B7w51pZ1XwMWbDnpldmJT96kyIALmpsP
         PYbrzkILyEF76iGa7CoUMtX1aiI38ewWAWd3Ig5vRiCZ19VtJIAQqtZF6Pst6yq1UUa9
         WVDv2I8p9jUorRITEV9a+AVxhh8rrnt9xmzU5DB73DU9t+Bxo3BbB4f7QmSZkOGbp/tR
         eC50+cS3f2XHZykYeitTBCjnD+NkZ/99wG267hif+u4E0wSmuCIX8qfPRBfcMEhBmh7W
         WKjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=Kyj8+kNf9U2VqBXgDNflLcsWIwrTnrZG/tTXw6gsi0g=;
        b=EyzOqeUZDjBjBFONOK1Tt/dsJhIKWGhu1RfnO4IR0RJMnnuCeN6CbeILyFdygP0nmt
         5f5yQ5BwjKfibX1pU634pKCeUMJ9d4s+J7kA+Gtthpr4nn3AmZ/Abb9mkqetwVPhi7e2
         2PAdNkmNdm2V2mMFsTN7iFzcw4OKs6auxE8n8Ws6OLuwhBdRcN9IfxvaxyBQB3E/K73+
         XWBYNto3X02MSMmGUxVV04CO0uaMiGGJFiO1lOL8OUrDOjtGT2eJNBa4Quw8F27oivai
         doc8teVjfBaBIqLJeOzwBlf/+N9XO1iydvGC/3QlLDDpJwJCI/jmVwreYOsn7KH6kdc9
         aOqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n3si833208qte.138.2018.11.02.08.39.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 08:39:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52228 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIbYD-0005B0-Iz
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 11:39:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>) id 1gIbXz-00058W-UJ
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 11:39:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>) id 1gIbXq-00019y-UA
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 11:39:38 -0400
Received: from steffen-goertz.de ([88.198.119.201]:33078)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>)
	id 1gIbXf-00010B-8R; Fri, 02 Nov 2018 11:39:24 -0400
Received: from [172.27.223.37] (unknown [192.76.177.125])
	by steffen-goertz.de (Postfix) with ESMTPSA id 54C574FF03;
	Fri,  2 Nov 2018 16:36:31 +0100 (CET)
To: Julia Suvorova <jusual@mail.ru>, =?UTF-8?Q?Steffen_G=c3=b6rtz?=
	<contrib@steffen-goertz.de>, qemu-devel@nongnu.org
References: <20181031002526.14262-1-contrib@steffen-goertz.de>
	<20181031002526.14262-3-contrib@steffen-goertz.de>
	<93e1b8e1-c8f2-6a61-122a-8354b933782c@mail.ru>
From: =?UTF-8?Q?Steffen_G=c3=b6rtz?= <mail@steffen-goertz.de>
Openpgp: preference=signencrypt
Message-ID: <a9a9af81-dbbd-0145-a245-e3c2f50e964c@steffen-goertz.de>
Date: Fri, 2 Nov 2018 11:39:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <93e1b8e1-c8f2-6a61-122a-8354b933782c@mail.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Jim Mussared <jim@groklearning.com>,
	"open list:NRF51" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HeZ0uLDErmuE

Hi Julia,

> Why do we need an extra file for this? nrf51_soc.h seemed like a good fit.

nrf51_soc.h is not included in the peripheral devices. It would be possible to put the definitions into nrf51_soc.h but i just did not want to mix up the dependency directions. 

> What's the purpose of renaming?

To avoid name conflicts down the road.

Cheers,
Steffen


