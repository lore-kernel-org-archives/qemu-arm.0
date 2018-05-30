Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4257573wre;
        Tue, 29 May 2018 20:04:47 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLyMBcceiYBO9Pwe2O382qGecOnyPYqO5GyEPJelaRVcDDILe8lfBBA2qU4mBqcPeiUwNsK
X-Received: by 2002:aed:3b38:: with SMTP id p53-v6mr949185qte.6.1527649487592;
        Tue, 29 May 2018 20:04:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527649487; cv=none;
        d=google.com; s=arc-20160816;
        b=0Xw5MV0+/OrXbVlevlYs7KQ/MJQSzHIKsTwOuODpIDr56azf5FTgZpG0M5GUFgG/RJ
         amy5uhoLImpxJkRDPf+jX/tBoTjnu5C7fCnkJqYV9mbRlVhDSWuEYABTJ8tBE+NhRCjO
         lOIrHv+mEDhQxl05JHQNQJUGXowbnsVxBzQcc/h60sau/APlujbJUP/0WFJ2eNt/YOmL
         8WWf6TsuUpiIPZU0SJTlMUDtGKutxHEN2M/ee2pAmwv+5czOTbPaJgZLhU04HNuj13W/
         k1scL9Cfv9M4DHwBTx7596ODp7sMfmq5Z9/ZvliS9iaeN0TAcSaaXbO3NoJdhFKMZsbY
         HQNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=30mnFGRi9Rye2vxrNG5JvzZv8Fgar+1oc9sYdOICCjc=;
        b=AKKcaeeNteRdAFwyoYHnXK+a0MbdLwWI72yPvlm8Ai9lMVvTHBMz21kWFy9ENpvRdu
         g/w4zNcDhvS9sgwffyRFhpWvcxeLmNKIiqqk947SbD7pnUGGvlaVeiaeWw6shqpTCxP/
         dASvmmzfM89RrGaqRaZYe0ky7wd96UPu5oJR3KtM9tf6y1FQud+ytnmzlR7LGCeeRqSx
         iC3JI9EsAubLZVZXs6dn7popUEoPz0II7Pb1ES7tCx31GWe52D40sulvG1Ib86uC6WFS
         MTvQhjCDbfebUBK1JXL7jz5HQWC3QTyHp87ott3WMPtOC6iO9kNtZyE3oqszjFrYq5/H
         YlFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IGVmbqBI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a23-v6si6179382qvd.272.2018.05.29.20.04.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 20:04:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IGVmbqBI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35930 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNrPr-0001E2-5Q
	for alex.bennee@linaro.org; Tue, 29 May 2018 23:04:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNrPd-0001BO-5v
	for qemu-arm@nongnu.org; Tue, 29 May 2018 23:04:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNrPc-00077K-Ay
	for qemu-arm@nongnu.org; Tue, 29 May 2018 23:04:33 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:34466)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNrPW-000749-7D; Tue, 29 May 2018 23:04:26 -0400
Received: by mail-qt0-x243.google.com with SMTP id m5-v6so21500150qti.1;
	Tue, 29 May 2018 20:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=30mnFGRi9Rye2vxrNG5JvzZv8Fgar+1oc9sYdOICCjc=;
	b=IGVmbqBI+0iOioHD9EyQa7KoWjgCNZaBcmSE6CsAn6HtI7493GZdNREmr0aq63jcnB
	pP00Tshe8m14fVG3uUASVBqlhqj9NWliV2MnPBTP+b29LxQ7ngjxaSsIXb5+zl/vPQ/C
	qp/k+WtzaY0yNrRQ2uwCCgOl+my5GvcRtq3HUxBidkgU6OSbeP75eV5kUcvoIvwaETO4
	zBYg/T7j+KVHTeFjOrvVyQg7a+UYNbfKweFBBolM0VMquKMridQiT90SscJBEg/oqY7D
	cnuXGiwYISjtna0s83rCIHnR1i8GZbREGt6orYVS4m+m2N5OThE5upoVFRW4ad/HTr+o
	qSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=30mnFGRi9Rye2vxrNG5JvzZv8Fgar+1oc9sYdOICCjc=;
	b=jH8ikXOk0cVbbOHEI75EsH5lgvaByk0fXBDIQcwunnQ9mOwBJBs+GUW6ot+JIRcpb7
	BvrGk7GR4mlzeUx7iAZBrj9WNy8JAaUvcUeMCyI+9ShqTedA/sW/JzlwtcBznhfn7BPB
	1kRENeqquXlgFiUo1k4HPSKm8uQWEU0YXrJ5H3V1TNDUsgCM0gKsECmjGaQG3Rc8ITBT
	lTEvbNE1chfMgtOjNHg6wtHlOFKAGuROLqhmwuCLvv6SxpZ8ryyJ0LxymVwbVgx9QRMD
	9GMmgt0fI6jz7gHf18t/lV8MQeEiTTMYxUdmiqsSFG41w8QkL5N1HrdvgKhQnjqqusFb
	vgtQ==
X-Gm-Message-State: APt69E3viAx9GK4CqDqUvK1BmnIGdx5y215TckxujadjochrFMETIVuU
	ZZqeUXPkL7D3Ve1MneQHTwGAoW5C
X-Received: by 2002:aed:24c2:: with SMTP id u2-v6mr846135qtc.235.1527649465584;
	Tue, 29 May 2018 20:04:25 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	m59-v6sm24944447qte.8.2018.05.29.20.04.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 20:04:25 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
References: <20180529062838.20556-1-clg@kaod.org>
	<fac124fe-d816-1bb2-c8b3-d1a0213f968b@amsat.org>
	<15666557-66b1-78e0-1062-b3a28ecaf580@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <b83a5cd3-5918-e063-86ef-c65f1d44641e@amsat.org>
Date: Wed, 30 May 2018 00:04:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <15666557-66b1-78e0-1062-b3a28ecaf580@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [PATCH 0/6] ftgmac100 and NC-SI enhancements for the
 Aspeed SoC
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qALkywhndTMf

On 05/29/2018 01:57 PM, Cédric Le Goater wrote:
> On 05/29/2018 02:34 PM, Philippe Mathieu-Daudé wrote:
>> Hi Cédric,
>>
>> On 05/29/2018 03:28 AM, Cédric Le Goater wrote:
>>> Hello,
>>>
>>> Here is a couple of enhancements and fixes for the ftgmac100 NIC used
>>> on the Aspeed SoC. It includes VLAN and multicast support.
>>>
>>> Following is an assorted set of changes for the NC-SI backend also
>>> used on the Aspeed SoC when soldered on OpenPOWER boards. These fix a
>>> few problems found when running OpenBMC on aspeed QEMU machines.
>>>
>>> Thanks,
>>>
>>> Cédric.
>>>
>>> Cédric Le Goater (6):
>>>   ftgmac100: compute maximum frame size depending on the protocol
>>>   ftgmac100: add IEEE 802.1Q VLAN support
>>>   net/ftgmac100: fix multicast hash routine
>>>   slirp/ncsi: fix "Get Version ID" payload length
>>>   slirp/ncsi: add a "Get Parameter" response
>>>   slirp/ncsi: add checksum support
>>
>> Doesn't it make more sens to have slirp patches applied previous to the
>> ftgmac100 model?
> 
> why ? They are not necessarily dependent. 

OK, no worries.
