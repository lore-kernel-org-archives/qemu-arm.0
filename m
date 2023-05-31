Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2640212ejb;
        Tue, 30 May 2023 22:59:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4mFulLJ4Wmjlit3N0gjoxPtKjEpwqEV01uqfu5hBGGIJI73JZYc7fkbRmdldQtLR5g2zjC
X-Received: by 2002:a05:6214:20ab:b0:625:950f:2d5c with SMTP id 11-20020a05621420ab00b00625950f2d5cmr4732668qvd.10.1685512791434;
        Tue, 30 May 2023 22:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685512791; cv=none;
        d=google.com; s=arc-20160816;
        b=D9UxaxfvAMWmRFSKs9uM7DBvfn3047QqokO74z1vfeLpdmmJnE7BobiND2DzhhdQD6
         t3rIcYG7mgH0fV4eazVB20YKq5ulPTNc/tHLhCo9UOSNFw3xAjkA3HOvA2BO4NeXC8zw
         jQESwNmDedHx0446uqpFRduUoBJ44GsgiABUx4zQ49m7eFGzB8lzpjR8crc/I//tYCQl
         6HXDlPIgwIT4m9qBpJb1xVBS3SBD8n6T6GXHbVPC+jscHLiMVxyWqblWB9NyxTZjB4bO
         MBKWMspX8NNZBRGvd2mSA50PuFt6jzuYJVjYU70aOuq6TOn3W7ETFxJmoJ+1JSRpL2yi
         LO2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=526NJV565u6VDj+MDPWWGs+aL27Vl+MO5uR/X8NXEpw=;
        b=xujXisUEuAvkNX1mu9zYFI8IRy3XOLv3+gR3BZb+CwJBF5fjB1vFtgLc+nO9qpj0go
         q848WFbEHelTTsQqMPxd6nmwiraTSIC4tep0KanLqSyeFi8Bfkb5TTotpkjRL7v2UNYP
         S4BwmQfGZGNqxiHuQDCm3C43uQH6AI4hOOySfaUmHxo8lMyanPMplSzfqsTwk34lZWA+
         XpyMN95m4kHSRouH37e50zBzl+Tb0iRmYKz7U6uqqvUwwsqfOtHDWaqvorH9R+fSu2pl
         AUK0xZmc9xGf8tFucFnhwa4whrCLzxpa2n+q+yiMUoWs/b4baHXGLuElOVH5bOyvewrR
         3sOw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13-20020a0562140cad00b00626009daf26si3397661qvs.408.2023.05.30.22.59.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 22:59:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4Erc-0005Gx-Ih; Wed, 31 May 2023 01:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1q4ErH-0004zq-AO
 for qemu-arm@nongnu.org; Wed, 31 May 2023 01:58:55 -0400
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1q4ErF-0003zV-7r
 for qemu-arm@nongnu.org; Wed, 31 May 2023 01:58:54 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.10])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 35D3C20295;
 Wed, 31 May 2023 05:58:51 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 31 May
 2023 07:58:50 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006b052a6b2-b20f-4cc9-9a77-34fd2d9b3aa1,
 AD4A5C7A17A66D4AFB6DE796C11E1CF112258E66) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6608a7e7-3987-359d-4ab1-066045003b24@kaod.org>
Date: Wed, 31 May 2023 07:58:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 05/12] hw/ssi: Introduce a ssi_get_cs() helper
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-arm@nongnu.org>
CC: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Alistair Francis
 <alistair@alistair23.me>
References: <20230508075859.3326566-1-clg@kaod.org>
 <20230508075859.3326566-6-clg@kaod.org>
 <40c8647d-201e-3ceb-97ca-ec98bdc84e88@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <40c8647d-201e-3ceb-97ca-ec98bdc84e88@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 64c402c9-97fe-4738-b33e-eafa85d5dbc3
X-Ovh-Tracer-Id: 16292616078452951913
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekkedguddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdeipdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpjhhovghlsehjmhhsrdhiugdrrghupdgrnhgurhgvfiesrghjrdhiugdrrghupdgrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ++KEwf72ZipH

On 5/30/23 22:34, Philippe Mathieu-Daudé wrote:
> On 8/5/23 09:58, Cédric Le Goater wrote:
>> Simple routine to retrieve a DeviceState object on a SPI bus using its
>> address/cs. It will be useful for the board to wire the CS lines.
>>
>> Cc: Alistair Francis <alistair@alistair23.me>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   include/hw/ssi/ssi.h |  2 ++
>>   hw/ssi/ssi.c         | 15 +++++++++++++++
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
>> index ffd3a34ba4..c7beabdb09 100644
>> --- a/include/hw/ssi/ssi.h
>> +++ b/include/hw/ssi/ssi.h
>> @@ -112,4 +112,6 @@ SSIBus *ssi_create_bus(DeviceState *parent, const char *name);
>>   uint32_t ssi_transfer(SSIBus *bus, uint32_t val);
>> +DeviceState *ssi_get_cs(SSIBus *bus, int addr);
> 
> Previous patch use uint32_t. uint8_t is probably enough,
> otherwise 'unsigned'? Otherwise

uint8_t is fine.

Thanks,

C.

> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 

