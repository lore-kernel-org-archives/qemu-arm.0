Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF235CC6B38
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Oct 2026 07:47:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHcfI-0007gl-Pv; Fri, 16 Oct 2026 03:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xHcfF-0007gB-Vu
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 03:47:42 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xHcfD-0004BG-HX
 for qemu-arm@nongnu.org; Fri, 16 Oct 2026 03:47:41 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6acbdbc1725so4126880a12.3
 for <qemu-arm@nongnu.org>; Fri, 16 Oct 2026 00:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792136858; cv=none;
 d=google.com; s=arc-20260327;
 b=fWeP+LSLC7ASZeHmqzKzcNyktKie8kpg2chfOj/OFd+DkV9qtcTRQJKowY8QCzNJvs
 QG1YiTQweGXr7AjPBe16MzFD5o1zy6ka6Hwjuby9967wK/1M45ti96QboFlE+gSRHkru
 Y27rNlJl5zBLoH7veH3BKm8D35k7ZScHcUBpW9tZ7I/UMPK+pO73Hf0c/sLS6NAtOwOD
 i8BR/UjearMOU4AxgTFImhNILiAIYeC+V1wx+F/uUM5fA8kY4nAmT3JSHlluQxqnnZNS
 qs8pWygghlQwqwW9udbyzk0yaqyWryvNsbhQGVs7E/vW9/yM1cSID/wS7Hk/8+l4retQ
 DUlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=srAuSQr6+iSCtJhUw4J2OCKggwuluEEaJwvUk6BuSYI=;
 fh=oAuOcZUSlNime28S8WPN+pxniPZYYkq2dVeRNRumoZM=;
 b=FE6kI1SspmL2h30vENYBoFgoWBtuj4qhqqG1sbTQKzlcKfBXs11ZDVDxKYrIW89WAa
 hRLV6q3H6oqnsa2Itlu3LnolWkT0A0cyfQBdouWAMU0ERojYFRPrPmA1Ig0jb7Yh3GmF
 VNg5iX7pEtVYD/x2ltHfTN8n3QfRGn3PkoT7hR3IlqUfezfkgaf1SarhTxcIIyURZHos
 h0vrl3845Odc7OBxZIsb18R1wkGcPmc6NCS62PSBLSSPW0ypa2HIQMCwQjjvxM4MuG5B
 gG7LLBgmr6IeLqs1kb4XwykqAieiObxsOkSFhmdugqmUnP8F/E0M1lFNg+3IyTBA7Y8z
 CymA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792136858; x=1792741658; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=srAuSQr6+iSCtJhUw4J2OCKggwuluEEaJwvUk6BuSYI=;
 b=d03pINP7N4OoI7M9dGjrVAOHy58e9Lx35UWWKr6iFo6l242DWl5q7gbEtFUGf/8ppE
 Mi8XNz00+PoNutbBPGh/1Z+89fy9NFbh+LexIkG3cwpeJ9NjrZQS4U68FM3gG9eu7po2
 DtUd1g8tBJTlh/g7TehWaMOfg08xKWfoOPvLOpN/EIbiHWklI2u6Qu5ewg0pdbfHghGO
 cyNmin6rrXrLT0lWLUMquRg1rJB7fPm6imRGqAHWPKeYUSql/azl4N0bBCLs/hlrRahU
 DfUjZPbaR7BX2hAXroUTumWqAuImNWPSKN9QiPLlmDONUEIfE7xpBVFs9i1gEjEcDw66
 buvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792136858; x=1792741658;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=srAuSQr6+iSCtJhUw4J2OCKggwuluEEaJwvUk6BuSYI=;
 b=msyH0gwHPWcB62Xq1qPHRMWK+Cxe50I4gY1epgvp7uqJELtDGPDIDkCoVVDwOz34bl
 kHYlDOfLs6Ar1qwtJZjzd8LPMfy2ycyC15jutmzi2cMU53ViiuLMcLCTpGFw0CXn+TB5
 KQBWE79xcS1hLCwahPltnvx1FGM2FHa6gbCZ6OaZEmKaYf6tUJiPVaEqYS0JnsEvNpGu
 gjpugiZXpkKxM9d3iX1lLJ8JtXYX6MEXFrA6aFEgQFPywRU9FEZVsBixeRgHwga8/Dj0
 PCe0SrG59ywH5ZGhx8WlMhJK/mBxBKi85j50uB3Pg0Zxmdu+xGwB3HPVd4WZkfeNCy6q
 gkkg==
X-Forwarded-Encrypted: i=1;
 AKwUvBx4KIJ+SeLQsf2zMMz2yNskgdmfRbrkl+F/uc5sJHf7mzB96CM5qQTu7Qv8y7GZmiH3hW4lTcDx5g==@nongnu.org
X-Gm-Message-State: AFq9FYK/PVGRkBG3tARte2sq038QvrkcoWi1f/cqiVvXdbW+9tiY+URa
 sBtDOfdlGenekFaSQHiSLnH3We044L+9GPzGz5IMYi/EsB4JZYQrOq+qcRUfhPb4lBMPQEOo8kJ
 DeM0plWWuy3HJQeb9JjcIz0Omr2l2n0E=
