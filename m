Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1597211wrq;
        Thu, 12 Jul 2018 10:02:24 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc+TVQmLnY5Hy9AHnWgGX1JPIMs2Wa1SGGDIjH4NyGM9gmepZVz53PuNbrwFJg53tV8OqKV
X-Received: by 2002:aed:24e7:: with SMTP id u36-v6mr2690258qtc.58.1531414944382;
        Thu, 12 Jul 2018 10:02:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531414944; cv=none;
        d=google.com; s=arc-20160816;
        b=ll2Dpw0FDjfl//NfuMsUcBqjoOT+YQlHufB7O7TKiKvRoHvk6yW8moJ1VDUItyMekf
         w6rFufp27JzAljIDMQIxwSfbhVieDLu9WEnJ2Cs8cYVWGNDRQrRDl77dX0Gws0010eBf
         VZGVPE8strynns/5gxpY1kwdjLHybXQ6nkIQRGZF3ZH2taWfRbGWUGzRK6wZjRV+iC6c
         z/s+NKf1ItPJ9yvzvkbjotrYdSZWHJA5YsqTcXaVzrGOFyonTH0R+d/NJG6KtBqAzzuE
         i/euHYFlymoA7h75zjbeTQWKdNocaSyyXKkGC4/TBsgzAruQuE5ngUjOiZc9It8obzJZ
         Rj0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=BJSTscP6sALqFQw3ywBFDfVo49CqaFQWEmJpF/l37+E=;
        b=U6mRUvyASRnIcCgHW1X+VmSpbp5dPC6ks+s05TzEwFwOvTKTeOiZsIr9JwQLwK+E5X
         B7+AoRGxcWyGOREb9QvXA8mp8+t6GO21oMUDFHx/29el+ZZtbn0l6uTWNZwrjWos9I5Z
         DRzkm6UEeneJZyDuVLGZhVDapuSClX+cHrj7UipWfNwzjViRMuadmwBHP3SrZtfo9icN
         Xo1m89ypJsDH0Ltip4sEGxQKQmbWaVzOpAmU16LRVly5xz6L1PLB+41n9g+L1X5r/bAk
         sEWlryfijAck6DU8fBBGGgxfxChKZb3ruxlE25JLiYqGMWP6ltTCP9XuhBDFwXGC/k29
         VemA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b17-v6si2494089qvk.127.2018.07.12.10.02.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 10:02:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33166 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdez1-0003qh-Sj
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 13:02:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fdeyq-0003o3-IY
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 13:02:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fdeym-0007x0-C6
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 13:02:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37954)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fdeym-0007w9-2j; Thu, 12 Jul 2018 13:02:08 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2536F3150081;
	Thu, 12 Jul 2018 17:02:07 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 601CF194AD;
	Thu, 12 Jul 2018 17:02:06 +0000 (UTC)
Date: Thu, 12 Jul 2018 14:02:04 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180712170204.GE31657@localhost.localdomain>
References: <1531409463-3843-1-git-send-email-thuth@redhat.com>
	<1531409463-3843-2-git-send-email-thuth@redhat.com>
	<20180712165224.GD31657@localhost.localdomain>
	<224a0bbb-9dbb-87eb-9e9b-1c82923010b5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <224a0bbb-9dbb-87eb-9e9b-1c82923010b5@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 12 Jul 2018 17:02:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 1/5] qom/object: Add a new function
 object_initialize_as_child()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mx6majhJeEKi

On Thu, Jul 12, 2018 at 06:55:20PM +0200, Thomas Huth wrote:
> On 12.07.2018 18:52, Eduardo Habkost wrote:
> > On Thu, Jul 12, 2018 at 05:30:59PM +0200, Thomas Huth wrote:
> >> A lot of code is using the object_initialize() function followed by a call to
> >> object_property_add_child() to add the newly initialized object as a child of
> >> the current object. Both functions increase the reference counter of the new
> >> object, but many spots that call these two functions then forget to drop one
> >> of the superfluous references. So the newly created object is often not cleaned
> >> up correctly when the parent is destroyed. In the worst case, this can cause
> >> crashes, e.g. because device objects are not correctly removed from their
> >> parent_bus.
> >> Since this is a common pattern between many code spots, let's introdcue a
> >> new function that takes care of calling all three required initialization
> >> functions, first object_initialize(), then object_property_add_child() and
> >> finally object_unref().
> >>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >> ---
> >>  include/qom/object.h | 19 +++++++++++++++++++
> >>  qom/object.c         | 14 ++++++++++++++
> >>  2 files changed, 33 insertions(+)
> >>
> >> diff --git a/include/qom/object.h b/include/qom/object.h
> >> index f3d2308..c1b254c 100644
> >> --- a/include/qom/object.h
> >> +++ b/include/qom/object.h
> >> @@ -749,6 +749,25 @@ int object_set_propv(Object *obj,
> >>  void object_initialize(void *obj, size_t size, const char *typename);
> >>  
> >>  /**
> >> + * object_initialize_as_child:
> >> + * @parentobj: The parent object to add a property to
> >> + * @propname: The name of the property
> >> + * @childobj: A pointer to the memory to be used for the object.
> >> + * @size: The maximum size available at @obj for the object.
> >> + * @type: The name of the type of the object to instantiate.
> >> + * @errp: If an error occurs, a pointer to an area to store the area
> >> + *
> >> + * This function will initialize an object. The memory for the object should
> >> + * have already been allocated. The object will then be added as child property
> >> + * to a parent with object_property_add_child() function. The returned object
> >> + * has a reference count of 1, and will be finalized when the last reference is
> >> + * dropped.
> >> + */
> >> +void object_initialize_as_child(Object *parentobj, const char *propname,
> >> +                                void *childobj, size_t size, const char *type,
> >> +                                Error **errp);
> > 
> > Why did you use void* instead of Object*?
> 
> That's the same what object_initialize() is doing (see above). Otherwise
> all the callers have to cast their pointers with OBJECT() first.

Why wouldn't the same argument apply to every single function
that takes Object* as argument?  Why the OBJECT macro exists?

-- 
Eduardo
