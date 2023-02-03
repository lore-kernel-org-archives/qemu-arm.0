Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1338884ejb;
        Fri, 3 Feb 2023 04:32:51 -0800 (PST)
X-Google-Smtp-Source: AK7set9cyrJinK8tPvPu1Reea6nLZq0xbZG+k/A1FhJj6w1u9HH/l+Fskzyh+OIGDp+qqdTxDCTU
X-Received: by 2002:ac8:5e0f:0:b0:3b9:a6ae:e1e2 with SMTP id h15-20020ac85e0f000000b003b9a6aee1e2mr17783101qtx.58.1675427571746;
        Fri, 03 Feb 2023 04:32:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675427571; cv=none;
        d=google.com; s=arc-20160816;
        b=aJTwky8QBCIkbd8sM/aglLE/XgtlNdpClw0L7egSK4E9DAX2TnCOyQqnWTZxXl1QZB
         dgz1N7M5b5JDb3wqQiNLpkvAbCgYwbfYzCoi69IAjvP32Vi6Y3m0pv6WU0TMCbKUyiOc
         7RqjHHRdJSgFEpRgyr9SaicCEeqge2uLzon+DVIx/SVa+m0Jglh8IU6+MSCtVvQrCCdi
         irhA2xcLvrFB5RYS0ZEZHHf9TSO0Xdg3YMXX7/9Nw5QRbWcmEI9X+XBls4XV9+zNBNRg
         VejtntUPFythw/DYOMoEFYjBTYhmDm7pb9o05G5NZ1JPpbiOm1Q/140IujyNGIdbgLl7
         xqWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=/xMA3+7OwJ3uRlHKDUK4ZWTzlD+x8u764Xcmu3VgblA=;
        b=GoIxAZYtB8MsPu7DZhN6qDY6SbDG2kUeK0xcp61MK/VwEHqwOVkdFvet3ez8Qi//IB
         XOq2D+zahE9mKHD1lDYtRO/SN3OEsoi5/hFLDxVtcZ0IFz/wZD0lpsFodd9nKzlmF+80
         ixCaX0Ojw7R9VUHb0hhSA2MaZfHauBbi8BffAfu15RCX7+kpGbXODKj4kkso4PNhUu6s
         sa5wyNFOov1dNmHD1BDYguocpQHX03hBDCNY7qkOqXfmd/XeflNPXxLc5SDuCrvwxCPz
         YQxdYaNoyKzhXEJu7sbzxuS0cLYg5hBICQfTaDQq4fAklOBr2ACIQ37TLUgA0g7ZkEki
         6xBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V97lRHuN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18-20020a05622a15d200b003a823ab220dsi1888277qty.43.2023.02.03.04.32.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 04:32:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V97lRHuN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNvEw-0000R4-Ry; Fri, 03 Feb 2023 07:32:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNvEn-0000Ov-Ti
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 07:32:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNvEl-0001li-7A
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 07:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675427533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/xMA3+7OwJ3uRlHKDUK4ZWTzlD+x8u764Xcmu3VgblA=;
 b=V97lRHuN9zwT+U5jtMhe8tqD6sBy+ffz1BTZnsFlOzDWggolNv2UHg2W21rSEXixHEU5Qe
 MB1KStAyhh7TVkRinbAevMzbdmAVy4aJAISFY2doO7yvFeIf5MjklQzMRQjYJuZCrzKPZQ
 dpSTuBYTxhUvAo2kyxJ/wA9pKiZsfa0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-JPxkwnzyNyyAWwkLYn_mMQ-1; Fri, 03 Feb 2023 07:32:12 -0500
X-MC-Unique: JPxkwnzyNyyAWwkLYn_mMQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E81323C0257C;
 Fri,  3 Feb 2023 12:32:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 598167AD4;
 Fri,  3 Feb 2023 12:32:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 34CDF21E6A1F; Fri,  3 Feb 2023 13:32:10 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/9] hw/i386/sgx: Do not open-code qdev_realize_and_unref()
References: <20230203113650.78146-1-philmd@linaro.org>
 <20230203113650.78146-2-philmd@linaro.org>
Date: Fri, 03 Feb 2023 13:32:10 +0100
In-Reply-To: <20230203113650.78146-2-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 3 Feb 2023 12:36:42
 +0100")
Message-ID: <87lelfc4l1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 6+w2v7f7diaZ

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/i386/sgx.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> index db004d17a6..5ddc5d7ea2 100644
> --- a/hw/i386/sgx.c
> +++ b/hw/i386/sgx.c
> @@ -299,7 +299,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
>                                  &sgx_epc->mr);
>=20=20
>      for (list =3D x86ms->sgx_epc_list; list; list =3D list->next) {
> -        obj =3D object_new("sgx-epc");
> +        obj =3D object_new(TYPE_SGX_EPC);

I wonder why this doesn't use qdev_new().
>=20=20
>          /* set the memdev link with memory backend */
>          object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->mem=
dev,
> @@ -307,8 +307,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
>          /* set the numa node property for sgx epc object */
>          object_property_set_uint(obj, SGX_EPC_NUMA_NODE_PROP, list->valu=
e->node,
>                               &error_fatal);
> -        object_property_set_bool(obj, "realized", true, &error_fatal);
> -        object_unref(obj);
> +        qdev_realize_and_unref(DEVICE(obj), NULL, &error_fatal);

Yes, please!  Must have crept in after I converted all realizations.
I can see two more:

hw/pci/pcie_sriov.c:        object_property_set_bool(OBJECT(vf), "realized"=
, false, &local_err);
linux-user/syscall.c:            object_property_set_bool(OBJECT(cpu), "rea=
lized", false, NULL);

>      }
>=20=20
>      if ((sgx_epc->base + sgx_epc->size) < sgx_epc->base) {

Reviewed-by: Markus Armbruster <armbru@redhat.com>

