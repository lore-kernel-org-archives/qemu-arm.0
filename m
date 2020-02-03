Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3930456lfp;
        Mon, 3 Feb 2020 05:09:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqwPV61PiGLh6AgJznO2J3cVNo00gugeJVTQVfgT5+K8aynb8K5PLSomHziF2JImgcivyZWw
X-Received: by 2002:a0c:e2d1:: with SMTP id t17mr22989015qvl.25.1580735353544;
        Mon, 03 Feb 2020 05:09:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580735353; cv=none;
        d=google.com; s=arc-20160816;
        b=Bl+QsT1pHmprHQGj4SYRUPCtpEI7fswVnYhc+234sOxjtnumy6Z+yVsGdbBoHibsxn
         iDnOG3fUtesGr9RnLVJLTfUwOm5GdS9uBF4N+1YIHPcH2W2L81HuQB5fxdrW5As917t3
         ZU0H76Nv/sS9vbaBl1Pser5sk6Il8JYOC9x+lbARtPUlaZTvmOSnk/3sFZu7dWuqcjfE
         a7wO92Efl866RyIlktunLyzFatNYZxJ4UNenb83hOZ7Fxd3Fov+DTN64aCG6tsH9CPZ2
         mxQZTYAjZoNXTsivQeOgu0aWwCMVq2M5yRJw+IGeiDEppsyipVqjSLnlXyf1sW9rbMJU
         atJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=Ih3oxg6318zJ96yrlUtKPpx2K+QjGOYF/ly7qqO27KU=;
        b=Kl9caXDhZLO3aW6GJu7Mxc/zu1J9Ar21WJSSYZ3+wm4ud0gorFFW10MAh3qpa2KFaX
         rE2CxOxE5QCaT+rQhDKV33YQ7HXy5MlK8tOKfXpl9Dy7dtEqQXbqKwi7DxYiyMtzpoom
         cEOQmMh7QfK1D2QNIVnC48ZBoatOwhTCRiuxWAifVMeYWSJdfh69fU/SEgTEKXWXtJpo
         f4Z92SfXHjE1bjGJz6klniwCBGBW9Nb2Y9QprHFYPF2j3rT+oFm6DsHNdU49mHNh8K/G
         F1F8nPZmpF9S617T6ninIRJ9jtIg9+nrhbD3kmuP4sBLLX7ror6kckQdQxxhqJiFsB6t
         GHFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NR8ixUaQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e5si12156825qvy.97.2020.02.03.05.09.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 05:09:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NR8ixUaQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iybTV-0007GC-09
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 08:09:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41244)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iybTE-00078B-Kp
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 08:09:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iybTD-0004NO-Hu
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 08:08:56 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:52733
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1iybTD-0004MZ-EN
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 08:08:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580735335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ih3oxg6318zJ96yrlUtKPpx2K+QjGOYF/ly7qqO27KU=;
 b=NR8ixUaQpwvuSOoB3UtaxYGbjPn/bGgcGX3sP0Wwt36fO0XJu66M5POJlVOGST6tfmWu1e
 Ah3ns0Um6CasqQwgU4fSHOpdsvhufaLcSs4kj3u4vHnbfXGrBA4CZ+RehthU7bRrbGDv+w
 5+73pYe2JNzAiPU6qsBBrLclI3QLafU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-UtMkyqPkO-C1GQLX2omQVA-1; Mon, 03 Feb 2020 08:08:51 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55548800D41;
 Mon,  3 Feb 2020 13:08:50 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2ECB75DA82;
 Mon,  3 Feb 2020 13:08:49 +0000 (UTC)
Date: Mon, 3 Feb 2020 14:08:46 +0100
From: Andrew Jones <drjones@redhat.com>
To: Liang Yan <lyan@suse.com>
Subject: Re: [PATCH v3] target/arm/monitor: query-cpu-model-expansion crashed
 qemu when using machine type none
Message-ID: <20200203130846.gihtrf72inyf33wh@kamzik.brq.redhat.com>
References: <20200201034649.26815-1-lyan@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200201034649.26815-1-lyan@suse.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: UtMkyqPkO-C1GQLX2omQVA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PRKaENzhewec

On Fri, Jan 31, 2020 at 10:46:49PM -0500, Liang Yan wrote:
> Commit e19afd56 mentioned that target-arm only supports queryable

Please use more hexdigits. I'm not sure QEMU has a policy for that,
but I'd go with 12.

> cpu models 'max', 'host', and the current type when KVM is in use.
> The logic works well until using machine type none.
>=20
> For machine type none, cpu_type will be null if cpu option is not
> set by command line, strlen(cpu_type) will terminate process.
> So We add a check above it.
>=20
> This won't affect i386 and s390x since they do not use current_cpu.
>=20
> Signed-off-by: Liang Yan <lyan@suse.com>
> ---
>  v3: change git commit message
>  v2: fix code style issue
> ---
>  target/arm/monitor.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> index 9725dfff16..3350cd65d0 100644
> --- a/target/arm/monitor.c
> +++ b/target/arm/monitor.c
> @@ -137,17 +137,19 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansio=
n(CpuModelExpansionType type,
>      }
> =20
>      if (kvm_enabled()) {
> -        const char *cpu_type =3D current_machine->cpu_type;
> -        int len =3D strlen(cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
>          bool supported =3D false;
> =20
>          if (!strcmp(model->name, "host") || !strcmp(model->name, "max"))=
 {
>              /* These are kvmarm's recommended cpu types */
>              supported =3D true;
> -        } else if (strlen(model->name) =3D=3D len &&
> -                   !strncmp(model->name, cpu_type, len)) {
> -            /* KVM is enabled and we're using this type, so it works. */
> -            supported =3D true;
> +        } else if (current_machine->cpu_type) {
> +            const char *cpu_type =3D current_machine->cpu_type;
> +            int len =3D strlen(cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);

Need a blank line here.

> +            if (strlen(model->name) =3D=3D len &&
> +                    !strncmp(model->name, cpu_type, len)) {

Four spaces of indent too many on the line above.

> +                /* KVM is enabled and we're using this type, so it works=
. */
> +                supported =3D true;
> +            }
>          }
>          if (!supported) {
>              error_setg(errp, "We cannot guarantee the CPU type '%s' work=
s "
> --=20
> 2.25.0
>=20
>

With the three changes above


Reviewed-by: Andrew Jones <drjones@redhat.com>
Tested-by: Andrew Jones <drjones@redhat.com>


It'd be nice to extend tests/qtest/arm-cpu-features.c to also do
some checks with machine=3D'none' with and without KVM.

Thanks,
drew

