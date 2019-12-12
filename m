Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp551835lff;
        Thu, 12 Dec 2019 04:18:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqy7sS762i7qxcduyhJOiFoO/Q9+SD+a1nhoXZ9453TcfkfoS/tTfc7NS0cSqvaKR3jqDIKc
X-Received: by 2002:a9d:7510:: with SMTP id r16mr7792179otk.303.1576153096133;
        Thu, 12 Dec 2019 04:18:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576153096; cv=none;
        d=google.com; s=arc-20160816;
        b=ZEwvSEKCg10SorY5NEGHO9y/7gXW55n067JYMHuT6rukd+2cjJztJRXBnLKhOSQYfq
         MrmX0pcCZ9WtzlQKzncgRJBpr+7gsLmW7LA7ZFI06QVG9A1kXi7bSQWL79TY31E+3XJh
         4NYW541/LQwPhbw7gD652QuPW5gtKvppELWOFPwpwAQ9hPUBFZnq/VdKuCmkuAnsBr0u
         hR/qYJDSd1BEF0JdvFEmMxnScYXu5PRyUnFaSJaiYFTmArlLW7BdY29tttdYAnHiq8e3
         tmAUxFHdzRTOoAotsbZ3/XMNNDlAJNA8yT0ZEUOySe+EVJfhFo3GZX+l3ora1GgJ8LxO
         DA2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=SPps5pjUQ1DqbB9eL0sR2YL+0LU4DhfwVxAWCNLMeVg=;
        b=W3/gXAZ959qdoBXUCx8QZPeonucBGgHOwCDDq87PrN0YIXUM/6a0SuE1Bj5o8FWmwn
         +FmgAwQTop6+gVDek8J5FLGC2CsJi0pclI1t5/zfBW1gqbt7spuLdhPa2VxtNKhjKirw
         uNsV7vFt+GA/XDIjO02n/wyZs2y2VjGy6nPNa/erBYhkFKzOD5FZOLBmwOwaMH/WXjoV
         WpLa1xM6L8SrdBdRh2RAoseh6sJQPWUqnBJSk270+XhWb/LcFOubM5VssL/i4DN9rtpH
         KhZmmkXqWmlI3ORl8MACh1MAPXnz7XPAGyMH/cM/fHOuJwq0hf3frthv7ZyDPoHxVyMn
         fu+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="C7/HqZqo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12si2723348otp.310.2019.12.12.04.18.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Dec 2019 04:18:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="C7/HqZqo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58473 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ifNQ6-0002fK-N8
	for alex.bennee@linaro.org; Thu, 12 Dec 2019 07:18:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47660)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ifNPn-0002bk-LQ
 for qemu-arm@nongnu.org; Thu, 12 Dec 2019 07:17:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ifNPl-0006SX-Su
 for qemu-arm@nongnu.org; Thu, 12 Dec 2019 07:17:55 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37976
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ifNPl-0006Q6-OI
 for qemu-arm@nongnu.org; Thu, 12 Dec 2019 07:17:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576153072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SPps5pjUQ1DqbB9eL0sR2YL+0LU4DhfwVxAWCNLMeVg=;
 b=C7/HqZqofy51eTd4+P+CXFs1dW2kzy52P6Sy/dRTfOEhXJ5TjL/sGlZDYG2ac+L1G4jnSX
 /gQYPb8WD8epY+pE2CVmXu5f2kvTYi+ynV/9jHQRHYzQqYGV4qBr4SasZxpwKZD004qFcU
 s1yQeTbsvYS3TL1a+TdAXMQ7M8ytA7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-UphCh6iQPu6JGUu1v8VQgQ-1; Thu, 12 Dec 2019 07:17:51 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EDA4477;
 Thu, 12 Dec 2019 12:17:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-181.ams2.redhat.com
 [10.36.116.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73BF15D9C9;
 Thu, 12 Dec 2019 12:17:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 08E3111386A7; Thu, 12 Dec 2019 13:17:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 12/20] qapi: Introduce DEFINE_PROP_INTERVAL
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-13-eric.auger@redhat.com>
Date: Thu, 12 Dec 2019 13:17:40 +0100
In-Reply-To: <20191122182943.4656-13-eric.auger@redhat.com> (Eric Auger's
 message of "Fri, 22 Nov 2019 19:29:35 +0100")
Message-ID: <87wob17n6j.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: UphCh6iQPu6JGUu1v8VQgQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 quintela@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 armbru@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DMbdTeiViiek

