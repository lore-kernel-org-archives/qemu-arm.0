Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4336181ejb;
        Mon, 6 Feb 2023 08:16:35 -0800 (PST)
X-Google-Smtp-Source: AK7set977Z+zCCV9gpyn9bSC9mRGChkdI2T80NAX1j/RTa4w566DicziVxxiyb65INAvhyVVzWw3
X-Received: by 2002:ac8:59cc:0:b0:3b9:b1ea:2d0f with SMTP id f12-20020ac859cc000000b003b9b1ea2d0fmr37523242qtf.34.1675700194826;
        Mon, 06 Feb 2023 08:16:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675700194; cv=none;
        d=google.com; s=arc-20160816;
        b=GfyxS5EfEghKtJyMOdyon+0GeLsp6tU4KnpW+o0kKFwOroZL5bNonFnOCY/kAykQxH
         k9a16zcFNkl7RG421wcgFbMulbBwQHQkkb0vUQm3Sk6V7Vzg7wKDPy7hP6k3Edm3EeQt
         fztHG2fqpzPhumuF/xmEjcZij7aAC+Yml0ATuKhk9yC1YEAGVKXD3BhqhVruYbXFvyKd
         hUShZSrahmFecr1sM05e54l8PrcTqi5o/2tYISMe4/7JxAvTZgE/cF8ShR5eXbZDqJ8c
         gLGLakKj4W2NYzlHR1+HgnpLx8WLBK0AEnF3/1+++3AM0z9tAu0uE++Wpx9/ePXVNZ2M
         U8zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=Y1YxdtXAKHSW2xa0lWBV1M5rrSQV9boHSWRJ7x97GV8=;
        b=hSUNWeixd5lleF3ZBUnrXQHueErR13gET2K1GhIR2D6DrqF4BWyor/jEEGJpIuV/HT
         dR8rZfMp4jb8XEG1bRIoofmi2dyaXY9Xm3NpIEokf48YyjszTrAHbfV5mkyypUyzFqwH
         tEzoX7UzwmuKaaQq759UdUp0FZGyivR5gKvS8AxmrM9OaOE99cneh28yL4iBUJzC6G3E
         j1j3xY+X9ZqktNBEIVXO0fx1I0/DosOVpNZbcScu0NGHOXU/IjZr3b/J60wydEGCEAuT
         e42FfL0krMKxkeEHvM9J8xID23UoVbdaEitoUmW5ITWK9x1+VrLn0CBBDlFjpoB9Y2C2
         nI/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gQQ7jmie;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5-20020ac85945000000b003b9782742d7si7617569qtz.598.2023.02.06.08.16.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 08:16:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gQQ7jmie;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pP49v-0005YX-Or; Mon, 06 Feb 2023 11:15:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pP49t-0005Y5-Pu
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 11:15:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pP49r-0006QZ-TJ
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 11:15:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675700154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1YxdtXAKHSW2xa0lWBV1M5rrSQV9boHSWRJ7x97GV8=;
 b=gQQ7jmiekxEsNTUAOXoyZxnim8FNnDTTDEe3z4NHZwNvHgL8jpNXrMl/xRRruFWzsHjE6G
 o+NcG1AU2tZCI+6teJyNqsicDJwo4LLH8pUGI5E7OMEgDTgC6XNxnFHmqduK7aUjE17jWt
 odBggJV7VpL/rSDPSQOEsRZrXdV5uTw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-kSF7DlEePbyFJS4Mn4WExA-1; Mon, 06 Feb 2023 11:15:52 -0500
X-MC-Unique: kSF7DlEePbyFJS4Mn4WExA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 851C685A588;
 Mon,  6 Feb 2023 16:15:51 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 253B140398A0;
 Mon,  6 Feb 2023 16:15:51 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Auger <eauger@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v5 2/3] arm/kvm: add support for MTE
In-Reply-To: <071ec3a6-cb4b-0dac-87fd-f3c3d00b5e83@redhat.com>
Organization: Red Hat GmbH
References: <20230203134433.31513-1-cohuck@redhat.com>
 <20230203134433.31513-3-cohuck@redhat.com>
 <da118de5-adcd-ec0c-9870-454c3741a4ab@linaro.org>
 <071ec3a6-cb4b-0dac-87fd-f3c3d00b5e83@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 06 Feb 2023 17:15:49 +0100
Message-ID: <877cwun51m.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: YT8LWMqXPugG

On Mon, Feb 06 2023, Eric Auger <eauger@redhat.com> wrote:

> Hi,
>
> On 2/3/23 21:40, Richard Henderson wrote:
>> On 2/3/23 03:44, Cornelia Huck wrote:
>>> +static void aarch64_cpu_get_mte(Object *obj, Visitor *v, const char
>>> *name,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *opaque, Error **errp)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 ARMCPU *cpu =3D ARM_CPU(obj);
>>> +=C2=A0=C2=A0=C2=A0 OnOffAuto mte =3D cpu->prop_mte;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 visit_type_OnOffAuto(v, name, &mte, errp);
>>> +}
>>=20
>> You don't need to copy to a local variable here.
>>=20
>>> +
>>> +static void aarch64_cpu_set_mte(Object *obj, Visitor *v, const char
>>> *name,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *opaque, Error **errp)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 ARMCPU *cpu =3D ARM_CPU(obj);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 visit_type_OnOffAuto(v, name, &cpu->prop_mte, errp);
>>> +}
>>=20
>> ... which makes get and set functions identical.
>> No need for both.
> This looks like a common pattern though. virt_get_acpi/set_acpi in
> virt.c or pc_machine_get_vmport/set_vmport in i386/pc.c and many other
> places (microvm ...). Do those other callers also need some simplificatio=
ns?

Indeed, I'm pretty sure that I copied + adapted it from somewhere :)

Should we clean up all instances in one go instead? (Probably on top of
this series, in order to minimize conflicts with other changes.)

