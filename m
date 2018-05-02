Received: by 10.28.4.212 with SMTP id 203csp750521wme;
        Wed, 2 May 2018 06:54:50 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpEKKamX7F6wATbTNBMOxL25Pr1/BOKTmuPNmZRvWbWvyZzszQNmUKJC5p22V2wegOuUOYc
X-Received: by 10.176.93.27 with SMTP id u27mr8959285uaf.59.1525269290751;
        Wed, 02 May 2018 06:54:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525269290; cv=none;
        d=google.com; s=arc-20160816;
        b=yjqf0/je1dAMfAHdbLS+g2pHeO6JhqXCu/ISy7z1iCAcEEZn5NkeJcGAVoC6mBpNN2
         G9uYKYWcaN95C1u61XxWgbX0DREVz7N78MpUiFjkjtUxKLPtLZvPkRG+u+WOXtEpGeSO
         fJA/HPfKF+5TAXN1EUpVQcVR2Md4DfBqynxWeIv6H2TYKoCxITkuDfTAwwMLXFdYrg0A
         T/jy8VlLrBPwmnHHi0il7Ck93MF6hUS5naZElCYm5YG6TY/jHe6qtYsRusJTWYxwOzwU
         DkC0N/hnUDavOzk/EGDPln/4aqNTIXqJSln7JTgUCFi2fihG+PkTN7VH4FefhsR6sUnf
         aKKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=/imgNtHVVOsCn4da5biSH6nAW8CEZ3UFcGroQQYZqYs=;
        b=a6tAbDkh9k1MWuY1my+T6zCWtCdXOukSHXU1liweTTAHvJow6TAvejw3J59tHkW/EP
         wMbaGNvE5ZZnCaY920WA3VwRP1pyDyBe9BtRfYxM1M6CUD0CNR8S7iE6ve012J37ceoC
         dJSuuwWXxTp0SEm0E4rBb5C49o5wFM9xOVFh38On7mn6rlzGARK8cApJqZtuwZMfahbM
         N+bOrM9WaiIxrNfgR2LgTxUlkfHi3KJUsanGnDvrGbcEPIt2V/C0Lj5d0WRapd6w6Gdr
         pgj9zp3RzCLySWPDxKSmiToCOZ9AgAa687/XbkUsvgslO7IE/m/HlxXbifkFjUqDwyiw
         j1Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o84-v6si4647457vkd.20.2018.05.02.06.54.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 May 2018 06:54:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50600 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fDsDa-0003Du-8j
	for alex.bennee@linaro.org; Wed, 02 May 2018 09:54:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fDsDR-0003Dp-Mz
	for qemu-arm@nongnu.org; Wed, 02 May 2018 09:54:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fDsDO-0002EL-LC
	for qemu-arm@nongnu.org; Wed, 02 May 2018 09:54:41 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54750 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1fDsDO-0002E1-E4; Wed, 02 May 2018 09:54:38 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0DB2120BD8;
	Wed,  2 May 2018 13:54:34 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-197.rdu2.redhat.com
	[10.10.120.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B564163529;
	Wed,  2 May 2018 13:54:26 +0000 (UTC)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <f41972e8-0ae2-7c1d-a66a-499a841080e3@redhat.com>
	<13d95529-d61e-fc30-ffd4-f1ef93edad40@redhat.com>
	<CAKv+Gu-JWfDCApNcw_mpx+y2i+Hkn_Ow3NN_U84ybgOSD_0JOQ@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <0c121886-f40a-6682-267c-dfa3bfb195d0@redhat.com>
Date: Wed, 2 May 2018 15:54:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu-JWfDCApNcw_mpx+y2i+Hkn_Ow3NN_U84ybgOSD_0JOQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 02 May 2018 13:54:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 02 May 2018 13:54:34 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lersek@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] Expand ECAM region in machvirt 2_13?
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	qemu list <qemu-devel@nongnu.org>, Auger Eric <eric.auger@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H33LbbhkK2Ll

