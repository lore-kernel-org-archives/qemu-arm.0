Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp161456wri;
        Thu, 31 Oct 2019 16:36:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxLdyH8wuXjuen77/lUME30QGJmOsWrdbDHOOXn0B7h+WwptKapLIAL6ruoYB5/eMx89j7M
X-Received: by 2002:ad4:494b:: with SMTP id o11mr7569291qvy.82.1572564963802;
        Thu, 31 Oct 2019 16:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572564963; cv=none;
        d=google.com; s=arc-20160816;
        b=dtCakum8Wo90CjA5bQa2+0laCmbb5wDGtSRCmk/7whp51oQvxuOnuCan+oqncWUAXr
         2U+oH4gqTtLCHzx68Sc8dRzkDEj3x/poPYduo+XDiRZU+mSgTBb2ty8CK4kMry95C9Yo
         L16zFTeZIQEb29ZCrXEIu3LBPvWftAhwAm2thbrtRtJT6i8ylAMAV7F8hGtOKWqc1U/Y
         fI1X366K8+xT4qE9AW4bLErnk0P3OAXpHWNorVG7FIZJQBX1ICaavLFaEisSror1Loet
         sQdbzUtnFIFyACnfE7GlOohD8VhAvdVuWIqwuqukHtU/4t9QQxMEK1Uw+aNMaFVL/Qbx
         lWAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=8fqZedSWg3sgblcn8d7s7o2YV571srdkHrQKacCZKhQ=;
        b=xGRqY93PQUKXqFYpeEzvHGbwMzY09ADrLe1JuCxgy09y36MRnrySSdVkmO3A8N7U2g
         vSusvD7Y6OqIwLo2XcRC3E1t+x5Du6q7TrEsVp85yjHeRVPmG1nt5Q0IOKkWXTZBXVNO
         O5k4xeNdLfvXYReeupWHntEnGbLTwcnrbQMhAO1o+euIEoT18yErVQPAvVOUTM1d/PxG
         4huWW4zZYKCljUOzyoEagMtLC6H8Xzoat5DsFKT8bR6VtCJ+MAKlWsYZBNFdV/JXFeeN
         3Ky6N8nZWPQ7zj0sl7csg/gCaZhRX/rC8RUjtXMSKr1wTRfsz2WHlco9Qnu/qKEzAlRZ
         2ZUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12si6057310qtq.182.2019.10.31.16.36.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2019 16:36:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iQJz1-0003G0-7e
	for alex.bennee@linaro.org; Thu, 31 Oct 2019 19:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51897)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iQJyn-0003FK-27
 for qemu-arm@nongnu.org; Thu, 31 Oct 2019 19:35:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iQJyk-0003pL-Sc
 for qemu-arm@nongnu.org; Thu, 31 Oct 2019 19:35:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59524)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iQJyk-0003mI-Jb
 for qemu-arm@nongnu.org; Thu, 31 Oct 2019 19:35:46 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BBB67C056807
 for <qemu-arm@nongnu.org>; Thu, 31 Oct 2019 23:35:44 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id y14so1552757wmi.4
 for <qemu-arm@nongnu.org>; Thu, 31 Oct 2019 16:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8fqZedSWg3sgblcn8d7s7o2YV571srdkHrQKacCZKhQ=;
 b=tCQwFhHHaBOnMN6Ll4tY9PTipp5A3z8sDv3p5YAoez3B05u2E89UDZK7kNqeMLLjRg
 M7U1iMIPr7CnAEvWYPUAE0sFBCq40+KAqcZAtnasVCVzOXSQxw6JDtPeXAQDzNO3Tfij
 QxqQkJI92fTqS+fRDQ/3b5+gyNi4UpW+ejY/iAaEeq9nK09ynIuHWk9m8WCDYvbzRdoU
 iSSCzYGwWwZKYgfMjjcG7ix9IliGdZm5bbCH3zGeaXzqhBNPiDNrz9+HwM9EzFN/1PGd
 isK6MmJ7Fvgckn2BUWHtAt5V9ZESd6YnK/z6o8KIn+aY5RoZPIwkMcie21Ln27zawFNc
 fGVA==
