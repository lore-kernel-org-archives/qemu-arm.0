Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp317005lfq;
        Wed, 9 Sep 2020 03:58:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/nLBInA1tqKkomY+T/zpQumznIl+zAiBuFCpVTj0QtaYkRPWmAfsxXUjIwUP+6/Sn+s10
X-Received: by 2002:a25:dfc4:: with SMTP id w187mr4701460ybg.506.1599649109548;
        Wed, 09 Sep 2020 03:58:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599649109; cv=none;
        d=google.com; s=arc-20160816;
        b=oPuwOw8IbbInGcONViyhduZMaH35AH+VtJNj3RD3QzKUYJHjcgZ96HuWGbKLEVAzPA
         AuorRwa4a8G1DEPj6O/dXwHYuU3BpXnQYmDBC83kP91SyQANIZSMX5fF4wkfoHDGPXOx
         fhjRul52KyucfdzikSL5BuNNtl71uwHnw1nnDT2Gph77RPQRXn5Otkx2G1kw+gkczEqI
         9ZA8WtDjBE0GTe/5RS2XWLCn/DYpg/hpXiwT60fp6kEKUzkhk3tqD/kGvybBxcOzFF0p
         0ipM583j0bIcRW8a+1LNnxUo647gECJAFgPLsJZ4H5/dNvVURKaeNWfk05TdKeSSfm3w
         14TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:date:message-id
         :from:references:to:subject:dkim-signature;
        bh=9Eg1QqiLFgyGWwSYeg8eXa3YZksOtDe2TIFRYiTs9tQ=;
        b=wFeP0dRp5+rM+WnSMYRzgXGL+owGOttZbn/j4xazq7lD8JfxUEoObe8G2h6WJ0fPaf
         kEDPzghTFFdDmoo8n4CxkEAZ9QwGB3ImPBDvT+KSCpLC8UrYnihQloQaw3SJL2dQVFXL
         eoYVj/5708gR9+qjn6JdvLcIaPk8xJPX3n5AkuSnhgJs/X4+zON0B5lLNgdUzrMamymL
         pA24jYJzI591FdDl2yQaqbEdfQh8Boqi1mM2krTS9HAnkjH2nS4m6gDZadHQXhsBlCPD
         mzyv1+tjGmF+SOlL74PpMvccuwlBi8mRQaGPRSbcIaMaq9WSTbHkGskz3375ma7mMZAD
         9ybA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U5wAbdW+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w128si2855090ybw.151.2020.09.09.03.58.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Sep 2020 03:58:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U5wAbdW+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFxo4-0002k5-TR
	for alex.bennee@linaro.org; Wed, 09 Sep 2020 06:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kFxny-0002js-D5
 for qemu-arm@nongnu.org; Wed, 09 Sep 2020 06:58:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29306
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kFxnw-0001XO-3U
 for qemu-arm@nongnu.org; Wed, 09 Sep 2020 06:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599649098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Eg1QqiLFgyGWwSYeg8eXa3YZksOtDe2TIFRYiTs9tQ=;
 b=U5wAbdW+lyCXpzQ/1H+M85t77dlE154NWXq33QmbwJ8MA8BbDunY9npi81GomZGaYT6Uh9
 2RxP+PZ/x2n1HPETFfJp6V887Tyva4I3bb5LMGna15yux92qpKvfDGuxeYW3mQ9UYsXhy3
 iamBstelDGPdHmzaN0SSWLmKd5e29gQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-PJSzgWLRN4u29i4PgS8XKw-1; Wed, 09 Sep 2020 06:58:15 -0400
