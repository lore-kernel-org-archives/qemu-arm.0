Received: by 10.223.197.9 with SMTP id q9csp7466227wrf;
        Thu, 19 Oct 2017 20:10:30 -0700 (PDT)
X-Received: by 10.237.63.15 with SMTP id p15mr5214802qtf.155.1508469030773;
        Thu, 19 Oct 2017 20:10:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508469030; cv=none;
        d=google.com; s=arc-20160816;
        b=AofHNGuZ2HtyvKbdZpIz+vIGBp2x3PiHBSjpkvfUJhm5JY5jVF2d85UChxw1ot3zQO
         TbNn7mR9GZFv8zfGwmcY4m49iPv6qG8/UJy8vSn9EI0QmsWwOFWgsnVp8CJhoCts+Ehr
         Z5DyVdZZI/uJ8BDvyVd79RGQxnQl6Q34aLLu1Ty9nu6ntb1/YRjWFi5MnB53l82bfsae
         i9jbuaBLiZ8BwzCRBzn1x+wc2B1NYrp6q5eU9HyQ5sMvVEwGgSa7Uy9C04gc4s62698O
         AzPqLt0HJYQhyB4CtHErQjo9fU822RfpUjdUTeYfx+Ugil9VLhF6szpeIHuI/X62zVtb
         RfHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=KXOD3BBT5lk8tzh+hXpQ66V9rqR3awIOl4nrVkEsTdM=;
        b=N5+ghsV7LR9uXG6Ufn6LjouCDeClAOAl6H8iV2pj0IIjoFAipQYCxTNSYJ7uu+ICFL
         P1t+Np1vooxWsJH3iB550CHcvsSLC1G8Zkr1edD/hd9ixvSaVbJFlWumqFYM8/hnbt/O
         HPtBtiBd5feyRa/eU9zLpo2/S3xnqKz/GvBvuEVVxR40wk4x15slWLDY5kW6Y7uw0S5V
         4bkzqjkIHzZVm2EOwhom+I5wJV6jCWFX40HgGqqApGFZKism9bMMEiN2/9/KMH9ELUky
         gmOmuFkDSruaUDp/4BPlgI0kQU2749/ceE6QHM7g8Ix5Xs/fPcqSL2Faob2AXtSuy//d
         sUPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JH5Ih8iC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d11si4909994qtb.463.2017.10.19.20.10.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 20:10:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JH5Ih8iC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51999 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5Nhc-0008TR-G5
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 23:10:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e5NhR-0008Rc-2c
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 23:10:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e5NhQ-0006Du-7Z
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 23:10:17 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:45494)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e5NhK-00068B-0q; Thu, 19 Oct 2017 23:10:10 -0400
Received: by mail-qt0-x241.google.com with SMTP id p1so16968564qtg.2;
	Thu, 19 Oct 2017 20:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KXOD3BBT5lk8tzh+hXpQ66V9rqR3awIOl4nrVkEsTdM=;
	b=JH5Ih8iCY0Ur23dx/CNqNboIudQLsVsaXI8vn+KqSrqY0x3kfirRrDklghPZcxcUe2
	c1jnUZRh9K2MORkcO50x/mZW2ayDQe5w8BCOB37ubUUjFZ0/3j37L06o+SkN/1Bpm0pW
	657hgvfOc1a2skqm3V6s478Wpmi8CkWjEe8085KjAJ80JjRl071lUUw753kiG7UsjVPC
	gG/520HlMT3JB3Iw3Y/+AZEC/uMe/g1bsPTqBGD8SSvqkCGhIvPkjbZejfiE8FW+7GVb
	Dai1BoZ5ox7Bl6kGnzK7mYIcEVJiIJb+rb0VHTRcHwcjYwWT45gTC98fD3TSuDcNHXtw
	8utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=KXOD3BBT5lk8tzh+hXpQ66V9rqR3awIOl4nrVkEsTdM=;
	b=sQ9Fq/GCH6mP5RUMjUDrBDgEz6+coGHwpATxxIapzSb8ZG2XDwXrO0IDiM3nSYGf21
	NGmK1vkB4SIOXvSEhOugPkWOvD0Osd5rNJsdHJsUfDCgOXHjZpKzKsf3gLYn/o4U9JLs
	1TOGaZUN83+ehkwtoX5/LsLHY9wEMu3CiIxsGGaEzkvtuXoule0geZYdluOZW+Xbd1jZ
	s5FpCvg/4ecFjrKkuV1GCxKOikSVUvT43khQAI3NreFqUdvbKVNY6bPV+BtOiuEIOyit
	In73bAdBV5rGHOPPi0Jcn81iyVpKoOQzW9vSoCCTNoQdSt2p/HnVSLtwzOAzHH+EOycY
	alUQ==
X-Gm-Message-State: AMCzsaVXVs14GKXXXreDN30HrFGK/G8+saNrxih9dvCnH4qMQ/uJnaid
	rCp1vRK1Kig/LfFm0OEKRR8=
X-Google-Smtp-Source: ABhQp+QwGYd1Oe4OGAT74dHvcW9d2G/0oIpvBNeSywPW12WG11RJN9G8fV93Yye57rhiINcBdps5xQ==
X-Received: by 10.200.47.5 with SMTP id j5mr5420009qta.133.1508469009486;
	Thu, 19 Oct 2017 20:10:09 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	m28sm10771698qtb.55.2017.10.19.20.10.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Oct 2017 20:10:08 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goate?=
	=?UTF-8?Q?r?= <clg@kaod.org>
References: <20171019151249.13663-1-clg@kaod.org>
	<20171019151249.13663-2-clg@kaod.org>
	<CAFEAcA-6gXF9skgYRTke5-0Ds_SLceAgX-Dz6WyyuiYJSz7afw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <114c397f-7540-15ca-a44d-0b3a4cdcc238@amsat.org>
Date: Fri, 20 Oct 2017 00:10:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-6gXF9skgYRTke5-0Ds_SLceAgX-Dz6WyyuiYJSz7afw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH v5 1/8] aspeed: use a ROM memory region to
 catch invalid writes
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3avXxF/Mlqpb

On 10/19/2017 12:44 PM, Peter Maydell wrote:
> On 19 October 2017 at 16:12, Cédric Le Goater <clg@kaod.org> wrote:
>> Some legacy firmwares access unimplemented addresses on the Aspeed SoC
>> (old U-Boot code using variables in the bss when it shouldn't do).
>> Let's use a ROM memory region to catch the invalid writes and support
>> new boards without using the 'ignore_memory_transaction_failures'
>> flag.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>
>>  Changes since v4 :
>>
>>  - use a ROM memory region
> 
> Probably worth mentioning in the commit message that this
> is a migration compatibility break for these boards.

What about the eeprom_buf from patch 6 "Add EEPROM I2C devices"?

My understanding is a migrated board would resume with a zeroized
eeprom, is this the expected behaviour?

Regards,

Phil.
