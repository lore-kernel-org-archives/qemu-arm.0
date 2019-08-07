Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6643876wrv;
        Wed, 7 Aug 2019 07:49:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxu1nHO3rJfYQW3/SYQhadLEw2sUYdn+QzJVolhnU+DBALHjMLauQX5kY/Ds6epCOHPQAzQ
X-Received: by 2002:a17:906:6d06:: with SMTP id m6mr845856ejr.166.1565189357797;
        Wed, 07 Aug 2019 07:49:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565189357; cv=none;
        d=google.com; s=arc-20160816;
        b=l+K/anjAxt8ji+gs0aKRQYHrczjcTAhH1/aLGeH+XaeG3Z0VuLJfnwy6g0mxKju1tB
         tHSj3AIausegr3hyZV+G9z+JXFGdWxh2Y5TUP90A5RPaGDvc0YHHdgUb+tmHwhLPsRaI
         mMinIgXPOnKTWf2i9BYd+z5ECzC/bq7w6F6BQ++uIJrtSD5ulEWyDVdC6BohRcBuF4Mo
         b9qsi/lKIlebXaUxAuxVLxI4fSVy/AYJ1rz1UgwhDVdk8nE9VpqjS6Gpxcnq3HgaUIcy
         4eHQyBX4cjQXxEf15+SfbBPGCHiVBFXPCiXal7Wi6YcKoElWYzPGY0mJdDmGorS08wPu
         jsgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xcs8eszuqoo75MPHipKVwOdBKi8vP3Ou/V7cEZfAmDM=;
        b=QHM3IRYgnUTc36kBSz3wjxISWhCafMKuYIQI9PVe+kciC+AH/43sbSF0GYLhmbI04P
         7PfS7xuimuXZpeUngVRxT3/DegRmGranIonEOCtwrD7ZFSypG3yuM01q56FHIQC26l7l
         KBbcNxpSfrclJbMW2hyuPZxvU7EBu6HaJrcs84NmhrLneht8OlGRQ0J7sm4unn1ByxaR
         qsTaPWhSEHEtiHXvOW4NqkeaUvQxoTxhnNXX2f+ymoKV0tyUo9oZCOySK+EX4WSKNj/7
         N+iEDbHSwcEjQzjibOY+T786sua8ZhZ1HIStZNE/45GSlb3YyKKiRk7722z6N/yCqZ0f
         vH4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s8KNTiLF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8si35018128edb.251.2019.08.07.07.49.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 07:49:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s8KNTiLF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvNFc-0007jS-SN
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 10:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44517)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvNEw-0006ib-O1
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 10:48:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvNEv-0006Xi-4C
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 10:48:34 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42748)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvNEu-0006U8-SO
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 10:48:33 -0400
Received: by mail-ot1-x343.google.com with SMTP id l15so105332395otn.9
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 07:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xcs8eszuqoo75MPHipKVwOdBKi8vP3Ou/V7cEZfAmDM=;
 b=s8KNTiLFjmIPG8oLZ/GxijanephAJui6nVR+rHZ7VPnbcvCyimWuBAoa8Qnqx8L63P
 pCtDFz4392cPrAKnXAL9JJWEkUKqNkdqtQwz2IEdskBfCGwvvXkkVbTz5HBn4I5b7F/G
 AFISfvOYY7fg7OrsbZNMG4cwKQOohplmr+yJQyaZvySAxPL9a47sAPxZKEd/P3VT/zp2
 RrZrqlxg1Rdn7Kf3vy1i/DV0/R8X9wpkGGfht9pGalTp7VF+5OMTpGykhjSbERN3uB+c
 NJhmxLQK9nEYsPVlC+E+R1lAU/whSR1Q+TjKlUMy2hMtKbIUP1ISNDvBb/mM3NqmQE8Q
 kf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xcs8eszuqoo75MPHipKVwOdBKi8vP3Ou/V7cEZfAmDM=;
 b=otsDjCFoNl2KlFN7w+qpbkea1i1J3XW2/O4DVTeryfuKVLvzyoTMTn1nY5pUuKOzUQ
 Vl6byCv/wV7+N/6APStNt/EWSW2pgxv05qUaqK9bezs4MooFAVDZ4CW5qK0VgFhsd22Z
 wrIluYIWPHlRSvz7IEg6xHh50aOwZHatbpOCRQ3FoXyS5jqDdMb8OtTnEqyZb1MTgzoF
 L9+u9FnDtMfjcje5QBSIUAfAo7gwsB437XeFXHOhmcxgOBh52VTSL1rcaRuTZom/xe/c
 MQwJiYQHucNzc/iqkAuDG7js/diLstC/RQvgKoqdT9NkwicFzNAunl2D0wZfDAfQTvgl
 fCIg==
X-Gm-Message-State: APjAAAXbBju2PhSt4Zt0t6fpOl9JEwATaNJQAWux3La3VsRlPR5AhqEn
 KGDxA6e7p5VA2Vg4mc0ppWcGmGTVGGXELSWHIAzYpA==
X-Received: by 2002:aca:ac48:: with SMTP id v69mr235392oie.48.1565189308794;
 Wed, 07 Aug 2019 07:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-6-damien.hedde@greensocs.com>