X-MC-Unique: PJSzgWLRN4u29i4PgS8XKw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36FCC1006705;
 Wed,  9 Sep 2020 10:58:14 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-82.ams2.redhat.com
 [10.36.114.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB8DD838C2;
 Wed,  9 Sep 2020 10:58:08 +0000 (UTC)
Subject: Re: [PATCH 0/5] Add support for loading SMBIOS OEM strings from a file
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>
References: <20200908165438.1008942-1-berrange@redhat.com>
 <d3c345b6-c2db-ef61-2ac0-afc0f9f737c2@redhat.com>
 <20200909095035.GO1011023@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <adff2db5-1345-0c05-4c22-f9f8223c8614@redhat.com>
Date: Wed, 9 Sep 2020 12:58:07 +0200
MIME-Version: 1.0
In-Reply-To: <20200909095035.GO1011023@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=lersek@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 03:13:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TQjb0gx0taQD

On 09/09/20 11:50, Daniel P. Berrangé wrote:
> On Wed, Sep 09, 2020 at 11:44:40AM +0200, Laszlo Ersek wrote:
>> On 09/08/20 18:54, Daniel P. Berrangé wrote:
>>> I previously added support for SMBIOS OEM strings tables but only
>>> allowed for data to be passed inline. Potential users indicated they
>>> wanted to pass some quite large data blobs which is inconvenient todo
>>> inline. Thus I'm adding support for passing the data from a file.
>>>
>>> In testing this I discovered the hard way that on x86 we're limited to
>>> using the SMBIOS 2.1 entry point currently. This has a maximum size of
>>> 0xffff, and if you exceed this all sorts of wierd behaviour happens.
>>>
>>> QEMU forces SMBIOS 2.1 on x86 because the default SeaBIOS firmware
>>> does not support SMBIOS 3.0. The EDK2 firmware supports SMBIOS 3.0 and
>>> QEMU defaults to this on the ARM virt machine type.
>>>
>>> This series adds support for checking the SMBIOS 2.1 limits to protect
>>> users from impossible to diagnose problems.
>>>
>>> There is also a fix needed to SeaBIOS which fails to check for
>>> integer overflow when it appends the type 0 table.
>>>
>>>   https://mail.coreboot.org/hyperkitty/list/seabios@seabios.org/thread/3EMIOY6YS6MG5UQN3JJJS2A3DJZOVFR6/
>>>
>>> IIUC, SMBIOS 3.0 should onlky be limited by what you can fit into RAM,
>>> but in testing, EDK2 appears to hang shortly after the SMBIOS 3.0 data
>>> size exceeds 128 KB. I've not spotted an obvious flaw in EDK2 or QEMU,
>>> nor do I attempt to enforce a limit in QEMU for SMBIOS 3.0.
> 
> snip
> 
>> So we're exceeding "__brk_limit".
>>
>> ... I'm quite getting out of my league here, but "__brk_limit" seems to
>> be controlled by "brk_reservation" in "arch/x86/kernel/vmlinux.lds.S"...
>> and ultimately through the RESERVE_BRK() macro:
>>
>> [arch/x86/include/asm/setup.h]
>>
>>> /*
>>>  * Reserve space in the brk section.  The name must be unique within
>>>  * the file, and somewhat descriptive.  The size is in bytes.  Must be
>>>  * used at file scope.
>>>  *
>>>  * (This uses a temp function to wrap the asm so we can pass it the
>>>  * size parameter; otherwise we wouldn't be able to.  We can't use a
>>>  * "section" attribute on a normal variable because it always ends up
>>>  * being @progbits, which ends up allocating space in the vmlinux
>>>  * executable.)
>>>  */
>>> #define RESERVE_BRK(name,sz)                                            \
>>
>> OK, so let's see RESERVE_BRK() invocations... The relevant match is
>> likely the one below:
>>
>>> arch/x86/kernel/setup.c:RESERVE_BRK(dmi_alloc, 65536);
>>
>> ... Then see kernel commits:
>>
>> - 6de6cb442e76 ("x86: use brk allocation for DMI", 2009-03-14)
>>
>> - 796216a57fe4 ("x86: allow extend_brk users to reserve brk space",
>> 2009-03-14)
>>
>> - e808bae2407a ("x86: Do not reserve brk for DMI if it's not going to be
>> used", 2010-02-25)
>>
>> Commit 796216a57fe4 is helpful:
>>
>>>     Add RESERVE_BRK(name, size) macro to reserve space in the brk
>>>     area.  This should be a conservative (ie, larger) estimate of
>>>     how much space might possibly be required from the brk area.
>>>     Any unused space will be freed, so there's no real downside
>>>     on making the reservation too large (within limits).
>>
>> So it seems like the 64K limit could be increased, but still
>> - it requires guest kernels to be rebuilt,
>> - it doesn't seem suitable for passing MBs of data (on x86 anyway).
> 
> Yeah, this feels like we're just venturing into a bad part of town.
> Simplest is probably to just document that applications should never
> expect more than 64kb of total SMBIOS data to be viable regardless
> of the SMBIOS entry point.

Sounds OK to me personally.

In your experience, would that limit satisfy (for example) the CoreOS /
Ignition use case?

> Given this, I'm thinking it might be overkill to even both with
> supporting SMBIOS 3.0 for x86, unless it offers some other compelling
> benefit over SMBIOS 2.1 that you know of ?

I think the 32-bit entry point is sufficient for x86.

If memory serves, we only started to care about the 64-bit entry point
for aarch64. See for example

https://github.com/tianocore/edk2/commit/ca6d61b22658

x86 always has RAM under 4GB though.

Thanks
Laszlo

Thanks
Laszlo

