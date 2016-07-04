Received: by 10.25.21.96 with SMTP id l93csp1453067lfi;
        Mon, 4 Jul 2016 03:40:18 -0700 (PDT)
X-Received: by 10.237.36.220 with SMTP id u28mr17944532qtc.30.1467628818057;
        Mon, 04 Jul 2016 03:40:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d82si1613433qkc.297.2016.07.04.03.40.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 03:40:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46446 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK1IX-00053u-FP
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 06:40:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK1IU-00051R-5o
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 06:40:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK1IP-0007yq-7A
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 06:40:13 -0400
Received: from 6.mo3.mail-out.ovh.net ([188.165.43.173]:44791)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bK1IP-0007yV-0p
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 06:40:09 -0400
Received: from player761.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 043D7FFBA5F
	for <qemu-arm@nongnu.org>; Mon,  4 Jul 2016 12:40:07 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player761.ha.ovh.net (Postfix) with ESMTPSA id 86010480528;
	Mon,  4 Jul 2016 11:50:43 +0200 (CEST)
To: "mar.krzeminski" <mar.krzeminski@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
	<1467138270-32481-10-git-send-email-clg@kaod.org>
	<5778025A.9020608@gmail.com>
	<8ace1056-de8d-cfbb-9e63-e0e26df71952@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <30d38fa7-2434-5d02-232c-62439be1f84e@kaod.org>
Date: Mon, 4 Jul 2016 11:50:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <8ace1056-de8d-cfbb-9e63-e0e26df71952@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 3565443534189136816
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrvddvgddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 188.165.43.173
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 9/9] tests: add a m25p80 test
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
X-TUID: OTgmDuZ3/PWF

>>> +static void test_erase_sector(void)
>>> +{
>>> +    uint32_t some_page_addr = 0x600 * PAGE_SIZE;
>>> +    uint32_t page[PAGE_SIZE / 4];
>>> +    int i;
>>> +
>>> +    spi_conf(CONF_ENABLE_W0);
>>> +
>>> +    spi_ctrl_start_user();
>>> +    writeb(AST2400_FLASH_BASE, WREN);
>>> +    writeb(AST2400_FLASH_BASE, EN_4BYTE_ADDR);
>>> +    writeb(AST2400_FLASH_BASE, ERASE_SECTOR);
>>> +    writel(AST2400_FLASH_BASE, cpu_to_be32(some_page_addr));
>> Hi,
>>
>> I think you should not make any byte swapping because
>> qtest for all write* instructions (see qtest.c:377).
> 
> yes. on a BE, we should not byte swap.
> 
> When on a LE host, the cpu_to_be32() call in the test byte-swaps
> the address, tswap32() in qtest.c does nothing as the host endian 
> and guest endian are in sync and so the address reaches the 
> controller region in the expected order.  
> 
> When on a BE host, the cpu_to_be32() does nothing but tswap32() in 
> qtest.c reverses the order and so the address reaches the controller 
> region in the wrong order (LE).  
> 
> I see two possible fixes : 
> 
> 1 - replace the read* routines by out* (no tswap there)
> 2 - add an extra byteswap on BE hosts using qtest_big_endian() as 
>     in virtio-blk-test.c. see virtio_blk_fix_request() 

or :

	3 - use memwrite/read

which is I think the appropriate fix.

Thanks,

C. 

