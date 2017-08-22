Received: by 10.223.188.70 with SMTP id a6csp4707334wrh;
        Tue, 22 Aug 2017 03:07:49 -0700 (PDT)
X-Received: by 10.200.44.248 with SMTP id 53mr161035qtx.282.1503396468891;
        Tue, 22 Aug 2017 03:07:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503396468; cv=none;
        d=google.com; s=arc-20160816;
        b=SjHivdKM8ZLTcAUfMGl8aMJOfVMjG5kElDWUZuYbxJNsJ6kU60dJNwN0h00EeMM0Im
         6dSOsJChj0+NTLtaxbu0TlpAhB6uNTTyeFk7UtuZKhzACpqRPfOZqlGtKxcFOcd544Zp
         QENbfnZW51nqeiFdZMMMeA0Tqij7gaMY40MB5pT3hqvP8PPYn1H7PGpieAY7+GqadfxI
         IXXYmWWVV2+D37Yc7qDl4bEt0VPoxe32e6ZmmI8r0Y98Z7g9OYuF+n2DRIt+8Oc189OY
         qbmnPBoLBR4UNr2OMbyNH7yMh52FkiMsNJogH0in7C1npbF4vD9wtECUvyqBroHgkmXL
         YYUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=R6aiDJe18831JZE2Us8izPGXUHspeiD6J+KA4KSrONA=;
        b=b+/bUQ3wyrbKT25vRS3ATfgrw1FBxVf7bTTxlAEvrkHx39sLPMqsabrvD3HEyJUgE4
         HVThIcQjV4qjmMri3FQfvM7+dKwWjwDA2NRdeNABMGnaveGONm4ik03WzWy301aKxUbM
         HWqT1u6siSt4ACz8q5XLcHjnM8e61kIVrnsifs1QsmexTAmw2t003qwClJvmUXkTc3WS
         442NQN8K9p2rNUOybxAHbqZWbkc0qyNs3xgyAc7zV7R4RkS259IjB9QV+OIOoaBB97Qc
         qeawAgcgBGk9Ag52ORx1FSh2hdphI2+/01uI9QmSlZ9BAhmw5C2a6/js+YUMb1vIq6uD
         c9vw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o79si13835016qko.242.2017.08.22.03.07.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 03:07:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58292 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dk666-00046p-Kh
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 06:07:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dk65y-00045R-9m
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 06:07:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dk65v-0001KM-2Q
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 06:07:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39588)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dk65u-0001Hm-Sd; Tue, 22 Aug 2017 06:07:35 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0358BC058EC1;
	Tue, 22 Aug 2017 10:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0358BC058EC1
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.21] (ovpn-116-21.ams2.redhat.com [10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E37F614CF;
	Tue, 22 Aug 2017 10:07:30 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1503076096-14220-1-git-send-email-thuth@redhat.com>
	<CAFEAcA_F1iFu8cbKCyxnjZP+hVY9DkrJZXHqZ65G10BqzcapQw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f7b75c78-1db3-7e82-d5cb-9cd8266077a9@redhat.com>
Date: Tue, 22 Aug 2017 12:07:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_F1iFu8cbKCyxnjZP+hVY9DkrJZXHqZ65G10BqzcapQw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 22 Aug 2017 10:07:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw/arm/allwinner: Fix crash with -nodefaults
 -M cubieboard
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Li Guang <lig.fnst@cn.fujitsu.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 749PytyTz3MS

On 18.08.2017 19:14, Peter Maydell wrote:
> On 18 August 2017 at 18:08, Thomas Huth <thuth@redhat.com> wrote:
>> The allwinner-a10 device uses serial_hds[0] without checking whether
>> it is available or not. So using the cubieboard with -nodefaults
>> currently results in a segmentation fault. Fix it by adding a
>> proper check here.
>> And while we're at it, mark the device as "user_creatable = false"
>> since this apparently can not directly be used by the users but has
>> to be wired up in code instead.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  hw/arm/allwinner-a10.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
>> index f62a9a3..e152566 100644
>> --- a/hw/arm/allwinner-a10.c
>> +++ b/hw/arm/allwinner-a10.c
>> @@ -109,8 +109,10 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
>>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->sata), 0, s->irq[56]);
>>
>>      /* FIXME use a qdev chardev prop instead of serial_hds[] */
>> -    serial_mm_init(get_system_memory(), AW_A10_UART0_REG_BASE, 2, s->irq[1],
>> -                   115200, serial_hds[0], DEVICE_NATIVE_ENDIAN);
>> +    if (serial_hds[0]) {
>> +        serial_mm_init(get_system_memory(), AW_A10_UART0_REG_BASE, 2, s->irq[1],
>> +                       115200, serial_hds[0], DEVICE_NATIVE_ENDIAN);
>> +    }
> 
> This doesn't look like the right fix, because it means that
> there won't be a UART device at that point in system memory
> at all. What you want is for there to be a UART device there
> but not connected to anything, ie serial_mm_init() should cope
> with being passed a NULL Chardev*.

OK, makes sense. ... but I guess the patch to fix serial_mm_init() is
going to be a bigger patch, since serial_realize_core() currently
expects a char device, too, and thus needs to be reworked, too ... I'll
try to come up with something when I've got some more spare time...

 Thomas
