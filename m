Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1834434njc;
        Mon, 25 Nov 2024 23:20:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWhYvjnCh8abKBGLk2g4m4hCFRnPrR78xe3bphOpqu+aAThsw14OVc0m7fzbpDhWlcDJgjFeUqkwKaLrw==@linaro.org
X-Google-Smtp-Source: AGHT+IHSdjq3GS9A+sHM/UJp2MRgD8HDHRfnVAWoP29Q1zWxXqsF9bYol1ND17d8eJ9PkV1O1C80
X-Received: by 2002:a05:6808:1b9a:b0:3e7:b800:21e8 with SMTP id 5614622812f47-3e91586ecb6mr14763910b6e.21.1732605651998;
        Mon, 25 Nov 2024 23:20:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732605651; cv=none;
        d=google.com; s=arc-20240605;
        b=ScMULxhR6xAzah/FYTWTbZBDAewjB5cgBVBV0JOcGWEj8tM4+by70j25B8b5YKeMwZ
         06hfePPwjrh73Ad7NhLT95E96RmMUokWsi7GoFtEm8sTWwcmJgZtWLECu1cdu3GSFV14
         Wv0+9hY+Zh4CFlKJSDHRBPKFHbU31lyswLtcZpP1u1DWyhNbVd09oDBVPO91rmcy6V1l
         eyKQscWhygjZ8q1a4+elxY7LXOvKpTylNZ3xEHZPY/xRioPJxI+PkQc5s2Oqppc+e5Y+
         jv4bHmOqayThXAuB3nLqhN5F0WmUUZzFiCFyq5AXwARbGvIq1t8xMcnYGByoHqKUiHX+
         YQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=/t+3zN1N/Z1eFtsFHvzBm9JzfRD3zH5mb3eNt0z7WMA=;
        fh=IgxJh5aV1DEOV+1Izo+P0APgF2t9+pllEzoXKHwFUYg=;
        b=PrTiDMYmKbuJq1FvQ0elUOVtbtJzDZ2JFLAmuNcjFORzgWht+eQzJjwUrOiVSKOnvg
         PVelmdhd+ENTrC3xb9uH3ItryBPki6mNwQJlPRzA+fEqnbNW11kgrJDSg0WexsE2OGyZ
         CJCbuZ9vRK56HuBwoQJpkd1XNwi1Vmg2AkD//Xov2eh5aTulhG5AU7daK46ZYZYhX+2e
         Y24gkRySs8Fp8FMpe3xeL6KJnkQcQCYUQfzgl5w6urgQdwP4YFWGbEjABf1C20p6x4SI
         Jaec86LYoT6HEKSL7yMQvaA0GI7qsK0XqjC+v6EfilHUCYb0LJS25+N/QDkDEwzCIEhQ
         d2ZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Oa4JbG0f;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <armbru@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d857f2d04esi13946436d6.533.2024.11.25.23.20.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 23:20:51 -0800 (PST)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Oa4JbG0f;
       spf=pass (google.com: domain of armbru@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732605651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/t+3zN1N/Z1eFtsFHvzBm9JzfRD3zH5mb3eNt0z7WMA=;
	b=Oa4JbG0f29VED8FsbX0Oiw3EzP9a1Z6U9SdoBNqyXRGZoCHuNUeo4xuv5NZc+pXUC/lzaM
	4mXepZqPjII3/hpAmXJ370sncjr1N0IbPstB21KR5kR0Q9npaKtVURFUsdwJ/9bCQtJlgN
	a6yqa1OI5NQhSqqok6Ll0OHtiDwjC0s=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-553-O8Qmtis3MBu2W0E0Cfso3g-1; Tue,
 26 Nov 2024 02:20:48 -0500
X-MC-Unique: O8Qmtis3MBu2W0E0Cfso3g-1
X-Mimecast-MFC-AGG-ID: O8Qmtis3MBu2W0E0Cfso3g
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 974F0195608A;
	Tue, 26 Nov 2024 07:20:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.102])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8A757195DF81;
	Tue, 26 Nov 2024 07:20:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 49BDF21E66D2; Tue, 26 Nov 2024 08:20:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: peter.maydell@linaro.org,  richard.henderson@linaro.org,
  philmd@linaro.org,  qemu-arm@nongnu.org,  qemu-devel@nongnu.org,
  alex.bennee@linaro.org,  Eric Blake <eblake@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>
