Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6678189wrv;
        Wed, 7 Aug 2019 08:18:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyMhPaAuTY8ex0W5lFMaUAIX3fNNqNuSQPthwwJrJn7jcC/GYKYjAhdWSwNcgxak50c7ZtJ
X-Received: by 2002:a50:f7c6:: with SMTP id i6mr10277543edn.51.1565191129435;
        Wed, 07 Aug 2019 08:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565191129; cv=none;
        d=google.com; s=arc-20160816;
        b=oOo9KpcXF2F7MnZGVm4kaXrG1KnaaLWM0/RCYaPd9/DWYLY9V9FQRWEZjrYFIxtH28
         0FDlLjJEnizFzF6BogNmmMrdmeKdkCKi0HSWYZN3rCIWKCauiySUMvMaV7U1i1F4fHbu
         1U6S3u+QeR8SH8XPhd+KFCv4YB7rlHtmQg2cX+5VpCdI2UuJKy/4rQBooF59LWZGfrSH
         O2mcdR4G8cuemgoC20lTaQvqb+NaNONUuFEd1acPzp801pFkIL8XV3kmGmr2xQezQAc0
         zTorE6h4yIXsLs4u0QPquZBH1Y5I3KjtiYgKGZ64DU/VJMgMr2Xl7/mtIPRAOnImVQbw
         X70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/3goy7jwv3jhlXZ6iqzuJ6FnnNayKsh8Ov6Om64DEbg=;
        b=zPhPNZlsjgRBD5R/Mh9zNDRE+vzy2IpD652HgQtDW2rQhv1+BDvugMd+Z6qEx88us+
         4DpV4JPNmjpgnJvhqQrsdKLaeUidtn70Wl7cuBYcJzuK/AKLkn2EcJMH4D5d7SPNXqCP
         JTgiv4ULmzC7ftNT+VgZmDK/gFJbPwAljv5HYM1m0CML0tCuLmYl5xOnUPs181xvmrtu
         b8ynwxpp+e1clL1St1rg6ixgDnpIvk0IbwWwYXrTd90WOMECu+kIG7yfU4DNCwpNiAZf
         BeM+jIZf1xqT2iDLc4vuHVh1LmlNpP9kIYuGqky7mwW81/UHqnZPfkTnMzIMYt6on4Ig
         YgGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nCqkdfOW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p44si35328618edc.438.2019.08.07.08.18.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 08:18:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nCqkdfOW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvNiC-0006fY-Fw
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 11:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51756)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvNi5-0006c4-8F
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:18:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvNi3-0006va-RB
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:18:41 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39287)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvNi3-0006uv-K1
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:18:39 -0400
Received: by mail-ot1-x343.google.com with SMTP id r21so99757375otq.6
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 08:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/3goy7jwv3jhlXZ6iqzuJ6FnnNayKsh8Ov6Om64DEbg=;
 b=nCqkdfOWUSOOHrh/49bO5iS9y/BXGIvciLlidMa440NRoTvpMTNF6LP81UvSv7rPZP
 WWcQEJwemwJujGsgcQPDMrAFVt4TOIfJZ3E6XUrCIMKmFAX7LZMrS05e+dgDzHHkQfI0
 lNqTgcRfT2dgrP3GHDij+jDKXr1ffb6hDE3UvvFSBViHeFfWNtRjj43rGMk08Hzk1W96
 G+6pYtO+HGfXGExrHrcX6oebeDUwuH4nNOWP/I3rD8++iRBgeN8aGyxajWO3N8MHtp4e
 VWoQLYCnAMuuQFDMuCRyL6iYsbQxFM/VWl6EA3Kal5gGFxHmoD6xTUSD1YGeK0ya5BfR
 u02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/3goy7jwv3jhlXZ6iqzuJ6FnnNayKsh8Ov6Om64DEbg=;
 b=k6alO3MdgJeSLpUCAOOHpEHie92h4TkoEchS7p2St6bsGXrdTvc8V6bpWeRUEWJr2c
 fkd356GhAKTug4WzkW0Ab28yZOIcLBf4j3eF6xNwCnwJWP0rXDmmjxZ99a3yUA7Ptyfr
 lCxnQmh8CQMcUmdGwRdetEofO9UOUA9d0ODD+Zyb+YhUXHhqaE3FX3SX9XGTe1iDJM44
 m7QyTEYkHjjE7Si/dWZXEPbZI2QATQnwCn6pn4oxNhWsUy1AZ8/QIde6CbrY2ilfR/se
 nuVYRSET1Obp0pSgcIlGmeZKDf2DJYfcKg0A4qpzjUzxOAyGYg7m+GRDPW5EkfHLhnm5
 W9Ig==
X-Gm-Message-State: APjAAAUFYhBtMl49ZGudXWftinbgVXuKzwDf+UG8FjG+FtGZcBSXaaW5
 Mb2bqaD1QC20pmlkPba1APXRwoqn6T9bO4QP2cCQqg==
X-Received: by 2002:a5e:9319:: with SMTP id k25mr10419005iom.137.1565191118479; 
 Wed, 07 Aug 2019 08:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-9-damien.hedde@greensocs.com>
