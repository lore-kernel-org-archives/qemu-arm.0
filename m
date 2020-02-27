Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4295785lfg;
        Thu, 27 Feb 2020 03:07:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqzOASW2DagzEP075LAhHjRSH1NlUHblHUubfa9w4N9a6FyG9m+mHZdctjuKIgZquW8EmWKN
X-Received: by 2002:ac8:4505:: with SMTP id q5mr4309791qtn.84.1582801631216;
        Thu, 27 Feb 2020 03:07:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582801631; cv=none;
        d=google.com; s=arc-20160816;
        b=q5XBK5shHyMtRs5rmNp7G4N3wEojGwf6nayh693gfK5nahZK7uhQ4WL2wdWhw/HV8V
         o0FX+bbrTJpM6Z0LWFnK6/yCKMTnBkUkpWqAqtS0mvg0t3SnDgFyeFhKZnejDs95uI/b
         rpZ/jULNNh4XOc5OOIO6XSErirLt/In3b67+EeTNoAlhLOpuXfcgG7Z1zBWxBxT8DLte
         8oc9XxOPrSeIHn2zwdAuJsQG8Fa7HLFzfPBU1jTagfu0jNvoquZqZkqUdPAzmTvilHnb
         RKua266Le8o32Q2whvpv4Phse+zHszgPIoz6b57yuw1le5yHgEYVAD3/0+b3Wcg7owCz
         U5Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=f1RDikHjMuEMm5c5nGEz67lZrv93tK+Qel+QeJZrsug=;
        b=PDMUVnSFV0IrO+vw8GO5CEWwIcVlTeHdnF2oo1XrTO0qVrDMWIRvih6IFKrD7d7OIY
         n35bQydm0oumwnkz9NlocLfxo2nQKzDRtXvmVrmYTP0z/SYLkhO+heANihkiSeFlrDcj
         by8l/nQjHJ+hdwrxdnbTKGS+RUJTJY6ppLp4OXavL4V35rHwgKP4czsvknv+3kWn2V9c
         OnE8fxQIYnit2MpUONNVO+Sn6kXX6y79GXfTzgEkoZE6FiKLFpfEP5BJXzgV5TEW6NqF
         f9B+kRKFpRo69OVEzHKPJL3tJHpw1odJxtZvzbH1siOJb25cngVVKgUB4wXrBmoXxo5z
         4IoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AxfrjXU9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 72si1256120qkm.276.2020.02.27.03.07.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 03:07:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AxfrjXU9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7H0Y-0001v2-Mk
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 06:07:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59182)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1j7H0Q-0001uj-6m
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 06:07:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1j7H0O-0000Lj-Jp
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 06:07:02 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:54801
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1j7H0O-0000KK-GH
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 06:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582801620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f1RDikHjMuEMm5c5nGEz67lZrv93tK+Qel+QeJZrsug=;
 b=AxfrjXU92zzrpC9/w4jrigDMjhf4iQyT7Yo8YN0TEXP2t7m1gwsvp9DNUUedYNdo77dzxY
 3HN1uKvGu4J3V02T/4LKwRRxdbcCc02E0k3SrvaNHCOWqGG+dg4wwphLeCCEzV/Wbph8Rf
 a3aI8uai2eqNImAk3Z/yj9WA5oZTyRo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-g-kMWyd0MyOmAQoYKspYWQ-1; Thu, 27 Feb 2020 06:06:58 -0500
X-MC-Unique: g-kMWyd0MyOmAQoYKspYWQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED58013E5;
 Thu, 27 Feb 2020 11:06:56 +0000 (UTC)
