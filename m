Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1565034wru;
        Mon, 16 Jul 2018 07:23:43 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcdNhTeryDNdJh5mw5lIRqSqrIUZv6mSQgNZdSLVLj1Agcwy5BLjCBg/nXWdSrC3NT7gc9S
X-Received: by 2002:a37:2814:: with SMTP id o20-v6mr14163023qkh.245.1531751023629;
        Mon, 16 Jul 2018 07:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531751023; cv=none;
        d=google.com; s=arc-20160816;
        b=V/K9OnmZp0K4wDMoKkPrWBB9n72XvnnS7HC+xj4ppEQKxHqSPlon0XKipvrCg3tWqf
         2gABSHwkWmQisIxSPgHIv76AAvADzkL7Fpv4+HxabAREnWOs+qalM0gkcJ8HFgY9daN8
         pOK54yltsV8qXNSHlaXLWy5sp3aFHWe/Yl7+W0BC9Rf093c6+Rl0zzA5Ho+qBNQv4NC0
         yn4SWOk5UsxH7TigOXnaD3JcKTmUi8caU67+8r/m94pZzUghxEDVjM/V+ca73vExEbMa
         9kyyk56jir4b69hAfdDb/h9r1024KgkgTuCzONqrPYa/b0OKTblVuhZwa3M4kj86OvZO
         CDBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=Ard4Ytk2Lvyu0c4oZOvdgJ3dDyHODfIvAQFX3H5C92U=;
        b=yk6pb4AlpIhGLdm5p666eSLoK9B4XZhYR1+7NPc4SsgtEXJb+434ZxSG50s6TJZmvB
         zM9dxsVuL6kzUiFWxK9PL+4t7h/XMGwBduxlliobXDm5jfmkbL/+Dk4GXb610LUzUHgM
         yzaoHlWmx2Yg8LzTUgZWch9UPb84+OM/78i3DnvACD2ZbCh1JUXCeCLs2Yhud+oOVncf
         lNDVeDGZW2E1451ySpUoo5gM6Ir+CzX2kXeC1JYWG84gdBH5EDmX8S/0yFd7NhGuGZnf
         TeTUGFmgtP9deZeqbshTQiyXD+5NyuE8HRtMaTmEa0jTjLODuLoJQLInCpC6NwPJQNX/
         fpRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u188-v6si5156062qka.330.2018.07.16.07.23.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 07:23:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52109 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff4Pf-0004fm-1F
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 10:23:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff4PX-0004fV-7U
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 10:23:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff4PS-0007XX-8n
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 10:23:35 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37376 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ff4PS-0007X5-2k; Mon, 16 Jul 2018 10:23:30 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 842BD4022414;
	Mon, 16 Jul 2018 14:23:29 +0000 (UTC)
Received: from [10.33.200.180] (dhcp-200-180.str.redhat.com [10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA0697C3B;
	Mon, 16 Jul 2018 14:23:28 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>
References: <1531415537-26037-1-git-send-email-thuth@redhat.com>
	<87zhyrgt6i.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <a158267b-2d07-3830-3f77-222c4f01c598@redhat.com>
Date: Mon, 16 Jul 2018 16:23:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <87zhyrgt6i.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Mon, 16 Jul 2018 14:23:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Mon, 16 Jul 2018 14:23:29 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/bcm2836: Mark the
 bcm2836 / bcm2837 devices with user_creatable = false
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rtlbqE3w+XRH

On 16.07.2018 16:18, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> These devices are currently causing some problems when a user is trying
>> to hot-plug or introspect them during runtime. Since these devices can
>> not be instantiated by the user at all (they need to be wired up in code
>> instead), we should mark them with user_creatable = false anyway, then we
>> avoid at least the crashes with the hot-plugging. The introspection problem
>> will be handled by a separate patch.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  hw/arm/bcm2836.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
>> index 6805a7d..45d9e40 100644
>> --- a/hw/arm/bcm2836.c
>> +++ b/hw/arm/bcm2836.c
>> @@ -185,6 +185,8 @@ static void bcm283x_class_init(ObjectClass *oc, void *data)
>>      bc->info = data;
>>      dc->realize = bcm2836_realize;
>>      dc->props = bcm2836_props;
>> +    /* Reason: Must be wired up in code (see raspi_init() function) */
>> +    dc->user_creatable = false;
>>  }
>>  
>>  static const TypeInfo bcm283x_type_info = {
> 
> A more common way to phrase this is
> 
>        /* Reason: needs to be wired-up by raspi_init() */
> 
> If you you expect other functions to wire this one up in the future,
> insert ", e.g." before "by".

$ grep -r Reason.*wire hw/
hw/acpi/piix4.c:     * Reason: part of PIIX4 southbridge, needs to be wired up,
hw/core/or-irq.c:    /* Reason: Needs to be wired up to work, e.g. see stm32f205_soc.c */
hw/core/register.c:    /* Reason: needs to be wired up to work */
hw/core/split-irq.c:    /* Reason: Needs to be wired up to work */
hw/dma/i8257.c:    /* Reason: needs to be wired up by isa_bus_dma() to work */
hw/i2c/smbus_ich9.c:     * Reason: part of ICH9 southbridge, needs to be wired up by
hw/ide/microdrive.c:    /* Reason: Needs to be wired-up in code, see dscm1xxxx_init() */
hw/intc/apic_common.c:     * Reason: APIC and CPU need to be wired up by
hw/intc/nios2_iic.c:    /* Reason: needs to be wired up, e.g. by nios2_10m50_ghrd_init() */
hw/isa/piix4.c:     * Reason: part of PIIX4 southbridge, needs to be wired up,
hw/isa/vt82c686.c:     * Reason: part of VIA VT82C686 southbridge, needs to be wired up,
hw/isa/lpc_ich9.c:     * Reason: part of ICH9 southbridge, needs to be wired up by
hw/pci-host/piix.c:     * Reason: part of PIIX3 southbridge, needs to be wired up by
hw/pci-host/piix.c:    /* Reason: needs to be wired up by pc_init1 */
hw/pci-host/q35.c:    /* Reason: needs to be wired up by pc_q35_init */
hw/timer/mc146818rtc.c:    /* Reason: needs to be wired up by rtc_init() */

... does not look very consistent to me.

But if Peter feels like it should be changed, too, please feel free
to modify the comment when picking up the patch (I won't resend it
again just because of this).

> I like consistency in such things, but it's matter of taste, thus:
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

 Thanks,
  Thomas
