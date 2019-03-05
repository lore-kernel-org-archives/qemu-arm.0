Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp4682406wrx;
        Tue, 5 Mar 2019 04:23:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqz/3PiXnRHSkFbcvcRDIYzShQG+EJm3ab4sLeTY5g2yspTuBMHAvb5kxXi/GZcfJksyi056
X-Received: by 2002:a25:8392:: with SMTP id t18mr1755110ybk.340.1551788620883;
        Tue, 05 Mar 2019 04:23:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551788620; cv=none;
        d=google.com; s=arc-20160816;
        b=JQ3mVAKl/nsl7No18/qaHul6Qu8t0wDCwCMw6DaMDGLnvySoZgO+vBSh36cLtZQ0XD
         hhRDyYww5gX9LSySuHJGS8+BOHiP7jlgb4ZZ5SdoslaUr+MZZDaFEHBHE3P+zFRnN88z
         OHhn/vCC1j+k7utY5Q7iXzyHTrRcFze+BJDAzP4fXgNipQiaZa21jC2hnxwVTtJpgtVo
         uw6fPzklDmTSW94lGzBh13C7E+kLuZGD7VowWqkxxYaBNr3y+AmOPfvOFRwv26f1Pr9r
         iQCFTe41gij8jkt9PPMwAXJDh4fHTc05mQEvKgbB/nyVeXsfNe2BwVzADOwov1nUVQXe
         9RhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=KbPu7FLr8wsdPCtmMkEokCwGYmBflUVPKbJvKv7R91A=;
        b=uLS/NBgwE0ZVUJAyQo2tTzLOfE0lGC/O/EBb2n8fouHf+D0dKJotqrkUt35LJz1DHO
         uwU/8nMl8PsKszSMFQZrUvdxbMg8E5HkUOyAo0y+CBa9fZCmox7wdeJLhPADS3cUGddY
         oLIYwAOyyrWlOGJup7NkzlXARtjWWT34pW3xJu4qv5cASXIzokwArpN/zF3RjZhf3uFX
         drepFwIrYzmZCPaDaibS+8TsdSGfkDWdACTCYo0XzRCMleapVMTHecxhlA4BsjJ/6jUk
         HOA6t46kPEdzgFfZmoz7KR1cvJqZoZPUatev1i7+72ldXcWBl0sAel9X6eJjBo065G+K
         59Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n15si4810827ybp.84.2019.03.05.04.23.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Mar 2019 04:23:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42046 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h196i-0001fO-BT
	for alex.bennee@linaro.org; Tue, 05 Mar 2019 07:23:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h196W-0001eP-AI
	for qemu-arm@nongnu.org; Tue, 05 Mar 2019 07:23:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h196V-0006uP-C9
	for qemu-arm@nongnu.org; Tue, 05 Mar 2019 07:23:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47950)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1h196V-0006nl-2k; Tue, 05 Mar 2019 07:23:27 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 017B688312;
	Tue,  5 Mar 2019 12:15:06 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-100.rdu2.redhat.com
	[10.10.120.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B3BA5D783;
	Tue,  5 Mar 2019 12:14:55 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
	<3a6bf5ea-5b48-18c2-8a2c-0ced777be816@redhat.com>
	<892e3eb7-66f5-92a3-5891-de8665fc984a@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8392D6875@lhreml524-mbs.china.huawei.com>
	<d3c99948-2fdb-f345-8b22-03a7e181122c@redhat.com>
	<6f4276b4-c79c-00a0-530e-be72c8093ad1@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8392D778D@lhreml524-mbs.china.huawei.com>
	<f5d04d6d-6e99-ba52-c903-6f59d83eff6c@redhat.com>
	<20190301183924.5fdd2a0f@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <44dbd7af-d6f9-34fd-915c-8a748960dd2e@redhat.com>
Date: Tue, 5 Mar 2019 13:14:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190301183924.5fdd2a0f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 05 Mar 2019 12:15:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH 0/4] ARM virt: ACPI memory hotplug support
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Linuxarm <linuxarm@huawei.com>, Auger Eric <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"Leif Lindholm \(Linaro address\)" <leif.lindholm@linaro.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /BuLTkCe2MYR

On 03/01/19 18:39, Igor Mammedov wrote:
> On Fri, 1 Mar 2019 14:49:45 +0100
> Laszlo Ersek <lersek@redhat.com> wrote:
>=20
>> On 02/28/19 15:02, Shameerali Kolothum Thodi wrote:
>>
>>> Ah..I missed the fact that, firmware indeed sees an update in the blo=
b len here
>>> (rounded or not) after reboot. So don=E2=80=99t think x86 has the sam=
e issue and padding
>>> is not the right solution as Igor explained in his reply.
>>>
>>> I will try to debug this further. Any pointers welcome. =20
>>
>> How about this.
>>
>> (1) The firmware looks up the fw_cfg file called "etc/table-loader" in
>> the fw_cfg file directory (identified by constant selector key 0x0019,
>> FW_CFG_FILE_DIR).
>>
>> (2) The directory entry, once found, tells the firmware two things
>> simultaneously. The selector key, and the size of the blob.
>>
>> (3) The firmware selects the selector key from step (2).
>>
>> (4) QEMU regenerates the ACPI payload (as a select callback).
>>
>> (5) The firmware reads the number of bytes from the fw_cfg blob that i=
t
>> learned in step (2).
>>
>> Here's the problem. As long as QEMU used to perform step (4) only for
>> the purpose of refreshing PCI resources in the ACPI payload, step (4)
>> wouldn't *resize* the blob.
>>
>> However, if step (4) enlarges the blob, then the byte count that step
>> (5) uses -- from step (2) -- for reading, is obsolete.

> I've thought that was a problem with IO based fw_cfg, as reading size/c=
ontent
> were separates steps and that it was solved by DMA based fw_cfg file re=
ad.

The DMA backend is not relevant for this question, for two reasons:

(a) The question whether the fw_cfg transfer takes places with port IO
vs. DMA is hidden from the fw_cfg client code; that code goes through an
abstract library API.

(b) While the DMA method indeed lets the firmware specify the details of
the transfer with one action, the issue is with the number of bytes that
the firmware requests (that is, not with *how* the firmware requests the
transfer). The firmware has to know the size of the transfer before it
can initiate the transfer (regardless of port IO vs. DMA).


My question is: assume the firmware item in question is selected, and
the QEMU-side select callback runs (regenerating the ACPI payload). Does
this action update the blob size in the fw_cfg file directory as well?

If it does, then I can work around the problem in the firmware. I can
add a re-lookup to the code after the item selection, in order to get
the fresh blob size from the fw_cfg file directory. Then we can use that
size for the actual transfer.

This won't help old firmware on new QEMU, but at least new firmware on
old QEMU will not be hurt (the re-fetching of the fw_cfg file directory
will come with a small performance penalty, but functionally it will be
a no-op).

Thanks
Laszlo