Received: from gondolin (ovpn-117-2.ams2.redhat.com [10.36.117.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CDE260BE2;
 Thu, 27 Feb 2020 11:06:52 +0000 (UTC)
Date: Thu, 27 Feb 2020 12:06:49 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Pan Nengyuan <pannengyuan@huawei.com>
Subject: Re: [PATCH v3 1/6] s390x: fix memleaks in cpu_finalize
Message-ID: <20200227120649.50e6ea68.cohuck@redhat.com>
In-Reply-To: <20200227025055.14341-2-pannengyuan@huawei.com>
References: <20200227025055.14341-1-pannengyuan@huawei.com>
 <20200227025055.14341-2-pannengyuan@huawei.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com, David
 Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, euler.robot@huawei.com,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YmvPFkPcc8yn

On Thu, 27 Feb 2020 10:50:50 +0800
Pan Nengyuan <pannengyuan@huawei.com> wrote:

> This patch fix memleaks when we call tests/qtest/cpu-plug-test on s390x. =
The leak stack is as follow:
>=20
> Direct leak of 48 byte(s) in 1 object(s) allocated from:
>     #0 0x7fb43c7cd970 in __interceptor_calloc (/lib64/libasan.so.5+0xef97=
0)
>     #1 0x7fb43be2149d in g_malloc0 (/lib64/libglib-2.0.so.0+0x5249d)
>     #2 0x558ba96da716 in timer_new_full /mnt/sdb/qemu-new/qemu/include/qe=
mu/timer.h:530
>     #3 0x558ba96da716 in timer_new /mnt/sdb/qemu-new/qemu/include/qemu/ti=
mer.h:551
>     #4 0x558ba96da716 in timer_new_ns /mnt/sdb/qemu-new/qemu/include/qemu=
/timer.h:569
>     #5 0x558ba96da716 in s390_cpu_initfn /mnt/sdb/qemu-new/qemu/target/s3=
90x/cpu.c:285
>     #6 0x558ba9c969ab in object_init_with_type /mnt/sdb/qemu-new/qemu/qom=
/object.c:372
>     #7 0x558ba9c9eb5f in object_initialize_with_type /mnt/sdb/qemu-new/qe=
mu/qom/object.c:516
>     #8 0x558ba9c9f053 in object_new_with_type /mnt/sdb/qemu-new/qemu/qom/=
object.c:684
>     #9 0x558ba967ede6 in s390x_new_cpu /mnt/sdb/qemu-new/qemu/hw/s390x/s3=
90-virtio-ccw.c:64
>     #10 0x558ba99764b3 in hmp_cpu_add /mnt/sdb/qemu-new/qemu/hw/core/mach=
ine-hmp-cmds.c:57
>     #11 0x558ba9b1c27f in handle_hmp_command /mnt/sdb/qemu-new/qemu/monit=
or/hmp.c:1082
>     #12 0x558ba96c1b02 in qmp_human_monitor_command /mnt/sdb/qemu-new/qem=
u/monitor/misc.c:142
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> ---
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: qemu-s390x@nongnu.org
> ---
> v2->v1:
> - Similarly to other cleanups, move timer_new into realize(Suggested by P=
hilippe Mathieu-Daud=C3=83=C2=A9)
> v3->v2:
> - Also do the timer_free in unrealize, it seems more balance.
> ---
>  target/s390x/cpu.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>=20
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index cf84d307c6..cc63c9db22 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -170,7 +170,12 @@ static void s390_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>      S390CPUClass *scc =3D S390_CPU_GET_CLASS(dev);
>  #if !defined(CONFIG_USER_ONLY)
>      S390CPU *cpu =3D S390_CPU(dev);
> +    cpu->env.tod_timer =3D
> +        timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_tod_timer, cpu);
> +    cpu->env.cpu_timer =3D
> +        timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_cpu_timer, cpu);
>  #endif

It does not seem you addressed the comments I had last time, namely
- memory leak on error (we do not go through unrealize if the device
  was never completely realized)
- coding style (initialization in middle of declaration section)

> +
>      Error *err =3D NULL;
> =20
>      /* the model has to be realized before qemu_init_vcpu() due to kvm *=
/