Subject: Re: [PATCH v3 10/26] target/arm/kvm-rme: Add Realm Personalization
 Value parameter
In-Reply-To: <20241125195626.856992-12-jean-philippe@linaro.org>
	(Jean-Philippe Brucker's message of "Mon, 25 Nov 2024 19:56:09 +0000")
References: <20241125195626.856992-2-jean-philippe@linaro.org>
	<20241125195626.856992-12-jean-philippe@linaro.org>
Date: Tue, 26 Nov 2024 08:20:42 +0100
Message-ID: <87wmgqsbp1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: ztpvDWGusQ0I

Jean-Philippe Brucker <jean-philippe@linaro.org> writes:

> The Realm Personalization Value (RPV) is provided by the user to
> distinguish Realms that have the same initial measurement.
>
> The user provides up to 64 hexadecimal bytes. They are stored into the
> RPV in the same order, zero-padded on the right.
>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Eduardo Habkost <eduardo@habkost.net>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> v2->v3: Fix documentation
> ---
>  qapi/qom.json        |  15 ++++++
>  target/arm/kvm-rme.c | 111 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 126 insertions(+)
>
> diff --git a/qapi/qom.json b/qapi/qom.json
> index a8beeabf1f..f982850bca 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -1068,6 +1068,19 @@
>    'data': { '*cpu-affinity': ['uint16'],
>              '*node-affinity': ['uint16'] } }
>=20=20
> +##
> +# @RmeGuestProperties:
> +#
> +# Properties for rme-guest objects.
> +#
> +# @personalization-value: Realm personalization value, as a 64-byte
> +#     hex string. This optional parameter allows to uniquely identify
> +#     the VM instance during attestation. (default: 0)

QMP commonly uses base64 for encoding binary data.  Any particular
reason to deviate?

Is the "hex string" to be mapped to binary in little or big endian?  Not
an issue with base64.

Nitpick: (default: all-zero), please, for consistency with similar
documentation in SevSnpGuestProperties.

