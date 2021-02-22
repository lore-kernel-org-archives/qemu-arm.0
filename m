Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1924351lfc;
        Mon, 22 Feb 2021 09:36:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzakRFMUXXD1I5f5Xrz+kA+DLu0/iWshMEHQ4pfoF9qRdAPnM3jFHx23gcS56kwDb6xK8wR
X-Received: by 2002:a05:6e02:d0f:: with SMTP id g15mr8560808ilj.88.1614015377854;
        Mon, 22 Feb 2021 09:36:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614015377; cv=none;
        d=google.com; s=arc-20160816;
        b=ZrDc7Id8LgQvZ5Ym86o+zfo9NTmbcEdYuA06W7hInmODxxRnINPGU6P4zfzBt1DS39
         +gNRo2P0mRroehctr+Qw+dJLWtfta8FU0l9SCFvZejaarMezkuGXympmFDJFcJxkjPYy
         C+U+A9yv3x+p1HzUaeNZeGbZzwZ1fcQv4OxYt+HFQpEgADi2/fsHEKWGjsV6YGf5QpnC
         8PfBk/kwyB7tsVN0orgdhQLZ2Jl1XAF3/GEwnl66ymXz3Xmp1TGC6JvzwU00det/rVcT
         GzfpgscXBz0VO4jBTE8hmd7yh2AnGDl1w6QIRIo2zWrE06znxHNp8eRFIBG8/ViF1wGs
         EIYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:dkim-signature
         :sender:precedence:errors-to:list-subscribe:list-help:list-post
         :list-unsubscribe:list-id;
        bh=XWsN624cEMx0QkfAoPhColDm3XkV4SngFq4vEfyfRY4=;
        b=bXYgdRiuxG2u6r9o5vxZ7UFiEmiV73csFou3gpBxxxGaqs9Y89sNuBAMDkhn51oCfn
         lsliRovxPhf2NfRe6G8zj6KLk8vOnOyjxA1xG53ZjXKajFNX5ESHlvBmjXhEs5mU650J
         JNA74sXfzuIIX8Jr5m8ubsKhdPz2jUa19U1BVtnjyXNI6nUo6Jr9glDWa/m/mh2WtDuf
         G9Ev0x0+g9etZuYpb5LL5W0aJrUCG4S1sXMpOGEEbWXp/5eRLu5mxTSaxqh/xxvhhIxi
         KudRMXPCgZNk8ONRywIFAwSLLt6SiuqPiVLoPBq4uAc12dAk/FMQJ9HrIa7D5QuEc9EJ
         t4mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="MRd/l2kJ";
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id e8si16770894iot.12.2021.02.22.09.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 09:36:17 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="MRd/l2kJ";
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from list by lists.xenproject.org with outflank-mailman.88299.165917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEF6W-0006D0-6g; Mon, 22 Feb 2021 17:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88299.165917; Mon, 22 Feb 2021 17:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEF6W-0006Ct-3E; Mon, 22 Feb 2021 17:34:40 +0000
Received: by outflank-mailman (input) for mailman id 88299;
 Mon, 22 Feb 2021 17:34:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cC4D=HY=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1lEF6V-0006Co-13
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 17:34:39 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7f8e8e55-6765-41c4-90ae-d4664e6b01b0;
 Mon, 22 Feb 2021 17:34:38 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-vQd1LyseM5qTcpsZxvKmjQ-1; Mon, 22 Feb 2021 12:34:33 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E7AB1850233;
 Mon, 22 Feb 2021 17:34:10 +0000 (UTC)
