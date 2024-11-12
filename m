Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7401888njc;
        Tue, 12 Nov 2024 07:11:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWnaAsNK9oBztLT+Y6j6yh0cJ1FKlwYD1FJp5qvxizfXnvrInL0xaOsA1pxMxdIhXxfDJBcHBd0b7XAxg==@linaro.org
X-Google-Smtp-Source: AGHT+IHND8TNbFkW98aDrAMbCOWfdFRGj5XfgAm3HRAPvP4VlwWAhR+BZrtCdEdprgyL6RcebjAV
X-Received: by 2002:a05:622a:4297:b0:460:c2f3:7343 with SMTP id d75a77b69052e-463093581d8mr239721941cf.28.1731424309466;
        Tue, 12 Nov 2024 07:11:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731424309; cv=none;
        d=google.com; s=arc-20240605;
        b=AqitDkIWmWr5qlqMNHnmTH3lurd14G+nPFAAn2sIWHDdPQYkOozOz0a1HudXY1awZg
         GbHg69U5IOtZ3+Ik0gJxEfc3H9I9I7qAZ3mLNbJ6xN2xvst/b/p6GqZUFVXt5qSzFNwx
         iwOKvVF/9ehMELAldpe6BAE8AXpjzBZQHq1YMfh8Ca+wzWsT5b8GSL351nkeowRyv5vz
         yKlS9rUMFD8lJAUUqS2jnIlxK00ceQ0q7MxlNO5DWNOyfUzf180WbZ3foBCN+H8hIlgX
         IG13EKHCLuVRJ19IbuJDof3w5GQtDisOk7rj/nqchgC6DZXh+rdmFj8L0EviX9PldH/X
         BnjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=pCf7tzmW5Hq7+4dDLnJgd/ts/o+HWqofMRLhpIzp/hc=;
        fh=BBL6gqkr/hbOnYXwbszMlbKOzUQ7bPcF+2Ij/fJkU00=;
        b=MwhyZQs6TLpU+eXZUOeQKaOwHT9rn2iU1P/DBr5iMzJa0Lo0f18cg5TzgwkkGuEe4N
         VbsFJVfcBI9mbEUoNXya9ZssUgKz/g/m6QYomxOcdffxlnEzPgR8mFCftWh5CIPj1h9d
         ONzsahzJaTS/NYa1fz7YzufS5zF3gK96FP2s5UxAGWXb94ki62D1LgybbqaS8QigYql8
         ROrkPKn5BU3Nsgf7fpgaYT4OuGXNdwLm0+hMTK4gObQ5oqSKNwnVmQzVRzr92AK4szCY
         mLYbfWdJtJcl2oSeaePb9f/q7F/+ZhQVR3IJG7G1MEyjD/zW4a3d36j5jV7F7RUB+R62
         0pnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff40ef6csi147753351cf.81.2024.11.12.07.11.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 07:11:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tAsXw-00011u-LG; Tue, 12 Nov 2024 10:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=0wfx=SH=kaod.org=clg@ozlabs.org>)
 id 1tAsXu-00011c-V1; Tue, 12 Nov 2024 10:11:11 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=0wfx=SH=kaod.org=clg@ozlabs.org>)
 id 1tAsXr-0004Av-Pu; Tue, 12 Nov 2024 10:11:10 -0500
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XnqcG2xf2z4x8T;
 Wed, 13 Nov 2024 02:10:54 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xnqc62RMRz4wZx;
 Wed, 13 Nov 2024 02:10:46 +1100 (AEDT)
Message-ID: <59bd8d1e-c56a-4e77-a2a8-0f7050249423@kaod.org>
Date: Tue, 12 Nov 2024 16:10:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/8] usb/uhci: Move PCI-related code into a separate
 file
To: Guenter Roeck <linux@roeck-us.net>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 BALATON Zoltan <balaton@eik.bme.hu>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org
References: <20240906122542.3808997-1-linux@roeck-us.net>
 <20240906122542.3808997-4-linux@roeck-us.net>
 <2a318a7f-dd37-4fce-9106-7a85236c9408@redhat.com>
 <ee184371-68f0-4982-8f94-2170332fbc8a@roeck-us.net>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <ee184371-68f0-4982-8f94-2170332fbc8a@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=0wfx=SH=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: O/C4uunkbs1p

On 11/12/24 15:50, Guenter Roeck wrote:
> Hi Thomas,
> 
> On 11/11/24 22:32, Thomas Huth wrote:
>> On 06/09/2024 14.25, Guenter Roeck wrote:
>>> Some machines (like Aspeed ARM) only have a sysbus UHCI controller.
>>> The current UHCI implementation only supports PCI based UHCI controllers.
>>> Move the UHCI-PCI device code into a separate file so that it is possible
>>> to create a sysbus UHCI device without PCI dependency.
>>
>>   Hi Guenter,
>>
>> I think there's a bug in here ...
>>
>>> diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
>>> index 6162806172..7fdb4697f9 100644
>>> --- a/hw/usb/vt82c686-uhci-pci.c
>>> +++ b/hw/usb/vt82c686-uhci-pci.c
>>> @@ -1,17 +1,17 @@
>>>   #include "qemu/osdep.h"
>>>   #include "hw/irq.h"
>>>   #include "hw/isa/vt82c686.h"
>>> -#include "hcd-uhci.h"
>>> +#include "hcd-uhci-pci.h"
>>>   static void uhci_isa_set_irq(void *opaque, int irq_num, int level)
>>>   {
>>> -    UHCIState *s = opaque;
>>> +    UHCIPCIState *s = opaque;
>>
>> You use UHCIPCIState as parameter for the irq-related functions...
>>
>>>       via_isa_set_irq(&s->dev, 0, level);
>>>   }
>>>   static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
>>>   {
>>> -    UHCIState *s = UHCI(dev);
>>> +    UHCIPCIState *s = UHCI_PCI(dev);
>>>       uint8_t *pci_conf = s->dev.config;
>>>       /* USB misc control 1/2 */
>>> @@ -21,12 +21,12 @@ static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
>>>       /* USB legacy support  */
>>>       pci_set_long(pci_conf + 0xc0, 0x00002000);
>>> -    usb_uhci_common_realize(dev, errp);
>>> -    object_unref(s->irq);
>>> -    s->irq = qemu_allocate_irq(uhci_isa_set_irq, s, 0);
>>> +    usb_uhci_common_realize_pci(dev, errp);
>>> +    object_unref(s->state.irq);
>>> +    s->state.irq = qemu_allocate_irq(uhci_isa_set_irq, &s->state, 0);
>>
>> ... but you set it up with UHCIInfo as parameter here. I think this line should rather be:
>>
>>      s->state.irq = qemu_allocate_irq(uhci_isa_set_irq, s, 0);
>>
>> Shouldn't it?
>>
> 
> Yes, you are correct. Thanks for reporting it. Turns out I had fixed that in the
> meantime, but did not remember to send another version. Is there any interest,
> and should I resend ?

Please do. I was planning on merging the obvious ones in QEMU 10.0
and spend more time reviewing the others.

Thanks,

C.