On 05/02/18 14:34, Ard Biesheuvel wrote:
> On 2 May 2018 at 13:31, Laszlo Ersek <lersek@redhat.com> wrote:
>> On 05/01/18 17:59, Auger Eric wrote:
>>> Hi,
>>>
>>> I would like to resume the discussion on extending the number of PCI
>>> buses to 256 (as in Q35) as a follow-up of past discussions:
>>> https://lists.gnu.org/archive/html/qemu-devel/2018-01/msg03631.html.
>>>
>>> With the current 16MB ECAM region we are limited to 16 PCIe busses.
>>>
>>> Could we envision to have a 256MB ECAM region and move it to another
>>> location beyond 256GB, in virt2_13 machine type?
>>>
>>> Current ECAM range within [0x3f000000, 0x40000000] would be kept
>>> unchanged for legacy and when vms->highmem is set to false.
>>> Migration from <2_13 to >=2_13 would be allowed whereas migration
>>> from >=2.13 to <2.13 wouldn't.
>>
>> If I understand correctly, the idea is to *move* the current one
>> range, if the virt machine type is >= 2.13 and highmem is set to true
>> (which is the default IIUC, from 2.12 onward).
>>
>> For 64-bit (AARCH64) ArmVirtQemu, that should work fine. The firmware
>> takes the ECAM base and size from the "pci-host-ecam-generic" DT
>> node, property "reg", uint64_t elements #0 and #1. (Sorry if this
>> isn't exact DT lingo, I'm paraphrasing the firmware source code.) If
>> the QEMU patch just changes the values, that should work
>> transparently.
>>
>> For 32-bit (ARM) ArmVirtQemu, this change (the new ECAM default)
>> could be a problem. PCI stuff in the firmware wouldn't work unless
>> people specified highmem=off on the QEMU command line.
>>
>> Now, I notice highmen defaults to "on" starting with 2.12 even for
>> "qemu-system-arm -M virt", not just "qemu-system-aarch64 -M virt", so
>> why doesn't that already cause a problem with PCI in the 32-bit guest
>> fw?
>>
>> Because, currently "highmen" only controls the presence of the 64-bit
>> PCI MMIO aperture for BAR allocation; it has no effect on config
>> space. And if the 64-bit PCI MMIO aperture is exposed to the 32-bit
>> guest firmware, the latter simply ignores the former, and works with
>> the 32-bit aperture solely (which is always there).
>>
>> So, for "qemu-system-arm -M virt" compatibility, I think we might
>> need a separate machine type property, which should default to "on"
>> only on qemu-system-aarch64 (if such distinctions are allowed).
>>
>> Of course, I can't tell if the 32-bit ArmVirtQemu firmware is
>> possible to run on "qemu-system-aarch64 -M virt". (I think it is; I
>> recall something something about ARMv8 having ARMv7 compat, but I
>> don't remember ever trying.) If that's the case, then even the above
>> suggestion won't work, because it would break 32-bit guest fw that
>> the user has run (for whatever reason) on "qemu-system-aarch64 -M
>> virt". In this case, I believe we can't just change the contents of
>> the current "pci-host-ecam-generic" node, but we should implement
>> some structural DTB addition that old firmware will simply not
>> notice, while new (64-bit) firmware will specifically look for (and
>> prefer over the old DT stuff).
>>
>> Ard, what's your take? (Sorry if you've already followed up, my email
>> processing lags.)
>>
>
> Do we have any examples of ACPI platforms where the config space is
> mapped above 4 GB? I'd like to make sure that all existing code copes
> with that before even considering it.

Well, we could consider this virtual machine feature a way to root out
any 64-bit bugs that lurk in code that consumes ECAM :) That would help
physical platforms. It means that we shouldn't enable the feature by
default, in 2.13 at least.

Anyway, I've just checked my oldie A3 Mustang for this (it uses UEFI and
ACPI), and surprisingly, it does put the ECAM range above 4GB:

[    0.000000] ACPI: MCFG 0x00000043FA690000 00003C (v01 APM    XGENE    00000002 INTL 20140724)
[    0.088654] ACPI: MCFG table detected, 1 entries
[    0.126613] acpi PNP0A08:00: MCFG quirk: ECAM at [mem 0xe0d0000000-0xe0dfffffff] for [bus 00-ff] with xgene_v1_pcie_ecam_ops
[    0.127552] acpi PNP0A08:00: [Firmware Bug]: ECAM area [mem 0xe0d0000000-0xe0dfffffff] not reserved in ACPI namespace
[    0.127601] acpi PNP0A08:00: ECAM at [mem 0xe0d0000000-0xe0dfffffff] for [bus 00-ff]

The base address is 899 GB + 256 MB.

My kernel is 4.11.0-44.6.1.el7a.aarch64.

Thanks
Laszlo
