Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1190228wru;
        Mon, 16 Jul 2018 00:09:31 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcmODbCIcqBbZhWYMIgk4e5pLy4829VdDVE3JNJVThxNRQ5xijGp8O+uSV09rknI/GCeTRx
X-Received: by 2002:a0c:aa46:: with SMTP id e6-v6mr16925980qvb.50.1531724970964;
        Mon, 16 Jul 2018 00:09:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531724970; cv=none;
        d=google.com; s=arc-20160816;
        b=BtfaO3FGTNNrfvn8N+Za314F3/kHWyFh4OpS0Iaup1qX+61mWnq7jMObF8rPP7iwZP
         oKNhgXH0aVve3ytFSoZJqXlhCqM7dFhdar9k6QoiOYYKYaq9hI30pm7lrFbvUKvLTFXY
         kgXtXI21VvkJWyPCjUHD1ntubF6CT+l4BryIq1XiIx6lruogbUjf1co3IedZglevel9g
         AMOlhK/3jbw+J/lkQ6pi0AbbY2C1OSZTyz3f6gvn5OzCiMFyxHK+8A45BZc89Cytwp3X
         6Zp+YSwLHOFUL/Lzsqq4XhjHj9yykg8dbo5NHRAD0zdt+EXJEg80Gty6ZgSuJbsD5qwT
         POqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=5SprwDmVgFPXlvA2AgOygbRroOdRrfPpEUdkbuHW6uQ=;
        b=OiDz7MgP8GmI8JqpiarRg/EGq6oep7JVteKj6LEOzImwzscxzSAe4VvNQW+5qjB0no
         twjztbl5eb4YZ3YUTr8jPN0j2D/l6kPWuRUNEJtnM41pRQNF5W6bTegWLqdSPicLhOgV
         HqjagSVz5VOHrE8FVun+Q/I6sjI/B8yfvQTETPFxSHfc2hAtkthbAaZ2zdVZC+yG/0Wy
         iKa/v8nE5Qhi6QvSUDLk27HgXExyn1zcl2RjwNWlkMcAJiDCIb2ZV9W9Tbxj1/RKjKMd
         F25nlYKAu1KMvB8kN8pZRHVQ5KEc8LUAeqzKyAwpRDBWFWA08sOkUcAYSSl+FQSBKrrw
         ikFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m129-v6si8033933qkd.87.2018.07.16.00.09.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 00:09:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49178 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fexdS-0002ue-F9
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 03:09:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fexdJ-0002uN-Ie
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 03:09:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fexdE-0005yF-J0
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 03:09:21 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51328 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fexdE-0005y8-CV; Mon, 16 Jul 2018 03:09:16 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 073F568800;
	Mon, 16 Jul 2018 07:09:16 +0000 (UTC)
Received: from [10.33.200.180] (dhcp-200-180.str.redhat.com [10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5782C111AF00;
	Mon, 16 Jul 2018 07:09:14 +0000 (UTC)
To: Eduardo Habkost <ehabkost@redhat.com>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
	<1531470464-21522-4-git-send-email-thuth@redhat.com>
	<20180713212613.GU31657@localhost.localdomain>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <b4d13b88-e758-2fde-d290-0fdd00b524b2@redhat.com>
Date: Mon, 16 Jul 2018 09:09:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180713212613.GU31657@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 16 Jul 2018 07:09:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 16 Jul 2018 07:09:16 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
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
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vzW2fRUu8LMw

On 13.07.2018 23:26, Eduardo Habkost wrote:
> On Fri, Jul 13, 2018 at 10:27:31AM +0200, Thomas Huth wrote:
>> When trying to "device_add bcm2837" on a machine that is not suitable for
>> this device, you can quickly crash QEMU afterwards, e.g. with "info qtree":
>>
>> echo "{'execute':'qmp_capabilities'} {'execute':'device_add', " \
>>  "'arguments':{'driver':'bcm2837'}} {'execute': 'human-monitor-command', " \
>>  "'arguments': {'command-line': 'info qtree'}}" | \
>>  aarch64-softmmu/qemu-system-aarch64 -M integratorcp,accel=qtest -S -qmp stdio
>>
>> {"QMP": {"version": {"qemu": {"micro": 50, "minor": 12, "major": 2},
>>  "package": "build-all"}, "capabilities": []}}
>> {"return": {}}
>> {"error": {"class": "GenericError", "desc": "Device 'bcm2837' can not be
>>  hotplugged on this machine"}}
>> Segmentation fault (core dumped)
>>
>> The qdev_set_parent_bus() from instance_init adds a link to the child devices
>> which is not valid anymore after the bcm2837 instance has been destroyed.
>> Unfortunately, the child devices do not get destroyed / unlinked correctly
>> because both object_initialize() and object_property_add_child() increase
>> the reference count of the child objects by one, but only one reference
>> is dropped when the parent gets removed. So let's use the new functions
>> object_initialize_child() and sysbus_init_child_obj() instead to create
>> the objects, which will take care of creating the child objects with the
>> correct reference count of one.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> 
> The usage of &error_abort in code that can be triggered from
> device-list-properties still makes me nervous, but that's a
> separate issue.

I first had similar thoughts, but I think it's a clear coding issue if
the abort triggers here (and not something that the user should normally
be able to trigger somehow), so error_abort should be ok in this case.

 Thomas