X-Gm-Message-State: APjAAAXBn3JBg6sPXGUPESG5QzlsKQyLrqm5MIonNOy0cnzP8ZWXM3AB
 QgTIyTHKg+ANJFrLItygGyHu++R6m4d5V4t5Y8NbxazOPKsF9z5JaaY03OaP0YMESkcjkPOhJsA
 dIQf7Dgn76kMt
X-Received: by 2002:a1c:a556:: with SMTP id o83mr7288695wme.165.1572564943457; 
 Thu, 31 Oct 2019 16:35:43 -0700 (PDT)
X-Received: by 2002:a1c:a556:: with SMTP id o83mr7288668wme.165.1572564943186; 
 Thu, 31 Oct 2019 16:35:43 -0700 (PDT)
Received: from [192.168.20.58] (94.222.26.109.rev.sfr.net. [109.26.222.94])
 by smtp.gmail.com with ESMTPSA id s12sm5946447wme.20.2019.10.31.16.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2019 16:35:42 -0700 (PDT)
Subject: Re: [PATCH v5 08/13] hw/core: deprecate old reset functions and
 introduce new ones
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-9-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <41ee0633-c8c8-10ce-1372-4804f25273d0@redhat.com>
Date: Fri, 1 Nov 2019 00:35:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191018150630.31099-9-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, ehabkost@redhat.com,
 cohuck@redhat.com, mark.burton@greensocs.com, qemu-s390x@nongnu.org,
 edgari@xilinx.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bpLLOIX6RApB

On 10/18/19 5:06 PM, Damien Hedde wrote:
> Deprecate device_legacy_reset(), qdev_reset_all() and
> qbus_reset_all() to be replaced by new functions
> device_cold_reset() and bus_cold_reset() which uses resettable API.
> 
> Also introduce resettable_cold_reset_fn() which may be used as a
> replacement for qdev_reset_all_fn and qbus_reset_all_fn().
> 
> Following patches will be needed to look at legacy reset call sites
> and switch to resettable api. The legacy functions will be removed
> when unused.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> 
> I've removed the general helpers
> + device_reset(DeviceState *dev, ResetType type)
> + bus_reset(BusState *dev, ResetType type)
> because with several reset types, all devices and buses will not
> implement all of them. I think it is preferable to define a
> type-specific helper every time it is needed for base classes
> implementing the reset type (eg a device_pci_reset(PciDev*) for the
> pci reset type if add that).

Agreed.

> So device_reset()/bus_reset() symbol names are not taken anymore. I
> don't have a strong opinion of what names should have the
> device_cold_reset() and bus_cold_reset() function added in this
> patch. It could be device/bus_hard_reset() (the current
> qbus_reset_all() comment mention we do a "hard" reset) or simply
> device/bus_reset() or anything else.
> What do you think ? Any better idea ? It should be consistent with
> the reset type name but we can change it also if cold is not what we
> want.

Cold/hot are self-illustrative so seems fine. Hard/soft are used in 
electronic but less in software I'd say.

