Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2022135wre;
        Sun, 27 May 2018 20:09:56 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK6OJumUyfA9lZifhJrPPslyoGJX0JYWnCN/5JHM8kokFe3Sw9/DZiObz37iYlP5KLAdtWf
X-Received: by 2002:a0c:ad90:: with SMTP id w16-v6mr10772404qvc.186.1527476996417;
        Sun, 27 May 2018 20:09:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527476996; cv=none;
        d=google.com; s=arc-20160816;
        b=gzd2naAAlBss8E55ABwweCnaiLpYagN5zlScSqJjY6kXbRg7HkHKQVhUeaDXGWrLjF
         T992gHerdHjawZAhLTbBPnskxQA+KxqRFgTjhX1xDMrNPfbGT/qjoFYN3ksrAxXNEn7S
         dj4+T/Usuot6wQ0gUqI/4C+AzTytuBwav5HNRrxoLy0Sw+eG0rV4HU6Gl/Y6dURHLvK9
         y+rJjGgZ9TJ8XfjM6VU69RbwqhjGy78+dEky1twchhJbPYF1PtDLIFOZqZqx0z54yHGQ
         PHITsg5CieURd8Tw11YXV+u77uuRoMEybjJkLwQoFwkj5nrddBr+D5FXCwKAZu/Hf23u
         YCxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=CvSaOZaPkTEIz7CQQMEy6B0w/s0yopidwYRw7Qki4SU=;
        b=AH1ArRosOI3L5vUM+icPtVVNeocWg6pGEXwmq3PT07rJSgbwDo63jSBqgTv5xJ4dSs
         Zh4xtCZX2TU3dcPAyI9qA8DMqTx8MJ9wDMEk7OJ/aLhFukuMkKuL5Sqld3WDFeFj4pJb
         ipb9yVKolezjdp2hManIKJtKnRIEnPRjcgJGGlP3v6xruOWgn2jqH9u/mNv0nEGBM/TH
         1bwSTiy3G+yPLwk0eT95YrLZsJ4OiKHB1r+DMJ/c6a4cug2P1gScDLnc18qDxu6B1Q/m
         KpYD3R4CoJZqzApfg97LAcTP5OKM9VSxlN8XBT5+enSsS4oMAoX7txPLbdbYXi0WxYrp
         UgDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XRSzO870;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i9-v6si890270qtb.306.2018.05.27.20.09.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 27 May 2018 20:09:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XRSzO870;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53956 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fN8Xj-0005tU-Ta
	for alex.bennee@linaro.org; Sun, 27 May 2018 23:09:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fN8Xb-0005sI-Nj
	for qemu-arm@nongnu.org; Sun, 27 May 2018 23:09:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fN8Xa-0005XZ-Gl
	for qemu-arm@nongnu.org; Sun, 27 May 2018 23:09:47 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:46771)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fN8XV-0005UD-Qs; Sun, 27 May 2018 23:09:41 -0400
Received: by mail-qk0-x242.google.com with SMTP id k86-v6so8211831qkh.13;
	Sun, 27 May 2018 20:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CvSaOZaPkTEIz7CQQMEy6B0w/s0yopidwYRw7Qki4SU=;
	b=XRSzO870eAdn4RWap817kuzdE45D5qq9P9Aq67T9uj5qs1ylOUCIVFrwCyPxwrXkIO
	i7aSjCR2wa21gQleP8aejie0JCphQGwm/tj2njvLtcKDYuTTbo2+/qhTKEAczaq13iPZ
	zc+0qWKJ9JVM0jy3pwOtEUvgxfSvx3aKQeJZr3h3/lYtP9K9nBg7WlY2ohwWR6lQ+Tkl
	Q/syl1kFtAHgHu9+vqwh+vlZDOolYW8bJrfXtT61ATfSCL2tGnUsKIJ6DgicmUJiTous
	rs+to8enoZZqgwMfLRjKqn4hXpnXEXufS32hGiV6hY065WgTVeCkUY8P/qwcNYfNUA8n
	XVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=CvSaOZaPkTEIz7CQQMEy6B0w/s0yopidwYRw7Qki4SU=;
	b=rjBwMBDyfaaCBiRJNyauyVtAjbRsHIg8M/2SSwN3Wp5m90OYn8MTrDhmR0YltNckDk
	1i29+WvPQd1+Fh+2+kihvqmWN8c5q8RrwqJFYzBMQOdxLJG+Ki++182mzQe4YAf9pSHt
	d65Zw0qN9mSJvGrV5SkzKOc31bLTPRRaXhpIaNiufWLOGUHq3pxWoc/isCBwggWha5Fw
	vvUoH0xnw9HuEfJD7BlzUuIe8XtUupEigfsg1uE6WujOXlCagn9OD9FUM+CNzQZMt/Jc
	jDEHMNpqJ9ALU4sl2nXiRGNPcM3LrbyGUUaXhkGfEAW4lwojRbrJFyY6Z2gH76mYyWoW
	glAg==
