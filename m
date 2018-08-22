Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2485910wrd;
        Tue, 21 Aug 2018 17:05:26 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyeroIlFih3RNzp0X+dLZLso0H9/FIXQRoLjhyOJ4tqRQPB5bU18xvaje+Ny+ORWto4v435
X-Received: by 2002:aed:39ea:: with SMTP id m97-v6mr49987485qte.30.1534896326466;
        Tue, 21 Aug 2018 17:05:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534896326; cv=none;
        d=google.com; s=arc-20160816;
        b=VvCJNRIeyl1kgXKqTgz16ODFB8yeiy/TQjA9cg9sm/Irk1crczlBnNuS1aQPNasCth
         XRwhHSVm+DbDFNtfZoL87UIs09omJ+/qzO4lVa/jzW3aa4K7wGFCNiliAOqHXCwmBL/+
         jwgkwfuCa/jNCAVITpVLVXlwJADb3mH6ugnt0ritrPwxEKqEE+mDTGzHv6yMw2TyjILy
         QypEjBGKExcio1yvzTSE4r/N8kkz1jR1hRvKDupDIBa5p/7a+ZF3VqHKF8Tz6uxQW+Ux
         Um3b8xOj6E4iRcBkAsZElXI+P+XNur9gYHaBzTZsNFewvgikfdxwkd7czuGExvK6JN8W
         VSug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :arc-authentication-results;
        bh=ehktd0N/9VdlXtdKKbLCDCpqYr84xAg4xUHrLVbVLm4=;
        b=AqKMCupB9SgR6or88d48yGFqRQ2NCSpoSsvpTHsu96bnSXBTe552dZjk7nMPA8PW51
         +I0+6DWS6nRHug+k6M8+tVtBdKBmv16A6bNQLdqcUDUmCIMRSSjP3KuscKIBn5lgEF/c
         xzsWQFyRLpTRhjW0mpcpGrNe5l8OjuuWtlE0swQLYJ4w1h/aIhebxjoqvj6yRpvSNjoX
         nSeB6QVZpra4JfX7t3brEA/XXyOLdu/g+Gc1/SP+tRjWT5a1l9gz7dYwF2k3zwvJ1Hx0
         5F1kZddytdlQT3BZ1DUkhW8BssSSEFJ1MswSLEARZ1BpEnKsvHw0cS0i6t6Ftnq2L8y9
         ZRsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 9-v6si166873qvv.164.2018.08.21.17.05.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Aug 2018 17:05:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56306 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsGeM-0008I4-0g
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 20:05:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>) id 1fsGeG-0008Hy-78
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 20:05:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>) id 1fsGeA-00068q-FY
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 20:05:19 -0400
Received: from steffen-goertz.de ([88.198.119.201]:43802)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>)
	id 1fsGe6-00062B-VR; Tue, 21 Aug 2018 20:05:13 -0400
Received: from [10.208.128.112] (unknown [31.221.87.81])
	by steffen-goertz.de (Postfix) with ESMTPSA id 8F5B840D2C;
	Wed, 22 Aug 2018 02:04:45 +0200 (CEST)
To: Julia Suvorova <jusual@mail.ru>, =?UTF-8?Q?Steffen_G=c3=b6rtz?=
	<contrib@steffen-goertz.de>
References: <20180811090836.4024-1-contrib@steffen-goertz.de>
	<20180811090836.4024-7-contrib@steffen-goertz.de>
	<CAFEAcA_=8r_X_rLfwJovEkusBb6hmaG5Ns8YQxQMLL4z0KpHXw@mail.gmail.com>
	<6c13fca2-6f16-adb0-1072-7601abefd18d@steffen-goertz.de>
	<156619bb-c1c8-3338-b327-6dd298aa16cf@mail.ru>
From: =?UTF-8?Q?Steffen_G=c3=b6rtz?= <mail@steffen-goertz.de>
Openpgp: preference=signencrypt
Message-ID: <bc011767-e750-992f-7263-021e1b622021@steffen-goertz.de>
Date: Wed, 22 Aug 2018 02:05:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <156619bb-c1c8-3338-b327-6dd298aa16cf@mail.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 6/7] arm: Instantiate nRF51
 peripherals
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0q5UCBki1SZL

Hi Julia,
> Do you need this stub to run micropython code? Could you delete this,
> please, so that I can post the correct stub structures for js
> directly on Joel's code?
Sure i can remove the code from my patch. micropython will not work but i dont think this is a problem as long as you provide patches shortly after. 

Steffen
