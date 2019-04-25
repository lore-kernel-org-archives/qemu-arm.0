Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1784934wrx;
        Thu, 25 Apr 2019 06:19:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwyei0QNcWC8eFoTF7neI/LGTCyHQCpiw2IqPrRDtE7pPZ7kfAm8AgYmN5GVmsbkaC54I17
X-Received: by 2002:a1c:3cc2:: with SMTP id j185mr3647501wma.26.1556198393142;
        Thu, 25 Apr 2019 06:19:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556198393; cv=none;
        d=google.com; s=arc-20160816;
        b=sONgiBllwfV0l0ngjRfdzXMD6iv+0tGN4Voln3apx6F9VzNWji2gCGNQGOej3sEAvv
         WWfsbYFVC/MDTc8g6ButNoBDVhoXPyktdu9cokNlPuINwDezuwI1W5uoMGpJjRtIWNLq
         jfXPzdh/DFpnmwdIScwkl83DnhPGHfxIaN68RK6jvN1lenNNa9KCfrpHdcHwGt/hRtU0
         pxiGie8LdQ30QDUJhVdyN64/cm33BPFesCyPf0VX5rIkZXkfoxtowM+xmaQeMCck7aAl
         0c5kiC36dS/jslxLlt52l23H4dKK6+F1fQtohs4+q9tGeNs6ou/YAMCfuUnhWmjOQTlN
         I19Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from;
        bh=o6G3SSPdCjH99oZB80vEaOpCCos0mBuC1H9vt+CMlQI=;
        b=DXW2maKQjTf9iOHdlyZYxsWk7CvFNra9M1oYuqSrdWaJHmLE3cLw2pLVieg5MlrnAZ
         UNo39fjrSU9EOwRuT5lZKAHu49lcCLjuxV11qe3wwy/owta4HG6o+LqQWHKbcUpD4wIQ
         OcK6WlsIkijEBeR7TAoTvtHBZtA8LalMnS4/+0c/EXov7QEsXCUtT2rr3i7Re0GXfCXA
         AIi1wxeDZl4DPZCQNr/5dR+ehowsIi9EQH6FWBPep0QTM7x8Uqkn9NhsIli3ruqim31F
         sinvd2X8BTa2pTOUCIBv7XA1WzJcpu7dCFwHfUp6IzVRmDXghN5bpdp3TNPqaGz3u92Q
         3RDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14si5941935wrg.174.2019.04.25.06.19.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 06:19:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:57001 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJeI4-0001nJ-4g
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 09:19:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJeHi-0001mQ-29
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 09:19:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJeHh-0001wZ-0k
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 09:19:30 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52564)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJeHg-0001vl-Qp
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 09:19:28 -0400
Received: by mail-wm1-f68.google.com with SMTP id j13so9333403wmh.2
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 06:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=o6G3SSPdCjH99oZB80vEaOpCCos0mBuC1H9vt+CMlQI=;
	b=cYThTwWVhg7TKONEqMbFlqprMViQaxnVxoAUiuY4ptRU+VV3mftm0++0NASKV6y6ig
	q9YoowbfA25huxdRzWfgOuqvJbuwEYj6m/ENy+5dJ92vUA0Knt4w8wNqXir6Nhhqk/jZ
	4CTvvF8HT86aBzoVRqz2VskDquAmWwnnr4+qV+WbAZ3nUfMWY2HZUolPzt5IfWU1QZIJ
	VVWd7IIXLle5VCISqXjKMFvth2JDS7pOdxTnjkJayjxLEoipScbptgukcyMqifvtLW5O
	8S61z0b0QV4/RNTAD8XAEUQ9U3B0bDlnzniPRWOv0TfUIgwN1d6pZLtQb+qq9aXrc68g
	6uKA==
X-Gm-Message-State: APjAAAU3chQ6Ew6lVTfYmOUxVLTOXM95oAwhbxB5z9MQZWJel8WAapX+
	+arklxwudcmShYq5hw9MpSRAgA==
X-Received: by 2002:a1c:2ed7:: with SMTP id u206mr3444913wmu.5.1556198366310; 
	Thu, 25 Apr 2019 06:19:26 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122]) by smtp.gmail.com with ESMTPSA id
	17sm17044344wrk.91.2019.04.25.06.19.24
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 06:19:25 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-3-thuth@redhat.com>
	<9f1355f2-3508-3f0a-512b-8b97fbda9ae1@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ca065ba9-45b4-2272-538b-67ad0b6df3a3@redhat.com>
Date: Thu, 25 Apr 2019 15:19:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9f1355f2-3508-3f0a-512b-8b97fbda9ae1@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 02/29]
 hw/ide/ahci: Add a Kconfig switch for the AHDI-ICH9 device
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
Cc: Rob Herring <robh@kernel.org>, Jan Kiszka <jan.kiszka@web.de>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-block@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Philippe Mathieu-Daude <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Beniamino Galvani <b.galvani@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
	Cedric Le Goater <clg@kaod.org>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>, Gerd Hoffmann <kraxel@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	John Snow <jsnow@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uoM11yFf1mdb

On 4/20/19 12:31 PM, Philippe Mathieu-Daudé wrote:
> On 4/18/19 8:00 PM, Thomas Huth wrote:
>> Some of our machines (like the ARM cubieboard) use CONFIG_AHCI for an AHCI
>> sysbus device, but do not use CONFIG_PCI since they do not feature a PCI
>> bus. With CONFIG_AHCI but without CONFIG_PCI, currently linking fails:
>>
>>     ../hw/ide/ich.o: In function `pci_ich9_ahci_realize':
>>     hw/ide/ich.c:124: undefined reference to `pci_allocate_irq'
>>     hw/ide/ich.c:126: undefined reference to `pci_register_bar'
>>     hw/ide/ich.c:128: undefined reference to `pci_register_bar'
>>     hw/ide/ich.c:131: undefined reference to `pci_add_capability'
>>     hw/ide/ich.c:147: undefined reference to `msi_init'
>>     ../hw/ide/ich.o: In function `pci_ich9_uninit':
>>     hw/ide/ich.c:158: undefined reference to `msi_uninit'
>>     ../hw/ide/ich.o:(.data.rel+0x50): undefined reference to `vmstate_pci_device'
>>
>> We must only compile ich.c if CONFIG_PCI is available, too, so introduce a
>> new config switch for this device.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Oops, "AHCI" in patch subject (D -> C).
