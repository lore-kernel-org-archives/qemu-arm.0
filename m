Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3506751ejx;
        Tue, 15 Nov 2022 02:44:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7OX0m0QDOcSGrOJ6K3L0ofm46VSvni7pAaVWtZ6ra6pH9TBwDpMFnnaMwUJJzuqw242RDh
X-Received: by 2002:a37:a0b:0:b0:6fb:4a84:19d with SMTP id 11-20020a370a0b000000b006fb4a84019dmr14441302qkk.709.1668509094624;
        Tue, 15 Nov 2022 02:44:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668509094; cv=none;
        d=google.com; s=arc-20160816;
        b=CbDcG0Vx2MmN7vMXFtPv5pJg109EBB0Rgudy5mwhmVDuGVaVce9w/fIVYz2uCAQarx
         i/C7kU5O+l+5Y03yZ8QmP0hVSQzWMjaAJKsDpduT7yNDiua87Xp4vB4D8YQGHeuPNCQN
         jcRaqqINAwAj6XmWXYSVwLdnE91d7mE3vvN7o0X/KZakeRnbVIqbRprvltGa1pyUe/U2
         z23kHyKS1GQakusIXEqL8YlyGPdG0CeQY1l3dHtmMhQ9nxOasz09kX+uY6dQUEH9YylH
         Pg7+z0fyyV8Fntvog6vPoBmsVRcwF6ooTmE00lWs6/ZY7c/mWy1OiMUp9SwbMPa5ktid
         hykQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=EaJlL6NgzwHi1UAh/5SxgApyDe7Vq1kF6RqRXz4qAks=;
        b=b6Wv1J3nW+ccyNnq4u+Qo8gyFfy/LKBoke7dpWh5oT/z2RsLv6dHFVwVBYG8855oCb
         hQhb57lxExcx61LzzR9HLGtQEDN0XXBQvPXLrk+kgdZN04hB0CdGzufv0MK8fr+Fjo4E
         PBaragvKl1eUbrY7P5B5+b3e1z8dUQrkFsAWpMSpsgIzSiMhlPBgmkG4GNE8xLD32YIC
         BfFIHt7cH2rODtUU9u8o9Pv3C98fhKskQYLW7J6zx762Mn9GpABH7SWS5fA9PvtAxWE/
         FjVnVy4Dyh2GTJnDbwxJ4wuycVQBYevexlKkB02O8uqZKZ7oufgT97jh9bAVgi8Yf4To
         1mpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GIXPf2Yb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v2-20020a05622a144200b00399601d7853si8125646qtx.60.2022.11.15.02.44.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Nov 2022 02:44:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GIXPf2Yb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1outQc-00035G-Ph; Tue, 15 Nov 2022 05:44:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1outQZ-00031i-9c
 for qemu-arm@nongnu.org; Tue, 15 Nov 2022 05:44:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1outQW-0004g4-LJ
 for qemu-arm@nongnu.org; Tue, 15 Nov 2022 05:44:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668509056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EaJlL6NgzwHi1UAh/5SxgApyDe7Vq1kF6RqRXz4qAks=;
 b=GIXPf2Ybg21Vi69xyYR5sGYvXHWUjWxWVoIiLdeNdugLwXfvpY68PcSGVmmoRnnkXh5rgR
 t/tBD9TU9CHraPyW3QE6o7R4KUcuz3ypZRX4hvjo1/l5yON8Gqk/MKn4KYBTSd9vQy+vpK
 eh2RJK5XC53KktMeZzIHe1893S/Zpbk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-3YDBQuJTMkOOwgAnJ5ngdQ-1; Tue, 15 Nov 2022 05:44:11 -0500
X-MC-Unique: 3YDBQuJTMkOOwgAnJ5ngdQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B38A7811E7A;
 Tue, 15 Nov 2022 10:44:10 +0000 (UTC)
Received: from localhost (unknown [10.39.193.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF6A32166B2B;
 Tue, 15 Nov 2022 10:44:09 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Greg Kurz <groug@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Yanan Wang
 <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>, Daniel Henrique
 Barboza <danielhb413@gmail.com>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, David
 Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH for-8.0] hw: Add compat machines for 8.0
In-Reply-To: <20221115113941.123db1e8@bahia>
Organization: Red Hat GmbH
References: <20221111124534.129111-1-cohuck@redhat.com>
 <20221115113941.123db1e8@bahia>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 15 Nov 2022 11:44:06 +0100
Message-ID: <87leoccxah.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EgudBIIkM4tZ

On Tue, Nov 15 2022, Greg Kurz <groug@kaod.org> wrote:

> On Fri, 11 Nov 2022 13:45:34 +0100
> Cornelia Huck <cohuck@redhat.com> wrote:
>
>> Add 8.0 machine types for arm/i440fx/m68k/q35/s390x/spapr.
>> 
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>  hw/arm/virt.c              |  9 ++++++++-
>>  hw/core/machine.c          |  3 +++
>>  hw/i386/pc.c               |  3 +++
>>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>>  hw/m68k/virt.c             |  9 ++++++++-
>>  hw/ppc/spapr.c             | 15 +++++++++++++--
>>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>>  include/hw/boards.h        |  3 +++
>>  include/hw/i386/pc.h       |  3 +++
>>  10 files changed, 79 insertions(+), 7 deletions(-)
>> 
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index b87135085610..2a46660980e7 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -3096,10 +3096,17 @@ static void machvirt_machine_init(void)
>>  }
>>  type_init(machvirt_machine_init);
>>  
>> +static void virt_machine_8_0_options(MachineClass *mc)
>> +{
>> +}
>> +DEFINE_VIRT_MACHINE_AS_LATEST(8, 0)
>> +
>>  static void virt_machine_7_2_options(MachineClass *mc)
>>  {
>> +    virt_machine_8_0_options(mc);
>> +    compat_props_add(mc->compat_props, hw_compat_7_2, hw_compat_7_2_len);
>>  }
>> -DEFINE_VIRT_MACHINE_AS_LATEST(7, 2)
>> +DEFINE_VIRT_MACHINE(7, 2)
>>  
>>  static void virt_machine_7_1_options(MachineClass *mc)
>>  {
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 8d34caa31dc8..f264fb53b46c 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -40,6 +40,9 @@
>>  #include "hw/virtio/virtio-pci.h"
>>  #include "qom/object_interfaces.h"
>>  
>> +GlobalProperty hw_compat_7_2[] ={};
>
> Missing space between '=' and '{}'.

Oops. Maybe this can be fixed up by whoever ends up applying this, or
maybe this will be changed by another patch immediately anyway.

>
> Anyway, for ppc parts:
>
> Reviewed-by: Greg Kurz <groug@kaod.org>

Thanks :)

