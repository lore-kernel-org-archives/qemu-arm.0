Received: by 10.25.21.96 with SMTP id l93csp1378890lfi;
        Sun, 3 Jul 2016 23:59:10 -0700 (PDT)
X-Received: by 10.200.53.142 with SMTP id k14mr16808405qtb.63.1467615550129;
        Sun, 03 Jul 2016 23:59:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q184si709102qke.142.2016.07.03.23.59.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 03 Jul 2016 23:59:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45538 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bJxqX-0000Rs-Iw
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 02:59:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bJxqT-0000JF-K7
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 02:59:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bJxqP-0005EI-GS
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 02:59:04 -0400
Received: from 8.mo3.mail-out.ovh.net ([87.98.172.249]:56581)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bJxqP-0005E3-B6
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 02:59:01 -0400
Received: from player761.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 41CCFFFB8B7
	for <qemu-arm@nongnu.org>; Mon,  4 Jul 2016 08:58:55 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player761.ha.ovh.net (Postfix) with ESMTPSA id 65323480071;
	Mon,  4 Jul 2016 08:58:47 +0200 (CEST)
To: "mar.krzeminski" <mar.krzeminski@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
	<1467138270-32481-7-git-send-email-clg@kaod.org>
	<77433c2c-364a-a329-dd7b-1b80ea0f6c63@kaod.org>
	<5777F327.7050606@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f82c7ccd-b706-c2df-8593-3d64adf65192@kaod.org>
Date: Mon, 4 Jul 2016 08:58:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <5777F327.7050606@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 661747674525764494
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrvddugddvjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.172.249
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 6/9] ast2400: add SMC
 controllers (FMC and SPI)
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
Cc: kwolf@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5yO4hYylAL1F

Hello Marcin,

On 07/02/2016 07:00 PM, mar.krzeminski wrote:
>>
>> +
>> +/* CE Control Register */
>> +#define R_CE_CTRL            (0x04 / 4)
>> +#define   CTRL_EXTENDED4       4  /* 32 bit addressing for SPI */
>> +#define   CTRL_EXTENDED3       3  /* 32 bit addressing for SPI */
>> +#define   CTRL_EXTENDED2       2  /* 32 bit addressing for SPI */
>> +#define   CTRL_EXTENDED1       1  /* 32 bit addressing for SPI */
>> +#define   CTRL_EXTENDED0       0  /* 32 bit addressing for SPI */
> Hi
> 
> Above comments does not say anything.
> 

I suppose you mean that the names are confusing ? 

The default setting for CE0 and CE1 is done with the hardware strapping 
SCU70 register.

Thanks,

C.

