Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp2697519wri;
        Fri, 8 Nov 2019 07:30:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqxNDLrj7OLiZcxaW8UfLpSudTnfwS7w6P9qK6iMHPjs16xiiPbrL4B/AC5VVEhTtymGpKOb
X-Received: by 2002:a37:5a42:: with SMTP id o63mr1057961qkb.228.1573227010263;
        Fri, 08 Nov 2019 07:30:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o24si4055494qtm.50.2019.11.08.07.30.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2019 07:30:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=M192jAKw;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iT6DB-0000Sr-IW
	for alex.bennee@linaro.org; Fri, 08 Nov 2019 10:30:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48335)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1iT5xe-0000WL-6h
 for qemu-arm@nongnu.org; Fri, 08 Nov 2019 10:14:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1iT5xc-0007Yo-RF
 for qemu-arm@nongnu.org; Fri, 08 Nov 2019 10:14:05 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:60858)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1iT5xc-0007SJ-7b; Fri, 08 Nov 2019 10:14:04 -0500
Received: from [172.16.11.102] (crumble.bar.greensocs.com [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 3D63596EF0;
 Fri,  8 Nov 2019 15:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1573226041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=snqOWkI+RRcPBVTaSTEEfK/Si5NnJwmqmgoH5QVnxj8=;
 b=M192jAKwHjp7OkVe5BhPF0EaS4zVbdb25EO8EPfbGLd4Y3eyQto+F1hG+EBbqieOPaMuiI
 X1T/gsgxCfJmj7OakskWzaHkabxq5OXTbvWF6w1pq4tOPFvczU8VFiF88yj3FnO2B4A3NJ
 SdaFdqr6q7JiLPohMESqshPDkMs0Y+Y=
Subject: Re: [PATCH v5 07/13] hw/core/qdev: update hotplug reset regarding
 resettable
To: qemu-devel@nongnu.org
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-8-damien.hedde@greensocs.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <47ae7c6f-36ab-8422-9438-b6d26e3695ce@greensocs.com>
Date: Fri, 8 Nov 2019 16:14:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191018150630.31099-8-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1573226042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=snqOWkI+RRcPBVTaSTEEfK/Si5NnJwmqmgoH5QVnxj8=;
 b=mz/xNsAu1CNq/8XwbqyZd0reVpO/b2Zq5V64PZrxrXUiUmgxsGp92rdoPHHWmu8N9ueoLc
 HIw2WnOIzyTg+iDZCxnQGrnf1whqNyXNFJtacAzuGr5c6ury1o9gbiVetMuMf8XVx3ONyM
 Gg1k516kasVLbFKiyd0zQUfvBtoZRAw=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1573226042; a=rsa-sha256; cv=none;
 b=EG1pPZMxM0xrD+n7j4IDS+pSFdzPRQOk7AcMPf+kua1kRoSBhWiVelLJi2TCeDRI1nQFmK
 WrCGHMECGrLc7Q6wtmKcU2VHxtsHnT0MgNI1i/WVrMSH84RwB1hGF2oGYgk3uMqeYVvyyW
 wIIRn6ODolZ9Vtm190cNLYvBdZF0pXc=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
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
 edgari@xilinx.com, qemu-arm@nongnu.org, pbonzini@redhat.com, philmd@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tB2rEGElwuhi


On 10/18/19 5:06 PM, Damien Hedde wrote:
> This commit make use of the resettable API to reset the device being
> hotplugged during when it is realized. Also it make sure it is put in
> a reset state coherent with the parent it is plugged into.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> 
> I'm not sure I've done everything that's required here since I do not
> understand everything that's behind the hotplug and realize/unrealize.
> I'm a bit lost there...
> 
> One of the remaining question is: do we need to do things related to
> unrealize ?
> It seems, a device can be realized, unrealized, and re-realized ? But
> is that true also for a hotplugged device ?>
> Also resettable API is called there, so children if any are reset too.
> This was not the case before, this a probably not a big deal, as long
> as all children are realized too at this point. I'm not sure we have a
> guarantee on this; the recursive realize is not done in the base bus
> class so it will go only down to first buses level if it is not
> propagated by bus subclasses. Do hotplug devices can have more than
> single level bus subtree (ie: more than some child buses with no
> devices on them) ?
> ---
>  hw/core/qdev.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 3933f62d0c..c5d107ea4e 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -930,7 +930,14 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
>              }
>          }
>          if (dev->hotplugged) {

Just thinking that if it is possible to have un-realize then realize
cycle, we probably need some code here (or even before realizing
children) to ensure the reset state is zeroed before doing the following.

> -            device_legacy_reset(dev);
> +            /*
> +             * Reset the device, as well as its subtree which should be
> +             * realized too
> +             */
> +            resettable_assert_reset(OBJECT(dev), RESET_TYPE_COLD);
> +            resettable_change_parent(OBJECT(dev), OBJECT(dev->parent_bus),
> +                                     NULL);
> +            resettable_release_reset(OBJECT(dev), RESET_TYPE_COLD);
>          }
>          dev->pending_deleted_event = false;
>  
>

--
Damien