In-Reply-To: <20190729145654.14644-9-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 16:18:27 +0100
Message-ID: <CAFEAcA_M5fOoQ8yN_1QhJ-WOLxra6B-Ltwh2DHtq6erz4V0a2A@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v3 08/33] Add function to control reset with
 gpio inputs
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
Cc: Fam Zheng <fam@euphon.net>, Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 39DeLxyjqJ19

On Mon, 29 Jul 2019 at 15:59, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> It adds the possibility to add 2 gpios to control the warm and cold reset.
> With theses ios, the reset can be maintained during some time.
> Each io is associated with a state to detect level changes.
>
> Vmstate subsections are also added to the existsing device_reset
> subsection.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  hw/core/qdev-vmstate.c | 15 ++++++++++
>  hw/core/qdev.c         | 65 ++++++++++++++++++++++++++++++++++++++++++
>  include/hw/qdev-core.h | 57 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 137 insertions(+)
>
> diff --git a/hw/core/qdev-vmstate.c b/hw/core/qdev-vmstate.c
> index 24f8465c61..72f84c6cee 100644
> --- a/hw/core/qdev-vmstate.c
> +++ b/hw/core/qdev-vmstate.c
> @@ -24,10 +24,23 @@ static int device_vmstate_reset_post_load(void *opaque, int version_id)
>  {
>      DeviceState *dev = (DeviceState *) opaque;
>      BusState *bus;
> +    uint32_t io_count = 0;
> +
>      QLIST_FOREACH(bus, &dev->child_bus, sibling) {
>          bus->resetting = dev->resetting;
>          bus->reset_is_cold = dev->reset_is_cold;
>      }
> +
> +    if (dev->cold_reset_input.state) {
> +        io_count += 1;
> +    }
> +    if (dev->warm_reset_input.state) {
> +        io_count += 1;
> +    }
> +    /* ensure resetting count is coherent with io states */
> +    if (dev->resetting < io_count) {
> +        return -1;
> +    }
>      return 0;
>  }
>
> @@ -40,6 +53,8 @@ const struct VMStateDescription device_vmstate_reset = {
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(resetting, DeviceState),
>          VMSTATE_BOOL(reset_is_cold, DeviceState),
> +        VMSTATE_BOOL(cold_reset_input.state, DeviceState),
> +        VMSTATE_BOOL(warm_reset_input.state, DeviceState),

If we're just adding these fields to this VMStateDescription
then this patch should come earlier in the series than the
patch where we create and start using the fields. Otherwise
there's a migration compat break between a QEMU just
before this patch and a QEMU with it. I think the simplest
fix is to put this patch before patches 6/7 and have a note
in the commit message that this functionality can't be used
until after the patch which adds the migration support.

>          VMSTATE_END_OF_LIST()
>      },
>  };
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 88387d3743..11a4de55ea 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -450,6 +450,67 @@ void qdev_init_gpio_in(DeviceState *dev, qemu_irq_handler handler, int n)
>      qdev_init_gpio_in_named(dev, handler, NULL, n);
>  }
>
> +static DeviceResetInputState *device_get_reset_input_state(DeviceState *dev,
> +                                                            bool cold)
> +{
> +    return cold ? &dev->cold_reset_input : &dev->warm_reset_input;
> +}
> +
> +static void device_reset_handler(DeviceState *dev, bool cold, bool level)
> +{
> +    DeviceResetInputState *dris = device_get_reset_input_state(dev, cold);
> +
> +    if (dris->type == DEVICE_RESET_ACTIVE_LOW) {
> +        level = !level;
> +    }
> +
> +    if (dris->state == level) {
> +        /* io state has not changed */
> +        return;
> +    }
> +
> +    dris->state = level;
> +
> +    if (level) {
> +        resettable_assert_reset(OBJECT(dev), cold);
> +    } else {
> +        resettable_deassert_reset(OBJECT(dev));
> +    }
> +}
> +
> +static void device_cold_reset_handler(void *opaque, int n, int level)
> +{
> +    device_reset_handler((DeviceState *) opaque, true, level);
> +}
> +
> +static void device_warm_reset_handler(void *opaque, int n, int level)
> +{
> +    device_reset_handler((DeviceState *) opaque, false, level);
> +}
> +
> +void qdev_init_reset_gpio_in_named(DeviceState *dev, const char *name,
> +                                   bool cold, DeviceResetActiveType type)
> +{
> +    DeviceResetInputState *dris = device_get_reset_input_state(dev, cold);
> +    qemu_irq_handler handler;
> +
> +    switch (type) {
> +    case DEVICE_RESET_ACTIVE_LOW:
> +    case DEVICE_RESET_ACTIVE_HIGH:
> +        break;
> +    default:
> +        assert(false);
> +        break;

The usual way to write this is
    g_assert_not_reached();
(and no following 'break').


But the whole switch statement seems to be a complicated way
of writing
   assert(type == DEVICE_RESET_ACTIVE_LOW || type == DEVICE_RESET_ACTIVE_HIGH);

> +    }
> +
> +    assert(!dris->exists);
> +    dris->exists = true;
> +    dris->type = type;
> +
> +    handler = cold ? device_cold_reset_handler : device_warm_reset_handler;
> +    qdev_init_gpio_in_named(dev, handler, name, 1);
> +}

thanks
-- PMM
