Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2279707wro;
        Fri, 2 Nov 2018 08:58:11 -0700 (PDT)
X-Google-Smtp-Source: AJdET5c4FUkBPo7rmn9VlGoFc1thzQb0IGVrOI+4N8oKgxxXLyr+9m+D6ypMlOMt8bT+fFFH/9yB
X-Received: by 2002:ac8:1096:: with SMTP id a22-v6mr11215691qtj.359.1541174291134;
        Fri, 02 Nov 2018 08:58:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541174291; cv=none;
        d=google.com; s=arc-20160816;
        b=REh1eu4gPUjY3ZMIUiO0aWkwt96nXWjYpQtDqclSjT1fxPXn6eA+Wn7MNGucCDSuUV
         Qi+Ek+i17QESeilzOQneKhRfU/y1NFUmMuxUc73KWBPAffzZsb/vgFXYnb21Va3m9Luz
         6vfH0CnzG12xuGy+ymZphLpkhk+0IB/tN3JUj071oBB01VuAv1bu+BQsLbmpsITnKZxC
         t70HdI5hinu3Z7tpIPQvlGcFP73hI3frppB24gndSEivz/aI62yioVjD1WoVwdqCdp8m
         qrwB1WdaiM0iVYuUvkOy0AkUtr+3y4LldWm1OX8jhm3Pta2ZEPaPKoahNd/2hhCYRJJT
         51Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=S+A0D/hvSrrjUsALnBb61jhRQ4wwWO4S3wNQ9E0F0wc=;
        b=fSIZA866dBivTi/7/cezMzD66B+TWwtJTZPHDi2JTWFu6wTJjJMWJi+YRycaLhGKkQ
         V21Z/WzNvhkGgN/LENixv3+6paHass3gRqw+fSd3VD+FsI5Ql2eTSjTL3/6iuixhFWfI
         Qa0FV+ORsdzq0om4lzawuXm3EOUKrQaAXe9CVbprtVu4+pm/PReE0oePiQ1EMqFGgPqX
         V08fJT+lq01gCtevzLOqIkLFRti6V1FX8JxP7f1D06N7H5f0Rc5yLE+WyxoVn4FsTxui
         JBXDktIAOCYIwLb0qxIFBAx8kUcVSc4m+qwbj79NOKVgZlbqM8bztaMVJ2usRgH9jrGQ
         Zjcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t4si8206564qve.191.2018.11.02.08.58.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 08:58:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52279 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIbpq-00063x-6s
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 11:58:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>) id 1gIbph-0005xa-6C
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 11:58:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>) id 1gIbpe-0002vH-0t
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 11:58:01 -0400
Received: from steffen-goertz.de ([88.198.119.201]:33100)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>)
	id 1gIbpd-0002q0-Oy; Fri, 02 Nov 2018 11:57:57 -0400
Received: from [172.27.223.37] (unknown [192.76.177.125])
	by steffen-goertz.de (Postfix) with ESMTPSA id C55004FF03;
	Fri,  2 Nov 2018 16:55:16 +0100 (CET)
To: =?UTF-8?Q?Steffen_G=c3=b6rtz?= <contrib@steffen-goertz.de>,
	qemu-devel@nongnu.org
References: <20181031002526.14262-1-contrib@steffen-goertz.de>
	<20181031002526.14262-13-contrib@steffen-goertz.de>
From: =?UTF-8?Q?Steffen_G=c3=b6rtz?= <mail@steffen-goertz.de>
Openpgp: preference=signencrypt
Message-ID: <bdcf79c4-d5af-0e03-0963-78603b268467@steffen-goertz.de>
Date: Fri, 2 Nov 2018 11:57:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031002526.14262-13-contrib@steffen-goertz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: Re: [Qemu-arm] [PATCH v3 12/13] arm: Instantiate NRF51 Timers
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
	"open list:NRF51" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JzIAfIlD34do

Hi Stefan,
> 
> Indentation is off here.  One way of formatting it:
> 
>                 address_space_write(&s->as, i * NRF51_PAGE_SIZE,
>                                     MEMTXATTRS_UNSPECIFIED, s->empty_page,
> 				    NRF51_PAGE_SIZE);

Good catch.

>> +static void nrf51_nvm_reset(DeviceState *dev)
>> +{
>> +    NRF51NVMState *s = NRF51_NVM(dev);
>> +
>> +    memset(s->uicr_content, '\0', sizeof(s->uicr_content));
>> +}
> 
> We will zero UICR.  Does UICR come zero-initialized on a real micro:bit?
> 
> I remember there was an issue with .hex files that set UICR values.
> Will nrf51_nvm_reset() overwrite values from .hex files when the generic
> loader devices is used (-device loader,file=test.hex)?
> 
UICR comes 0xFF initialized ([1] 8.1) and yes we had a conflict with the js-runtime.
I now moved the memset to init just before mapping the region:

memset(s->uicr_content, 0xFF, sizeof(s->uicr_content));
memory_region_init_io(&s->uicr, NULL, &uicr_ops, s, "nrf51_soc.uicr",
                      sizeof(s->uicr_content));
ysbus_init_mmio(sbd, &s->uicr);

That should do the trick.
A reset without loading of a new firmware blob will not change the (flash) user memory any longer, which should match the real device.

Best,
Steffen


[1] http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.pdf
