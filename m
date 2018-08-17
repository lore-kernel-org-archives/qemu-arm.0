Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp109527wru;
        Thu, 16 Aug 2018 18:40:49 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwY3CUgF2y8DPs0y364RdiMQOs27Qpo3qD7if7AjG6yXazZPJBJ6US75Czlq8MNJ9JzXr9B
X-Received: by 2002:aed:2457:: with SMTP id s23-v6mr32209939qtc.366.1534470049483;
        Thu, 16 Aug 2018 18:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534470049; cv=none;
        d=google.com; s=arc-20160816;
        b=UAoFP8jepm9aust1e241nzIOEJmYaKXg/xQa3rUAb7pSU+SeDIZvx/QmnTe5uLX9Lg
         e+90K5UzuZdFK9IXW9+QxkjL6YTZ0YvwW2AyzCL6zPHZrfUB3jsmV5lfBGb2PuQV+Is6
         mUXAm3ouTu22+SDURVxH9KY2l574DkwD7SavlzxFFtB3hn0DuWdRWcs7Wec8VDLK3bdx
         17TYoDzPr2fEkA7jTN1K/1WZUhXjM9300bXa9WMe9lHLpzupKalJj2W0D253Rw5VUXtq
         Hkj6W/Gi41w08pJm6cJJ7hGn07AgPOJLzdRDTm/RB5Lou0AnAUsrRgEewYPRZLbkyMEC
         svPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=PmekywTTJu2YZQf4MFi2U7kKJvGKgO0T7oGhM3DWQ+A=;
        b=X17pmtQS2WZ2rnuT1XcinXfzttJLQQnNdH/5tYbg8MnwkcvP5vPEuM6l7+SBHX0uDX
         Kw5tt0ZXFMaDHlLn1RhXD4purN+h2H6Fuh1nsiMMTnanPw33/fjaJTPXD7iLU8KQ38Sp
         J/SRJvECTGtNwXq2Xejr5Ei5NKd1x4svSVH0Qc9D8winO7FnB7UBq1fdbLJfNNceeBCa
         J4J9oC3UeYRAseWM0FAT8+WimOF4lT3zHtGAWCkKENj3KHJZ47UwRvrtYsjNkErc2CI3
         36aCGfGLf4O6XCuKu5yxOVdFZf22a63TwFF9jcXdClFqEfp68rIBTL+Wgpx5iKO6lZga
         bO/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f132-v6si801236qkb.43.2018.08.16.18.40.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 18:40:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59026 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqTku-0005fB-P4
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 21:40:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fqTkj-0005cR-Vt
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 21:40:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fqTkh-0002AX-GM
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 21:40:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58510)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fqTkf-00027W-6F; Thu, 16 Aug 2018 21:40:33 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E379C5F7A9;
	Fri, 17 Aug 2018 01:40:31 +0000 (UTC)
Received: from localhost (ovpn-116-57.gru2.redhat.com [10.97.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D29927BDA;
	Fri, 17 Aug 2018 01:40:30 +0000 (UTC)
Date: Thu, 16 Aug 2018 22:40:29 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180817014029.GV15372@localhost.localdomain>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
	<1531470464-21522-2-git-send-email-thuth@redhat.com>
	<20180713225718.GP914@localhost.localdomain>
	<4551aa70-343e-1362-cfd3-d567c476d6fe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4551aa70-343e-1362-cfd3-d567c476d6fe@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 17 Aug 2018 01:40:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 01/16] qom/object: Add a new
 function object_initialize_child()
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
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b4YlBZl0AqR8

On Thu, Aug 16, 2018 at 01:59:49PM +0200, Thomas Huth wrote:
> On 07/14/2018 12:57 AM, Eduardo Habkost wrote:
> > On Fri, Jul 13, 2018 at 10:27:29AM +0200, Thomas Huth wrote:
> >> A lot of code is using the object_initialize() function followed by a call
> >> to object_property_add_child() to add the newly initialized object as a child
> >> of the current object. Both functions increase the reference counter of the
> >> new object, but many spots that call these two functions then forget to drop
> >> one of the superfluous references. So the newly created object is often not
> >> cleaned up correctly when the parent is destroyed. In the worst case, this
> >> can cause crashes, e.g. because device objects are not correctly removed from
> >> their parent_bus.
> >>
> >> Since this is a common pattern between many code spots, let's introdcue a
> >> new function that takes care of calling all three required initialization
> >> functions, first object_initialize(), then object_property_add_child() and
> >> finally object_unref().
> >>
> >> And while we're at object.h, also fix some copy-n-paste errors in the
> >> comments there ("to store the area" --> "to store the error").
> >>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> > 
> > Potential candidates for using the new function, found using the
> > following Coccinelle patch:
> > 
> > @@
> > expression child, size, type, parent, errp, propname;
> > @@
> > -object_initialize(child, size, type);
> > -object_property_add_child(
> > +object_initialize_child(
> >                            parent, propname, 
> > -                          OBJECT(child),
> > +                          child, size, type,
> >                            errp);
> > 
> > Some of them (very few) already call object_unref() and need to
> > be fixed manually.
> > 
> > Most of the remaining ~50 object_initialize() callers are also
> > candidates, even if they don't call object_property_add_child()
> > today.
> > 
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> 
> Care to turn this into a proper patch, now that we left the freeze period?

It's possible, but we need a volunteer to review each hunk
because the existing code might be (correctly) calling
object_unref() (either immediately or when parent is finalized).

I will keep this in my TODO list, but it's not my top priority
right now.

-- 
Eduardo
