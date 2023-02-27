Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4721939ejc;
        Mon, 27 Feb 2023 07:12:45 -0800 (PST)
X-Google-Smtp-Source: AK7set+eBcbilmqYNrwDMqwJglyem9yEvqeOIh33goRCQGq8WxjvDt6VLEuEd7KrFHsM65Jn2BKO
X-Received: by 2002:a67:cc16:0:b0:414:991:c58a with SMTP id q22-20020a67cc16000000b004140991c58amr17683678vsl.9.1677510765031;
        Mon, 27 Feb 2023 07:12:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677510765; cv=none;
        d=google.com; s=arc-20160816;
        b=zcOv6OxqoozIJHjjlrFiFAvYvUnwxau4lps7WDcaT4qjcDCL7FrvHKVtW56V3AsZQM
         7Oh7FQIl/VJFPhBLA6VZkrpuTGwglEyMG46nR3xK4Ty651G0R/P5WmytMiuXTaRM17Ax
         1uqDr/st0GtWogGSit5GmwrWbTmLjSLc+IrCahe9T8kqnYs6OVi47hni7TUc6JZ4VXOp
         IQt0o++k1HsSWFwGqHdnsWs0c7472AXCtujlXQuwhWQHPDvWPMCAugj2t/C+s11dLfcm
         f1hhhRMZbPB9e6dhy6VbVMxRKPuztmIu5S3JJ5oBm5Dp57SrY9AR923V2FJih0W/C0Nf
         K1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=1N24a9jHrr8aJ2RFQYYJuZ0zIDzBlJZkBj9a2PQXJok=;
        b=MdYLZA0BBp4yPpmWqa8TCrRMdWlE+ldaBbnNt2aN0u8IkwDYfO6q3bpDF2QlUk0rt9
         fRyNODKy4zIn61G67XbQ3sWtn1j+vS3ZkJlExS0MfQl5EUfRjxS+yVaELAF92qDlj7T4
         gYd3Q9Dwpf1Qlm+mio2PhwSS3IWJv4YzFpv5a4skTJvtzo8tFO8O9f4Qa4LojkL6Bs6F
         JredXYBn9PLJjw3q5nu5Q7VTlEGpmVLrXkeb84bJijdoZ+4BMchABMxPcWboh1mVkQhU
         C+SrKOuHsimcihMJZxvVFLMdnj0C5mkcSK0FfJKUCfR3VJQekF6j92MUHT0A3j2Hb28m
         tKvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aMSGyuUY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6-20020a67cd86000000b004120da87e1fsi2629658vsl.134.2023.02.27.07.12.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 07:12:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aMSGyuUY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWfB9-0002gU-M5; Mon, 27 Feb 2023 10:12:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pWfB1-0002cK-4C
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 10:12:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pWfAz-00062n-H9
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 10:12:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677510749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1N24a9jHrr8aJ2RFQYYJuZ0zIDzBlJZkBj9a2PQXJok=;
 b=aMSGyuUYbpgMHCVbzOC3VRuqqsPJQwaC14o/+HKkPJytGkPJ7YZwm0egRgz9fCRKxLwdxd
 WjscNs/eG+IXxmwgUC0o2GAA9vGx17l/uOU+T0yi+U8BHMFp+Sc/Ibs3wwjLnKAgkGGH/x
 4peZQPzgXt8ANPCftQ8bj2DMAW5i/OA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-qaFv04jzNlem9IXZUjZ_uQ-1; Mon, 27 Feb 2023 10:12:24 -0500
X-MC-Unique: qaFv04jzNlem9IXZUjZ_uQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3123188646A;
 Mon, 27 Feb 2023 15:12:24 +0000 (UTC)
Received: from localhost (unknown [10.45.226.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE3DA40C6EC4;
 Mon, 27 Feb 2023 15:12:23 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Auger <eauger@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v5 2/3] arm/kvm: add support for MTE
In-Reply-To: <877cwun51m.fsf@redhat.com>
Organization: Red Hat GmbH
References: <20230203134433.31513-1-cohuck@redhat.com>
 <20230203134433.31513-3-cohuck@redhat.com>
 <da118de5-adcd-ec0c-9870-454c3741a4ab@linaro.org>
 <071ec3a6-cb4b-0dac-87fd-f3c3d00b5e83@redhat.com>
 <877cwun51m.fsf@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 27 Feb 2023 16:12:22 +0100
Message-ID: <871qmb5ei1.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: RgUcw2/pz5NV

On Mon, Feb 06 2023, Cornelia Huck <cohuck@redhat.com> wrote:

> On Mon, Feb 06 2023, Eric Auger <eauger@redhat.com> wrote:
>
>> Hi,
>>
>> On 2/3/23 21:40, Richard Henderson wrote:
>>> On 2/3/23 03:44, Cornelia Huck wrote:
>>>> +static void aarch64_cpu_get_mte(Object *obj, Visitor *v, const char
>>>> *name,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *opaque, Error **errp)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 ARMCPU *cpu =3D ARM_CPU(obj);
>>>> +=C2=A0=C2=A0=C2=A0 OnOffAuto mte =3D cpu->prop_mte;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 visit_type_OnOffAuto(v, name, &mte, errp);
>>>> +}
>>>=20
>>> You don't need to copy to a local variable here.
>>>=20
>>>> +
>>>> +static void aarch64_cpu_set_mte(Object *obj, Visitor *v, const char
>>>> *name,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *opaque, Error **errp)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 ARMCPU *cpu =3D ARM_CPU(obj);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 visit_type_OnOffAuto(v, name, &cpu->prop_mte, errp=
);
>>>> +}
>>>=20
>>> ... which makes get and set functions identical.
>>> No need for both.
>> This looks like a common pattern though. virt_get_acpi/set_acpi in
>> virt.c or pc_machine_get_vmport/set_vmport in i386/pc.c and many other
>> places (microvm ...). Do those other callers also need some simplificati=
ons?
>
> Indeed, I'm pretty sure that I copied + adapted it from somewhere :)
>
> Should we clean up all instances in one go instead? (Probably on top of
> this series, in order to minimize conflicts with other changes.)

Any objections to going with the code above and just doing a general
cleanup on top?