> Note that if we don't settle for device/bus_reset(). We can drop
> the first patch that renames device_reset() to device_legacy_reset()
> ---
>   hw/core/bus.c           |  5 +++++
>   hw/core/qdev.c          |  5 +++++
>   hw/core/resettable.c    |  5 +++++
>   include/hw/qdev-core.h  | 27 +++++++++++++++++++++++++++
>   include/hw/resettable.h |  9 +++++++++
>   5 files changed, 51 insertions(+)
> 
> diff --git a/hw/core/bus.c b/hw/core/bus.c
> index 7c05e80db8..5f9e261bb2 100644
> --- a/hw/core/bus.c
> +++ b/hw/core/bus.c
> @@ -68,6 +68,11 @@ int qbus_walk_children(BusState *bus,
>       return 0;
>   }
>   
> +void bus_cold_reset(BusState *bus)
> +{
> +    resettable_reset(OBJECT(bus), RESET_TYPE_COLD);
> +}
> +
>   bool bus_is_in_reset(BusState *bus)
>   {
>       return resettable_is_in_reset(OBJECT(bus));
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index c5d107ea4e..3e6600ce76 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -335,6 +335,11 @@ void qbus_reset_all_fn(void *opaque)
>       qbus_reset_all(bus);
>   }
>   
> +void device_cold_reset(DeviceState *dev)
> +{
> +    resettable_reset(OBJECT(dev), RESET_TYPE_COLD);
> +}
> +
>   bool device_is_in_reset(DeviceState *dev)
>   {
>       return resettable_is_in_reset(OBJECT(dev));
> diff --git a/hw/core/resettable.c b/hw/core/resettable.c
> index 60d4285fcc..3d3200bdbc 100644
> --- a/hw/core/resettable.c
> +++ b/hw/core/resettable.c
> @@ -252,6 +252,11 @@ void resettable_change_parent(Object *obj, Object *newp, Object *oldp)
>       }
>   }
>   
> +void resettable_cold_reset_fn(void *opaque)
> +{
> +    resettable_reset((Object *) opaque, RESET_TYPE_COLD);

Why not take a Object* argument?

> +}
> +
>   void resettable_class_set_parent_phases(ResettableClass *rc,
>                                           ResettableEnterPhase enter,
>                                           ResettableHoldPhase hold,
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 2e3346600e..1e88cb2f6a 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -386,6 +386,13 @@ int qdev_walk_children(DeviceState *dev,
>                          qdev_walkerfn *post_devfn, qbus_walkerfn *post_busfn,
>                          void *opaque);
>   
> +/**
> + * @qdev_reset_all:
> + * Reset @dev. See @qbus_reset_all() for more details.
> + *
> + * Note: This function is deprecated and will be removed when it becomes unused.
> + * Please use device_cold_reset() now.
> + */
>   void qdev_reset_all(DeviceState *dev);
>   void qdev_reset_all_fn(void *opaque);
>   
> @@ -398,10 +405,28 @@ void qdev_reset_all_fn(void *opaque);
>    * hard reset means that qbus_reset_all will reset all state of the device.
>    * For PCI devices, for example, this will include the base address registers
>    * or configuration space.
> + *
> + * Note: This function is deprecated and will be removed when it becomes unused.
> + * Please use bus_cold_reset() now.
>    */
>   void qbus_reset_all(BusState *bus);
>   void qbus_reset_all_fn(void *opaque);
>   
> +/**
> + * device_cold_reset:
> + * Reset device @dev and perform a recursive processing using the resettable
> + * interface. It triggers a RESET_TYPE_COLD.
> + */
> +void device_cold_reset(DeviceState *dev);
> +
> +/**
> + * bus_cold_reset:
> + *
> + * Reset bus @bus and perform a recursive processing using the resettable
> + * interface. It triggers a RESET_TYPE_COLD.
> + */
> +void bus_cold_reset(BusState *bus);
> +
>   /**
>    * device_is_in_reset:
>    * Return true if the device @dev is currently being reset.
> @@ -432,6 +457,8 @@ void qdev_machine_init(void);
>    * device_legacy_reset:
>    *
>    * Reset a single device (by calling the reset method).
> + * Note: This function is deprecated and will be removed when it becomes unused.
> + * Please use device_cold_reset() now.
>    */
>   void device_legacy_reset(DeviceState *dev);
>   
> diff --git a/include/hw/resettable.h b/include/hw/resettable.h
> index f6d379669f..6a9e17344e 100644
> --- a/include/hw/resettable.h
> +++ b/include/hw/resettable.h
> @@ -198,6 +198,15 @@ bool resettable_is_in_reset(Object *obj);
>    */
>   void resettable_change_parent(Object *obj, Object *newp, Object *oldp);
>   
> +/**
> + * resettable_cold_reset_fn:
> + * Helper to call resettable_reset((Object *) opaque, RESET_TYPE_COLD).
> + *
> + * This function is typically useful to register a reset handler with
> + * qemu_register_reset.
> + */
> +void resettable_cold_reset_fn(void *opaque);
> +
>   /**
>    * resettable_class_set_parent_phases:
>    *
> 
