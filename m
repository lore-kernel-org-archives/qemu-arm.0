Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1000743ejb;
        Thu, 19 Oct 2023 22:49:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0R6AlmMN4tp/BNXchcha+NOMk32RzA7ICyD4dHSm6arT6JpJx2HOCKqXeFIZqvdoyes5x
X-Received: by 2002:a05:620a:1707:b0:777:2e8b:3446 with SMTP id az7-20020a05620a170700b007772e8b3446mr858412qkb.55.1697780985398;
        Thu, 19 Oct 2023 22:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697780985; cv=none;
        d=google.com; s=arc-20160816;
        b=ZjRB67HgnfXF+/JIu3q2fB1iXoBwaKRClzIzwxzenuLE5LnBcWkslFbNUpsNvy0Bvu
         xTplR7pO9Z7snCJtPGumltC3srOp09wYi7il2xmFYSGUCwN9aKLa4bwA7TxLGXNInULE
         CkNkfxuE7ckq3PaHANqBl2ZEuxJZ72MiFlh3SVBvnKhBD1IHXO/b75uJ8PEU87HuxONl
         xs6+B/SrO9jGK0Ri2U74S4cdy2uBabnJTBzJ46gQ5dkcR0RT87vWbCChCakiBYf0n9Kg
         G6k5woZR2bKM/1C395C7nzV/fwSa3FKMD7T4nowI3U2dqao4NBuwgyDvBnGx0iWs1fdS
         CRaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=gMVfCtRDDnl+luLg+Cm8GHVP//AX3rsw5T+I9lQu0ZA=;
        fh=9DAFZH4N6QCknGNONDw8nqqx2vm+7pP/ZvN/F8qS/d4=;
        b=PC8YDMmNAOfDHTbcmEB/QZjHnVl37mo99BbIuYf/nNKBBLkHBFXqDULuEbkkCyGfP9
         iYPU8hYEAzmnsQ2RuqnhLXjAn/zEauBv27raFhfNd8PkepQLJfBgLCbqidvgjb2Kkt87
         IjvNHCcGA4idby4Uo5Sh7tqRjrQGBmFFXtmRIsETSLKjZXB9GC6w77kwsfI5US4030MR
         RP975L4vqC4ltKXc8TexwfhXTyAPGmZ9wQBeTHHxGdDIf/+AGrTyksPa0YLn1k7RYstU
         Ia4FcOKCl2CWhP4i7k5TjQg6OSNgfN3s/8sLIHRwBxYCt2FiqMlZniTW2RAsDtoISc2v
         AYUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fLTLrKfk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1-20020a05620a078100b00776fb0c6b42si761584qka.461.2023.10.19.22.49.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 22:49:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fLTLrKfk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtiOC-0005XT-Ms; Fri, 20 Oct 2023 01:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qtiOA-0005Wk-7m
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 01:49:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qtiO8-000654-K4
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 01:49:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697780975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gMVfCtRDDnl+luLg+Cm8GHVP//AX3rsw5T+I9lQu0ZA=;
 b=fLTLrKfk7/LA+GfyI1Wrt8PwHbMZvCTOWW1WG4ZG1pdcAbQOhZ0LxfzF8mPRWP+yN2a4X6
 A2GhSdgcDrGL2Cx8b0kpiJWzpUc0ewvvRY5JYWiFyaSf6DKlmBH8XCQuY9cAKPmqqEaj4H
 dxCppCQAH5S2vbbXRLFmnUhPlhEnu+w=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-PV9HZWHeP_-Qm5i5i3AXQQ-1; Fri, 20 Oct 2023 01:49:31 -0400
X-MC-Unique: PV9HZWHeP_-Qm5i5i3AXQQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 488FF3C17089;
 Fri, 20 Oct 2023 05:49:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F4145C15BB8;
 Fri, 20 Oct 2023 05:49:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D5FE421E6A1F; Fri, 20 Oct 2023 07:49:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,  qemu-s390x@nongnu.org,  Nicholas Piggin
 <npiggin@gmail.com>,  Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,  David Gibson
 <david@gibson.dropbear.id.au>,  Harsh Prateek Bora
 <harshpb@linux.ibm.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>
Subject: Re: [PATCH v2 01/22] qapi: Inline and remove QERR_BUS_NO_HOTPLUG
 definition
