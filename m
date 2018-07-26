Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1331091wru;
        Wed, 25 Jul 2018 18:56:17 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeYfX4gOorg+zffGmpdfDTF27+844T2fnYHm/pqV5ifrlLr0Dm+fFePADc9m8K1/ZYrXN0H
X-Received: by 2002:a37:58c3:: with SMTP id m186-v6mr22057850qkb.119.1532570177693;
        Wed, 25 Jul 2018 18:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532570177; cv=none;
        d=google.com; s=arc-20160816;
        b=z5BFw/WmUwop4b6eB3LEJUqJnyEDKaVJK/VVjl72EVJkcckWaVoA9Hv826EQQ4qRnt
         FpHnJPfER402zTahrv6GqBQm0LHLFBkPzv8IT3i1nFgReefJ0wp9We+DJOG56d60kF88
         +cEjbhSUh6SoHmO83XjK7tuWNQyQMSdwBMYP0ng5LjlzHNmBLM+CPvSMa9YlizntVyV2
         YisMqlmpZlsAvtcwkNvuH6oCMAM70DbSLAgilHfZo6Hi0QPKKKzQt5gZDxhpAzzbPVmS
         36/NX5d9ckaCgZdNPdHnzxomdfhpCx1co/LoZGCBZ6LQhfsUm6ILUXjDCxwnrvUiuGly
         QtSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=dLQu/TFlY+oRwawMEb4+ZnX0m6VMMHNLEHcnvsM0vls=;
        b=k6/lESbkrzCq+y/b6QYjl+OMZipRreobQHpH3stO4OVE9AvUFxPi4jdKzf/4cRpfsA
         mpVjDQbvY7LEMY0zS1OH+COdbA5+RXJI5LtFuKuLEfuUXsW73GjPzq6QWVAWbocvDRd3
         avIEFZSCTfzPxfWzky6lQ8rrmV6BmmuntduFD7C+qS+I0L2lDnhFZ+e7XvNW/gQ22BYO
         r7MAAMy9ACUJQ5j4UNcW7i7clbPHMWqYI9qePlPNVxie94iS/eL1vAG5ItdwObKx79xx
         bp8o/GoK2w7aZYa4b9ZbY60GqjF5aoTk8seqypt8eEDLump6pJCSJDgbKutMRgJuly+r
         85uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PGu0m4y+;
       dkim=fail header.i=@jms.id.au header.s=google header.b=JMAfO16Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m38-v6si58431qtb.84.2018.07.25.18.56.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Jul 2018 18:56:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PGu0m4y+;
       dkim=fail header.i=@jms.id.au header.s=google header.b=JMAfO16Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57425 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fiVVp-0005Yz-7O
	for alex.bennee@linaro.org; Wed, 25 Jul 2018 21:56:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fiVVX-0005Xe-3a
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 21:56:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fiVVU-000485-6X
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 21:55:59 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:46403)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fiVVN-00045u-Iu; Wed, 25 Jul 2018 21:55:49 -0400
Received: by mail-qk0-x244.google.com with SMTP id o2-v6so65940qkc.13;
	Wed, 25 Jul 2018 18:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=dLQu/TFlY+oRwawMEb4+ZnX0m6VMMHNLEHcnvsM0vls=;
	b=PGu0m4y+crr4BzrgpGsYoI+IDQM/b+ruXHS8R8D/phmxa+MKns0Kpk8IP5Lkox0ZtK
	MlvTrPhN3cgy0R2EF7JkTuAfhxs5CEobFygKaj6xIpZ+ZJErwnS4NRLDlJzUdJpKbVfL
	vKOqFO2EAZhBfKWwWGTl32jg6Q1GX8NLuvB4VddOnlgyPOZzRRFriQu9yER1Xz6yyqO6
	RhOe1+2Sqrb6tmk3b23JcrFlgnGob2Rel85WDEDxsQ6j5tSEBoHEz9ZxHPshIFR03NmM
	PUanQDVutQINOn6eV5vhoFYSzUM+eL+3DszOZ9VOBelr0EVKI+bDYfGlC3rYySM2c5dv
	Gklg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=dLQu/TFlY+oRwawMEb4+ZnX0m6VMMHNLEHcnvsM0vls=;
	b=JMAfO16Z2nuISRaM8vTYDcJ/e80BHbrEH/4dZWOhs50ylpyzBPRDAU7J+i3Jx3wRPr
	6KMS4ZzoG4/4uzE6iC3kOcNxHpXG+mL1CI9hU0LyPElYNQlU+2SGPHITXlJEdIVjOplf
	+71DiJcPBjrZ96vToizShNHGiiWgTxNdJNh4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=dLQu/TFlY+oRwawMEb4+ZnX0m6VMMHNLEHcnvsM0vls=;
	b=VrAieyXAJj7nzJLCwffBZ9STvmv+/9KRns1wxcldbx1wGbUdB1euLZKYeAdfwrqsM4
	8nGNQAPcX9qw/8OWo63eIrWFOagiljljn18fmybtMatu7XMos8v/LxzEqEJajfy16FG8
	Ci8ACKBdIgH2vdigZmvnKoi+JRnpdO5kNowrvcyTj6h0ybN1yhqxnLXhOvK3YDq7j+CQ
	CrIWV/OgX7B8E8G2BatCi05ernDPxrP88q8Zbwb5/WUDhpdXjEc5iJ8R2nTcKnlzXg0M
	Lnrg2ng5cC9yMP7AbGvMqQLhfvcMd7Zy4bQLuhevaSvOVQcNe49Y2O6Gy/ANW+PY4xu+
	hToA==