Received: from gondolin (ovpn-113-115.ams2.redhat.com [10.36.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30F26E2CE;
 Mon, 22 Feb 2021 17:34:03 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 7f8e8e55-6765-41c4-90ae-d4664e6b01b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614015278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XWsN624cEMx0QkfAoPhColDm3XkV4SngFq4vEfyfRY4=;
	b=MRd/l2kJEH2fk0oqWs5VEoOg+Z8kLRs1I7qlcUCSvaXMdmRnmoZcsvxbPyu8jDe1i59nge
	syWoEWc+f+3nTsafBDe+iqHmv0wnC+eH4PaCg70ElYHY4qsljt0Eba4IyGuzkCj8dDd3nI
	b/NEFHCqkJHTjwjbE3V51LGUYnERWWg=
X-MC-Unique: vQd1LyseM5qTcpsZxvKmjQ-1
Date: Mon, 22 Feb 2021 18:34:00 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, Peter
 Maydell <peter.maydell@linaro.org>, Anthony Perard
 <anthony.perard@citrix.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>,
 xen-devel@lists.xenproject.org, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paolo
 Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, BALATON Zoltan
 <balaton@eik.bme.hu>, Leif Lindholm <leif@nuviainc.com>, Richard Henderson
 <richard.henderson@linaro.org>, Radoslaw Biernacki <rad@semihalf.com>,
 Alistair Francis <alistair@alistair23.me>, Paul Durrant <paul@xen.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Thomas Huth <thuth@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, =?UTF-8?B?SGVydsOp?= Poussineau
 <hpoussin@reactos.org>, Greg Kurz <groug@kaod.org>, Christian Borntraeger
 <borntraeger@de.ibm.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>
Subject: Re: [PATCH v2 02/11] hw/boards: Introduce
 machine_class_valid_for_accelerator()
Message-ID: <20210222183400.0c151d46.cohuck@redhat.com>
In-Reply-To: <20210219173847.2054123-3-philmd@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
	<20210219173847.2054123-3-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-TUID: zuUQNwI7aXYp

On Fri, 19 Feb 2021 18:38:38 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Introduce the valid_accelerators[] field to express the list
> of valid accelators a machine can use, and add the
> machine_class_valid_for_current_accelerator() and
> machine_class_valid_for_accelerator() methods.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/hw/boards.h | 24 ++++++++++++++++++++++++
>  hw/core/machine.c   | 26 ++++++++++++++++++++++++++
>  2 files changed, 50 insertions(+)
>=20
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 68d3d10f6b0..4d08bc12093 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -36,6 +36,24 @@ void machine_set_cpu_numa_node(MachineState *machine,
>                                 const CpuInstanceProperties *props,
>                                 Error **errp);
> =20
> +/**
> + * machine_class_valid_for_accelerator:
> + * @mc: the machine class
> + * @acc_name: accelerator name
> + *
> + * Returns %true if the accelerator is valid for the machine, %false
> + * otherwise. See #MachineClass.valid_accelerators.

Naming confusion: is the machine class valid for the accelerator, or
the accelerator valid for the machine class? Or either? :)

> + */
> +bool machine_class_valid_for_accelerator(MachineClass *mc, const char *a=
cc_name);
> +/**
> + * machine_class_valid_for_current_accelerator:
> + * @mc: the machine class
> + *
> + * Returns %true if the accelerator is valid for the current machine,
> + * %false otherwise. See #MachineClass.valid_accelerators.

Same here: current accelerator vs. current machine.

> + */
> +bool machine_class_valid_for_current_accelerator(MachineClass *mc);
> +
>  void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char=
 *type);
>  /*
>   * Checks that backend isn't used, preps it for exclusive usage and
> @@ -125,6 +143,11 @@ typedef struct {
>   *    should instead use "unimplemented-device" for all memory ranges wh=
ere
>   *    the guest will attempt to probe for a device that QEMU doesn't
>   *    implement and a stub device is required.
> + * @valid_accelerators:
> + *    If this machine supports a specific set of virtualization accelera=
tors,
> + *    this contains a NULL-terminated list of the accelerators that can =
be
> + *    used. If this field is not set, any accelerator is valid. The QTest
> + *    accelerator is always valid.
>   * @kvm_type:
>   *    Return the type of KVM corresponding to the kvm-type string option=
 or
>   *    computed based on other criteria such as the host kernel capabilit=
ies
> @@ -166,6 +189,7 @@ struct MachineClass {
>      const char *alias;
>      const char *desc;
>      const char *deprecation_reason;
> +    const char *const *valid_accelerators;
> =20
>      void (*init)(MachineState *state);
>      void (*reset)(MachineState *state);
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 970046f4388..c42d8e382b1 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -518,6 +518,32 @@ static void machine_set_nvdimm_persistence(Object *o=
bj, const char *value,
>      nvdimms_state->persistence_string =3D g_strdup(value);
>  }
> =20
> +bool machine_class_valid_for_accelerator(MachineClass *mc, const char *a=
cc_name)
> +{
> +    const char *const *name =3D mc->valid_accelerators;
> +
> +    if (!name) {
> +        return true;
> +    }
> +    if (strcmp(acc_name, "qtest") =3D=3D 0) {
> +        return true;
> +    }
> +
> +    for (unsigned i =3D 0; name[i]; i++) {
> +        if (strcasecmp(acc_name, name[i]) =3D=3D 0) {
> +            return true;
> +        }
> +    }
> +    return false;
> +}
> +
> +bool machine_class_valid_for_current_accelerator(MachineClass *mc)
> +{
> +    AccelClass *ac =3D ACCEL_GET_CLASS(current_accel());
> +
> +    return machine_class_valid_for_accelerator(mc, ac->name);
> +}

The implementation of the function tests for the current accelerator,
so I think you need to tweak the description above?

> +
>  void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char=
 *type)
>  {
>      QAPI_LIST_PREPEND(mc->allowed_dynamic_sysbus_devices, g_strdup(type)=
);

