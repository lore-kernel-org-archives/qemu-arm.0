Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp739973wrt;
        Tue, 25 Sep 2018 07:25:24 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60UXFCPEpVNhy16fjOxW3FQJxZT8cI2/rqvEGLdRa12poSej3TFSoFZqp/bJuoF2JIixe2N
X-Received: by 2002:a37:2c84:: with SMTP id s126-v6mr842765qkh.311.1537885524215;
        Tue, 25 Sep 2018 07:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537885524; cv=none;
        d=google.com; s=arc-20160816;
        b=AclUeiNcbFOSYOMTHwJBE7CEre+pNcjBrpFICD8G4iNMqYSpxb0iG7c6FHZ3zYwFVA
         tBlP5AOFXIpmCSaoD9zY6GCD6IhsMfLzVFJu2imm9jmNKMJY/NWHD7J15erXGnONeINj
         SBF2O+4h5IFwsDxwQh4biPebyn5qWF8E163xbwVm/i01dSXh+3fJj/FbYh/dnzjxTjCS
         JrbkC9Lgnpo3QkLnnSKavCXx6UeqUWH0F0Zcn+6kVHlMDPa8fpH3fku72z2WEOlKEQqS
         InyPPMeBazMQX6oWsSoxxQ0dykbvqgYRs/6mXhurACOpSNMr3bG5Iwymmb4nhAz5Lwq9
         S0SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=noxKatqW7docA6ip238cA++DInnk0qH7ApcJlxR938s=;
        b=QZJTxBOBeucaDdnjbmb4bKSToFBb3CvYYkwmK6FPctUBkHQHENOAaIKaXb7OCFeH9j
         H/A6oVXkziOmaKN4adOozqgQJI1qPiWdSYuEKxmVdYCquCg2EodVk6CecoIwhGdP8Z+j
         1EvWcsCyxGO67Yz90v/o/jMI6q6ZUJbY7g0iH5D8vdvdtFj8lCIWHCM/014vhB3d2P2B
         wVrPvsPT32uSrvY1EzMdMuAKy0nx1xgnPrG9bUDPYkH0b1os/w264wxUpp7mGi12ATb1
         61MdpZbyWie9eRb13r2q/E2xZu3vBM2DSOGpzGCa2GLgvuhfOc2oyZpfNJ2ZFJvGj+vR
         dwCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i37-v6si2115523qte.298.2018.09.25.07.25.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 07:25:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53435 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4oHD-0001XW-OZ
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 10:25:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>) id 1g4oDd-0007D1-Vh
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 10:21:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>) id 1g4oDY-0002Km-V1
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 10:21:41 -0400
Received: from steffen-goertz.de ([88.198.119.201]:50818)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>)
	id 1g4oDY-0002Jd-L5; Tue, 25 Sep 2018 10:21:36 -0400
Received: from [192.168.2.117] (p5DEE3244.dip0.t-ipconnect.de [93.238.50.68])
	by steffen-goertz.de (Postfix) with ESMTPSA id 6DB904DB6E;
	Tue, 25 Sep 2018 16:20:02 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20180831220920.27113-1-joel@jms.id.au>
	<CAFEAcA_PQS2zc3Wdn1PTZOZY5CBjJw6UE2QP-Qc2A26bNr-4ug@mail.gmail.com>
From: =?UTF-8?Q?Steffen_G=c3=b6rtz?= <mail@steffen-goertz.de>
Openpgp: preference=signencrypt
Message-ID: <0ccbbe2a-768d-46fb-f667-0acc7e453e42@steffen-goertz.de>
Date: Tue, 25 Sep 2018 10:21:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_PQS2zc3Wdn1PTZOZY5CBjJw6UE2QP-Qc2A26bNr-4ug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: Re: [Qemu-arm] [PATCH v6 0/3] arm: Add nRF51 SoC and micro:bit
 machine
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?Q?Steffen_G=c3=b6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VTBnqLPsWSCf

Great news!
I will respin my patch series with the peripherals!

Cheers,
Steffen

On 9/25/18 6:22 AM, Peter Maydell wrote:
> On 31 August 2018 at 23:09, Joel Stanley <joel@jms.id.au> wrote:
>> v6: Rework based on Peter's review
>> v5: Change back to ARMv7M from ARMMProfile
>> v4: Fix number of IRQs
>> v3: Rebase on Stefan's cortex-m0 series
>> v2: Addresses review from Peter and Stefan
>>
>> This short series implements a minimal definition of the Nordic
>> Semiconductor nRF51, a Cortex-M0 ARM SoC, and the BBC micro:bit, a
>> machine that will use this SoC.
>>
>> Joel Stanley (3):
>>   MAINTAINERS: Add NRF51 entry
>>   arm: Add Nordic Semiconductor nRF51 SoC
>>   arm: Add BBC micro:bit machine
> 
> Applied to target-arm.next, thanks.
> 
> -- PMM
> 
