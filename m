Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5655006wro;
        Tue, 30 Oct 2018 07:26:59 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cthrS0EAvrK/TMlxOtnPwuO8EV1b4wCttG1Qx3s/0WWUSFNKPpF10rQSPCaKnofWU60cZK
X-Received: by 2002:a0c:8322:: with SMTP id j31mr7834594qva.56.1540909619155;
        Tue, 30 Oct 2018 07:26:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540909619; cv=none;
        d=google.com; s=arc-20160816;
        b=d14PcH1ShZC+MT2Z4ynKWfmWNA0rnFWpjISfsdglITjgFPLBXpGxVOJKSjWZhN5Dhq
         r0+d4e70fnTiNf8Az/DULW3HLXP/Mr6VBmf61ZEy7MRzWbeJozpk/u+Ewdj23J4QUHZI
         zNS6oHQe/II2aBKMYTho8o1WUn18TITBB2j0cnsmp7kE4A+6lMfK+1wlbCNpiDYwtfqV
         ZifJvqwYoO4FwdcBtl0CrdxVLQ45F49pvREepiZ+N20Hb0oModTrA95xeUvXuTc1TUwh
         ccAHAT9g+DymPOFzuiDnAflSvABJbFTC0w+cSjnux4rZ7lpZ18yNT7EYiFPK5TJpATHH
         JHlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=6nEYi0lCcDjUujqcir5OWPXfN0ltTyGHaALnxtDBiss=;
        b=Ru6jcik0zvW3SEP+FecpKJQ45n0qgXrXIhOSOiRbLGppRR89ATT9FIHFLUQCYwwrX+
         lASQetsBVv42XdBp2iu2z3JOHFSV0hAmyNFd81FGLq2nlhmDEtPHLwyfUUuCZUrLVynk
         tK9LlAtZSYzACjibuFhhBC2jKIXXUvM7i2N3L2xliInqFN9aESUkhTkMfnjvpumYwqpy
         wBlq9HyrS7WUCR+6nouVPXgI/K32DfEWs8ZLzELsclEBGIPhH4v5EGLKY6zXMwIE7MrO
         widE6TaSom7F3mDHOFoEIHQ+hkF80dU1hes8CfUl/N21pXSf8JKdUWnJmkweBi8JV/JN
         kgxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e24si1059854qtg.241.2018.10.30.07.26.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 07:26:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53559 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHUyw-0003LE-Ll
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 10:26:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHUyn-0003K7-1y
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 10:26:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHUyi-00037A-DV
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 10:26:48 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39267)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gHUyi-0002uq-2D
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 10:26:44 -0400
Received: by mail-wr1-f67.google.com with SMTP id r10-v6so12836061wrv.6
	for <qemu-arm@nongnu.org>; Tue, 30 Oct 2018 07:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6nEYi0lCcDjUujqcir5OWPXfN0ltTyGHaALnxtDBiss=;
	b=Kl1BrRQkvzAnLbrQfyjRIGN6vP69qa070NkDYXF5qyvT1GINZgGjcS/WhNlX56/SdE
	Smz3Bmzp83lkGsYi2A6gjpdXU/IahV2D/TpTuPo5S8Z7nrLFm8VLyTCRia5tsj7wIIGA
	9Ga83+AGd6KIfzy/UcykvkBJ4SEGacrqIliQOOH0I3x5T2c79/0T1pBWZGX2+62liu2G
	H0IXzD4iq6L0mb/vP1zQjLxTXr8eBQODseEY2pv9OnQQ981NGjqYvM0i9VWFBYspycnD
	Hrx65hrPeWfjCEd6BMto868O7EcyET0J2VxsuudsyY7uPZNkNr5J/t53A2d2hxXriCtq
	UbSA==
X-Gm-Message-State: AGRZ1gKm2lzNv6DBUeOSOau0sAiYLP6lGbsw/pYboWM+9BDRHQ3DH5yN
	Zlkaq+hhEBXW4uEwat+ioKjXGA==
X-Received: by 2002:a5d:4406:: with SMTP id
	z6-v6mr4733173wrq.294.1540909585235; 
	Tue, 30 Oct 2018 07:26:25 -0700 (PDT)
Received: from [192.168.1.130] ([139.47.13.138])
	by smtp.gmail.com with ESMTPSA id
	x139-v6sm27512909wme.3.2018.10.30.07.26.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Oct 2018 07:26:24 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20181030114048.21527-1-philmd@redhat.com>
	<20181030114048.21527-2-philmd@redhat.com>
	<CAFEAcA-yrZY3QD7ecOkQHU18qnU2y=G-QP+=ZZMhhnKTWwoVVw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bb6a600f-861e-57dd-0bdb-108eccbaf7fa@redhat.com>
Date: Tue, 30 Oct 2018 15:26:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-yrZY3QD7ecOkQHU18qnU2y=G-QP+=ZZMhhnKTWwoVVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [PATCH v2 1/2] hw/arm/xilinx_zynq: Use the
 ARRAY_SIZE macro
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xXJGy0ul0Uip

On 30/10/18 15:07, Peter Maydell wrote:
> On 30 October 2018 at 11:40, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   hw/arm/xilinx_zynq.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
>> index f1496d2927..57497b0c4d 100644
>> --- a/hw/arm/xilinx_zynq.c
>> +++ b/hw/arm/xilinx_zynq.c
>> @@ -294,7 +294,7 @@ static void zynq_init(MachineState *machine)
>>       busdev = SYS_BUS_DEVICE(dev);
>>       sysbus_mmio_map(busdev, 0, 0xF8003000);
>>       sysbus_connect_irq(busdev, 0, pic[45-IRQ_OFFSET]); /* abort irq line */
>> -    for (n = 0; n < 8; ++n) { /* event irqs */
>> +    for (n = 0; n < ARRAY_SIZE(dma_irqs); ++n) { /* event irqs */
>>           sysbus_connect_irq(busdev, n + 1, pic[dma_irqs[n] - IRQ_OFFSET]);
>>       }
>>
>> --
>> 2.17.2
> 
> Since this isn't related to the other patch, I'll just apply
> it to target-arm.next to save you carrying it around.

Thank you!
