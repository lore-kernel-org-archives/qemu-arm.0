Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1172913njf;
        Fri, 16 Aug 2024 04:37:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUuGgUsibqkT871xGanlqIcRXP6CJdw6ezBK0me/Y64VX4DASIhqv4cYmh0/GTi+S9jJerSwPjMrSvzpwL2Bm8CofFLBdtI
X-Google-Smtp-Source: AGHT+IHZ9sJbArIZkEtqAsaKXK99FjLdDODLcDBcfO/uNxXoGbiZRhtjNbxY2WT+NAQO1lFx7kYr
X-Received: by 2002:a05:6359:5089:b0:1b3:9506:7531 with SMTP id e5c5f4694b2df-1b39506f78bmr263938155d.5.1723808233744;
        Fri, 16 Aug 2024 04:37:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723808233; cv=none;
        d=google.com; s=arc-20160816;
        b=dCOp1ax+gd8DlBzqVPLS2LbSnfP6rtx+v6L4n6x0HsFEA7/+jCWyfLnITGawHoLxFr
         F/GeE2R1myYAhPSGnVI+X2Jf71dl1yX8EDTummL8JgR6IZeXt58pCCMUVOeO5JPHhEvG
         acUmB0MWr6snl6fibzxsCKIiB/VCbXXSA8Zo2ISqniZ32dvfOWoxpZK9RfoBb08+2Hzg
         rasPIrO6oduDHl35BMaSFHBdR2hTuZOsDNaUUo7KMO7PelSdAlFjD1auvo4dkAbd5FFY
         x8Et8e027rRuRA3TBJ5hMOvXCnAC2rq4FMZHY1oujR6V5q1LCpiFdBKmUMDiuwwgm/Ln
         hu6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=0P3g9Ey6qjkiCE263qL85AQR6FbWw54n1jXcxLmplEk=;
        fh=aE8tA6yFqwilUHubOI1mQwns3PMWKRxkj34LGeRvrJM=;
        b=Ta+TBSw7bOvXqXQDsjFFZcbkJvOfxJxKSp2s/Ic749dhvHj8SdGe5dLDQ3TWK7GdSw
         YL3VBHfHtEbsU66Zntn8gE7ghg8aPQbdMe2U7u83Pr3X4vQxGfFbVhx87K+lwwiYUgCv
         dTynF3beA3UVUZcBT2ACqyqtN+g21C2F97lngo3gC5f7P7DF++Z+n8Qv8DsWekM3UpBi
         +Ir3BM7T1kKrOM7W0HUHyYF7cclTmR97A3TR0xrHFqGfkG5LQ7phQ3vmABF9VDQe4pM/
         e0IDqVPaGFxwL0/HCAGZJ1X0637d3nNLvVnjqIZIlF+Ah8HXCBNPIks59aG26CG+MWy7
         c8QA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VbeaxVV1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a4ff1131c0si385515885a.644.2024.08.16.04.37.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2024 04:37:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VbeaxVV1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sevG8-0005Ak-8E; Fri, 16 Aug 2024 07:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1sevG6-00058s-Lq
 for qemu-arm@nongnu.org; Fri, 16 Aug 2024 07:36:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1sevG5-0007CW-3q
 for qemu-arm@nongnu.org; Fri, 16 Aug 2024 07:36:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723808199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0P3g9Ey6qjkiCE263qL85AQR6FbWw54n1jXcxLmplEk=;
 b=VbeaxVV1br2G3kOiNC2Jtb9A96BS8p+cDheh5PgUgGXGz6Ccc0zEQHAfBVHn5qaLAqbSwi
 B1w5vrWrwy2o2yod8ueVMSkd+XyAk/8t4M/HOfgFNpZADuZPF6L06fqdBb79BmMZw+9B7l
 7PB89GUDLzkIFTveH0odGPQc4CGeONo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-355-c0pyEvhqNYCWc_FfWSPVBQ-1; Fri,
 16 Aug 2024 07:36:35 -0400
X-MC-Unique: c0pyEvhqNYCWc_FfWSPVBQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A22591955D55; Fri, 16 Aug 2024 11:36:31 +0000 (UTC)
Received: from localhost (dhcp-192-244.str.redhat.com [10.33.192.244])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 900FF19560A3; Fri, 16 Aug 2024 11:36:28 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Yanan Wang
 <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Harsh
 Prateek Bora <harshpb@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, David
 Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH for-9.2] hw: add compat machines for 9.2
In-Reply-To: <Zr8uNB8gaJTroMBU@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy Ross"
References: <20240816103723.2325982-1-cohuck@redhat.com>
 <Zr8uNB8gaJTroMBU@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 16 Aug 2024 13:36:26 +0200
Message-ID: <87frr466o5.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.131,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Uwl8krRS0h1M

On Fri, Aug 16 2024, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Fri, Aug 16, 2024 at 12:37:23PM +0200, Cornelia Huck wrote:
>> Add 9.2 machine types for arm/i440fx/m68k/q35/s390x/spapr.
>>=20
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>  hw/arm/virt.c              |  9 ++++++++-
>>  hw/core/machine.c          |  3 +++
>>  hw/i386/pc.c               |  3 +++
>>  hw/i386/pc_piix.c          | 15 ++++++++++++---
>>  hw/i386/pc_q35.c           | 13 +++++++++++--
>>  hw/m68k/virt.c             |  9 ++++++++-
>>  hw/ppc/spapr.c             | 15 +++++++++++++--
>>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>>  include/hw/boards.h        |  3 +++
>>  include/hw/i386/pc.h       |  3 +++
>>  10 files changed, 77 insertions(+), 10 deletions(-)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
>
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index d9e69243b4a7..746bfe05d386 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -479,13 +479,24 @@ static void pc_i440fx_machine_options(MachineClass=
 *m)
>>                                       "Use a different south bridge than=
 PIIX3");
>>  }
>>=20=20
>> -static void pc_i440fx_machine_9_1_options(MachineClass *m)
>> +static void pc_i440fx_machine_9_2_options(MachineClass *m)
>>  {
>>      pc_i440fx_machine_options(m);
>>      m->alias =3D "pc";
>>      m->is_default =3D true;
>>  }
>>=20=20
>> +DEFINE_I440FX_MACHINE(9, 2);
>> +
>> +static void pc_i440fx_machine_9_1_options(MachineClass *m)
>> +{
>> +    pc_i440fx_machine_9_2_options(m);
>> +    m->alias =3D NULL;
>> +    m->is_default =3D false;
>> +    compat_props_add(m->compat_props, hw_compat_9_1, hw_compat_9_1_len);
>> +    compat_props_add(m->compat_props, pc_compat_9_1, pc_compat_9_1_len);
>> +}
>> +
>>  DEFINE_I440FX_MACHINE(9, 1);
>>=20=20
>>  static void pc_i440fx_machine_9_0_options(MachineClass *m)
>> @@ -493,8 +504,6 @@ static void pc_i440fx_machine_9_0_options(MachineCla=
ss *m)
>>      PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
>>=20=20
>>      pc_i440fx_machine_9_1_options(m);
>> -    m->alias =3D NULL;
>> -    m->is_default =3D false;
>>      m->smbios_memory_device_size =3D 16 * GiB;
>
> Feels like we should be adding an "_AS_LATEST" macro
> variant for piix/q35 too, so it matches the pattern
> in other targets for handling alias & is_default.
>
> Not a thing your patch needs todo though.

Yes, having to fiddle the is_default setting is a bit annoying. We still
have the q35 vs pc alias issue, though. (I'm wondering if it is finally
time to make q35 the default, and alias pc to it?)

