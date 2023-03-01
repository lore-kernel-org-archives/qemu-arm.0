Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp7002983ejc;
        Wed, 1 Mar 2023 06:13:52 -0800 (PST)
X-Google-Smtp-Source: AK7set/Tx+zNj5OycJ3onIM/QyMn6bEnrsfM8xCGWMt+4lD3nhqmxnMR9mS82/LiVK3MIf9RL+nm
X-Received: by 2002:a05:622a:2cc:b0:3bf:c214:5006 with SMTP id a12-20020a05622a02cc00b003bfc2145006mr11382686qtx.24.1677680031871;
        Wed, 01 Mar 2023 06:13:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677680031; cv=none;
        d=google.com; s=arc-20160816;
        b=IDf7iEKyAVtoZh+LwriUfic/Cpl4QefdGuAu8y2HCT5ynnnTqnICcFFwLqLUJkPi3W
         CIygnAre2/9xf6bMOZVmE6AxmQCLFgOkQpQ+/eUAAG23D+qQneglsw4Ea0Yxe4frPV4X
         rSSwlpPEwHey/oYMEUFb9b3ELgL8VtOdOVFVuiNBC043oi3srh0PSzoHQ1tjFFrysi1u
         L4XFDHdvSdbSnC66+laiA73zfAelXYJ8i9VaBvsUd9HMw/BnoX6d2KOesd8ySeEGlPRD
         D+UYfNXVHNgMMJbOzQBRugY2rBBKbwP+7umRzZRp1NDyIrHSQrZXi3S1CV2PqtQFRFYO
         YKLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=UDqtituCa8SLMMVLNkoiTnXN8ZttmxIZVl20pm4bLU8=;
        b=e87M3O7FpUwtRxBAfrugbJYbvWUJF9dsTd7R0j5tEKfHWzPVYftu/orM5O+TJRTfL2
         dQwNOHyOmPjhEJdFrmkg8e8UkPH5NHn+LjwlYM6CnoXX2OHP3Ak/eB4Neq29kgmULdzp
         wiF9zy4cTe1brG4Mv0nPpnVxJ35NknhDHsiWeJiczxNylQqwMJYzAZsVOD68wlreQmlx
         o3OmDjibG8h/fT6SYdzuAz0EvR6qBGKVfadl2fRGXA6yMQA0/2KY2D8JzfW1+oz+xleZ
         pL+oIzagMEG5XV03xd+E/lxpKipD8BY13ffYvLMTyd5DQ2Y1OVM3sTfZhFGR9VaRKZ73
         RDgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LRXyf6KJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 184-20020a370bc1000000b0073b714fc4acsi10163240qkl.713.2023.03.01.06.13.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Mar 2023 06:13:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LRXyf6KJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXNDA-0003gB-2g; Wed, 01 Mar 2023 09:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXNCw-0003di-TD
 for qemu-arm@nongnu.org; Wed, 01 Mar 2023 09:13:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXNCu-0007DF-CL
 for qemu-arm@nongnu.org; Wed, 01 Mar 2023 09:13:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677680003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UDqtituCa8SLMMVLNkoiTnXN8ZttmxIZVl20pm4bLU8=;
 b=LRXyf6KJRg38vgPTb10zLFcZlKV/Gvoa2DCxq7A/8aJOCxNzpYjkQlClbSjICwPKHZVAEK
 K87qi/v+mALB3sTVbY6091PiB+H1bTdiqbq41rJxX/Mi5+Og/IZOgWIuAB+vXTPJHfdju1
 ltvh5Zeh7U2+NYI2aIAL9V9HzbFbNLg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-m_XRICINOXemoSoNBT6PaQ-1; Wed, 01 Mar 2023 09:13:22 -0500
X-MC-Unique: m_XRICINOXemoSoNBT6PaQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 r7-20020a05600c35c700b003eb3f2c4fb4so4145695wmq.6
 for <qemu-arm@nongnu.org>; Wed, 01 Mar 2023 06:13:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677679999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UDqtituCa8SLMMVLNkoiTnXN8ZttmxIZVl20pm4bLU8=;
 b=PgzUPsrtZDdW3RCGlaTwGG7pD4rw93a+N66i0AJ3EEBHZbI34d+IE7OHisrKoEkybp
 QSgSZZTI6PKGtmby5Uun4HN4q3WrFrZ34ObxhhRfHc8tcoc3HiMVUfETR1lWaeGmMVIZ
 BO6O/iZ0pGRI63oXgE+P9kkz2UfvAvvg5OtO3qHq3uPFv9DbzTzYwQkbfUFdoU15DDZn
 xiU2P1/57QIU2gV0kBx7tLYP4UJmS7ut3ccusiw2yTWLJKehPJPTnU3gvKjnYagosGzv
 c6AXX0YugVPKAFVOfgEVaGp84ggx2W17ca7I7F1Yq3lsE07F51oBIOk7s7mc0HcHfGXD
 6Y/Q==
X-Gm-Message-State: AO0yUKU4jUV3KKb0SjNGoiduOzKZYjAAN0zVeM6IsaCwnI7TSdLT31xD
 DB2yKLUQkqasllBr4NWVXPIVwcVluiSlQhvsktjlrPmPlEzpGG+7WL6xmuVc//ZaFxRiuAAMhtd
 ZX5wWg1z3jIy7E4e8VQ==
X-Received: by 2002:a05:600c:4b30:b0:3df:fbc7:5b10 with SMTP id
 i48-20020a05600c4b3000b003dffbc75b10mr5018637wmp.0.1677679999035; 
 Wed, 01 Mar 2023 06:13:19 -0800 (PST)
X-Received: by 2002:a05:600c:4b30:b0:3df:fbc7:5b10 with SMTP id
 i48-20020a05600c4b3000b003dffbc75b10mr5018619wmp.0.1677679998698; 
 Wed, 01 Mar 2023 06:13:18 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 fj10-20020a05600c0c8a00b003e7c89b3514sm20008881wmb.23.2023.03.01.06.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 06:13:18 -0800 (PST)
Date: Wed, 1 Mar 2023 15:13:17 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-riscv@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng
 <fam@euphon.net>
Subject: Re: [RFC PATCH 07/19] hw/scsi: Set QDev properties using QDev API
Message-ID: <20230301151317.0ab8b7f5@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230203180914.49112-8-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
 <20230203180914.49112-8-philmd@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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
X-TUID: Be1Vp4RP37PP

On Fri,  3 Feb 2023 19:09:02 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> No need to use the low-level QOM API when an object
> inherits from QDev. Directly use the QDev API to set
> its properties.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/scsi/scsi-bus.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
> index ceceafb2cd..a8003126c4 100644
> --- a/hw/scsi/scsi-bus.c
> +++ b/hw/scsi/scsi-bus.c
> @@ -347,11 +347,7 @@ SCSIDevice *scsi_bus_legacy_add_drive(SCSIBus *bus, =
BlockBackend *blk,
>          object_unparent(OBJECT(dev));
>          return NULL;
>      }
> -    if (!object_property_set_bool(OBJECT(dev), "share-rw", share_rw, err=
p)) {
> -        object_unparent(OBJECT(dev));
> -        return NULL;
> -    }
> -
> +    qdev_prop_set_bit(dev, "share-rw", share_rw);

likely broken, see cover letter reply
(I'm stopping here, series should be rewritten to drop unjustified conversi=
ons or commit message describe why it's safe)


>      qdev_prop_set_enum(dev, "rerror", rerror);
>      qdev_prop_set_enum(dev, "werror", werror);
> =20

