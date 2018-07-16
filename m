Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1861912wru;
        Mon, 16 Jul 2018 12:49:00 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeFnBUwnoI4Ck8tDzbF1A3Tfd4Qt+wtB8BzO9z5kxyR9+O0OMRhZJ8ggDo8YDmO7GTikuG+
X-Received: by 2002:a37:7ac5:: with SMTP id v188-v6mr15433090qkc.262.1531770540435;
        Mon, 16 Jul 2018 12:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531770540; cv=none;
        d=google.com; s=arc-20160816;
        b=e6yexklHDkDrcYKzBNxaLiovDNHV1T8psnN/mcvGZ/CxiOkkUykTpVFtKNJR1xjhYt
         sUZn3E/p6KEE26mFw6eC/k3DZTUBG0DIlDWQUuEY+UthQTBDbzhAt6+1Q0sS2ZeTfDKJ
         t9sHP+w8p3xSMgdjtsdWUgKrSlm4394j8AJ/MtN7QQw5AIJ0cwMNt5glzgzxjCSOX7OK
         uT1Yf/GqvQg9s5zBaiiml42D7God06FNkFYqhj7aCsHTHO2WXGsWI39rZUwvivzTOh4I
         YIpdr4mZY/KylDIsO2uxVJwvEOCfOBHDIdoJ/gl8spxzAkj4ORrVmBAAL7pYqUC07Fpi
         bZdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=LWJmJ2kkeD8kZvL68D45bOHCEPTj/xAknYHJQs3LbG8=;
        b=F6L3+wtKb1WFXdI0JR/PXxorAIipiWgcLCrZFy9FeqN8PyaKr7wV+x0kSJJ6uY2yGq
         C7Hk6Y5275I5KrArOrxFDfBPU9kIa1tDhDCmqvFrlwUdxi9ioKkBNFDkpoWLyACNEx7v
         2vdgYWi0/qSO3kUpbpQ648ASq+J6Qlht7hxwOHuTzFKymRxgqaAWLY/l11mzPQxscvP+
         kFsUN0kcy9is6WleJjNFBSNpHOIo1lZBasBhDB+65we/aFrO1n14vO8nbCVsbgZ7azhS
         th09C85Jg0ot3Scu+X3v0ptJ2rCC8O/XwqFY+ibOlj71qjZKGMgedeXaZamuIyzQx2KD
         80bw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c5-v6si22484901qke.78.2018.07.16.12.49.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 12:49:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53425 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff9UR-0002LG-Qz
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 15:48:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ff9UJ-0002L8-Np
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 15:48:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ff9UE-0006cD-N8
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 15:48:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59192)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1ff9UE-0006c3-HE; Mon, 16 Jul 2018 15:48:46 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3AD0830A3AFE;
	Mon, 16 Jul 2018 19:48:45 +0000 (UTC)
Received: from localhost (ovpn-116-6.gru2.redhat.com [10.97.116.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E3885D9C7;
	Mon, 16 Jul 2018 19:48:44 +0000 (UTC)
Date: Mon, 16 Jul 2018 16:48:43 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180716194843.GM31657@localhost.localdomain>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
	<1531470464-21522-4-git-send-email-thuth@redhat.com>
	<20180713212613.GU31657@localhost.localdomain>
	<b4d13b88-e758-2fde-d290-0fdd00b524b2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4d13b88-e758-2fde-d290-0fdd00b524b2@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 16 Jul 2018 19:48:45 +0000 (UTC)
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
X-TUID: bek6ICBLhN9v

On Mon, Jul 16, 2018 at 09:09:13AM +0200, Thomas Huth wrote:
> On 13.07.2018 23:26, Eduardo Habkost wrote:
> > On Fri, Jul 13, 2018 at 10:27:31AM +0200, Thomas Huth wrote:
> >> When trying to "device_add bcm2837" on a machine that is not suitable for
> >> this device, you can quickly crash QEMU afterwards, e.g. with "info qtree":
> >>
> >> echo "{'execute':'qmp_capabilities'} {'execute':'device_add', " \
> >>  "'arguments':{'driver':'bcm2837'}} {'execute': 'human-monitor-command', " \
> >>  "'arguments': {'command-line': 'info qtree'}}" | \
> >>  aarch64-softmmu/qemu-system-aarch64 -M integratorcp,accel=qtest -S -qmp stdio
> >>
> >> {"QMP": {"version": {"qemu": {"micro": 50, "minor": 12, "major": 2},
> >>  "package": "build-all"}, "capabilities": []}}
> >> {"return": {}}
> >> {"error": {"class": "GenericError", "desc": "Device 'bcm2837' can not be
> >>  hotplugged on this machine"}}
> >> Segmentation fault (core dumped)
> >>
> >> The qdev_set_parent_bus() from instance_init adds a link to the child devices
> >> which is not valid anymore after the bcm2837 instance has been destroyed.
> >> Unfortunately, the child devices do not get destroyed / unlinked correctly
> >> because both object_initialize() and object_property_add_child() increase
> >> the reference count of the child objects by one, but only one reference
> >> is dropped when the parent gets removed. So let's use the new functions
> >> object_initialize_child() and sysbus_init_child_obj() instead to create
> >> the objects, which will take care of creating the child objects with the
> >> correct reference count of one.
> >>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> > 
> > Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> > 
> > The usage of &error_abort in code that can be triggered from
> > device-list-properties still makes me nervous, but that's a
> > separate issue.
> 
> I first had similar thoughts, but I think it's a clear coding issue if
> the abort triggers here (and not something that the user should normally
> be able to trigger somehow), so error_abort should be ok in this case.

Agreed.  We don't really have an option, as instance_init can't
report errors.

-- 
Eduardo