> +#
> +# Since: 9.3
> +##
> +{ 'struct': 'RmeGuestProperties',
> +  'data': { '*personalization-value': 'str' } }
>=20=20
>  ##
>  # @ObjectType:
> @@ -1121,6 +1134,7 @@
>      { 'name': 'pr-manager-helper',
>        'if': 'CONFIG_LINUX' },
>      'qtest',
> +    'rme-guest',
>      'rng-builtin',
>      'rng-egd',
>      { 'name': 'rng-random',

The commit message claims the patch adds a parameter.  It actually adds
an entire object type.

> @@ -1195,6 +1209,7 @@
>        'pr-manager-helper':          { 'type': 'PrManagerHelperProperties=
',
>                                        'if': 'CONFIG_LINUX' },
>        'qtest':                      'QtestProperties',
> +      'rme-guest':                  'RmeGuestProperties',
>        'rng-builtin':                'RngProperties',
>        'rng-egd':                    'RngEgdProperties',
>        'rng-random':                 { 'type': 'RngRandomProperties',
> diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> index 83a29421df..0be55867ee 100644
> --- a/target/arm/kvm-rme.c
> +++ b/target/arm/kvm-rme.c
> @@ -23,11 +23,15 @@ OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
>=20=20
>  #define RME_PAGE_SIZE qemu_real_host_page_size()
>=20=20
> +#define RME_MAX_CFG         1
> +
>  struct RmeGuest {
>      ConfidentialGuestSupport parent_obj;
>      Notifier rom_load_notifier;
>      GSList *ram_regions;
>=20=20
> +    uint8_t *personalization_value;
> +
>      hwaddr ram_base;
>      size_t ram_size;
>  };
> @@ -43,6 +47,48 @@ typedef struct {
>=20=20
>  static RmeGuest *rme_guest;
>=20=20
> +static int rme_configure_one(RmeGuest *guest, uint32_t cfg, Error **errp)
> +{
> +    int ret;
> +    const char *cfg_str;
> +    struct kvm_cap_arm_rme_config_item args =3D {
> +        .cfg =3D cfg,
> +    };
> +
> +    switch (cfg) {
> +    case KVM_CAP_ARM_RME_CFG_RPV:
> +        if (!guest->personalization_value) {
> +            return 0;
> +        }
> +        memcpy(args.rpv, guest->personalization_value, KVM_CAP_ARM_RME_R=
PV_SIZE);
> +        cfg_str =3D "personalization value";
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }

This function gets called with @cfg arguments 0 .. RME_MAX_CFG-1, from
rme_configure() right below.  RME_MAX_CFG is defined to 1 above.

The switch assumes KVM_CAP_ARM_RME_CFG_RPV is zero.  Such assumptions
are ideally avoided, and alternatively checked at build time.

> +
> +    ret =3D kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
> +                            KVM_CAP_ARM_RME_CONFIG_REALM, (intptr_t)&arg=
s);
> +    if (ret) {
> +        error_setg_errno(errp, -ret, "failed to configure %s", cfg_str);
> +    }
> +    return ret;
> +}
> +
> +static int rme_configure(Error **errp)
> +{
> +    int ret;
> +    int cfg;
> +
> +    for (cfg =3D 0; cfg < RME_MAX_CFG; cfg++) {
> +        ret =3D rme_configure_one(rme_guest, cfg, errp);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +    return 0;
> +}
> +
>  static int rme_init_ram(hwaddr base, size_t size, Error **errp)
>  {
>      int ret;
> @@ -123,6 +169,10 @@ static int rme_create_realm(Error **errp)
>  {
>      int ret;
>=20=20
> +    if (rme_configure(errp)) {
> +        return -1;
> +    }
> +
>      ret =3D kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
>                              KVM_CAP_ARM_RME_CREATE_RD);
>      if (ret) {
> @@ -168,8 +218,69 @@ static void rme_vm_state_change(void *opaque, bool r=
unning, RunState state)
>      }
>  }
>=20=20
> +static char *rme_get_rpv(Object *obj, Error **errp)
> +{
> +    RmeGuest *guest =3D RME_GUEST(obj);
> +    GString *s;
> +    int i;
> +
> +    if (!guest->personalization_value) {
> +        return NULL;
> +    }
> +
> +    s =3D g_string_sized_new(KVM_CAP_ARM_RME_RPV_SIZE * 2 + 1);
> +
> +    for (i =3D 0; i < KVM_CAP_ARM_RME_RPV_SIZE; i++) {
> +        g_string_append_printf(s, "%02x", guest->personalization_value[i=
]);
> +    }

The size of the destrination string is known at compile time.  Why grow
it dynamically?

Base64 would take less code.

> +
> +    return g_string_free(s, /* free_segment */ false);
> +}
> +
> +static void rme_set_rpv(Object *obj, const char *value, Error **errp)
> +{
> +    RmeGuest *guest =3D RME_GUEST(obj);
> +    size_t len =3D strlen(value);
> +    uint8_t *out;
> +    int i =3D 1;
> +    int ret;
> +
> +    g_free(guest->personalization_value);
> +    guest->personalization_value =3D out =3D g_malloc0(KVM_CAP_ARM_RME_R=
PV_SIZE);
> +
> +    /* Two chars per byte */
> +    if (len > KVM_CAP_ARM_RME_RPV_SIZE * 2) {
> +        error_setg(errp, "Realm Personalization Value is too large");
> +        return;
> +    }
> +
> +    /* First byte may have a single char */
> +    if (len % 2) {
> +        ret =3D sscanf(value, "%1hhx", out++);
> +    } else {
> +        ret =3D sscanf(value, "%2hhx", out++);
> +        i++;
> +    }
> +    if (ret !=3D 1) {
> +        error_setg(errp, "Invalid Realm Personalization Value");
> +        return;
> +    }
> +
> +    for (; i < len; i +=3D 2) {
> +        ret =3D sscanf(value + i, "%2hhx", out++);
> +        if (ret !=3D 1) {
> +            error_setg(errp, "Invalid Realm Personalization Value");
> +            return;
> +        }
> +    }

Looks like this supports hex strings shorter than
KVM_CAP_ARM_RME_RPV_SIZE * 2.  How these get padded is not documented.
Fixable, but are you sure the convenience is worth the complexity?

Again, base64 would take less code.

> +}
> +
>  static void rme_guest_class_init(ObjectClass *oc, void *data)
>  {
> +    object_class_property_add_str(oc, "personalization-value", rme_get_r=
pv,
> +                                  rme_set_rpv);
> +    object_class_property_set_description(oc, "personalization-value",
> +            "Realm personalization value (512-bit hexadecimal number)");
>  }
>=20=20
>  static void rme_guest_init(Object *obj)