Eric Auger <eric.auger@redhat.com> writes:

> Introduce a new property defining a labelled interval:
> <low address>,<high address>,label.
>
> This will be used to encode reserved IOVA regions. The label
> is left undefined to ease reuse accross use cases.

What does the last sentence mean?

> For instance, in virtio-iommu use case, reserved IOVA regions
> will be passed by the machine code to the virtio-iommu-pci
> device (an array of those). The label will match the
> virtio_iommu_probe_resv_mem subtype value:
> - VIRTIO_IOMMU_RESV_MEM_T_RESERVED (0)
> - VIRTIO_IOMMU_RESV_MEM_T_MSI (1)
>
> This is used to inform the virtio-iommu-pci device it should
> bypass the MSI region: 0xfee00000, 0xfeefffff, 1.

So the "label" part of "<low address>,<high address>,label" is a number?

Is a number appropriate for your use case, or would an enum be better?

>
> Signed-off-by: Eric Auger <eric.auger@redhat.com> ---
>hw/core/qdev-properties.c | 90 ++++++++++++++++++++++++++++++++++++
>include/exec/memory.h | 6 +++ include/hw/qdev-properties.h | 3 ++
>include/qemu/typedefs.h | 1 + 4 files changed, 100 insertions(+)

Subject has 'qapi:', but it's actually about qdev.  Please adjust the subje=
ct.

> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index ac28890e5a..8d70f34e37 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -13,6 +13,7 @@
>  #include "qapi/visitor.h"
>  #include "chardev/char.h"
>  #include "qemu/uuid.h"
> +#include "qemu/cutils.h"
> =20
>  void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
>                                    Error **errp)
> @@ -585,6 +586,95 @@ const PropertyInfo qdev_prop_macaddr =3D {
>      .set   =3D set_mac,
>  };
> =20
> +/* --- Labelled Interval --- */
> +
> +/*
> + * accepted syntax versions:

"versions"?

> + *   <low address>,<high address>,<type>
> + *   where low/high addresses are uint64_t in hexa (feat. 0x prefix)

"hexa" is not a word.

I'm afraid I don't get the parenthesis.

> + *   and type is an unsigned integer
> + */
> +static void get_interval(Object *obj, Visitor *v, const char *name,
> +                         void *opaque, Error **errp)
> +{
> +    DeviceState *dev =3D DEVICE(obj);
> +    Property *prop =3D opaque;
> +    Interval *interval =3D qdev_get_prop_ptr(dev, prop);
> +    char buffer[64];
> +    char *p =3D buffer;
> +
> +    Snprintf(buffer, sizeof(buffer), "0x%"PRIx64",0x%"PRIx64",%d",
> +             interval->low, interval->high, interval->type);

interval->type is unsigned.  Use %u, not %d.

> +
> +    visit_type_str(v, name, &p, errp);
> +}
> +
> +static void set_interval(Object *obj, Visitor *v, const char *name,
> +                         void *opaque, Error **errp)
> +{
> +    DeviceState *dev =3D DEVICE(obj);
> +    Property *prop =3D opaque;
> +    Interval *interval =3D qdev_get_prop_ptr(dev, prop);
> +    Error *local_err =3D NULL;
> +    unsigned int type;
> +    gchar **fields;
> +    uint64_t addr;
> +    char *str;
> +    int ret;
> +
> +    if (dev->realized) {
> +        qdev_prop_set_after_realize(dev, name, errp);
> +        return;
> +    }
> +
> +    visit_type_str(v, name, &str, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
> +    fields =3D g_strsplit(str, ",", 3);
> +
> +    ret =3D qemu_strtou64(fields[0], NULL, 16, &addr);

Aha, the 0x prefix is actually optional.

> +    if (!ret) {
> +        interval->low =3D addr;
> +    } else {
> +        error_setg(errp, "Failed to decode interval low addr");
> +        error_append_hint(errp,
> +                          "should be an address in hexa with 0x prefix\n=
");

"hexa" is not a word, and the 0x prefix is actually optional.

> +        goto out;
> +    }

I prefer

       if (error) {
           handle error
           bail out
       }
       handle success

over

       if (success) {
           handle success
       if (error) {
           handle error
           bail out
       }

In this case:

       if (ret) {
           error_setg(errp, "Failed to decode interval low addr");
           error_append_hint(errp,
                             "should be an address in hexa with 0x prefix\n=
");
           goto out;
       }
       interval->low =3D addr;


> +
> +    ret =3D qemu_strtou64(fields[1], NULL, 16, &addr);

Crash if @str doesn't contain ',', because the g_strsplit(str, ",", 3)
yields { [0] =3D str, NULL }.

> +    if (!ret) {
> +        interval->high =3D addr;
> +    } else {
> +        error_setg(errp, "Failed to decode interval high addr");
> +        error_append_hint(errp,
> +                          "should be an address in hexa with 0x prefix\n=
");
> +        goto out;
> +    }
> +
> +    ret =3D qemu_strtoui(fields[2], NULL, 10, &type);

Likewise, crash if @str contains only one ','.

I wouldn't use g_strsplit() here.  After

    ret =3D qemu_strtoui(str, &endptr, 16, &interval->low);

@endptr points behind the address.  So:

    if (ret || *endptr !=3D ',') {
        handle error ...
        goto out
    }

    ret =3D qemu_strtoui(endptr + 1, &endptr, 16, &interval->high);

and so forth.

Note that the if (ret || *endptr !=3D ',') checks for two distinct errors.
Distinct error messages might be more helpful.

> +    if (!ret) {
> +        interval->type =3D type;
> +    } else {
> +        error_setg(errp, "Failed to decode interval type");
> +        error_append_hint(errp, "should be an unsigned int in decimal\n"=
);
> +    }
> +out:
> +    g_free(str);
> +    g_strfreev(fields);
> +    return;
> +}
> +
> +const PropertyInfo qdev_prop_interval =3D {
> +    .name  =3D "labelled_interval",
> +    .description =3D "Labelled interval, example: 0xFEE00000,0xFEEFFFFF,=
0",
> +    .get   =3D get_interval,
> +    .set   =3D set_interval,
> +};
> +
>  /* --- on/off/auto --- */
> =20
>  const PropertyInfo qdev_prop_on_off_auto =3D {
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index e499dc215b..e238d1c352 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -57,6 +57,12 @@ struct MemoryRegionMmio {
>      CPUWriteMemoryFunc *write[3];
>  };
> =20
> +struct Interval {
> +    hwaddr low;
> +    hwaddr high;
> +    unsigned int type;
> +};

This isn't an interval.  An interval consists of two values, not three.

The third one is called "type" here, and "label" elsewhere.  Pick one
and stick to it.

Then pick a name for the triple.  Elsewhere, you call it "labelled
interval".

> +
>  typedef struct IOMMUTLBEntry IOMMUTLBEntry;
> =20
>  /* See address_space_translate: bit 0 is read, bit 1 is write.  */
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index c6a8cb5516..2ba7c8711b 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -20,6 +20,7 @@ extern const PropertyInfo qdev_prop_chr;
>  extern const PropertyInfo qdev_prop_tpm;
>  extern const PropertyInfo qdev_prop_ptr;
>  extern const PropertyInfo qdev_prop_macaddr;
> +extern const PropertyInfo qdev_prop_interval;
>  extern const PropertyInfo qdev_prop_on_off_auto;
>  extern const PropertyInfo qdev_prop_losttickpolicy;
>  extern const PropertyInfo qdev_prop_blockdev_on_error;
> @@ -202,6 +203,8 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
>      DEFINE_PROP(_n, _s, _f, qdev_prop_drive_iothread, BlockBackend *)
>  #define DEFINE_PROP_MACADDR(_n, _s, _f)         \
>      DEFINE_PROP(_n, _s, _f, qdev_prop_macaddr, MACAddr)
> +#define DEFINE_PROP_INTERVAL(_n, _s, _f)         \
> +    DEFINE_PROP(_n, _s, _f, qdev_prop_interval, Interval)
>  #define DEFINE_PROP_ON_OFF_AUTO(_n, _s, _f, _d) \
>      DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_on_off_auto, OnOffAuto)
>  #define DEFINE_PROP_LOSTTICKPOLICY(_n, _s, _f, _d) \
> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
> index 375770a80f..a827c9a3fe 100644
> --- a/include/qemu/typedefs.h
> +++ b/include/qemu/typedefs.h
> @@ -58,6 +58,7 @@ typedef struct ISABus ISABus;
>  typedef struct ISADevice ISADevice;
>  typedef struct IsaDma IsaDma;
>  typedef struct MACAddr MACAddr;
> +typedef struct Interval Interval;
>  typedef struct MachineClass MachineClass;
>  typedef struct MachineState MachineState;
>  typedef struct MemoryListener MemoryListener;

