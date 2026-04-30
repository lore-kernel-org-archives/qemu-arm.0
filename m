Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EB1FF8873
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 16:10:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wITy2-0002er-Rt; Thu, 30 Apr 2026 12:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wITxv-0002Vo-4X
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 12:10:15 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wITxs-00013V-Jk
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 12:10:14 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-65492d097acso1017338d50.3
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 09:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777565411; cv=none;
 d=google.com; s=arc-20240605;
 b=AI/xS071qu6zcxhiv6SOTIvz0jN+k32uiqtuFoa1+Q+O7ByYIyFTW2emMtdFMYPIr6
 EYVKoQyP3t6sqhl5V7iUwMID2B4zSMzVFNZ+HILjGAZfjJReKv1JdJf3HPFRTNTPP4Pg
 Y9gbWwhET8SjSpHp+Gs+J7CBrxIS4YAsZC7yG5snMq4Rw0ZpOkeMP1F88UtZlhq1UoDl
 R+yc4ktVJRpfnD4XXSaKxrpwAW5s82IgG1g0Px3/QLqlpfo2wk8LWG/gKkBkUgd6lmCe
 tQ9iNooGjoKmbCIlSVH6l0tWM5cEQ59/Yfc85dlAEOeXuKygTmbYz4cKWeYrQAxw+pwL
 KIRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=yIRhBPiNG2fZPL4JkXkwwlyyh7IKbh7lsx43tGMtUXg=;
 fh=2hLFU2N63d02t6JpB/A1XfvISTZyAWaPecggrvHMT54=;
 b=Gtsdng+v0LntuaGEGHGXS9j7CDzEGGd4ENqJVl/bN0HESXzPAPZq7zlnZVPw3ETaCP
 MN8+bxpBplc+vJuBlwhoQg2hEZ53kTGqPi2dUYwiLhTuCNKwPb5TgxGd+MCySZS4XpG1
 GPtmPihl1a1sUjJfaNsBncXs0PBndXgFPpqpQbkKyMAeXqeZFF6vVT7JCLuLgzYAohP3
 7ExmZDn8IMnStJnK+AyQHu77C8sQLdGj7LOB6wT1BDLHnpzkKnHt7VZYlv9bM6f0b2lr
 8PnVfkqHAWaOMdyoLBdg8wvBlP1kDaPwYbGSYnk4yWedAcx2TBirU6vDT7E+TG/mTjWs
 uXhA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777565411; x=1778170211; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yIRhBPiNG2fZPL4JkXkwwlyyh7IKbh7lsx43tGMtUXg=;
 b=ue+6m8KGWYjmpDFKfDYhUEniFARbtv3+JSp3fOlB/l4dHAY/mi5uCWp8ClpvHWJ01a
 clS8qruu9ub50BM5x7aXjZXtpSdeuo8u9P/TrXfrJpHn3AYGfmb51GcAUuYLZJ4kANEd
 9xrcIJr1EoodQdm1xTPLJp0VZ/AwQNDFJ6kBu3iOh/HvwmsjObjunW2vbLxfGfXOfQ8f
 5DsUMF/qmyVfkdE5L6QS5x7tXXN68w7WI7w4BPvbVWNp9+StJVY+fJ0YLkJMEcGFZkE1
 EEizUmH2JzfVFOguerkdHAXYG1M742OGDnNZOBjCOt+auTEg+Y+e/gnETu/0RMKnQLl1
 HpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777565411; x=1778170211;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yIRhBPiNG2fZPL4JkXkwwlyyh7IKbh7lsx43tGMtUXg=;
 b=SDdSXOXlVjlikaZiBmqbSoOokY0kTPHDqHb5uztefhT4lAIU+TmHOU97q/PzxK4Tva
 04Vq15cw88zjiDboqUA/0xkWrNh0AV2lwbV7dvuq1gEN9JyXFSGB77puAL8YJ++E7wl/
 hZSCmB3MOICJCWb4dqm6lcejmpqA9P4tWSvf2ETduaT/aZvY2srK0tJ2dkF8wlgc1j/2
 MkMpDBM5aHt9nIdxTXAZejXEfjCrEo5bYYl57EzPYvDis5o/5vgxvGrCRxnSv1JGU1PN
 4mvsEAq+DOjdvAxEzR/vEQGlFJ/a/7m886d+LxsaV07joSknWPw2T9xLzNKw7DBI0TKD
 PtGQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8bg7SePBcXDJgtDJxR5kf66g3qDdli0AVepeAFIPsnUxq229ARYnZGbIWj9bWFaxv/ZibfGWQ8bQ==@nongnu.org
X-Gm-Message-State: AOJu0YwrHhxvslRVpsqtNmx8D10tOdnnCKN8bzcVlKgxX90K3CR82YlE
 fVTBhsfDKCNbuH4GjRPILIJNzNQ9kHeL/jsAs53L08nhSVT5G50M5r8SbK4lT+s0tPHBzInVJ65
 /qEu4/wV2ZYOUp8COEVKZ4dMK2X671jFesJaGy6n51Q==
