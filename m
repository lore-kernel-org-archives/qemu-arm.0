Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp514787wrq;
        Wed, 11 Jul 2018 11:30:47 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpepfiUL3PBZOuf7sdLaZQm43TLBuDWwNMcH9/VZIYZUy5MwxwbQ2x1d21/n6LHsB2qCVk45
X-Received: by 2002:a0c:aa06:: with SMTP id d6-v6mr457426qvb.26.1531333847498;
        Wed, 11 Jul 2018 11:30:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531333847; cv=none;
        d=google.com; s=arc-20160816;
        b=D4MaRjUNPMwQIhdgf1nIRBDaH++yg1rvVYuFayWnLWFsvmu6TURMHY6LNqzEL+fYqH
         RN3A+mi654KiMqai+aGo+/VuAOI1Q4I1SXjZEpkR4mApUrrnRYYYefdAHxILlMPwYQSE
         36IkGcAN6oDZzxJ8OoMSdrt8E2RHqDFPY76xQErbxADQrJM3wveKMmbiH5IconJYm39i
         3yN70VzSpcClbv6UqOX6BLroRcZVKz4VK423OAhL15/QY3ESnn3Zqr0zw/10w7LW+X7T
         vqk49qy2E/9Ka1TrmVamGVbLTXzJVKAfdcnI+KCdBsudk4k6CpzBik7rnx/bMiMthaFp
         jp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=/fn0tj7kMfLa6Qv3WCdiCJ4dFLqRULwS7i81nlR8cXY=;
        b=La3ALnr/JLIwL3wd9OjFgiKqaUdlAVKwVx2LELy3oUfrVEVMfM0ffNT3yyhuQBkldT
         mpBWj4sd7PmhcgGbvJrQsN+ZmFU1sn8Oc3opaJF4iTMXRDHHn+37NQahNQpLcJPgjHAe
         J9OTgQF9aDaDWPQC/tDW7BOqzgHZNeJ30HCrV3Gd30xG7hj4zJqsQRHRi101PF9ydIVm
         CK38ng4Uuj7zzKUWgDMz6771VjDhof5Qh5Y+XKixKZH0RhZFJ9B+vHY9GWoCR7dJyXo6
         ly8woDrG4pqLRvaAnsRQr1mvImFv3zocd1lg0+InP8V6obytDuJLducq+Qs3n+WLOIJ3
         otwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a46-v6si6771227qtc.290.2018.07.11.11.30.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Jul 2018 11:30:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55033 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdJt1-0008Gb-0V
	for alex.bennee@linaro.org; Wed, 11 Jul 2018 14:30:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fdJss-0008GW-Rd
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 14:30:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fdJsp-0003jb-PD
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 14:30:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40494)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fdJsp-0003jB-JA; Wed, 11 Jul 2018 14:30:35 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 20C08300174C;
	Wed, 11 Jul 2018 18:30:34 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A280A19485;
	Wed, 11 Jul 2018 18:30:33 +0000 (UTC)
Date: Wed, 11 Jul 2018 15:30:31 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20180711183031.GM914@localhost.localdomain>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
	<ca91bffe-2bcf-78a2-02cd-8ae7cc48074c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca91bffe-2bcf-78a2-02cd-8ae7cc48074c@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Wed, 11 Jul 2018 18:30:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw/arm/bcm283x: Fix crash with device_add
 bcm2837 on unsupported machines
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
X-TUID: 3UCC8tJVogGj

On Wed, Jul 11, 2018 at 07:20:42PM +0200, Paolo Bonzini wrote:
> On 09/07/2018 23:03, Thomas Huth wrote:
> > 
> > The problem is that qdev_set_parent_bus() from instance_init adds a link
> > to the child devices which is not valid anymore after the device init
> > failed. Thus the qdev_set_parent_bus() must rather be done in the realize
> > function instead.
> 
> The theoretical behavior should be:

It's not clear below where you expect
  qdev_set_parent_bus(..., sysbus_get_default())
to be called (if it should be called at all).

I don't know where it should be called, but I'm absolutely sure
instance_init is not the right place.

> 
> - realize fails
> 
> - object_unparent is called on the device that failed to realize (see
> qdev_device_add).  object_unparent calls device_unparent
> 
> - after device_unparent finishes, the last reference to the device has
> been dropped and the device is freed
> 
> - object finalization releases all properties
> 
> - this includes child properties, so for each child device
> object_unparent is called
> 
> - again device_unparent is called (for the child) and this removes the
> child from the bus.
> 
> Paolo

-- 
Eduardo
