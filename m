Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1655776wrq;
        Thu, 12 Jul 2018 11:04:35 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfyKTkTtLMIWWwsm2WUlj9AaueL/iyasjjUoKuAwyVSQAPsfW1PwlLjf0avipPEAkQDX9g0
X-Received: by 2002:ac8:1090:: with SMTP id a16-v6mr2834517qtj.307.1531418675712;
        Thu, 12 Jul 2018 11:04:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531418675; cv=none;
        d=google.com; s=arc-20160816;
        b=cXOhaV+0J85xYcdNe6oTqscXeliKc+nbcSNzRy3p0J6LNF26Lb3GzyowkKIrjVGDXr
         J8CyVxiI1s6LWvkT5ke8n43b0RvimtWcHs8sodmXe1Bz5ynhBAoqD5scE4Ji9IVipyZS
         OZpHE/S9ARV+6D/x7Xw7n2X9Oh+ptjt4sXpaHf9BslnZmaFBbJ+ukxBqKkQgW4LLO4tY
         mzgJtoB2b+F2O31pfORsa7lOBi+2V8W6o3pg8EEKLZ6tfU+UiggyiDOGuKOgqPbWIAd3
         wZvON45tn24F+hmcEMsJWcEM2Dp8Li3ThTfURbUChJ2RBltUJzvkTEpRkJFSvYJnM1uC
         2LmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=T1SHmEwK8+swty0smrrQwwe76Eq3626tZ5njEUScXxk=;
        b=uNqUl8Ev+yOUhmuUqm1yggtW00Epys6wrmhb0UcsgAMtBiLuqJGvv8ng4Va7iaI3V9
         SIFsqeydSZ1saEY5bVsryvbrWRelBMJo3E/NDEgIoR94qZTTuLq5cQFPi6ylSbDcSZfN
         3AfInX8qRRRtuiySpoDfmgVK4WZ/pzMUw3corNRvipoS6pHWdAtlxdxvwnvlEYObNOFc
         6OvmAPOvsxq/m74UyMy9SKWFCc8NJfJtZIoCwViPhj4jk+NNq+hBNwmUPuWBmLb4a9pm
         j8AW936Vx3tqSl5VRZjmcOvPbLH7JKt/S994/Xod7zKdkF9ajxu6iPTXmkuYlcif7xkz
         hTMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p84-v6si6381206qkp.268.2018.07.12.11.04.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 11:04:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33402 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdfxD-0006XR-8c
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 14:04:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55328)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fdfx5-0006Wf-1g
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 14:04:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fdfx1-0001By-T8
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 14:04:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54432)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fdfx1-0001Bg-Lp; Thu, 12 Jul 2018 14:04:23 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA35B5F73B;
	Thu, 12 Jul 2018 18:04:22 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E99B600D1;
	Thu, 12 Jul 2018 18:04:21 +0000 (UTC)
Date: Thu, 12 Jul 2018 15:04:20 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20180712180420.GH31657@localhost.localdomain>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
	<ca91bffe-2bcf-78a2-02cd-8ae7cc48074c@redhat.com>
	<20180711183031.GM914@localhost.localdomain>
	<ce0b8bf9-b0e6-fe02-c685-5a6c3140a3ae@redhat.com>
	<20180711202351.GA31657@localhost.localdomain>
	<00130bb8-4dfc-3a76-3f51-9f4c6da891c0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00130bb8-4dfc-3a76-3f51-9f4c6da891c0@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 12 Jul 2018 18:04:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/bcm283x: Fix crash with
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LH4kiHRfuv/a

On Thu, Jul 12, 2018 at 10:05:46AM +0200, Paolo Bonzini wrote:
> On 11/07/2018 22:23, Eduardo Habkost wrote:
> > On Wed, Jul 11, 2018 at 10:16:42PM +0200, Paolo Bonzini wrote:
> >> On 11/07/2018 20:30, Eduardo Habkost wrote:
> >>>> The theoretical behavior should be:
> >>> It's not clear below where you expect
> >>>   qdev_set_parent_bus(..., sysbus_get_default())
> >>> to be called (if it should be called at all).
> >>>
> >>> I don't know where it should be called, but I'm absolutely sure
> >>> instance_init is not the right place.
> >>
> >> I think instance_init is fine to call qdev_set_parent_bus on contained
> >> devices.  Why do you say it's not?
> > 
> > Because object_unref(object_new(...)) is not supposed to affect
> > QEMU global state at all.
> 
> It should not affect it.  Any changes to the global state done by
> instance_init are immediately undone when object_unref destroys the
> child properties of the object.

I would prefer if it didn't, but not a big deal as long as all
QOM code is protected by the BQL (it is, right?).

If we get rid of object_new() in qmp_device_list_properties(),
then most of the restrictions on instance_init can go away,
anyway.

-- 
Eduardo