X-Gm-Gg: AYBFou0jQn4v5T5CG38FyuJxkavMXcA81OmjVGD+79cwvrOHnWhXf5643UVaNIE99Yw
 GQ6m9P7rw3MYq9KU6clwrmXzkaZdur264r+sZn3s/ggaR7M/q6YQQPI//tFkSLCBwnyF621FF7f
 iThcZMZXhTSPhpoedQg0ZVFYnoQ3KWnzT2oW34jWkE3yoZ5/kxE9jYXz1cYvGGlzLIaqIqHeVwl
 ivRJ+NuI0iv151yLzLWO46fio6JcIbR67TX+28NuDfIQqbfGKr4FyAYznPi3fF8waKgEbv3ID2v
 Z7aLZ0aSg7E700w9AKnWhq0c258hwzZ/nSFVzaFx39Xdc+9cRURDULU=
X-Received: by 2002:a05:6402:1ccf:b0:6aa:b341:3f9a with SMTP id
 4fb4d7f45d1cf-6b17c28f210mr16510987a12.39.1792136857665; Fri, 16 Oct 2026
 00:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20261014094224.1976-1-luoyonggang@gmail.com>
 <8f2da1a8-25fa-4773-a9f0-1da56c0d29d4@oss.qualcomm.com>
In-Reply-To: <8f2da1a8-25fa-4773-a9f0-1da56c0d29d4@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Fri, 16 Oct 2026 15:47:25 +0800
X-Gm-Features: AclHuK961PcyDjAqx7lE3pGkFXe3kzF7S4W5Wqbv6ZxBAtsQQWgQ686oeQ4dxRI
Message-ID: <CAE2XoE-0B9nc9T_Mn8+HU1h_tKscJYKX1biZ=Lf+p+aMmuxKvg@mail.gmail.com>
Subject: Re: [PATCH 16/34] hw/virtio/virtio-mem: Avoid call to target_info()
 in class_init
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Cornelia Huck <cohuck@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>, Eric Blake <eblake@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, 
 Ani Sinha <anisinha@redhat.com>, qemu-s390x@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 David Hildenbrand <david@kernel.org>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Zhao Liu <zhao1.liu@intel.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-riscv@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier <laurent@vivier.eu>, 
 Fabiano Rosas <farosas@suse.de>, Song Gao <17746591750@163.com>,
 Fam Zheng <fam@euphon.net>, 
 Markus Armbruster <armbru@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 Chao Liu <chao.liu@processmission.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Darren Kenny <darren.kenny@oracle.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Oct 15, 2026 at 1:22=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 10/14/2026 2:41 AM, Yonggang Luo wrote:
> > Done by merge virtio_mem_legacy_guests_properties into virtio_mem_prope=
rties.
> > As we already have vmem->unplugged_inaccessible handle in virtio_mem_de=
vice_realize
> > So we can reject the wrong option in virtio_mem_device_realize, then th=
e call
> > target_info() in class_init no need anymore.
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > ---
> >  hw/virtio/virtio-mem.c | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
> >
> > diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> > index a4110d61312..81e2192c2fb 100644
> > --- a/hw/virtio/virtio-mem.c
> > +++ b/hw/virtio/virtio-mem.c
> > @@ -879,7 +879,11 @@ static void virtio_mem_device_realize(DeviceState =
*dev, Error **errp)
> >              break;
> >          }
> >      } else {
> > -        vmem->unplugged_inaccessible =3D ON_OFF_AUTO_ON;
> > +        if (vmem->unplugged_inaccessible !=3D ON_OFF_AUTO_ON) {
> > +            error_setg(errp, "'%s' must be 'on' on non-x86 targets",
> > +                       VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP);
> > +            return;
> > +        }
> >      }
> >
> >      if (vmem->dynamic_memslots &&
> > @@ -1568,9 +1572,6 @@ static const Property virtio_mem_properties[] =3D=
 {
> >                       early_migration, true),
> >      DEFINE_PROP_BOOL(VIRTIO_MEM_DYNAMIC_MEMSLOTS_PROP, VirtIOMEM,
> >                       dynamic_memslots, false),
> > -};
> > -
> > -static const Property virtio_mem_legacy_guests_properties[] =3D {
> >      DEFINE_PROP_ON_OFF_AUTO(VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP, Vi=
rtIOMEM,
> >                              unplugged_inaccessible, ON_OFF_AUTO_ON),
> >  };
> > @@ -1635,9 +1636,6 @@ static void virtio_mem_class_init(ObjectClass *kl=
ass, const void *data)
> >      RamDiscardSourceClass *rdsc =3D RAM_DISCARD_SOURCE_CLASS(klass);
> >
> >      device_class_set_props(dc, virtio_mem_properties);
> > -    if (virtio_mem_has_legacy_guests()) {
> > -        device_class_set_props(dc, virtio_mem_legacy_guests_properties=
);
> > -    }
> >      dc->vmsd =3D &vmstate_virtio_mem;
> >
> >      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>
> Not sure what happened with the sending, but it seems like this series
> has been split in two threads.

I accidentally broke the sending procedure, till I found it's too
late, what I am confused about is why when I recover to send
the rest, it's not in the same threads. I am using git-publish.


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