X-Gm-Message-State: AOUpUlHbDHN57pfa3q6C3nIg8gh1qpM0T1flyRiiCQOodyEckET9V+3N
	1D0rFo3kPDWQI7mWWUCP6rdeIDi/TZ/wcENjygM=
X-Received: by 2002:a37:dd4e:: with SMTP id
	n75-v6mr20971058qki.370.1532570148605; 
	Wed, 25 Jul 2018 18:55:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 18:55:28
	-0700 (PDT)
In-Reply-To: <20180702122510.GB2155@stefanha-x1.localdomain>
References: <20180627143815.1829-1-joel@jms.id.au>
	<20180627143815.1829-2-joel@jms.id.au>
	<20180702122510.GB2155@stefanha-x1.localdomain>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Jul 2018 11:25:28 +0930
X-Google-Sender-Auth: VYJj1p2ywrkEJnb10zEOBgdyKvk
Message-ID: <CACPK8Xc0-0pTtKdCdz1xNy4d5qgfuX2=vQrX_YGqJKh0vdLLfA@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-arm] [PATCH v2 1/3] arm: Add Nordic Semiconductor nRF51
 SoC
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
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YtZchPVWU8mm

On 2 July 2018 at 21:55, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Thu, Jun 28, 2018 at 12:08:13AM +0930, Joel Stanley wrote:
>> +/* TODO: Flash size should be defined by the board. Microbit uses 256KB */
>> +#define FLASH_BASE      0x00000000
>> +#define FLASH_SIZE      (256 * 1024)
>> +
>> +/* TODO: Flash size should be defined by the board. Microbit uses 16KB */
>> +#define SRAM_BASE       0x20000000
>> +#define SRAM_SIZE       (16 * 1024)
>
> Making FLASH_SIZE and SRAM_SIZE properties of the NRF51State object.
> Then microbit.c can set them.

I chose not to do this, as they are properties of the SoC, not of the
microbit machine.

If in the future someone wanted to support more than the NRF51822,
they could make them properties and set them in a sub-class the NRF51.

I don't think this complexity is warranted while the only implemented
machine is the NRF51822.

>
>> +typedef struct NRF51State {
>> +    /*< private >*/
>> +    SysBusDevice parent_obj;
>> +
>> +    /*< public >*/
>> +    char *kernel_filename;
>
> Is this used by anything?

I removed it in v3.
