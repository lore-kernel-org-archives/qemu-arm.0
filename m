Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1130705wrq;
        Fri, 13 Jul 2018 14:26:29 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeC0+DVyQ+xNFwpzpGSSH8yWxbmzkLlVwfax1/QwEHbnH4hR4PpM3uvIecM77bfIdnVvTXL
X-Received: by 2002:ac8:36ac:: with SMTP id a41-v6mr7654455qtc.139.1531517189578;
        Fri, 13 Jul 2018 14:26:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531517189; cv=none;
        d=google.com; s=arc-20160816;
        b=vXAkHAG9d8CtP1Nmb4qZ8zxIamRGuQxzhWhBiFm/LJbpXeIVbviLmFIKMfNMwaUCoT
         zPz3ekKD4+XrIiVx3wYyekIl6I5SirGGyZk7ET7+zn5b029DqJ1Dr7U1+MMj7aDoZQ7Q
         OjD5QunzcwJvrN6aaEDIXi+L6Ma1XLkKToFWKEki7OTYqUb/hsU+Vp9EWlmlHUsVaGhP
         4vZLzmY+Z4W68v7xB1Ky1wHw79i4widnojQihdb+wIWsFLs8uL+3fP11v9SRQI4dHud8
         +ofykIfpuk6hX+Waq4PyDkrIxC2kwHir59U2gHF5Pb9iIjlBGypEYQSbZzE1V9Stgem6
         m0Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=NBni0ytqjAVD+Nbm0tTH0mA4avlOMZU6uy5nSeajtLs=;
        b=mtPhm1w3jAMYTRHJRfr/yrKyDoBhAl/yPXgeOzGdupHBnYjj7SvHrbrTZ8G0+BNTIp
         5+X95jWbSAm0I4lnhY7Z6CJdr0Q5Od7W2gKgLvJT5NDM9EIveczruqPUTvlb5r+tjvjv
         FL5VVYteDAJ9baC1sJIKdlTbF1qCRVVTZVCXzGhhRYl/LYiC3tZsPRhxqD7qXa9GwPwi
         caXWXTJiff4Nze97ZvR4ALqIjkKmC34hw6R6vLofywa0M9cvxt5Yw9S3QOsTN48JvP3X
         f7p/moE6lLfiPS3kC5LaNRxAkH6exeQWHyfMVGc3xCFSflWmeXqaCcUN1LIOTo0w8CZr
         mzvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o185-v6si5902323qkb.321.2018.07.13.14.26.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 14:26:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fe5a9-0007I5-2V
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 17:26:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fe5a1-0007Hy-6j
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 17:26:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fe5Zw-0002TV-9M
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 17:26:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45670)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fe5Zw-0002T9-0y; Fri, 13 Jul 2018 17:26:16 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 05149B647;
	Fri, 13 Jul 2018 21:26:15 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6CEB21948A;
	Fri, 13 Jul 2018 21:26:14 +0000 (UTC)
Date: Fri, 13 Jul 2018 18:26:13 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180713212613.GU31657@localhost.localdomain>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
	<1531470464-21522-4-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531470464-21522-4-git-send-email-thuth@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 13 Jul 2018 21:26:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 03/16] hw/arm/bcm2836: Fix crash with
 device_add bcm2837 on unsupported machines
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ajymDOJrpg/A

On Fri, Jul 13, 2018 at 10:27:31AM +0200, Thomas Huth wrote:
> When trying to "device_add bcm2837" on a machine that is not suitable for
> this device, you can quickly crash QEMU afterwards, e.g. with "info qtree":
> 
> echo "{'execute':'qmp_capabilities'} {'execute':'device_add', " \
>  "'arguments':{'driver':'bcm2837'}} {'execute': 'human-monitor-command', " \
>  "'arguments': {'command-line': 'info qtree'}}" | \
>  aarch64-softmmu/qemu-system-aarch64 -M integratorcp,accel=qtest -S -qmp stdio
> 
> {"QMP": {"version": {"qemu": {"micro": 50, "minor": 12, "major": 2},
>  "package": "build-all"}, "capabilities": []}}
> {"return": {}}
> {"error": {"class": "GenericError", "desc": "Device 'bcm2837' can not be
>  hotplugged on this machine"}}
> Segmentation fault (core dumped)
> 
> The qdev_set_parent_bus() from instance_init adds a link to the child devices
> which is not valid anymore after the bcm2837 instance has been destroyed.
> Unfortunately, the child devices do not get destroyed / unlinked correctly
> because both object_initialize() and object_property_add_child() increase
> the reference count of the child objects by one, but only one reference
> is dropped when the parent gets removed. So let's use the new functions
> object_initialize_child() and sysbus_init_child_obj() instead to create
> the objects, which will take care of creating the child objects with the
> correct reference count of one.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

The usage of &error_abort in code that can be triggered from
device-list-properties still makes me nervous, but that's a
separate issue.


> ---
>  hw/arm/bcm2836.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 6805a7d..af97b2f 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -51,25 +51,19 @@ static void bcm2836_init(Object *obj)
>      int n;
>  
>      for (n = 0; n < BCM283X_NCPUS; n++) {
> -        object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
> -                          info->cpu_type);
> -        object_property_add_child(obj, "cpu[*]", OBJECT(&s->cpus[n]),
> -                                  &error_abort);
> +        object_initialize_child(obj, "cpu[*]", &s->cpus[n], sizeof(s->cpus[n]),
> +                                info->cpu_type, &error_abort);
>      }
>  
> -    object_initialize(&s->control, sizeof(s->control), TYPE_BCM2836_CONTROL);
> -    object_property_add_child(obj, "control", OBJECT(&s->control), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->control), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "control", &s->control, sizeof(s->control),
> +                          TYPE_BCM2836_CONTROL);
>  
> -    object_initialize(&s->peripherals, sizeof(s->peripherals),
> -                      TYPE_BCM2835_PERIPHERALS);
> -    object_property_add_child(obj, "peripherals", OBJECT(&s->peripherals),
> -                              &error_abort);
> +    sysbus_init_child_obj(obj, "peripherals", &s->peripherals,
> +                          sizeof(s->peripherals), TYPE_BCM2835_PERIPHERALS);
>      object_property_add_alias(obj, "board-rev", OBJECT(&s->peripherals),
>                                "board-rev", &error_abort);
>      object_property_add_alias(obj, "vcram-size", OBJECT(&s->peripherals),
>                                "vcram-size", &error_abort);
> -    qdev_set_parent_bus(DEVICE(&s->peripherals), sysbus_get_default());
>  }
>  
>  static void bcm2836_realize(DeviceState *dev, Error **errp)
> -- 
> 1.8.3.1
> 

-- 
Eduardo