References: <20231005045041.52649-1-philmd@linaro.org>
 <20231005045041.52649-2-philmd@linaro.org>
Date: Fri, 20 Oct 2023 07:49:29 +0200
In-Reply-To: <20231005045041.52649-2-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 5 Oct 2023 06:50:18
 +0200")
Message-ID: <87mswdc07q.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: lNOlC3M1bOWT

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Address the comment added in commit 4629ed1e98
> ("qerror: Finally unused, clean up"), from 2015:
>
>   /*
>    * These macros will go away, please don't use
>    * in new code, and do not add new ones!
>    */
>
> Mechanical transformation using sed, manually
> removing the definition in include/qapi/qmp/qerror.h.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/qapi/qmp/qerror.h | 3 ---
>  hw/ppc/spapr_pci.c        | 4 ++--
>  softmmu/qdev-monitor.c    | 8 +++++---
>  3 files changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
> index 8dd9fcb071..1a9c2d3502 100644
> --- a/include/qapi/qmp/qerror.h
> +++ b/include/qapi/qmp/qerror.h
> @@ -17,9 +17,6 @@
>   * add new ones!
>   */
>=20=20
> -#define QERR_BUS_NO_HOTPLUG \
> -    "Bus '%s' does not support hotplugging"
> -
>  #define QERR_DEVICE_HAS_NO_MEDIUM \
>      "Device '%s' has no medium"
>=20=20
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 370c5a90f2..7f063f5852 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -1550,7 +1550,7 @@ static void spapr_pci_pre_plug(HotplugHandler *plug=
_handler,
>           * we need to let them know it's not enabled
>           */
>          if (plugged_dev->hotplugged) {
> -            error_setg(errp, QERR_BUS_NO_HOTPLUG,
> +            error_setg(errp, "Bus '%s' does not support hotplugging",
>                         object_get_typename(OBJECT(phb)));

@phb is a SpaprPhbState *, thereforce object_get_typename() returns
"spapr-pci-host-bridge", which is not a bus.  It provides a bus: PCI bus
phb->parent_obj.bus.

Should be fixed on top, so this patch remains mechanical.

Well outside this patch's scope, but here goes anyway: I wonder why we
need this check.  Why is the generic check in
qdev_device_add_from_qdict() not enough?

>              return;
>          }
> @@ -1671,7 +1671,7 @@ static void spapr_pci_unplug_request(HotplugHandler=
 *plug_handler,
>      SpaprDrc *drc =3D drc_from_dev(phb, pdev);
>=20=20
>      if (!phb->dr_enabled) {
> -        error_setg(errp, QERR_BUS_NO_HOTPLUG,
> +        error_setg(errp, "Bus '%s' does not support hotplugging",

Likewise.

>                     object_get_typename(OBJECT(phb)));
>          return;
>      }
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 74f4e41338..3a9740dcbd 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -656,7 +656,8 @@ DeviceState *qdev_device_add_from_qdict(const QDict *=
opts,
>=20=20
>      if (qdev_should_hide_device(opts, from_json, errp)) {
>          if (bus && !qbus_is_hotpluggable(bus)) {
> -            error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
> +            error_setg(errp, "Bus '%s' does not support hotplugging",
> +                       bus->name);
>          }
>          return NULL;
>      } else if (*errp) {
> @@ -664,7 +665,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict *=
opts,
>      }
>=20=20
>      if (phase_check(PHASE_MACHINE_READY) && bus && !qbus_is_hotpluggable=
(bus)) {
> -        error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
> +        error_setg(errp, "Bus '%s' does not support hotplugging", bus->n=
ame);
>          return NULL;
>      }
>=20=20
> @@ -904,7 +905,8 @@ void qdev_unplug(DeviceState *dev, Error **errp)
>      }
>=20=20
>      if (dev->parent_bus && !qbus_is_hotpluggable(dev->parent_bus)) {
> -        error_setg(errp, QERR_BUS_NO_HOTPLUG, dev->parent_bus->name);
> +        error_setg(errp, "Bus '%s' does not support hotplugging",
> +                   dev->parent_bus->name);
>          return;
>      }

Could factor out

    if (bus && !qbus_is_hotpluggable(bus)) {
        error_setg(errp, "Bus '%s' does not support hotplugging", bus->name=
);
        return false;
    }
    return true;

Idea, not a demand.