In-Reply-To: <20190729145654.14644-6-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 15:48:18 +0100
Message-ID: <CAFEAcA9+ivkBKgZ83qVE8LKuyQvng6m_85oyj6G1kx0bu86NUQ@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v3 05/33] Switch to new api in qdev/bus
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
X-TUID: TSyg9oByZHu2

On Mon, 29 Jul 2019 at 15:58, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Deprecate old reset apis and make them use the new one while they
> are still used somewhere.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  hw/core/qdev.c         | 22 +++-------------------
>  include/hw/qdev-core.h | 28 ++++++++++++++++++++++------
>  2 files changed, 25 insertions(+), 25 deletions(-)
>
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 559ced070d..e9e5f2d5f9 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -312,25 +312,9 @@ static void device_foreach_reset_child(Object *obj, void (*func)(Object *))
>      }
>  }
>
> -static int qdev_reset_one(DeviceState *dev, void *opaque)
> -{
> -    device_legacy_reset(dev);
> -
> -    return 0;
> -}
> -
> -static int qbus_reset_one(BusState *bus, void *opaque)
> -{
> -    BusClass *bc = BUS_GET_CLASS(bus);
> -    if (bc->reset) {
> -        bc->reset(bus);
> -    }
> -    return 0;
> -}
> -
>  void qdev_reset_all(DeviceState *dev)
>  {
> -    qdev_walk_children(dev, NULL, NULL, qdev_reset_one, qbus_reset_one, NULL);
> +    device_reset(dev, false);
>  }
>
>  void qdev_reset_all_fn(void *opaque)
> @@ -340,7 +324,7 @@ void qdev_reset_all_fn(void *opaque)
>
>  void qbus_reset_all(BusState *bus)
>  {
> -    qbus_walk_children(bus, NULL, NULL, qdev_reset_one, qbus_reset_one, NULL);
> +    bus_reset(bus, false);
>  }
>
>  void qbus_reset_all_fn(void *opaque)
> @@ -922,7 +906,7 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
>              }
>          }
>          if (dev->hotplugged) {
> -            device_legacy_reset(dev);
> +            device_reset(dev, true);
>          }
>          dev->pending_deleted_event = false;

The other changes here don't change the semantics, but this
one does -- previously we were only resetting this specific
device and now we're resetting both the device and its children.
I think it belongs as its own patch in with the other
"remove device_legacy_reset call" patches.

>
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index eeb75611c8..1670ae41bb 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -109,6 +109,11 @@ typedef struct DeviceClass {
>      bool hotpluggable;
>
>      /* callbacks */
> +    /*
> +     * Reset method here is deprecated and replaced by methods in the
> +     * resettable class interface to implement a multi-phase reset.
> +     * TODO: remove once every reset callback is unused
> +     */
>      DeviceReset reset;
>      DeviceRealize realize;
>      DeviceUnrealize unrealize;
> @@ -455,19 +460,22 @@ bool bus_is_resetting(BusState *bus);
>   */
>  bool bus_is_reset_cold(BusState *bus);
>
> -void qdev_reset_all(DeviceState *dev);
> -void qdev_reset_all_fn(void *opaque);
> -
>  /**
> - * @qbus_reset_all:
> - * @bus: Bus to be reset.
> + * qbus/qdev_reset_all:
> + * @bus/dev: Bus/Device to be reset.
>   *
> - * Reset @bus and perform a bus-level ("hard") reset of all devices connected
> + * Reset @bus/dev and perform a bus-level reset of all devices/buses connected
>   * to it, including recursive processing of all buses below @bus itself.  A
>   * hard reset means that qbus_reset_all will reset all state of the device.
>   * For PCI devices, for example, this will include the base address registers
>   * or configuration space.
> + *
> + * Theses functions are deprecated, please use device/bus_reset or

"these"

> + * resettable_reset_* instead
> + * TODO: remove them when all occurence are removed

"occurrences" (two 'r's, plural with 's'), here and below

>   */

The comment here says that qbus_reset_all() does a "hard" reset,
which presumably is equivalent to a 'cold' reset, but the
code in our new implementation passes cold = false.

> +void qdev_reset_all(DeviceState *dev);
> +void qdev_reset_all_fn(void *opaque);
>  void qbus_reset_all(BusState *bus);
>  void qbus_reset_all_fn(void *opaque);
>
> @@ -489,9 +497,17 @@ void qdev_machine_init(void);
>   * device_legacy_reset:
>   *
>   * Reset a single device (by calling the reset method).
> + *
> + * This function is deprecated, please use device_reset() instead.
> + * TODO: remove the function when all occurences are removed.
>   */
>  void device_legacy_reset(DeviceState *dev);
>
> +/**
> + * device_class_set_parent_reset:
> + * TODO: remove the function when DeviceClass's reset method
> + * is not used anymore.
> + */
>  void device_class_set_parent_reset(DeviceClass *dc,
>                                     DeviceReset dev_reset,
>                                     DeviceReset *parent_reset);
> --
> 2.22.0

thanks
-- PMM