X-Gm-Message-State: ALKqPwc8FV6gHWddxu8J7g+uNLPkHFQ7mC5TuVw3IrMvqAbZm05nfxUG
	+ubTZ7D5iAV91OFD5rxWMYAplmRP
X-Received: by 2002:a37:5184:: with SMTP id
	f126-v6mr9635195qkb.265.1527476980763; 
	Sun, 27 May 2018 20:09:40 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	x138-v6sm9900111qkx.15.2018.05.27.20.09.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 May 2018 20:09:39 -0700 (PDT)
To: Alistair Francis <alistair@alistair23.me>
References: <20170922171323.10348-1-f4bug@amsat.org>
	<20170922171323.10348-4-f4bug@amsat.org>
	<CAKmqyKMnvTe5xQ8vTH28voRh+K5jxjcPJ1X8MBSKX--HUhxA2g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <9c754e08-d7ed-bea9-cd22-92d8a57e6335@amsat.org>
Date: Mon, 28 May 2018 00:09:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMnvTe5xQ8vTH28voRh+K5jxjcPJ1X8MBSKX--HUhxA2g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 3/7] hw/mdio: Generalize phy
 initialization routine
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Grant Likely <grant.likely@secretlab.ca>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /f8YQDroXBNW

Hi Alistair,

