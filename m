Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1567077wru;
        Mon, 16 Jul 2018 07:25:52 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpePec+X+c/v2XIpUEBMKbv5D49ylLdcWULtaCq21nwX8Vw1oYIOFTiMq+675oJaw4E2meQB
X-Received: by 2002:a37:26d2:: with SMTP id m79-v6mr14362279qkm.212.1531751152752;
        Mon, 16 Jul 2018 07:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531751152; cv=none;
        d=google.com; s=arc-20160816;
        b=USbhcucR4Y/pM5msAHN1v7HUcTm2he96LLETmsPYESoxXr215aht+8gzw59WRYyp94
         IErgC6OAhKOP/vjjsXU5B78fl3fn47MUqCPmPZzyATkikK4w+RRN81TbOmTp0UeTNhjy
         kbvOD0tQIUvFepGiVFbZkbDqw6VkqymeDI1epHykr5FH4ttb1qRVc6lkHEG3gBZtKJG+
         wMMRaf9yjdt/3Rk89RfyHTcUevgejqjHAm8nxqYTb69cHA8xi3AJW9aQXdWFthtI/vP1
         wQP/Xk+ljQJP/nsHIn4HKnPw+j3FB84lUOYu+Kc+Qgc0lVOi2TM7UBt09OdgsHP6m5xt
         Ngfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=M3m8/oh1KSEwrcZohoSBOt8ob4iNnRNjtGwulSGOjdY=;
        b=lxA5MUsMsms4hAoz76mCHsnasW716ePRE34fXZ2kBwt3enWg3Qm+jvaltR+k1hSrmF
         ZZEpRTYwchKtZG2W/Sq63wcBLcHuXVqvI0zhqojbqzsYZZHO8eTUA9cPHQfcdlGa9PBt
         aAIMU5bnSjwJ4kSXUtDJWUz9aoVYVwMxe0gV7IMvZUA7etG0FHB2QREVIyHdWLRBNtPx
         2XMRQI8EaoTQKwqtuMnLnfeip3+ruQsVQKm8IFSRogcywFPOjELd6WSBPdaagJDjDSQH
         WwqzZ57D1Kila7lHNfomX8ISJGAZ0cCrYjm2RVqwZCMzP3g7bMzY7hk00AzbgL6WRkZD
         JKvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h187-v6si1939320qkd.334.2018.07.16.07.25.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 07:25:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52139 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff4Rk-0005s6-8z
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 10:25:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ff4RY-0005qU-KH
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 10:25:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ff4RT-0000kO-M7
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 10:25:40 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53488 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1ff4RT-0000je-HJ; Mon, 16 Jul 2018 10:25:35 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 86CD78182D0C;
	Mon, 16 Jul 2018 14:25:34 +0000 (UTC)
Received: from localhost (ovpn-120-37.rdu2.redhat.com [10.10.120.37])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 246832026D65;
	Mon, 16 Jul 2018 14:25:33 +0000 (UTC)
Date: Mon, 16 Jul 2018 11:25:32 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20180716142532.GH31657@localhost.localdomain>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
	<ca91bffe-2bcf-78a2-02cd-8ae7cc48074c@redhat.com>
	<20180711183031.GM914@localhost.localdomain>
	<ce0b8bf9-b0e6-fe02-c685-5a6c3140a3ae@redhat.com>
	<20180711202351.GA31657@localhost.localdomain>
	<00130bb8-4dfc-3a76-3f51-9f4c6da891c0@redhat.com>
	<20180712180420.GH31657@localhost.localdomain>
	<87efg3istv.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87efg3istv.fsf@dusky.pond.sub.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 16 Jul 2018 14:25:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 16 Jul 2018 14:25:34 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'ehabkost@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BZvjav6fKimk

On Mon, Jul 16, 2018 at 08:43:24AM +0200, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Thu, Jul 12, 2018 at 10:05:46AM +0200, Paolo Bonzini wrote:
> >> On 11/07/2018 22:23, Eduardo Habkost wrote:
> >> > On Wed, Jul 11, 2018 at 10:16:42PM +0200, Paolo Bonzini wrote:
> >> >> On 11/07/2018 20:30, Eduardo Habkost wrote:
> >> >>>> The theoretical behavior should be:
> >> >>> It's not clear below where you expect
> >> >>>   qdev_set_parent_bus(..., sysbus_get_default())
> >> >>> to be called (if it should be called at all).
> >> >>>
> >> >>> I don't know where it should be called, but I'm absolutely sure
> >> >>> instance_init is not the right place.
> >> >>
> >> >> I think instance_init is fine to call qdev_set_parent_bus on contained
> >> >> devices.  Why do you say it's not?
> >> > 
> >> > Because object_unref(object_new(...)) is not supposed to affect
> >> > QEMU global state at all.
> >> 
> >> It should not affect it.  Any changes to the global state done by
> >> instance_init are immediately undone when object_unref destroys the
> >> child properties of the object.
> >
> > I would prefer if it didn't, but not a big deal as long as all
> > QOM code is protected by the BQL (it is, right?).
> >
> > If we get rid of object_new() in qmp_device_list_properties(),
> > then most of the restrictions on instance_init can go away,
> > anyway.
> 
> How could we get rid of object_new()?  As long as we create properties
> in code, we need to run the code to find the properties.

By stopping registering properties at instance_init, and making
them introspectable at the class object.

-- 
Eduardo