X-Gm-Gg: AeBDiesZSyejuWr+oSyjIQZ8V6tWychH34Mr6NsaClRVEbzOw4H/Luht0s2S4wPHtP7
 KLlswKVGPqVN3+KHgcZHRNrcC+Vw+UJLw4VMnDiLVEn2u1x4SIQTxAU3VJmYc/2JQL4xFSpkt8R
 cIaa8sa7Tc5Bf2Cn+x7HCLbaHP2FWThfaj5v6EpZx27Xr7BKeSY4B+vhcRI3jaUAx60MKHVtlYs
 toUzHmAbcPYHJ9psHVBz56EGctQSlPjDSzrozgogb1YFvBMyK2s2MEOFXXsqW9i8RtQ5xXdvDAB
 6PGQMlCmJ4kHWOwnyHGY7Nwxn0A5pYU/xgu4ZUOmaNpklwmmPrFMslqQbxDuI+di3w+vpI5iWQv
 eGQ==
X-Received: by 2002:a05:690e:d51:b0:64e:f106:60e5 with SMTP id
 956f58d0204a3-65c18f66c0cmr2674463d50.52.1777565410827; Thu, 30 Apr 2026
 09:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260427-qom-tests-v1-0-c413f3605311@redhat.com>
 <20260427-qom-tests-v1-29-c413f3605311@redhat.com>
In-Reply-To: <20260427-qom-tests-v1-29-c413f3605311@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2026 17:09:59 +0100
X-Gm-Features: AVHnY4Ke4Cid2FV_aVKZWaQIt0WEv-APM4TG41TEi3GLqv3C2uD5CedPrO88uOA
Message-ID: <CAFEAcA-krpQw4atHeDkCae_7EJEtUrwGNHMnYxu4eNAXdyykeQ@mail.gmail.com>
Subject: Re: [PATCH 29/41] hw/fsi: move OPBus address space init to realize
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, 
 Ninad Palsule <ninad@linux.ibm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 27 Apr 2026 at 20:45, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> The OPBus instance_init initializes an AddressSpace, registering it in
> the global address_spaces list. When a bare OPBus object is created
> and destroyed (e.g. by qom-tests), there is no finalize to remove the
> stale entry, leading to a heap-use-after-free when a subsequent
> flatviews_reset iterates the list.
>
> Move address_space_init to the bus realize callback and add the
> corresponding address_space_destroy in unrealize, following the
> NubusBus pattern. Also fix the memory_region_init owner from NULL to
> the OPBus object, so the MR is properly parented instead of dangling
> under the "unattached" container.
>
> Fixes: eb04c35da2c0 ("hw/fsi: Aspeed APB2OPB & On-chip peripheral bus")
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/fsi/aspeed_apb2opb.c | 31 +++++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
>
> diff --git a/hw/fsi/aspeed_apb2opb.c b/hw/fsi/aspeed_apb2opb.c
> index b9d72f3ecf6..5d1e471288b 100644
> --- a/hw/fsi/aspeed_apb2opb.c
> +++ b/hw/fsi/aspeed_apb2opb.c
> @@ -282,13 +282,6 @@ static void fsi_aspeed_apb2opb_realize(DeviceState *=
dev, Error **errp)
>      AspeedAPB2OPBState *s =3D ASPEED_APB2OPB(dev);
>      int i;
>
> -    /*
> -     * TODO: The OPBus model initializes the OPB address space in
> -     * the .instance_init handler and this is problematic for test
> -     * device-introspect-test. To avoid a memory corruption and a QEMU
> -     * crash, qbus_init() should be called from realize(). Something to
> -     * improve. Possibly, OPBus could also be removed.
> -     */

I think that what this TODO comment is trying to note is that
we do the qbus_init() in realize because the implementation
of the bus does things in its instance_init that it ought
to be deferring to realize. If we fix the bus to do those
things in realize instead, we ought to be able to move
this qbus_init() to the fsi_aspeed_apb2opb_init function
where it more logically belongs.

C=C3=A9dric, I think you wrote this comment; what do you think?

>      for (i =3D 0; i < ASPEED_FSI_NUM; i++) {
>          qbus_init(&s->opb[i], sizeof(s->opb[i]), TYPE_OP_BUS, DEVICE(s),
>                    NULL);
> @@ -348,15 +341,37 @@ static void fsi_opb_init(Object *o)
>  {
>      OPBus *opb =3D OP_BUS(o);
>
> -    memory_region_init(&opb->mr, 0, TYPE_FSI_OPB, UINT32_MAX);
> +    memory_region_init(&opb->mr, o, TYPE_FSI_OPB, UINT32_MAX);
> +}
> +
> +static void fsi_opb_realize(BusState *bus, Error **errp)
> +{
> +    OPBus *opb =3D OP_BUS(bus);
> +
>      address_space_init(&opb->as, &opb->mr, TYPE_FSI_OPB);
>  }
>
> +static void fsi_opb_unrealize(BusState *bus)
> +{
> +    OPBus *opb =3D OP_BUS(bus);
> +
> +    address_space_destroy(&opb->as);
> +}
> +
> +static void fsi_opb_class_init(ObjectClass *klass, const void *data)
> +{
> +    BusClass *bc =3D BUS_CLASS(klass);
> +
> +    bc->realize =3D fsi_opb_realize;
> +    bc->unrealize =3D fsi_opb_unrealize;
> +}
> +
>  static const TypeInfo opb_info =3D {
>      .name =3D TYPE_OP_BUS,
>      .parent =3D TYPE_BUS,
>      .instance_init =3D fsi_opb_init,
>      .instance_size =3D sizeof(OPBus),
> +    .class_init =3D fsi_opb_class_init,
>  };
>
>  static void fsi_opb_register_types(void)

thanks
-- PMM