On 02/27/2018 07:33 PM, Alistair Francis wrote:
> On Fri, Sep 22, 2017 at 10:13 AM, Philippe Mathieu-Daudé
> <f4bug@amsat.org> wrote:
>> From: Grant Likely <grant.likely@arm.com>
>>
>> There really isn't anything tdk-specific about tdk_init() other than the
>> phy id registers. The function should instead be generalized for any
>> phy, at least as far as the ID registers are concerned. For the most
>> part the read/write behaviour should be very similar across PHYs.
>>
>> This patch renames tdk_{read,write,init}() to mdio_phy_*() so it can be
>> used for any PHY.
>>
>> More work definitely needs to be done here to make it easy to override
>> the default behaviour for specific PHYs, but this at least is a
>> reasonable start.
>>
>> Signed-off-by: Grant Likely <grant.likely@arm.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> [PMD: just rebased]
>> ---
>>  include/hw/net/mdio.h   |  2 +-
>>  hw/net/etraxfs_eth.c    |  2 +-
>>  hw/net/mdio.c           | 14 +++++++-------
>>  hw/net/xilinx_axienet.c |  2 +-
>>  4 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/include/hw/net/mdio.h b/include/hw/net/mdio.h
>> index 7ffa4389b9..b3b4f497c0 100644
>> --- a/include/hw/net/mdio.h
>> +++ b/include/hw/net/mdio.h
>> @@ -86,7 +86,7 @@ struct qemu_mdio {
>>      struct qemu_phy *devs[32];
>>  };
>>
>> -void tdk_init(struct qemu_phy *phy);
>> +void mdio_phy_init(struct qemu_phy *phy, uint16_t id1, uint16_t id2);
>>  void mdio_attach(struct qemu_mdio *bus, struct qemu_phy *phy,
>>                   unsigned int addr);
>>  uint16_t mdio_read_req(struct qemu_mdio *bus, uint8_t addr, uint8_t req);
>> diff --git a/hw/net/etraxfs_eth.c b/hw/net/etraxfs_eth.c
>> index f8d8f8441d..4c5415771f 100644
>> --- a/hw/net/etraxfs_eth.c
>> +++ b/hw/net/etraxfs_eth.c
>> @@ -333,7 +333,7 @@ static int fs_eth_init(SysBusDevice *sbd)
>>      qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
>>
>>
>> -    tdk_init(&s->phy);
>> +    mdio_phy_init(&s->phy, 0x0300, 0xe400);
>>      mdio_attach(&s->mdio_bus, &s->phy, s->phyaddr);
>>      return 0;
>>  }
>> diff --git a/hw/net/mdio.c b/hw/net/mdio.c
>> index 3d70d99077..33bfbb4623 100644
>> --- a/hw/net/mdio.c
>> +++ b/hw/net/mdio.c
>> @@ -43,7 +43,7 @@
>>   * linux driver (PHYID and Diagnostics reg).
>>   * TODO: Add friendly names for the register nums.
>>   */
>> -static unsigned int tdk_read(struct qemu_phy *phy, unsigned int req)
>> +static unsigned int mdio_phy_read(struct qemu_phy *phy, unsigned int req)
>>  {
>>      int regnum;
>>      unsigned r = 0;
>> @@ -107,7 +107,7 @@ static unsigned int tdk_read(struct qemu_phy *phy, unsigned int req)
>>      return r;
>>  }
>>
>> -static void tdk_write(struct qemu_phy *phy, unsigned int req, unsigned int data)
>> +static void mdio_phy_write(struct qemu_phy *phy, unsigned int req, unsigned int data)
>>  {
>>      int regnum;
>>
>> @@ -120,18 +120,18 @@ static void tdk_write(struct qemu_phy *phy, unsigned int req, unsigned int data)
>>      }
>>  }
>>
>> -void tdk_init(struct qemu_phy *phy)
>> +void mdio_phy_init(struct qemu_phy *phy, uint16_t id1, uint16_t id2)
>>  {
>>      phy->regs[PHY_CTRL] = 0x3100;
>>      /* PHY Id. */
>> -    phy->regs[PHY_ID1] = 0x0300;
>> -    phy->regs[PHY_ID2] = 0xe400;
>> +    phy->regs[PHY_ID1] = id1;
>> +    phy->regs[PHY_ID2] = id2;
> 
> These should be set by QEMU properties instead of values to the init() function.

I agree, but this is not (yet) a QOM'ified device.
I believe if I start to QOM'ify it this series will finish in 1 more
year. This is however a nice cleanup so far, and the QOM device can come
in a follow up series.

> 
> Alistair
> 
>>      /* Autonegotiation advertisement reg. */
>>      phy->regs[PHY_AUTONEG_ADV] = 0x01e1;
>>      phy->link = 1;
>>
>> -    phy->read = tdk_read;
>> -    phy->write = tdk_write;
>> +    phy->read = mdio_phy_read;
>> +    phy->write = mdio_phy_write;
>>  }
>>
>>  void mdio_attach(struct qemu_mdio *bus, struct qemu_phy *phy, unsigned int addr)
>> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
>> index 1e859fdaae..408cd6e675 100644
>> --- a/hw/net/xilinx_axienet.c
>> +++ b/hw/net/xilinx_axienet.c
>> @@ -791,7 +791,7 @@ static void xilinx_enet_realize(DeviceState *dev, Error **errp)
>>                            object_get_typename(OBJECT(dev)), dev->id, s);
>>      qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
>>
>> -    tdk_init(&s->TEMAC.phy);
>> +    mdio_phy_init(&s->TEMAC.phy, 0x0300, 0xe400);
>>      mdio_attach(&s->TEMAC.mdio_bus, &s->TEMAC.phy, s->c_phyaddr);
>>
>>      s->TEMAC.parent = s;
>> --
>> 2.14.1
>>
>>
